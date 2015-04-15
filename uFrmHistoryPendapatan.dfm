object FrmHistoryPendapatan: TFrmHistoryPendapatan
  Left = 653
  Top = 104
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'History Pendapatan'
  ClientHeight = 473
  ClientWidth = 527
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
    Top = 432
    Width = 242
    Height = 26
    Caption = 
      'del untuk delete, F2 untuk edit data'#13#10'baris warna biru = pembaya' +
      'ran dengan kartu kredit '
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object grid: TNextGrid
    Left = 0
    Top = 41
    Width = 527
    Height = 383
    Align = alTop
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    Options = [goFooter, goGrid, goHeader, goIndicator, goSelectFullRow]
    ParentFont = False
    TabOrder = 0
    TabStop = True
    OnCellColoring = gridCellColoring
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
    object NxTextColumn4: TNxTextColumn
      DefaultWidth = 100
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Header.Caption = 'Keterangan'
      Options = [coCanClick, coCanInput, coPublicUsing, coShowTextFitHint]
      ParentFont = False
      Position = 1
      SortType = stAlphabetic
      Width = 100
    end
    object NxTextColumn1: TNxTextColumn
      DefaultWidth = 150
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Header.Caption = 'Meja'
      ParentFont = False
      Position = 2
      SortType = stAlphabetic
      Width = 150
    end
    object NxTextColumn3: TNxTextColumn
      DefaultWidth = 100
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Header.Caption = 'Struk'
      Options = [coCanClick, coCanInput, coPublicUsing, coShowTextFitHint]
      ParentFont = False
      Position = 3
      SortType = stAlphabetic
      Width = 100
    end
    object NxTextColumn2: TNxNumberColumn
      Alignment = taLeftJustify
      DefaultValue = '0'
      DefaultWidth = 100
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Footer.TextBefore = 'Rp.'
      Footer.FormulaKind = fkSum
      Footer.FormatMask = '#,##0'
      Footer.FormatMaskKind = mkFloat
      Header.Caption = 'Total Harga'
      Options = [coCanClick, coCanInput, coPublicUsing, coShowTextFitHint]
      ParentFont = False
      Position = 4
      SortType = stNumeric
      Width = 100
      FormatMask = '#,##0'
      Increment = 1.000000000000000000
      Precision = 0
    end
    object NxTextColumn5: TNxNumberColumn
      Alignment = taLeftJustify
      DefaultValue = '0'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Header.Caption = 'id'
      Options = [coCanClick, coCanInput, coCanSort, coPublicUsing, coShowTextFitHint]
      ParentFont = False
      Position = 5
      SortType = stNumeric
      Visible = False
      Increment = 1.000000000000000000
      Precision = 0
    end
    object NxNumberColumn3: TNxNumberColumn
      DefaultValue = '0'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Header.Caption = 'no.meja'
      ParentFont = False
      Position = 6
      SortType = stNumeric
      Visible = False
      Increment = 1.000000000000000000
      Precision = 0
    end
    object NxNumberColumn1: TNxNumberColumn
      DefaultValue = '0'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Header.Caption = 'trpependapatan'
      ParentFont = False
      Position = 7
      SortType = stNumeric
      Visible = False
      Increment = 1.000000000000000000
      Precision = 0
    end
    object nxtxtclmn1: TNxTextColumn
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Header.Caption = 'isKredit'
      ParentFont = False
      Position = 8
      SortType = stAlphabetic
      Visible = False
    end
  end
  object sPanel1: TsPanel
    Left = 0
    Top = 0
    Width = 527
    Height = 41
    Align = alTop
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    object cal: TESBCalEdit
      Left = 64
      Top = 8
      Height = 22
      FormatType = edfCustom
      BoundLower = 40377.000000000000000000
      BoundUpper = 40377.000000000000000000
      BoundLowerYear = 2010
      BoundUpperYear = 2010
      YearCutoff = 1920
      YearDigitType = edyCutOff
      Format = 'dd-MM-yyyy'
      OnChange = calChange
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object btnNext: TsButton
      Left = 168
      Top = 8
      Width = 46
      Height = 25
      Cursor = crHandPoint
      Caption = '>'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnNextClick
      SkinData.SkinSection = 'BUTTON'
    end
    object btnPrev: TsButton
      Left = 7
      Top = 8
      Width = 52
      Height = 25
      Cursor = crHandPoint
      Caption = '< '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnPrevClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object btnClose: TsButton
    Left = 416
    Top = 432
    Width = 91
    Height = 25
    Cursor = crHandPoint
    Caption = 'Tutup'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnCloseClick
    SkinData.SkinSection = 'BUTTON'
  end
  object MainMenu1: TMainMenu
    Left = 296
    Top = 200
    object delete2: TMenuItem
      Caption = 'delete'
      ShortCut = 46
      Visible = False
      OnClick = delete2Click
    end
    object Edit2: TMenuItem
      Caption = 'Edit'
      ShortCut = 113
      Visible = False
      OnClick = Edit2Click
    end
  end
end
