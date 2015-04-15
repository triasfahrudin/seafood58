unit uFrmModalAwal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sEdit, sComboBox, sButton, sLabel, ExtCtrls, sPanel,
  NxScrollControl, NxCustomGridControl,
  NxCustomGrid, NxGrid, NxColumnClasses, NxColumns, Menus;

type
  TFrmModalAwal = class(TForm)
    sPanel1: TsPanel;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    cmbBulan: TsComboBox;
    eTahun: TsEdit;
    grid: TNextGrid;
    btnClose: TsButton;
    NxIncrementColumn1: TNxIncrementColumn;
    besar: TNxNumberColumn;
    btnTampilkan: TsButton;
    NxNumberColumn2: TNxNumberColumn;
    MainMenu1: TMainMenu;
    Delete1: TMenuItem;
    tgl: TNxDateColumn;
    keterangan: TNxMemoColumn;
    daritutupbuku: TNxCheckBoxColumn;
    procedure btnTampilkanClick(Sender: TObject);
    procedure gridAfterEdit(Sender: TObject; ACol, ARow: Integer;
      Value: WideString);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure gridBeforeEdit(Sender: TObject; ACol, ARow: Integer;
      var Accept: Boolean);
    procedure gridInputAdded(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure gridInputAccept(Sender: TObject; var Accept: Boolean);
    procedure eTahunKeyPress(Sender: TObject; var Key: Char);
  private

  public

    bEdited: boolean;
    iOldValues: integer;
    bValuesChanges: boolean;
    procedure FillCmbBulan;
    procedure LoadModal(iBulan, iTahun: integer);
  end;

const
  arrBulan: array[1..12] of string[10] =
  ('Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember');

var
  FrmModalAwal: TFrmModalAwal;

implementation

uses uDM, DB, uLibrary;

{$R *.dfm}

procedure TFrmModalAwal.FillCmbBulan;
var
  i: integer;
begin
  cmbBulan.Items.Clear;
  for i := 1 to 12 do
    cmbBulan.Items.Add(arrBulan[i]);
end;

procedure TFrmModalAwal.btnTampilkanClick(Sender: TObject);
var
  iBln, iThn: integer;
begin
  iBln := cmbBulan.ItemIndex + 1;
  if eTahun.Text = EmptyStr then
  begin
    MessageDlg('tahun tidak boleh kosong', mtWarning, [mbOK], 0);
    Exit;
  end;
  iThn := StrToInt(eTahun.Text);
  LoadModal(iBln, iThn);
end;

procedure TFrmModalAwal.LoadModal(iBulan, iTahun: integer);
begin
  dm.ExecSQL(
    'select tgl,besar,id,keterangan,is_daritutupbuku'#13 +
    'from data_modal'#13 +
    'where month(tgl) = %d and year(tgl) = %d', [iBulan, iTahun],
    dm.mySQLQuery1);
  grid.ClearRows;
  dm.mySQLQuery1.First;
  while not dm.mySQLQuery1.Eof do
  begin

    with grid, dm.mySQLQuery1 do
    begin
      AddRow(1);
      Cell[1, grid.RowCount - 1].AsDateTime := Fields[0].AsDateTime;
      Cell[2, grid.RowCount - 1].AsInteger := Fields[1].AsInteger;
      Cell[3, grid.RowCount - 1].AsInteger := Fields[2].AsInteger;
      //______30/08/2010
      Cell[4, grid.RowCount - 1].AsString := Fields[3].AsString;
      if Fields[4].AsInteger = 1 then
        Cell[5, grid.RowCount - 1].AsBoolean := True
      else
        Cell[5, grid.RowCount - 1].AsBoolean := False;
    end;
    dm.mySQLQuery1.Next;
  end;
  grid.CalculateFooter();
end;

procedure TFrmModalAwal.gridAfterEdit(Sender: TObject; ACol, ARow: Integer;
  Value: WideString);
begin
  if ACol = 3 then
  begin
    if StrToInt(Value) <> iOldValues then
    begin
      if MessageDlg(
        'Perubahan ini akan mengakibatkan laporan yang terkait'#13 +
        'dengan modal pada tgl ini menjadi tidak valid, apakah anda yakin ?',
        mtConfirmation, [mbYes] + [mbNo], 0) <> mrYes then
      begin
        grid.Cell[2, ARow].AsInteger := iOldValues;
        Exit;
      end;
      dm.ExecSQL('update data_modal set besar = %d where id = %d',
        [grid.Cell[2, ARow].AsInteger,
        grid.Cell[3, ARow].AsInteger], dm.MySQLQuery1);
    end;
  end;

  bEdited := False;
end;

procedure TFrmModalAwal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmModalAwal.FormCreate(Sender: TObject);
var
  str: TStringDynArray;
begin
  FillCmbBulan;
  ShortDateFormat := 'MM/dd/yyyy';
  str := Explode('/', DateToStr(NOW));
  cmbBulan.ItemIndex := StrToInt(str[0]) - 1;
  eTahun.Text := str[2];
  LoadModal(StrToInt(str[0]), StrToInt(str[2]));
end;

procedure TFrmModalAwal.btnCloseClick(Sender: TObject);
begin
  ShortDateFormat := 'dd-MM-yyyy';
  Close;
end;

procedure TFrmModalAwal.gridBeforeEdit(Sender: TObject; ACol,
  ARow: Integer; var Accept: Boolean);
begin
  if grid.Cell[5, ARow].AsBoolean = True then
  begin
    if ACol = 2 then
    begin
      MessageDlg(
        'Modal dari tutup buku tidak dapat dirubah', mtError, [mbOK], 0);
      Accept := False;
      Exit;
    end;
  end;

  bEdited := True;
  if ACol = 2 then
    iOldValues := grid.Cell[2, ARow].AsInteger;
end;

procedure TFrmModalAwal.gridInputAdded(Sender: TObject);
begin
  grid.ClearRows;
  LoadModal(cmbBulan.ItemIndex + 1, StrToInt(eTahun.Text));
end;

procedure TFrmModalAwal.Delete1Click(Sender: TObject);
begin
  if bEdited then
    Exit;
  if grid.SelectedCount = 0 then
    Exit;

  {****************************************************************************}
  if not DM.bIsSinuhun then
  begin
    if isAllowPriv(MODALAWAL_DELETE) = 'N' then
      ShowAuthorization(MODALAWAL_DELETE);
    if isAllowPriv(MODALAWAL_DELETE) = 'N' then
      Exit;
  end;
  {****************************************************************************}

  if MessageDlg('Apakah anda yakin ingin menghapus data ini'#13 +
    'modal tgl:' + DateToStr(grid.Cell[0, grid.SelectedRow].AsDateTime) +
    ' dengan besar:' + CurrToStr(grid.Cell[2, grid.SelectedRow].AsInteger),
    mtConfirmation, [mbYes] + [mbNo], 0) <> mrYes then
  begin
    DeletePriv(MODALAWAL_DELETE);
    Exit;
  end;

  dm.ExecSQL('delete from data_modal where id = %d', [grid.Cell[3,
    grid.SelectedRow].AsInteger], dm.mySQLQuery1);

  {****************************************************************************}
  InsertData_Perubahan(
    'Delete Modal Awal'#13 +
    'Tgl   :' + grid.Cell[1, Grid.SelectedRow].AsString + ''#13 +
    'Besar :' + grid.Cell[2, Grid.SelectedRow].AsString);
  DeletePriv(MODALAWAL_DELETE);
  {****************************************************************************}

  LoadModal(cmbBulan.ItemIndex + 1, StrToInt(eTahun.Text));
end;

procedure TFrmModalAwal.gridInputAccept(Sender: TObject;
  var Accept: Boolean);

  function MySQLDateFormat_2(sDate: string): string;
  var
    StringArray: TStringDynArray;
  begin

    StringArray := Explode('/', sDate);
    Result := StringArray[2] + '-' + StringArray[0] + '-' + StringArray[1]
  end;

begin
  if StrToInt(besar.InputValue) = 0 then
  begin
    Accept := False;
    Exit
  end;
  dm.ExecSQL('select count(id) from data_modal where tgl = "%s"',
    [MySQLDateFormat_2(tgl.InputValue)], dm.mySQLQuery1);
  dm.mySQLQuery1.First;

  if dm.mySQLQuery1.Fields[0].AsInteger > 0 then
  begin
    MessageDlg('Modal Awal dengan tgl ini sudah dimasukkan!', mtWarning, [mbOK],
      0);
    Accept := False;
    Exit;
  end;
  dm.ExecSQL(
    'insert into data_modal(tgl,besar,id_pegawai)'#13 +
    'values ("%s",%d,%d)', [MySQLDateFormat_2(tgl.InputValue),
    StrToInt(besar.InputValue), DM.iAPPid], dm.mySQLQuery1);
end;

procedure TFrmModalAwal.eTahunKeyPress(Sender: TObject; var Key: Char);
begin
  inherited KeyPress(Key);
  if key = #13 then
    btnTampilkanClick(Sender);

  if (key <> #8) then
    if (key < '0') or (key > '9') then
      key := #0;

end;

end.
