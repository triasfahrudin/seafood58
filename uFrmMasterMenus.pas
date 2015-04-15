unit uFrmMasterMenus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, sPanel, StdCtrls, sEdit, sLabel, sGroupBox, sButton,
  ComCtrls, RzListVw, sComboBox, sBevel;

type
  TFrmMasterMenus = class(TForm)
    sPanel1: TsPanel;
    sGroupBox1: TsGroupBox;
    sLabelFX1: TsLabelFX;
    eNama: TsEdit;
    sLabelFX2: TsLabelFX;
    eHarga: TsEdit;
    sLabelFX3: TsLabelFX;
    eBarcode: TsEdit;
    btnSimpan: TsButton;
    btnBatal: TsButton;
    btnBaru: TsButton;
    btnKeluar: TsButton;
    sLabelFX4: TsLabelFX;
    cmbJenisMenu: TsComboBox;
    btnJenis: TsButton;
    lv1: TListView;
    sLabelFX5: TsLabelFX;
    cmbSatuan: TsComboBox;
    btnSatuan: TsButton;
    procedure btnKeluarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnBaruClick(Sender: TObject);
    procedure btnBatalClick(Sender: TObject);
    procedure lvClick(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure btnJenisClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSatuanClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    bIsNewData: boolean;
    procedure SetBtnEnabledStatus(bBaru, bBatal, bSimpan: boolean);
    procedure InisialisasiJenisMenu;
    procedure InisialisasiSatuan;
    procedure LoadAllDataMenu;
  end;

var
  FrmMasterMenus: TFrmMasterMenus;

implementation

{$R *.dfm}
uses
  uDM, Math, uFrmListJenisMenu, uLibrary, uFrmListJenisSatuan;

procedure TFrmMasterMenus.btnKeluarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmMasterMenus.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmMasterMenus.SetBtnEnabledStatus(bBaru, bBatal, bSimpan: boolean);
var
  j: Byte;
begin
  for j := 0 to ComponentCount - 1 do
  begin
    if (Components[j] is TsEdit) then
    begin
      (Components[j] as TsEdit).Enabled := bSimpan;
      if bIsNewData then
        (Components[j] as TsEdit).Clear;
    end;
  end;
  btnSimpan.Enabled := bSimpan;
  btnBaru.Enabled := bBaru;
  btnBatal.Enabled := bBatal;
end;

procedure TFrmMasterMenus.btnBaruClick(Sender: TObject);
begin
  bIsNewData := True;
  SetBtnEnabledStatus(false, true, true);
end;

procedure TFrmMasterMenus.btnBatalClick(Sender: TObject);
begin
  bIsNewData := True;
  SetBtnEnabledStatus(true, false, false);
end;

procedure TFrmMasterMenus.lvClick(Sender: TObject);
begin
  {no, id, barcode,nama,jenismkn,satuan,harga}
  bIsNewData := False;
  eBarcode.Text := lv1.Selected.SubItems[1];
  eNama.Text := lv1.Selected.SubItems[2];
  eHarga.Text := lv1.Selected.SubItems[5];
  cmbJenisMenu.Text := lv1.Selected.SubItems[3];
  cmbSatuan.Text := lv1.Selected.SubItems[4];
end;

{no,id,nama,harga,barcode}

procedure TFrmMasterMenus.btnSimpanClick(Sender: TObject);
var
  iJenisMenuID: integer;
  iSatuanID: integer;
  {no, id, barcode,nama,jenismkn,satuan,harga}
  function GetIDFromJenisMenu(sNama: string): integer;
  begin
    DM.ExecSQL(
      'select id from data_jenismenu where nama="%s"', [sNama], dm.mySQLQuery1);
    result := DM.mySQLQuery1.Fields[0].AsInteger;
  end;
  function GetIdFromSatuan(sNama: string): integer;
  begin
    dm.ExecSQL(
      'select id from data_satuan where nama ="%s"', [sNama], dm.mySQLQuery1);
    result := DM.mySQLQuery1.Fields[0].AsInteger;
  end;

begin
  iJenisMenuID := GetIDFromJenisMenu(cmbJenisMenu.Text);
  iSatuanID := GetIdFromSatuan(cmbSatuan.Text);
  if bIsNewData then
  begin
    //new data
    dm.ExecSQL('insert into data_menu (barcode,nama,id_jenismenu,harga,id_satuan)'#13 +
      'values("%s","%s",%d,%d)', [trim(eBarcode.Text), trim(eNama.Text),
      iJenisMenuID, StrToInt(eHarga.Text), iSatuanID], dm.mySQLQuery1);
  end
  else
  begin
    {no, id, barcode,nama,jenismkn,satuan,harga}
  //update data
    dm.ExecSQL(
      'update data_menu'#13 +
      'set barcode = "%s",'#13 +
      '  nama="%s",'#13 +
      '  id_jenismenu = %d,'#13 +
      '  harga=%d,'#13 +
      '  id_satuan = %d'#13 +
      'where id=%d',
      [eBarcode.Text,
      eNama.Text,
        iJenisMenuID,
        StrToInt(lv1.Selected.SubItems[5]),
        iSatuanID],
        dm.mySQLQuery1);
  end;
  SetBtnEnabledStatus(true, false, false);
  bIsNewData := true;
end;

procedure TFrmMasterMenus.InisialisasiJenisMenu;
begin
  cmbJenisMenu.Clear;
  DM.ExecSQL('select nama from data_jenismenu', [], DM.mySQLQuery1);
  DM.mySQLQuery1.First;
  while not DM.mySQLQuery1.Eof do
  begin
    cmbJenisMenu.Items.Add(dm.mySQLQuery1.Fields[0].AsString);
    DM.mySQLQuery1.Next;
  end;
end;

procedure TFrmMasterMenus.btnJenisClick(Sender: TObject);
begin
  ActivateForm('FrmListJenisMenu', TFrmListJenisMenu, FrmListJenisMenu);
  FrmListJenisMenu.ShowModal;
end;

procedure TFrmMasterMenus.FormCreate(Sender: TObject);
begin
  InisialisasiJenisMenu;
  InisialisasiSatuan;
  LoadAllDataMenu;
end;

procedure TFrmMasterMenus.LoadAllDataMenu;
begin
  {no, id, barcode,nama,jenismkn,satuan,harga}
  dm.ExecSQL(
    'select a.id as id,a.barcode as barcode,'#13 +
    '      a.nama as nama,b.nama as jenismkn,'#13 +
    '		 c.nama as satuan,a.harga'#13 +
    'from data_menus a'#13 +
    'left join data_jenismenu b'#13 +
    'on a.id_jenismenu = b.id'#13 +
    'left join data_satuan c'#13 +
    'on a.id_satuan = c.id', [], dm.mySQLQuery1);
  dm.mySQLQuery1.First;
  while not dm.mySQLQuery1.Eof do
  begin
    with lv1.Items.Add, dm.mySQLQuery1 do
    begin
      Caption := IntToStr(dm.mySQLQuery1.RecNo);
      SubItems.Add(Fields[0].AsString); //id
      SubItems.Add(Fields[1].AsString); //barcode
      SubItems.Add(Fields[2].AsString); //nama
      SubItems.Add(Fields[3].AsString); //jenis makanana
      SubItems.Add(Fields[4].AsString); //satuan
      SubItems.Add(Fields[5].AsString); //harga
    end;
    dm.mySQLQuery1.Next;
  end;
end;

procedure TFrmMasterMenus.InisialisasiSatuan;
begin
  cmbSatuan.Clear;
  DM.ExecSQL('select nama from data_satuan', [], DM.mySQLQuery1);
  DM.mySQLQuery1.First;
  while not DM.mySQLQuery1.Eof do
  begin
    cmbSatuan.Items.Add(dm.mySQLQuery1.Fields[0].AsString);
    DM.mySQLQuery1.Next;
  end;
end;

procedure TFrmMasterMenus.btnSatuanClick(Sender: TObject);
begin
  ActivateForm('FrmListJenisSatuan', TFrmListJenisSatuan, FrmListJenisSatuan);
  FrmListJenisSatuan.ShowModal;
end;

procedure TFrmMasterMenus.FormShow(Sender: TObject);
begin
  formatbtn(self);
end;

end.

