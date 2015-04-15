unit uFrmMySQLSettings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sSkinProvider, ExtCtrls, StdCtrls, sLabel,
  sButton, sEdit, INIFiles, jpeg;

type
  TFrmMySQLSettings = class(TForm)
    img1: TImage;
    sSkinProvider1: TsSkinProvider;
    shp1: TShape;
    sLabelFX1: TsLabelFX;
    sLabelFX2: TsLabelFX;
    sLabelFX3: TsLabelFX;
    sLabelFX4: TsLabelFX;
    sLabelFX5: TsLabelFX;
    eHost: TsEdit;
    eUserName: TsEdit;
    epassword: TsEdit;
    eDBName: TsEdit;
    btnTest: TsButton;
    btnCancel: TsButton;
    sLabelFX6: TsLabelFX;
    ePort: TsEdit;
    btnOK: TsButton;
    Bevel1: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnTestClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  FrmMySQLSettings: TFrmMySQLSettings;

implementation

{$R *.dfm}
uses
  uDM, uLibrary;

procedure TFrmMySQLSettings.FormCreate(Sender: TObject);
var
  myINI: TIniFile;
begin
  myINI := TIniFile.Create(ExtractFilePath(Application.ExeName) +
    'SeaFood58.ini');
  try
    with myINI do
    begin
      eHost.Text := ReadString('Database', 'server', 'localhost');
      ePort.Text := ReadString('Database', 'port', '3306');
      eUserName.Text := ReadString('Database', 'user', 'root');
      epassword.Text := ReadString('Database', 'password', 'triasfahrudin');
      eDBName.Text := ReadString('Database', 'database', 'pos_seafood58');
    end;
  finally
    myINI.Free;
  end;
end;

procedure TFrmMySQLSettings.btnCancelClick(Sender: TObject);
begin
  with DM do
  begin
    mySQLDatabase1.Connected := False;
    mySQLDatabase1.Host := sDBServer;
    mySQLDatabase1.Username := sDBUser;
    mySQLDatabase1.UserPassword := sDBPassword;
    mySQLDatabase1.DatabaseName := sDBName;
  end;
end;

procedure TFrmMySQLSettings.btnTestClick(Sender: TObject);
begin
  with DM.mySQLDatabase1 do
  begin
    Connected := False;
    Host := eHost.Text;
    Username := eUserName.Text;
    UserPassword := epassword.Text;
    DatabaseName := eDBName.Text;
  end;

  try
    dm.mySQLDatabase1.Connected := True;
    if DM.mySQLDatabase1.Connected = True then
      Application.MessageBox('Koneksi berhasil ...',
        'Test', MB_OK + MB_ICONINFORMATION);
  except
    on E: Exception do
    begin
      Application.MessageBox(
        PChar('ERROR: ' + E.Message), 'ERROR!!!',
        MB_OK + MB_ICONSTOP);
    end;
  end;
end;

procedure TFrmMySQLSettings.btnOKClick(Sender: TObject);
var
  myINI: TIniFile;
begin
  myINI := TIniFile.Create(ExtractFilePath(Application.ExeName) +
    'SeaFood58.ini');
  try
    with DM, myINI do
    begin
      sDBServer := eHost.Text;
      iDBPort := StrToInt(ePort.Text);
      sDBUser := eUserName.Text;
      sDBPassword := epassword.Text;
      sDBName := eDBName.Text;

      WriteString('Database', 'server', eHost.Text);
      WriteString('Database', 'port', ePort.Text);
      WriteString('Database', 'user', eUserName.Text);
      WriteString('Database', 'password', epassword.Text);
      WriteString('Database', 'database', eDBName.Text);
    end;
  finally
    myINI.Free;
  end;
end;

procedure TFrmMySQLSettings.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmMySQLSettings.FormShow(Sender: TObject);
begin
  FormatBtn(self);
end;

end.
