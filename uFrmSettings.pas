unit uFrmSettings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, sPageControl, StdCtrls, sButton,
  sComboBox, sFontCtrls, sLabel, sGroupBox, sEdit,
  DynPanel, NxCollection, sAlphaListBox, Printers, sCheckBox;

type
  TFrmSettings = class(TForm)
    sPageControl1: TsPageControl;
    sTabSheet1: TsTabSheet;
    sTabSheet2: TsTabSheet;
    btnOK: TsButton;
    btnCancel: TsButton;
    btnApply: TsButton;
    sGroupBox1: TsGroupBox;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    sFontComboBox1: TsFontComboBox;
    eFontSize: TsEdit;
    NxHeaderPanel1: TNxHeaderPanel;
    lstboxSkin: TsListBox;
    sLabel3: TsLabel;
    ComboBox1: TsComboBox;
    sLabel4: TsLabel;
    btnRefreshPrinter: TsButton;
    sTabSheet3: TsTabSheet;
    cbOnChangeHargaSatuan: TsCheckBox;
    sCheckBox1: TsCheckBox;
    sComboBox1: TsComboBox;
    sLabel5: TsLabel;
    procedure btnApplyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lstboxSkinDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sFontComboBox1Change(Sender: TObject);
    procedure eFontSizeChange(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnRefreshPrinterClick(Sender: TObject);
  private

  public

    procedure ApplySettings;
    procedure BtnEnabledStatus(bOK, bCancel, bApply: boolean);
  end;

const
  SKIN_FOLDER = 'skin\';

var
  FrmSettings: TFrmSettings;

implementation

{$R *.dfm}
uses
  uDM, uLibrary;

procedure TFrmSettings.ApplySettings;
begin

  INIWriteString('settings', 'skin',
    lstboxSkin.Items.Strings[lstboxSkin.ItemIndex]);
  INIWriteString('settings', 'btnfontsize', eFontSize.Text);
  INIWriteString('settings', 'btnfontname',
    sFontComboBox1.Items.Strings[sFontComboBox1.ItemIndex]);
  INIWriteString('settings', 'strukprinter', ComboBox1.Text);
end;

procedure TFrmSettings.btnApplyClick(Sender: TObject);
begin
  ApplySettings;
  BtnEnabledStatus(true, true, False);
end;

procedure TFrmSettings.FormCreate(Sender: TObject);
begin
  ComboBox1.Items.Assign(printer.printers);
  dm.sSkinManager1.SkinDirectory :=
    ExtractFileDir(Application.ExeName) + '\skin';
  dm.sSkinManager1.GetSkinNames(lstboxSkin.Items);
  sPageControl1.ActivePage := sTabSheet1;
end;

procedure TFrmSettings.lstboxSkinDblClick(Sender: TObject);
begin
  dm.sSkinManager1.SkinName := lstboxSkin.Items.Strings[lstboxSkin.itemindex];
  BtnEnabledStatus(true, true, true);
end;

procedure TFrmSettings.FormShow(Sender: TObject);
begin
  lstboxSkin.ItemIndex := lstboxSkin.Items.IndexOf(INIReadString('settings',
    'skin', 'beijing(internal)'));

  if lstboxSkin.ItemIndex < 0 then
    lstboxSkin.ItemIndex := 0;

  sFontComboBox1.ItemIndex :=
    sFontComboBox1.Items.IndexOf(INIReadString('settings', 'btnfontname',
    'MS Sans Serif'));
  eFontSize.Text := INIReadString('settings', 'btnfontsize', '12');
  ComboBox1.Text := INIReadString('settings', 'strukprinter', '');
  if INIReadString('askpermission', 'onHargaSatuanFirstPage', '') = 'Y' then
    cbOnChangeHargaSatuan.Checked := True
  else
    cbOnChangeHargaSatuan.Checked := False;

  formatbtn(self);
end;

procedure TFrmSettings.btnOKClick(Sender: TObject);
begin
  ApplySettings;
  Close;
end;

procedure TFrmSettings.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmSettings.BtnEnabledStatus(bOK, bCancel, bApply: boolean);
begin
  btnOK.Enabled := False;
  btnCancel.Enabled := False;
  btnApply.Enabled := False;

  btnOK.Enabled := bOK;
  btnCancel.Enabled := bCancel;
  btnApply.Enabled := bApply;
end;

procedure TFrmSettings.sFontComboBox1Change(Sender: TObject);
begin
  BtnEnabledStatus(true, true, true);
end;

procedure TFrmSettings.eFontSizeChange(Sender: TObject);
begin
  BtnEnabledStatus(true, true, true);
end;

procedure TFrmSettings.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmSettings.btnRefreshPrinterClick(Sender: TObject);
begin
  ComboBox1.Items.Assign(printer.printers);
end;

end.

