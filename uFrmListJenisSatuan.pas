unit uFrmListJenisSatuan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, NxColumnClasses, StdCtrls, sButton, Menus, NxColumns,
  NxScrollControl, NxCustomGridControl, NxCustomGrid, NxGrid, sLabel;

type
  TFrmListJenisSatuan = class(TForm)
    grid: TNextGrid;
    satuan: TNxTextColumn;
    btnKeluar: TsButton;
    NxTextColumn1: TNxIncrementColumn;
    NxTextColumn3: TNxTextColumn;
    MainMenu1: TMainMenu;
    Delete2: TMenuItem;
    isBase: TNxCheckBoxColumn;
    sLabel1: TsLabel;
    procedure btnKeluarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gridAfterEdit(Sender: TObject; ACol, ARow: Integer;
      Value: WideString);
    procedure FormShow(Sender: TObject);
    procedure gridInputAdded(Sender: TObject);
    procedure Delete2Click(Sender: TObject);
    procedure gridBeforeEdit(Sender: TObject; ACol, ARow: Integer;
      var Accept: Boolean);
    procedure gridInputAccept(Sender: TObject; var Accept: Boolean);
  private

  public

    bEdited: boolean;
    sOldNama: string;
    procedure LoadAllJenisSatuan;
  end;

var
  FrmListJenisSatuan: TFrmListJenisSatuan;

implementation

uses uDM, uLibrary, DB;

{$R *.dfm}

procedure TFrmListJenisSatuan.LoadAllJenisSatuan;
begin

  dm.ExecSQL('select id,nama,isbase from data_satuan', [], dm.mySQLQuery1);
  grid.ClearRows;
  dm.mySQLQuery1.First;
  while not dm.mySQLQuery1.Eof do
  begin
    with grid do
    begin
      AddRow(1);
      Cell[0, grid.RowCount - 1].AsInteger :=
        dm.mySQLQuery1.Fields[0].AsInteger;

      Cell[2, grid.RowCount - 1].AsString :=
        dm.mySQLQuery1.Fields[1].AsString;
      if dm.mySQLQuery1.Fields[2].AsInteger = 1 then
        Cell[3, grid.RowCount - 1].AsBoolean := True
      else
        Cell[3, grid.RowCount - 1].AsBoolean := False;
    end;
    dm.mySQLQuery1.Next;
  end;
end;

procedure TFrmListJenisSatuan.btnKeluarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmListJenisSatuan.FormCreate(Sender: TObject);
begin
  LoadAllJenisSatuan;
end;

procedure TFrmListJenisSatuan.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

//edit nama atau isBase

procedure TFrmListJenisSatuan.gridAfterEdit(Sender: TObject; ACol,
  ARow: Integer; Value: WideString);
var
  ibase: byte;
begin
  case ACol of
    2:
      begin
        if Value <> sOldNama then
        begin
          dm.ExecSQL('select count(id) from data_satuan where nama = "%s" and id <> %d',
            [grid.Cell[2, ARow].AsString, grid.Cell[0, ARow].AsInteger],
            dm.MySQLQuery1);
          dm.mySQLQuery1.First;
          if dm.mySQLQuery1.Fields[0].AsInteger > 0 then
          begin
            MessageDlg('Nama ini sudah terpakai, cari nama lain', mtWarning,
              [mbOK], 0);
            grid.Cell[2, ARow].AsString := sOldNama;
            bEdited := False;
            Exit;
          end;
          dm.ExecSQL('update data_satuan set nama = "%s" where id = %d',
            [grid.Cell[2, ARow].AsString, grid.Cell[0, ARow].AsInteger],
            Dm.MySQLQuery1);
        end;
      end;
    3:
      begin
        if Value = 'True' then
          ibase := 1
        else
          ibase := 0;

        if MessageDlg(
          'Apakah anda ingin merubah tipe satuan ini ?'#13 +
          'Peringatan: perubahan tipe satuan ini akan menghapus '#13 +
          '            data konversi nilai dengan satuan yang terkait',
          mtConfirmation, [mbYes] + [mbNO], 0) <> mrYes then
        begin
          if ibase = 1 then
            grid.Cell[3, ARow].AsBoolean := False
          else
            grid.Cell[3, ARow].AsBoolean := True;
          bEdited := False;
          Exit;
        end;

        dm.ExecSQL(
          'delete from data_satuankonv'#13 +
          'where id_dasar  = %d or'#13 +
          '      id_konversi = %d',
          [grid.Cell[0, ARow].AsInteger, grid.Cell[0, ARow].AsInteger],
          dm.mySQLQuery1);

        // if ibase = 1 then
        dm.ExecSQL(
          'insert into data_satuankonv(id_dasar,id_konversi,pengali)'#13 +
          'values(%d,%d,1)',
          [grid.Cell[0, ARow].AsInteger, grid.Cell[0, ARow].AsInteger],
          dm.mySQLQuery1);

        dm.ExecSQL('update data_satuan set isbase = %d where id = %d',
          [ibase, grid.Cell[0, ARow].AsInteger], dm.mySQLQuery1);

      end;
  end;
  bEdited := False;
end;

procedure TFrmListJenisSatuan.FormShow(Sender: TObject);
begin
  formatbtn(self);
end;

procedure TFrmListJenisSatuan.gridInputAdded(Sender: TObject);
begin
  grid.ClearRows;
  LoadAllJenisSatuan;
end;

//delete======================================================

procedure TFrmListJenisSatuan.Delete2Click(Sender: TObject);
begin
  if bEdited then
    Exit;
  if grid.SelectedCount = 0 then
    Exit;

  dm.ExecSQL('select count(*) from data_menus where id_satuan = %d',
    [grid.Cell[0, Grid.SelectedRow].AsInteger], Dm.mySQLQuery1);

  if DM.mySQLQuery1.Fields[0].AsInteger > 0 then
  begin
    MessageDlg('jenis satuan ini digunakan oleh ' +
      DM.mySQLQuery1.Fields[0].AsString + ' menu'#13 +
      'sehingga tidak diperbolehkan untuk menghapusnya', mtError, [mbOK], 0);
    Exit;
  end;

  {****************************************************************************}
  if not DM.bIsSinuhun then
  begin
    if isAllowPriv(LISTJENISSATUAN_DELETE) = 'N' then
      ShowAuthorization(LISTJENISSATUAN_DELETE);
    if isAllowPriv(LISTJENISSATUAN_DELETE) = 'N' then
      Exit;
  end;
  {****************************************************************************}

  if MessageDlg('Apakah anda yakin ingin menghapus data ini ?'#13 +
    'Satuan:' + grid.Cell[2, grid.SelectedRow].AsString + ''#13 +
    'Peringatan:'#13 +
    '   Penghapusan satuan ini akan juga menghapus '#13 +
    '   data konversi nilai dengan satuan yang terkait',
    mtConfirmation,
    [mbYes] + [mbCancel], 0) <> mrYes then
  begin
    DeletePriv(LISTJENISSATUAN_DELETE);
    Exit;
  end;

  dm.ExecSQL(
    'delete from data_satuankonv'#13 +
    'where id_dasar  = %d or'#13 +
    '      id_konversi = %d',
    [grid.Cell[0, grid.SelectedRow].AsInteger,
    grid.Cell[0, grid.SelectedRow].AsInteger], dm.mySQLQuery1);

  dm.ExecSQL(
    'delete from data_satuan'#13 +
    'where id = %d', [grid.Cell[0,
    grid.SelectedRow].AsInteger], dm.mySQLQuery1);

  {****************************************************************************}
  InsertData_Perubahan(
    'Delete List Jenis Satuan'#13 +
    'Satuan: ' + grid.Cell[2, grid.SelectedRow].AsString);
  DeletePriv(LISTJENISSATUAN_DELETE);
  {****************************************************************************}

  LoadAllJenisSatuan;
end;

procedure TFrmListJenisSatuan.gridBeforeEdit(Sender: TObject; ACol,
  ARow: Integer; var Accept: Boolean);
begin
  bEdited := True;
  if ACol = 2 then
    sOldNama := grid.Cell[2, ARow].AsString;
end;

//insert======================================================

procedure TFrmListJenisSatuan.gridInputAccept(Sender: TObject;
  var Accept: Boolean);
var
  iBase: integer;
  max_data_satuan_id: integer;

begin
  if satuan.InputValue = EmptyStr then
  begin
    Accept := False;
    Exit;
  end;

  dm.ExecSQL('select count(*) from data_satuan where nama = "%s"',
    [satuan.InputValue],
    dm.mySQLQuery1);
  dm.mySQLQuery1.First;
  if dm.mySQLQuery1.Fields[0].AsInteger > 0 then
  begin
    MessageDlg('Nama ini sudah ada,pilih nama lain', mtError, [mbOK], 0);
    Accept := False;
    Exit;
  end;

  if isbase.InputValue = 'True' then
    iBase := 1
  else
    iBase := 0;

  dm.ExecSQL('insert into data_satuan(nama,isbase) values("%s",%d)',
    [satuan.InputValue, iBase], dm.mySQLQuery1);

  //  if ibase = 1 then
  //  begin
  dm.ExecSQL('select max(id) from data_satuan', [], dm.mySQLQuery1);
  max_data_satuan_id := dm.mySQLQuery1.Fields[0].AsInteger;

  dm.ExecSQL(
    'insert into data_satuankonv(id_dasar,id_konversi,pengali)'#13 +
    'values(%d,%d,1)',
    [max_data_satuan_id, max_data_satuan_id],
    dm.mySQLQuery1);
  //  end;
end;

end.