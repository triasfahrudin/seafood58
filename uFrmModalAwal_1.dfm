object FrmModalAwal_1: TFrmModalAwal_1
  Left = 252
  Top = 228
  Width = 870
  Height = 500
  Caption = 'FrmModalAwal_1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object NextGrid1: TNextGrid
    Left = 224
    Top = 72
    Width = 250
    Height = 150
    Options = [goGrid, goHeader, goInput]
    TabOrder = 0
    TabStop = True
    object NxTextColumn1: TNxTextColumn
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Position = 0
      SortType = stAlphabetic
    end
    object NxDateColumn1: TNxDateColumn
      DefaultValue = '7/26/2010'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Position = 1
      SortType = stDate
      NoneCaption = 'None'
      TodayCaption = 'Today'
    end
  end
end
