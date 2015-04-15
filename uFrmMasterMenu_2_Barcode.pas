unit uFrmMasterMenu_2_Barcode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, NxScrollControl, NxCustomGridControl, NxCustomGrid, NxGrid,
  StdCtrls, sButton, ExtCtrls, sPanel, NxColumnClasses, NxColumns, Menus;

type
  TFrmMasterMenu_2_Barcode = class(TForm)
    grid: TNextGrid;
    NxIncrementColumn1: TNxIncrementColumn;
    nama: TNxTextColumn;
    barcode: TNxTextColumn;
    sort: TNxNumberColumn;
    satuanPdMenu: TNxComboBoxColumn;
    satuanPdLap: TNxComboBoxColumn;
    harga: TNxNumberColumn;
    sPanel1: TsPanel;
    btnKeluar: TsButton;
    NxNumberColumn3: TNxNumberColumn;
    NxNumberColumn1: TNxNumberColumn;
    MainMenu1: TMainMenu;
    Delete1: TMenuItem;
    procedure gridAfterEdit(Sender: TObject; ACol, ARow: Integer;
      Value: WideString);
    procedure gridBeforeEdit(Sender: TObject; ACol, ARow: Integer;
      var Accept: Boolean);
    procedure gridInputAccept(Sender: TObject; var Accept: Boolean);
    procedure gridInputAdded(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnKeluarClick(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
  private

  public

    sOldNama: string;
    sOldBarcode: string;
    bEdited: boolean;
    procedure LoadAllData;
  end;

var
  FrmMasterMenu_2_Barcode: TFrmMasterMenu_2_Barcode;

implementation

uses uDM, DB, uLibrary;

{$R *.dfm}

procedure TFrmMasterMenu_2_Barcode.LoadAllData;
begin
  dm.ExecSQL(
    'select d.id as id_menu,'#13 +
    '       a.id as id_subjenismenu,'#13 +
    '       a.nama as nama_menu,'#13 +
    '		    a.barcode as barcode,'#13 +
    '		    a.sort as sort,'#13 +
    '       c.nama as nama_satuan_menu,'#13 +
    '       b.nama as nama_satuan_laporan,'#13 +
    '		    d.harga'#13 +
    'from data_subjenismenu a'#13 +
    'left join data_menus d'#13 +
    'on a.id = d.id_subjenismenu'#13 +
    'left join data_satuan b'#13 +
    'on a.id_satuan_laporan = b.id'#13 +
    'left join data_satuan c'#13 +
    'on d.id_satuan = c.id'#13 +
    'where a.isBarcode = 1 and is_NONMenu is null'#13 +
    'order by a.sort', [], dm.mySQLQuery1);

  grid.ClearRows;
  dm.mySQLQuery1.First;
  while not dm.mySQLQuery1.Eof do
  begin
    with grid, dm.mySQLQuery1 do
    begin
      AddRow(1);
      Cell[0, grid.RowCount - 1].AsInteger := Fields[0].AsInteger;
      Cell[1, grid.RowCount - 1].AsInteger := Fields[1].AsInteger;
      Cell[3, grid.RowCount - 1].AsString := Fields[2].AsString;
      Cell[4, grid.RowCount - 1].AsString := Fields[3].AsString;
      Cell[5, grid.RowCount - 1].AsInteger := Fields[4].AsInteger;
      Cell[6, grid.RowCount - 1].AsString := Fields[5].AsString;
      Cell[7, grid.RowCount - 1].AsString := Fields[6].AsString;
      Cell[8, grid.RowCount - 1].AsInteger := Fields[7].AsInteger;
    end;
    dm.mySQLQuery1.Next;
  end;
end;

procedure TFrmMasterMenu_2_Barcode.gridAfterEdit(Sender: TObject;
  ACol, ARow: Integer; Value: WideString);
var
  CurrIdSatuan: integer;
begin
  dm.ExecSQL(
    'select count(id)'#13 +
    'from data_subjenismenu'#13 +
    'where nama = "%s" and'#13 +
    '      isbarcode = 1 and'#13 +
    '      id <> %d',
    [grid.Cell[3, ARow].AsString, grid.Cell[1, ARow].AsInteger],
    dm.mySQLQuery1);

  if dm.mySQLQuery1.Fields[0].AsInteger > 0 then
  begin
    MessageDlg('Nama ini telah digunakan oleh item lain', mtWarning, [mbOK], 0);
    grid.Cell[3, ARow].AsString := sOldNama;
    Exit;
  end;

  dm.ExecSQL(
    'select count(id)'#13 +
    'from data_menus'#13 +
    'where nama = "%s" and'#13 +
    '      id_subjenismenu <> %d',
    [grid.Cell[3, ARow].AsString, grid.Cell[1, ARow].AsInteger],
    dm.mySQLQuery1);

  if dm.mySQLQuery1.Fields[0].AsInteger > 0 then
  begin
    MessageDlg('Nama ini telah digunakan oleh item lain', mtWarning, [mbOK], 0);
    grid.Cell[3, ARow].AsString := sOldNama;
    Exit;
  end;

  if (ACol = 4) and (value = EmptyStr) then
  begin
    MessageDlg('Barcode tidak boleh kosong', mtError, [mbOK], 0);
    grid.Cell[4, ARow].AsString := sOldBarcode;
    Exit;
  end;

  dm.ExecSQL(
    'select count(id)'#13 +
    'from data_subjenismenu'#13 +
    'where isbarcode  = 1 and'#13 +
    '      barcode = "%s" and'#13 +
    '      id <> %d',
    [grid.Cell[4, ARow].AsString,
    grid.Cell[1, ARow].AsInteger],
      dm.mySQLQuery1);

  if dm.mySQLQuery1.Fields[0].AsInteger > 0 then
  begin
    MessageDlg(
      'Barcode ini telah digunakan oleh item lain', mtWarning, [mbOK], 0);
    grid.Cell[4, ARow].AsString := sOldBarcode;
    Exit;
  end;

  case ACol of
    3:
      begin
        dm.ExecSQL(
          'update data_subjenismenu'#13 +
          'set nama = "%s"'#13 +
          'where id = %d',
          [Value,
          grid.Cell[1, ARow].AsInteger],
            dm.mySQLQuery1);

        dm.ExecSQL(
          'update data_menus'#13 +
          'set nama = "%s"'#13 +
          'where id = %d',
          [Value,
          grid.Cell[0, ARow].AsInteger],
            dm.mySQLQuery1);
      end;
    4:
      begin
        dm.ExecSQL(
          'update data_subjenismenu'#13 +
          'set barcode = "%s"'#13 +
          'where id = %d',
          [Value,
          grid.Cell[1, ARow].AsInteger],
            dm.mySQLQuery1);

        dm.ExecSQL(
          'update data_menus'#13 +
          'set barcode = "%s"'#13 +
          'where id = %d',
          [Value,
          grid.Cell[0, ARow].AsInteger],
            dm.mySQLQuery1);

      end;
    5:
      begin
        dm.ExecSQL(
          'update data_subjenismenu'#13 +
          'set sort = %d'#13 +
          'where id = %d',
          [StrToInt(Value),
          grid.Cell[1, ARow].AsInteger],
            dm.mySQLQuery1);
      end;
    6:
      begin
        CurrIdSatuan := GetIdSatuan(Value);
        dm.ExecSQL(
          'update data_menus'#13 +
          'set id_satuan = %d'#13 +
          'where id = %d',
          [CurrIdSatuan, grid.Cell[0, ARow].AsInteger],
          DM.mySQLQuery1);
      end;
    7:
      begin
        CurrIdSatuan := GetIdSatuan(Value);
        dm.ExecSQL(
          'update data_subjenismenu'#13 +
          'set Id_satuan_laporan = %d'#13 +
          'where id = %d',
          [CurrIdSatuan, grid.Cell[1, ARow].AsInteger],
          DM.mySQLQuery1);
      end;
    8:
      begin
        dm.ExecSQL(
          'update data_menus'#13 +
          'set harga = %d'#13 +
          'where id = %d',
          [StrToInt(Value), grid.Cell[0, ARow].AsInteger],
          DM.mySQLQuery1);
      end;
  end;
  bEdited := False;
end;

procedure TFrmMasterMenu_2_Barcode.gridBeforeEdit(Sender: TObject;
  ACol, ARow: Integer; var Accept: Boolean);
begin
  sOldNama := grid.Cell[3, ARow].AsString;
  sOldBarcode := grid.Cell[4, ARow].AsString;
  bEdited := True;
end;

procedure TFrmMasterMenu_2_Barcode.gridInputAccept(Sender: TObject;
  var Accept: Boolean);
var
  CurrIdSatuan: integer;
  CurrIdSubJenisMenu: integer;
begin
  if (nama.InputValue = EmptyStr) then
  begin
    MessageDlg('Nama tidak boleh kosong', mtWarning, [mbOK], 0);
    Accept := False;
  end;

  if sort.InputValue = EmptyStr then
  begin
    dm.ExecSQL('select max(sort) from data_subjenismenu', [], dm.mySQLQuery1);
    sort.InputValue := IntToStr(dm.mySQLQuery1.Fields[0].AsInteger + 1);
  end;

  if harga.InputValue = EmptyStr then
  begin
    harga.InputValue := IntToStr(0);
  end;

  dm.ExecSQL(
    'select count(id)'#13 +
    'from data_subjenismenu'#13 +
    'where nama = "%s" and'#13 +
    '      isbarcode = 1',
    [nama.InputValue], dm.mySQLQuery1);

  if dm.mySQLQuery1.Fields[0].AsInteger > 0 then
  begin
    MessageDlg('Nama ini telah digunakan oleh item lain', mtWarning, [mbOK], 0);
    Accept := False;
    Exit;
  end;

  dm.ExecSQL(
    'select count(id)'#13 +
    'from data_menus'#13 +
    'where nama = "%s" ',
    [nama.InputValue], dm.mySQLQuery1);

  if dm.mySQLQuery1.Fields[0].AsInteger > 0 then
  begin
    MessageDlg('Nama ini telah digunakan oleh item lain', mtWarning, [mbOK], 0);
    Accept := False;
    Exit;
  end;

  if (barcode.InputValue = EmptyStr) then
  begin
    MessageDlg('Barcode tidak boleh kosong', mtError, [mbOK], 0);
    Accept := False;
    Exit;
  end;

  dm.ExecSQL(
    'select count(id)'#13 +
    'from data_subjenismenu'#13 +
    'where isbarcode  = 1 and'#13 +
    '      barcode = "%s" ',
    [barcode.InputValue], dm.mySQLQuery1);
  if dm.mySQLQuery1.Fields[0].AsInteger > 0 then
  begin
    MessageDlg(
      'Barcode ini telah digunakan oleh item lain', mtWarning, [mbOK], 0);
    Accept := False;
    Exit;
  end;
  if (satuanPdMenu.InputValue = EmptyStr) or (satuanPdLap.InputValue = EmptyStr)
    then
  begin
    MessageDlg(
      'Satuan pada laporan dan pada menu tidak boleh kosong', mtWarning,
      [mbOK], 0);
    Accept := False;
    Exit;
  end;

  CurrIdSatuan := GetIdSatuan(satuanPdLap.InputValue);
  dm.ExecSQL(
    'insert into data_subjenismenu(nama,sort,isBarcode,'#13 +
    '                              barcode,id_satuan_laporan,'#13 +
    '                              is_stok)'#13 +
    'values("%s",%d,1,"%s",%d,1)',
    [nama.InputValue,
    StrToInt(sort.InputValue),
      barcode.InputValue,
      CurrIdSatuan], dm.mySQLQuery1);
  dm.ExecSQL('select max(id) from data_subjenismenu', [], dm.mySQLQuery1);
  CurrIdSubJenisMenu := dm.mySQLQuery1.Fields[0].AsInteger;

  CurrIdSatuan := GetIdSatuan(satuanPdMenu.InputValue);
  dm.ExecSQL(
    'insert into data_menus (barcode,nama,'#13 +
    '                        id_jenismenu,id_subjenismenu,'#13 +
    '                        id_satuan,harga)'#13 +
    'values("%s","%s",3,%d,%d,%d)',
    [barcode.InputValue,
    nama.InputValue,
      CurrIdSubJenisMenu,
      CurrIdSatuan,
      StrToInt(harga.InputValue)], dm.mySQLQuery1);
  bEdited := False;
end;

procedure TFrmMasterMenu_2_Barcode.gridInputAdded(Sender: TObject);
begin
  grid.ClearRows;
  LoadAllData;
end;

procedure TFrmMasterMenu_2_Barcode.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmMasterMenu_2_Barcode.FormCreate(Sender: TObject);
begin
  LoadAllData;
  FillCmbSatuanNameOnly(satuanPdMenu);
  FillCmbSatuanNameOnly(satuanPdlap);
end;

procedure TFrmMasterMenu_2_Barcode.btnKeluarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmMasterMenu_2_Barcode.Delete1Click(Sender: TObject);
begin
  if bEdited then
    Exit;
  if grid.SelectedCount = 0 then
    Exit;

  dm.ExecSQL(
    'select count(*)'#13 +
    'from detail_pendapatan'#13 +
    'where id_menu = %d',
    [grid.Cell[0, grid.SelectedRow].AsInteger], dm.mySQLQuery1);

  if dm.mySQLQuery1.Fields[0].AsInteger > 0 then
  begin
    MessageDlg(
      'Menu ini telah pernah dipesan,'#13 +
      'sehingga tidak boleh dihapus!', mtWarning, [mbOK], 0);
    Exit;
  end;

  {TODO :cek pada pengeluaran}

  dm.ExecSQL('select count(*) from temp_pendapatan where id_menu = %d',
    [grid.Cell[0, grid.SelectedRow].AsInteger],
    dm.mySQLQuery1);
  if dm.mySQLQuery1.Fields[0].AsInteger > 0 then
  begin
    MessageDlg(
      'Menu ini sedang dipesan,'#13 +
      'sehingga tidak boleh dihapus!', mtWarning, [mbOK], 0);
    Exit;
  end;

  {****************************************************************************}
  if not DM.bIsSinuhun then
  begin
    if isAllowPriv(MASTERMENUBARCODE_DELETE) = 'N' then
      ShowAuthorization(MASTERMENUBARCODE_DELETE);
    if isAllowPriv(MASTERMENUBARCODE_DELETE) = 'N' then
      Exit;
  end;
  {****************************************************************************}

  if MessageDlg(
    'Apakah anda yakin ingin menghapus data ini ?'#13 +
    'Menu :' + grid.Cell[3, grid.SelectedRow].AsString,
    mtConfirmation,
    [mbYes] + [mbCancel], 0) <> mrYes then
  begin
    DeletePriv(MASTERMENUBARCODE_DELETE);
    Exit;
  end;

  dm.ExecSQL('delete from data_menus where id = %d',
    [grid.Cell[0, grid.SelectedRow].AsInteger], dm.mySQLQuery1);

  dm.ExecSQL('delete from data_subjenismenu where id = %d',
    [grid.Cell[1, grid.SelectedRow].AsInteger], dm.mySQLQuery1);

  {****************************************************************************}
  InsertData_Perubahan(
    'Delete Menu'#13 +
    'Nama Items      :' + grid.Cell[3, Grid.SelectedRow].AsString);

  DeletePriv(MASTERMENUBARCODE_DELETE);
  {****************************************************************************}

  LoadAllData;
end;

end.
