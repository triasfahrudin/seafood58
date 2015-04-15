unit uFrmTutupBukuHarian;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, dateutils;

type
  TFrmTutupBukuHarian = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    Label3: TLabel;
    Edit1: TEdit;
    Label4: TLabel;
    btnTutupBuku: TButton;
    lbltotalpendapatan: TLabel;
    lblmodalbesok: TLabel;
    Label8: TLabel;
    Memo1: TMemo;
    lbltgl: TLabel;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure btnTutupBukuClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTutupBukuHarian: TFrmTutupBukuHarian;

implementation

uses uDM, uLibrary, strUtils, DB;

{$R *.dfm}

procedure TFrmTutupBukuHarian.FormCreate(Sender: TObject);
begin
  ShortDateFormat := 'dd-MM-yyyy';
  lbltgl.Caption := DateToStr(NOW);
  dm.ExecSQL(
    'select func_GetPendapatan("%s")',
    [MySQLDateFormat(DateToStr(NOW))], dm.mySQLQuery1);
  dm.mySQLQuery1.First;
  lbltotalpendapatan.Caption :=
    FormatRp(ifthen(dm.mySQLQuery1.Fields[0].AsString = EmptyStr, '0',
    dm.mySQLQuery1.Fields[0].AsString));

end;

procedure TFrmTutupBukuHarian.Edit1Exit(Sender: TObject);
begin
  if Edit1.Text = EmptyStr then
    Edit1.Text := '0';
  lblmodalbesok.Caption :=
    FormatRp(
    ifthen(StrToFloat(unformatRp(lbltotalpendapatan.Caption)) -
    StrToFloat(Edit1.Text) = 0,
    '0',
    floatToStr(StrToFloat(unformatRp(lbltotalpendapatan.Caption)) -
    strtoint(Edit1.Text))));
end;

procedure TFrmTutupBukuHarian.btnTutupBukuClick(Sender: TObject);
var
  currid: integer;
begin
  if UnFormatRp(lbltotalpendapatan.Caption) = '0' then
  begin
    MessageDlg('tidak ada transaksi yang terjadi pada hari ini!', mtWarning,
      [mbOK], 0);
    Exit;
  end;

  if StrToInt(Edit1.Text) > StrToInt(unformatRp(lbltotalpendapatan.Caption))
    then
  begin
    MessageDlg('nilai yang dikirim ke BOS > dari nilai pendapatan dari hari ini!', mtError, [mbOK], 0);
    Exit;
  end;

  if MessageDlg(
    'Apakah anda yakin ingin melakukan tutup buku pada hari ini ?'#13 +
    '*Tutup buku sebaiknya dilakukan saat tidak ada lagi transaksi penjualan',
    mtConfirmation, [mbYes] + [mbNo], 0) <> mrYes then
  begin
    Close;
    Exit;
  end;

  ShortDateFormat := 'dd-MM-yyyy';
  DecimalSeparator := '.';
  dm.ExecSQL(
    'insert into data_tutupbuku (tgl,id_pegawai,bos,modal,keterangan)'#13 +
    'values("%s",%d,%f,%f,"%s")',
    [MySQLDateFormat(DateToStr(NOW)),
    dm.iAPPid,
      StrToFloat(Edit1.Text),
      StrToFloat(UnFormatRp(lblmodalbesok.Caption)),
      Memo1.Text], dm.mySQLQuery1);
  DecimalSeparator := ',';
  if trim(UnFormatRp(lblmodalbesok.Caption)) = '0' then
    Exit;

  DecimalSeparator := '.';
  dm.ExecSQL('select max(id) from data_tutupbuku', [], dm.mySQLQuery1);
  currid := dm.mySQLQuery1.Fields[0].AsInteger;
  dm.ExecSQL(
    'insert into data_modal'#13 +
    '(tgl,besar,id_pegawai,keterangan,is_daritutupbuku,id_tutupbuku)'#13 +
    'values("%s",%f,%d,"%s",%d,%d)',
    [MySQLDateFormat(DateToStr(Tomorrow)),
    StrToFloat(UnFormatRp(lblmodalbesok.Caption)),
      dm.iAPPid,
      'Modal dari pendapatan tgl: ' + DateToStr(NOW) + ' sebesar: Rp.' +
      lblmodalbesok.Caption,
      1, currid], dm.mySQLQuery1);
  DecimalSeparator := ',';
  dm.bTutupBukuHariIni := True;
  close;
end;

procedure TFrmTutupBukuHarian.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
