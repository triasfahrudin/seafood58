object FrmNeedAuthorization: TFrmNeedAuthorization
  Left = 531
  Top = 301
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Need Authorization'
  ClientHeight = 322
  ClientWidth = 304
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sLabelFX1: TsLabelFX
    Left = 0
    Top = 0
    Width = 304
    Height = 41
    Align = alTop
    Alignment = taCenter
    Caption = 'PEMBERITAHUAN'
    Color = clAqua
    ParentColor = False
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -32
    Font.Name = 'Arial'
    Font.Style = [fsBold]
  end
  object sLabelFX2: TsLabelFX
    Left = 0
    Top = 41
    Width = 304
    Height = 36
    Align = alTop
    Alignment = taCenter
    Caption = 'Perubahan yang anda lakukan '#13#10'memerlukan persetujuan '
    Color = clAqua
    ParentColor = False
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
  end
  object sLabelFX3: TsLabelFX
    Left = 27
    Top = 196
    Width = 87
    Height = 18
    Caption = 'Nama Pemberi Ijin'
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
  end
  object sLabelFX4: TsLabelFX
    Left = 27
    Top = 233
    Width = 54
    Height = 18
    Caption = 'Password'
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
  end
  object sLabel1: TsLabel
    Left = 3
    Top = 88
    Width = 95
    Height = 14
    Caption = 'Alasan Perubahan :'
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
  end
  object cmbNama: TsComboBox
    Left = 120
    Top = 196
    Width = 164
    Height = 22
    Alignment = taLeftJustify
    BoundLabel.Indent = 0
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'MS Sans Serif'
    BoundLabel.Font.Style = []
    BoundLabel.Layout = sclLeft
    BoundLabel.MaxWidth = 0
    BoundLabel.UseSkinColor = True
    SkinData.SkinSection = 'COMBOBOX'
    Style = csDropDownList
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ItemHeight = 14
    ItemIndex = -1
    ParentFont = False
    TabOrder = 1
    OnKeyPress = cmbNamaKeyPress
  end
  object ePassword: TsMaskEdit
    Left = 120
    Top = 228
    Width = 164
    Height = 22
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 2
    OnKeyPress = ePasswordKeyPress
    BoundLabel.Indent = 0
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'MS Sans Serif'
    BoundLabel.Font.Style = []
    BoundLabel.Layout = sclLeft
    BoundLabel.MaxWidth = 0
    BoundLabel.UseSkinColor = True
    SkinData.SkinSection = 'EDIT'
  end
  object btnBatal: TsButton
    Left = 83
    Top = 284
    Width = 97
    Height = 25
    Caption = 'Batal'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = btnBatalClick
    SkinData.SkinSection = 'BUTTON'
  end
  object btnOK: TsButton
    Left = 203
    Top = 284
    Width = 89
    Height = 25
    Caption = 'OK'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnOKClick
    SkinData.SkinSection = 'BUTTON'
  end
  object sMemo1: TsMemo
    Left = 11
    Top = 104
    Width = 281
    Height = 89
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    BoundLabel.Indent = 0
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'MS Sans Serif'
    BoundLabel.Font.Style = []
    BoundLabel.Layout = sclLeft
    BoundLabel.MaxWidth = 0
    BoundLabel.UseSkinColor = True
    SkinData.SkinSection = 'EDIT'
  end
  object cb1: TsCheckBox
    Left = 72
    Top = 256
    Width = 174
    Height = 19
    Caption = 'Terima permanent untuk sesi ini'
    TabOrder = 5
    SkinData.SkinSection = 'CHECKBOX'
    ImgChecked = 0
    ImgUnchecked = 0
  end
end
