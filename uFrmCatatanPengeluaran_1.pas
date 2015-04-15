unit uFrmCatatanPengeluaran_1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, NxCollection, NxScrollControl, NxCustomGridControl,
  NxCustomGrid, NxGrid, ExtCtrls, ESBPCSPanel, ESBPCSCalEdit,
  NxColumnClasses, NxColumns, Menus, StdCtrls, sButton, sPanel, sLabel;

type
  TFrmCatatanPengeluaran_1 = class(TForm)
    NxHeaderPanel1: TNxHeaderPanel;
    grid: TNextGrid;
    NxIncrementColumn1: TNxIncrementColumn;
    Item: TNxComboBoxColumn;
    HargaSatuan: TNxNumberColumn;
    Total: TNxNumberColumn;
    Banyak: TNxNumberColumn;
    Keterangan: TNxMemoColumn;
    id: TNxNumberColumn;
    calender: TESBCalEdit;
    sPanel1: TsPanel;
    btnKeluar: TsButton;
    sButton1: TsButton;
    sButton2: TsButton;
    MainMenu1: TMainMenu;
    Delete1: TMenuItem;
    lblModalTersisa: TsLabel;
    NxComboBoxColumn1: TNxComboBoxColumn;
    NxCheckBoxColumn1: TNxCheckBoxColumn;
    NxComboBoxColumn2: TNxComboBoxColumn;
    sLabel1: TsLabel;
    procedure gridInputAccept(Sender: TObject; var Accept: Boolean);
    procedure gridAfterEdit(Sender: TObject; ACol, ARow: Integer;
      Value: WideString);
    procedure calenderChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure gridInputAdded(Sender: TObject);
    procedure btnKeluarClick(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
    procedure sButton2Click(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure gridBeforeEdit(Sender: TObject; ACol, ARow: Integer;
      var Accept: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private

  public

    bEdited: boolean;
    procedure LoadAllDataPengeluaran;
    procedure FillItem;
    procedure GetModalTerakhir;
  end;

var
  FrmCatatanPengeluaran_1: TFrmCatatanPengeluaran_1;

implementation

uses uDM, uLibrary, DB, uFrmCatatanPembelianBahanUtama;

{$R *.dfm}

procedure TFrmCatatanPengeluaran_1.FillItem;
begin
  item.Items.Clear;
  dm.ExecSQL(
    'select distinct item'#13 +
    'from data_pengeluaran'#13 +
    'where isBahanUtama <> 1', [], DM.mySQLQuery1);
  dm.mySQLQuery1.First;
  while not dm.mySQLQuery1.Eof do
  begin
    Item.Items.Add(dm.mySQLQuery1.Fields[0].AsString);
    dm.mySQLQuery1.Next;
  end;
end;

procedure TFrmCatatanPengeluaran_1.LoadAllDataPengeluaran;
begin

  grid.ClearRows;
  grid.BeginUpdate;
  dm.ExecSQL(
    'select id,item,harga_satuan,banyak,'#13 +
    '       (harga_satuan * banyak),keterangan'#13 +
    'from data_pengeluaran'#13 +
    'where tgl = "%s" order by id', [MySQLDateFormat(calender.Text)],
    dm.mySQLQuery1);
  dm.mySQLQuery1.First;
  while not dm.mySQLQuery1.Eof do
  begin
    with grid, dm.mySQLQuery1 do
    begin
      AddRow(1);
      Cell[0, RowCount - 1].AsInteger := Fields[0].AsInteger;
      Cell[2, RowCount - 1].AsString := Fields[1].AsString;
      Cell[3, RowCount - 1].AsInteger := Fields[2].AsInteger;
      Cell[4, RowCount - 1].AsFloat := Fields[3].AsFloat;
      Cell[5, RowCount - 1].AsFloat := Fields[4].AsFloat;
      Cell[6, RowCount - 1].AsString := Fields[5].AsString;
    end;
    dm.mySQLQuery1.Next;
  end;
  grid.EndUpdate;
  grid.CalculateFooter();
end;

procedure TFrmCatatanPengeluaran_1.gridInputAccept(Sender: TObject;
  var Accept: Boolean);
begin
  ShortDateFormat := 'dd-MM-yyyy';
  if Item.InputValue = EmptyStr then
  begin
    Accept := False;
    Exit;
  end;

  if HargaSatuan.InputValue = EmptyStr then
    HargaSatuan.InputValue := '1';
  if Banyak.InputValue = EmptyStr then
    Banyak.InputValue := '1';

  if calender.Text <> DateToStr(NOW) then
  begin
    if
      MessageDlg(
      'Apakah anda akan memasukkan data pengeluaran '#13 +
      'dengan tanggal YANG BUKAN hari ini ? ',
      mtConfirmation, [mbYes] + [mbCancel], 0) <> mrYes then
    begin
      Accept := False;
      Exit;
    end;
  end;

  DecimalSeparator := '.';
  dm.ExecSQL(
    'insert into data_pengeluaran'#13 +
    '       (item,harga_satuan,banyak,'#13 +
    '        keterangan,tgl,id_pegawai,isbahanutama)'#13 +
    'values("%s",%d,%f,"%s","%s",%d,0)',
    [item.InputValue,
    StrToInt(HargaSatuan.InputValue),
      MySQLFloat(Banyak.InputValue),
      Keterangan.InputValue,
      mySQLDateFormat(calender.Text),
      dm.iAPPid], DM.mySQLQuery1);
  DecimalSeparator := ',';
end;

procedure TFrmCatatanPengeluaran_1.gridAfterEdit(Sender: TObject; ACol,
  ARow: Integer; Value: WideString);
begin
  case ACol of
    2:
      begin
        dm.ExecSQL(
          'update data_pengeluaran'#13 +
          'set item = "%s"'#13 +
          'where id = %d',
          [grid.Cell[2, ARow].AsString,
          grid.Cell[0, ARow].AsInteger], Dm.mySQLQuery1);
      end;
    3:
      begin
        dm.ExecSQL(
          'update data_pengeluaran'#13 +
          'set harga_satuan = %d'#13 +
          'where id = %d',
          [grid.Cell[3, ARow].AsInteger,
          grid.Cell[0, ARow].AsInteger], Dm.mySQLQuery1);
      end;
    4:
      begin
        DecimalSeparator := '.';
        dm.ExecSQL(
          'update data_pengeluaran'#13 +
          'set banyak = %f'#13 +
          'where id = %d',
          [MySQLFloat(grid.Cell[4, ARow].AsString),
          grid.Cell[0, ARow].AsInteger], Dm.mySQLQuery1);
        DecimalSeparator := ',';
      end;
    6:
      begin
        dm.ExecSQL(
          'update data_pengeluaran'#13 +
          'set keterangan = "%s"'#13 +
          'where id = %d',
          [grid.Cell[6, ARow].AsString,
          grid.Cell[0, ARow].AsInteger], Dm.mySQLQuery1);
      end;
  end;
  grid.Cell[5, ARow].AsFloat :=
    grid.Cell[3, ARow].AsInteger * grid.Cell[4, ARow].AsFloat;

  GetModalTerakhir;
  grid.CalculateFooter();
  bEdited := False;
end;

procedure TFrmCatatanPengeluaran_1.calenderChange(Sender: TObject);
begin
  LoadAllDataPengeluaran;
  GetModalTerakhir;
end;

procedure TFrmCatatanPengeluaran_1.FormShow(Sender: TObject);
begin
  FillItem;
  LoadAllDataPengeluaran;
  GetModalTerakhir;
end;

procedure TFrmCatatanPengeluaran_1.gridInputAdded(Sender: TObject);
begin
  grid.ClearRows;
  LoadAllDataPengeluaran;
end;

procedure TFrmCatatanPengeluaran_1.btnKeluarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCatatanPengeluaran_1.sButton1Click(Sender: TObject);
begin
  calender.AddDays(-1);
end;

procedure TFrmCatatanPengeluaran_1.sButton2Click(Sender: TObject);
begin
  calender.AddDays(1);
end;

procedure TFrmCatatanPengeluaran_1.GetModalTerakhir;
begin
  dm.ExecSQL(
    //    'select (sum(COALESCE(besar,0))-(select COALESCE(sum(banyak * harga_satuan),0)'#13 +
    //    '                                from data_pengeluaran)) as modal'#13 +
    //    'from data_modal'
    'select func_GetModalTerakhir()', [], DM.mySQLQuery1);
  if dm.mySQLQuery1.Fields[0].AsString = '' then
    lblModalTersisa.Caption := 'Modal Tersisa: Rp.0'
  else
    lblModalTersisa.Caption := 'Modal Tersisa: Rp.' +
      FormatRp(dm.mySQLQuery1.Fields[0].AsString);

end;

procedure TFrmCatatanPengeluaran_1.Delete1Click(Sender: TObject);
begin
  if bEdited then
    Exit;
  if grid.SelectedCount = 0 then
    Exit;

  {****************************************************************************}
  if not DM.bIsSinuhun then
  begin
    if isAllowPriv(CATATANPENGELUARAN_DELETE) = 'N' then
      ShowAuthorization(CATATANPENGELUARAN_DELETE);
    if isAllowPriv(CATATANPENGELUARAN_DELETE) = 'N' then
      Exit;
  end;
  {****************************************************************************}

  if MessageDlg('Apakah anda yakin ingin menghapus data ini ?'#13 +
    'Item:' + grid.Cell[2, grid.SelectedRow].AsString, mtConfirmation,
    [mbYes] + [mbCancel], 0) <> mrYes then
  begin
    DeletePriv(CATATANPENGELUARAN_DELETE);
    Exit;
  end;

  dm.ExecSQL('delete from data_pengeluaran where id = %d', [grid.Cell[0,
    grid.SelectedRow].AsInteger], dm.mySQLQuery1);

  {****************************************************************************}
  InsertData_Perubahan(
    'Delete Catatan Pengeluaran'#13 +
    'Item         :' + grid.Cell[2, Grid.SelectedRow].AsString + ''#13 +
    'Harga Satuan :' + grid.Cell[3, Grid.SelectedRow].AsString + ''#13 +
    'Banyak       :' + grid.Cell[4, Grid.SelectedRow].AsString);

  DeletePriv(CATATANPENGELUARAN_DELETE);
  {****************************************************************************}

  LoadAllDataPengeluaran;
  grid.CalculateFooter();
  GetModalTerakhir;
end;

procedure TFrmCatatanPengeluaran_1.gridBeforeEdit(Sender: TObject; ACol,
  ARow: Integer; var Accept: Boolean);
begin
  dm.ExecSQL(
    'select count(id)'#13 +
    'from data_pengeluaran'#13 +
    'where id = %d and isbahanutama = 1',
    [grid.Cell[0, ARow].AsInteger], dm.mySQLQuery1);
  if dm.mySQLQuery1.Fields[0].AsInteger > 0 then
  begin
    ActivateForm('FrmCatatanPembelianBahanUtama',
      TFrmCatatanPembelianBahanUtama, FrmCatatanPembelianBahanUtama);
    FrmCatatanPembelianBahanUtama.ShowModal;
    Accept := False;
  end
  else
    bEdited := True;
end;

procedure TFrmCatatanPengeluaran_1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
