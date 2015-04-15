object FrmHistoryPengeluaran: TFrmHistoryPengeluaran
  Left = 303
  Top = 163
  Width = 494
  Height = 500
  Caption = 'FrmHistoryPengeluaran'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object sPanel1: TsPanel
    Left = 0
    Top = 0
    Width = 486
    Height = 81
    Align = alTop
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object sLabelFX1: TsLabelFX
      Left = 1
      Top = 1
      Width = 484
      Height = 37
      Align = alTop
      Alignment = taCenter
      Caption = 'History Pengeluaran'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object sLabel1: TsLabel
      Left = 8
      Top = 56
      Width = 27
      Height = 13
      Caption = 'Bulan'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object sLabel2: TsLabel
      Left = 152
      Top = 56
      Width = 31
      Height = 13
      Caption = 'Tahun'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object sComboBox1: TsComboBox
      Left = 40
      Top = 53
      Width = 95
      Height = 21
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
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ItemIndex = -1
      ParentFont = False
      TabOrder = 0
      Text = 'sComboBox1'
    end
    object sEdit1: TsEdit
      Left = 192
      Top = 52
      Width = 101
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = 'sEdit1'
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
    object btnTampilkan: TsButton
      Left = 304
      Top = 48
      Width = 75
      Height = 25
      Caption = 'Tampilkan'
      TabOrder = 2
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object sPanel2: TsPanel
    Left = 0
    Top = 416
    Width = 486
    Height = 57
    Align = alBottom
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
  end
  object NextGrid1: TNextGrid
    Left = 32
    Top = 104
    Width = 250
    Height = 150
    TabOrder = 2
    TabStop = True
  end
end
