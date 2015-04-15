unit uFrmPencarian;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, NxCollection, NxEdit, NxColumns,
  NxScrollControl, NxCustomGridControl, NxCustomGrid,
  NxColumnClasses, NxGrid, sButton, sLabel;

type
  TFrmPencarian = class(TForm)
    nxpnl1: TNxPanel;
    lbl2: TNxLabel;
    edNama: TNxEdit;
    lbl3: TNxLabel;
    grid: TNextGrid;
    NxTextColumn1: TNxTextColumn;
    NxTextColumn2: TNxTextColumn;
    btnReloadStok: TsButton;
    sLabel1: TsLabel;
    NxTextColumn3: TNxTextColumn;
    procedure edNamaChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gridDblClick(Sender: TObject);
    procedure edNamaKeyPress(Sender: TObject; var Key: Char);
    procedure gridKeyPress(Sender: TObject; var Key: Char);
    procedure btnReloadStokClick(Sender: TObject);
  private
    { Private declarations }
    procedure ReloadStok;
  public
    { Public declarations }
  end;

var
  FrmPencarian: TFrmPencarian;

implementation

uses uDM, uLibrary;

{$R *.dfm}

procedure TFrmPencarian.edNamaChange(Sender: TObject);

  procedure FillGrid;
  begin
    dm.mySQLQuery1.First;
    while not dm.mySQLQuery1.Eof do
    begin
      with grid, dm.mySQLQuery1 do
      begin
        AddRow(1);
        Cell[0, RowCount - 1].AsString := Fields[0].AsString;
      end;
      dm.mySQLQuery1.Next;
    end;
  end;
var
  sSQL: string;
begin
  grid.ClearRows;
  grid.BeginUpdate;

  //***__phase one
  sSQL :=
    'select trim(concat_ws('' '',c.nama,a.nama)) as nama_lengkap'#13 +
    'from data_menus a'#13 +
    'left join data_subjenismenu c'#13 +
    'on a.id_subjenismenu = c.id'#13 +
    'where a.id_jenismenu = 1 and'#13 +
    'trim(concat_ws('' '', c.nama, a.nama)) LIKE ''%' + edNama.Text + '%'''#13 +
    'order by a.id_jenismenu,c.sort,a.id';

  DM.mySQLQuery1.Close;
  DM.mySQLQuery1.SQL.Text := sSQL;
  dm.mySQLQuery1.Open;
  if dm.mySQLQuery1.RecordCount > 0 then
  begin
    FillGrid;
  end
  else
  begin
    //***_phase two
    sSQL :=
      'select nama from data_menus'#13 +
      'where id_jenismenu = 2 and'#13 +
      'nama LIKE ''%' + edNama.Text + '%''';
    DM.mySQLQuery1.Close;
    DM.mySQLQuery1.SQL.Text := sSQL;
    dm.mySQLQuery1.Open;
    if dm.mySQLQuery1.RecordCount > 0 then
    begin
      FillGrid;
    end
    else
    begin
      //***_phase three
      sSQL :=
        'select nama from data_menus where id_jenismenu = 3 and'#13 +
        'nama LIKE ''%' + edNama.Text + '%''';
      DM.mySQLQuery1.Close;
      DM.mySQLQuery1.SQL.Text := sSQL;
      dm.mySQLQuery1.Open;
      if dm.mySQLQuery1.RecordCount > 0 then
      begin
        FillGrid;
      end
    end;
  end;

  grid.EndUpdate;
end;

procedure TFrmPencarian.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmPencarian.gridDblClick(Sender: TObject);
begin
  if grid.SelectedCount = 0 then
    Exit;
  Close;
end;

procedure TFrmPencarian.edNamaKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key <> #13) then
    Exit;
  if grid.RowCount > 0 then
  begin
    grid.SelectFirstRow();
  end;
  keybd_event(VK_TAB, 0, 0, 0);
end;

procedure TFrmPencarian.gridKeyPress(Sender: TObject; var Key: Char);
begin
  if Key <> #13 then
    Exit;
  if grid.SelectedCount = 0 then
    Exit;
  Close;
end;

procedure TFrmPencarian.ReloadStok;
var
  CurrTgl: string;
begin
  btnReloadStok.Enabled := False;
  dm.ExecSQL('delete from temp_report_stok', [], dm.mySQLQuery1);
  dm.ExecSQL(
    'select a.id,a.nama,b.nama,a.sort'#13 +
    'from data_subjenismenu a'#13 +
    'left join data_satuan b'#13 +
    'on a.id_satuan_laporan = b.id'#13 +
    'where a.is_stok = 1'#13 +
    'order by a.sort', [], dm.mySQLQuery1);

  dm.mySQLQuery1.First;
  DecimalSeparator := '.';
  while not dm.mySQLQuery1.Eof do
  begin
    CurrTgl := MySQLDateFormat(DateToStr(NOW));
    dm.ExecSQL(
      'select func_GetStokMasuk("%s",%d),'#13 +
      '       func_GetStokKeluar("%s",%d),'#13 +
      '       func_GetStokPengurangan("%s",%d),'#13 +
      '       func_GetStokPenambahan("%s",%d)',
      [CurrTgl, dm.mySQLQuery1.Fields[0].AsInteger,
      CurrTgl, dm.mySQLQuery1.Fields[0].AsInteger,
        CurrTgl, dm.mySQLQuery1.Fields[0].AsInteger,
        CurrTgl, dm.mySQLQuery1.Fields[0].AsInteger], dm.mySQLQuery3);

    dm.ExecSQL(
      'insert into temp_report_stok(id_subjenismenu,'#13 +
      '                             nama_items,'#13 +
      '                             nama_satuan,'#13 +
      '                             stok_masuk,'#13 +
      '                             stok_keluar,'#13 +
      '                             pengurangan_stok,'#13 +
      '                             penambahan_stok,'#13 +
      '                             sort)'#13 +
      'values(%d,"%s","%s",%f,%f,%f,%f,%d)',
      [dm.mySQLQuery1.Fields[0].AsInteger,
      dm.mySQLQuery1.Fields[1].AsString,
        dm.mySQLQuery1.Fields[2].AsString,
        dm.mySQLQuery3.Fields[0].AsFloat,
        dm.mySQLQuery3.Fields[1].AsFloat,
        dm.mySQLQuery3.Fields[2].AsFloat,
        dm.mySQLQuery3.Fields[3].AsFloat,
        dm.mySQLQuery1.Fields[3].AsInteger], dm.mySQLQuery2);
    dm.mySQLQuery1.Next;
  end;
  DecimalSeparator := ',';
  btnReloadStok.Enabled := True;
end;

procedure TFrmPencarian.btnReloadStokClick(Sender: TObject);
begin
  ReloadStok;
end;

end.

