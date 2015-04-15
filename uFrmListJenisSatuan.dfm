object FrmListJenisSatuan: TFrmListJenisSatuan
  Left = 455
  Top = 234
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'List Jenis Satuan'
  ClientHeight = 317
  ClientWidth = 305
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
  object sLabel1: TsLabel
    Left = 8
    Top = 264
    Width = 212
    Height = 52
    Caption = 
      'disebut satuan dasar jika satuan itu'#13#10'dijadikan dasar dari satua' +
      'n yang lain.'#13#10'misal: jika ada Kg dan gram, maka sebaiknya'#13#10'satua' +
      'n dasarnya adalah gram'
    ParentFont = False
    Visible = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object grid: TNextGrid
    Left = 0
    Top = 0
    Width = 305
    Height = 281
    Align = alTop
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    HeaderStyle = hsFlatBorders
    InputSize = 20
    Options = [goGrid, goHeader, goIndicator, goInput, goSelectFullRow]
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
    object NxTextColumn3: TNxTextColumn
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Header.Caption = 'id'
      Options = [coCanClick, coCanInput, coPublicUsing, coShowTextFitHint]
      ParentFont = False
      Position = 0
      SortType = stAlphabetic
      Visible = False
    end
    object NxTextColumn1: TNxIncrementColumn
      Alignment = taRightJustify
      Color = clSkyBlue
      DefaultWidth = 40
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Header.Caption = 'No.'
      Options = [coCanClick, coCanInput, coDisableMoving, coPublicUsing, coShowTextFitHint]
      ParentFont = False
      Position = 1
      SortType = stAlphabetic
      Width = 40
    end
    object satuan: TNxTextColumn
      DefaultWidth = 200
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Header.Caption = 'Nama Satuan'
      InputCaption = 'klik disini untuk menambah'
      Options = [coCanClick, coCanInput, coDisableMoving, coEditing, coPublicUsing, coShowTextFitHint]
      ParentFont = False
      Position = 2
      SortType = stAlphabetic
      Width = 200
    end
    object isBase: TNxCheckBoxColumn
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Header.Caption = 'Satuan dasar ?'
      Options = [coCanClick, coCanInput, coCanSort, coEditing, coPublicUsing]
      ParentFont = False
      Position = 3
      SortType = stBoolean
      Visible = False
    end
  end
  object btnKeluar: TsButton
    Left = 208
    Top = 286
    Width = 91
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
    Left = 176
    Top = 88
    object Delete2: TMenuItem
      Caption = 'Delete'
      ShortCut = 46
      Visible = False
      OnClick = Delete2Click
    end
  end
end
