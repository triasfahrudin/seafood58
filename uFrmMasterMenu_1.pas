unit uFrmMasterMenu_1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, sPanel, ComCtrls, sPageControl, DynPanel, NxCollection,
  StdCtrls, sEdit, sButton, sComboBox, sLabel, NxScrollControl,
  NxCustomGridControl, NxCustomGrid, NxGrid, NxColumnClasses, NxColumns;

type
  TFrmMasterMenu_1 = class(TForm)
    NxHeaderPanel1: TNxHeaderPanel;
    sPageControl1: TsPageControl;
    sTabSheet1: TsTabSheet;
    grid1: TNextGrid;
    sTabSheet2: TsTabSheet;
    sTabSheet3: TsTabSheet;
    grid2: TNextGrid;
    grid3: TNextGrid;
    btnKeluar: TsButton;
    NxIncrementColumn1: TNxIncrementColumn;
    NxNumberColumn1: TNxNumberColumn;
    NxIncrementColumn2: TNxIncrementColumn;
    NxTextColumn3: TNxTextColumn;
    NxNumberColumn2: TNxNumberColumn;
    NxIncrementColumn3: TNxIncrementColumn;
    NxTextColumn4: TNxTextColumn;
    NxTextColumn5: TNxTextColumn;
    NxTextColumn6: TNxTextColumn;
    NxTextColumn8: TNxNumberColumn;
    NxTextColumn7: TNxNumberColumn;
    NxNumberColumn3: TNxNumberColumn;
    NxTextColumn10: TNxNumberColumn;
    NxTextColumn11: TNxNumberColumn;
    colSubmenu: TNxComboBoxColumn;
    NxTextColumn12: TNxTextColumn;
    colSatuan: TNxComboBoxColumn;

    procedure btnBatal1Click(Sender: TObject);
    procedure btnSimpan1Click(Sender: TObject);
    procedure grid1Click(Sender: TObject);
    procedure btnBaru2Click(Sender: TObject);
    procedure sPageControl1Change(Sender: TObject);
    procedure btnSimpan2Click(Sender: TObject);
    procedure btnSimpan3Click(Sender: TObject);
    procedure btnKeluarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LoadDataMakanan;
    procedure LoadDataMinuman;
    procedure LoadDataBarcode;
    procedure FillColSubMenu;
    procedure FillColSatuan;
  end;

var
  FrmMasterMenu_1: TFrmMasterMenu_1;

implementation

uses uDM, DB, NxCells;

{$R *.dfm}

{
data_jenismenu
 1->makanan
 2->minuman
 3->lain
}

//______________________________________________________________________________

procedure TFrmMasterMenu_1.LoadDataBarcode;
begin
  dm.ExecSQL(
    'select nama,barcode,harga'#13 +
    'from data_menus'#13 +
    'where id_jenismenu = 3', [], dm.mySQLQuery1);
  grid3.ClearRows;
  dm.mySQLQuery1.First;
  grid3.BeginUpdate;
  while not dm.mySQLQuery1.Eof do
  begin
    with grid3, dm.mySQLQuery1 do
    begin
      AddRow(1);
      {no,nama,barcode,harga}
      Cell[1, RowCount - 1].AsString := Fields[0].AsString; //nama
      Cell[2, RowCount - 1].AsInteger := Fields[1].AsInteger; //barcode
      Cell[3, RowCount - 1].AsInteger := Fields[2].AsInteger; //harga
    end;
    dm.mySQLQuery1.Next;
  end;
  grid1.EndUpdate;
end;

//______________________________________________________________________________

procedure TFrmMasterMenu_1.LoadDataMakanan;
begin

  dm.ExecSQL(
    'select b.id,'#13 +
    '       a.nama,'#13 +
    '       a.id,'#13 +
    '       b.nama,'#13 +
    '       c.nama,'#13 +
    '       c.id,'#13 +
    '       b.harga'#13 +
    'from data_subjenismenu a'#13 +
    'left join data_menus b'#13 +
    'on a.id = b.id_subjenismenu'#13 +
    'left join data_satuan c'#13 +
    'on b.id_satuan = c.id'#13 +
    'where b.id_jenismenu = 1'#13 +
    'order by b.id,a.id', [], dm.mySQLQuery1);
  grid1.ClearRows;
  dm.mySQLQuery1.First;
  grid1.BeginUpdate;
  while not dm.mySQLQuery1.Eof do
  begin
    with grid1, dm.mySQLQuery1 do
    begin
      AddRow(1);
      {id  0,0
      no 1,
      submenu 2,1
      id_submenu 3,2
      nama 4,3
      satuan 5,4
      id_satuan 6,5
      harga 7,6}

      Cell[0, RowCount - 1].AsString := Fields[0].AsString + ' ' +
        Fields[1].AsString; //nama lengkap
      Cell[2, RowCount - 1].AsString := Fields[1].AsString; //satuan
      Cell[3, RowCount - 1].AsInteger := Fields[2].AsInteger; //harga
      Cell[4, RowCount - 1].AsInteger := Fields[3].AsInteger; //id menu
      Cell[5, RowCount - 1].AsString := Fields[4].AsString; //subjenismenu
      Cell[6, RowCount - 1].AsInteger := Fields[5].AsInteger; //id_subjenismenu
      Cell[7, RowCount - 1].AsInteger := Fields[6].AsInteger; //id_satuan
    end;
    dm.mySQLQuery1.Next;
  end;
  grid1.EndUpdate;
end;

//______________________________________________________________________________

procedure TFrmMasterMenu_1.LoadDataMinuman;
begin
  {no,nama,harga,id}
  dm.ExecSQL(
    'select nama,harga,id'#13 +
    'from data_menus'#13 +
    'where id_jenismenu = 2'#13 +
    'order by id', [], dm.mySQLQuery1);
  grid2.ClearRows;
  dm.mySQLQuery1.First;
  grid2.BeginUpdate;
  while not dm.mySQLQuery1.Eof do
  begin
    with grid2, dm.mySQLQuery1 do
    begin
      AddRow(1);
      {no,nama,satuan,harga,id}
      Cell[1, RowCount - 1].AsString := Fields[0].AsString; //nama
      Cell[2, RowCount - 1].AsInteger := Fields[1].AsInteger; //harga
      Cell[3, RowCount - 1].AsInteger := Fields[2].AsInteger; //id
    end;
    dm.mySQLQuery1.Next;
  end;
  grid2.EndUpdate;

end;

//______________________________________________________________________________

procedure TFrmMasterMenu_1.btnBatal1Click(Sender: TObject);
begin

end;

//_______________________simpan makanan_________________________________________

procedure TFrmMasterMenu_1.btnSimpan1Click(Sender: TObject);
  function GetIdSatuan(strSatuan: string): integer;
  begin
    dm.ExecSQL('select id from data_satuan where nama = "%s"', [strSatuan],
      dm.mySQLQuery1);
    result := dm.mySQLQuery1.Fields[0].AsInteger;
  end;

  function GetIdSubJenisMenu(strSubJenisMenu: string): integer;
  begin
    dm.ExecSQL('select id from data_subjenismenu where nama = "%s"',
      [strSubJenisMenu], dm.mySQLQuery1);
    result := dm.mySQLQuery1.Fields[0].AsInteger;
  end;
var
  iIdSatuan: integer;
  iIdSubJenisMenu: integer;
begin
  //  iIdSatuan := GetIdSatuan(cmb2.Text);
  //  iIdSubJenisMenu := GetIdSubJenisMenu(cmb1.Text);

    //  if bNewDataMakanan then
    //  begin
    //nama,id_jenismenu = 1,id_satuan,harga,id_subjenismenu
  //  dm.ExecSQL(
  //    'insert into data_menus (nama,id_jenismenu,id_satuan,harga,id_subjenismenu)'#13 +
  //    'values("%s",%d,%d,%d,%d)', [e1.Text, 1, iIdSatuan, StrToInt(e2.Text),
  //    iIdSubJenisMenu], dm.mySQLQuery1);
    //  end
    //  else
    //  begin
    //    dm.ExecSQL(
    //      'update data_menus'#13 +
    //      'set nama = "%s",'#13 +
    //      '    id_satuan = %d,'#13 +
    //      '    harga = %d,'#13 +
    //      '    id_subjenismenu = %d'#13 +
    //      'where id = %d',
    //      [e1.Text, iIdSatuan, StrToInt(e2.Text), iIdSubJenisMenu, iIdMakanan],
    //      dm.mySQLQuery1);
    //  end;
  LoadDataMakanan;
  //  bNewDataMakanan := True;
  //  SetBtnMakananEnabledStatus(True, False, False);
  //  Grid1.Enabled := True;
end;

//______________________simpan minuman__________________________________________

procedure TFrmMasterMenu_1.btnSimpan2Click(Sender: TObject);
begin
  //  {no,nama,harga,id}
  //  if bNewDataMinuman then
  //  begin
//  dm.ExecSQL(
//    'insert into data_menus (nama,harga) values ("%s",%d)', [eMinumNama.Text,
//    StrToInt(eMinumHarga.Text)], DM.mySQLQuery1);
  //  end
  //  else
  //  begin
  //    dm.ExecSQL(
  //      'update data_menus set nama = "%s",harga = %d where id = %d',
  //      [eMinumNama.Text, StrToInt(eMinumHarga.Text), iIdMinuman],
  //      dm.mySQLQuery1);
  //  end;
  LoadDataMinuman;
  //bNewDataMinuman := True;
  //SetBtnMinumanEnabledStatus(True, False, False);
  //grid2.Enabled := True;
end;

procedure TFrmMasterMenu_1.grid1Click(Sender: TObject);
begin
  {no,nama,satuan,harga,id}

//  with grid1 do
//  begin
//    cmb1.Text := Cell[5, SelectedRow].AsString;
//    e1.Text := StringReplace(Cell[1, SelectedRow].AsString, Cell[5,
//      SelectedRow].AsString, EmptyStr, [rfReplaceAll, rfIgnoreCase]);
//    cmb2.Text := Cell[2, SelectedRow].AsString;
//    e2.Text := Cell[3, SelectedRow].AsString;
//  end;
//  bNewDataMakanan := false;
//  SetBtnMakananEnabledStatus(False, True, True);
//  iIdMakanan := grid1.Cell[4, grid1.SelectedRow].AsInteger;
//  cmb1.SetFocus;
//  grid1.Enabled := false;
end;

procedure TFrmMasterMenu_1.btnBaru2Click(Sender: TObject);
begin
  //  SetBtnMinumanEnabledStatus(False, True, True);
  //  bNewDataMinuman := True;
  //  eMinumNama.Clear;
  //  eMinumHarga.Clear;
  //  eMinumNama.SetFocus;
end;

procedure TFrmMasterMenu_1.sPageControl1Change(Sender: TObject);
begin
  case (sender as TTabSheet).Tag of
    0: LoadDataMakanan;
    1: LoadDataMinuman;
    2: LoadDataBarcode;
  end;
  //LoadDataMakanan;
end;

procedure TFrmMasterMenu_1.btnSimpan3Click(Sender: TObject);
begin
  {no,nama,barcode,harga,id}
//  if bNewDataBarcode then
//  begin
//    dm.ExecSQL(
//      'insert into data_menus(nama,barcode,harga) values("%s","%s",%d)',
//      [eBarCodeNama.Text, eBarcode.Text, StrToInt(eBarCodeHarga.Text)],
//      dm.mySQLQuery1);
//  end
//  else
//  begin
//    dm.ExecSQL(
//      'update data_menus'#13 +
//      'set nama = "%s",'#13 +
//      '    barcode = "%s",'#13 +
//      '    harga = %d'#13 +
//      'where id = %d',
//      [eBarCodeNama.Text, eBarcode.Text, StrToInt(eBarCodeHarga.Text),
//      iIdBarcode], dm.mySQLQuery1);
//  end;
//  SetBtnLainEnabledStatus(True, False, False);
//  LoadDataBarcode;
//  bNewDataBarcode := True;
//  grid3.Enabled := True;
end;

procedure TFrmMasterMenu_1.btnKeluarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmMasterMenu_1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

//______________________________________________________________________________

procedure TFrmMasterMenu_1.FillColSatuan;
begin
  colSatuan.Items.Clear;
  dm.ExecSQL('select nama from data_satuan', [], dm.mySQLQuery1);
  dm.mySQLQuery1.First;
  while not dm.mySQLQuery1.Eof do
  begin
    colSatuan.Items.Add(dm.mySQLQuery1.Fields[0].AsString);
    dm.mySQLQuery1.Next;
  end;
end;

//______________________________________________________________________________

procedure TFrmMasterMenu_1.FillColSubMenu;
begin
  colSubmenu.Items.Clear;
  dm.ExecSQL('select nama from data_subjenismenu', [], dm.mySQLQuery1);
  dm.mySQLQuery1.First;
  while not dm.mySQLQuery1.Eof do
  begin
    colSubmenu.Items.Add(dm.mySQLQuery1.Fields[0].AsString);
    dm.mySQLQuery1.Next;
  end;
end;

end.
