unit uFrmGantiPassword;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sEdit, sLabel, sButton, frxpngimage, ExtCtrls;

type
  TFrmGantiPassword = class(TForm)
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    sLabel3: TsLabel;
    e1: TsEdit;
    e2: TsEdit;
    e3: TsEdit;
    btnGanti: TsButton;
    Image1: TImage;
    procedure btnGantiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure e1KeyPress(Sender: TObject; var Key: Char);
    procedure e2KeyPress(Sender: TObject; var Key: Char);
    procedure e3KeyPress(Sender: TObject; var Key: Char);
  private

  public

  end;

var
  FrmGantiPassword: TFrmGantiPassword;

implementation

uses uDM, uLibrary;

{$R *.dfm}

procedure TFrmGantiPassword.btnGantiClick(Sender: TObject);
begin
  dm.ExecSQL(
    'select password'#13 +
    'from data_pegawai'#13 +
    'where id = %d', [dm.iAPPid], dm.mySQLQuery1);
  if dm.mySQLQuery1.Fields[0].AsString <> e1.Text then
  begin
    WindowShake(handle);
    MessageDlg('Password lama tidak sama!', mtError, [mbOK], 0);
    Exit;
  end;

  if e2.Text <> e3.Text then
  begin
    WindowShake(handle);
    MessageDlg('Password baru tidak sama', mtError, [mbOK], 0);
    Exit;
  end;

  dm.ExecSQL(
    'update data_pegawai'#13 +
    'set password = "%s"'#13 +
    'where id = %d', [e2.Text, dm.iAPPid], dm.mySQLQuery1);
  MessageDlg('Password sudah diubah', mtInformation, [mbOK], 0);
  dm.sAPPPasswd := e2.Text;
  Close;
end;

procedure TFrmGantiPassword.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmGantiPassword.e1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    e2.SetFocus;
end;

procedure TFrmGantiPassword.e2KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    e3.SetFocus;
end;

procedure TFrmGantiPassword.e3KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    btnGanti.SetFocus;
end;

end.
