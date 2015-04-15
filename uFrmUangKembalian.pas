unit uFrmUangKembalian;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sLabel, sButton;

type
  TFrmUangKembalian = class(TForm)
    lblKembalian: TsLabelFX;
    sLabel1: TsLabel;
    btnClose: TsButton;
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  FrmUangKembalian: TFrmUangKembalian;

implementation

{$R *.dfm}
uses
  uLibrary;

procedure TFrmUangKembalian.FormShow(Sender: TObject);
begin
  formatbtn(self);
  btnClose.SetFocus;
end;

end.
