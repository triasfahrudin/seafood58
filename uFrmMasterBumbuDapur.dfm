object FrmMasterBumbuDapur: TFrmMasterBumbuDapur
  Left = 506
  Top = 152
  AutoScroll = False
  Caption = 'Master NON Menu'
  ClientHeight = 473
  ClientWidth = 530
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object grid: TNextGrid
    Left = 0
    Top = 0
    Width = 530
    Height = 432
    Align = alClient
    Options = [goGrid, goHeader, goIndicator, goInput, goSelectFullRow]
    TabOrder = 0
    TabStop = True
    WantReturns = True
    WantTabs = True
    OnAfterEdit = gridAfterEdit
    OnBeforeEdit = gridBeforeEdit
    OnInputAccept = gridInputAccept
    OnInputAdded = gridInputAdded
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
    object NxNumberColumn3: TNxNumberColumn
      DefaultValue = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Header.Caption = 'Id'
      Position = 1
      SortType = stNumeric
      Visible = False
      Increment = 1.000000000000000000
      Precision = 0
    end
    object nama: TNxTextColumn
      DefaultWidth = 200
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Header.Caption = 'Nama Item'
      Options = [coCanClick, coCanInput, coCanSort, coEditing, coPublicUsing, coShowTextFitHint]
      Position = 2
      SortType = stAlphabetic
      Width = 200
    end
    object barcode: TNxTextColumn
      DefaultWidth = 150
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Header.Caption = 'Barcode'
      Options = [coCanClick, coCanInput, coCanSort, coEditing, coPublicUsing, coShowTextFitHint]
      Position = 3
      SortType = stAlphabetic
      Width = 150
    end
    object satuanPdLap: TNxComboBoxColumn
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Header.Caption = 'Satuan pd Lap.'
      Options = [coCanClick, coCanInput, coCanSort, coEditing, coPublicUsing, coShowTextFitHint]
      Position = 4
      SortType = stAlphabetic
      Style = cbsDropDownList
    end
  end
  object sPanel1: TsPanel
    Left = 0
    Top = 432
    Width = 530
    Height = 41
    Align = alBottom
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    object btnKeluar: TsButton
      Left = 416
      Top = 8
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = 'Keluar'
      DragCursor = crHandPoint
      TabOrder = 0
      OnClick = btnKeluarClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object MainMenu1: TMainMenu
    Left = 136
    Top = 88
    object Delete1: TMenuItem
      Caption = 'Delete'
      ShortCut = 46
      Visible = False
      OnClick = Delete1Click
    end
  end
end
