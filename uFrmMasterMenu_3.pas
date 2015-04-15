unit uFrmMasterMenu_3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, NxScrollControl, NxCustomGridControl, NxCustomGrid, NxGrid,
  ExtCtrls, sPanel, NxColumnClasses, NxColumns, NxCollection;

type
  TFrmMasterMenu_3 = class(TForm)
    NxHeaderPanel1: TNxHeaderPanel;
    NextGrid1: TNextGrid;
    NextGrid2: TNextGrid;
    NxTextColumn1: TNxTextColumn;
    NxNumberColumn1: TNxNumberColumn;
    sPanel1: TsPanel;
    NxIncrementColumn1: TNxIncrementColumn;
    NxTextColumn2: TNxTextColumn;
    NxTextColumn3: TNxTextColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMasterMenu_3: TFrmMasterMenu_3;

implementation

{$R *.dfm}

end.
