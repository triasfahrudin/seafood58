unit uFrmMasterBumbuDapur;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sButton, ExtCtrls, sPanel, Menus, NxColumnClasses,
  NxColumns, NxScrollControl, NxCustomGridControl, NxCustomGrid, NxGrid;

type
  TFrmMasterBumbuDapur = class(TForm)
    grid: TNextGrid;
    NxNumberColumn3: TNxNumberColumn;
    NxIncrementColumn1: TNxIncrementColumn;
    nama: TNxTextColumn;
    satuanPdLap: TNxComboBoxColumn;
    MainMenu1: TMainMenu;
    Delete1: TMenuItem;
    sPanel1: TsPanel;
    btnKeluar: TsButton;
    barcode: TNxTextColumn;
    procedure gridInputAdded(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Delete1Click(Sender: TObject);
    procedure gridInputAccept(Sender: TObject; var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure gridAfterEdit(Sender: TObject; ACol, ARow: Integer;
      Value: WideString);
    procedure gridBeforeEdit(Sender: TObject; ACol, ARow: Integer;
      var Accept: Boolean);
    procedure btnKeluarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sOldNama: string;
    sOldBarcode: string;
    bEdited: boolean;
    procedure LoadAllData;
  end;

var
  FrmMasterBumbuDapur: TFrmMasterBumbuDapur;

implementation

uses uDM, uLibrary;

{$R *.dfm}

{ TFrmMasterBumbuDapur }

procedure TFrmMasterBumbuDapur.LoadAllData;
begin
  dm.ExecSQL(
    'select a.id,'#13 +
    '       a.nama as nama_menu,'#13 +
    '		    a.barcode as barcode,'#13 +
    '       b.nama as nama_satuan_laporan'#13 +
    'from data_subjenismenu a'#13 +
    'left join data_satuan b'#13 +
    'on a.id_satuan_laporan = b.id'#13 +
    'where a.is_NonMenu = 1', [], dm.mySQLQuery1);
  grid.ClearRows;
  dm.mySQLQuery1.First;
  while not dm.mySQLQuery1.Eof do
  begin
    with grid, dm.mySQLQuery1 do
    begin
      AddRow(1);
      Cell[1, grid.RowCount - 1].AsInteger := Fields[0].AsInteger; //id
      Cell[2, grid.RowCount - 1].AsString := Fields[1].AsString; //nama
      Cell[3, grid.RowCount - 1].AsString := Fields[2].AsString; //barcode
      //satuan pada laporan
      Cell[4, grid.RowCount - 1].AsString := Fields[3].AsString;
    end;
    dm.mySQLQuery1.Next;
  end;
end;

procedure TFrmMasterBumbuDapur.gridInputAdded(Sender: TObject);
begin
  grid.ClearRows;
  LoadAllData;
end;

procedure TFrmMasterBumbuDapur.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmMasterBumbuDapur.Delete1Click(Sender: TObject);
begin
  //
  if bEdited then
    Exit;
  if grid.SelectedCount = 0 then
    Exit;
  {data_pengeluaran.id_subjenismenu,
  data_perubahan_stok.di_subjenismenu}

  dm.ExecSQL(
    'select count(id)'#13 +
    'from data_pengeluaran'#13 +
    'where id_subjenismenu = %d',
    [grid.Cell[1, Grid.SelectedRow].AsInteger],
    dm.mySQLQuery1);
  if dm.mySQLQuery1.Fields[0].AsInteger > 0 then
  begin
    MessageDlg(
      'Item ini sudah pernah dibeli,'#13 +
      'sehingga tidak diperbolehkan untuk dihapus', mtWarning, [mbOK], 0);
    Exit;
  end;
  //
  //  dm.ExecSQL(
  //  'select count(id)'#13 +
  //  'from data_perubahan_stok'#13 +
  //  'where ')

    {****************************************************************************}
  if not DM.bIsSinuhun then
  begin
    if isAllowPriv(MASTERNONMENU_DELETE) = 'N' then
      ShowAuthorization(MASTERNONMENU_DELETE);
    if isAllowPriv(MASTERNONMENU_DELETE) = 'N' then
      Exit;
  end;
  {****************************************************************************}

  if MessageDlg(
    'Apakah anda yakin ingin menghapus data ini ?'#13 +
    'Menu :' + grid.Cell[2, grid.SelectedRow].AsString,
    mtConfirmation,
    [mbYes] + [mbCancel], 0) <> mrYes then
  begin
    DeletePriv(MASTERNONMENU_DELETE);
    Exit;
  end;

  dm.ExecSQL('delete from data_subjenismenu where id = %d',
    [grid.Cell[1, grid.SelectedRow].AsInteger], dm.mySQLQuery1);

  {****************************************************************************}
  InsertData_Perubahan(
    'Delete Menu'#13 +
    'Nama Items      :' + grid.Cell[2, Grid.SelectedRow].AsString);

  DeletePriv(MASTERNONMENU_DELETE);
  {****************************************************************************}

  LoadAllData;
end;

procedure TFrmMasterBumbuDapur.gridInputAccept(Sender: TObject;
  var Accept: Boolean);
var
  CurrIdSatuan: integer;
begin
  if (nama.InputValue = EmptyStr) then
  begin
    MessageDlg('Nama tidak boleh kosong', mtWarning, [mbOK], 0);
    Accept := False;
    Exit;
  end;

  if (satuanPdLap.InputValue = EmptyStr) then
  begin
    MessageDlg(
      'Satuan pada laporan dan pada menu tidak boleh kosong', mtWarning,
      [mbOK], 0);
    Accept := False;
    Exit;
  end;

  CurrIdSatuan := GetIdSatuan(satuanPdLap.InputValue);
  if barcode.InputValue = EmptyStr then
    dm.ExecSQL(
      'insert into data_subjenismenu(nama,'#13 +
      '                              id_satuan_laporan,'#13 +
      '                              is_stok,is_NonMenu)'#13 +
      'values("%s",%d,1,1)',
      [nama.InputValue,
      CurrIdSatuan], dm.mySQLQuery1)
  else
    dm.ExecSQL(
      'insert into data_subjenismenu(nama,'#13 +
      '                              id_satuan_laporan,'#13 +
      '                              is_stok,is_NonMenu,isBarcode,barcode)'#13 +
      'values("%s",%d,1,1,1,"%s")',
      [nama.InputValue,
      CurrIdSatuan, barcode.InputValue], dm.mySQLQuery1);

  bEdited := False;
end;

procedure TFrmMasterBumbuDapur.FormCreate(Sender: TObject);
begin
  LoadAllData;
  FillCmbSatuanNameOnly(satuanPdlap);
end;

procedure TFrmMasterBumbuDapur.gridAfterEdit(Sender: TObject; ACol,
  ARow: Integer; Value: WideString);
var
  CurrIdSatuan: integer;
begin
  dm.ExecSQL(
    'select count(id)'#13 +
    'from data_subjenismenu'#13 +
    'where nama = "%s" and'#13 +
    '      is_nonmenu = 1 and'#13 +
    '      id <> %d',
    [grid.Cell[2, ARow].AsString, grid.Cell[1, ARow].AsInteger],
    dm.mySQLQuery1);

  if dm.mySQLQuery1.Fields[0].AsInteger > 0 then
  begin
    MessageDlg('Nama ini telah digunakan oleh item lain', mtWarning, [mbOK], 0);
    grid.Cell[2, ARow].AsString := sOldNama;
    Exit;
  end;

  if (ACol = 2) and (value = EmptyStr) then
  begin
    MessageDlg('Nama tidak boleh kosong', mtError, [mbOK], 0);
    grid.Cell[2, ARow].AsString := sOldNama;
    Exit;
  end;

  case ACol of
    2:
      begin
        dm.ExecSQL(
          'update data_subjenismenu'#13 +
          'set nama = "%s"'#13 +
          'where id = %d',
          [Value,
          grid.Cell[1, ARow].AsInteger],
            dm.mySQLQuery1);
      end;
    3:
      begin
        if value = EmptyStr then
        begin
          dm.ExecSQL(
            'update data_subjenismenu'#13 +
            'set barcode = (null), isBarcode = (null)'#13 +
            'where id = %d',
            [grid.Cell[1, ARow].AsInteger],
            dm.mySQLQuery1);
          Exit;
        end
        else
        begin

          dm.ExecSQL(
            'select count(id)'#13 +
            'from data_subjenismenu'#13 +
            'where isbarcode  = 1 and'#13 +
            '      barcode = "%s" and'#13 +
            '      id <> %d',
            [grid.Cell[3, ARow].AsString,
            grid.Cell[1, ARow].AsInteger],
              dm.mySQLQuery1);

          if dm.mySQLQuery1.Fields[0].AsInteger > 0 then
          begin
            MessageDlg(
              'Barcode ini telah digunakan oleh item lain', mtWarning, [mbOK],
              0);
            grid.Cell[3, ARow].AsString := sOldBarcode;
            Exit;
          end;

          dm.ExecSQL(
            'update data_subjenismenu'#13 +
            'set barcode = "%s",isbarcode = 1'#13 +
            'where id = %d',
            [Value,
            grid.Cell[1, ARow].AsInteger],
              dm.mySQLQuery1);
        end;
      end;
    4:
      begin
        CurrIdSatuan := GetIdSatuan(Value);
        dm.ExecSQL(
          'update data_subjenismenu'#13 +
          'set id_satuan_laporan = %d'#13 +
          'where id = %d',
          [CurrIdSatuan, grid.Cell[1, ARow].AsInteger],
          DM.mySQLQuery1);
      end;
  end;
end;

procedure TFrmMasterBumbuDapur.gridBeforeEdit(Sender: TObject; ACol,
  ARow: Integer; var Accept: Boolean);
begin
  sOldNama := grid.Cell[2, ARow].AsString;
  sOldBarcode := grid.Cell[3, ARow].AsString;
  bEdited := True;
end;

procedure TFrmMasterBumbuDapur.btnKeluarClick(Sender: TObject);
begin
  Close;
end;

end.
