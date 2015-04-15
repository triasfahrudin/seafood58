unit uFrmSatuanKonversi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sButton, NxScrollControl, NxCustomGridControl,
  NxCustomGrid, NxGrid, NxColumnClasses, NxColumns, sLabel, Menus;

type
  TFrmSatuanKonversi = class(TForm)
    grid: TNextGrid;
    btnKeluar: TsButton;
    NxIncrementColumn1: TNxIncrementColumn;
    satuandasar: TNxComboBoxColumn;
    sLabel1: TsLabel;
    satuankonversi: TNxComboBoxColumn;
    NxTextColumn1: TNxTextColumn;
    MainMenu1: TMainMenu;
    delete1: TMenuItem;
    pengali: TNxNumberColumn;
    procedure gridAfterEdit(Sender: TObject; ACol, ARow: Integer;
      Value: WideString);
    procedure gridInputAccept(Sender: TObject; var Accept: Boolean);
    procedure gridInputAdded(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure delete1Click(Sender: TObject);
    procedure btnKeluarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gridBeforeEdit(Sender: TObject; ACol, ARow: Integer;
      var Accept: Boolean);
  private
    function GetIdSatuan(str: string): integer;

  public

    bEdited: boolean;
    procedure FillSatuanDasar;
    procedure FillSatuanKonversi;
    procedure LoadAllKonversiData;
  end;

var
  FrmSatuanKonversi: TFrmSatuanKonversi;

implementation

uses uDM, DB, uLibrary;

{$R *.dfm}

procedure TFrmSatuanKonversi.FillSatuanDasar;
begin
  satuandasar.Items.Clear;
  dm.ExecSQL('select nama from data_satuan', [],
    dm.mySQLQuery1);
  dm.mySQLQuery1.First;
  while not dm.mySQLQuery1.Eof do
  begin
    satuandasar.Items.Add(dm.mySQLQuery1.Fields[0].AsString);
    dm.mySQLQuery1.Next;
  end;
end;

procedure TFrmSatuanKonversi.FillSatuanKonversi;
begin
  satuankonversi.Items.Clear;
  dm.ExecSQL('select nama from data_satuan', [],
    dm.mySQLQuery1);
  dm.mySQLQuery1.First;
  while not dm.mySQLQuery1.Eof do
  begin
    satuankonversi.Items.Add(dm.mySQLQuery1.Fields[0].AsString);
    dm.mySQLQuery1.Next;
  end;
end;

procedure TFrmSatuanKonversi.gridAfterEdit(Sender: TObject; ACol,
  ARow: Integer; Value: WideString);
var
  iIdKonv, iIdDasar: integer;
begin
  case ACol of
    4:
      begin
        dm.ExecSQL('update data_satuankonv set pengali = %d where id = %d',
          [grid.Cell[4, ARow].AsInteger, grid.Cell[0, ARow].AsInteger],
          dm.mySQLQuery1);

        //____ update juga yang otomatis (urutannya dibalik)
        iIdKonv := GetIdSatuan(grid.Cell[2, ARow].AsString);
        iIdDasar := GetIdSatuan(grid.Cell[3, ARow].AsString);
        DecimalSeparator := '.';
        dm.ExecSQL(
          'update data_satuankonv set pengali = "%s"'#13 +
          'where id_konversi = %d and'#13 +
          '      id_dasar = %d',
          [FloatToStr((1 / grid.Cell[4, ARow].AsFloat)),
          iIdDasar,
            iIdKonv], dm.mySQLQuery1);
        DecimalSeparator := ',';
      end;
  end;
  bEdited := false;
end;

function TFrmSatuanKonversi.GetIdSatuan(str: string): integer;
begin
  dm.ExecSQL('select id from data_satuan where nama = "%s"', [str],
    dm.mySQLQuery1);
  dm.mySQLQuery1.First;
  Result := dm.mySQLQuery1.Fields[0].AsInteger;
end;

procedure TFrmSatuanKonversi.gridInputAccept(Sender: TObject;
  var Accept: Boolean);
var
  iIdKonv, iIdDasar: integer;
begin
  if (satuankonversi.InputValue = EmptyStr) or (satuandasar.InputValue =
    EmptyStr) or (StrToInt(pengali.InputValue) = 0) then
  begin
    Accept := False;
    grid.InputSelected := True;
    Exit;
  end;

  if POS(',', pengali.InputValue) > 0 then
  begin
    Accept := False;
    MessageDlg('pengali tidak boleh pecahan!', mtWarning, [mbOK], 0);
    Exit;
  end;

  iIdKonv := GetIdSatuan(satuankonversi.InputValue);
  iIdDasar := GetIdSatuan(satuandasar.InputValue);

  dm.ExecSQL(
    'select count(id)'#13 +
    'from data_satuankonv'#13 +
    'where (id_dasar = %d and'#13 +
    '       id_konversi = %d) or '#13 +
    '      (id_konversi = %d and'#13 +
    '       id_dasar = %d)',
    [iIdDasar, iIdKonv,
    iIdKonv, iIdDasar], dm.mySQLQuery1);
  if dm.mySQLQuery1.Fields[0].AsInteger > 0 then
  begin
    MessageDlg('Kombinasi konversi ini sudah ada!', mtError, [mbOK], 0);
    Accept := False;
    Exit;
  end;

  dm.ExecSQL(
    'insert into data_satuankonv(id_konversi,id_dasar,pengali,isOtomatis)'#13 +
    'values(%d,%d,%d,0)',
    [iIdKonv, iIdDasar, StrToInt(pengali.InputValue)], dm.mySQLQuery1);

  DecimalSeparator := '.';
  //___ otomatis dibalik --so jangan kaget
  dm.ExecSQL(
    'insert into data_satuankonv(id_konversi,id_dasar,pengali,isOtomatis)'#13 +
    'values(%d,%d,"%s",1)',
    [iIdDasar, iIdKonv, floattostr((1 / StrToFloat(pengali.InputValue)))],
    dm.mySQLQuery1);
  ShowMessage(dm.mySQLQuery1.SQL.Text);
  DecimalSeparator := ',';
end;

procedure TFrmSatuanKonversi.gridInputAdded(Sender: TObject);
begin
  grid.ClearRows;
  LoadAllKonversiData;
end;

procedure TFrmSatuanKonversi.FormCreate(Sender: TObject);
begin
  FillSatuanDasar;
  FillSatuanKonversi;
  LoadAllKonversiData;
end;

procedure TFrmSatuanKonversi.LoadAllKonversiData;
begin
  dm.ExecSQL(
    'select a.id,c.nama,b.nama,a.pengali'#13 +
    'from data_satuankonv a'#13 +
    'left join data_satuan b'#13 +
    'on a.id_dasar = b.id'#13 +
    'left join data_satuan c'#13 +
    'on a.id_konversi = c.id'#13 +
    'where (a.isOtomatis <> 1)', [],
    dm.mySQLQuery1);
  grid.ClearRows;
  dm.mySQLQuery1.First;
  while not dm.mySQLQuery1.Eof do
  begin

    with grid, dm.mySQLQuery1 do
    begin
      AddRow(1);
      Cell[0, RowCount - 1].AsInteger := Fields[0].AsInteger;
      Cell[2, RowCount - 1].AsString := Fields[1].AsString;
      Cell[3, RowCount - 1].AsString := Fields[2].AsString;
      Cell[4, RowCount - 1].AsInteger := Fields[3].AsInteger;
    end;
    dm.mySQLQuery1.Next;
  end;
end;

procedure TFrmSatuanKonversi.delete1Click(Sender: TObject);
var
  iIdKonv, iIdDasar: integer;
begin

  if bEdited then
    exit;
  if grid.SelectedCount = 0 then
    Exit;

  if grid.Cell[2, grid.SelectedRow].AsString = grid.Cell[3,
    grid.SelectedRow].AsString then
  begin
    MessageDlg('Item ini tidak boleh dihapus!', mtWarning, [mbOK], 0);
    Exit;
  end;

  {****************************************************************************}
  if not DM.bIsSinuhun then
  begin
    if isAllowPriv(SATUAN_KONVERSI_DELETE) = 'N' then
      ShowAuthorization(SATUAN_KONVERSI_DELETE);
    if isAllowPriv(SATUAN_KONVERSI_DELETE) = 'N' then
      Exit;
  end;
  {****************************************************************************}

  if MessageDlg('Apakah anda yakin ingin menghapus data ini ?',
    mtConfirmation, [mbYes] + [mbCancel], 0) <> mrYes then
  begin
    DeletePriv(SATUAN_KONVERSI_DELETE);
    Exit;
  end;

  //____ delete juga yang otomatis (urutannya dibalik)
  iIdKonv := GetIdSatuan(grid.Cell[2, grid.SelectedRow].AsString);
  iIdDasar := GetIdSatuan(grid.Cell[3, grid.SelectedRow].AsString);

  dm.ExecSQL(
    'delete from data_satuankonv'#13 +
    'where (id_dasar = %d and id_konversi = %d)',
    [iIdKonv, iIdDasar], dm.mySQLQuery1);

  dm.ExecSQL('delete from data_satuankonv where id = %d',
    [grid.Cell[0, grid.SelectedRow].AsInteger], dm.mySQLQuery1);

  {****************************************************************************}
  InsertData_Perubahan('Satuan Konversi'#13 +
    'Satuan Konversi: ' + grid.Cell[2, Grid.SelectedRow].AsString + ''#13 +
    'Satuan Dasar   : ' + grid.Cell[2, Grid.SelectedRow].AsString);
  DeletePriv(SATUAN_KONVERSI_DELETE);
  {****************************************************************************}

  LoadAllKonversiData;
end;

procedure TFrmSatuanKonversi.btnKeluarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmSatuanKonversi.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmSatuanKonversi.gridBeforeEdit(Sender: TObject; ACol,
  ARow: Integer; var Accept: Boolean);
begin
  bEdited := true;
  if grid.Cell[2, ARow].AsString = grid.Cell[3, ARow].AsString then
  begin
    Accept := False;
    bEdited := False;
  end;
end;

end.
