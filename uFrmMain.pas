{
todo:
1. kuantitas dalam format float,
   namun harga dalam format integer
}
unit uFrmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, sTreeView, ExtCtrls, sPanel, Menus,
  ToolWin, sToolBar, NxColumnClasses, NxColumns,
  NxScrollControl, NxCustomGridControl, NxCustomGrid, NxGrid, StdCtrls,
  sComboBox, sLabel, sButton,
  sEdit, sStatusBar, frxpngimage, NxCollection, DB,
  mySQLDbTables, frxClass,
  RzBorder, MySQLMonitor, frxPreview, DateUtils;

type
  TFrmMain = class(TForm)
    mm1: TMainMenu;
    sToolBar1: TsToolBar;
    Application1: TMenuItem;
    BackupDatabase1: TMenuItem;
    N1: TMenuItem;
    LockDesktop1: TMenuItem;
    ShutdownsWindows1: TMenuItem;
    N2: TMenuItem;
    Exit1: TMenuItem;
    LogOut1: TMenuItem;
    N3: TMenuItem;
    Settings1: TMenuItem;
    Master1: TMenuItem;
    Employees1: TMenuItem;
    FoodandDrinks1: TMenuItem;
    Reports1: TMenuItem;
    Pendapatan1: TMenuItem;
    Penjualan1: TMenuItem;
    N4: TMenuItem;
    RugiLaba1: TMenuItem;
    sPanel1: TsPanel;
    sPanel3: TsPanel;
    sPanel4: TsPanel;
    sPanel6: TsPanel;
    ransaksi1: TMenuItem;
    Pengeluaran1: TMenuItem;
    PendapatanLain1: TMenuItem;
    N5: TMenuItem;
    grid: TNextGrid;
    menu: TNxTextColumn;
    keterangan: TNxTextColumn;
    id: TNxTextColumn;
    sLabelFX1: TsLabelFX;
    harga: TNxNumberColumn;
    NxTextColumn1: TNxNumberColumn;
    banyak: TNxNumberColumn;
    sPanel7: TsPanel;
    sStatusBar1: TsStatusBar;
    entang1: TMenuItem;
    N6: TMenuItem;
    NxTextColumn3: TNxTextColumn;
    NxHeaderPanel1: TNxHeaderPanel;
    sPanel2: TsPanel;
    tvMeja: TsTreeView;
    sPanel5: TsPanel;
    mySQLQueryCari: TmySQLQuery;
    HistoryPendapatan1: TMenuItem;
    ModalAwal1: TMenuItem;
    N7: TMenuItem;
    MasterSatuan1: TMenuItem;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    sLabel3: TsLabel;
    btnRefreshInfo: TsButton;
    lblPendapatan: TsLabel;
    lblPengeluaran: TsLabel;
    lblModalSisa: TsLabel;
    N8: TMenuItem;
    MasterJenis1: TMenuItem;
    MasterSubJenis1: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    MasterKonversiSatuan1: TMenuItem;
    satuan: TNxComboBoxColumn;
    cmbCari: TsComboBox;
    mySQLQueryCmbCari: TmySQLQuery;
    N11: TMenuItem;
    DesignStruk1: TMenuItem;
    Design1: TMenuItem;
    Pendapatan2: TMenuItem;
    Penjualan2: TMenuItem;
    RugiLaba2: TMenuItem;
    N12: TMenuItem;
    MasterMeja1: TMenuItem;
    eBanyak: TsEdit;
    sLabelFX2: TsLabelFX;
    sLabelFX8: TsLabelFX;
    btnBayar: TsButton;
    eBayar: TsEdit;
    Stok1: TMenuItem;
    N13: TMenuItem;
    GantiPassword1: TMenuItem;
    N14: TMenuItem;
    mySQLQueryMenu: TmySQLQuery;
    Stok2: TMenuItem;
    btnBatal: TsButton;
    lblTotalBersih: TRzLEDDisplay;
    sLabel4: TsLabel;
    sLabelFX3: TsLabelFX;
    PengeluaranuntukBahanUtamaNONBarcode1: TMenuItem;
    N15: TMenuItem;
    lblNama_Barcode: TsLabelFX;
    lblMeja: TsLabelFX;
    N16: TMenuItem;
    penguranganStok1: TMenuItem;
    Harian1: TMenuItem;
    Bulanan1: TMenuItem;
    PendapatanBualanan1: TMenuItem;
    Pengeluaran2: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    PendapatanBulanan1: TMenuItem;
    PengeluaranBulanan1: TMenuItem;
    N20: TMenuItem;
    MySQLMonitor1: TMySQLMonitor;
    BahanDapur1: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    utupBukuHarian1: TMenuItem;
    utupBuku1: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    utupBukuHarian2: TMenuItem;
    PopupMenu1: TPopupMenu;
    Editbahanpembentuk1: TMenuItem;
    lblTotalKotor: TRzLEDDisplay;
    sLabelFX4: TsLabelFX;
    sLabelFX5: TsLabelFX;
    eDiscount: TsEdit;
    sLabelFX6: TsLabelFX;
    lblDiscount: TRzLEDDisplay;
    NxPanel1: TNxPanel;
    NxHeaderPanel2: TNxHeaderPanel;
    NxLabel1: TNxLabel;
    lblPendapatan_1: TNxLabel;
    NxLabel3: TNxLabel;
    lblPengeluaran_1: TNxLabel;
    NxLabel5: TNxLabel;
    lblModalSisa_1: TNxLabel;
    Bevel1: TBevel;
    NxLabel7: TNxLabel;
    NxLabel8: TNxLabel;
    NxLabel9: TNxLabel;
    NxLabel10: TNxLabel;
    NxLabel11: TNxLabel;
    NxLabel12: TNxLabel;
    NxLabel13: TNxLabel;
    NxLabel14: TNxLabel;
    lblPengeluaran_2: TNxLabel;
    lblPendapatan_2: TNxLabel;
    frxPreview1: TfrxPreview;
    btnRefresh: TsButton;
    cbReport: TsComboBox;
    btnOK: TsButton;
    frxReport1: TfrxReport;
    btnPrint: TsButton;
    PerubahanStok1: TMenuItem;
    PerubahanStok2: TMenuItem;
    Modal1: TMenuItem;
    N25: TMenuItem;
    Modal2: TMenuItem;
    N26: TMenuItem;
    sLabelFX7: TsLabelFX;
    ePajak: TsEdit;
    sLabelFX9: TsLabelFX;
    lblPajak: TRzLEDDisplay;
    sLabelFX10: TsLabelFX;
    RzLEDDisplay2: TRzLEDDisplay;
    sLabelFX11: TsLabelFX;
    lblTotalAkhir: TRzLEDDisplay;
    N29: TMenuItem;
    RekapitulasiPenjualan1: TMenuItem;
    RekapPenjualan1: TMenuItem;
    View1: TMenuItem;
    InfoHariini1: TMenuItem;
    Search1: TMenuItem;
    procedure LogOut1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Pengeluaran1Click(Sender: TObject);
    procedure PendapatanLain1Click(Sender: TObject);
    procedure FoodandDrinks1Click(Sender: TObject);
    procedure Employees1Click(Sender: TObject);
    procedure gridCellFormating(Sender: TObject; ACol, ARow: Integer;
      var TextColor: TColor; var FontStyle: TFontStyles;
      CellState: TCellState);
    procedure gridAfterEdit(Sender: TObject; ACol, ARow: Integer;
      Value: WideString);
    procedure btnBayarClick(Sender: TObject);
    procedure eBayarKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Settings1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure entang1Click(Sender: TObject);
    procedure tvMejaChange(Sender: TObject; Node: TTreeNode);
    procedure HistoryPendapatan1Click(Sender: TObject);
    procedure ModalAwal1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MasterSatuan1Click(Sender: TObject);
    procedure MasterKonversiSatuan1Click(Sender: TObject);
    procedure gridBeforeEdit(Sender: TObject; ACol, ARow: Integer;
      var Accept: Boolean);
    procedure btnRefreshInfoClick(Sender: TObject);
    procedure cmbCariKeyPress(Sender: TObject; var Key: Char);
    procedure DesignStruk1Click(Sender: TObject);
    procedure Pendapatan1Click(Sender: TObject);
    procedure Penjualan1Click(Sender: TObject);
    procedure RugiLaba1Click(Sender: TObject);
    procedure Pendapatan2Click(Sender: TObject);
    procedure Penjualan2Click(Sender: TObject);
    procedure RugiLaba2Click(Sender: TObject);
    procedure MasterMeja1Click(Sender: TObject);
    procedure BackupDatabase1Click(Sender: TObject);
    procedure eBayarEnter(Sender: TObject);
    procedure ShutdownsWindows1Click(Sender: TObject);
    procedure LockDesktop1Click(Sender: TObject);
    procedure eBanyakKeyPress(Sender: TObject; var Key: Char);
    procedure eBanyakEnter(Sender: TObject);
    procedure MasterJenis1Click(Sender: TObject);
    procedure GantiPassword1Click(Sender: TObject);
    procedure Stok1Click(Sender: TObject);
    procedure lblPendapatanClick(Sender: TObject);
    procedure lblPengeluaranClick(Sender: TObject);
    procedure btnBatalClick(Sender: TObject);
    procedure Stok2Click(Sender: TObject);
    procedure PengeluaranuntukBahanUtamaNONBarcode1Click(Sender: TObject);
    procedure MasterSubJenis1Click(Sender: TObject);
    procedure cmbCariChange(Sender: TObject);
    procedure penguranganStok1Click(Sender: TObject);
    procedure PendapatanBualanan1Click(Sender: TObject);
    procedure Pengeluaran2Click(Sender: TObject);
    procedure PendapatanBulanan1Click(Sender: TObject);
    procedure PengeluaranBulanan1Click(Sender: TObject);
    procedure BahanDapur1Click(Sender: TObject);
    procedure utupBukuHarian1Click(Sender: TObject);
    procedure utupBuku1Click(Sender: TObject);
    procedure utupBukuHarian2Click(Sender: TObject);
    procedure Editbahanpembentuk1Click(Sender: TObject);
    procedure eDiscountKeyPress(Sender: TObject; var Key: Char);
    procedure eDiscountEnter(Sender: TObject);
    procedure eDiscountExit(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure frxReport1BeforePrint(Sender: TfrxReportComponent);
    procedure btnRefreshClick(Sender: TObject);
    procedure PerubahanStok1Click(Sender: TObject);
    procedure PerubahanStok2Click(Sender: TObject);
    procedure Modal1Click(Sender: TObject);
    procedure Modal2Click(Sender: TObject);
    procedure ePajakKeyPress(Sender: TObject; var Key: Char);
    procedure SPTPD1Click(Sender: TObject);
    procedure SPTPD2Click(Sender: TObject);
    procedure SSPDSuratSetoranPajakDaerah1Click(Sender: TObject);
    procedure SSPD1Click(Sender: TObject);
    procedure RekapitulasiPenjualan1Click(Sender: TObject);
    procedure RekapPenjualan1Click(Sender: TObject);
    procedure InfoHariini1Click(Sender: TObject);
    procedure Search1Click(Sender: TObject);
  private
    function SearchMenuIDGridRow(iID: integer): integer;
    function GenerateStruk(iIdMeja: integer): string;
    function GetIdSatuan(str: string): integer;
    function GetId_1(str: string): integer;
    function GetId_2(str: string): integer;
    procedure RefreshTemp_pendapatan(id_meja, i_edited: integer);
    procedure ChangeBanyakBasedOnMenuID(id_: integer; banyak: Real);
    procedure ReloadData(iId_Meja: integer);
    function isMenuActive(id_app_menu: integer): boolean;
    procedure InisialisasiPrivMenu;
    function GetId_3(str: string): integer;
    procedure ForceKillMe;
    procedure UnLockMenuRelatedToPendapatan;

  public

    bIsEdit: boolean;
    iIdEdit: integer;
    iOldHarga: integer;
    iOldBanyak: Real;
    bAcceptRunOut: boolean;
    procedure LockMenuRelatedToPendapatan;
    procedure InisialisasiTVMeja;
    procedure LoadAllMenu(strOption: string = '');
    procedure ReCalculateTotal;
    procedure LogMeIn;
    procedure LogMeOut;
    procedure EditPendapatan(id, iIdMeja: integer);
    procedure FillCmbCari;
  end;

const
  PENJUALAN_LANGSUNG = 'PENJ.LANGSUNG';

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

{$INCLUDE DEFINE.INC}

uses
  ShellAPI, uLibrary, uFrmPendapatanLain,
  uDM,
  uFrmUangKembalian, uFrmSettings, uFrmAbout,
  uFrmHistoryPendapatan, StrUtils, uFrmModalAwal,
  uFrmCatatanPengeluaran_1, uFrmListJenisSatuan, uFrmSatuanKonversi,
  uFrmMasterEmployees_1, uFrmMasterMenu_2,
  uFrmReportParam, uFrmMasterMeja, uFrmBackupRestoreDB,
  uFrmLockDesktop, uFrmListJenisMenu, uFrmGantiPassword,
  uFrmNeedAuthorization, uFrmCatatanPembelianBahanUtama,
  uFrmMasterMenu_2_Barcode, uFrmPerubahanStok, uFrmMasterBumbuDapur,
  uFrmTutupBukuHarian, uFrmBahanPembentuk, uFrmPembelianKredit,
  uFrmPencarian, NxCells;

procedure TFrmMain.LogOut1Click(Sender: TObject);
begin
  if not FrmMain.Active then
    Exit;
  if MessageDlg('apakah anda ingin LogOut', mtConfirmation,
    [mbYes] + [mbNo], 0) = mrYes then
  begin
    grid.SaveToIni(ExtractFilePath(Application.ExeName) + 'SeaFood58Col.ini');
    ShellExecute(handle, 'open', PChar(Application.ExeName),
      nil, nil, SW_NORMAL);
    Close;
    ForceKillMe;
  end;
end;

procedure TFrmMain.InisialisasiTVMeja;
begin
  tvMeja.Items.Clear;
  dm.ExecSQL('select nama from data_meja order by sort', [], dm.mySQLQuery1);
  dm.mySQLQuery1.First;
  while not dm.mySQLQuery1.Eof do
  begin

    tvMeja.Items.Add(nil, dm.mySQLQuery1.Fields[0].AsString);
    dm.mySQLQuery1.Next;
  end;
  tvMeja.Items.Add(nil, PENJUALAN_LANGSUNG);
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin

  //______ cek validitas satuan konversi

  dm.ExecSQL('select id from data_satuan', [], dm.mySQLQuery1);
  dm.mySQLQuery1.First;
  while not dm.mySQLQuery1.Eof do
  begin
    dm.ExecSQL(
      'select count(id) from data_satuankonv '#13 +
      'where id_dasar = %d and id_konversi = %d',
      [dm.mySQLQuery1.Fields[0].AsInteger,
      dm.mySQLQuery1.Fields[0].AsInteger],
        dm.mySQLQuery2);

    if dm.mySQLQuery2.Fields[0].AsInteger = 0 then
      dm.ExecSQL(
        'insert into data_satuankonv(id_dasar,id_konversi,pengali)'#13 +
        'values(%d,%d,1)',
        [dm.mySQLQuery1.Fields[0].AsInteger,
        dm.mySQLQuery1.Fields[0].AsInteger], dm.mySQLQuery3);
    dm.mySQLQuery1.Next;
  end;

  dm.ExecSQL(
    'update data_satuankonv set isOtomatis = 1 where pengali =1', [],
    dm.mySQLQuery1);

  //____ end check validitas

  ShortDateFormat := 'dd-mm-yyyy';
  bAcceptRunOut := False;

  InisialisasiTVMeja;
  LoadAllMenu;
  grid.LoadFromIni(ExtractFilePath(Application.ExeName) + 'SeaFood58Col.ini');
  LogMeIn;
  FrmMain.Caption := FrmMain.Caption + ' #' + UpperCase(dm.sAPPUser) + ' (' +
    DateTimeToStr(NOW) + ')';

  dm.ExecSQL('delete from temp_pendapatan where isEditedItem = 1', [],
    dm.mySQLQuery1);

{$IFNDEF USE_BAHAN_PEMBENTUK}
  Editbahanpembentuk1.Visible := False;
{$ELSE}
  Editbahanpembentuk1.Visible := True;
  dm.ExecSQL('delete from temp_bahanpembentuk where isEditedItem = 1', [],
    dm.mySQLQuery1);
{$ENDIF}

  //dm.ExecSQL('delete from temp_report_3', [], dm.mySQLQuery1);
  dm.ExecSQL('delete from temp_priv', [], dm.mySQLQuery1);
  FillCmbCari;
  DecimalSeparator := ',';
  ThousandSeparator := '.';
  sStatusBar1.Panels[0].Text :=
    'Client Version:' + dm.mySQLDatabase1.GetClientInfo + ' # ' +
    'Server Version:' + dm.mySQLDatabase1.GetServerInfo;

  //____________ cek apakah hari ini udah tutup buku?_______

  dm.ExecSQL('select count(*) from data_tutupbuku where tgl = "%s"',
    [MySQLDateFormat(DateToStr(NOW))], dm.mySQLQuery1);
  if dm.mySQLQuery1.Fields[0].AsInteger > 0 then
  begin
    utupBukuHarian1.Checked := True;
    MessageDlg(
      'Hari ini sudah dilakukan tutup buku!', mtWarning, [mbOK], 0);
    dm.bTutupBukuHariIni := True;
  end;

  //______pajak_______
  ePajak.Text := IntToStr(DM.iPPN);

  //delete all privilege
  DeleteAllPriv;
end;

procedure TFrmMain.Pengeluaran1Click(Sender: TObject);
begin
  ActivateForm('FrmCatatanPengeluaran_1', TFrmCatatanPengeluaran_1,
    FrmCatatanPengeluaran_1);
  FrmCatatanPengeluaran_1.ShowModal;
  btnRefreshInfoClick(Sender);
end;

procedure TFrmMain.PendapatanLain1Click(Sender: TObject);
begin
  ActivateForm('FrmPendapatanLain', TFrmPendapatanLain, FrmPendapatanLain);
  FrmPendapatanLain.bNewData := True;
  FrmPendapatanLain.ShowModal;
  btnRefreshInfoClick(Sender);
end;

procedure TFrmMain.FoodandDrinks1Click(Sender: TObject);
var
  myNode: TTreeNode;
begin
  ActivateForm('TFrmMasterMenu_2', TFrmMasterMenu_2, FrmMasterMenu_2);
  FrmMasterMenu_2.ShowModal;
  if tvMeja.SelectionCount = 0 then
    Exit;
  myNode := tvMeja.Selected;
  tvMejaChange(sender, myNode);
  FillCmbCari;
end;

procedure TFrmMain.Employees1Click(Sender: TObject);
begin
  ActivateForm('FrmMasterEmployees_1', TFrmMasterEmployees_1,
    FrmMasterEmployees_1);
  FrmMasterEmployees_1.ShowModal;
  InisialisasiPrivMenu;
  if dm.bTutupBukuHariIni then
    LockMenuRelatedToPendapatan;
end;

procedure TFrmMain.LoadAllMenu(strOption: string = '');
var
  str: string;
begin
  str := EmptyStr;

  dm.ExecSQL(
    'select a.id,d.nama,b.nama,a.nama,a.harga,c.warna,b.isBarcode'#13 +
    'from data_menus a'#13 +
    'left join data_subjenismenu b'#13 +
    'on a.id_subjenismenu = b.id'#13 +
    'left join data_jenismenu c'#13 +
    'on a.id_jenismenu = c.id'#13 +
    'left join data_satuan d'#13 +
    'on a.id_satuan = d.id'#13 +
    strOption + ''#13 +
    'order by a.id_jenismenu,b.sort,a.id', [], dm.mySQLQuery1);

  dm.mySQLQuery1.First;
  grid.BeginUpdate;
  while not dm.mySQLQuery1.Eof do
  begin
    with grid, dm.mySQLQuery1 do
    begin
      AddRow(1);

      Cell[0, RowCount - 1].AsInteger := Fields[0].AsInteger;
      Cell[1, RowCount - 1].AsString := Fields[1].AsString;

      if (Fields[2].AsString <> EmptyStr) and (Fields[6].AsInteger = 0) then
      begin
        if str <> Fields[2].AsString then
        begin
          Cell[3, RowCount - 1].AsString := format('%-8s - %s',
            [Fields[2].AsString, Fields[3].AsString]);
          str := Fields[2].AsString;
        end
        else
        begin
          Cell[3, RowCount - 1].AsString := format('%8s - %s', [' ',
            Fields[3].AsString]);
        end;
      end
      else
        Cell[3, RowCount - 1].AsString := Fields[3].AsString;

      Cell[4, RowCount - 1].AsInteger := Fields[4].AsInteger;
      Cell[7, RowCount - 1].AsString := Fields[5].AsString;
    end;
    dm.mySQLQuery1.Next;
  end;
  grid.EndUpdate;
end;

procedure TFrmMain.gridCellFormating(Sender: TObject; ACol, ARow: Integer;
  var TextColor: TColor; var FontStyle: TFontStyles;
  CellState: TCellState);
begin
  try
    if grid.Cell[7, ARow].AsString = EmptyStr then
      TextColor := $00566A22
    else
      TextColor := StringToColor(grid.Cell[7, ARow].AsString);

    if grid.Cell[2, Arow].AsFloat > 0 then
    begin
      TextColor := clRed;
      CellState := [csBoldTextSelection];
      FontStyle := [fsBold];
    end;
  except

  end;
end;

function TFrmMain.GetIdSatuan(str: string): integer;
begin
  dm.ExecSQL('select id from data_satuan where nama = "%s"', [trim(str)],
    dm.mySQLQuery1);
  dm.mySQLQuery1.First;
  if dm.mySQLQuery1.RecordCount = 0 then
    Result := 0
  else
    result := dm.mySQLQuery1.Fields[0].AsInteger;
end;

procedure TFrmMain.gridAfterEdit(Sender: TObject; ACol, ARow: Integer;
  Value: WideString);
var
  myNode: TTreeNode;
  iIdMeja, i: integer;
  iEdited: byte;
  CurrIdSatuan: integer;
begin
  grid.Refresh;
  if bIsEdit then
    iEdited := 1
  else
    iEdited := 0;

  case ACol of
    2:
      begin
        if StrToFloat(Value) <> iOldBanyak then
        begin
          if bIsEdit then
          begin
            if (not DM.bIsSinuhun) and (isAllowPriv(BANYAK_PADA_MAINFORM) = 'N')
              then
            begin
              ActivateForm('FrmNeedAutorization', TFrmNeedAuthorization,
                FrmNeedAuthorization);
              FrmNeedAuthorization.strPriv := BANYAK_PADA_MAINFORM;
              FrmNeedAuthorization.ShowModal;

              if (isAllowPriv(BANYAK_PADA_MAINFORM) <> 'N') then
              begin
                dm.SavePerubahan(
                  'Perubahan Banyak Items (dalam mode Edit dengan id:' +
                  IntToStr(iIdEdit) + ') ' +
                  grid.Cell[3, ARow].AsString + ''#13 +
                  'Dari    : ' + FloatToStr(iOldBanyak) + ''#13 +
                  'Menjadi : ' + Value + ''#13 +
                  dm.sKet, dm.sNamaPemberiIjin);
                grid.Cell[2, ARow].AsFloat := StrToFloat(Value);
              end
              else
              begin
                grid.Cell[2, ARow].AsFloat := iOldBanyak;
                Exit;
              end;
            end;
          end;
        end;
      end;
    4:
      begin
        if Grid.Cell[2, ARow].AsFloat <> 0 then
        begin
          if StrToInt(value) <> iOldHarga then
          begin
            if (not dm.bIsSinuhun) and (isAllowPriv(HARGA_PADA_MAINFORM) = 'N')
              then
            begin
              ActivateForm('FrmNeedAuthorization',
                TFrmNeedAuthorization, FrmNeedAuthorization);
              FrmNeedAuthorization.strPriv := HARGA_PADA_MAINFORM;
              FrmNeedAuthorization.ShowModal;

              if (isAllowPriv(HARGA_PADA_MAINFORM) <> 'N') then
              begin
                if bIsEdit then
                  dm.SavePerubahan(
                    'Perubahan Harga satuan (dalam mode Edit dengan id:' +
                    IntToStr(iIdEdit) + ') ' +
                    grid.Cell[3, ARow].AsString + ''#13 +
                    'Dari    : ' + IntToStr(iOldHarga) + ''#13 +
                    'Menjadi : ' + Value + ''#13 +
                    dm.sKet, dm.sNamaPemberiIjin)
                else
                  dm.SavePerubahan(
                    'Perubahan Harga satuan ' +
                    grid.Cell[3, ARow].AsString + ''#13 +
                    'Dari    : ' + IntToStr(iOldHarga) + ''#13 +
                    'Menjadi : ' + Value + ''#13 +
                    dm.sKet, dm.sNamaPemberiIjin);

                grid.Cell[4, ARow].AsInteger := StrToInt(Value);
              end
              else
              begin
                grid.Cell[4, ARow].AsInteger := iOldHarga;
                Exit;
              end
            end
            else
            begin
              if bIsEdit then
                dm.SavePerubahan(
                  'Perubahan Harga satuan (dalam mode Edit dengan id:' +
                  IntToStr(iIdEdit) + ') ' +
                  grid.Cell[3, ARow].AsString + ''#13 +
                  'Dari    : ' + IntToStr(iOldHarga) + ''#13 +
                  'Menjadi : ' + Value + ''#13 +
                  dm.sKet, dm.sNamaPemberiIjin)
              else
                dm.SavePerubahan(
                  'Perubahan Harga satuan ' +
                  grid.Cell[3, ARow].AsString + ''#13 +
                  'Dari    : ' + IntToStr(iOldHarga) + ''#13 +
                  'Menjadi : ' + Value + ''#13 +
                  dm.sKet, dm.sNamaPemberiIjin);
              grid.Cell[4, ARow].AsInteger := StrToInt(Value);
            end;
          end;
        end;
      end;
  end;

  Grid.Cell[5, ARow].AsFloat :=
    Grid.Cell[2, ARow].AsFloat * Grid.Cell[4, ARow].AsInteger;

  myNode := tvMeja.Selected;

  if myNode.Text <> PENJUALAN_LANGSUNG then
  begin

    iIdMeja := GetIdMeja(myNode.Text);
    dm.ExecSQL(
      'delete from temp_pendapatan'#13 +
      'where id_meja = %d', [iIdMeja],
      dm.mySQLQuery1);

    {*[+] sep 01 2010
      bahan pembentuk*}
{$IFNDEF USE_BAHAN_PEMBENTUK}
{$ELSE}
    dm.ExecSQL(
      'delete from temp_bahanpembentuk'#13 +
      'where id_meja = %d', [iIdMeja],
      dm.mySQLQuery1);
{$ENDIF}

    for i := 0 to Grid.RowCount - 1 do
    begin
      if Grid.Cell[2, i].AsFloat > 0 then
      begin
        CurrIdSatuan := GetIdSatuan(grid.Cell[1, i].AsString);

        DecimalSeparator := '.';
        dm.ExecSQL(
          'insert into temp_pendapatan'#13 +
          '      (id_meja,id_menu,harga_satuan,'#13 +
          '       banyak,keterangan,isEditedItem,'#13 +
          '       id_satuan)'#13 +
          'values(%d,%d,%d,%f,"%s",%d,%d)',
          [iIdMeja,
          grid.Cell[0, i].AsInteger,
            grid.Cell[4, i].AsInteger,
            mySQLFloat(grid.Cell[2, i].AsString),
            grid.Cell[6, i].AsString,
            iEdited,
            currIdSatuan], dm.MySQLQuery1);
{$IFNDEF USE_BAHAN_PEMBENTUK}
{$ELSE}
        CurrBanyak := grid.Cell[2, i].AsFloat;

        dm.ExecSQL('select max(id) from temp_pendapatan', [], dm.mySQLQuery1);
        CurrMaxIdTempPendapatan := dm.mySQLQuery1.Fields[0].AsInteger;

        {____________________bahan pembentuk}
        dm.ExecSQL(
          'select id_menu,id_subjenismenu,'#13 +
          '       banyak,id_satuan,'#13 +
          '       func_GetPengaliBahanPembentuk(%d,%d)'#13 +
          'from data_menus_bahanpembentuk'#13 +
          'where id_menu = %d',
          [grid.Cell[0, i].AsInteger,
          iidMeja,
            grid.Cell[0, i].AsInteger], dm.mySQLQuery1);

        dm.mySQLQuery1.First;
        while not dm.mySQLQuery1.Eof do
        begin
          dm.ExecSQL(
            'insert into temp_bahanpembentuk'#13 +
            '  (id_meja,id_menu,id_subjenismenu,'#13 +
            '   banyak,id_Satuan,isEditedItem)'#13 +
            'values(%d,%d,%d,%f,%d,%d)',
            [iIdMeja,
            dm.mySQLQuery1.Fields[0].AsInteger, //id_menu
            dm.mySQLQuery1.Fields[1].AsInteger, //id_subjenismenu
            (CurrBanyak * (dm.mySQLQuery1.Fields[2].AsFloat *
              dm.mySQLQuery1.Fields[4].AsFloat)), //banyak
            dm.mySQLQuery1.Fields[3].AsInteger, //id_satuan
            iEdited], dm.mySQLQuery2);

          dm.mySQLQuery1.Next;
        end;
{$ENDIF}
        DecimalSeparator := ',';
      end;
    end;
  end
  else
  begin
    dm.ExecSQL(
      'delete from temp_pendapatan where id_meja = 0', [], dm.mySQLQuery1);

    for i := 0 to Grid.RowCount - 1 do
    begin
      if Grid.Cell[2, i].AsFloat > 0 then
      begin
        CurrIdSatuan := GetIdSatuan(grid.Cell[1, i].AsString);
        DecimalSeparator := '.';
        dm.ExecSQL(
          'insert into temp_pendapatan'#13 +
          '      (id_meja,id_menu,harga_satuan,banyak,keterangan,isEditedItem,id_satuan)'#13 +
          'values(%d,%d,%d,%f,"%s",%d,%d)',
          [0,
          grid.Cell[0, i].AsInteger,
            grid.Cell[4, i].AsInteger,
            mySQLFloat(grid.Cell[2, i].AsString),
            grid.Cell[6, i].AsString,
            iEdited,
            currIdSatuan], dm.MySQLQuery1);
        DecimalSeparator := ',';
      end;
    end;
  end;
  ReCalculateTotal;
  tvMejaChange(Sender, myNode);
  DeletePriv(HARGA_PADA_MAINFORM);
  DeletePriv(BANYAK_PADA_MAINFORM);
end;

procedure TFrmMain.ReCalculateTotal;
var
  i: integer;
  tmpTot: Currency;
  myNode: TTreeNode;
  tmpDiscount: Currency;
  tmpAkhir: Currency;
begin
  //check if field is empty
  if eDiscount.Text = EmptyStr then
    eDiscount.Text := '0';
  //  if ePajak.Text = EmptyStr then
  //    ePajak.Text := '0';
  if eBayar.Text = EmptyStr then
    eBayar.Text := '0';

  //loop harga untuk mencari total awal
  tmpTot := 0;
  for i := 0 to Grid.RowCount - 1 do
  begin
    if Grid.Cell[5, i].AsInteger > 0 then
      tmpTot := tmpTot + Grid.Cell[5, i].AsInteger;
  end;

  //jika total awal = 0, maka
  myNode := tvMeja.Selected;
  if tmpTot > 0 then
    //hilangkan bold pada tree
    BoldTreeNode(myNode, True)
  else
    //jangan hilangkan bold pada tree
    BoldTreeNode(myNode, False);

  {*
    [1]Nilai_awal         :  xxx
    [2]Disc               : (xx% / 100) * Nilai_Awal
    [3]Nilai_setelah_disc : Nilai_awal - Disc
    [4]Pajak              : (xx% / 100) * Nilai_setelah_disc
    [5]Total Akhir        : Nilai_setelah_disc + Pajak
  *}

  //[1]
  lblTotalKotor.Caption := FormatRp(CurrToStr(tmpTot));
  //[2]
  lblDiscount.Caption := FormatRp(CurrToStr((StrToFloat(eDiscount.Text) / 100) *
    tmpTot));
  //[3]
  tmpDiscount := tmpTot - ((StrToFloat(eDiscount.Text) / 100) * tmpTot);
  lblTotalBersih.Caption := FormatRp(CurrToStr(tmpDiscount));

  //juli 28 2011 [add pajak]
  //[4]
  lblPajak.Caption := FormatRp(CurrToStr((StrToFloat(ePajak.Text) / 100) *
    tmpDiscount));
  //[5]
  tmpAkhir := tmpDiscount + ((StrToFloat(ePajak.Text) / 100) * tmpDiscount);
  lblTotalAkhir.Caption := FormatRp(CurrToStr(tmpAkhir));

end;

function TFrmMain.GenerateStruk(iIdMeja: integer): string;
var
  urutan: integer;
  str: TStringDynArray;
begin
  ShortDateFormat := 'dd-MM-yyyy';
  str := Explode('-', DateToStr(NOW));

  dm.ExecSQL('select count(id) from data_pendapatan where tgl ="%s"',
    [MySQLDateFormat(DateToStr(NOW))], DM.mySQLQuery1);
  dm.mySQLQuery1.First;
  urutan := dm.mySQLQuery1.Fields[0].AsInteger;
  result :=
    IntToStr(iIdMeja) + '/' +
    IntToStr(urutan) + '-' +
    Copy(dm.sAPPUser, 1, 3) + '/' +
    str[0] + str[1] + str[2];
end;

procedure TFrmMain.btnBayarClick(Sender: TObject);
var
  tmp: Currency;
  myNode: TTreeNode;
  iIdMeja: integer;
  i: integer;

  //_________kredit card variable ____________
  sIsKredit, //apakah pake kredit card Y atau N
  sBank,
    sNoKartu,
    sNoTrace: string;

  //____________________________________________________________________________
  procedure SaveNewRecord(iId_Meja, typepenjualan: integer);
  var
    CurrData_pendapatanId: integer;
    CurrStruk: string;
  begin
    CurrStruk := GenerateStruk(iId_Meja);

    ShortDateFormat := 'dd-MM-yyyy';
    //april 15 2012
    //penambahan isKredit,namaBank,noKartu,noTrace
    //untuk fitur pendapatan melalui penjualan dengan kartu kredit
    dm.ExecSQL(
      'insert into data_pendapatan'#13 +
      '(typependapatan,id_meja,tgl,id_pegawai,struk,bayar,discount,isKredit,namaBank,noKartu,noTrace)'#13 +
      'values (%d,%d,"%s",%d,"%s",%d,%d,"%s","%s","%s","%s")', [typepenjualan,
      iId_Meja,
        MySQLDateFormat(DateToStr(NOW)), dm.iAPPid, CurrStruk,
        StrToInt(eBayar.Text), StrToInt(eDiscount.Text),
        //april 15 2012-----penambahan kredit card ------------------------
      sIsKredit, sBank, sNoKartu, sNoTrace
        ],
        dm.mySQLQuery1);

    dm.ExecSQL('select max(id) from data_pendapatan', [], dm.mySQLQuery1);
    dm.mySQLQuery1.First;
    CurrData_pendapatanId := dm.mySQLQuery1.Fields[0].AsInteger;

    dm.ExecSQL(
      'select id_menu,harga_satuan,banyak,keterangan,id_satuan'#13 +
      'from temp_pendapatan'#13 +
      'where id_meja = %d', [iId_Meja], dm.mySQLQuery1);
    dm.mySQLQuery1.First;
    while not dm.mySQLQuery1.Eof do
    begin
      if dm.mySQLQuery1.Fields[2].AsFloat > 0 then
      begin
        DecimalSeparator := '.';
        dm.ExecSQL(
          'insert into detail_pendapatan(id_pendapatan,id_menu,'#13 +
          '                              harga_satuan,banyak,keterangan,'#13 +
          '                              id_satuan)'#13 +
          'values(%d,%d,%d,%f,"%s",%d)',
          [CurrData_pendapatanId,
          dm.mySQLQuery1.Fields[0].AsInteger,
            dm.mySQLQuery1.Fields[1].AsInteger,
            MySQLFloat(dm.mySQLQuery1.Fields[2].AsString),
            dm.mySQLQuery1.Fields[3].AsString,
            dm.mySQLQuery1.Fields[4].AsInteger
            ], dm.mySQLQuery2);
        DecimalSeparator := ',';
      end;
      dm.mySQLQuery1.Next;
    end;
    dm.ExecSQL('delete from temp_pendapatan where id_meja = %d', [iId_Meja],
      dm.mySQLQuery1);

    dm.rptstruk.LoadFromFile(ExtractFilePath(Application.ExeName) +
      '\report\' + RPT_STRUK_FILE);
    dm.mySQLQueryStrukDetail.Close;
    dm.mySQLQueryStrukDetail.Params[0].Value := CurrData_pendapatanId;
    dm.mySQLQueryStrukDetail.Active := True;

    dm.mySQLQueryStrukHeader.Close;
    dm.mySQLQueryStrukHeader.Params[0].Value := CurrData_pendapatanId;
    dm.mySQLQueryStrukDetail.Params[1].Value := DM.iPPN;
    dm.mySQLQueryStrukHeader.Active := True;

    if dm.rptstruk.PrepareReport() then
    begin
      if INIReadString('settings',
        'strukprinter', '') = EmptyStr then
      begin
        MessageDlg('Tidak ada printer yang dipilih dimenu settings!', mtWarning,
          [mbok], 0);
        Exit;
      end;
      dm.rptstruk.PrintOptions.ShowDialog := False;
      dm.rptstruk.PrintOptions.Printer := INIReadString('settings',
        'strukprinter', '');
      dm.rptstruk.Print;
    end;

  end;

  //____________________________________________________________________________
  procedure SaveEditRecord(iId_meja, iId_pendapatan: integer);
  begin

    dm.ExecSQL(
      'update data_pendapatan'#13 +
      'set bayar = %d,'#13 +
      '    discount = %d,'#13 +
      //april 15 2012___ penambahan fitur kartu kredit
      '    isKredit = "%s",'#13 +
      '    namaBank = "%s",'#13 +
      '    noKartu = "%s",'#13 +
      '    noTrace = "%s"'#13 +
      'where id = %d',
      [StrToInt(eBayar.Text),
      StrToInt(eDiscount.Text),
        //april 15 2012______penambahan fitur kartu kredit
      sIsKredit, sBank, sNoKartu, sNoTrace,
        iId_pendapatan
        ], DM.mySQLQuery1);

    dm.ExecSQL('delete from detail_pendapatan where id_pendapatan = %d',
      [iId_pendapatan], dm.mySQLQuery1);
    dm.ExecSQL(
      'select id_menu,harga_satuan,banyak,keterangan,id_satuan'#13 +
      'from temp_pendapatan'#13 +
      'where id_meja = %d', [iId_meja], dm.mySQLQuery1);
    dm.mySQLQuery1.First;
    while not dm.mySQLQuery1.Eof do
    begin
      if dm.mySQLQuery1.Fields[2].AsFloat > 0 then
      begin
        DecimalSeparator := '.';
        dm.ExecSQL(
          'insert into detail_pendapatan(id_pendapatan,id_menu,'#13 +
          '                              harga_satuan,banyak,keterangan,id_satuan)'#13 +
          'values(%d,%d,%d,%f,"%s",%d)',
          [iIdEdit,
          dm.mySQLQuery1.Fields[0].AsInteger,
            dm.mySQLQuery1.Fields[1].AsInteger,
            MySQLFloat(dm.mySQLQuery1.Fields[2].AsString),
            dm.mySQLQuery1.Fields[3].AsString,
            dm.mySQLQuery1.Fields[4].AsInteger
            ], dm.mySQLQuery2);
        DecimalSeparator := ',';
      end;
      dm.mySQLQuery1.Next;
    end;
    dm.ExecSQL('delete from temp_pendapatan where id_meja = %d', [iId_meja],
      dm.mySQLQuery1);

    dm.rptstruk.LoadFromFile(ExtractFilePath(Application.ExeName) +
      '\report\' + RPT_STRUK_FILE);

    dm.mySQLQueryStrukDetail.Close;
    dm.mySQLQueryStrukDetail.Params[0].Value := iId_pendapatan;
    dm.mySQLQueryStrukDetail.Params[1].Value := DM.iPPN;
    dm.mySQLQueryStrukDetail.Active := True;

    dm.mySQLQueryStrukHeader.Close;
    dm.mySQLQueryStrukHeader.Params[0].Value := iId_pendapatan;
    dm.mySQLQueryStrukHeader.Active := True;

    if dm.rptstruk.PrepareReport() then
    begin
      if INIReadString('settings',
        'strukprinter', '') = EmptyStr then
      begin
        MessageDlg('Tidak ada printer yang dipilih dimenu settings!', mtWarning,
          [mbok], 0);
        Exit;
      end;
      dm.rptstruk.PrintOptions.ShowDialog := False;
      dm.rptstruk.PrintOptions.Printer := INIReadString('settings',
        'strukprinter', '');
      dm.rptstruk.Print;
    end;
  end;
begin

  //april 15 2012___ reset variable kartu kredit
  sIsKredit := 'N';
  sBank := '-';
  sNoKartu := '-';
  sNoTrace := '-';

  myNode := tvMeja.Selected;
  tvMejaChange(Sender, myNode);
  ReCalculateTotal;

  //jika totalawal = 0, maka do nothing
  if StrToInt(UnFormatRp(lblTotalKotor.Caption)) = 0 then
    Exit;

  if StrToInt(eBayar.Text) <= 0 then
  begin
    MessageDlg('Pembayaran tidak boleh NOL'#13 +
      'Mohon koreksi Nilai Pembayaran', mtError, [mbOK], 0);
    eBayar.SelectAll;
    Exit;
  end;

  if StrToInt(UnFormatRp(lblTotalAkhir.Caption)) > StrToInt(eBayar.Text) then
  begin
    MessageDlg(
      'Nilai Pembelian > dari Nilai Pembayaran'#13 +
      'Mohon Koreksi Nilai Pembayaran', mtError, [mbOK], 0);
    eBayar.SelectAll;
    exit;
  end;

  for i := 0 to Grid.RowCount - 1 do
  begin
    if (Grid.Cell[2, i].AsFloat > 0) and (grid.Cell[4, i].AsInteger = 0) then
    begin
      MessageDlg(
        'Terdapat Item dengan banyak > 0 namun harga satuan = 0 !'#13 +
        'Periksa kembali data yang akan diproses', mtWarning, [mbOK], 0);
      eBayar.SelectAll;
      Exit;
    end;

  end;

  if MessageDlg(
    'Apakah data yang anda masukkan sudah benar ?'#13 +
    'Total Akhir          : Rp.' + lblTotalAkhir.Caption + ' '#13 +
    'Bayar                : Rp.' +
    FormatRp(eBayar.Text), mtConfirmation, [mbYes] + [mbNo], 0) <>
    mrYes then
  begin
    eBayar.SetFocus;
    eBayar.SelectAll;
    Exit;
  end;

  //  if MessageDlg(
  //  'Pembelian Tunai ?',mtConfirmation,[mbYes] + [mbNo] + [mbCancel],0)

  case MessageDlg(
    'Pembelian Tunai ?', mtConfirmation, [mbYes] + [mbNo] + [mbCancel], 0) of
    mrYes:
      begin
        //do nothing
      end;
    mrNo:
      begin
        //show uFrmPembelianKredit
        ActivateForm('FrmPembelianKredit', TFrmPembelianKredit,
          FrmPembelianKredit);
        if bIsEdit then
        begin
          dm.ExecSQL(
            'SELECT namaBank,noKartu,noTrace'#13 +
            'FROM data_pendapatan'#13 +
            'WHERE id = %d', [iIdEdit], dm.mySQLQuery1);
          with FrmPembelianKredit do
          begin
            //__load nama bank
            if dm.mySQLQuery1.Fields[0].AsString = EmptyStr then
              rgBankName.ItemIndex := 0
            else if dm.mySQLQuery1.Fields[0].AsString = 'MANDIRI' then
              rgBankName.ItemIndex := 0
            else if dm.mySQLQuery1.Fields[0].AsString = 'BCA' then
              rgBankName.ItemIndex := 1
            else
            begin
              rgBankName.ItemIndex := 2;
              edtBankLain.Text := dm.mySQLQuery1.Fields[0].AsString;
            end;

            edtNoKartu.Text := dm.mySQLQuery1.Fields[1].AsString;
            edtNoTrace.Text := dm.mySQLQuery1.Fields[2].AsString;
          end;
        end;

        FrmPembelianKredit.ShowModal;
        if FrmPembelianKredit.ModalResult = mrCancel then
          Exit;
        if FrmPembelianKredit.ModalResult = mrOK then
        begin
          if Trim(FrmPembelianKredit.edtNoKartu.Text) = EmptyStr then
          begin
            MessageDlg('Nomer Kartu kredit belum diisi', mtError, [mbOK], 0);
            Exit;
          end;

          if Trim(FrmPembelianKredit.edtNoTrace.Text) = EmptyStr then
          begin
            MessageDlg('No Trace belum diisi', mtError, [mbOK], 0);
            Exit;
          end;

          sIsKredit := 'Y';
          case FrmPembelianKredit.rgBankName.ItemIndex of
            0: sBank := 'MANDIRI';
            1: sBank := 'BCA';
            2: sBank := FrmPembelianKredit.edtBankLain.Text;
          end;
          sNoKartu := FrmPembelianKredit.edtNoKartu.Text;
          sNoTrace := FrmPembelianKredit.edtNoTrace.Text;
        end;
      end;
    mrCancel:
      begin
        Exit;
      end;
  end;

  if bIsEdit then
  begin
    //jika dalam edit mode:
    if myNode.Text <> PENJUALAN_LANGSUNG then
    begin
      //jika BUKAN penjualan langsung
      iIdMeja := GetIdMeja(myNode.Text);
      SaveEditRecord(iIdMeja, iIdEdit);
    end
    else
    begin
      //jika penjualan langsung
      SaveEditRecord(0, iIdEdit);
    end;
  end
  else
  begin
    //jika dalam New transaction Mode
    if myNode.Text <> PENJUALAN_LANGSUNG then
    begin
      //jika BUKAN penjualan langsung
      iIdMeja := GetIdMeja(myNode.Text);
      SaveNewRecord(iIdMeja, 0);
    end
    else
    begin
      //jika penjualan Langsung
      SaveNewRecord(0, 1);
    end;
  end;

  ActivateForm('FrmUangKembalian', TFrmUangKembalian, FrmUangKembalian);
  tmp := StrToCurr(eBayar.Text) - StrToCurr(UnFormatRp(lblTotalAkhir.Caption));
  FrmUangKembalian.lblKembalian.Caption := 'Rp.' + FormatRp(CurrToStr(tmp));
  FrmUangKembalian.ShowModal;

  grid.ClearRows;
  LoadAllMenu;
  eBayar.Clear;
  eDiscount.Text := '0';
  BoldTreeNode(myNode, False);
  tvMeja.Enabled := True;
  bIsEdit := False;
  btnRefreshInfoClick(Sender);
  ReCalculateTotal;
  cmbCari.SetFocus;
  btnBatal.Visible := False;
  bAcceptRunOut := False;
end;

procedure TFrmMain.eBayarKeyPress(Sender: TObject; var Key: Char);
begin
  inherited KeyPress(Key);
  if key = #13 then
  begin
    btnBayarClick(Sender);
    exit;
  end;

  if (key <> #8) then
    if (key < '0') or (key > '9') then
      key := #0;
end;

procedure TFrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  LogMeOut;
  grid.SaveToIni(ExtractFilePath(Application.ExeName) + 'SeaFood58Col.ini');
  ForceKillMe;
end;

procedure TFrmMain.Settings1Click(Sender: TObject);
begin
  ActivateForm('FrmSettings', TFrmSettings, FrmSettings);
  FrmSettings.ShowModal;
end;

procedure TFrmMain.ForceKillMe;
var
  memmgr: TMemoryManager;
begin
  try
    exitproc := nil;
    ExceptProc := nil;
    ErrorProc := nil;
    //SetRaiseList(nil); //deprecated, using AcquireExceptionObject insted
    AcquireExceptionObject();
    LibModuleList := nil;
    ModuleUnloadList := nil;

    // ask windows nicely to kill us. (well, as nice as we get here)
    TerminateProcess(GetCurrentProcess, 0);
    // what - still here? Surely not, Let's pop the stack
    while true do
      asm
        pop eax;
      end;
  finally
    // we don't believe you could ever get here. but if we do,
    // well, we'll just make sure that nothing will ever work again anyway.
    memmgr.GetMem := nil;
    memmgr.FreeMem := nil;
    memmgr.ReallocMem := nil;
    SetMemoryManager(memmgr);
  end;
end;

procedure TFrmMain.Exit1Click(Sender: TObject);
begin
  if MessageDlg('Ingin Keluar dari Aplikasi ?', mtConfirmation, [mbYes] +
    [mbNo], 0) = mrYes then
  begin
    grid.SaveToIni(ExtractFilePath(Application.ExeName) + 'SeaFood58Col.ini');
    LogMeOut;
    Application.Terminate;
    ForceKillMe;
  end;
end;

procedure TFrmMain.LogMeIn;
begin
  dm.ExecSQL('insert into data_login (id_pegawai,login) values(%d,NOW())',
    [dm.iAPPid], dm.mySQLQuery1);
end;

procedure TFrmMain.LogMeOut;
var
  currId: integer;
begin
  dm.ExecSQL(
    'select max(id)'#13 +
    'from data_login'#13 +
    'where id_pegawai = %d', [dm.iAPPid], dm.mySQLQuery1);
  currId := dm.mySQLQuery1.Fields[0].AsInteger;

  dm.ExecSQL(
    'update data_login'#13 +
    'set logout = NOW()'#13 +
    'where id = %d', [currId], dm.mySQLQuery1);
end;

procedure TFrmMain.entang1Click(Sender: TObject);
begin
  ActivateForm('FrmAbout', TFrmAbout, FrmAbout);
  FrmAbout.ShowModal;
end;

function TFrmMain.SearchMenuIDGridRow(iID: integer): integer;
var
  i: integer;
begin
  result := 0;
  for i := 1 to grid.RowCount - 1 do
  begin
    if grid.Cell[0, i].AsInteger = iID then
    begin
      Result := i;
      Exit;
    end;
  end;
end;

procedure TFrmMain.ReloadData(iId_Meja: integer);
var
  myNode: TTreeNode;
begin
  myNode := tvMeja.Selected;
  dm.ExecSQL(
    'select count(*) from temp_pendapatan where id_meja = %d',
    [iId_Meja],
    dm.mySQLQuery1);
  if dm.mySQLQuery1.Fields[0].AsInteger > 0 then
  begin

    BoldTreeNode(mynode, False);
    grid.ClearRows;
    dm.ExecSQL(
      'select a.id,d.nama,b.nama,a.nama,'#13 +
      '       x.harga_satuan ,c.warna,x.keterangan,x.banyak,b.IsBarcode'#13 +
      'from temp_pendapatan x'#13 +
      'left join data_menus a'#13 +
      'on x.id_menu = a.id'#13 +
      'left join data_subjenismenu b'#13 +
      'on a.id_subjenismenu = b.id'#13 +
      'left join data_jenismenu c'#13 +
      'on a.id_jenismenu = c.id'#13 +
      'left join data_satuan d'#13 +
      'on x.id_satuan = d.id'#13 +
      'where x.id_meja = %d'#13 +
      'order by a.id_jenismenu,b.sort,a.id', [iId_Meja], dm.mySQLQuery1);

    dm.mySQLQuery1.First;
    grid.BeginUpdate;
    while not dm.mySQLQuery1.Eof do
    begin
      with grid, dm.mySQLQuery1 do
      begin
        AddRow(1);
        Cell[0, RowCount - 1].AsInteger := Fields[0].AsInteger;
        Cell[1, RowCount - 1].AsString := Fields[1].AsString;
        Cell[2, RowCount - 1].AsFloat := Fields[7].AsFloat;
        Cell[6, RowCount - 1].AsString := Fields[6].AsString;
        Cell[4, RowCount - 1].AsInteger := Fields[4].AsInteger;
        Cell[5, RowCount - 1].AsFloat := Fields[7].AsFloat *
          Fields[4].AsInteger;

        if (Fields[2].AsString <> EmptyStr) and (Fields[8].AsInteger = 0) then
        begin
          Cell[3, RowCount - 1].AsString := format('%-8s - %s',
            [Fields[2].AsString, Fields[3].AsString])
        end
        else
          Cell[3, RowCount - 1].AsString := Fields[3].AsString;

        Cell[7, RowCount - 1].AsString := Fields[5].AsString;

      end;
      dm.mySQLQuery1.Next;
    end;
    grid.EndUpdate;
    LoadAllMenu(format('where a.id not in (select id_menu'#13 +
      '                   from temp_pendapatan'#13 +
      '                   where id_meja = %d)', [iId_Meja]));

  end
  else
  begin
    grid.ClearRows;
    LoadAllMenu();
    BoldTreeNode(mynode, False);
  end;
  lblMeja.Caption := myNode.Text;
end;

procedure TFrmMain.tvMejaChange(Sender: TObject; Node: TTreeNode);
var
  iIdMeja: integer;
begin
  if node = nil then
    Exit;
  if bIsEdit then
    Exit;

  if Node.Text <> PENJUALAN_LANGSUNG then
  begin
    iIdMeja := GetIdMeja(node.Text);
    ReloadData(iIdMeja);
  end
  else
    ReloadData(0);

  ReCalculateTotal;
end;

function TFrmMain.isMenuActive(id_app_menu: integer): boolean;
begin
  Result := False;
  mySQLQueryMenu.Close;
  mySQLQueryMenu.SQL.Text :=

  'select count(id)'#13 +
    'from data_pegawai'#13 +
    'where id = ' + IntToStr(dm.iAPPid) + ' and'#13 +
    '      privilege like ''%' + IntToStr(id_app_menu) + '%''';
  mySQLQueryMenu.Open;

  if mySQLQueryMenu.Fields[0].AsInteger > 0 then
    Result := True;
end;

procedure TFrmMain.EditPendapatan(id, iIdMeja: integer);
var
  CurrNode: TTreeNode;
  CurrRow: integer;

  procedure FillGrid(CurrId: integer; CurrIdMeja: integer);
  var
    CurrIdSatuan: integer;
  begin
    dm.ExecSQL(
      'select a.id_menu,a.harga_satuan,a.banyak,a.keterangan,b.nama'#13 +
      'from detail_pendapatan a'#13 +
      'left join data_satuan b'#13 +
      'on a.id_satuan = b.id'#13 +
      'where a.id_pendapatan = %d',
      [CurrId], mySQLQueryCari);
    mySQLQueryCari.First;
    while not mySQLQueryCari.Eof do
    begin

      CurrRow := SearchMenuIDGridRow(mySQLQueryCari.Fields[0].AsInteger);
      CurrIdSatuan := GetIdSatuan(mySQLQueryCari.Fields[4].AsString);
      with grid, mySQLQueryCari do
      begin
        Cell[5, CurrRow].AsInteger := Fields[1].AsInteger * Fields[2].AsInteger;

        DecimalSeparator := '.';
        dm.ExecSQL(
          'insert into temp_pendapatan(id_meja,id_menu,harga_satuan,'#13 +
          '                            banyak,keterangan,isEditedItem,'#13 +
          '                            id_satuan)'#13 +
          'values(%d,%d,%d,%f,"%s",1,%d)',
          [CurrIdMeja,
          Fields[0].AsInteger,
            Fields[1].AsInteger,
            Fields[2].AsFloat,
            Fields[3].AsString,
            CurrIdSatuan], DM.mySQLQuery1);
        DecimalSeparator := ',';
      end;
      mySQLQueryCari.Next;
    end;
    ReCalculateTotal;
    BoldTreeNode(CurrNode, True);
    tvMeja.Enabled := false;
  end;
begin
  bIsEdit := True;
  iIdEdit := id;

  CurrNode := tvMeja.Items.GetFirstNode;

  while CurrNode <> nil do
  begin

    CurrNode.Selected := True;

    if (iIdMeja = 0) and (CurrNode.Text = PENJUALAN_LANGSUNG) then
    begin
      FillGrid(id, 0);
      ReloadData(0);
      dm.ExecSQL(
        'select bayar,discount'#13 +
        'from data_pendapatan'#13 +
        'where id = %d',
        [id], dm.mySQLQuery1);
      eBayar.Text := IfThen(dm.mySQLQuery1.Fields[0].AsString = EmptyStr, '0',
        dm.mySQLQuery1.Fields[0].AsString);
      eDiscount.Text := IfThen(dm.mySQLQuery1.Fields[1].AsString = EmptyStr,
        '0',
        dm.mySQLQuery1.Fields[1].AsString);

      lblMeja.Caption := PENJUALAN_LANGSUNG;
      Break;
    end
    else
    begin
      if CurrNode.Text = GetNamaMeja(iIdMeja) then
      begin
        FillGrid(id, iIdMeja);
        ReloadData(iIdMeja);
        dm.ExecSQL(
          'select bayar,discount'#13 +
          'from data_pendapatan'#13 +
          'where id = %d',
          [id], dm.mySQLQuery1);
        eBayar.Text := IfThen(dm.mySQLQuery1.Fields[0].AsString = EmptyStr, '0',
          dm.mySQLQuery1.Fields[0].AsString);
        eDiscount.Text := IfThen(dm.mySQLQuery1.Fields[1].AsString = EmptyStr,
          '0',
          dm.mySQLQuery1.Fields[1].AsString);

        lblMeja.Caption := CurrNode.Text;
        Break;
      end
    end;
    CurrNode.Selected := False;
    CurrNode := CurrNode.GetNext;
  end;

  tvMeja.Enabled := False;
  btnBatal.Visible := True;
  ReCalculateTotal;
end;

procedure TFrmMain.HistoryPendapatan1Click(Sender: TObject);
begin
  ActivateForm('FrmHistoryPendapatan', TFrmHistoryPendapatan,
    FrmHistoryPendapatan);
  FrmHistoryPendapatan.ShowModal;
  btnRefreshInfoClick(Sender);
end;

procedure TFrmMain.ModalAwal1Click(Sender: TObject);
begin
  ActivateForm('FrmModalAwal', TFrmModalAwal, FrmModalAwal);
  FrmModalAwal.ShowModal;
  btnRefreshInfoClick(Sender);
end;

procedure TFrmMain.InisialisasiPrivMenu;
var
  i: integer;
begin
  for i := 1 to ComponentCount - 1 do
  begin
    if (Components[i] is TMenuItem) then
    begin
      if isMenuActive((Components[i] as TMenuItem).Tag) then
        (Components[i] as TMenuItem).Enabled := True
      else
        (Components[i] as TMenuItem).Enabled := False;
    end;
  end;
  lblPendapatan.Enabled := HistoryPendapatan1.Enabled;
  lblPengeluaran.Enabled := Pengeluaran1.Enabled;

  Application1.Enabled := True;
  LogOut1.Enabled := True;
  GantiPassword1.Enabled := True;
  entang1.Enabled := True;
  Exit1.Enabled := True;
end;

procedure TFrmMain.LockMenuRelatedToPendapatan;
begin
  lblPendapatan.Enabled := False;
  btnBayar.Enabled := False;
  grid.Enabled := False;
  tvMeja.Enabled := False;
  HistoryPendapatan1.Enabled := False;
  PendapatanLain1.Enabled := False;
  //utupBukuHarian1.Enabled := False;
  lblMeja.Caption := '------ TUTUP BUKU ! ------';
end;

procedure TFrmMain.UnLockMenuRelatedToPendapatan;
var
  myNode: TTreeNode;
begin
  lblPendapatan.Enabled := True;
  btnBayar.Enabled := True;
  grid.Enabled := True;
  tvMeja.Enabled := True;
  HistoryPendapatan1.Enabled := True;
  PendapatanLain1.Enabled := True;
  //utupBukuHarian1.Enabled := False;
  //lblMeja.Caption := '';
  tvMeja.SetFocus;
  myNode := tvMeja.Items.GetFirstNode;
  myNode.Selected := True;
end;

procedure TFrmMain.FormShow(Sender: TObject);
var
  myNode: TTreeNode;
begin
  tvMeja.SetFocus;
  myNode := tvMeja.Items.GetFirstNode;
  myNode.Selected := True;
  cmbCari.Text := EmptyStr;
  cmbCari.SetFocus;
  FillCmbCari;

  InisialisasiPrivMenu;
  btnRefreshInfoClick(Sender);

  if dm.bTutupBukuHariIni then
  begin
    LockMenuRelatedToPendapatan;
    utupBukuHarian1.Checked := True;
  end
  else
  begin
    UnLockMenuRelatedToPendapatan;
    utupBukuHarian1.Checked := False;
  end;

  //__if viewerMode = Y then
  if dm.ViewerMode then
  begin
    Settings1.Visible := False;
    Master1.Visible := False;
    ransaksi1.Visible := False;
    LockDesktop1.Visible := False;
    ShutdownsWindows1.Visible := False;
    utupBukuHarian1.Visible := False;
    Design1.Visible := False;
    sPanel1.Visible := False;
    lblMeja.Visible := False;

    // prevent saving/restoring a report when previewing. This will destroy
    // objects that are loaded in the designer and will lead to AV.
    frxReport1.EngineOptions.DestroyForms := False;
    // set the custom preview
    frxReport1.Preview := frxPreview1;

  end
  else
    NxPanel1.Visible := False;

  sPanel5.Visible := False;
end;

procedure TFrmMain.MasterSatuan1Click(Sender: TObject);
var
  myNode: TTreeNode;
begin
  ActivateForm('FrmListJenisSatuan', TFrmListJenisSatuan, FrmListJenisSatuan);
  FrmListJenisSatuan.ShowModal;

  if tvMeja.SelectionCount = 0 then
    Exit;
  myNode := tvMeja.Selected;
  tvMejaChange(sender, myNode);
end;

procedure TFrmMain.MasterKonversiSatuan1Click(Sender: TObject);
begin
  ActivateForm('FrmSatuanKonversi', TFrmSatuanKonversi, FrmSatuanKonversi);
  FrmSatuanKonversi.ShowModal;
end;

procedure Sto_AutoWidthCombobox(Combobox: TCombobox);
const
  HORIZONTAL_PADDING = 4;
var
  iWidth: Integer;
  iIndex: Integer;
  iLineWidth: Integer;
begin
  iWidth := 0;

  for iIndex := 0 to Combobox.Items.Count - 1 do
  begin
    iLineWidth := Combobox.Canvas.TextWidth(Combobox.Items[iIndex]);
    Inc(iLineWidth, 2 * HORIZONTAL_PADDING);
    if (iLineWidth > iWidth) then
      iWidth := iLineWidth;
  end;

  if (iWidth > Combobox.Width) then
    SendMessage(Combobox.Handle, CB_SETDROPPEDWIDTH, iWidth, 0);
end;

procedure TFrmMain.gridBeforeEdit(Sender: TObject; ACol, ARow: Integer;
  var Accept: Boolean);
var
  currIdSatuan: integer;
begin
  case ACol of
    1:
      begin
        currIdSatuan := GetIdSatuan(grid.Cell[1, ARow].AsString);
        FillCmbSatuan(satuan, currIdSatuan);
      end;
    2:
      begin
        iOldBanyak := grid.Cell[2, Arow].AsFloat;
      end;
    4:
      begin
        iOldHarga := grid.Cell[4, ARow].AsInteger;
      end;
  end;
end;

procedure TFrmMain.btnRefreshInfoClick(Sender: TObject);
begin
  ShortDateFormat := 'dd-MM-yyyy';

  //__ pendapatan
  dm.ExecSQL(
    'select func_GetPendapatan("%s")',
    [MySQLDateFormat(DateToStr(NOW))], dm.mySQLQuery1);
  dm.mySQLQuery1.First;
  lblPendapatan.Caption := 'Rp.' +
    FormatRp(ifthen(dm.mySQLQuery1.Fields[0].AsString = EmptyStr, '0',
    dm.mySQLQuery1.Fields[0].AsString));
  lblPendapatan_1.Caption := lblPendapatan.Caption;

  dm.ExecSQL(
    'select func_GetPendapatan("%s")',
    [MySQLDateFormat(DateToStr(Yesterday))], dm.mySQLQuery1);
  dm.mySQLQuery1.First;
  lblPendapatan_2.Caption := 'Rp.' +
    FormatRp(ifthen(dm.mySQLQuery1.Fields[0].AsString = EmptyStr, '0',
    dm.mySQLQuery1.Fields[0].AsString));

  //__ modal sisa
  dm.ExecSQL(
    'select func_GetModalTerakhir()', [], DM.mySQLQuery1);
  if dm.mySQLQuery1.Fields[0].AsString = '' then
    lblModalSisa.Caption := 'Rp.0'
  else
    lblModalSisa.Caption := 'Rp.' + FormatRp(dm.mySQLQuery1.Fields[0].AsString);
  lblModalSisa_1.Caption := lblModalSisa.Caption;

  //__ pengeluaran
  dm.ExecSQL(
    'select func_GetPengeluaran("%s")',
    [MySQLDateFormat(DateToStr(NOW))], dm.mySQLQuery1);
  if dm.mySQLQuery1.Fields[0].AsString = '' then
    lblPengeluaran.Caption := 'Rp.0'
  else
    lblPengeluaran.Caption := 'Rp.' +
      FormatRp(dm.mySQLQuery1.Fields[0].AsString);
  lblPengeluaran_1.Caption := lblPengeluaran.Caption;

  dm.ExecSQL(
    'select func_GetPengeluaran("%s")',
    [MySQLDateFormat(DateToStr(Yesterday))], dm.mySQLQuery1);
  if dm.mySQLQuery1.Fields[0].AsString = '' then
    lblPengeluaran_2.Caption := 'Rp.0'
  else
    lblPengeluaran_2.Caption := 'Rp.' +
      FormatRp(dm.mySQLQuery1.Fields[0].AsString);

end;

procedure TFrmMain.FillCmbCari;
begin
  cmbCari.Items.Clear;

  dm.ExecSQL(
    'select c.nama as subjenismenu,'#13 +
    '       a.nama as namaitems'#13 +
    'from data_menus a'#13 +
    'left join data_subjenismenu c'#13 +
    'on a.id_subjenismenu = c.id'#13 +
    'where a.id_jenismenu = 1'#13 +
    'order by a.id_jenismenu,c.sort,a.id', [], dm.mySQLQuery1);
  dm.mySQLQuery1.First;
  while not dm.mySQLQuery1.Eof do
  begin
    if dm.mySQLQuery1.Fields[0].AsString <> EmptyStr then
      cmbCari.Items.Add(trim(dm.mySQLQuery1.Fields[0].AsString) + ' ' +
        dm.mySQLQuery1.Fields[1].AsString)
    else
      cmbCari.Items.Add(dm.mySQLQuery1.Fields[1].AsString);
    dm.mySQLQuery1.Next;
  end;

  dm.ExecSQL('select nama from data_menus where id_jenismenu = 2', [],
    dm.mySQLQuery1);
  dm.mySQLQuery1.First;
  while not dm.mySQLQuery1.Eof do
  begin
    cmbCari.Items.Add(trim(dm.mySQLQuery1.Fields[0].AsString));
    dm.mySQLQuery1.Next;
  end;

  dm.ExecSQL('select nama from data_menus where id_jenismenu = 3', [],
    dm.mySQLQuery1);
  dm.mySQLQuery1.First;
  while not dm.mySQLQuery1.Eof do
  begin
    cmbCari.Items.Add(trim(dm.mySQLQuery1.Fields[0].AsString));
    dm.mySQLQuery1.Next;
  end;

  dm.ExecSQL('select barcode from data_menus where id_jenismenu = 3', [],
    dm.mySQLQuery1);
  dm.mySQLQuery1.First;
  while not dm.mySQLQuery1.Eof do
  begin
    if dm.mySQLQuery1.Fields[0].AsString <> EmptyStr then
    begin
      cmbCari.Items.Add(trim(dm.mySQLQuery1.Fields[0].AsString));
    end;
    dm.mySQLQuery1.Next;
  end;
end;

function TFrmMain.GetId_1(str: string): integer;
begin
  with mySQLQueryCmbCari do
  begin
    Close;
    SQL.Text :=
      format(
      'select a.id,c.nama as subjenismenu,'#13 +
      '       a.nama as namaitems'#13 +
      'from data_menus a'#13 +
      'left join data_subjenismenu c'#13 +
      'on a.id_subjenismenu = c.id'#13 +
      'where if(c.nama <> '''' and c.nama <> a.nama,concat_ws('' '',c.nama,a.nama),a.nama) = "%s"',
      [str]);
    Open;
    if RecordCount = 0 then
      Result := -1
    else
      Result := Fields[0].AsInteger;
  end;
end;

function TFrmMain.GetId_2(str: string): integer;
begin
  with mySQLQueryCmbCari do
  begin
    Close;
    SQL.Text :=
      format('select id from data_menus where barcode = "%s"', [str]);
    Open;
    if RecordCount = 0 then
      Result := -1
    else
      Result := Fields[0].AsInteger;
  end;
end;

function TFrmMain.GetId_3(str: string): integer;
begin
  with mySQLQueryCmbCari do
  begin
    Close;
    SQL.Text :=
      format(
      'select id'#13 +
      'from data_menus'#13 +
      'where nama = "%s" and'#13 +
      '      id_jenismenu = 3', [str]);
    Open;
    if RecordCount = 0 then
      Result := -1
    else
      Result := Fields[0].AsInteger;
  end;
end;

procedure TFrmMain.ChangeBanyakBasedOnMenuID(id_: integer; banyak: Real);
var
  CurrIdRow: integer;
begin
  CurrIdRow := SearchMenuIDGridRow(id_);
  grid.Cell[2, CurrIdRow].AsFloat := banyak;
  grid.Cell[5, CurrIdRow].AsFloat := grid.Cell[2, CurrIdRow].AsFloat *
    grid.Cell[4, CurrIdRow].AsInteger;

end;

//function GetStokMasuk(id_subjenis: integer; dt: string): double;
//begin
//  dm.ExecSQL(
//    'select ifnull(sum(a.banyak * b.pengali) / c.pengali,0) as jumlah_masuk'#13 +
//    'from data_pengeluaran a'#13 +
//    'left join data_satuankonv b'#13 +
//    'on a.id_satuan = b.id_konversi'#13 +
//    'left join data_subjenismenu d'#13 +
//    'on a.id_subjenismenu = d.id'#13 +
//    'left join data_satuankonv c'#13 +
//    'on  d.id_satuan_laporan = c.id_konversi'#13 +
//    'where a.isBahanUtama = 1 and'#13 +
//    '      tgl <="%s" and'#13 +
//    '      a.id_subjenismenu = %d'#13 +
//    'group by a.id_subjenismenu', [dt, id_subjenis], dm.mySQLQuery2);
//  if dm.mySQLQuery2.RecordCount = 0 then
//    result := 0
//  else
//    Result := dm.mySQLQuery2.Fields[0].AsFloat;
//end;
//
//function GetStokKeluar(id_subjenis: integer; dt: string): double;
//begin
//  dm.ExecSQL(
//    'select ifnull((sum(b.banyak * c.pengali) / d.pengali),0) as jumlah_keluar'#13 +
//    'from data_subjenismenu a'#13 +
//    'left join data_menus e'#13 +
//    'on a.id = e.id_subjenismenu'#13 +
//    'left join detail_pendapatan b'#13 +
//    'on e.id = b.id_menu'#13 +
//    'left join data_pendapatan h'#13 +
//    'on b.id_pendapatan = h.id'#13 +
//    'left join data_satuankonv c'#13 +
//    'on b.id_satuan = c.id_konversi'#13 +
//    'left join data_satuankonv d'#13 +
//    'on a.id_satuan_laporan = d.id_konversi'#13 +
//    'left join data_satuan f'#13 +
//    'on a.id_satuan_laporan = f.id'#13 +
//    'where a.is_stok = 1 and'#13 +
//    '      h.tgl <= "%s" and'#13 +
//    '      a.id = %d'#13 +
//    'group by a.id', [dt, id_subjenis], dm.mySQLQuery2);
//  if dm.mySQLQuery2.RecordCount = 0 then
//    result := 0
//  else
//    Result := dm.mySQLQuery2.Fields[0].AsFloat;
//end;

procedure TFrmMain.cmbCariKeyPress(Sender: TObject; var Key: Char);
var
  iId: integer;
  iIdSubJenisMenu: integer;
begin
  if Key <> #13 then
    Exit;

  if trim(cmbCari.Text) = EmptyStr then
  begin
    eDiscount.SetFocus;
    Exit;
  end;

  iId := GetId_1(cmbCari.Text);
  if iId = -1 then
  begin

    iId := GetId_2(cmbCari.Text);
    if iId = -1 then
    begin

      iId := GetId_3(cmbCari.Text);
      if iId = -1 then
      begin
        MessageDlg('Nama Items ini tidak ada!', mtInformation, [mbOK], 0);
        Exit;
      end;
    end;
  end;
  {cek stok
  cari id, trus cari id_subjenismenu nya
  apakah termasuk stok ?

  }

  dm.ExecSQL(
    'select id from data_subjenismenu'#13 +
    'where id = (select id_subjenismenu'#13 +
    '            from data_menus'#13 +
    '				where id  = %d) and is_stok = 1', [iId], dm.mySQLQuery1);
  if dm.mySQLQuery1.RecordCount > 0 then
  begin
    iIdSubJenisMenu := dm.mySQLQuery1.Fields[0].AsInteger;
    ShortDateFormat := 'yyyy-MM-dd';
    dm.ExecSQL(
      'select func_GetStokMasuk("%s",%d),func_GetStokPenambahan("%s",%d),'#13 +
      '       func_GetStokKeluar("%s",%d),func_GetStokPengurangan("%s",%d)',
      [DateToStr(NOW), iIdSubJenisMenu,
      DateToStr(NOW), iIdSubJenisMenu,
        DateToStr(NOW), iIdSubJenisMenu,
        DateToStr(NOW), iIdSubJenisMenu], dm.mySQLQuery2);

    if (dm.mySQLQuery2.Fields[0].AsFloat + dm.mySQLQuery2.Fields[1].AsFloat) <=
      (dm.mySQLQuery2.Fields[2].AsFloat + dm.mySQLQuery2.Fields[3].AsFloat) then
    begin
      ShortDateFormat := 'dd-MM-yyyy';
      if MessageDlg('Stok untuk Item ini sudah habis'#13 +
        'Apakah anda ingin melanjutkan transaksi ?', mtWarning, [mbYes] +
        [mbNo], 0) <> mrYes then
        Exit;
    end;
  end;
  bAcceptRunOut := True;
  ShortDateFormat := 'dd-MM-yyyy';
  eBanyak.SetFocus;
end;

procedure TFrmMain.DesignStruk1Click(Sender: TObject);
begin
  dm.frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
    '\report\' + RPT_STRUK_FILE);
  dm.CalenderText := EmptyStr;
  dm.frxReport.DesignReport;
end;

procedure TFrmMain.Pendapatan1Click(Sender: TObject);
begin
  ActivateForm('FrmReportParam', TFrmReportParam,
    FrmReportParam);
  DM.RPT_ID := RPT_PENDAPATAN;
  FrmReportParam.ShowModal;
end;

procedure TFrmMain.Penjualan1Click(Sender: TObject);
begin
  ActivateForm('FrmReportParam', TFrmReportParam,
    FrmReportParam);
  DM.RPT_ID := RPT_PENGELUARAN;
  FrmReportParam.ShowModal;
end;

procedure TFrmMain.RugiLaba1Click(Sender: TObject);
begin
  ActivateForm('FrmReportParam', TFrmReportParam,
    FrmReportParam);
  DM.RPT_ID := RPT_PROSENTASE;
  FrmReportParam.ShowModal;
end;

procedure TFrmMain.Pendapatan2Click(Sender: TObject);
begin
  dm.frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
    '\report\' + RPT_PENDAPATAN_FILES);
  dm.CalenderText := EmptyStr;
  dm.frxReport.DesignReport;
end;

procedure TFrmMain.Penjualan2Click(Sender: TObject);
begin
  DM.frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
    '\report\' + RPT_PENGELUARAN_FILES);
  dm.CalenderText := EmptyStr;
  dm.frxReport.DesignReport;
end;

procedure TFrmMain.RugiLaba2Click(Sender: TObject);
begin
  dm.frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
    '\report\' + RPT_PROSENTASE_FILE);
  dm.CalenderText := EmptyStr;
  dm.frxReport.DesignReport;
end;

procedure TFrmMain.MasterMeja1Click(Sender: TObject);
begin
  ActivateForm('FrmMasterMeja', TFrmMasterMeja, FrmMasterMeja);
  FrmMasterMeja.ShowModal;
  InisialisasiTVMeja;
end;

procedure TFrmMain.BackupDatabase1Click(Sender: TObject);
begin
  ActivateForm('FrmBackupRestoreDB', TFrmBackupRestoreDB, FrmBackupRestoreDB);
  FrmBackupRestoreDB.ShowModal;
end;

procedure TFrmMain.eBayarEnter(Sender: TObject);
begin
  eBayar.SelectAll;
end;

procedure TFrmMain.ShutdownsWindows1Click(Sender: TObject);
begin
  if MessageDlg('matikan komputer ?',
    mtConfirmation, [mbYes] + [mbNo], 0) = MrYes then
    WindowsExit(EWX_POWEROFF or EWX_FORCE)
end;

procedure TFrmMain.LockDesktop1Click(Sender: TObject);
begin
  dm.sSkinManager1.Active := false;
  ActivateForm('FrmLockDesktop', TFrmLockDesktop, FrmLockDesktop);
  FrmLockDesktop.ShowModal;
end;

procedure TFrmMain.RefreshTemp_pendapatan(id_meja, i_edited: integer);
var
  CurrIdSatuan, i: integer;
begin
  dm.ExecSQL('delete from temp_pendapatan where id_meja = %d', [id_meja],
    dm.mySQLQuery1);

{$IFNDEF USE_BAHAN_PEMBENTUK}
{$ELSE}
  {*[+] sep 01 2010
  bahan pembentuk*}
  dm.ExecSQL('delete from temp_bahanpembentuk where id_meja = %d', [Id_Meja],
    dm.mySQLQuery1);
{$ENDIF}
  for i := 0 to Grid.RowCount - 1 do
  begin
    if Grid.Cell[2, i].AsFloat > 0 then
    begin
      CurrIdSatuan := GetIdSatuan(grid.Cell[1, i].AsString);
      DecimalSeparator := '.';
      dm.ExecSQL(
        'insert into temp_pendapatan'#13 +
        '      (id_meja,id_menu,harga_satuan,banyak,'#13 +
        '       keterangan,isEditedItem,id_satuan)'#13 +
        'values(%d,%d,%d,%f,"%s",%d,%d)',
        [id_meja,
        grid.Cell[0, i].AsInteger,
          grid.Cell[4, i].AsInteger,
          grid.Cell[2, i].AsFloat,
          grid.Cell[6, i].AsString,
          i_edited, currIdSatuan], dm.MySQLQuery1);
{$IFNDEF USE_BAHAN_PEMBENTUK}
{$ELSE}
      {____________________bahan pembentuk}
      dm.ExecSQL(
        'select id_menu,id_subjenismenu,'#13 +
        '       banyak,id_satuan,'#13 +
        '       func_GetPengaliBahanPembentuk(%d,%d)'#13 +
        'from data_menus_bahanpembentuk'#13 +
        'where id_menu = %d',
        [grid.Cell[0, i].AsInteger,
        id_Meja,
          grid.Cell[0, i].AsInteger], dm.mySQLQuery1);

      dm.mySQLQuery1.First;
      while not dm.mySQLQuery1.Eof do
      begin
        dm.ExecSQL(
          'insert into temp_bahanpembentuk'#13 +
          '  (id_meja,id_menu,id_subjenismenu,'#13 +
          '   banyak,id_Satuan,isEditedItem)'#13 +
          'values(%d,%d,%d,%f,%d,%d)',
          [Id_Meja,
          dm.mySQLQuery1.Fields[0].AsInteger, //id_menu
          dm.mySQLQuery1.Fields[1].AsInteger, //id_subjenismenu
          (dm.mySQLQuery1.Fields[2].AsFloat *
            dm.mySQLQuery1.Fields[4].AsFloat), //banyak
          dm.mySQLQuery1.Fields[3].AsInteger, //id_satuan
          i_edited], dm.mySQLQuery2);

        dm.mySQLQuery1.Next;
      end;
{$ENDIF}
      DecimalSeparator := ',';
    end;
  end;

end;

procedure TFrmMain.eBanyakKeyPress(Sender: TObject; var Key: Char);
var
  iId: integer;
  myNode: TTreeNode;
  iEdited: integer;
  iIdMeja: integer;
  f: double;
  iIdSubJenisMenu: integer;
begin
  inherited KeyPress(Key);
  if key = #13 then
  begin
    if not TryStrToFloat(eBanyak.Text, f) then
    begin
      MessageDlg('periksa banyak Items', mtError, [mbOK], 0);
      Exit;
    end;

    if trim(cmbCari.Text) = EmptyStr then
    begin
      cmbCari.Text := EmptyStr;
      cmbCari.SetFocus;
      eBanyak.Clear;
      Exit;
    end;
    iId := GetId_1(cmbCari.Text);
    if iId = -1 then
    begin
      iId := GetId_2(cmbCari.Text);
      if iId = -1 then
      begin
        iId := GetId_3(cmbCari.Text);
        if iId = -1 then
        begin
          MessageDlg('Nama Items ini tidak ada!', mtInformation, [mbOK], 0);
          cmbCari.SetFocus;
          eBanyak.Clear;
          Exit;
        end;
      end;
    end;
    if trim(eBanyak.Text) = EmptyStr then
    begin
      MessageDlg('banyak item tidak boleh kosong', mtWarning, [mbOK], 0);
      Exit;
    end;

    {cek stok
cari id, trus cari id_subjenismenu nya
apakah termasuk stok ?            }

    dm.ExecSQL(
      'select id from data_subjenismenu'#13 +
      'where id = (select id_subjenismenu'#13 +
      '            from data_menus'#13 +
      '				where id  = %d) and is_stok = 1', [iId], dm.mySQLQuery1);
    if dm.mySQLQuery1.RecordCount > 0 then
    begin
      iIdSubJenisMenu := dm.mySQLQuery1.Fields[0].AsInteger;
      ShortDateFormat := 'yyyy-MM-dd';
      dm.ExecSQL(
        'select func_GetStokMasuk("%s",%d),func_GetStokPenambahan("%s",%d),'#13 +
        '       func_GetStokKeluar("%s",%d),func_GetStokPengurangan("%s",%d)',
        [DateToStr(NOW), iIdSubJenisMenu,
        DateToStr(NOW), iIdSubJenisMenu,
          DateToStr(NOW), iIdSubJenisMenu,
          DateToStr(NOW), iIdSubJenisMenu], dm.mySQLQuery2);

      if (dm.mySQLQuery2.Fields[0].AsFloat +
        dm.mySQLQuery2.Fields[1].AsFloat) <=
        (dm.mySQLQuery2.Fields[2].AsFloat +
        dm.mySQLQuery2.Fields[3].AsFloat) then
      begin
        ShortDateFormat := 'dd-MM-yyyy';
        if not bAcceptRunOut then
        begin
          MessageDlg('Stok untuk Item ini sudah habis', mtWarning, [mbOK], 0);
          Exit;
        end;
      end;
    end;
    ShortDateFormat := 'dd-MM-yyyy';

    ChangeBanyakBasedOnMenuID(iId, StrToFloat(eBanyak.Text));
    lblNama_Barcode.Caption := EmptyStr;
    myNode := tvMeja.Selected;
    if bIsEdit then
      iEdited := 1
    else
      iEdited := 0;

    if myNode.Text <> PENJUALAN_LANGSUNG then
    begin
      iIdMeja := GetIdMeja(myNode.Text);
      RefreshTemp_pendapatan(iIdMeja, iEdited);
    end
    else
    begin
      RefreshTemp_pendapatan(0, iEdited);
    end;
    ReCalculateTotal;

    cmbCari.Text := EmptyStr;
    cmbCari.SetFocus;
    eBanyak.Clear;
    tvMejaChange(Sender, myNode);
  end;

  if key = #44 then
  else if (key <> #8) then
    if (key < '0') or (key > '9') then
      key := #0;
end;

procedure TFrmMain.eBanyakEnter(Sender: TObject);
begin
  eBanyak.SelectAll;
end;

procedure TFrmMain.MasterJenis1Click(Sender: TObject);
var
  myNode: TTreeNode;
begin
  ActivateForm('FrmListJenisMenu', TFrmListJenisMenu, FrmListJenisMenu);
  FrmListJenisMenu.ShowModal;

  if tvMeja.SelectionCount = 0 then
    Exit;
  grid.ClearRows;
  myNode := tvMeja.Selected;
  tvMejaChange(sender, myNode);
end;

procedure TFrmMain.GantiPassword1Click(Sender: TObject);
begin
  ActivateForm('FrmGantiPassword', TFrmGantiPassword, FrmGantiPassword);
  FrmGantiPassword.ShowModal;
end;

procedure TFrmMain.Stok1Click(Sender: TObject);
begin
  ActivateForm('FrmReportParam', TFrmReportParam,
    FrmReportParam);
  DM.RPT_ID := RPT_STOK;
  FrmReportParam.ShowModal;
end;

procedure TFrmMain.lblPendapatanClick(Sender: TObject);
begin
  ActivateForm('FrmHistoryPendapatan', TFrmHistoryPendapatan,
    FrmHistoryPendapatan);
  FrmHistoryPendapatan.ShowModal;
  btnRefreshInfoClick(sender);
end;

procedure TFrmMain.lblPengeluaranClick(Sender: TObject);
begin
  ActivateForm('FrmCatatanPengeluaran_1', TFrmCatatanPengeluaran_1,
    FrmCatatanPengeluaran_1);
  FrmCatatanPengeluaran_1.ShowModal;
  btnRefreshInfoClick(sender);
end;

procedure TFrmMain.btnBatalClick(Sender: TObject);
var
  myNode: TTreeNode;
begin
  dm.ExecSQL('delete from temp_pendapatan where isEditedItem = 1', [],
    dm.mySQLQuery1);
  grid.ClearRows;
  LoadAllMenu;
  eBayar.Clear;
  eDiscount.Text := '0';
  myNode := tvMeja.Selected;
  BoldTreeNode(myNode, False);
  tvMeja.Enabled := True;
  bIsEdit := False;
  btnRefreshInfoClick(Sender);
  ReCalculateTotal;
  btnBatal.Visible := False;
end;

procedure TFrmMain.Stok2Click(Sender: TObject);
begin
  DM.frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
    '\report\' + RPT_STOK_FILES);
  dm.CalenderText := EmptyStr;
  dm.frxReport.DesignReport;
end;

procedure TFrmMain.PengeluaranuntukBahanUtamaNONBarcode1Click(
  Sender: TObject);
begin
  ActivateForm('FrmCatatanPembelianBahanUtama', TFrmCatatanPembelianBahanUtama,
    FrmCatatanPembelianBahanUtama);
  FrmCatatanPembelianBahanUtama.ShowModal;
  btnRefreshInfoClick(Sender);
end;

procedure TFrmMain.MasterSubJenis1Click(Sender: TObject);
var
  myNode: TTreeNode;
begin
  ActivateForm('FrmMasterMenu_2_Barcode', TFrmMasterMenu_2_Barcode,
    FrmMasterMenu_2_Barcode);
  FrmMasterMenu_2_Barcode.ShowModal;
  if tvMeja.SelectionCount = 0 then
    Exit;
  myNode := tvMeja.Selected;
  tvMejaChange(sender, myNode);
  FillCmbCari;
end;

procedure TFrmMain.cmbCariChange(Sender: TObject);
var
  iId: integer;
begin
  //__cari barcode jika ada
  lblNama_Barcode.Caption := EmptyStr;
  if cmbCari.Text = EmptyStr then
    Exit;
  iId := GetId_1(cmbCari.Text);
  if iId = -1 then
  begin
    iId := GetId_2(cmbCari.Text);
    if iId = -1 then
    begin
      iId := GetId_3(cmbCari.Text);
      if iId = -1 then
        Exit;
    end;
  end;

  if IsStrANumber(trim(cmbCari.Text)) then
  begin
    dm.ExecSQL('select nama from data_menus where id = %d ', [iId],
      dm.mySQLQuery1);
    lblNama_Barcode.Caption := dm.mySQLQuery1.Fields[0].AsString;
    //eBanyak.SetFocus;
  end
  else
  begin
    dm.ExecSQL(
      'select barcode from data_menus where id = %d', [iId],
      dm.mySQLQuery1);
    lblNama_Barcode.Caption := dm.mySQLQuery1.Fields[0].AsString;
  end;

  //__ cari nama
  bAcceptRunOut := False;
end;

procedure TFrmMain.penguranganStok1Click(Sender: TObject);
begin
  ActivateForm('FrmPerubahanStok', TFrmPerubahanStok, FrmPerubahanStok);
  FrmPerubahanStok.ShowModal;
end;

procedure TFrmMain.PendapatanBualanan1Click(Sender: TObject);
begin
  ActivateForm('FrmReportParam', TFrmReportParam,
    FrmReportParam);
  DM.RPT_ID := RPT_PENDAPATAN_BULANAN;
  FrmReportParam.ShowModal;
end;

procedure TFrmMain.Pengeluaran2Click(Sender: TObject);
begin
  ActivateForm('FrmReportParam', TFrmReportParam,
    FrmReportParam);
  DM.RPT_ID := RPT_PENGELUARAN_BULANAN;
  FrmReportParam.ShowModal;
end;

procedure TFrmMain.PendapatanBulanan1Click(Sender: TObject);
begin
  dm.frxReport.LoadFromFile(
    ExtractFilePath(Application.ExeName) + '\report\' +
    RPT_PENDAPATAN_BULANAN_FILE);
  dm.CalenderText := EmptyStr;
  dm.frxReport.DesignReport;
end;

procedure TFrmMain.PengeluaranBulanan1Click(Sender: TObject);
begin
  dm.frxReport.LoadFromFile(
    ExtractFilePath(Application.ExeName) + '\report\' +
    RPT_PENGELUARAN_BULANAN_FILE);
  dm.CalenderText := EmptyStr;
  dm.frxReport.DesignReport;
end;

procedure TFrmMain.BahanDapur1Click(Sender: TObject);
begin
  ActivateForm('FrmMasterBumbuDapur', TFrmMasterBumbuDapur,
    FrmMasterBumbuDapur);
  FrmMasterBumbuDapur.ShowModal;
end;

procedure TFrmMain.utupBukuHarian1Click(Sender: TObject);
var
  iId: Integer;
begin
  if DM.bTutupBukuHariIni then
  begin
    //jika sudah tutup buku, maka rollback
    if MessageDlg(
      'Apakah anda ingin Rollback tutup buku untuk hari ini ?'#13 +
      'data tutup buku dan modal dari tutup buku hari ini akan dihapus!'#13 +
      'anda ingin melanjutkan ?', mtWarning, [mbYes] + [mbNo], 0) <> mrYes then
      Exit;
    ShortDateFormat := 'dd-MM-yyyy';

    dm.ExecSQL(
      'select id from data_tutupbuku where tgl="%s"',
      [MySQLDateFormat(DateToStr(NOW))], dm.mySQLQuery1);
    iId := dm.mySQLQuery1.Fields[0].AsInteger;
    dm.ExecSQL('delete from data_tutupbuku where id = %d', [iId],
      dm.mySQLQuery1);
    dm.ExecSQL('delete from data_modal where id_tutupbuku = %d', [iId],
      dm.mySQLQuery1);
    dm.bTutupBukuHariIni := False;

  end
  else
  begin
    //jika belum tutup buku, maka
    ActivateForm('FrmTutupBukuHarianr', TFrmTutupBukuHarian,
      FrmTutupBukuHarian);
    FrmTutupBukuHarian.ShowModal;
    //apakah user melakukan tutup buku ?
    //if dm.bTutupBukuHariIni then
    //   LockMenuRelatedToPendapatan;
  end;

  if dm.bTutupBukuHariIni then
  begin
    LockMenuRelatedToPendapatan;
    utupBukuHarian1.Checked := True;
  end
  else
  begin
    UnLockMenuRelatedToPendapatan;
    utupBukuHarian1.Checked := False;
  end;
end;

procedure TFrmMain.utupBuku1Click(Sender: TObject);
begin
  ActivateForm('FrmReportParam', TFrmReportParam,
    FrmReportParam);
  DM.RPT_ID := RPT_TUTUP_BUKU_HARIAN;
  FrmReportParam.ShowModal;
end;

procedure TFrmMain.utupBukuHarian2Click(Sender: TObject);
begin
  dm.frxReport.LoadFromFile(
    ExtractFilePath(Application.ExeName) + '\report\' +
    RPT_TUTUP_BUKU_HARIAN_FILE);
  dm.CalenderText := EmptyStr;
  dm.frxReport.DesignReport;
end;

procedure TFrmMain.Editbahanpembentuk1Click(Sender: TObject);
var
  iIdMeja: integer;
  myNode: TTreeNode;
begin
  if tvMeja.SelectionCount = 0 then
    Exit;
  myNode := tvMeja.Selected;

  if myNode.Text <> PENJUALAN_LANGSUNG then
    iIdMeja := GetIdMeja(myNode.Text)
  else
    iIdMeja := 0;

  ActivateForm('TFrmBahanPembentuk', TFrmBahanPembentuk,
    FrmBahanPembentuk);
  FrmBahanPembentuk.CalledFrom := 1;
  FrmBahanPembentuk.iIdMeja := iIdMeja;
  FrmBahanPembentuk.iIdMenuRef := grid.Cell[0, grid.SelectedRow].AsInteger;
  FrmBahanPembentuk.ShowModal;
end;

procedure TFrmMain.eDiscountKeyPress(Sender: TObject; var Key: Char);
begin
  inherited KeyPress(Key);
  if key = #13 then
  begin
    ReCalculateTotal;
    eBayar.SetFocus;
    exit;
  end;

  if (key <> #8) then
    if (key < '0') or (key > '9') then
      key := #0;
end;

procedure TFrmMain.eDiscountEnter(Sender: TObject);
begin
  eDiscount.SelectAll;
end;

procedure TFrmMain.eDiscountExit(Sender: TObject);
begin
  ReCalculateTotal;
end;

procedure TFrmMain.btnOKClick(Sender: TObject);
var
  tgl: TStringDynArray;
  strDate, strMonth, strYear,
    CurrTgl: string;
  i: Integer;
begin
  ShortDateFormat := 'dd-MM-yyyy';
  tgl := Explode('-', DateToStr(NOW));
  strDate := tgl[0];
  strMonth := tgl[1];
  strYear := tgl[2];

  if cbReport.Text = 'Pendapatan Harian' then
  begin
    with dm.mySQLQueryPendapatan, frxReport1 do
    begin
      LoadFromFile(ExtractFilePath(Application.ExeName) +
        '\report\' + RPT_PENDAPATAN_FILES);
      Close;
      //ShortDateFormat := 'yyyy-MM-dd';
      params[0].AsString := strYear + '-' + strMonth + '-' + strdate;
      Active := true;
      PrepareReport();
    end;
  end
  else if cbReport.Text = 'Pendapatan Bulanan' then
  begin
    with Dm.mySQLQueryPendapatanBulanan, frxReport1 do
    begin
      LoadFromFile(ExtractFilePath(Application.ExeName) +
        '\report\' + RPT_PENDAPATAN_BULANAN_FILE);
      Close;
      params[0].Value := strMonth; //IntToStr(cmbbulan.ItemIndex + 1);
      params[1].Value := strYear; //eTahun.Text;
      Active := true;

      PrepareReport();
    end;
  end
  else if cbReport.Text = 'Pengeluaran Harian' then
  begin
    frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName) +
      '\report\' + RPT_PENGELUARAN_FILES);

    dm.mySQLQueryItems.Close;
    dm.mySQLQueryModalTerakhir.Close;
    dm.mySQLQuerymodalawal.Close;

    dm.mySQLQueryItems.Params[0].AsString :=
      strYear + '-' + strMonth + '-' + strDate;
    dm.mySQLQueryModalTerakhir.Params[0].AsString :=
      strYear + '-' + strMonth + '-' + strDate;
    dm.mySQLQuerymodalawal.Params[0].AsString :=
      strYear + '-' + strMonth + '-' + strDate;

    dm.mySQLQueryModalTerakhir.Params[1].AsString :=
      strYear + '-' + strMonth + '-' + strdate;
    dm.mySQLQuerymodalawal.Params[1].AsString :=
      strYear + '-' + strMonth + '-' + strDate;

    dm.mySQLQueryItems.Active := True;
    dm.mySQLQueryModalTerakhir.Active := True;
    dm.mySQLQuerymodalawal.Active := True;

    DecimalSeparator := ',';

    frxReport1.PrepareReport();
  end
  else if cbReport.Text = 'Pengeluaran Bulanan' then
  begin
    with DM.mySQLQueryPengeluaranBulanan, frxReport1 do
    begin
      LoadFromFile(ExtractFilePath(Application.ExeName) +
        '\report\' + RPT_PENGELUARAN_BULANAN_FILE);

      Close;
      params[0].Value := strMonth;
      params[1].Value := strYear;
      Open;
      PrepareReport();

    end
  end
  else if cbReport.Text = 'Rugi/Laba' then
  begin
    dm.ExecSQL('delete from temp_report_3', [], dm.mySQLQuery1);

    for i := 1 to DaysInAMonth(StrToInt(strYear), StrToInt(strMonth)) do
    begin
      CurrTgl :=
        strYear + '-' +
        strMonth + '-' +
        IntToStr(i);
      dm.ExecSQL(
        'select func_GetPengeluaran("%s"),func_GetPendapatan("%s")',
        [CurrTgl, CurrTgl], dm.mySQLQuery2);
      dm.ExecSQL(
        'insert into temp_report_3 (tgl,pengeluaran,pendapatan) values("%s",%d,%d)',
        [CurrTgl,
        dm.mySQLQuery2.Fields[0].AsInteger,
          dm.mySQLQuery2.Fields[1].AsInteger], dm.mySQLQuery1);
    end;

    dm.mySQLQueryPerubahanStok.Close;
    dm.mySQLQueryPerubahanStok.Params[0].AsString := strMonth;
    dm.mySQLQueryPerubahanStok.Params[1].AsString := strYear;
    dm.mySQLQueryPerubahanStok.Open;

    with dm.mySQLQueryProsentase, frxReport1 do
    begin
      LoadFromFile(ExtractFilePath(Application.ExeName) +
        '\report\' + RPT_PROSENTASE_FILE);
      Close;
      Active := true;
      ThousandSeparator := '.';
      PrepareReport();
    end;
  end
  else if cbReport.Text = 'Stok' then
  begin
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
    while not dm.mySQLQuery1.Eof do
    begin
      CurrTgl := strYear + '-' + strMonth + '-' + strDate;
      dm.ExecSQL(
        'select func_GetStokMasuk("%s",%d),'#13 +
        '       func_GetStokKeluar("%s",%d),'#13 +
        '       func_GetStokPengurangan("%s",%d),'#13 +
        '       func_GetStokPenambahan("%s",%d)',
        [CurrTgl, dm.mySQLQuery1.Fields[0].AsInteger,
        CurrTgl, dm.mySQLQuery1.Fields[0].AsInteger,
          CurrTgl, dm.mySQLQuery1.Fields[0].AsInteger,
          CurrTgl, dm.mySQLQuery1.Fields[0].AsInteger], dm.mySQLQuery3);

      dm.ExecSQL(
        'insert into temp_report_stok(id_subjenismenu,'#13 +
        '                             nama_items,'#13 +
        '                             nama_satuan,'#13 +
        '                             stok_masuk,'#13 +
        '                             stok_keluar,'#13 +
        '                             pengurangan_stok,'#13 +
        '                             penambahan_stok,'#13 +
        '                             sort)'#13 +
        'values(%d,"%s","%s",%f,%f,%f,%f,%d)',
        [dm.mySQLQuery1.Fields[0].AsInteger,
        dm.mySQLQuery1.Fields[1].AsString,
          dm.mySQLQuery1.Fields[2].AsString,
          dm.mySQLQuery3.Fields[0].AsFloat,
          dm.mySQLQuery3.Fields[1].AsFloat,
          dm.mySQLQuery3.Fields[2].AsFloat,
          dm.mySQLQuery3.Fields[3].AsFloat,
          dm.mySQLQuery1.Fields[3].AsInteger], dm.mySQLQuery2);
      dm.mySQLQuery1.Next;
    end;

    DecimalSeparator := ',';
    frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName) +
      '\report\' + RPT_STOK_FILES);
    dm.mySQLQueryPerubahanStok.Close;
    dm.mySQLQueryPerubahanStok.Params[0].AsString := strMonth;
    //      IntToStr(cmbbulan.ItemIndex + 1);
    dm.mySQLQueryPerubahanStok.Params[1].AsString := strYear; //eTahun.Text;
    dm.mySQLQueryPerubahanStok.Open;

    dm.mySQLQueryStok.Close;
    dm.mySQLQueryStok.Active := True;
    frxReport1.PrepareReport();
  end
  else
    MessageDlg('Silahkan pilih menu report yang tersedia',
      mtWarning, [mbOK], 0);
end;

procedure TFrmMain.btnPrintClick(Sender: TObject);
begin
  frxPreview1.Print;
end;

procedure TFrmMain.frxReport1BeforePrint(Sender: TfrxReportComponent);
var
  strQry: string;
  tgl: TStringDynArray;
  strDate, strMonth, strYear: string;
begin
  ShortDateFormat := 'dd-MM-yyyy';
  tgl := Explode('-', DateToStr(NOW));
  strDate := tgl[0];
  strMonth := tgl[1];
  strYear := tgl[2];

  if cbReport.Text = 'Pengeluaran Bulanan' then
  begin
    strQry :=
      'select (sum(COALESCE(besar,0))-(select COALESCE(sum(banyak * harga_satuan),0)'#13 +
      '                                from data_pengeluaran'#13 +
      '                                where month(tgl) <= %d and'#13 +
      '           							       year(tgl) <= %d)) as modal'#13 +
      'from data_modal'#13 +
      'where month(tgl) <= %d and'#13 +
      '      year(tgl) <= %d';

    dm.mySQLQueryPengeluaranBulanan.Params[0].AsString := strMonth;
    DM.mySQLQueryPengeluaranBulanan.Params[1].AsString := strYear;

    if (sender.Name) = 'memolastmodal' then
    begin
      dm.ExecSQL(strQry,
        [StrToInt(strMonth),
        StrToInt(strYear),
          StrToInt(strMonth),
          StrToInt(strYear)], dm.mySQLQuery1);
      if dm.mySQLQuery1.Fields[0].AsString = '' then
        (sender as TfrxCustomMemoView).Text := 'Rp.0'
      else
        (sender as TfrxCustomMemoView).Text :=
          'Rp.' + FormatRp(dm.mySQLQuery1.Fields[0].AsString);
    end;

  end;
end;

procedure TFrmMain.btnRefreshClick(Sender: TObject);
begin
  btnRefreshInfoClick(Sender);
  if cbReport.Text = EmptyStr then
    Exit;
  btnOKClick(sender);
end;

procedure TFrmMain.PerubahanStok1Click(Sender: TObject);
begin
  ActivateForm('FrmReportParam', TFrmReportParam,
    FrmReportParam);
  DM.RPT_ID := RPT_PERUBAHAN_STOK;
  FrmReportParam.ShowModal;
end;

procedure TFrmMain.PerubahanStok2Click(Sender: TObject);
begin
  DM.frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
    '\report\' + RPT_PERUBAHAN_STOK_FILE);
  dm.CalenderText := EmptyStr;
  dm.frxReport.DesignReport;
end;

procedure TFrmMain.Modal1Click(Sender: TObject);
begin
  ActivateForm('FrmReportParam', TFrmReportParam,
    FrmReportParam);
  DM.RPT_ID := RPT_MODAL;
  FrmReportParam.ShowModal;
end;

procedure TFrmMain.Modal2Click(Sender: TObject);
begin
  dm.frxReport.LoadFromFile(
    ExtractFilePath(Application.ExeName) + '\report\' + RPT_MODAL_FILE);
  dm.CalenderText := EmptyStr;
  dm.frxReport.DesignReport;
end;

procedure TFrmMain.ePajakKeyPress(Sender: TObject; var Key: Char);
begin
  //  inherited KeyPress(Key);
  //  if key = #13 then
  //  begin
  //    ReCalculateTotal;
  //    eBayar.SetFocus;
  //    exit;
  //  end;
  //
  //  if (key <> #8) then
  //    if (key < '0') or (key > '9') then
  //      key := #0;
end;

procedure TFrmMain.SPTPD1Click(Sender: TObject);
begin
  ActivateForm('FrmReportParam', TFrmReportParam,
    FrmReportParam);
  DM.RPT_ID := RPT_SPTPD;
  FrmReportParam.ShowModal;
end;

procedure TFrmMain.SPTPD2Click(Sender: TObject);
begin
  dm.frxReport.LoadFromFile(
    ExtractFilePath(Application.ExeName) + '\report\' +
    RPT_SPTPD_FILE);
  dm.CalenderText := EmptyStr;
  dm.frxReport.DesignReport;
end;

procedure TFrmMain.SSPDSuratSetoranPajakDaerah1Click(Sender: TObject);
begin
  ActivateForm('FrmReportParam', TFrmReportParam,
    FrmReportParam);
  DM.RPT_ID := RPT_SSPD;
  FrmReportParam.ShowModal;
end;

procedure TFrmMain.SSPD1Click(Sender: TObject);
begin
  dm.frxReport.LoadFromFile(
    ExtractFilePath(Application.ExeName) + '\report\' +
    RPT_SSPD_FILE);
  dm.CalenderText := EmptyStr;
  dm.frxReport.DesignReport;
end;

procedure TFrmMain.RekapitulasiPenjualan1Click(Sender: TObject);
begin
  ActivateForm('FrmReportParam', TFrmReportParam,
    FrmReportParam);
  DM.RPT_ID := RPT_REKAP_PENJUALAN;
  FrmReportParam.ShowModal;
end;

procedure TFrmMain.RekapPenjualan1Click(Sender: TObject);
begin
  dm.frxReport.LoadFromFile(
    ExtractFilePath(Application.ExeName) + '\report\' +
    RPT_REKAP_PENJUALAN_FILE);
  dm.CalenderText := EmptyStr;
  dm.frxReport.DesignReport;
end;

procedure TFrmMain.InfoHariini1Click(Sender: TObject);
begin
  sPanel5.Visible := not InfoHariini1.Checked;
  InfoHariini1.Checked := not InfoHariini1.Checked;
end;

procedure TFrmMain.Search1Click(Sender: TObject);
begin
  ActivateForm('FrmPencarian', TFrmPencarian,
    FrmPencarian);
  FrmPencarian.ShowModal;
  if FrmPencarian.grid.SelectedCount = 0 then
    Exit;
  cmbCari.Text := FrmPencarian.grid.Cell[0,
    FrmPencarian.grid.SelectedRow].AsString;
  cmbCari.SetFocus;
end;

end.

