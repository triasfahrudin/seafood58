unit uFrmLockDesktop;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RzEdit, ExtCtrls,
  frxpngimage;

type
  TFrmLockDesktop = class(TForm)
    img1: TImage;
    ePassword: TRzMaskEdit;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ePasswordKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ePasswordClick(Sender: TObject);
    procedure img1Click(Sender: TObject);
  private

  public

    procedure TryToUnlockDesktop;
  end;

var
  FrmLockDesktop: TFrmLockDesktop;

implementation

{$R *.dfm}
uses
  DisableWinKeys, uLibrary, uDM;

function MakeModal(AppHwnd, hwndDest, Beep: LongInt): LongInt;
  stdcall; external 'AVIGDlgEng.dll';

procedure TFrmLockDesktop.FormCreate(Sender: TObject);
begin
  DisableWindowsUI;
  MakeModal(Handle, 1, 0)
end;

procedure TFrmLockDesktop.ePasswordKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    TryToUnlockDesktop;
end;

procedure TFrmLockDesktop.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmLockDesktop.TryToUnlockDesktop;
begin
  if ePassword.Text <> DM.sAPPPasswd then
  begin
    WindowShake(Handle);
    ePassword.SelectAll;
    Exit;
  end;
  EnableWindowsUI;
  MakeModal(0, 0, 0);
  dm.sSkinManager1.Active := True;
  Close;
end;

procedure TFrmLockDesktop.ePasswordClick(Sender: TObject);
begin
  ePassword.SelectAll;
end;

procedure TFrmLockDesktop.img1Click(Sender: TObject);
begin
  ePassword.SelectAll;
end;

end.
