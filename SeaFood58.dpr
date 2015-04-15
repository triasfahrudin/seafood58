program SeaFood58;

uses
  ExceptionLog,
  Forms,
  Windows,
  dialogs,
  uFrmMain in 'uFrmMain.pas' {FrmMain},
  uDM in 'uDM.pas' {DM: TDataModule},
  uLibrary in 'uLibrary.pas',
  uFrmLogin in 'uFrmLogin.pas' {FrmLogin},
  uFrmMySQLSettings in 'uFrmMySQLSettings.pas' {FrmMySQLSettings},
  uFrmSettings in 'uFrmSettings.pas' {FrmSettings},
  uFrmLockDesktop in 'uFrmLockDesktop.pas' {FrmLockDesktop},
  DisableWinKeys in 'DisableWinKeys.pas',
  uFrmPendapatanLain in 'uFrmPendapatanLain.pas' {FrmPendapatanLain},
  uFrmListJenisMenu in 'uFrmListJenisMenu.pas' {FrmListJenisMenu},
  uFrmUangKembalian in 'uFrmUangKembalian.pas' {FrmUangKembalian},
  uFrmNeedAuthorization in 'uFrmNeedAuthorization.pas' {FrmNeedAuthorization},
  uSubWCRev in 'uSubWCRev.pas',
  uFrmAbout in 'uFrmAbout.pas' {FrmAbout},
  uFrmListJenisSatuan in 'uFrmListJenisSatuan.pas' {FrmListJenisSatuan},
  uFrmHistoryPendapatan in 'uFrmHistoryPendapatan.pas' {FrmHistoryPendapatan},
  uFrmListSubJenisMenu in 'uFrmListSubJenisMenu.pas' {FrmListSubJenisMenu},
  uFrmModalAwal in 'uFrmModalAwal.pas' {FrmModalAwal},
  uFrmCatatanPengeluaran_1 in 'uFrmCatatanPengeluaran_1.pas'
  {FrmCatatanPengeluaran_1},
  uFrmSatuanKonversi in 'uFrmSatuanKonversi.pas' {FrmSatuanKonversi},
  uFrmMasterEmployees_1 in 'uFrmMasterEmployees_1.pas' {FrmMasterEmployees_1},
  uFrmMasterMenu_2 in 'uFrmMasterMenu_2.pas' {FrmMasterMenu_2},
  uFrmCatatanPembelianBahanUtama in 'uFrmCatatanPembelianBahanUtama.pas'
  {FrmCatatanPembelianBahanUtama},
  uFrmReportParam in 'uFrmReportParam.pas' {FrmReportParam},
  uFrmMasterMeja in 'uFrmMasterMeja.pas' {FrmMasterMeja},
  uFrmBackupRestoreDB in 'uFrmBackupRestoreDB.pas' {FrmBackupRestoreDB},
  uFrmPrivilege in 'uFrmPrivilege.pas' {FrmPrivilege},
  uFrmGantiPassword in 'uFrmGantiPassword.pas' {FrmGantiPassword},
  uFrmMasterMenu_2_Barcode in 'uFrmMasterMenu_2_Barcode.pas'
  {FrmMasterMenu_2_Barcode},
  uFrmPerubahanStok in 'uFrmPerubahanStok.pas' {FrmPerubahanStok},
  uFrmMasterBumbuDapur in 'uFrmMasterBumbuDapur.pas' {FrmMasterBumbuDapur},
  uFrmBahanPembentuk in 'uFrmBahanPembentuk.pas' {FrmBahanPembentuk},
  uFrmTutupBukuHarian in 'uFrmTutupBukuHarian.pas' {FrmTutupBukuHarian},
  uFrmPembelianKredit in 'uFrmPembelianKredit.pas' {FrmPembelianKredit},
  uFrmPencarian in 'uFrmPencarian.pas' {FrmPencarian};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Sea Food 58';
  Application.CreateForm(TDM, DM);
  with TFrmLogin.Create(nil) do
  try
    if ShowModal <> 1 then
    begin
      DM.Free;
      exit;
    end;
    Application.CreateForm(TFrmMain, FrmMain);
  finally
    Free;
  end;
  Application.Run;

end.

