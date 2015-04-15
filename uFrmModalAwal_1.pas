unit uFrmModalAwal_1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, NxColumnClasses, NxColumns, NxScrollControl,
  NxCustomGridControl, NxCustomGrid, NxGrid;

type
  TFrmModalAwal_1 = class(TForm)
    NextGrid1: TNextGrid;
    NxTextColumn1: TNxTextColumn;
    NxDateColumn1: TNxDateColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmModalAwal_1: TFrmModalAwal_1;

implementation

{$R *.dfm}

procedure TFrmModalAwal_1.FormCreate(Sender: TObject);
begin
  ShortDateFormat:='MM/dd/yyyy';
end;

end.
