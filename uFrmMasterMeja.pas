unit uFrmMasterMeja;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sButton, NxColumnClasses, NxColumns, NxScrollControl,
  NxCustomGridControl, NxCustomGrid, NxGrid, Menus;

type
  TFrmMasterMeja = class(TForm)
    grid: TNextGrid;
    NxIncrementColumn1: TNxIncrementColumn;
    NxTextColumn1: TNxTextColumn;
    nama: TNxTextColumn;
    btnClose: TsButton;
    sort: TNxNumberColumn;
    MainMenu1: TMainMenu;
    Delete1: TMenuItem;
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure gridAfterEdit(Sender: TObject; ACol, ARow: Integer;
      Value: WideString);
    procedure gridBeforeEdit(Sender: TObject; ACol, ARow: Integer;
      var Accept: Boolean);
    procedure gridInputAccept(Sender: TObject; var Accept: Boolean);
    procedure gridInputAdded(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
  private

  public

    bEdited: boolean;
    sOldNama: string;
    procedure LoadDataMeja;
  end;

var
  FrmMasterMeja: TFrmMasterMeja;

implementation

uses uDM, DB, uLibrary;

{$R *.dfm}

procedure TFrmMasterMeja.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmMasterMeja.LoadDataMeja;
begin

  dm.ExecSQL('select id,nama,sort from data_meja', [], dm.mySQLQuery1);
  grid.ClearRows;
  dm.mySQLQuery1.First;
  while not dm.mySQLQuery1.Eof do
  begin
    with grid, dm.mySQLQuery1 do
    begin
      AddRow(1);
      Cell[0, grid.RowCount - 1].AsInteger := Fields[0].AsInteger;
      Cell[2, grid.RowCount - 1].AsString := Fields[1].AsString;
      Cell[3, grid.RowCount - 1].AsInteger := Fields[2].AsInteger;
    end;
    dm.mySQLQuery1.Next;
  end;
end;

procedure TFrmMasterMeja.FormCreate(Sender: TObject);
begin
  LoadDataMeja;
end;

procedure TFrmMasterMeja.gridAfterEdit(Sender: TObject; ACol,
  ARow: Integer; Value: WideString);
begin
  case ACol of
    2:
      begin
        if Value <> sOldNama then
        begin
          dm.ExecSQL(
            'select count(id)'#13 +
            'from data_meja'#13 +
            'where nama = "%s" and id <> %d',
            [grid.Cell[2, ARow].AsString,
            grid.Cell[0, ARow].AsInteger], DM.mySQLQuery1);
          dm.mySQLQuery1.First;
          if dm.mySQLQuery1.Fields[0].AsInteger > 0 then
          begin
            MessageDlg('Nama ini sudah terpakai, cari nama lain', mtWarning,
              [mbOK], 0);
            grid.Cell[2, ARow].AsString := sOldNama;
            bEdited := False;
            Exit;
          end;
          dm.ExecSQL('update data_meja set nama = "%s" where id = %d',
            [grid.Cell[2, ARow].AsString,
            grid.Cell[0, ARow].AsInteger], dm.mySQLQuery1);
        end;
      end;
    3:
      begin
        dm.ExecSQL('update data_meja set sort = %d where id = %d',
          [grid.Cell[3, ARow].AsInteger,
          grid.Cell[0, ARow].AsInteger], dm.mySQLQuery1);
      end;
  end;

  bEdited := False;
end;

procedure TFrmMasterMeja.gridBeforeEdit(Sender: TObject; ACol,
  ARow: Integer; var Accept: Boolean);
begin
  bEdited := True;
  if ACol = 2 then
    sOldNama := grid.Cell[2, ARow].AsString;
end;

procedure TFrmMasterMeja.gridInputAccept(Sender: TObject;
  var Accept: Boolean);
begin
  if nama.InputValue = EmptyStr then
  begin
    Accept := False;
    Exit;
  end;

  dm.ExecSQL('select count(*) from data_meja where nama = "%s"',
    [nama.InputValue], dm.mySQLQuery1);
  dm.mySQLQuery1.First;
  if dm.mySQLQuery1.Fields[0].AsInteger > 0 then
  begin
    MessageDlg('Nama ini sudah ada,pilih nama lain', mtError, [mbOK], 0);
    nama.InputValue := EmptyStr;
    Accept := False;
    Exit;
  end;

  if sort.InputValue = EmptyStr then
  begin
    dm.ExecSQL('select max(sort) from data_meja', [], dm.mySQLQuery1);
    sort.InputValue := IntToStr(dm.mySQLQuery1.Fields[0].AsInteger + 1);
  end;

  dm.ExecSQL('insert into data_meja(nama,sort) values("%s",%d)',
    [nama.InputValue, StrToInt(sort.InputValue)], dm.mySQLQuery1);

end;

procedure TFrmMasterMeja.gridInputAdded(Sender: TObject);
begin
  grid.ClearRows;
  LoadDataMeja;
end;

procedure TFrmMasterMeja.Delete1Click(Sender: TObject);
begin
  if bEdited then
    Exit;
  if grid.SelectedCount = 0 then
    Exit;

  dm.ExecSQL('select count(*) from data_pendapatan where id_meja = %d',
    [grid.Cell[0, Grid.SelectedRow].AsInteger], Dm.mySQLQuery1);

  if DM.mySQLQuery1.Fields[0].AsInteger > 0 then
  begin
    MessageDlg(
      'meja ini digunakan oleh ' +
      DM.mySQLQuery1.Fields[0].AsString + ' pendapatan'#13 +
      'sehingga tidak diperbolehkan untuk menghapusnya', mtError, [mbOK], 0);
    Exit;
  end;

  dm.ExecSQL('select count(*) from temp_pendapatan where id_meja = %d',
    [grid.Cell[0, Grid.SelectedRow].AsInteger], Dm.mySQLQuery1);

  if DM.mySQLQuery1.Fields[0].AsInteger > 0 then
  begin
    MessageDlg(
      'meja ini sedang digunakan'#13 +
      'sehingga tidak diperbolehkan untuk menghapusnya', mtError, [mbOK], 0);
    Exit;
  end;

  if not DM.bIsSinuhun then
  begin
    if isAllowPriv(MASTERMEJA_DELETE) = 'N' then
      ShowAuthorization(MASTERMEJA_DELETE);
    if isAllowPriv(MASTERMEJA_DELETE) = 'N' then
      Exit;
  end;

  if MessageDlg('Apakah anda yakin ingin menghapus data ini ?'#13 +
    'Meja :' + grid.Cell[2, grid.SelectedRow].AsString, mtConfirmation,
    [mbYes] + [mbCancel], 0) <> mrYes then
  begin
    DeletePriv(MASTERMEJA_DELETE);
    Exit;
  end;
  dm.ExecSQL('delete from data_meja where id = %d', [grid.Cell[0,
    grid.SelectedRow].AsInteger], dm.mySQLQuery1);

  InsertData_Perubahan('Delete Meja:' + grid.Cell[2,
    Grid.SelectedRow].AsString);
  DeletePriv(MASTERMEJA_DELETE);

  LoadDataMeja;
end;

end.
