unit uFrmMasterEmployees_1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, NxColumnClasses, NxColumns, NxScrollControl,
  NxCustomGridControl, NxCustomGrid, NxGrid, StdCtrls, sButton, Menus,
  sLabel;

type
  TFrmMasterEmployees_1 = class(TForm)
    grid: TNextGrid;
    NxIncrementColumn1: TNxIncrementColumn;
    nama: TNxTextColumn;
    NxCheckBoxColumn1: TNxCheckBoxColumn;
    NxTextColumn2: TNxTextColumn;
    NxTextColumn3: TNxTextColumn;
    btnKeluar: TsButton;
    NxTextColumn4: TNxNumberColumn;
    MainMenu1: TMainMenu;
    Delete1: TMenuItem;
    sLabel1: TsLabel;
    NxCheckBoxColumn2: TNxCheckBoxColumn;
    procedure gridAfterEdit(Sender: TObject; ACol, ARow: Integer;
      Value: WideString);
    procedure gridBeforeEdit(Sender: TObject; ACol, ARow: Integer;
      var Accept: Boolean);
    procedure gridInputAccept(Sender: TObject; var Accept: Boolean);
    procedure gridInputAdded(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure gridCellClick(Sender: TObject; ACol, ARow: Integer);
    procedure btnKeluarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private

  public

    bEdited: boolean;
    sOldNama: string;
    procedure LoadAllEmployees;
  end;

var
  FrmMasterEmployees_1: TFrmMasterEmployees_1;

implementation

uses uDM, DB, uFrmPrivilege, uLibrary;

{$R *.dfm}

procedure TFrmMasterEmployees_1.LoadAllEmployees;
begin
  dm.ExecSQL(
    'select id,isactive,nama,privilege,issinuhun'#13 +
    'from data_pegawai', [], dm.mySQLQuery1);
  grid.ClearRows;
  dm.mySQLQuery1.First;
  while not dm.mySQLQuery1.Eof do
  begin
    with grid, dm.mySQLQuery1 do
    begin
      AddRow(1);
      Cell[0, RowCount - 1].AsInteger := Fields[0].AsInteger;
      if Fields[1].AsInteger = 1 then
        Cell[2, RowCount - 1].AsBoolean := true
      else
        Cell[2, RowCount - 1].AsBoolean := False;

      Cell[3, RowCount - 1].AsString := Fields[2].AsString;
      Cell[5, RowCount - 1].AsString := copy(Fields[3].AsString, 1, 10) + '...';

      if Fields[4].AsInteger = 1 then
        Cell[6, RowCount - 1].AsBoolean := true
      else
        Cell[6, RowCount - 1].AsBoolean := False;

      Next;
    end;
  end;
end;

procedure TFrmMasterEmployees_1.gridAfterEdit(Sender: TObject; ACol,
  ARow: Integer; Value: WideString);
var
  iActive: integer;
  iSinuhun: integer;
begin
  case ACol of
    2:
      begin
        if grid.Cell[2, ARow].AsBoolean = True then
          iActive := 1
        else
          iActive := 0;
        dm.ExecSQL('update data_pegawai set isactive = %d where id = %d',
          [iActive, grid.Cell[0, ARow].AsInteger], Dm.mySQLQuery1);
      end;
    6:
      begin
        if grid.Cell[6, ARow].AsBoolean = True then
          iSinuhun := 1
        else
          iSinuhun := 0;
        dm.ExecSQL('update data_pegawai set issinuhun = %d where id = %d',
          [iSinuhun, grid.Cell[0, ARow].AsInteger], Dm.mySQLQuery1);

        if dm.iAPPid = grid.Cell[0, ARow].AsInteger then
        begin
          case iSinuhun of
            0: dm.bIsSinuhun := False;
            1: dm.bIsSinuhun := True;
          end;
        end;
      end;
    3:
      begin
        if Value = EmptyStr then
        begin
          MessageDlg('Nama tidak boleh kosong', mtError, [mbOK], 0);
          grid.Cell[3, ARow].AsString := sOldNama;
          bEdited := False;
          Exit;
        end;
        if Value <> sOldNama then
        begin
          dm.ExecSQL(
            'select count(id)'#13 +
            'from data_pegawai'#13 +
            'where nama = "%s" and id <> %d', [grid.Cell[3, ARow].AsString,
            grid.Cell[0, ARow].AsInteger], dm.MySQLQuery1);
          dm.mySQLQuery1.First;
          if dm.mySQLQuery1.Fields[0].AsInteger > 0 then
          begin
            MessageDlg('Nama ini sudah terpakai, cari nama lain', mtWarning,
              [mbOK], 0);
            grid.Cell[3, ARow].AsString := sOldNama;
            bEdited := False;
            Exit;
          end;
          dm.ExecSQL('update data_pegawai set nama = "%s" where id = %d',
            [grid.Cell[3, ARow].AsString, grid.Cell[0, ARow].AsInteger],
            dm.mySQLQuery1);
        end;
      end;
  end;
  bEdited := False;
end;

procedure TFrmMasterEmployees_1.gridBeforeEdit(Sender: TObject; ACol,
  ARow: Integer; var Accept: Boolean);
begin
  bEdited := True;
  if ACol = 3 then
    sOldNama := grid.Cell[3, ARow].AsString;
end;

procedure TFrmMasterEmployees_1.gridInputAccept(Sender: TObject;
  var Accept: Boolean);
begin
  if nama.InputValue = EmptyStr then
  begin
    Accept := False;
    Exit;
  end;

  dm.ExecSQL('select count(*) from data_pegawai where nama = "%s"',
    [nama.InputValue], dm.mySQLQuery1);
  dm.mySQLQuery1.First;
  if dm.mySQLQuery1.Fields[0].AsInteger > 0 then
  begin
    MessageDlg('Nama ini sudah ada,pilih nama lain', mtError, [mbOK], 0);
    nama.InputValue := EmptyStr;
    Accept := False;
    Exit;
  end;

  dm.ExecSQL('insert into data_pegawai(nama) values("%s")',
    [nama.InputValue], dm.mySQLQuery1);
end;

procedure TFrmMasterEmployees_1.gridInputAdded(Sender: TObject);
begin
  grid.ClearRows;
  LoadAllEmployees;
end;

procedure TFrmMasterEmployees_1.FormCreate(Sender: TObject);
begin
  LoadAllEmployees;
end;

procedure TFrmMasterEmployees_1.Delete1Click(Sender: TObject);
begin
  if bEdited then
    Exit;
  if grid.SelectedCount = 0 then
    Exit;

  if dm.iAPPid = grid.Cell[0, grid.SelectedRow].AsInteger then
  begin
    MessageDlg('Anda tidak diperkenankan untuk menghapus data anda sendiri',
      mtError, [mbOK], 0);
    Exit;
  end;
  {****************************************************************************}
  if not DM.bIsSinuhun then
  begin
    if isAllowPriv(MASTEREMPLOYEES_DELETE) = 'N' then
      ShowAuthorization(MASTEREMPLOYEES_DELETE);
    if isAllowPriv(MASTEREMPLOYEES_DELETE) = 'N' then
      Exit;
  end;
  {****************************************************************************}

  if MessageDlg('Apakah anda yakin ingin menghapus data ini ?'#13 +
    'Nama:' + grid.Cell[3, grid.SelectedRow].AsString, mtConfirmation,
    [mbYes] + [mbCancel], 0) <> mrYes then
  begin
    DeletePriv(MASTEREMPLOYEES_DELETE);
    Exit;
  end;
  dm.ExecSQL('delete from data_pegawai where id = %d',
    [grid.Cell[0, grid.SelectedRow].AsInteger], dm.mySQLQuery1);

  {****************************************************************************}
  InsertData_Perubahan('Delete Master Employees'#13 +
    'Nama: ' + grid.Cell[3, Grid.SelectedRow].AsString);
  DeletePriv(MASTEREMPLOYEES_DELETE);
  {****************************************************************************}

  LoadAllEmployees;
end;

procedure TFrmMasterEmployees_1.gridCellClick(Sender: TObject; ACol,
  ARow: Integer);
begin
  if ACol = 4 then
  begin
    if MessageDlg('Apakah anda ingin mereset password user ini ?'#13 +
      grid.Cell[3, ARow].AsString, mtConfirmation, [mbYes] + [mbCancel], 0) <>
      mrYes then
      Exit;
    if dm.ExecSQL('update data_pegawai set password = "%s" where id = %d',
      [EmptyStr, grid.Cell[0, ARow].AsInteger], Dm.mySQLQuery1) then
      MessageDlg('Password telah direset', mtInformation, [mbOK], 0)
    else
      MessageDlg('Password GAGAL direset', mtError, [mbOK], 0);
  end;

  if ACol = 5 then
  begin
    ActivateForm('FrmPrivilege', TFrmPrivilege, FrmPrivilege);
    FrmPrivilege.iPegawai := grid.Cell[0, ARow].AsInteger;
    FrmPrivilege.ShowModal;
    LoadAllEmployees;
  end;
end;

procedure TFrmMasterEmployees_1.btnKeluarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmMasterEmployees_1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
