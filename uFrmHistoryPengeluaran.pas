unit uFrmHistoryPengeluaran;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, NxColumns, NxDBColumns, NxScrollControl, NxCustomGridControl,
  NxCustomGrid, NxDBGrid, StdCtrls, sLabel, ExtCtrls, sPanel, sButton,
  sEdit, sComboBox, NxGrid;

type
  TFrmHistoryPengeluaran = class(TForm)
    sPanel1: TsPanel;
    sLabelFX1: TsLabelFX;
    sPanel2: TsPanel;
    sLabel1: TsLabel;
    sComboBox1: TsComboBox;
    sLabel2: TsLabel;
    sEdit1: TsEdit;
    btnTampilkan: TsButton;
    NextGrid1: TNextGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmHistoryPengeluaran: TFrmHistoryPengeluaran;

implementation

{$R *.dfm}

end.

