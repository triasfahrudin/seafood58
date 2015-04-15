unit uFrmListSubJenisMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, NxScrollControl, NxCustomGridControl, NxCustomGrid, NxGrid,
  NxColumnClasses, NxColumns, StdCtrls, sButton, Menus;

type
  TFrmListSubJenisMenu = class(TForm)
    grid: TNextGrid;
    btnKeluar: TsButton;
    NxIncrementColumn1: TNxIncrementColumn;
    nama: TNxTextColumn;
    NxNumberColumn1: TNxNumberColumn;
    MainMenu1: TMainMenu;
    Delete1: TMenuItem;
    sort: TNxNumberColumn;
    satuan: TNxComboBoxColumn;
    isstok: TNxCheckBoxColumn;
    procedure btnKeluarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gridAfterEdit(Sender: TObject; ACol, ARow: Integer;
      Value: WideString);
    procedure FormShow(Sender: TObject);
    procedure gridBeforeEdit(Sender: TObject; ACol, ARow: Integer;
      var Accept: Boolean);
    procedure gridInputAccept(Sender: TObject; var Accept: Boolean);
    procedure gridInputAdded(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
  private

  public

    bEdited: boolean;
    sOldNama: string;
    procedure LoadAllListSubMenu;
  end;

var
  FrmListSubJenisMenu: TFrmListSubJenisMenu;

implementation

uses uDM, uLibrary, DB;

{$R *.dfm}

procedure TFrmListSubJenisMenu.LoadAllListSubMenu;
begin
  dm.ExecSQL(
    'select a.nama,a.id,a.sort,b.nama,a.is_stok'#13 +
    'from data_subjenismenu a'#13 +
    'left join data_satuan b'#13 +
    'on a.id_satuan_laporan = b.id'#13 +
    'where a.isbarcode = 0'#13 +
    'order by sort', [], dm.mySQLQuery1);
  grid.ClearRows;
  dm.mySQLQuery1.First;
  while not dm.mySQLQuery1.Eof do
  begin
    with grid, dm.mySQLQuery1 do
    begin
      AddRow(1);
      Cell[1, grid.RowCount - 1].AsString := Fields[0].Asstring;
      Cell[2, grid.RowCount - 1].AsInteger := Fields[1].AsInteger;
      Cell[3, grid.RowCount - 1].AsInteger := Fields[2].AsInteger;
      Cell[4, grid.RowCount - 1].AsString := Fields[3].AsString;
      if Fields[4].AsInteger = 1 then
        Cell[5, grid.RowCount - 1].AsBoolean := True
      else
        Cell[5, grid.RowCount - 1].AsBoolean := False;
    end;
    dm.mySQLQuery1.Next;
  end;
end;

procedure TFrmListSubJenisMenu.btnKeluarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmListSubJenisMenu.FormCreate(Sender: TObject);
begin
  LoadAllListSubMenu;
  FillCmbSatuanNameOnly(satuan);
end;

procedure TFrmListSubJenisMenu.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmListSubJenisMenu.gridAfterEdit(Sender: TObject; ACol,
  ARow: Integer; Value: WideString);
var
  CurrIdSatuan: integer;
  istok: byte;
begin

  case ACol of
    1:
      begin
        if Value <> sOldNama then
        begin
          dm.ExecSQL(
            'select count(id)'#13 +
            'from data_subjenismenu'#13 +
            'where nama = %s and id <> %d',
            [grid.Cell[1, ARow].AsString,
            grid.Cell[2, ARow].AsInteger], dm.mySQLQuery1);
          dm.mySQLQuery1.First;
          if dm.mySQLQuery1.Fields[0].AsInteger > 0 then
          begin
            MessageDlg('Nama ini sudah terpakai, cari nama lain', mtWarning,
              [mbOK], 0);
            grid.Cell[1, ARow].AsString := sOldNama;
            bEdited := False;
            Exit;
          end;

          dm.ExecSQL('update data_subjenismenu set nama = "%s" where id = %d',
            [grid.Cell[1, ARow].AsString, grid.Cell[2, ARow].AsInteger],
            Dm.MySQLQuery1);
        end;
      end;
    3:
      begin
        dm.ExecSQL(
          'update data_subjenismenu'#13 +
          'set sort = %d'#13 +
          'where id = %d',
          [grid.Cell[3, ARow].AsInteger,
          grid.Cell[2, ARow].AsInteger], Dm.MySQLQuery1);
      end;
    4:
      begin
        CurrIdSatuan := GetIdSatuan(grid.Cell[4, ARow].AsString);
        dm.ExecSQL(
          'update data_subjenismenu'#13 +
          'set id_satuan_laporan = %d'#13 +
          'where id = %d',
          [CurrIdSatuan,
          grid.Cell[2, ARow].AsInteger], dm.mySQLQuery1);
      end;
    5:
      begin
        if Value = 'True' then
          istok := 1
        else
          istok := 0;

        dm.ExecSQL(
          'update data_subjenismenu'#13 +
          'set is_stok = %d'#13 +
          'where id = %d',
          [istok,
          grid.Cell[2, ARow].AsInteger], dm.mySQLQuery1);
      end;
  end;

  bEdited := False;
end;

procedure TFrmListSubJenisMenu.FormShow(Sender: TObject);
begin
  formatbtn(self);
end;

procedure TFrmListSubJenisMenu.gridBeforeEdit(Sender: TObject; ACol,
  ARow: Integer; var Accept: Boolean);
begin
  bEdited := True;
  sOldNama := grid.Cell[1, ARow].AsString;
end;

procedure TFrmListSubJenisMenu.gridInputAccept(Sender: TObject;
  var Accept: Boolean);
var
  iStok: byte;
  CurrIdSatuan: integer;
begin
  if nama.InputValue = EmptyStr then
  begin
    Accept := False;
    Exit;
  end;

  if satuan.InputValue = EmptyStr then
  begin
    MessageDlg('Pilih satuan yang akan ditampilkan pada laporan', mtError,
      [mbOK], 0);
    Exit;
  end;

  dm.ExecSQL('select count(*) from data_subjenismenu where nama = "%s"',
    [nama.InputValue], dm.mySQLQuery1);
  dm.mySQLQuery1.First;
  if dm.mySQLQuery1.Fields[0].AsInteger > 0 then
  begin
    MessageDlg('Nama ini sudah ada,pilih nama lain', mtError, [mbOK], 0);
    nama.InputValue := EmptyStr;
    Accept := False;
    Exit;
  end;

  if isstok.InputValue = 'True' then
    iStok := 1
  else
    iStok := 0;

  if (sort.InputValue = EmptyStr) or (sort.InputValue = '0') then
  begin
    dm.ExecSQL('select max(sort) from data_subjenismenu', [], dm.mySQLQuery1);
    sort.InputValue := IntToStr(dm.mySQLQuery1.Fields[0].AsInteger + 1);
  end;

  CurrIdSatuan := GetIdSatuan(satuan.InputValue);
  dm.ExecSQL(
    'insert into data_subjenismenu(nama,sort,id_satuan_laporan,is_stok,isBarcode)'#13 +
    'values("%s",%d,%d,%d,%d)',
    [nama.InputValue, StrToInt(sort.InputValue), CurrIdSatuan, iStok, 0],
    dm.mySQLQuery1);
end;

procedure TFrmListSubJenisMenu.gridInputAdded(Sender: TObject);
begin
  grid.ClearRows;
  LoadAllListSubMenu;
end;

procedure TFrmListSubJenisMenu.Delete1Click(Sender: TObject);
begin
  if bEdited then
    Exit;

  if grid.SelectedCount = 0 then
    Exit;

  dm.ExecSQL(
    'select count(*)'#13 +
    'from data_menus'#13 +
    'where id_subjenismenu = %d',
    [grid.Cell[2, Grid.SelectedRow].AsInteger], Dm.mySQLQuery1);

  if DM.mySQLQuery1.Fields[0].AsInteger > 0 then
  begin
    MessageDlg('subjenis menu ini digunakan oleh ' +
      DM.mySQLQuery1.Fields[0].AsString + ' menu'#13 +
      'sehingga tidak diperbolehkan untuk menghapusnya', mtError, [mbOK], 0);
    Exit;
  end;

  {TODO :cek pada pengeluaran}

  {****************************************************************************}
  if not DM.bIsSinuhun then
  begin
    if isAllowPriv(LISTSUBJENISMENU_DELETE) = 'N' then
      ShowAuthorization(LISTSUBJENISMENU_DELETE);
    if isAllowPriv(LISTSUBJENISMENU_DELETE) = 'N' then
      Exit;
  end;
  {****************************************************************************}

  if MessageDlg('Apakah anda yakin ingin menghapus data ini ?'#13 +
    'Subjenis Menu:' + grid.Cell[2, grid.SelectedRow].AsString, mtConfirmation,
    [mbYes] + [mbCancel], 0) <> mrYes then
  begin
    DeletePriv(LISTSUBJENISMENU_DELETE);
    Exit;
  end;

  dm.ExecSQL('delete from data_subjenismenu where id = %d',
    [grid.Cell[2, grid.SelectedRow].AsInteger], dm.mySQLQuery1);
  {****************************************************************************}
  InsertData_Perubahan('Delete Sub Jenis Menu:' +
    grid.Cell[1, Grid.SelectedRow].AsString);
  DeletePriv(LISTSUBJENISMENU_DELETE);
  {****************************************************************************}

  LoadAllListSubMenu;
end;

end.
