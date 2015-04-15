unit uFrmSettingAwal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ESBPCSPanel, ESBPCSCalEdit, StdCtrls, sEdit, sLabel, ExtCtrls,
  sPanel, sButton;

type
  TFrmSettingAwal = class(TForm)
    sPanel1: TsPanel;
    sLabelFX1: TsLabelFX;
    eModalAwal: TsEdit;
    sLabelFX2: TsLabelFX;
    ESBCalEdit1: TESBCalEdit;
    btnSimpan: TsButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSettingAwal: TFrmSettingAwal;

implementation

{$R *.dfm}
uses
  uDM;

end.
