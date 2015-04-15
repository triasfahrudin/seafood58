unit uFrmLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sSkinProvider, ExtCtrls, StdCtrls, sLabel, sButton,
  sEdit, Mask, sMaskEdit, Menus, frxpngimage, sCheckBox;

type
  TFrmLogin = class(TForm)
    sLabelFX1: TsLabelFX;
    sLabelFX2: TsLabelFX;
    eName: TsEdit;
    btnOK: TsButton;
    btnCancel: TsButton;
    sWebLabel1: TsWebLabel;
    sWebLabel2: TsWebLabel;
    sWebLabel3: TsWebLabel;
    img1: TImage;
    ePasswd: TsMaskEdit;
    Bevel1: TBevel;
    Label1: TLabel;
    sSkinProvider1: TsSkinProvider;
    cbViewerMode: TsCheckBox;
    procedure sWebLabel2Click(Sender: TObject);
    procedure sWebLabel1Click(Sender: TObject);
    procedure sWebLabel3Click(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure ePasswdKeyPress(Sender: TObject; var Key: Char);
    procedure eNameKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure cbViewerModeClick(Sender: TObject);
  private

  public

    bDtModulCreated: Boolean;
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

{$DEFINE TEST}

uses
  uDM, uFrmLockDesktop, uLibrary, uFrmMySQLSettings, DB, uSubWCRev;

procedure TFrmLogin.sWebLabel2Click(Sender: TObject);
begin
  if not bDtModulCreated then
  begin
    if not DM.OpenConnection then
    begin
      ModalResult := mrCancel;
      exit;
    end;
    bDtModulCreated := true;
  end;

  DM.ExecSQL(
    'SELECT id,nama,password FROM data_pegawai'#13 +
    'WHERE nama LIKE "%s" limit 1', [eName.Text], DM.mySQLQuery1);

  if (DM.mySQLQuery1.Fields[0].AsInteger = 0) or
    (DM.mySQLQuery1.Fields[2].AsString <> ePasswd.Text) then
  begin
    Application.MessageBox(
      'Diperlukan Nama dan Password'#13 +
      'yang valid untuk Lock Desktop ...',
      'Lock Desktop', MB_OK + MB_ICONSTOP);
    exit;
  end;

  DM.sAPPPasswd := ePasswd.Text;

  DM.iAPPid := dm.mySQLQuery1.Fields[0].AsInteger;
  DM.sAPPUser := eName.Text;

  dm.sSkinManager1.Active := false;
  ActivateForm('FrmLockDesktop', TFrmLockDesktop, FrmLockDesktop);
  FrmLockDesktop.ShowModal;
end;

procedure TFrmLogin.sWebLabel1Click(Sender: TObject);
begin
  if MessageDlg('matikan komputer ?',
    mtConfirmation, [mbYes] + [mbNo], 0) = MrYes then
    WindowsExit(EWX_POWEROFF or EWX_FORCE)
end;

procedure TFrmLogin.sWebLabel3Click(Sender: TObject);
begin
  ActivateForm('FrmMySQLSettings', TFrmMySQLSettings, FrmMySQLSettings);
  FrmMySQLSettings.ShowModal;
end;

procedure TFrmLogin.btnOKClick(Sender: TObject);
begin
  if not bDtModulCreated then
  begin
    if not DM.OpenConnection then
    begin
      ModalResult := mrCancel;
      exit;
    end;
    bDtModulCreated := true;
  end;
  dm.mySQLDatabase1.Execute('SET @@global.max_sp_recursion_depth=255');
  dm.mySQLDatabase1.Execute('SET @@session.max_sp_recursion_depth=255');

  dm.ExecSQL(
    'select nama'#13 +
    'from data_pegawai'#13 +
    'where isActive = 0  and nama = "%s"', [eName.Text],
    dm.mySQLQuery1);
  if dm.mySQLQuery1.RecordCount > 0 then
  begin
    MessageDlg(
      'Akun anda tidak aktif, '#13 +
      'silahkan menghubungi admin untuk keterangan lebih lanjut',
      mtError, [mbOK], 0);
    Exit;
  end;

  DM.ExecSQL(
    'SELECT id,nama,password,isSinuhun FROM data_pegawai'#13 +
    'WHERE nama = "%s" and IsActive = 1 limit 1', [eName.Text],
    DM.mySQLQuery1);

  if (DM.mySQLQuery1.Fields[0].AsInteger = 0) or
    (DM.mySQLQuery1.Fields[2].AsString <> ePasswd.Text) then
  begin
    WindowShake(Handle);
    exit;
  end;

  DM.sAPPPasswd := ePasswd.Text;

  if dm.mySQLQuery1.Fields[3].AsInteger = 1 then
    dm.bIsSinuhun := True
  else
    dm.bIsSinuhun := False;

  DM.iAPPid := dm.mySQLQuery1.Fields[0].AsInteger;
  DM.sAPPUser := eName.Text;
  ModalResult := mrOk;

  if INIReadString('Mode', 'ViewerMode', 'N') = 'Y' then
    DM.ViewerMode := True
  else
    DM.ViewerMode := False;
end;

procedure TFrmLogin.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmLogin.ePasswdKeyPress(Sender: TObject; var Key: Char);
begin
  if key <> #13 then
    Exit;
  btnOKClick(Sender);
end;

procedure TFrmLogin.eNameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key <> #13 then
    Exit;
  if eName.Text = EmptyStr then
    Exit;
  ePasswd.SetFocus;
end;

procedure TFrmLogin.FormShow(Sender: TObject);
var
  StringArray: TStringDynArray;
begin
  StringArray := Explode('/', uSubWCRev.DATE);

{$IFNDEF TEST}
  eName.Clear;
  ePasswd.Clear;
{$ELSE}
  eName.Text := 'trias';
  ePasswd.Text := 'trias';
{$ENDIF}
  formatbtn(self);
  //ShortDateFormat := 'dd-MM-yyyy';
  Label1.Caption := 'SVN Revision Range: ' +
    uSubWCRev.RANGE + ' [' + copy(StringArray[2], 1, 2) + '-' + StringArray[1] +
    '-' +
    StringArray[0] + ' ' + copy(uSubWCRev.DATE, 11, 9) + ']';

  //__mode
  if INIReadString('Mode', 'ViewerMode', 'N') = 'Y' then
    //ViewerMode := True
    cbViewerMode.Checked := True
  else
    cbViewerMode.Checked := False;
  //ViewerMode := False;

end;

procedure TFrmLogin.cbViewerModeClick(Sender: TObject);
begin
  if cbViewerMode.Checked then
    INIWriteString('Mode', 'ViewerMode', 'Y')
  else
    INIWriteString('Mode', 'ViewerMode', 'N');
end;

end.

