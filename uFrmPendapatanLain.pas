unit uFrmPendapatanLain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sLabel, ExtCtrls, sPanel, sButton, sMemo, sEdit;

type
  TFrmPendapatanLain = class(TForm)
    sPanel1: TsPanel;
    sLabelFX1: TsLabelFX;
    sLabelFX3: TsLabelFX;
    mmketerangan: TsMemo;
    sLabelFX4: TsLabelFX;
    eBesar: TsEdit;
    btnBatal: TsButton;
    btnSimpan: TsButton;
    procedure btnBatalClick(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure eBesarKeyPress(Sender: TObject; var Key: Char);
  private

  public

    bNewData: boolean;
    id_pendapatan: integer;
  end;

var
  FrmPendapatanLain: TFrmPendapatanLain;

implementation

{$R *.dfm}

uses
  uDM, uLibrary;

procedure TFrmPendapatanLain.btnBatalClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPendapatanLain.btnSimpanClick(Sender: TObject);
begin
  ShortDateFormat := 'dd-MM-yyyy';
  if (mmketerangan.Lines.Text = EmptyStr) or (eBesar.Text = EmptyStr) then
  begin
    MessageDlg('Isi Keterangan dan Besar', mtError, [mbOK], 0);
    exit;
  end;

  if bNewData then
  begin

    dm.ExecSQL(
      'insert into data_pendapatan'#13 +
      '            (typependapatan,tgl,id_pegawai,'#13 +
      '             keterangan)'#13 +
      'values(%d,"%s",%d,"%s")',
      [2, MySQLDateFormat(DateToStr(NOW)), DM.iAPPid,
      mmketerangan.Text], dm.mySQLQuery1);

    dm.ExecSQL('select max(id) from data_pendapatan', [], dm.mySQLQuery1);
    dm.ExecSQL(
      'insert into detail_pendapatan '#13 +
      '           (id_pendapatan,harga_satuan,banyak)'#13 +
      'values(%d,%d,%d)', [dm.mySQLQuery1.Fields[0].AsInteger,
      StrToInt(eBesar.Text), 1], dm.mySQLQuery2);
    MessageDlg('Data tersimpan', mtInformation, [mbOK], 0);
    Close;
  end
  else
  begin

    dm.ExecSQL(
      'update data_pendapatan'#13 +
      '       set keterangan = "%s"'#13 +
      'where id = %d', [mmketerangan.Text, id_pendapatan], dm.mySQLQuery1);

    dm.ExecSQL(
      'update detail_pendapatan'#13 +
      '       set harga_satuan = %d'#13 +
      'where id_pendapatan = %d', [StrToInt(eBesar.Text), id_pendapatan],
      dm.mySQLQuery1);
    Close;
  end;
end;

procedure TFrmPendapatanLain.FormCreate(Sender: TObject);
begin
  mmketerangan.Clear;
  eBesar.Clear;
end;

procedure TFrmPendapatanLain.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmPendapatanLain.FormShow(Sender: TObject);
begin
  formatbtn(self);
end;

procedure TFrmPendapatanLain.eBesarKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited KeyPress(Key);
  if key = #13 then
  begin
    btnSimpanClick(Sender);
    exit;
  end;

  if (key <> #8) then
    if (key < '0') or (key > '9') then
      key := #0;
end;

end.
