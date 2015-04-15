unit uFrmPenguranganStok;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, NxScrollControl, NxCustomGridControl, NxCustomGrid, NxGrid,
  ExtCtrls, sPanel, NxColumnClasses, NxColumns, StdCtrls, sButton,
  ESBPCSPanel, ESBPCSCalEdit, Menus, NxCollection, sMemo, sEdit, sComboBox,
  sLabel, sCheckBox, StrUtils,Math;

type
  TFrmPenguranganStok = class(TForm)
    sPanel1: TsPanel;
    btnKeluar: TsButton;
    sPanel2: TsPanel;
    cal: TESBCalEdit;
    btnNext: TsButton;
    btnPrev: TsButton;
    MainMenu1: TMainMenu;
    Delete1: TMenuItem;
    NxFlipPanel1: TNxFlipPanel;
    grid: TNextGrid;
    NxIncrementColumn1: TNxIncrementColumn;
    Id: TNxNumberColumn;
    items: TNxComboBoxColumn;
    banyak: TNxNumberColumn;
    satuan: TNxComboBoxColumn;
    harga_satuan: TNxNumberColumn;
    NxNumberColumn3: TNxNumberColumn;
    alasan: TNxTextColumn;
    NxFlipPanel2: TNxFlipPanel;
    sLabel2: TsLabel;
    cmb1: TsComboBox;
    sLabel4: TsLabel;
    e1: TsEdit;
    cmb2: TsComboBox;
    sLabel5: TsLabel;
    e2: TsEdit;
    sLabel6: TsLabel;
    mm1: TsMemo;
    btnBaru: TsButton;
    btnBatal: TsButton;
    btnSimpan: TsButton;
    cb1: TsCheckBox;
    is_pengurangan: TNxCheckBoxColumn;
    procedure gridAfterEdit(Sender: TObject; ACol, ARow: Integer;
      Value: WideString);
    procedure gridBeforeEdit(Sender: TObject; ACol, ARow: Integer;
      var Accept: Boolean);
    procedure gridInputAccept(Sender: TObject; var Accept: Boolean);
    procedure Delete1Click(Sender: TObject);
    procedure calChange(Sender: TObject);
    procedure btnPrevClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnKeluarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmb2Enter(Sender: TObject);
    procedure e2KeyPress(Sender: TObject; var Key: Char);
    procedure e1KeyPress(Sender: TObject; var Key: Char);
    procedure cmb1KeyPress(Sender: TObject; var Key: Char);
    procedure cmb2KeyPress(Sender: TObject; var Key: Char);
    procedure btnBaruClick(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure btnBatalClick(Sender: TObject);
    procedure cmb1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    bEdited: boolean;
    procedure LoadAllData;
    procedure SetControlStatus(bBaru, bSimpan: boolean);
  end;

  {****************************************************************************}
const
  PERMANENTLYALLOW = 'PERMANENTLY';
  ALLOWDELETE = 'PENGURANGAN_STOK_DELETE';
  ALLOWEDIT = 'PENGURANGAN_STOK_EDIT';
  {****************************************************************************}

var
  FrmPenguranganStok: TFrmPenguranganStok;

implementation

uses uDM, DB, uLibrary;

{$R *.dfm}

{ TFrmPenguranganStok }

procedure TFrmPenguranganStok.LoadAllData;
begin
  dm.ExecSQL(
    'select a.id as id,'#13 +
    '       b.nama as nama_subjenismenu,'#13 +
    '       a.is_pengurangan,'#13 +
    '       a.banyak as banyak,'#13 +
    '       c.nama as satuan,'#13 +
    '       a.harga_satuan as harga_satuan,'#13 +
    '       a.alasan'#13 +
    'from data_perubahan_stok a'#13 +
    'left join data_subjenismenu b'#13 +
    'on a.id_subjenismenu = b.id'#13 +
    'left join data_satuan c'#13 +
    'on a.id_satuan = c.id'#13 +
    'where a.tgl = "%s"', [MySQLDateFormat(cal.Text)], dm.mySQLQuery1);

  grid.ClearRows;
  grid.BeginUpdate;
  dm.mySQLQuery1.First;
  while not dm.mySQLQuery1.Eof do
  begin
    with grid, dm.mySQLQuery1 do
    begin
      AddRow(1);
      Cell[1, RowCount - 1].AsInteger := Fields[0].AsInteger; //id
      Cell[2, RowCount - 1].AsString := Fields[1].AsString; //nama items
      if Fields[2].AsInteger = 1 then
        Cell[3, RowCount - 1].AsBoolean := True
      else
        Cell[3, RowCount - 1].AsBoolean := False;
      Cell[4, RowCount - 1].AsFloat := Fields[3].AsFloat; //banyak
      Cell[5, RowCount - 1].AsString := Fields[4].AsString; //nama satuan
      Cell[6, RowCount - 1].AsInteger := Fields[5].AsInteger; //harga satuan
      Cell[7, RowCount - 1].AsFloat := Fields[3].AsFloat * Fields[5].AsInteger;
      Cell[8, RowCount - 1].AsString := Fields[6].AsString; //keterangan
    end;
    dm.mySQLQuery1.Next;
  end;
  grid.EndUpdate;
  grid.CalculateFooter();
end;

procedure TFrmPenguranganStok.FormCreate(Sender: TObject);
begin
  LoadAllData;
  NxFlipPanel1.Enabled := True;
  NxFlipPanel2.Expanded := False;
end;

procedure TFrmPenguranganStok.btnPrevClick(Sender: TObject);
begin
  cal.AddDays(-1);
end;

procedure TFrmPenguranganStok.btnNextClick(Sender: TObject);
begin
  cal.AddDays(1);
end;

procedure TFrmPenguranganStok.gridAfterEdit(Sender: TObject; ACol,
  ARow: Integer; Value: WideString);
var
  iIdSubJenisMenu,
    iIdSatuan: integer;
begin
  iIdSubJenisMenu := GetIdSubJenisMenu(grid.Cell[2, ARow].AsString);
  iIdSatuan := GetIdSatuan(grid.Cell[4, ARow].AsString);

  DecimalSeparator := '.';
  dm.ExecSQL(
    'update data_perubahan_stok'#13 +
    'set id_subjenismenu = %d,'#13 +
    '    banyak = %f,'#13 +
    '    id_satuan = %d,'#13 +
    '    harga_satuan = %d,'#13 +
    '    alasan = "%s"'#13 +
    'where id = %d',
    [
    iIdSubJenisMenu,
      grid.Cell[4, ARow].AsFloat,
      iIdSatuan,
      grid.Cell[6, ARow].AsInteger,
      grid.Cell[8, ARow].AsString,
      grid.Cell[1, ARow].AsInteger], dm.mySQLQuery1);
  DecimalSeparator := ',';

  grid.Cell[7, ARow].AsFloat :=
    grid.Cell[4, ARow].AsFloat * grid.Cell[6, ARow].AsInteger;
  grid.CalculateFooter();
  bEdited := False;
end;

procedure TFrmPenguranganStok.btnKeluarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPenguranganStok.Delete1Click(Sender: TObject);
begin
  if bEdited then
    Exit;
  if grid.SelectedCount = 0 then
    Exit;

  {****************************************************************************}
  if not DM.bIsSinuhun then
  begin
    if not isAllowPriv(ALLOWDELETE + PERMANENTLYALLOW) then
      ShowAuthorization(ALLOWDELETE);
    if not (isAllowPriv(ALLOWDELETE) or isAllowPriv(ALLOWDELETE +
      PERMANENTLYALLOW)) then
      Exit;
  end;
  {****************************************************************************}

  if MessageDlg('Apakah anda yakin ingin menghapus data ini ?', mtConfirmation,
    [mbYes] + [mbCancel], 0) <> mrYes then
  begin
    DeletePriv(ALLOWDELETE);
    Exit;
  end;
  dm.ExecSQL('delete from data_pengurangan_stok where id = %d',
    [grid.Cell[1, grid.SelectedRow].AsInteger], dm.mySQLQuery1);

  {****************************************************************************}
  InsertData_Perubahan(
    'Delete Perubahan Stok:'#13 +
    'Pengurangan  :' + ifthen(grid.Cell[3, grid.SelectedRow].AsBoolean = True,
      'Ya', 'TIDAK') + ''#13 +
    'Subjenis     :' + grid.Cell[2, grid.SelectedRow].AsString + ''#13 +
    'Satuan       :' + grid.Cell[5, grid.SelectedRow].AsString + ''#13 +
    'banyak       :' + grid.Cell[4, grid.SelectedRow].AsString + ''#13 +
    'harga Satuan :' + grid.Cell[6, grid.SelectedRow].AsString + ''#13 +
    'Keterangan   :' + grid.Cell[8, grid.SelectedRow].AsString);

  DeletePriv(ALLOWDELETE);
  {****************************************************************************}

  LoadAllData;
end;

procedure TFrmPenguranganStok.gridBeforeEdit(Sender: TObject; ACol,
  ARow: Integer; var Accept: Boolean);
var
  currIdSatuan: integer;
begin
  bEdited := True;
  if ACol = 4 then
  begin
    currIdSatuan := GetIdSatuan(grid.Cell[4, ARow].AsString);
    FillCmbSatuan(satuan, currIdSatuan);
  end;
end;

procedure TFrmPenguranganStok.calChange(Sender: TObject);
begin
  LoadAllData;
end;

procedure TFrmPenguranganStok.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmPenguranganStok.FormShow(Sender: TObject);
begin
  cmb1.Items.Clear;
  dm.ExecSQL(
    'select nama'#13 +
    'from data_subjenismenu'#13 +
    'where is_stok = 1', [], dm.mySQLQuery1);

  dm.mySQLQuery1.First;
  while not dm.mySQLQuery1.Eof do
  begin
    Cmb1.Items.Add(dm.mySQLQuery1.Fields[0].AsString);
    dm.mySQLQuery1.Next;
  end;
end;

procedure TFrmPenguranganStok.gridInputAccept(Sender: TObject;
  var Accept: Boolean);
begin
  //
end;

procedure TFrmPenguranganStok.cmb2Enter(Sender: TObject);
var
  currIdSatuan: integer;
  iIdSubjenisMenu: integer;
begin
  if cmb1.Text = EmptyStr then
  begin
    MessageDlg('Pilih Nama Subjenis terlebih dahulu', mtWarning, [mbOK], 0);
    Exit;
  end;

  cmb2.Items.Clear;
  iIdSubjenisMenu := GetIdSubJenisMenu(Cmb1.Text);
  dm.ExecSQL(
    'select id_Satuan_laporan'#13 +
    'from data_subjenismenu'#13 +
    'where id = %d', [iIdSubjenisMenu], dm.mySQLQuery1);

  if dm.mySQLQuery1.RecordCount = 0 then
    Exit;

  currIdSatuan := dm.mySQLQuery1.Fields[0].AsInteger;

  dm.ExecSQL(
    'select nama'#13 +
    'from data_satuan'#13 +
    'where id in('#13 +
    'select id_konversi'#13 +
    'from data_satuankonv'#13 +
    'where id_dasar in (select id_dasar'#13 +
    '                   from data_satuankonv'#13 +
    '						 where id_konversi = %d))', [currIdSatuan], dm.mySQLQuery1);

  dm.mySQLQuery1.First;
  while not dm.mySQLQuery1.Eof do
  begin
    Cmb2.Items.Add(dm.mySQLQuery1.Fields[0].AsString);
    dm.mySQLQuery1.Next;
  end;
end;

procedure TFrmPenguranganStok.e2KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    mm1.SetFocus;
  if (key <> #8) then
    if (key < '0') or (key > '9') then
      key := #0;
end;

procedure TFrmPenguranganStok.e1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    cmb2.SetFocus;

  if not (key in ['0'..'9'] + [','] + [#8]) then
    key := #0;
end;

procedure TFrmPenguranganStok.cmb1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    e1.SetFocus;
end;

procedure TFrmPenguranganStok.cmb2KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    e2.SetFocus;
end;

procedure TFrmPenguranganStok.btnBaruClick(Sender: TObject);
begin
  cmb1.ItemIndex := 0;
  e1.Clear;
  cmb2.ItemIndex := 0;
  cmb2.Text := EmptyStr;
  e2.Clear;
  mm1.Clear;
  SetControlStatus(False, True);
  cmb1.SetFocus;
end;

procedure TFrmPenguranganStok.btnSimpanClick(Sender: TObject);
var
  iIdSatuan,
    iIdSubJenisMenu: integer;
begin
  if (cmb1.Text = EmptyStr) or (Cmb2.Text = EmptyStr) or
    (e1.Text = EmptyStr) or (e2.Text = EmptyStr) then
  begin
    MessageDlg('semua kolom harus terisi', mtWarning, [mbOK], 0);
    Exit;
  end;

  iIdSatuan := GetIdSatuan(Cmb2.Text);
  if iIdSatuan = -1 then
  begin
    MessageDlg(
      'Nama subjenis atau barcode ini tidak ditemukan,'#13 +
      'periksa kembali data anda', mtError, [mbOK], 0);
    Exit;
  end;

  iIdSubJenisMenu := GetIdSubJenisMenu(Cmb1.Text);

  DecimalSeparator := '.';
  dm.ExecSQL(
    'insert into data_perubahan_stok(id_subjenismenu,id_satuan,'#13 +
    '                              banyak,harga_satuan,alasan,'#13 +
    '                              tgl,id_pegawai,is_pengurangan)'#13 +
    'values(%d,%d,%f,%d,"%s","%s",%d,%d)',
    [iIdSubJenisMenu,
    iIdSatuan,
      MySQLFloat(e1.Text),
      StrToInt(e2.Text),
      mm1.Text,
      MySQLDateFormat(cal.Text),
      dm.iAPPid,
      ifthen(cb1.Checked = True,1,0)
      ], dm.mySQLQuery1);
  DecimalSeparator := ',';
  LoadAllData;
  SetControlStatus(True, False);
  btnBaru.SetFocus;
end;

procedure TFrmPenguranganStok.SetControlStatus(bBaru, bSimpan: boolean);
begin
  btnBaru.Enabled := bBaru;
  btnSimpan.Enabled := bSimpan;
  btnBatal.Enabled := bSimpan;
  cmb1.Enabled := bSimpan;
  e1.Enabled := bSimpan;
  cmb2.Enabled := bSimpan;
  e2.Enabled := bSimpan;
  mm1.Enabled := bSimpan;
end;

procedure TFrmPenguranganStok.btnBatalClick(Sender: TObject);
begin
  SetControlStatus(True, False);
  btnBaru.SetFocus;
end;

procedure TFrmPenguranganStok.cmb1Change(Sender: TObject);
begin
  cmb2.ItemIndex := -1;
end;

end.

