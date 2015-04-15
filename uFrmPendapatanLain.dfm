object FrmPendapatanLain: TFrmPendapatanLain
  Left = 512
  Top = 271
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Pendapatan Lainnya'
  ClientHeight = 242
  ClientWidth = 407
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 20
  object sLabelFX3: TsLabelFX
    Left = 16
    Top = 54
    Width = 70
    Height = 20
    Caption = 'Keterangan'
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
  end
  object sLabelFX4: TsLabelFX
    Left = 16
    Top = 166
    Width = 38
    Height = 20
    Caption = 'Besar'
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
  end
  object sPanel1: TsPanel
    Left = 0
    Top = 0
    Width = 407
    Height = 41
    Align = alTop
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    SkinData.SkinSection = 'PANEL'
    object sLabelFX1: TsLabelFX
      Left = 1
      Top = 1
      Width = 405
      Height = 33
      Align = alTop
      Alignment = taCenter
      Caption = 'Pendapatan Lainnya'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
  end
  object mmketerangan: TsMemo
    Left = 136
    Top = 52
    Width = 249
    Height = 105
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Lines.Strings = (
      'mmketerangan')
    ParentFont = False
    TabOrder = 0
    Text = 'mmketerangan'
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
  object eBesar: TsEdit
    Left = 136
    Top = 164
    Width = 249
    Height = 24
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = 'eBesar'
    OnKeyPress = eBesarKeyPress
    SkinData.SkinSection = 'EDIT'
    BoundLabel.Indent = 0
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'MS Sans Serif'
    BoundLabel.Font.Style = []
    BoundLabel.Layout = sclLeft
    BoundLabel.MaxWidth = 0
    BoundLabel.UseSkinColor = True
  end
  object btnBatal: TsButton
    Left = 220
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Batal'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnBatalClick
    SkinData.SkinSection = 'BUTTON'
  end
  object btnSimpan: TsButton
    Left = 308
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Simpan'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = btnSimpanClick
    SkinData.SkinSection = 'BUTTON'
  end
end
