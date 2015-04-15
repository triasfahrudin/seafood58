unit uFrmNeedAuthorization;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sLabel, ExtCtrls, sButton, Mask, sMaskEdit,
  sComboBox,
  sMemo, sCheckBox;

type
  TFrmNeedAuthorization = class(TForm)
    sLabelFX1: TsLabelFX;
    sLabelFX2: TsLabelFX;
    cmbNama: TsComboBox;
    sLabelFX3: TsLabelFX;
    sLabelFX4: TsLabelFX;
    ePassword: TsMaskEdit;
    btnBatal: TsButton;
    btnOK: TsButton;
    sMemo1: TsMemo;
    sLabel1: TsLabel;
    cb1: TsCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnBatalClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmbNamaKeyPress(Sender: TObject; var Key: Char);
    procedure ePasswordKeyPress(Sender: TObject; var Key: Char);
  private
    procedure FillGridAndCmdNama;
  public
    strPriv: string;
  end;

var
  FrmNeedAuthorization: TFrmNeedAuthorization;

implementation

{$R *.dfm}
uses
  uDM, uLibrary, DB;

procedure TFrmNeedAuthorization.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmNeedAuthorization.FormShow(Sender: TObject);
begin
  formatbtn(self);
end;

procedure TFrmNeedAuthorization.FillGridAndCmdNama;
begin
  dm.ExecSQL('select nama from data_pegawai where isSinuhun = 1', [],
    DM.mySQLQuery1);
  cmbNama.Items.Clear;
  dm.mySQLQuery1.First;
  while not dm.mySQLQuery1.Eof do
  begin
    cmbNama.Items.Add(dm.mySQLQuery1.Fields[0].AsString);
    dm.mySQLQuery1.Next;
  end;
end;

procedure TFrmNeedAuthorization.btnBatalClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmNeedAuthorization.btnOKClick(Sender: TObject);
begin
  if cmbNama.Text = EmptyStr then
  begin
    MessageDlg('Nama pemberi ijin tidak boleh kosong', mtError, [mbOK], 0);
    Exit;
  end;

  dm.ExecSQL('select password from data_pegawai where nama = "%s"',
    [cmbNama.Text], dm.mySQLQuery1);
  dm.mySQLQuery1.First;
  if dm.mySQLQuery1.Fields[0].AsString = ePassword.Text then
  begin
    //password diterima
    if cb1.Checked then
      InsertPriv(strPriv, 'Y', cmbNama.Text)
    else
      InsertPriv(strPriv, 'N', cmbNama.Text);

    dm.sNamaPemberiIjin := cmbNama.Text;
    dm.sKet := sMemo1.Text;
    Close;
  end
  else
  begin
    MessageDlg('Password salah!', mtWarning, [mbOK], 0);
  end;
end;

procedure TFrmNeedAuthorization.FormCreate(Sender: TObject);
begin
  FillGridAndCmdNama;
end;

procedure TFrmNeedAuthorization.cmbNamaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    ePassword.SetFocus;
end;

procedure TFrmNeedAuthorization.ePasswordKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key <> #13 then
    Exit;
  btnOKClick(Sender);
end;

end.
