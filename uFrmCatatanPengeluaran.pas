unit uFrmCatatanPengeluaran;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, RzGrids, ExtCtrls, sPanel, NxEdit, Mask,
  sMaskEdit, sCustomComboEdit, sTooledit, sButton, ESBPCSPanel,
  ESBPCSCalEdit, NxColumns, NxColumnClasses, NxScrollControl,
  NxCustomGridControl, NxCustomGrid, NxGrid, sLabel, Menus;

type
  TFrmCatatanPengeluaran = class(TForm)
    sPanel1: TsPanel;
    sPanel2: TsPanel;
    sg: TRzStringGrid;
    mmKeterangan: TMemo;
    eBanyak: TEdit;
    eHargaSatuan: TEdit;
    calender: TESBCalEdit;
    btnPrev: TsButton;
    btnNext: TsButton;
    cmbItem: TComboBox;
    btnAddRow: TsButton;
    sLabelFX1: TsLabelFX;
    lblTotAkhir: TsLabelFX;
    btnBatal: TsButton;
    btnSimpan: TsButton;
    btnKeluar: TsButton;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    sLabel3: TsLabel;
    procedure sgSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure calenderChange(Sender: TObject);
    procedure FormatGrid;
    procedure FormCreate(Sender: TObject);
    procedure mmKeteranganKeyPress(Sender: TObject; var Key: Char);
    procedure sgClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnPrevClick(Sender: TObject);
    procedure btnAddRowClick(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure cmbItemExit(Sender: TObject);
    procedure eBanyakKeyPress(Sender: TObject; var Key: Char);
    procedure eHargaSatuanKeyPress(Sender: TObject; var Key: Char);
    procedure eBanyakExit(Sender: TObject);
    procedure eHargaSatuanExit(Sender: TObject);
    procedure mmKeteranganExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnBatalClick(Sender: TObject);
    procedure btnKeluarClick(Sender: TObject);
    procedure cmbItemChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetDistinctItems;
    procedure LoadAllDataPengeluaran;
    procedure CheckRecordBeforeSave;
    function IsValuesCorrect: boolean;
    procedure SetBtnEnabledStatus(bBatal, bSimpan: boolean);
  end;

var
  FrmCatatanPengeluaran: TFrmCatatanPengeluaran;

implementation

{$R *.dfm}
uses
  uDM, uLibrary, DB, StrUtils;

//Copy the parameterized row contains from next row

//____________deletestringgrid__________________________________________________

procedure DeleteStringGridRow1(AStringGrid: TStringGrid; Arow: Integer);
var
  i, j: integer;
begin
  for i := Arow to AStringGrid.RowCount - 2 do
    for j := 0 to AStringGrid.ColCount - 1 do
      AStringGrid.Cells[j, i] := AStringGrid.Cells[j, i + 1];
  AStringGrid.RowCount := AStringGrid.RowCount - 1;
end;

//_________________select cell_______________________________________________

procedure TFrmCatatanPengeluaran.sgSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
var
  Rect: TRect;
begin
  {no,item,banyak,harga satuan,total,keterangan,delete}
  cmbItem.Visible := false;
  eBanyak.Visible := false;
  eHargaSatuan.Visible := false;
  mmKeterangan.Visible := false;
  if ARow = 0 then
    exit;

  Rect := TStringGrid(Sender).CellRect(ACol, ARow);
  Rect.Left := Rect.Left + sg.Left;
  Rect.Right := Rect.Right + sg.Left;
  Rect.Top := Rect.Top + sg.Top;
  Rect.Bottom := Rect.Bottom;

  case ACol of
    1:
      begin
        //nama item
        with cmbItem do
        begin
          Text := sg.Cells[ACol, ARow];
          Width := Rect.Right - Rect.Left;
          Left := Rect.Left + 1;
          Top := Rect.Top + 1;
          Visible := True;
        end;
      end;
    2:
      begin
        //banyak
        with eBanyak do
        begin
          Text := sg.Cells[ACol, ARow];
          Width := Rect.Right - Rect.Left;
          Left := Rect.Left + 1;
          Top := Rect.Top + 1;
          Visible := True;
        end;
      end;
    3:
      begin
        //harga satuan
        with eHargaSatuan do
        begin
          Text := UnFormatRp(sg.Cells[ACol, ARow]);
          Width := Rect.Right - Rect.Left;
          Left := Rect.Left + 1;
          Top := Rect.Top + 1;
          Visible := True;
        end;
      end;
    {no,*item,*banyak,*harga satuan,total,*keterangan,delete}
    5:
      begin
        //keterangan
        with mmKeterangan do
        begin
          Text := sg.Cells[ACol, ARow];
          Width := Rect.Right - Rect.Left;
          Left := Rect.Left + 1;
          Top := Rect.Top + 1;
          Visible := True;
        end;
      end;
  end;
end;

//______________________calender change______________________________________

procedure TFrmCatatanPengeluaran.calenderChange(Sender: TObject);
var
  i: integer;
begin
  //ShowMessage(ESBCalEdit1.text);
  //tampilkan list penjualan
  //calculate modal awal berikutnya

  //_____ clear
  for i := 1 to sg.RowCount - 1 do
    sg.Rows[i].Clear;
  //_____list all pengeluaran in calender.text days
  LoadAllDataPengeluaran;
  if not IsValuesCorrect then
    MessageDlg('Ada yang error', mtWarning, [mbOK], 0);
end;

//_________ format grid_______________________________

procedure TFrmCatatanPengeluaran.FormatGrid;
begin
  sg.Cells[0, 0] := 'No';
  sg.Cells[1, 0] := 'Item';
  sg.Cells[2, 0] := 'Banyak';
  sg.Cells[3, 0] := 'Hrg.Satuan';
  sg.Cells[4, 0] := 'Total';
  sg.Cells[5, 0] := 'Keterangan';
  sg.Cells[6, 0] := '[DELETE]';

  sg.ColWidths[0] := 30;
  sg.ColWidths[1] := 200;
  sg.ColWidths[2] := 70;
  sg.ColWidths[3] := 100;
  sg.ColWidths[4] := 80;
  sg.ColWidths[5] := 200;
end;

//________________Create________________

procedure TFrmCatatanPengeluaran.FormCreate(Sender: TObject);
begin
  FormatGrid;
  GetDistinctItems;
  cmbItem.Visible := false;
  eBanyak.Visible := false;
  eHargaSatuan.Visible := false;
  mmKeterangan.Visible := false;
  LoadAllDataPengeluaran;
  if not IsValuesCorrect then
  begin
    MessageDlg('Ada yang error', mtWarning, [mbOK], 0);
  end;
end;

procedure TFrmCatatanPengeluaran.mmKeteranganKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #27 then
    mmKeterangan.Visible := false;
end;

procedure TFrmCatatanPengeluaran.sgClick(Sender: TObject);
var
  i: integer;
begin
  {no,*item,*banyak,*harga satuan,total,*keterangan,delete}
  with cmbItem do
  begin
    if Visible then
    begin
      SetFocus;
      SelStart := Length(Text);
      SelStart := 0;
    end;
  end;

  with eBanyak do
  begin
    if Visible then
    begin
      SetFocus;
      SelectAll;
    end;
  end;

  with eHargaSatuan do
  begin
    if Visible then
    begin
      SetFocus;
      SelectAll;
    end;
  end;

  with mmKeterangan do
  begin
    if Visible then
    begin
      SetFocus;
      SelStart := 0;
    end;
  end;

  if sg.Row = 0 then
    exit;
  //____________ hapus item___________________________________
  if sg.Col = 6 then
  begin
    if MessageDlg('anda yakin ingin menghapus '#13 +
      'item:' + sg.Cells[1, sg.Row] + ' ? '#13,
      mtConfirmation, [mbYes] + [mbNo], 0) = mrYes then
      DeleteStringGridRow1(sg, sg.Row);
    sg.Rows[sg.Row + 1].Clear;
    for i := 1 to sg.RowCount - 1 do
    begin
      sg.Cells[0, i] := IntToStr(i);
      sg.Cells[6, i] := 'DELETE';
    end;
  end;
end;

//___________get distinct items from data_pengeluaran

procedure TFrmCatatanPengeluaran.GetDistinctItems;
begin
  DM.ExecSQL('select DISTINCT item from data_pengeluaran', [], DM.mySQLQuery1);
  cmbItem.Clear;
  cmbItem.AutoComplete := true;
  dm.mySQLQuery1.First;
  while not dm.mySQLQuery1.Eof do
  begin
    cmbItem.Items.Add(dm.mySQLQuery1.Fields[0].AsString);
    dm.mySQLQuery1.Next;
  end;
end;

procedure TFrmCatatanPengeluaran.btnNextClick(Sender: TObject);
begin
  calender.AddDays(1);
end;

procedure TFrmCatatanPengeluaran.btnPrevClick(Sender: TObject);
begin
  calender.AddDays(-1);
end;

procedure TFrmCatatanPengeluaran.CheckRecordBeforeSave;
begin

end;

//______________________________________________________________________________

procedure TFrmCatatanPengeluaran.LoadAllDataPengeluaran;
begin
  sg.RowCount := 1;
  dm.ExecSQL(
    'select item,banyak,harga_satuan,keterangan,id'#13 +
    'from data_pengeluaran'#13 +
    'where tgl ="%s"', [MySQLDateFormat(calender.Text)], DM.mySQLQuery1);
  dm.mySQLQuery1.First;
  while not dm.mySQLQuery1.Eof do
  begin
    sg.RowCount := sg.RowCount + 1;
    sg.Cells[0, dm.mySQLQuery1.RecNo] := IntToStr(dm.mySQLQuery1.RecNo); //no
    //item
    sg.Cells[1, dm.mySQLQuery1.RecNo] :=
      dm.mySQLQuery1.Fields[0].AsString;

    //banyak
    sg.Cells[2, dm.mySQLQuery1.RecNo] :=
      dm.mySQLQuery1.Fields[1].AsString;

    //harga satuan
    sg.Cells[3, dm.mySQLQuery1.RecNo] :=
      FormatRp(dm.mySQLQuery1.Fields[2].AsString);

    //total
    sg.Cells[4, dm.mySQLQuery1.RecNo] :=
      IntToStr(
      StrToInt(FormatRp(sg.Cells[2, dm.mySQLQuery1.RecNo])) *
      StrToInt(UnFormatRp(sg.Cells[3, dm.mySQLQuery1.RecNo]))
      );
    {no,item,banyak,harga satuan,total,keterangan}

    //keterangan
    sg.Cells[5, dm.mySQLQuery1.RecNo] :=
      dm.mySQLQuery1.Fields[3].AsString;

    sg.Cells[6, dm.mySQLQuery1.RecNo] := '[DELETE]'; //
    dm.mySQLQuery1.Next;
  end;
end;

procedure TFrmCatatanPengeluaran.btnAddRowClick(Sender: TObject);
var
  i: integer;
begin
  sg.RowCount := sg.RowCount + 1;
  for i := 1 to sg.RowCount - 1 do
  begin
    sg.Cells[0, i] := IntToStr(i);
    sg.Cells[6, i] := 'DELETE';
  end;
end;

procedure TFrmCatatanPengeluaran.btnSimpanClick(Sender: TObject);
const
  ERROR_ = 'Pastikan banyak dan harga satuan tidak kosong atau 0';
var
  i: integer;
begin
  //jika update dan ada perubahan, buat log
  //delete yang lama, masukkan yang baru
  //refresh listview

  if not IsValuesCorrect then
  begin
    MessageDlg(ERROR_, mtError, [mbOK], 0);
    exit;
  end;
  //_____ cek nilai

  if StrToInt(UnFormatRp(AnsiReplaceStr(lblTotAkhir.Caption, 'Rp.', ''))) <= 0
    then
  begin
    MessageDlg('tidak ada yang bisa disimpan. Nilai Total = 0',
      mtInformation, [mbOK], 0);
    exit;
  end;

  if MessageDlg('Apakah anda yakin ingin menyimpan data ini ?', mtConfirmation,
    [mbYes] + [mbNo], 0) <> mrYes then
    exit;

  //___delete yang lama__
  dm.ExecSQL('delete from data_pengeluaran where tgl = "%s"',
    [MySQLDateFormat(calender.Text)], DM.mySQLQuery1);

  //_____save___________
  {loop i s/d sg.rowcount -1
  jika item TIDAK kosong, maka insert
  }
  for i := 1 to sg.RowCount - 1 do
  begin
    if sg.Cells[1, i] <> EmptyStr then
    begin
      {no,item,banyak,harga satuan,total,keterangan}
      dm.ExecSQL(
        'insert into data_pengeluaran(item,banyak,harga_satuan,keterangan,tgl,id_pegawai)'#13 +
        '            values ("%s",%d,%d,"%s","%s",%d)',
        [sg.Cells[1, i],
        StrToInt(sg.Cells[2, i]),
          StrToInt(UnFormatRp(sg.Cells[3, i])),
          sg.Cells[5, i],
          mySQLDateFormat(calender.Text),
          dm.iAPPid],
          DM.mySQLQuery1);
    end;
  end;
  LoadAllDataPengeluaran;
  GetDistinctItems;
  SetBtnEnabledStatus(false, false);
end;

procedure TFrmCatatanPengeluaran.cmbItemExit(Sender: TObject);
begin
  {no,item,banyak,harga satuan,total,keterangan}
  sg.Cells[1, sg.Row] := cmbItem.Text;
end;

procedure TFrmCatatanPengeluaran.eBanyakKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited KeyPress(Key);
  if (key <> #8) then
    if (key < '0') or (key > '9') then
      key := #0;
end;

procedure TFrmCatatanPengeluaran.eHargaSatuanKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited KeyPress(Key);
  if (key <> #8) then
    if (key < '0') or (key > '9') then
      key := #0;
end;

procedure TFrmCatatanPengeluaran.eBanyakExit(Sender: TObject);
begin
  {no,item,banyak,harga satuan,total,keterangan}
  if eBanyak.Text = EmptyStr then
    exit;

  if sg.Cells[1, sg.Row] = EmptyStr then
  begin
    MessageDlg('nama item belum terisi!'#13 +
      'masukkan dahulu nama item,'#13 +
      'kemudian masukkan banyak dan harga satuan', mtError, [mbOK], 0);
    Exit;
  end;

  if StrToInt(Trim(eBanyak.Text)) <= 0 then
  begin
    MessageDlg('Banyak item harus lebih besar dari 0', mtError, [mbOK], 0);
    eBanyak.SetFocus;
    Exit;
  end;
  sg.Cells[2, sg.Row] := eBanyak.Text;
end;

procedure TFrmCatatanPengeluaran.eHargaSatuanExit(Sender: TObject);
begin
  {no,item,banyak,harga satuan,total,keterangan}
  if eHargaSatuan.Text = EmptyStr then
    exit;

  if sg.Cells[1, sg.Row] = EmptyStr then
  begin
    MessageDlg('nama item belum terisi!'#13 +
      'masukkan dahulu nama item,'#13 +
      'kemudian masukkan banyak dan harga satuan', mtError, [mbOK], 0);
    Exit;
  end;

  if StrToInt(Trim(eHargaSatuan.Text)) <= 0 then
  begin
    MessageDlg('harga satuan harus lebih besar dari 0', mtError, [mbOK], 0);
    eHargaSatuan.SetFocus;
    Exit;
  end;
  sg.Cells[3, sg.Row] := FormatRp(eHargaSatuan.Text);
end;

procedure TFrmCatatanPengeluaran.mmKeteranganExit(Sender: TObject);
begin
  {no,item,banyak,harga satuan,total,keterangan}
  sg.Cells[5, sg.Row] := mmKeterangan.Text;
end;

procedure TFrmCatatanPengeluaran.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TFrmCatatanPengeluaran.btnBatalClick(Sender: TObject);
begin
  LoadAllDataPengeluaran;
end;

function TFrmCatatanPengeluaran.IsValuesCorrect: boolean;
var
  i: integer;
  tmpTotal: Currency;
begin
  {no,item,banyak,harga satuan,total,keterangan,delete}
  tmpTotal := 0;
  for i := 1 to sg.RowCount - 1 do
  begin
    if sg.Cells[1, i] <> EmptyStr then
    begin
      //pastikan kalo col banyak tdak boleh emptystring atau <=0
      //pastikan kalo col harga satuan tidak boleh emptystring atau <=0
      if (sg.Cells[2, i] = EmptyStr) or (StrToInt(sg.Cells[2, i]) <= 0) then
      begin
        Result := false;
        Exit;
      end;

      if (sg.Cells[3, i] = EmptyStr) or
        (StrToInt(UnFormatRp(sg.Cells[3, i])) <= 0) then
      begin
        Result := false;
        Exit;
      end;
      sg.Cells[4, i] :=
        FormatRp(IntToStr(
        StrToInt(sg.Cells[2, i]) *
        StrToInt(UnFormatRp(sg.Cells[3, i]))));
      tmpTotal := tmpTotal + StrToCurr(UnFormatRP(sg.Cells[4, i]));
    end;
  end;
  lblTotAkhir.Caption := 'Rp.' + FormatRp(CurrToStr(tmpTotal));
  Result := True;
end;

procedure TFrmCatatanPengeluaran.btnKeluarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCatatanPengeluaran.SetBtnEnabledStatus(bBatal,
  bSimpan: boolean);
begin
  btnBatal.Enabled := False;
  btnSimpan.Enabled := False;

  btnBatal.Enabled := bBatal;
  btnSimpan.Enabled := bSimpan;
end;

procedure TFrmCatatanPengeluaran.cmbItemChange(Sender: TObject);
begin
  SetBtnEnabledStatus(true, True);
end;

procedure TFrmCatatanPengeluaran.FormShow(Sender: TObject);
begin
  formatbtn(self);
end;

procedure TFrmCatatanPengeluaran.Delete1Click(Sender: TObject);
begin
  {no,item,banyak,harga satuan,total,keterangan}
end;

end.

