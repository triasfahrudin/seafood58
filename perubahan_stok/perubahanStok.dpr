program perubahanStok;

uses
  Forms,
  uFrmPerubahanStok in '..\uFrmPerubahanStok.pas' {FrmPerubahanStok},
  uDM in 'uDM.pas' {DM: TDataModule},
  uFrmLogin in 'uFrmLogin.pas' {FrmLogin},
  uLibrary in 'uLibrary.pas',
  uFrmMySQLSettings in '..\uFrmMySQLSettings.pas' {FrmMySQLSettings},
  uFrmNeedAuthorization in '..\uFrmNeedAuthorization.pas' {FrmNeedAuthorization},
  uSubWCRev in '..\uSubWCRev.pas',
  uFrmLockDesktop in '..\uFrmLockDesktop.pas' {FrmLockDesktop},
  DisableWinKeys in '..\DisableWinKeys.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Sea Food 58';
  Application.CreateForm(TDM, DM);
  //Application.CreateForm(TFrmMySQLSettings, FrmMySQLSettings);
  //Application.CreateForm(TFrmNeedAuthorization, FrmNeedAuthorization);
  //Application.CreateForm(TFrmLockDesktop, FrmLockDesktop);
  with TFrmLogin.Create(nil) do
  try
    if ShowModal <> 1 then
    begin
      DM.Free;
      exit;
    end;
    Application.CreateForm(TFrmPerubahanStok, FrmPerubahanStok);
  finally
    Free;
  end;
  Application.Run;
end.