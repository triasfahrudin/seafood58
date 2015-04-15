object FrmListSubJenisMenu: TFrmListSubJenisMenu
  Left = 414
  Top = 217
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'List Sub Jenis Menu '
  ClientHeight = 348
  ClientWidth = 453
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object grid: TNextGrid
    Left = 0
    Top = 0
    Width = 453
    Height = 313
    Align = alTop
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    HideScrollBar = False
    InputSize = 20
    Options = [goGrid, goHeader, goInput, goSelectFullRow]
    RowSize = 20
    ParentFont = False
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
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Header.Caption = 'No.'
      Options = [coCanClick, coCanInput, coPublicUsing]
      ParentFont = False
      Position = 0
      SortType = stAlphabetic
      Width = 50
    end
    object nama: TNxTextColumn
      DefaultWidth = 180
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Header.Caption = 'Nama'
      Options = [coCanClick, coCanInput, coEditing, coPublicUsing, coShowTextFitHint]
      ParentFont = False
      Position = 1
      SortType = stAlphabetic
      Width = 180
    end
    object NxNumberColumn1: TNxNumberColumn
      DefaultValue = '0'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Header.Caption = 'id'
      ParentFont = False
      Position = 2
      SortType = stNumeric
      Visible = False
      Increment = 1.000000000000000000
      Precision = 0
    end
    object sort: TNxNumberColumn
      DefaultValue = '0'
      DefaultWidth = 50
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Header.Caption = 'Sort'
      Options = [coCanClick, coCanInput, coCanSort, coEditing, coPublicUsing]
      ParentFont = False
      Position = 3
      SortType = stNumeric
      Width = 50
      Increment = 1.000000000000000000
      Precision = 0
    end
    object satuan: TNxComboBoxColumn
      DefaultWidth = 100
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Header.Caption = 'Satuan. pd laporan'
      Options = [coCanClick, coCanInput, coCanSort, coEditing, coPublicUsing, coShowTextFitHint]
      ParentFont = False
      Position = 4
      SortType = stAlphabetic
      Width = 100
      Style = cbsDropDownList
    end
    object isstok: TNxCheckBoxColumn
      DefaultWidth = 40
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Header.Caption = 'Stok ?'
      Options = [coCanClick, coCanInput, coCanSort, coEditing, coPublicUsing]
      ParentFont = False
      Position = 5
      SortType = stBoolean
      Width = 40
    end
  end
  object btnKeluar: TsButton
    Left = 352
    Top = 320
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Caption = 'Keluar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnKeluarClick
    SkinData.SkinSection = 'BUTTON'
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
