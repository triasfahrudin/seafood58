object FrmMasterEmployees_1: TFrmMasterEmployees_1
  Left = 423
  Top = 254
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Master Pegawai'
  ClientHeight = 409
  ClientWidth = 588
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
  object sLabel1: TsLabel
    Left = 16
    Top = 376
    Width = 287
    Height = 13
    Caption = 'Klik pada Privilege Code Seq untuk mengubah level privilege'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object grid: TNextGrid
    Left = 0
    Top = 0
    Width = 588
    Height = 369
    Align = alTop
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    Options = [goGrid, goHeader, goIndicator, goInput, goSelectFullRow]
    ParentFont = False
    TabOrder = 0
    TabStop = True
    WantReturns = True
    WantTabs = True
    OnAfterEdit = gridAfterEdit
    OnBeforeEdit = gridBeforeEdit
    OnCellClick = gridCellClick
    OnInputAccept = gridInputAccept
    OnInputAdded = gridInputAdded
    object NxTextColumn4: TNxNumberColumn
      Alignment = taLeftJustify
      DefaultValue = '0'
      DefaultWidth = 50
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Header.Caption = 'id'
      Options = [coCanClick, coCanInput, coCanSort, coPublicUsing, coShowTextFitHint]
      ParentFont = False
      Position = 0
      SortType = stNumeric
      Visible = False
      Width = 50
      Increment = 1.000000000000000000
      Precision = 0
    end
    object NxIncrementColumn1: TNxIncrementColumn
      DefaultWidth = 50
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Header.Caption = 'No.'
      ParentFont = False
      Position = 1
      SortType = stAlphabetic
      Width = 50
    end
    object NxCheckBoxColumn1: TNxCheckBoxColumn
      DefaultWidth = 50
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Header.Caption = 'Aktif ?'
      Options = [coCanClick, coCanInput, coEditing, coPublicUsing]
      ParentFont = False
      Position = 2
      SortType = stBoolean
      Width = 50
    end
    object nama: TNxTextColumn
      DefaultWidth = 200
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Header.Caption = 'Nama'
      Options = [coCanClick, coCanInput, coEditing, coPublicUsing, coShowTextFitHint]
      ParentFont = False
      Position = 3
      SortType = stAlphabetic
      Width = 200
    end
    object NxTextColumn2: TNxTextColumn
      DefaultWidth = 90
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Header.Caption = '[Clear Password]'
      Options = [coCanClick, coCanInput, coPublicUsing, coShowTextFitHint]
      ParentFont = False
      Position = 4
      SortType = stAlphabetic
      Width = 90
    end
    object NxTextColumn3: TNxTextColumn
      DefaultWidth = 100
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Header.Caption = 'Privilege Code Seq'
      Options = [coCanClick, coCanInput, coPublicUsing, coShowTextFitHint]
      ParentFont = False
      Position = 5
      SortType = stAlphabetic
      Width = 100
    end
    object NxCheckBoxColumn2: TNxCheckBoxColumn
      DefaultWidth = 55
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Header.Caption = 'Sinuhun ?'
      Options = [coCanClick, coCanInput, coCanSort, coEditing, coPublicUsing]
      ParentFont = False
      Position = 6
      SortType = stBoolean
      Width = 55
    end
  end
  object btnKeluar: TsButton
    Left = 496
    Top = 376
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
    Left = 152
    Top = 112
    object Delete1: TMenuItem
      Caption = 'Delete'
      ShortCut = 46
      Visible = False
      OnClick = Delete1Click
    end
  end
end
