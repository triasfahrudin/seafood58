unit uFrmAbout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Flame, StdCtrls;

type
  TFrmAbout = class(TForm)
    Flame1: TFlame;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    btnTutup: TButton;
    Label9: TLabel;
    Memo1: TMemo;
    procedure btnTutupClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  FrmAbout: TFrmAbout;

implementation

{$R *.dfm}
uses
  uSubWCRev, uLibrary, uDM, mySQLDbTables;

procedure TFrmAbout.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmAbout.FormCreate(Sender: TObject);
begin
  Label6.Caption := REVISION;
  Label7.Caption := DATE;
  Label8.Caption := BUILD;
  Label9.Caption := URL;
  Memo1.Text := DM.mySQLDatabase1.GetServerStat;
end;

procedure TFrmAbout.FormShow(Sender: TObject);
begin
  formatbtn(self);
end;

end.
