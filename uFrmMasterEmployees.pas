unit uFrmMasterEmployees;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sButton, ComCtrls, sMemo, sEdit, sLabel,
  sAlphaListBox, sGroupBox, sCheckBox, ExtCtrls, frxpngimage, sBevel;

type
  TFrmMasterEmployees = class(TForm)
    sGroupBox1: TsGroupBox;
    lstbPrivilege: TsListBox;
    sLabelFX1: TsLabelFX;
    eNama: TsEdit;
    sLabelFX2: TsLabelFX;
    eAlamat: TsMemo;
    sLabelFX3: TsLabelFX;
    eTelp: TsEdit;
    lv1: TListView;
    btnSimpan: TsButton;
    btnBatal: TsButton;
    btnBaru: TsButton;
    btnKeluar: TsButton;
    cbIsOperator: TsCheckBox;
    cbIsActive: TsCheckBox;
    Image1: TImage;
    procedure btnKeluarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnBaruClick(Sender: TObject);
    procedure btnBatalClick(Sender: TObject);
    procedure cbIsActiveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    bIsNewData: boolean;
    procedure SetBtnEnabledStatus(bBaru, bBatal, bSimpan: boolean);
    function GetPrivilegeFromLstBox: string;
    procedure LoadPrivilegeToLstBox(sPrivilege: string);
    procedure FillPrivilegeLstBox;
    procedure LoadAllEmployees;
  end;

var
  FrmMasterEmployees: TFrmMasterEmployees;

implementation

{$R *.dfm}
uses
  uDM, uLibrary;

procedure TFrmMasterEmployees.btnKeluarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmMasterEmployees.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmMasterEmployees.SetBtnEnabledStatus(bBaru, bBatal,
  bSimpan: boolean);
var
  j: Byte;
begin
  for j := 0 to ComponentCount - 1 do
  begin
    if (Components[j] is TsEdit) or (Components[j] is TsMemo) then
    begin
      (Components[j] as TsEdit).Enabled := bSimpan;
      (Components[j] as TsMemo).Enabled := bSimpan;
      if bIsNewData then
      begin
        (Components[j] as TsEdit).Clear;
        (Components[j] as TsMemo).Clear;
      end;
    end;
  end;
  btnSimpan.Enabled := bSimpan;
  btnBaru.Enabled := bBaru;
  btnBatal.Enabled := bBatal;
end;

procedure TFrmMasterEmployees.btnBaruClick(Sender: TObject);
begin
  bIsNewData := True;
  SetBtnEnabledStatus(false, true, true);
end;

procedure TFrmMasterEmployees.btnBatalClick(Sender: TObject);
begin
  bIsNewData := True;
  SetBtnEnabledStatus(true, false, false);
end;

function TFrmMasterEmployees.GetPrivilegeFromLstBox: string;
begin

end;

procedure TFrmMasterEmployees.LoadPrivilegeToLstBox(sPrivilege: string);
begin

end;

procedure TFrmMasterEmployees.FillPrivilegeLstBox;
begin

end;

procedure TFrmMasterEmployees.LoadAllEmployees;
begin
  {no,id,nama,alamat,notlp,isoperator,isactive,privilege}
  dm.ExecSQL(
    'select id,nama,alamat,notlp,'#13 +
    '       isoperator,isactive,privilege'#13 +
    'from data_pegawai', [], dm.mySQLQuery1);
  dm.mySQLQuery1.First;
  while not dm.mySQLQuery1.Eof do
  begin
    with lv1.Items.Add, dm.mySQLQuery1 do
    begin
      Caption := IntToStr(RecNo);
      SubItems.Add(Fields[0].AsString);
      SubItems.Add(Fields[1].AsString);
      SubItems.Add(Fields[2].AsString);
      SubItems.Add(Fields[3].AsString);
      SubItems.Add(Fields[4].AsString);
      SubItems.Add(Fields[5].AsString);
      SubItems.Add(Fields[6].AsString);
    end;
    dm.mySQLQuery1.Next;
  end;
end;

procedure TFrmMasterEmployees.cbIsActiveClick(Sender: TObject);
begin
  sGroupBox1.Enabled := cbIsActive.Checked;
end;

procedure TFrmMasterEmployees.FormShow(Sender: TObject);
begin
  formatbtn(self);
end;

end.
