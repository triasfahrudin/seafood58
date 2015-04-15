unit uFrmPengeluaran;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, sPanel, StdCtrls, sGroupBox, sLabel, NxEdit, sComboBox,
  NxColumns, NxColumnClasses, NxScrollControl, NxCustomGridControl,
  NxCustomGrid, NxGrid, Mask, sMaskEdit, sCustomComboEdit, sCurrEdit,
  sCurrencyEdit, sMemo, sEdit, sButton, sBevel, NxDBGrid, ComCtrls;

type
  TFrmPengeluaran = class(TForm)
    sPanel1: TsPanel;
    sLabelFX1: TsLabelFX;
    sGroupBox1: TsGroupBox;
    sLabelFX4: TsLabelFX;
    cmbPegawai: TsComboBox;
    sLabelFX2: TsLabelFX;
    NxDatePicker1: TNxDatePicker;
    sMemo1: TsMemo;
    sLabelFX3: TsLabelFX;
    sLabelFX5: TsLabelFX;
    sEdit1: TsEdit;
    sLabelFX6: TsLabelFX;
    sEdit2: TsEdit;
    btnTambah: TsButton;
    btnPrev: TsButton;
    btnNext: TsButton;
    bvl1: TBevel;
    btnKeluar: TsButton;
    ListView1: TListView;
    sLabelFX7: TsLabelFX;
    lblTotAkhir: TsLabelFX;
    btnSimpan: TsButton;
    btnBatal: TsButton;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ListAllEmployees;
  end;

var
  FrmPengeluaran: TFrmPengeluaran;

implementation

{$R *.dfm}
uses
  uDM;
{ TFrmPengeluaran }

procedure TFrmPengeluaran.ListAllEmployees;
var
  sSQL: string;
begin
  dm.ExecSQL('select nama from data_pegawai where isactive = 1', [],
    dm.mySQLQuery1);
  dm.mySQLQuery1.First;
  cmbPegawai.Clear;
  while not dm.mySQLQuery1.Eof do
  begin
    cmbPegawai.Items.Add(dm.mySQLQuery1.Fields[0].AsString);
    dm.mySQLQuery1.Next;
  end;
end;

end.

