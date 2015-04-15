unit uFrmKonversiNamaMeja;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, NxScrollControl, NxCustomGridControl, NxCustomGrid, NxGrid,
  NxColumnClasses, NxColumns, StdCtrls, sButton, sEdit, sLabel, ExtCtrls,
  sPanel, INIFiles;

type
  TFrmKonversiNamaMeja = class(TForm)
    NextGrid1: TNextGrid;
    NxIncrementColumn1: TNxIncrementColumn;
    NxTextColumn1: TNxTextColumn;
    NxTextColumn2: TNxTextColumn;
    NxTextColumn3: TNxTextColumn;
    sPanel1: TsPanel;
    sLabel1: TsLabel;
    eJmlMeja: TsEdit;
    btnUpdate: TsButton;
    btnKeluar: TsButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LoadAllMejaAliasData;
  end;

var
  FrmKonversiNamaMeja: TFrmKonversiNamaMeja;

implementation

{$R *.dfm}

uses
  uLibrary, uDM;

procedure TFrmKonversiNamaMeja.FormCreate(Sender: TObject);
begin
  eJmlMeja.Text := INIReadString('settings', 'jmlmeja', '5');
end;

procedure TFrmKonversiNamaMeja.LoadAllMejaAliasData;
begin
  dm.ExecSQL('select nama,alias from data_meja_alias', [], dm.mySQLQuery1);
end;

end.

