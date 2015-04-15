object FrmKonversiNamaMeja: TFrmKonversiNamaMeja
  Left = 558
  Top = 224
  AutoScroll = False
  Caption = 'FrmKonversiNamaMeja'
  ClientHeight = 313
  ClientWidth = 269
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
    Left = 0
    Top = 41
    Width = 269
    Height = 233
    Align = alTop
    Options = [goGrid, goHeader, goInput, goSelectFullRow]
    TabOrder = 0
    TabStop = True
    object NxTextColumn3: TNxTextColumn
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Header.Caption = 'id'
      Position = 0
      SortType = stAlphabetic
      Visible = False
    end
    object NxIncrementColumn1: TNxIncrementColumn
      DefaultWidth = 50
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Header.Caption = 'No.'
      Position = 1
      SortType = stAlphabetic
      Width = 50
    end
    object NxTextColumn1: TNxTextColumn
      DefaultWidth = 100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Header.Caption = 'Nama Meja'
      Options = [coCanClick, coCanSort, coPublicUsing, coShowTextFitHint]
      Position = 2
      SortType = stAlphabetic
      Width = 100
    end
    object NxTextColumn2: TNxTextColumn
      DefaultWidth = 100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Header.Caption = 'Alias'
      Options = [coCanClick, coCanInput, coCanSort, coEditing, coPublicUsing, coShowTextFitHint]
      Position = 3
      SortType = stAlphabetic
      Width = 100
    end
  end
  object sPanel1: TsPanel
    Left = 0
    Top = 0
    Width = 269
    Height = 41
    Align = alTop
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    object sLabel1: TsLabel
      Left = 16
      Top = 16
      Width = 59
      Height = 13
      Caption = 'Jumlah Meja'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object eJmlMeja: TsEdit
      Left = 80
      Top = 12
      Width = 94
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'eJmlMeja'
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
    object btnUpdate: TsButton
      Left = 185
      Top = 12
      Width = 72
      Height = 25
      Caption = 'Update'
      TabOrder = 1
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object btnKeluar: TsButton
    Left = 192
    Top = 280
    Width = 75
    Height = 25
    Caption = 'Keluar'
    TabOrder = 2
    SkinData.SkinSection = 'BUTTON'
  end
end
