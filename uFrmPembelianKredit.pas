unit uFrmPembelianKredit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFrmPembelianKredit = class(TForm)
    rgBankName: TRadioGroup;
    edtNoKartu: TEdit;
    lblNoKartu: TLabel;
    lblNoTrace: TLabel;
    edtNoTrace: TEdit;
    btnPrint: TButton;
    btnBatal: TButton;
    edtBankLain: TEdit;
    procedure btnBatalClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPembelianKredit: TFrmPembelianKredit;

implementation

{$R *.dfm}
uses
  uLibrary;

procedure TFrmPembelianKredit.btnBatalClick(Sender: TObject);
begin
  //batal
end;

procedure TFrmPembelianKredit.btnPrintClick(Sender: TObject);
begin
  //print
end;

procedure TFrmPembelianKredit.FormShow(Sender: TObject);
begin
  FormatBtn(self);
end;

end.
