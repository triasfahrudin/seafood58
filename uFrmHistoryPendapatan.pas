unit uFrmHistoryPendapatan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, sPanel, NxScrollControl,
  NxCustomGridControl, NxCustomGrid, NxGrid, ESBPCSPanel,
  ESBPCSCalEdit, StdCtrls, sButton, NxColumnClasses, NxColumns, Menus,
  sLabel;

type
  TFrmHistoryPendapatan = class(TForm)
    grid: TNextGrid;
    sPanel1: TsPanel;
    cal: TESBCalEdit;
    btnNext: TsButton;
    btnPrev: TsButton;
    NxIncrementColumn1: TNxIncrementColumn;
    NxTextColumn3: TNxTextColumn;
    NxTextColumn2: TNxNumberColumn;
    NxTextColumn4: TNxTextColumn;
    btnClose: TsButton;
    NxTextColumn5: TNxNumberColumn;
    NxNumberColumn3: TNxNumberColumn;
    sLabel1: TsLabel;
    MainMenu1: TMainMenu;
    delete2: TMenuItem;
    Edit2: TMenuItem;
    NxTextColumn1: TNxTextColumn;
    NxNumberColumn1: TNxNumberColumn;
    nxtxtclmn1: TNxTextColumn;
    procedure btnNextClick(Sender: TObject);
    procedure btnPrevClick(Sender: TObject);
    procedure calChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure delete2Click(Sender: TObject);
    procedure gridCellColoring(Sender: TObject; ACol, ARow: Integer;
      var CellColor, GridColor: TColor; CellState: TCellState);
  private

  public

    procedure LoadAllPendapatan;
  end;

var
  FrmHistoryPendapatan: TFrmHistoryPendapatan;

implementation

{$R *.dfm}
uses
  uDM, uLibrary, DB, uFrmPendapatanLain, uFrmMain;

procedure TFrmHistoryPendapatan.btnNextClick(Sender: TObject);
begin
  cal.AddDays(1);
end;

procedure TFrmHistoryPendapatan.btnPrevClick(Sender: TObject);
begin
  cal.AddDays(-1);
end;

procedure TFrmHistoryPendapatan.LoadAllPendapatan;
begin

  dm.ExecSQL(
    'select a.typependapatan,c.nama,a.struk,'#13 +
    '       sum(b.banyak * b.harga_satuan) - '#13 +
    '       sum(b.banyak * b.harga_satuan * (ifnull(a.discount,0)/100)),a.id,'#13 +
    '       a.id_meja,a.typependapatan,a.isKredit'#13 +
    'from data_pendapatan a'#13 +
    'left join detail_pendapatan b'#13 +
    'on a.id = b.id_pendapatan'#13 +
    'left join data_meja c'#13 +
    'on a.id_meja = c.id'#13 +
    'where a.tgl = "%s"'#13 +
    'group by b.id_pendapatan'#13 +
    'order by a.id', [MySQLDateFormat(cal.Text)], dm.mySQLQuery1);

  dm.mySQLQuery1.First;
  grid.ClearRows;
  grid.BeginUpdate;
  while not dm.mySQLQuery1.Eof do
  begin
    with grid, dm.mySQLQuery1 do
    begin
      AddRow(1);

      case Fields[0].AsInteger of
        0: Cell[1, RowCount - 1].AsString := 'penj.Biasa';
        1: Cell[1, RowCount - 1].AsString := 'penj.Langsung';
        2: Cell[1, RowCount - 1].AsString := 'Pend.Lain2';
      end;

      Cell[2, RowCount - 1].AsString := Fields[1].AsString;
      Cell[3, RowCount - 1].AsString := Fields[2].AsString;
      Cell[4, RowCount - 1].AsInteger := Fields[3].AsInteger;
      Cell[5, RowCount - 1].AsInteger := Fields[4].AsInteger;
      Cell[6, RowCount - 1].AsInteger := Fields[5].AsInteger;
      Cell[7, RowCount - 1].AsInteger := Fields[6].AsInteger;
      Cell[8, RowCount - 1].AsString := Fields[7].AsString;
    end;
    dm.mySQLQuery1.Next;
  end;
  grid.EndUpdate;
  grid.CalculateFooter;
end;

procedure TFrmHistoryPendapatan.calChange(Sender: TObject);
begin
  LoadAllPendapatan;
end;

procedure TFrmHistoryPendapatan.FormCreate(Sender: TObject);
begin
  LoadAllPendapatan;
end;

procedure TFrmHistoryPendapatan.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmHistoryPendapatan.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmHistoryPendapatan.FormShow(Sender: TObject);
begin
  formatbtn(self);
end;

procedure TFrmHistoryPendapatan.Edit2Click(Sender: TObject);
begin
  if grid.SelectedCount = 0 then
    Exit;

  dm.ExecSQL(
    'select count(id)'#13 +
    'from data_tutupbuku'#13 +
    'where tgl = "%s"', [MySQLDateFormat(cal.Text)], dm.mySQLQuery1);
  if dm.mySQLQuery1.Fields[0].AsInteger > 0 then
  begin
    MessageDlg('Tgl ini sudah tutup buku, sehingga tidak diperbolehkan dilakukan penghapusan data', mtError, [mbOK], 0);
    Exit;
  end;

  case grid.Cell[7, grid.SelectedRow].AsInteger of
    0:
      begin
        dm.ExecSQL(
          'select count(*)'#13 +
          'from temp_pendapatan'#13 +
          'where id_meja = %d ',
          [grid.Cell[6, grid.SelectedRow].AsInteger],
          dm.mySQLQuery1);
        if dm.mySQLQuery1.Fields[0].AsInteger > 0 then
        begin
          MessageDlg(
            'Ada transaksi yang belum disimpan dengan meja yang sama (' +
            GetNamaMeja(grid.Cell[6, grid.SelectedRow].AsInteger) + ')'#13 +
            'Simpan transaksi yang ada,dan ulangi lagi untuk mengedit',
            mtError, [mbOK], 0);
          Exit;
        end;
        FrmMain.EditPendapatan(
          grid.Cell[5, grid.SelectedRow].AsInteger,
          grid.Cell[6, grid.SelectedRow].AsInteger);
        Close;
      end;
    1:
      begin

        dm.ExecSQL(
          'select count(*)'#13 +
          'from temp_pendapatan'#13 +
          'where id_meja = %d ', [0], dm.mySQLQuery1);
        if dm.mySQLQuery1.Fields[0].AsInteger > 0 then
        begin
          MessageDlg(
            'Ada transaksi yang belum disimpan pada penjualan langsung.'#13 +
            'Simpan transaksi yang ada,dan ulangi lagi untuk mengedit',
            mtError, [mbOK], 0);
          Exit;
        end;
        FrmMain.EditPendapatan(grid.Cell[5, grid.SelectedRow].AsInteger, 0);
      end;
    2:
      begin

        dm.ExecSQL(
          'select a.id,a.keterangan,(b.harga_satuan * b.banyak)'#13 +
          'from data_pendapatan a'#13 +
          'left join detail_pendapatan b'#13 +
          'on a.id = b.id_pendapatan'#13 +
          'where a.id = %d', [grid.Cell[5, grid.SelectedRow].AsInteger],
          dm.mySQLQuery1);
        ActivateForm('FrmPendapatanLain', TFrmPendapatanLain,
          FrmPendapatanLain);
        FrmPendapatanLain.bNewData := False;
        FrmPendapatanLain.id_pendapatan := dm.mySQLQuery1.Fields[0].AsInteger;
        FrmPendapatanLain.mmketerangan.Text :=
          dm.mySQLQuery1.Fields[1].AsString;
        FrmPendapatanLain.eBesar.Text := dm.mySQLQuery1.Fields[2].AsString;
        FrmPendapatanLain.ShowModal;
      end;

  end;
  Close;
end;

procedure TFrmHistoryPendapatan.delete2Click(Sender: TObject);
begin

  if grid.SelectedCount = 0 then
    Exit;
  //______ apakah udah di tutup buku ?

  dm.ExecSQL(
    'select count(id)'#13 +
    'from data_tutupbuku'#13 +
    'where tgl = "%s"', [MySQLDateFormat(cal.Text)], dm.mySQLQuery1);
  if dm.mySQLQuery1.Fields[0].AsInteger > 0 then
  begin
    MessageDlg('Tgl ini sudah tutup buku, sehingga tidak mungkin dilakukan penghapusan data', mtError, [mbOK], 0);
    Exit;
  end;

  {****************************************************************************}
  if not DM.bIsSinuhun then
  begin
    if isAllowPriv(HISTORYPENDAPATAN_DELETE) = 'N' then
      ShowAuthorization(HISTORYPENDAPATAN_DELETE);
    if isAllowPriv(HISTORYPENDAPATAN_DELETE) = 'N' then
      Exit;
  end;
  {****************************************************************************}

  if MessageDlg('Apakah anda yakin ingin menghapus penjualan :'#13 +
    'No.struk:' + grid.Cell[3, grid.SelectedRow].AsString + ''#13 +
    'Total   :' + formatRP(grid.Cell[4, grid.SelectedRow].AsString) + '?'#13 +
    '*Perubahan tidak dapat dibatalkan!', mtConfirmation,
    [mbYes] + [mbNo], 0) = mrYes then
  begin

    dm.ExecSQL(
      'delete from data_pendapatan'#13 +
      'where id = %d',
      [grid.Cell[5, grid.SelectedRow].AsInteger], dm.mySQLQuery1);

    dm.ExecSQL(
      'delete from detail_pendapatan'#13 +
      'where id_pendapatan = %d',
      [grid.Cell[5, grid.SelectedRow].AsInteger], DM.mySQLQuery1);
    MessageDlg('Data terhapus', mtInformation, [mbOK], 0);

    {****************************************************************************}
    InsertData_Perubahan(
      'Delete History Pendapatan: '#13 +
      'No.struk: ' + grid.Cell[3, grid.SelectedRow].AsString + ''#13 +
      'Total   : ' + formatRP(grid.Cell[4, grid.SelectedRow].AsString));

    DeletePriv(HISTORYPENDAPATAN_DELETE);
    {****************************************************************************}

    LoadAllPendapatan;
  end
  else
    DeletePriv(HISTORYPENDAPATAN_DELETE);

end;

procedure TFrmHistoryPendapatan.gridCellColoring(Sender: TObject; ACol,
  ARow: Integer; var CellColor, GridColor: TColor; CellState: TCellState);
begin
  if not (csSelected in CellState) and not (csEmpty in CellState) then
  begin
    if grid.Cell[8, ARow].AsString = 'Y' then
      CellColor := clSkyBlue;
  end;
end;

end.
