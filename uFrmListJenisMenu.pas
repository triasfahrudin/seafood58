unit uFrmListJenisMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, sButton, Menus,
  NxColumnClasses, NxColumns, NxScrollControl, NxCustomGridControl,
  NxCustomGrid, NxGrid;

type
  TFrmListJenisMenu = class(TForm)
    pm1: TPopupMenu;
    Add1: TMenuItem;
    Delete1: TMenuItem;
    btnKeluar: TsButton;
    grid: TNextGrid;
    NxTextColumn1: TNxTextColumn;
    NxTextColumn2: TNxTextColumn;
    NxColorColumn1: TNxColorColumn;
    NxIncrementColumn1: TNxIncrementColumn;
    procedure Add1Click(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure btnKeluarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gridAfterEdit(Sender: TObject; ACol, ARow: Integer;
      Value: WideString);
    procedure gridCellFormating(Sender: TObject; ACol, ARow: Integer;
      var TextColor: TColor; var FontStyle: TFontStyles;
      CellState: TCellState);
    procedure FormShow(Sender: TObject);
  private

  public

    procedure LoadAllJenisMenu;
  end;

var
  FrmListJenisMenu: TFrmListJenisMenu;

implementation

{$R *.dfm}
uses
  uDM, DB, uLibrary;

procedure TFrmListJenisMenu.LoadAllJenisMenu;
begin
  dm.ExecSQL('select id,nama,warna from data_jenismenu', [], dm.mySQLQuery1);
  grid.ClearRows;
  dm.mySQLQuery1.First;
  while not dm.mySQLQuery1.Eof do
  begin
    with grid, dm.mySQLQuery1 do
    begin
      AddRow(1);
      Cell[0, grid.RowCount - 1].AsInteger := Fields[0].AsInteger;
      Cell[2, grid.RowCount - 1].AsString := Fields[1].AsString;
      Cell[3, grid.RowCount - 1].AsString := Fields[2].AsString;
    end;
    dm.mySQLQuery1.Next;
  end;
end;

procedure TFrmListJenisMenu.Add1Click(Sender: TObject);
var
  tmpStr: string;
begin
  tmpStr := InputBox('Nama', 'Masukkan nama jenis menu', '');
  if tmpStr = EmptyStr then
    exit;
  dm.ExecSQL('select count(*) from data_jenismenu where nama = "%s"', [tmpStr],
    dm.mySQLQuery1);
  dm.mySQLQuery1.First;
  if dm.mySQLQuery1.Fields[0].AsInteger > 0 then
  begin
    MessageDlg('Nama ini sudah ada,pilih nama lain', mtError, [mbOK], 0);
    Exit;
  end;

  dm.ExecSQL('insert into data_jenismenu(nama,warna) values("%s","%s")',
    [tmpStr, '$00566A22'],
    dm.mySQLQuery1);
  LoadAllJenisMenu;
end;

procedure TFrmListJenisMenu.Delete1Click(Sender: TObject);
begin
  if grid.SelectedRow = -1 then
  begin
    MessageDlg('tidak ada yang terpilih', mtError, [mbOK], 0);
    exit;
  end;

  dm.ExecSQL('select count(*) from data_menus where id_jenismenu = %d',
    [grid.Cell[0, Grid.SelectedRow].AsInteger], Dm.mySQLQuery1);

  if DM.mySQLQuery1.Fields[0].AsInteger > 0 then
  begin
    MessageDlg('jenis menu ini digunakan oleh ' +
      DM.mySQLQuery1.Fields[0].AsString + ' menu'#13 +
      'sehingga tidak diperbolehkan untuk menghapusnya', mtError, [mbOK], 0);
    Exit;
  end;

  {****************************************************************************}
  if not DM.bIsSinuhun then
  begin
    if isAllowPriv(LISTJENISMENU_DELETE) = 'N' then
      ShowAuthorization(LISTJENISMENU_DELETE);
    if isAllowPriv(LISTJENISMENU_DELETE) = 'N' then
      Exit;
  end;
  {****************************************************************************}

  if MessageDlg('Apakah anda yakin ingin menghapus:' +
    grid.Cell[2, Grid.SelectedRow].AsString,
    mtConfirmation, [mbYes] + [mbNo], 0) <> mrYes then
  begin
    DeletePriv(LISTJENISMENU_DELETE);
    Exit;
  end;
  dm.ExecSQL('delete from data_jenismenu where id = %d',
    [StrToInt(grid.Cell[0, Grid.SelectedRow].AsString)], dm.mySQLQuery1);

  {****************************************************************************}
  InsertData_Perubahan(
    'Delete List jenis Menu:' + grid.Cell[2, Grid.SelectedRow].AsString);
  DeletePriv(LISTJENISMENU_DELETE);
  {****************************************************************************}
  LoadAllJenisMenu;
end;

procedure TFrmListJenisMenu.btnKeluarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmListJenisMenu.FormCreate(Sender: TObject);
begin
  LoadAllJenisMenu;
end;

procedure TFrmListJenisMenu.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmListJenisMenu.gridAfterEdit(Sender: TObject; ACol,
  ARow: Integer; Value: WideString);
begin
  case ACol of
    2:
      begin
        dm.ExecSQL('update data_jenismenu set nama = "%s" where id = %d',
          [grid.Cell[2, ARow].AsString, grid.Cell[0, ARow].AsInteger],
          Dm.MySQLQuery1);
      end;
    3:
      begin
        dm.ExecSQL('update data_jenismenu set warna = "%s" where id = %d',
          [grid.Cell[3, ARow].AsString, grid.Cell[0, ARow].AsInteger],
          Dm.MySQLQuery1);
      end;
  end;
end;

procedure TFrmListJenisMenu.gridCellFormating(Sender: TObject; ACol,
  ARow: Integer; var TextColor: TColor; var FontStyle: TFontStyles;
  CellState: TCellState);
begin

  TextColor := StringToColor(grid.Cell[3, ARow].AsString);
end;

procedure TFrmListJenisMenu.FormShow(Sender: TObject);
begin
  formatbtn(self);
end;

end.
