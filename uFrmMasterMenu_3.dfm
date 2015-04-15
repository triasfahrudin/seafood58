object FrmMasterMenu_3: TFrmMasterMenu_3
  Left = 137
  Top = 101
  Width = 1013
  Height = 500
  Caption = 'FrmMasterMenu_3'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object NxHeaderPanel1: TNxHeaderPanel
    Left = 0
    Top = 0
    Width = 1005
    Height = 416
    Align = alClient
    HeaderFont.Charset = DEFAULT_CHARSET
    HeaderFont.Color = clWindowText
    HeaderFont.Height = -11
    HeaderFont.Name = 'MS Sans Serif'
    HeaderFont.Style = []
    TabOrder = 0
    FullWidth = 1005
    object NextGrid1: TNextGrid
      Left = 9
      Top = 32
      Width = 240
      Height = 378
      Align = alLeft
      Options = [goEscClearEdit, goGrid, goHeader, goInput, goSelectFullRow]
      TabOrder = 0
      TabStop = True
      object NxTextColumn1: TNxTextColumn
        DefaultWidth = 150
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Position = 0
        SortType = stAlphabetic
        Width = 150
      end
      object NxNumberColumn1: TNxNumberColumn
        DefaultValue = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Position = 1
        SortType = stNumeric
        Increment = 1.000000000000000000
        Precision = 0
      end
    end
    object NextGrid2: TNextGrid
      Left = 249
      Top = 32
      Width = 746
      Height = 378
      Align = alClient
      TabOrder = 1
      TabStop = True
      object NxIncrementColumn1: TNxIncrementColumn
        DefaultWidth = 50
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Header.Caption = 'No.'
        Position = 0
        SortType = stAlphabetic
        Width = 50
      end
      object NxTextColumn2: TNxTextColumn
        DefaultWidth = 150
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Header.Caption = 'Nama'
        Position = 1
        SortType = stAlphabetic
        Width = 150
      end
      object NxTextColumn3: TNxTextColumn
        DefaultWidth = 150
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Position = 2
        SortType = stAlphabetic
        Width = 150
      end
    end
  end
  object sPanel1: TsPanel
    Left = 0
    Top = 416
    Width = 1005
    Height = 57
    Align = alBottom
    Caption = 'sPanel1'
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
  end
end
