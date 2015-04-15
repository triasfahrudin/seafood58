object FrmSettingAwal: TFrmSettingAwal
  Left = 359
  Top = 214
  Width = 510
  Height = 398
  Caption = 'Setting Awal'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 20
  object sLabelFX1: TsLabelFX
    Left = 16
    Top = 88
    Width = 140
    Height = 28
    Caption = 'Modal Awal Usaha'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object sLabelFX2: TsLabelFX
    Left = 312
    Top = 88
    Width = 57
    Height = 28
    Caption = 'Per Tgl'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object sPanel1: TsPanel
    Left = 0
    Top = 0
    Width = 502
    Height = 73
    Align = alTop
    Caption = 'Setting Awal Usaha'
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
  end
  object eModalAwal: TsEdit
    Left = 168
    Top = 88
    Width = 137
    Height = 28
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = 'eModalAwal'
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
  object ESBCalEdit1: TESBCalEdit
    Left = 384
    Top = 88
    Height = 28
    FormatType = edfCustom
    BoundLower = 40372.000000000000000000
    BoundUpper = 40372.000000000000000000
    BoundLowerYear = 2010
    BoundUpperYear = 2010
    YearCutoff = 1920
    YearDigitType = edyCutOff
    Format = 'dd/MM/yyyy'
    TabOrder = 2
  end
  object btnSimpan: TsButton
    Left = 400
    Top = 328
    Width = 75
    Height = 25
    Caption = 'btnSimpan'
    TabOrder = 3
    SkinData.SkinSection = 'BUTTON'
  end
end
