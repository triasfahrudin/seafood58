unit uFrmMasterMenu_2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, NxScrollControl, NxCustomGridControl, NxCustomGrid, NxGrid,
  StdCtrls, sButton, NxColumnClasses, NxColumns, Menus;

type
  TFrmMasterMenu_2 = class(TForm)
    grid: TNextGrid;
    btnKeluar: TsButton;
    NxNumberColumn1: TNxNumberColumn;
    NxIncrementColumn1: TNxIncrementColumn;
    namaitems: TNxTextColumn;
    jenismenu: TNxComboBoxColumn;
    subjenismenu: TNxComboBoxColumn;
    harga: TNxNumberColumn;
    satuan: TNxComboBoxColumn;
    MainMenu1: TMainMenu;
    delete: TMenuItem;
    SubJenisMenu1: TMenuItem;
    PopupMenu1: TPopupMenu;
    Editbahanpembentuk1: TMenuItem;
    isUsedBahanPembentuk: TNxNumberColumn;
    Label1: TLabel;
    procedure gridAfterEdit(Sender: TObject; ACol, ARow: Integer;
      Value: WideString);
    procedure gridBeforeEdit(Sender: TObject; ACol, ARow: Integer;
      var Accept: Boolean);
    procedure gridInputAccept(Sender: TObject; var Accept: Boolean);
    procedure gridInputAdded(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure deleteClick(Sender: TObject);
    procedure btnKeluarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SubJenisMenu1Click(Sender: TObject);
    procedure Editbahanpembentuk1Click(Sender: TObject);
    procedure gridCellFormating(Sender: TObject; ACol, ARow: Integer;
      var TextColor: TColor; var FontStyle: TFontStyles;
      CellState: TCellState);
  private

  public

    bEdited: boolean;
    sOldNama: string;
    procedure LoadAllDatamenu;
  end;

var
  FrmMasterMenu_2: TFrmMasterMenu_2;

implementation

uses uDM, DB, uLibrary, uFrmListSubJenisMenu, uFrmBahanPembentuk;

{$R *.dfm}

{$INCLUDE DEFINE.inc}

procedure TFrmMasterMenu_2.LoadAllDatamenu;
begin

  dm.ExecSQL(
    'select a.id,'#13 +
    '       b.nama as jenismenu,'#13 +
    '       c.nama as subjenismenu,'#13 +
    '       a.nama as namaitems,'#13 +
    '       d.nama as satuan,'#13 +
    '       a.harga,'#13 +
    '       func_isUsesBahanPembentuk(a.id)'#13 +
    'from data_menus a'#13 +
    'left join data_jenismenu b'#13 +
    'on a.id_jenismenu = b.id'#13 +
    'left join data_subjenismenu c'#13 +
    'on a.id_subjenismenu = c.id'#13 +
    'left join data_satuan d'#13 +
    'on a.id_satuan = d.id'#13 +
    'where c.isBarCode = 0'#13 +
    'order by a.id_jenismenu,c.sort,a.id', [], dm.mySQLQuery1);

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
      Cell[4, RowCount - 1].AsString := Fields[3].AsString;
      Cell[5, RowCount - 1].AsString := Fields[4].AsString;
      Cell[6, RowCount - 1].AsInteger := Fields[5].AsInteger;
      Cell[7, RowCount - 1].AsInteger := Fields[6].AsInteger;
    end;
    dm.mySQLQuery1.Next;
  end;

end;

procedure TFrmMasterMenu_2.gridAfterEdit(Sender: TObject; ACol,
  ARow: Integer; Value: WideString);
var
  iIdJnsMenu,
    iIdSubJnsMenu,
    iIdSatuan: integer;
begin
  iIdJnsMenu := GetIdJenisMenu(grid.Cell[2, ARow].AsString);
  iIdSubJnsMenu := GetIdSubJenisMenu(grid.Cell[3, ARow].AsString);
  iIdSatuan := GetIdSatuan(grid.Cell[5, ARow].AsString);

  dm.ExecSQL(
    'select count(id)'#13 +
    'from data_menus'#13 +
    'where id_jenismenu = %d and'#13 +
    '      id_subjenismenu = %d and'#13 +
    'nama = "%s" and id <> %d ',
    [iIdJnsMenu,
    iIdSubJnsMenu,
      grid.Cell[4, ARow].AsString,
      grid.Cell[0, ARow].AsInteger],
      DM.mySQLQuery1);
  dm.mySQLQuery1.First;
  if dm.mySQLQuery1.Fields[0].AsInteger > 0 then
  begin
    MessageDlg('Data ini sudah ada di database, periksa kembali data yang anda masukkan',
      mtError, [mbOK], 0);
    Exit;
  end;

  dm.ExecSQL(
    'update data_menus'#13 +
    'set id_jenismenu = %d,'#13 +
    '    id_subjenismenu = %d,'#13 +
    '    nama = "%s",'#13 +
    '    id_satuan = %d,'#13 +
    '    harga = %d'#13 +
    '    where id = %d',
    [iIdJnsMenu,
    iIdSubJnsMenu,
      grid.Cell[4, ARow].AsString,
      iIdSatuan,
      grid.Cell[6, ARow].AsInteger,
      grid.Cell[0, ARow].AsInteger], dm.mySQLQuery1);

  bEdited := False;
end;

procedure TFrmMasterMenu_2.gridBeforeEdit(Sender: TObject; ACol,
  ARow: Integer; var Accept: Boolean);
begin

  bEdited := True;
  sOldNama := grid.Cell[4, ARow].AsString;
end;

procedure TFrmMasterMenu_2.gridInputAccept(Sender: TObject;
  var Accept: Boolean);
var
  iIdJnsMenu,
    iIdSubJnsMenu,
    iIdSatuan: integer;
begin
  if (jenismenu.InputValue = EmptyStr) and (namaitems.InputValue = EmptyStr) and
    (satuan.InputValue = EmptyStr) then
    Exit;

  if (jenismenu.InputValue = EmptyStr) or (namaitems.InputValue = EmptyStr) or
    ((satuan.InputValue = EmptyStr) or (StrToInt(harga.InputValue) = 0)) then
  begin
    MessageDlg('Jenis Menu,Nama Items,Satuan dan harga tidak boleh kosong',
      mtError, [mbOK], 0);
    Accept := False;
    Exit;
  end;

  iIdJnsMenu := GetIdJenisMenu(jenismenu.InputValue);
  iIdSubJnsMenu := GetIdSubJenisMenu(subjenismenu.InputValue);
  iIdSatuan := GetIdSatuan(satuan.InputValue);

  dm.ExecSQL(
    'select count(id)'#13 +
    'from data_menus'#13 +
    'where id_jenismenu = %d and'#13 +
    '      id_subjenismenu = %d and'#13 +
    'nama = "%s"', [iIdJnsMenu, iIdSubJnsMenu, namaitems.InputValue],
    DM.mySQLQuery1);
  dm.mySQLQuery1.First;
  if dm.mySQLQuery1.Fields[0].AsInteger > 0 then
  begin
    MessageDlg('Data ini sudah ada di database, periksa kembali data yang anda masukkan',
      mtError, [mbOK], 0);
    Accept := False;
    Exit;
  end;

  dm.ExecSQL(
    'insert into data_menus(id_jenismenu,id_subjenismenu,'#13 +
    '                       nama,id_satuan,harga)'#13 +
    'values(%d,%d,"%s",%d,%d)',
    [iIdJnsMenu, iIdSubJnsMenu, namaitems.InputValue, iIdSatuan,
    StrToInt(harga.InputValue)], dm.mySQLQuery1);
  bEdited := False;
end;

procedure TFrmMasterMenu_2.gridInputAdded(Sender: TObject);
begin
  grid.ClearRows;
  LoadAllDatamenu;
end;

procedure TFrmMasterMenu_2.FormCreate(Sender: TObject);
begin
  FillCmbJenisMenu(jenismenu);
  FillCmbSubJenisMenu(subjenismenu);
  FillCmbSatuanNameOnly(satuan);
  LoadAllDatamenu;
{$IFNDEF USE_BAHAN_PEMBENTUK}
  label1.Visible := False;
  Editbahanpembentuk1.Visible := False;
{$ELSE}
  label1.Visible := True;
  Editbahanpembentuk1.Visible := True;
{$ENDIF}
end;

procedure TFrmMasterMenu_2.deleteClick(Sender: TObject);
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
    if isAllowPriv(MASTERMENU_DELETE) = 'N' then
      ShowAuthorization(MASTERMENU_DELETE);
    if isAllowPriv(MASTERMENU_DELETE) = 'N' then
      Exit;
  end;
  {****************************************************************************}

  if MessageDlg(
    'Apakah anda yakin ingin menghapus data ini ?'#13 +
    'Menu :' + grid.Cell[3, grid.SelectedRow].AsString + ' ' +
    grid.Cell[4, grid.SelectedRow].AsString, mtConfirmation,
    [mbYes] + [mbCancel], 0) <> mrYes then
  begin
    DeletePriv(MASTERMENU_DELETE);
    Exit;
  end;

  dm.ExecSQL('delete from data_menus where id = %d',
    [grid.Cell[0, grid.SelectedRow].AsInteger], dm.mySQLQuery1);

  {****************************************************************************}
  InsertData_Perubahan(
    'Delete Menu'#13 +
    'Jenis Menu      :' + grid.Cell[2, Grid.SelectedRow].AsString + ''#13 +
    'Sub Jenis Menu  :' + grid.Cell[3, Grid.SelectedRow].AsString + ''#13 +
    'Nama Items      :' + grid.Cell[4, Grid.SelectedRow].AsString + ''#13 +
    'Satuan          :' + grid.Cell[5, Grid.SelectedRow].AsString);

  DeletePriv(MASTERMENU_DELETE);
  {****************************************************************************}

  LoadAllDatamenu;
end;

procedure TFrmMasterMenu_2.btnKeluarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmMasterMenu_2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmMasterMenu_2.SubJenisMenu1Click(Sender: TObject);
begin
  ActivateForm('TFrmListSubJenisMenu', TFrmListSubJenisMenu,
    FrmListSubJenisMenu);
  FrmListSubJenisMenu.ShowModal;
end;

procedure TFrmMasterMenu_2.Editbahanpembentuk1Click(Sender: TObject);
begin
  ActivateForm('TFrmBahanPembentuk', TFrmBahanPembentuk,
    FrmBahanPembentuk);
  FrmBahanPembentuk.CalledFrom := 2;
  FrmBahanPembentuk.iIdMenuRef := grid.Cell[0, grid.SelectedRow].AsInteger;
  FrmBahanPembentuk.ShowModal;
  LoadAllDatamenu;
end;

procedure TFrmMasterMenu_2.gridCellFormating(Sender: TObject; ACol,
  ARow: Integer; var TextColor: TColor; var FontStyle: TFontStyles;
  CellState: TCellState);
begin
{$IFDEF USE_BAHAN_PEMBENTUK}
  if (grid.Cell[7, ARow].AsInteger = 1) and not (csEmpty in CellState) then
    TextColor := clRed;
{$ENDIF}
end;

end.
