unit uFrmBahanPembentuk;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, sPanel, NxScrollControl, NxCustomGridControl,
  NxCustomGrid, NxGrid, NxColumns, NxColumnClasses, StdCtrls, sButton,
  Menus;

type
  TFrmBahanPembentuk = class(TForm)
    sPanel1: TsPanel;
    grid: TNextGrid;
    sPanel2: TsPanel;
    btnkeluar: TsButton;
    NxIncrementColumn1: TNxIncrementColumn;
    banyak: TNxNumberColumn;
    satuan: TNxComboBoxColumn;
    Label1: TLabel;
    nama: TNxComboBoxColumn;
    NxNumberColumn1: TNxNumberColumn;
    MainMenu1: TMainMenu;
    Delete1: TMenuItem;
    procedure Delete1Click(Sender: TObject);
    procedure gridAfterEdit(Sender: TObject; ACol, ARow: Integer;
      Value: WideString);
    procedure gridBeforeEdit(Sender: TObject; ACol, ARow: Integer;
      var Accept: Boolean);
    procedure gridInputAccept(Sender: TObject; var Accept: Boolean);
    procedure gridInputAdded(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnkeluarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    iIdMenuRef: integer;
    bEdited: boolean;
    sOldNama: string;
    CalledFrom: byte;
    iIdMeja: integer;
    procedure LoadAllData;
  end;

  {****************************************************************************}
const
  //  PERMANENTLYALLOW = 'PERMANENTLY';
  //  ALLOWDELETE = 'BAHANPEMBENTUK_DELETE';
  //  ALLOWEDIT = 'BAHANPEMBENTUK_EDIT';
    {****************************************************************************}
  cFrmMain = 1;
  cFrmMasterMenu_2 = 2;

var
  FrmBahanPembentuk: TFrmBahanPembentuk;

implementation

{$R *.dfm}
uses
  uLibrary, uDM, DB;

procedure TFrmBahanPembentuk.LoadAllData;
begin
  case CalledFrom of
    cFrmMain:
      begin
        dm.ExecSQL(
          'select a.id,b.nama,a.banyak,c.nama'#13 +
          'from temp_bahanpembentuk a'#13 +
          'left join data_subjenismenu b'#13 +
          'on a.id_subjenismenu = b.id'#13 +
          'left join data_satuan c'#13 +
          'on a.id_Satuan = c.id'#13 +
          'where id_menu = %d and id_meja = %d',
          [iIdMenuRef, iIdMeja], dm.mySQLQuery1);
      end;
    cFrmMasterMenu_2:
      begin
        dm.ExecSQL(
          'select a.id,b.nama,a.banyak,c.nama'#13 +
          'from data_menus_bahanpembentuk a'#13 +
          'left join data_subjenismenu b'#13 +
          'on a.id_subjenismenu = b.id'#13 +
          'left join data_satuan c'#13 +
          'on a.id_Satuan = c.id'#13 +
          'where id_menu = %d', [iIdMenuRef], dm.mySQLQuery1);
      end;
  end;

  dm.mySQLQuery1.First;
  grid.ClearRows;
  while not dm.mySQLQuery1.Eof do
  begin
    with dm.mySQLQuery1, grid do
    begin
      AddRow(1);
      Cell[1, RowCount - 1].AsInteger := Fields[0].AsInteger; //id
      Cell[2, RowCount - 1].AsString := Fields[1].AsString; //nama
      Cell[3, RowCount - 1].AsFloat := Fields[2].AsFloat; //banyak
      Cell[4, RowCount - 1].AsString := Fields[3].AsString; //satuan
    end;
    dm.mySQLQuery1.Next;
  end;
end;

procedure TFrmBahanPembentuk.Delete1Click(Sender: TObject);
begin
  //  if bEdited then
  //    Exit;
  if grid.SelectedCount = 0 then
    Exit;

  if CalledFrom = cFrmMain then
  begin
    {*Jika dipanggil dari FrmMain*}
    if MessageDlg('Apakah anda yakin ingin menghapus data ini ?'#13 +
      'Item:' + grid.Cell[2, grid.SelectedRow].AsString, mtConfirmation,
      [mbYes] + [mbCancel], 0) <> mrYes then
    begin
      DeletePriv(BAHANPEMBENTUK_DELETE);
      Exit;
    end;

    dm.ExecSQL('delete from temp_bahanpembentuk where id = %d',
      [grid.Cell[1, grid.SelectedRow].AsInteger], dm.mySQLQuery1);

    {****************************************************************************}
    InsertData_Perubahan(
      'Delete Data Bahan Pembentuk On FrontGrid:'#13 +
      'Item         :' + grid.Cell[2, Grid.SelectedRow].AsString + ''#13 +
      'Satuan       :' + grid.Cell[4, Grid.SelectedRow].AsString + ''#13 +
      'Banyak       :' + grid.Cell[3, Grid.SelectedRow].AsString);

    DeletePriv(BAHANPEMBENTUK_DELETE);
    {****************************************************************************}

    LoadAllData;
    Exit;
  end;

  {****************************************************************************}
  if not DM.bIsSinuhun then
  begin
    //    if not isAllowPriv(ALLOWDELETE + PERMANENTLYALLOW) then
    //      ShowAuthorization(ALLOWDELETE);
    //    if not (isAllowPriv(ALLOWDELETE) or isAllowPriv(ALLOWDELETE +
    //      PERMANENTLYALLOW)) then
    //      Exit;

    if isAllowPriv(BAHANPEMBENTUK_DELETE) = 'N' then
      ShowAuthorization(BAHANPEMBENTUK_DELETE);
    //___________entering form modal mode
    //........
    //___________exit form modal mode
    if isAllowPriv(BAHANPEMBENTUK_DELETE) = 'N' then
      Exit;
  end;
  {****************************************************************************}

  if MessageDlg('Apakah anda yakin ingin menghapus data ini ?'#13 +
    'Item:' + grid.Cell[2, grid.SelectedRow].AsString, mtConfirmation,
    [mbYes] + [mbCancel], 0) <> mrYes then
  begin
    DeletePriv(BAHANPEMBENTUK_DELETE);
    Exit;
  end;

  dm.ExecSQL('delete from data_menus_bahanpembentuk where id = %d',
    [grid.Cell[1, grid.SelectedRow].AsInteger], dm.mySQLQuery1);

  {****************************************************************************}
  InsertData_Perubahan(
    'Delete Data Bahan Pembentuk'#13 +
    'Item         :' + grid.Cell[2, Grid.SelectedRow].AsString + ''#13 +
    'Satuan       :' + grid.Cell[4, Grid.SelectedRow].AsString + ''#13 +
    'Banyak       :' + grid.Cell[3, Grid.SelectedRow].AsString);

  DeletePriv(BAHANPEMBENTUK_DELETE);
  {****************************************************************************}

  LoadAllData;
end;

procedure TFrmBahanPembentuk.gridAfterEdit(Sender: TObject; ACol,
  ARow: Integer; Value: WideString);
var
  CurrIdSatuan: integer;
begin
  {TODO:cek nama double}
  case ACol of
    2:
      begin
        dm.ExecSQL(
          'update data_menus_bahanpembentuk'#13 +
          'set nama = "%s"'#13 +
          'where id = %d',
          [Value,
          grid.Cell[1, ARow].AsInteger],
            dm.mySQLQuery1);
      end;
    3:
      begin
        DecimalSeparator := '.';
        if CalledFrom = cFrmMain then
        begin
          dm.ExecSQL(
            'update temp_bahanpembentuk'#13 +
            'set banyak = %f'#13 +
            'where id = %d',
            [MySQLFloat(grid.Cell[3, ARow].AsString),
            grid.Cell[1, ARow].AsInteger], Dm.mySQLQuery1);
        end
        else
        begin
          dm.ExecSQL(
            'update data_menus_bahanpembentuk'#13 +
            'set banyak = %f'#13 +
            'where id = %d',
            [MySQLFloat(grid.Cell[3, ARow].AsString),
            grid.Cell[1, ARow].AsInteger], Dm.mySQLQuery1);
        end;
        DecimalSeparator := ',';
      end;
    4:
      begin
        //satuan
        CurrIdSatuan := GetIdSatuan(Value);
        dm.ExecSQL(
          'update data_menus_bahanpembentuk'#13 +
          'set id_satuan = %d'#13 +
          'where id = %d',
          [CurrIdSatuan, grid.Cell[1, ARow].AsInteger],
          DM.mySQLQuery1);
      end;
  end;
  bEdited := False;
end;

procedure TFrmBahanPembentuk.gridBeforeEdit(Sender: TObject; ACol,
  ARow: Integer; var Accept: Boolean);
begin
  sOldNama := grid.Cell[2, ARow].AsString;
  bEdited := True;
end;

procedure TFrmBahanPembentuk.gridInputAccept(Sender: TObject;
  var Accept: Boolean);
var
  CurrIdSatuan, iIdSubJnsMenu: integer;
begin
  {TODO:cek data ganda}

  if banyak.InputValue = EmptyStr then
    banyak.InputValue := '0';
  if nama.InputValue = EmptyStr then
  begin
    Accept := False;
    exit;
  end;
  if satuan.InputValue = EmptyStr then
  begin
    Accept := False;
    Exit;
  end;
  CurrIdSatuan := GetIdSatuan(satuan.InputValue);
  iIdSubJnsMenu := GetIdSubJenisMenu(nama.InputValue);

  if CalledFrom = cFrmMain then
  begin
    DecimalSeparator := '.';
    dm.ExecSQL(
      'insert into temp_bahanpembentuk'#13 +
      '  (id_meja,id_menu,id_subjenismenu,banyak,id_Satuan)'#13 +
      'values(%d,%d,%d,%f,%d)',
      [iIdMeja,
      iIdMenuRef,
        iIdSubJnsMenu,
        MySQLFloat(Banyak.InputValue),
        CurrIdSatuan], dm.mySQLQuery1);
    DecimalSeparator := ',';
    bEdited := False;
  end
  else
  begin
    DecimalSeparator := '.';
    dm.ExecSQL(
      'insert into data_menus_bahanpembentuk'#13 +
      '  (id_menu,id_subjenismenu,banyak,id_Satuan)'#13 +
      'values(%d,%d,%f,%d)',
      [iIdMenuRef,
      iIdSubJnsMenu,
        MySQLFloat(Banyak.InputValue),
        CurrIdSatuan], dm.mySQLQuery1);
    DecimalSeparator := ',';
    bEdited := False;
  end;
end;

procedure TFrmBahanPembentuk.gridInputAdded(Sender: TObject);
begin
  grid.ClearRows;
  LoadAllData;
end;

procedure TFrmBahanPembentuk.FormShow(Sender: TObject);
var
  sNama: string;
  sSatuan: string;
begin
  dm.ExecSQL(
    'select if(b.isBarcode = 1,'''', b.nama) as n1, c.nama as n2'#13 +
    'from data_menus c'#13 +
    'left join data_subjenismenu b'#13 +
    'on c.id_subjenismenu = b.id'#13 +
    'where c.id = %d', [iIdMenuRef], dm.mySQLQuery1);
  sNama := trim(dm.mySQLQuery1.Fields[0].AsString + ' ' +
    dm.mySQLQuery1.Fields[1].AsString);

  if CalledFrom = cFrmMasterMenu_2 then
  begin
    dm.ExecSQL(
      'select a.nama'#13 +
      'from data_satuan a'#13 +
      'left join data_menus b'#13 +
      'on a.id = b.id_satuan'#13 +
      'where b.id = %d', [iIdMenuRef], dm.mySQLQuery1);
    sSatuan := dm.mySQLQuery1.Fields[0].AsString;

    Label1.Caption := 'Bahan pembentuk untuk 1(satu) ' + sSatuan + ' ' + sNama;

  end
  else
  begin
    banyak.Options := banyak.Options + [coEditing];
    dm.ExecSQL(
      'select a.banyak,b.nama'#13 +
      'from temp_pendapatan a'#13 +
      'left join data_satuan b'#13 +
      'on a.id_satuan = b.id'#13 +
      'where a.id_meja = %d and'#13 +
      '      a.id_menu = %d', [iIdMeja, iIdMenuRef], dm.mySQLQuery1);
    sSatuan := dm.mySQLQuery1.Fields[1].AsString;

    Label1.Caption := 'Bahan pembentuk untuk ' +
      IntToStr(dm.mySQLQuery1.Fields[0].AsInteger) + ' ' +
      sSatuan + ' ' +
      sNama + ''#13 +
      'Nb:Jika anda merubah satuan atau banyak item pada grid awal'#13 +
      'maka item yang ada disini akan ter-reset ke item default';

  end;
  FillCmbSatuanNameOnly(satuan);
  LoadAllData;

  nama.Items.Clear;
  dm.ExecSQL(
    'select nama'#13 +
    'from data_subjenismenu'#13 +
    'where is_stok = 1 order by nama', [], dm.mySQLQuery1);

  dm.mySQLQuery1.First;
  while not dm.mySQLQuery1.Eof do
  begin
    nama.Items.Add(dm.mySQLQuery1.Fields[0].AsString);
    dm.mySQLQuery1.Next;
  end;
  btnkeluar.SetFocus;
end;

procedure TFrmBahanPembentuk.btnkeluarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmBahanPembentuk.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
