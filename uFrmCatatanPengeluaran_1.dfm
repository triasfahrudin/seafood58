object FrmCatatanPengeluaran_1: TFrmCatatanPengeluaran_1
  Left = 448
  Top = 197
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'History Pengeluaran'
  ClientHeight = 526
  ClientWidth = 810
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object NxHeaderPanel1: TNxHeaderPanel
    Left = 0
    Top = 0
    Width = 810
    Height = 485
    Align = alClient
    BorderColor = clSkyBlue
    Color = clSkyBlue
    HeaderFont.Charset = DEFAULT_CHARSET
    HeaderFont.Color = clWindowText
    HeaderFont.Height = -11
    HeaderFont.Name = 'MS Sans Serif'
    HeaderFont.Style = []
    InnerMargins.Left = 0
    InnerMargins.Top = 0
    InnerMargins.Bottom = 0
    InnerMargins.Right = 0
    TabOrder = 0
    FullWidth = 810
    object lblModalTersisa: TsLabel
      Left = 304
      Top = 8
      Width = 64
      Height = 14
      Caption = 'Modal tersisa'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      UseSkinColor = False
    end
    object grid: TNextGrid
      Left = 0
      Top = 27
      Width = 808
      Height = 456
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Options = [goFooter, goGrid, goHeader, goIndicator, goInput, goRowResizing, goSelectFullRow]
      ParentFont = False
      TabOrder = 0
      TabStop = True
      WantReturns = True
      WantTabs = True
      OnAfterEdit = gridAfterEdit
      OnBeforeEdit = gridBeforeEdit
      OnInputAccept = gridInputAccept
      OnInputAdded = gridInputAdded
      object id: TNxNumberColumn
        DefaultValue = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Header.Caption = 'id'
        Options = [coCanClick, coCanInput, coPublicUsing]
        ParentFont = False
        Position = 0
        SortType = stNumeric
        Visible = False
        Increment = 1.000000000000000000
        Precision = 0
      end
      object NxIncrementColumn1: TNxIncrementColumn
        Color = clBtnFace
        DefaultWidth = 50
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Header.Caption = 'No.'
        Header.Alignment = taCenter
        Options = [coCanClick, coCanInput, coPublicUsing]
        ParentFont = False
        Position = 1
        SortType = stAlphabetic
        Width = 50
      end
      object Item: TNxComboBoxColumn
        DefaultWidth = 200
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Header.Caption = 'Item'
        InputCaption = 'Klik disini untuk menambah data'
        Options = [coCanClick, coCanInput, coEditing, coPublicUsing]
        ParentFont = False
        Position = 2
        SortType = stAlphabetic
        Width = 200
      end
      object HargaSatuan: TNxNumberColumn
        Alignment = taLeftJustify
        DefaultValue = '0'
        DefaultWidth = 79
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Header.Caption = 'Harga Satuan'
        Options = [coCanClick, coCanInput, coEditing, coPublicUsing]
        ParentFont = False
        Position = 3
        SortType = stNumeric
        Width = 79
        FormatMask = '#,##0'
        TextBefore = 'Rp.'
        Increment = 1.000000000000000000
        Precision = 0
      end
      object Banyak: TNxNumberColumn
        Alignment = taLeftJustify
        DefaultValue = '0'
        DefaultWidth = 50
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Header.Caption = 'Banyak'
        Options = [coCanClick, coCanInput, coEditing, coPublicUsing]
        ParentFont = False
        Position = 4
        SortType = stNumeric
        Width = 50
        FormatMask = '#,##0.0'
        Increment = 1.000000000000000000
        Precision = 0
      end
      object Total: TNxNumberColumn
        Alignment = taLeftJustify
        Color = clSkyBlue
        DefaultValue = '0'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Footer.TextBefore = 'Rp.'
        Footer.FormulaKind = fkSum
        Footer.FormatMask = '#,##0'
        Footer.FormatMaskKind = mkFloat
        Header.Caption = 'Total'
        Options = [coCanInput, coPublicUsing]
        ParentFont = False
        Position = 5
        SortType = stNumeric
        FormatMask = '#,##0'
        TextBefore = 'Rp.'
        Increment = 1.000000000000000000
        Precision = 0
      end
      object Keterangan: TNxMemoColumn
        DefaultWidth = 300
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Header.Caption = 'Keterangan'
        Options = [coCanClick, coCanInput, coEditing, coPublicUsing]
        ParentFont = False
        Position = 6
        SortType = stAlphabetic
        Width = 300
      end
      object NxComboBoxColumn2: TNxComboBoxColumn
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Header.Caption = 'Satuan'
        ParentFont = False
        Position = 7
        SortType = stAlphabetic
        Visible = False
      end
      object NxComboBoxColumn1: TNxComboBoxColumn
        DefaultWidth = 100
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Header.Caption = 'Sub Menu'
        ParentFont = False
        Position = 8
        SortType = stAlphabetic
        Visible = False
        Width = 100
      end
      object NxCheckBoxColumn1: TNxCheckBoxColumn
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Header.Caption = 'Bahan Utama ?'
        ParentFont = False
        Position = 9
        SortType = stBoolean
        Visible = False
      end
    end
    object calender: TESBCalEdit
      Left = 112
      Top = 3
      Height = 22
      FormatType = edfCustom
      BoundLower = 40382.000000000000000000
      BoundUpper = 40382.000000000000000000
      BoundLowerYear = 2010
      BoundUpperYear = 2010
      YearCutoff = 1920
      YearDigitType = edyCutOff
      Format = 'dd-MM-yyyy'
      OnChange = calenderChange
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object sButton1: TsButton
      Left = 32
      Top = 0
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = '<'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = sButton1Click
      SkinData.SkinSection = 'BUTTON'
    end
    object sButton2: TsButton
      Left = 216
      Top = 0
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = '>'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = sButton2Click
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object sPanel1: TsPanel
    Left = 0
    Top = 485
    Width = 810
    Height = 41
    Align = alBottom
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    object sLabel1: TsLabel
      Left = 16
      Top = 8
      Width = 147
      Height = 13
      Caption = 'tekan delete untuk menghapus'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object btnKeluar: TsButton
      Left = 696
      Top = 8
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
      TabOrder = 0
      OnClick = btnKeluarClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object MainMenu1: TMainMenu
    Left = 480
    Top = 120
    object Delete1: TMenuItem
      Caption = 'Delete'
      ShortCut = 46
      Visible = False
      OnClick = Delete1Click
    end
  end
end
