unit uFrmCatatanPembelianBahanUtama;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, NxColumnClasses, NxColumns, NxScrollControl,
  NxCustomGridControl, NxCustomGrid, NxGrid, ESBPCSPanel, ESBPCSCalEdit,
  ExtCtrls, sPanel, StdCtrls, sButton, Menus, sLabel, NxCollection, sEdit,
  sComboBox, sMemo;

type
  TFrmCatatanPembelianBahanUtama = class(TForm)
    sPanel1: TsPanel;
    cal: TESBCalEdit;
    btnNext: TsButton;
    btnPrev: TsButton;
    MainMenu1: TMainMenu;
    delete1: TMenuItem;
    NxFlipPanel1: TNxFlipPanel;
    grid: TNextGrid;
    NxNumberColumn2: TNxNumberColumn;
    NxIncrementColumn1: TNxIncrementColumn;
    subjenismenu: TNxComboBoxColumn;
    satuan: TNxComboBoxColumn;
    banyak: TNxNumberColumn;
    hargasatuan: TNxNumberColumn;
    total: TNxNumberColumn;
    keterangan: TNxTextColumn;
    NxFlipPanel2: TNxFlipPanel;
    sPanel2: TsPanel;
    sLabel1: TsLabel;
    btnKeluar: TsButton;
    sLabel2: TsLabel;
    cmb1: TsComboBox;
    cmb2: TsComboBox;
    sLabel4: TsLabel;
    e1: TsEdit;
    sLabel5: TsLabel;
    e2: TsEdit;
    btnSimpan: TsButton;
    btnBaru: TsButton;
    sLabel6: TsLabel;
    mm1: TsMemo;
    btnBatal: TsButton;
    sLabel3: TsLabel;
    gridStok: TNextGrid;
    NxIncrementColumn2: TNxIncrementColumn;
    NxTextColumn1: TNxTextColumn;
    NxTextColumn2: TNxNumberColumn;
    Label1: TLabel;
    NxTextColumn3: TNxTextColumn;
    btnRefresh: TsButton;
    lblModalTersisa: TsLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnPrevClick(Sender: TObject);
    procedure gridAfterEdit(Sender: TObject; ACol, ARow: Integer;
      Value: WideString);
    procedure btnKeluarClick(Sender: TObject);
    procedure delete1Click(Sender: TObject);
    procedure gridBeforeEdit(Sender: TObject; ACol, ARow: Integer;
      var Accept: Boolean);
    procedure calChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cmb2Enter(Sender: TObject);
    procedure e2KeyPress(Sender: TObject; var Key: Char);
    procedure e1KeyPress(Sender: TObject; var Key: Char);
    procedure cmb1KeyPress(Sender: TObject; var Key: Char);
    procedure cmb2KeyPress(Sender: TObject; var Key: Char);
    procedure btnBaruClick(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure btnBatalClick(Sender: TObject);
    procedure cmb1Change(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure gridStokCellFormating(Sender: TObject; ACol, ARow: Integer;
      var TextColor: TColor; var FontStyle: TFontStyles;
      CellState: TCellState);
  private

  public
    bEdited: boolean;
    procedure ReloadStok;
    procedure LoadAllPembelianBahanUtama;
    procedure SetControlStatus(bBaru, bSimpan: boolean);
    procedure GetModalTerakhir;
  end;

var
  FrmCatatanPembelianBahanUtama: TFrmCatatanPembelianBahanUtama;

implementation

uses uDM, uLibrary, DB;

{$R *.dfm}

{______________________________________________________________________________}

procedure TFrmCatatanPembelianBahanUtama.LoadAllPembelianBahanUtama;
begin
  grid.ClearRows;

  dm.ExecSQL(
    'select a.id,'#13 +
    '       b.nama as subjenismenu,'#13 +
    '       c.nama as satuan,'#13 +
    '       a.banyak,'#13 +
    '       a.harga_satuan,'#13 +
    '       a.keterangan'#13 +
    'from data_pengeluaran a'#13 +
    'left join data_subjenismenu b'#13 +
    'on a.id_subjenismenu = b.id'#13 +
    'left join data_satuan c'#13 +
    'on a.id_satuan = c.id'#13 +
    'where a.tgl = "%s" and a.isbahanutama = 1', [MySQLDateFormat(cal.Text)],
    dm.mySQLQuery1);
  grid.BeginUpdate;
  dm.mySQLQuery1.First;
  while not dm.mySQLQuery1.Eof do
  begin
    with grid, dm.mySQLQuery1 do
    begin
      AddRow(1);
      Cell[0, RowCount - 1].AsInteger := Fields[0].AsInteger;
      Cell[2, RowCount - 1].AsString := Fields[1].AsString;
      Cell[3, RowCount - 1].AsString := Fields[2].AsString;
      Cell[4, RowCount - 1].AsFloat := Fields[3].AsFloat;
      Cell[5, RowCount - 1].AsInteger := Fields[4].AsInteger;
      Cell[6, RowCount - 1].AsFloat := Fields[3].AsFloat *
        Fields[4].AsInteger;
      Cell[7, RowCount - 1].AsString := Fields[5].AsString;
    end;
    dm.mySQLQuery1.Next;
  end;
  grid.EndUpdate;
  grid.CalculateFooter();
  NxFlipPanel2.Caption := 'Entry Data Pembelian untuk tanggal: ' + cal.Text;
  NxFlipPanel1.Caption :=
    'List catatan pembelian bahan utama/barcode untuk tanggal: ' + cal.Text;
end;

procedure TFrmCatatanPembelianBahanUtama.FormCreate(Sender: TObject);
begin
  ShortDateFormat := 'dd-MM-yyyy';
  Label1.Caption :=
    '*stok pada grid adalah stok pada tgl: ' + DateToStr(NOW) + ' '#13 +
    'tekan Refresh Data untuk refresh data stok';
  LoadAllPembelianBahanUtama;
  GetModalTerakhir;
  NxFlipPanel1.Enabled := True;
  NxFlipPanel2.Expanded := False;
end;

procedure TFrmCatatanPembelianBahanUtama.btnNextClick(Sender: TObject);
begin
  cal.AddDays(1);
end;

procedure TFrmCatatanPembelianBahanUtama.btnPrevClick(Sender: TObject);
begin
  cal.AddDays(-1);
end;

procedure TFrmCatatanPembelianBahanUtama.gridAfterEdit(Sender: TObject;
  ACol, ARow: Integer; Value: WideString);
var
  iIdSatuan, iIdSubJenisMenu: integer;
begin
  iIdSatuan := GetIdSatuan(Grid.Cell[3, ARow].AsString);
  iIdSubJenisMenu := GetIdSubJenisMenu(grid.Cell[2, ARow].AsString);

  DecimalSeparator := '.';
  dm.ExecSQL(
    'update data_pengeluaran'#13 +
    'set id_subjenismenu = %d,'#13 +
    '    id_satuan = %d,'#13 +
    '    banyak = %f,'#13 +
    '    harga_satuan = %d,'#13 +
    '    keterangan = "%s",'#13 +
    '    item = "%s"'#13 +
    'where id = %d',
    [iIdSubJenisMenu,
    iIdSatuan,
      MySQLFloat(grid.Cell[4, ARow].AsString),
      grid.Cell[5, ARow].AsInteger,
      grid.Cell[7, ARow].AsString,
      'Pembelian: ' + Grid.Cell[2, ARow].AsString,
      grid.Cell[0, ARow].AsInteger], DM.mySQLQuery1);

  DecimalSeparator := ',';
  grid.Cell[6, ARow].AsFloat := grid.Cell[4, ARow].AsFloat *
    grid.Cell[5, ARow].AsInteger;
  grid.CalculateFooter();
  bEdited := False;
end;

procedure TFrmCatatanPembelianBahanUtama.btnKeluarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCatatanPembelianBahanUtama.delete1Click(Sender: TObject);
begin
  if bEdited then
    Exit;
  if grid.SelectedCount = 0 then
    Exit;

  {****************************************************************************}
  if not DM.bIsSinuhun then
  begin
    if isAllowPriv(CATATAN_PEMBELIAN_BAHAN_UTAMA_DELETE) = 'N' then
      ShowAuthorization(CATATAN_PEMBELIAN_BAHAN_UTAMA_DELETE);
    //----------------------------------------entering modalmode
    if isAllowPriv(CATATAN_PEMBELIAN_BAHAN_UTAMA_DELETE) = 'N' then
      Exit;
  end;
  {****************************************************************************}

  if MessageDlg('Apakah anda yakin ingin menghapus data ini ?', mtConfirmation,
    [mbYes] + [mbCancel], 0) <> mrYes then
  begin
    DeletePriv(CATATAN_PEMBELIAN_BAHAN_UTAMA_DELETE);
    Exit;
  end;
  dm.ExecSQL('delete from data_pengeluaran where id = %d',
    [grid.Cell[0, grid.SelectedRow].AsInteger], dm.mySQLQuery1);

  {****************************************************************************}
  InsertData_Perubahan(
    'Delete CatatanPembelianBahanUtama:'#13 +
    'Subjenis     :' + grid.Cell[2, grid.SelectedRow].AsString + ''#13 +
    'Satuan       :' + grid.Cell[3, grid.SelectedRow].AsString + ''#13 +
    'banyak       :' + grid.Cell[4, grid.SelectedRow].AsString + ''#13 +
    'harga Satuan :' + grid.Cell[5, grid.SelectedRow].AsString + ''#13 +
    'Keterangan   :' + grid.Cell[7, grid.SelectedRow].AsString);

  DeletePriv(CATATAN_PEMBELIAN_BAHAN_UTAMA_DELETE);
  {****************************************************************************}

  LoadAllPembelianBahanUtama;
end;

procedure TFrmCatatanPembelianBahanUtama.gridBeforeEdit(Sender: TObject;
  ACol, ARow: Integer; var Accept: Boolean);
var
  currIdSatuan: integer;
begin
  bEdited := True;
  if ACol = 3 then
  begin
    currIdSatuan := GetIdSatuan(grid.Cell[3, ARow].AsString);
    FillCmbSatuan(satuan, currIdSatuan);
  end;
end;

procedure TFrmCatatanPembelianBahanUtama.calChange(Sender: TObject);
begin
  LoadAllPembelianBahanUtama;
  GetModalTerakhir;
end;

procedure TFrmCatatanPembelianBahanUtama.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmCatatanPembelianBahanUtama.FormShow(Sender: TObject);
begin
  cmb1.Items.Clear;
  dm.ExecSQL(
    'select nama'#13 +
    'from data_subjenismenu'#13 +
    'where is_stok = 1', [], dm.mySQLQuery1);

  dm.mySQLQuery1.First;
  while not dm.mySQLQuery1.Eof do
  begin
    Cmb1.Items.Add(dm.mySQLQuery1.Fields[0].AsString);
    dm.mySQLQuery1.Next;
  end;
end;

procedure TFrmCatatanPembelianBahanUtama.cmb2Enter(Sender: TObject);
var
  currIdSatuan: integer;
  iIdSubjenisMenu: integer;
begin
  if cmb1.Text = EmptyStr then
  begin
    MessageDlg('Pilih Nama Subjenis terlebih dahulu', mtWarning, [mbOK], 0);
    Exit;
  end;

  cmb2.Items.Clear;
  iIdSubjenisMenu := GetIdSubJenisMenu(Cmb1.Text);
  if iIdSubJenisMenu = -1 then
  begin
    MessageDlg(
      'Items ini tidak ditemukan'#13 +
      'Periksa kembali data yang anda masukkan', mtError, [mbOK], 0);
    cmb1.SetFocus;
    Exit;
  end;

  dm.ExecSQL(
    'select id_Satuan_laporan'#13 +
    'from data_subjenismenu'#13 +
    'where id = %d', [iIdSubjenisMenu], dm.mySQLQuery1);

  if dm.mySQLQuery1.RecordCount = 0 then
    Exit;

  currIdSatuan := dm.mySQLQuery1.Fields[0].AsInteger;

  dm.ExecSQL(
    'select nama'#13 +
    'from data_satuan'#13 +
    'where id in('#13 +
    'select id_konversi'#13 +
    'from data_satuankonv'#13 +
    'where id_dasar in (select id_dasar'#13 +
    '                   from data_satuankonv'#13 +
    '						 where id_konversi = %d))', [currIdSatuan], dm.mySQLQuery1);

  dm.mySQLQuery1.First;
  while not dm.mySQLQuery1.Eof do
  begin
    Cmb2.Items.Add(dm.mySQLQuery1.Fields[0].AsString);
    dm.mySQLQuery1.Next;
  end;
end;

procedure TFrmCatatanPembelianBahanUtama.e2KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    mm1.SetFocus;
  if (key <> #8) then
    if (key < '0') or (key > '9') then
      key := #0;
end;

procedure TFrmCatatanPembelianBahanUtama.e1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    cmb2.SetFocus;

  if not (key in ['0'..'9'] + [','] + [#8]) then
    key := #0;
end;

procedure TFrmCatatanPembelianBahanUtama.cmb1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    e1.SetFocus;
end;

procedure TFrmCatatanPembelianBahanUtama.cmb2KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    e2.SetFocus;
end;

procedure TFrmCatatanPembelianBahanUtama.btnBaruClick(Sender: TObject);
begin
  cmb1.ItemIndex := -1;
  cmb1.Text := EmptyStr;
  e1.Clear;
  cmb2.ItemIndex := 0;
  cmb2.Text := EmptyStr;
  e2.Clear;
  mm1.Clear;
  SetControlStatus(False, True);
  cmb1.SetFocus;
end;

procedure TFrmCatatanPembelianBahanUtama.btnSimpanClick(Sender: TObject);
var
  iIdSatuan,
    iIdSubJenisMenu: integer;
  sNamaSubJenisMenu: string;
begin
  if (cmb1.Text = EmptyStr) or (Cmb2.Text = EmptyStr) or
    (e1.Text = EmptyStr) or (e2.Text = EmptyStr) then
  begin
    MessageDlg('semua kolom harus terisi', mtWarning, [mbOK], 0);
    Exit;
  end;

  iIdSatuan := GetIdSatuan(Cmb2.Text);

  iIdSubJenisMenu := GetIdSubJenisMenu(Cmb1.Text);
  if iIdSubJenisMenu = -1 then
  begin
    MessageDlg(
      'Nama subjenis atau barcode ini tidak ditemukan,'#13 +
      'periksa kembali data anda', mtError, [mbOK], 0);
    Exit;
  end;

  DecimalSeparator := '.';
  sNamaSubJenisMenu := GetNamaSubJenisMenu(iIdSubJenisMenu);
  dm.ExecSQL(
    'insert into data_pengeluaran (id_subjenismenu,id_satuan,'#13 +
    '                              banyak,harga_satuan,keterangan,'#13 +
    '                              tgl,id_pegawai,isbahanutama,item)'#13 +
    'values(%d,%d,%f,%d,"%s","%s",%d,1,"%s")',
    [iIdSubJenisMenu,
    iIdSatuan,
      MySQLFloat(e1.Text),
      StrToInt(e2.Text),
      mm1.Text,
      MySQLDateFormat(cal.Text),
      dm.iAPPid, 'Pembelian: ' + sNamaSubJenisMenu], dm.mySQLQuery1);
  DecimalSeparator := ',';
  LoadAllPembelianBahanUtama;
  SetControlStatus(True, False);
  btnBaru.SetFocus;
end;

procedure TFrmCatatanPembelianBahanUtama.SetControlStatus(bBaru,
  bSimpan: boolean);
begin
  btnBaru.Enabled := bBaru;
  btnSimpan.Enabled := bSimpan;
  btnBatal.Enabled := bSimpan;
  cmb1.Enabled := bSimpan;
  e1.Enabled := bSimpan;
  cmb2.Enabled := bSimpan;
  e2.Enabled := bSimpan;
  mm1.Enabled := bSimpan;
end;

procedure TFrmCatatanPembelianBahanUtama.btnBatalClick(Sender: TObject);
begin
  SetControlStatus(True, False);
  btnBaru.SetFocus;
end;

procedure TFrmCatatanPembelianBahanUtama.cmb1Change(Sender: TObject);
var
  iIdSubJenisMenu: integer;
begin
  cmb2.ItemIndex := -1;
  cmb2.Clear;
  iIdSubJenisMenu := GetIdSubJenisMenu(Cmb1.Text);
  DM.ExecSQL(
    'select a.harga_satuan,b.nama'#13 +
    'from data_pengeluaran a'#13 +
    'left join data_satuan b'#13 +
    'on a.id_Satuan = b.id'#13 +
    'where id_subjenismenu = %d and'#13 +
    '       tgl = (select max(tgl)'#13 +
    '		           from data_pengeluaran'#13 +
    '				       where id_subjenismenu = %d)',
    [iIdSubJenisMenu, iIdSubJenisMenu], DM.mySQLQuery1);
  if dm.mySQLQuery1.RecordCount > 0 then
  begin
    e2.Text := dm.mySQLQuery1.Fields[0].AsString;
    cmb2.Text := dm.mySQLQuery1.Fields[1].AsString;
  end
  else
    e2.Text := '0';
end;

procedure TFrmCatatanPembelianBahanUtama.ReloadStok;
var
  CurrTgl: string;
begin
  ShortDateFormat := 'dd-MM-yyyy';
  dm.ExecSQL('delete from temp_report_stok', [], dm.mySQLQuery1);
  dm.ExecSQL(
    'select a.id,a.nama,b.nama,a.sort'#13 +
    'from data_subjenismenu a'#13 +
    'left join data_satuan b'#13 +
    'on a.id_satuan_laporan = b.id'#13 +
    'where a.is_stok = 1'#13 +
    'order by a.sort', [], dm.mySQLQuery1);

  dm.mySQLQuery1.First;
  DecimalSeparator := '.';
  gridStok.ClearRows;

  while not dm.mySQLQuery1.Eof do
  begin
    CurrTgl := MySQLDateFormat(DateToStr(NOW));
    dm.ExecSQL(
      'select func_GetStokMasuk("%s",%d),'#13 +
      '       func_GetStokKeluar("%s",%d),'#13 +
      '       func_GetStokPengurangan("%s",%d),'#13 +
      '       func_GetStokPenambahan("%s",%d)',
      [CurrTgl, dm.mySQLQuery1.Fields[0].AsInteger,
      CurrTgl, dm.mySQLQuery1.Fields[0].AsInteger,
        CurrTgl, dm.mySQLQuery1.Fields[0].AsInteger,
        CurrTgl, dm.mySQLQuery1.Fields[0].AsInteger], dm.mySQLQuery3);
    with gridStok do
    begin
      AddRow(1);
      Cell[1, RowCount - 1].AsString := dm.mySQLQuery1.Fields[1].AsString;
      Cell[2, RowCount - 1].AsFloat := (dm.mySQLQuery3.Fields[0].AsFloat +
        dm.mySQLQuery3.Fields[3].AsFloat) - (dm.mySQLQuery3.Fields[1].AsFloat +
        dm.mySQLQuery3.Fields[2].AsFloat);
      Cell[3, RowCount - 1].AsString := dm.mySQLQuery1.Fields[2].AsString;
    end;
    dm.mySQLQuery1.Next;
  end;
  DecimalSeparator := ',';
end;

procedure TFrmCatatanPembelianBahanUtama.btnRefreshClick(Sender: TObject);
begin
  ReloadStok;
end;

procedure TFrmCatatanPembelianBahanUtama.gridStokCellFormating(
  Sender: TObject; ACol, ARow: Integer; var TextColor: TColor;
  var FontStyle: TFontStyles; CellState: TCellState);
begin
  if gridStok.Cell[2, ARow].AsFloat <= 0 then
    TextColor := clred
  else
    TextColor := clblack;
end;

procedure TFrmCatatanPembelianBahanUtama.GetModalTerakhir;
begin
  dm.ExecSQL(
    'select func_GetModalTerakhir()', [], DM.mySQLQuery1);
  if dm.mySQLQuery1.Fields[0].AsString = '' then
    lblModalTersisa.Caption := 'Modal Tersisa: Rp.0'
  else
    lblModalTersisa.Caption := 'Modal Tersisa: Rp.' +
      FormatRp(dm.mySQLQuery1.Fields[0].AsString);
end;

end.

