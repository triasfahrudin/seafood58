object FrmMasterMenu_2_Barcode: TFrmMasterMenu_2_Barcode
  Left = 234
  Top = 217
  Width = 829
  Height = 500
  Caption = 'Master Menu untuk Menu ber-Barcode'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object grid: TNextGrid
    Left = 0
    Top = 0
    Width = 821
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
    object NxNumberColumn3: TNxNumberColumn
      DefaultValue = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Header.Caption = 'Id_menu'
      Position = 0
      SortType = stNumeric
      Visible = False
      Increment = 1.000000000000000000
      Precision = 0
    end
    object NxNumberColumn1: TNxNumberColumn
      DefaultValue = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Header.Caption = 'id_subjenismenu'
      Position = 1
      SortType = stNumeric
      Visible = False
      Increment = 1.000000000000000000
      Precision = 0
    end
    object NxIncrementColumn1: TNxIncrementColumn
      DefaultWidth = 50
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Header.Caption = 'No.'
      Position = 2
      SortType = stAlphabetic
      Width = 50
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
      Position = 3
      SortType = stAlphabetic
      Width = 200
    end
    object barcode: TNxTextColumn
      DefaultWidth = 200
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Header.Caption = 'Barcode'
      Options = [coCanClick, coCanInput, coCanSort, coEditing, coPublicUsing, coShowTextFitHint]
      Position = 4
      SortType = stAlphabetic
      Width = 200
    end
    object sort: TNxNumberColumn
      DefaultValue = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Header.Caption = 'Sort'
      Options = [coCanClick, coCanInput, coCanSort, coEditing, coPublicUsing]
      Position = 5
      SortType = stNumeric
      Increment = 1.000000000000000000
      Precision = 0
    end
    object satuanPdMenu: TNxComboBoxColumn
      DefaultWidth = 85
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Header.Caption = 'Satuan pd menu'
      Options = [coCanClick, coCanInput, coCanSort, coEditing, coPublicUsing, coShowTextFitHint]
      Position = 6
      SortType = stAlphabetic
      Width = 85
      Style = cbsDropDownList
    end
    object satuanPdLap: TNxComboBoxColumn
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Header.Caption = 'Satuan pd Lap.'
      Options = [coCanClick, coCanInput, coCanSort, coEditing, coPublicUsing, coShowTextFitHint]
      Position = 7
      SortType = stAlphabetic
      Style = cbsDropDownList
    end
    object harga: TNxNumberColumn
      Alignment = taLeftJustify
      DefaultValue = '0'
      DefaultWidth = 100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Header.Caption = 'Harga Jual'
      Options = [coCanClick, coCanInput, coCanSort, coEditing, coPublicUsing]
      Position = 8
      SortType = stNumeric
      Width = 100
      FormatMask = '#,##0'
      TextBefore = 'Rp.'
      Increment = 1.000000000000000000
      Precision = 0
    end
  end
  object sPanel1: TsPanel
    Left = 0
    Top = 432
    Width = 821
    Height = 41
    Align = alBottom
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    object btnKeluar: TsButton
      Left = 728
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
