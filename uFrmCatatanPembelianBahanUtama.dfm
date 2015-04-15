object FrmCatatanPembelianBahanUtama: TFrmCatatanPembelianBahanUtama
  Left = 401
  Top = 36
  AutoSize = True
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Catatan Pembelian Bahan Utama atau Barang ber-barcode'
  ClientHeight = 692
  ClientWidth = 770
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
  object sPanel1: TsPanel
    Left = 0
    Top = 0
    Width = 770
    Height = 41
    Align = alTop
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object lblModalTersisa: TsLabel
      Left = 288
      Top = 16
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
    object cal: TESBCalEdit
      Left = 96
      Top = 8
      FormatType = edfCustom
      BoundLower = 40385.000000000000000000
      BoundUpper = 40385.000000000000000000
      BoundLowerYear = 2010
      BoundUpperYear = 2010
      YearCutoff = 1920
      YearDigitType = edyCutOff
      Format = 'dd-MM-yyyy'
      OnChange = calChange
      TabOrder = 0
    end
    object btnNext: TsButton
      Left = 202
      Top = 8
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = '>'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnNextClick
      SkinData.SkinSection = 'BUTTON'
    end
    object btnPrev: TsButton
      Left = 16
      Top = 6
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = '<'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnPrevClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object NxFlipPanel1: TNxFlipPanel
    Left = 0
    Top = 337
    Width = 770
    Height = 305
    Align = alTop
    Caption = 'List Catatan Pembelian'
    CollapseGlyph.Data = {
      7A010000424D7A01000000000000360000002800000009000000090000000100
      2000000000004401000000000000000000000000000000000000604830406048
      30FF604830FF604830FF604830FF604830FF604830FF604830FF60483040C0A8
      90FFFFF0E0FFE0D0C0FFE0C8B0FFE0C0B0FFD0B8A0FFD0B8A0FFD0B8A0FF6048
      30FFC0A890FFFFF8F0FFFFF0E0FFF0E0E0FFF0D8D0FFF0D8C0FFF0D0C0FFD0B8
      A0FF604830FFC0A890FFFFF8FFFFFFF8F0FFFFF0E0FFF0E0E0FFF0D8D0FFF0D0
      C0FFD0B8A0FF604830FFC0A8A0FFFFFFFFFF604830FF604830FF604830FF6048
      30FF604830FFE0C0B0FF604830FFC0A8A0FFFFFFFFFFFFFFFFFFFFF8FFFFFFF0
      F0FFFFF0E0FFF0E8E0FFE0C0B0FF604830FFC0B0A0FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFF8FFFFFFF0F0FFFFF0E0FFE0D0C0FF604830FFC0B0A0FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFF8FFFFFFF0F0FFF0F0E0FF604830FFC0B0A040C0B0
      A0FFC0B0A0FFC0A8A0FFC0A8A0FFC0A8A0FFC0A890FFC0A090FF60483040}
    ExpandGlyph.Data = {
      7A010000424D7A01000000000000360000002800000009000000090000000100
      2000000000004401000000000000000000000000000000000000604830406048
      30FF604830FF604830FF604830FF604830FF604830FF604830FF60483040C0A8
      90FFFFF0E0FFE0D0C0FFE0C8B0FFE0C0B0FFD0B8A0FFD0B8A0FFD0B8A0FF6048
      30FFC0A890FFFFF8F0FFFFF0E0FFF0E0E0FF604830FFF0D8C0FFF0D0C0FFD0B8
      A0FF604830FFC0A890FFFFF8FFFFFFF8F0FFFFF0E0FF604830FFF0D8D0FFF0D0
      C0FFD0B8A0FF604830FFC0A8A0FFFFFFFFFF604830FF604830FF604830FF6048
      30FF604830FFE0C0B0FF604830FFC0A8A0FFFFFFFFFFFFFFFFFFFFF8FFFF6048
      30FFFFF0E0FFF0E8E0FFE0C0B0FF604830FFC0B0A0FFFFFFFFFFFFFFFFFFFFFF
      FFFF604830FFFFF0F0FFFFF0E0FFE0D0C0FF604830FFC0B0A0FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFF8FFFFFFF0F0FFF0F0E0FF604830FFC0B0A040C0B0
      A0FFC0B0A0FFC0A8A0FFC0A8A0FFC0A8A0FFC0A890FFC0A090FF60483040}
    HeaderFont.Charset = DEFAULT_CHARSET
    HeaderFont.Color = clWindowText
    HeaderFont.Height = -11
    HeaderFont.Name = 'MS Sans Serif'
    HeaderFont.Style = []
    HeaderStyle = hsFadeAway
    FullHeight = 305
    object grid: TNextGrid
      Left = 9
      Top = 23
      Width = 753
      Height = 278
      Align = alClient
      Options = [goFooter, goGrid, goHeader, goIndicator, goSelectFullRow]
      TabOrder = 0
      TabStop = True
      WantReturns = True
      WantTabs = True
      OnAfterEdit = gridAfterEdit
      OnBeforeEdit = gridBeforeEdit
      object NxNumberColumn2: TNxNumberColumn
        DefaultValue = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Header.Caption = 'id'
        Options = [coCanClick, coCanInput, coPublicUsing]
        Position = 0
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
        Options = [coCanClick, coCanInput, coPublicUsing]
        Position = 1
        SortType = stAlphabetic
        Width = 50
      end
      object subjenismenu: TNxComboBoxColumn
        DefaultWidth = 150
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Header.Caption = 'Item'
        Options = [coCanClick, coCanInput, coPublicUsing]
        Position = 2
        SortType = stAlphabetic
        Width = 150
      end
      object satuan: TNxComboBoxColumn
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Header.Caption = 'Satuan'
        Options = [coCanClick, coCanInput, coEditing, coPublicUsing]
        Position = 3
        SortType = stAlphabetic
        Style = cbsDropDownList
      end
      object banyak: TNxNumberColumn
        Alignment = taLeftJustify
        DefaultValue = '0'
        DefaultWidth = 70
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Header.Caption = 'Banyak'
        Options = [coCanClick, coCanInput, coEditing, coPublicUsing]
        Position = 4
        SortType = stNumeric
        Width = 70
        FormatMask = '#,##0.0'
        Increment = 1.000000000000000000
        Precision = 0
      end
      object hargasatuan: TNxNumberColumn
        Alignment = taLeftJustify
        DefaultValue = '0'
        DefaultWidth = 90
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Header.Caption = 'Harga Satuan'
        Options = [coCanClick, coCanInput, coCanSort, coEditing, coPublicUsing]
        Position = 5
        SortType = stNumeric
        Width = 90
        FormatMask = '#,##0'
        TextBefore = 'Rp.'
        Increment = 1.000000000000000000
        Precision = 0
      end
      object total: TNxNumberColumn
        Alignment = taLeftJustify
        DefaultValue = '0'
        DefaultWidth = 100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footer.TextBefore = 'Rp.'
        Footer.FormulaKind = fkSum
        Footer.FormatMask = '#,##0'
        Footer.FormatMaskKind = mkFloat
        Header.Caption = 'Total'
        Options = [coCanClick, coCanSort, coPublicUsing]
        Position = 6
        SortType = stNumeric
        Width = 100
        FormatMask = '#,##0'
        TextBefore = 'Rp.'
        Increment = 1.000000000000000000
        Precision = 0
      end
      object keterangan: TNxTextColumn
        DefaultWidth = 200
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Header.Caption = 'Keterangan'
        Options = [coCanClick, coCanInput, coCanSort, coEditing, coPublicUsing, coShowTextFitHint]
        Position = 7
        SortType = stAlphabetic
        Width = 200
      end
    end
  end
  object NxFlipPanel2: TNxFlipPanel
    Left = 0
    Top = 41
    Width = 770
    Height = 296
    Align = alTop
    Caption = 'Entry Data Pembelian'
    CollapseGlyph.Data = {
      7A010000424D7A01000000000000360000002800000009000000090000000100
      2000000000004401000000000000000000000000000000000000604830406048
      30FF604830FF604830FF604830FF604830FF604830FF604830FF60483040C0A8
      90FFFFF0E0FFE0D0C0FFE0C8B0FFE0C0B0FFD0B8A0FFD0B8A0FFD0B8A0FF6048
      30FFC0A890FFFFF8F0FFFFF0E0FFF0E0E0FFF0D8D0FFF0D8C0FFF0D0C0FFD0B8
      A0FF604830FFC0A890FFFFF8FFFFFFF8F0FFFFF0E0FFF0E0E0FFF0D8D0FFF0D0
      C0FFD0B8A0FF604830FFC0A8A0FFFFFFFFFF604830FF604830FF604830FF6048
      30FF604830FFE0C0B0FF604830FFC0A8A0FFFFFFFFFFFFFFFFFFFFF8FFFFFFF0
      F0FFFFF0E0FFF0E8E0FFE0C0B0FF604830FFC0B0A0FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFF8FFFFFFF0F0FFFFF0E0FFE0D0C0FF604830FFC0B0A0FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFF8FFFFFFF0F0FFF0F0E0FF604830FFC0B0A040C0B0
      A0FFC0B0A0FFC0A8A0FFC0A8A0FFC0A8A0FFC0A890FFC0A090FF60483040}
    ExpandGlyph.Data = {
      7A010000424D7A01000000000000360000002800000009000000090000000100
      2000000000004401000000000000000000000000000000000000604830406048
      30FF604830FF604830FF604830FF604830FF604830FF604830FF60483040C0A8
      90FFFFF0E0FFE0D0C0FFE0C8B0FFE0C0B0FFD0B8A0FFD0B8A0FFD0B8A0FF6048
      30FFC0A890FFFFF8F0FFFFF0E0FFF0E0E0FF604830FFF0D8C0FFF0D0C0FFD0B8
      A0FF604830FFC0A890FFFFF8FFFFFFF8F0FFFFF0E0FF604830FFF0D8D0FFF0D0
      C0FFD0B8A0FF604830FFC0A8A0FFFFFFFFFF604830FF604830FF604830FF6048
      30FF604830FFE0C0B0FF604830FFC0A8A0FFFFFFFFFFFFFFFFFFFFF8FFFF6048
      30FFFFF0E0FFF0E8E0FFE0C0B0FF604830FFC0B0A0FFFFFFFFFFFFFFFFFFFFFF
      FFFF604830FFFFF0F0FFFFF0E0FFE0D0C0FF604830FFC0B0A0FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFF8FFFFFFF0F0FFF0F0E0FF604830FFC0B0A040C0B0
      A0FFC0B0A0FFC0A8A0FFC0A8A0FFC0A8A0FFC0A890FFC0A090FF60483040}
    HeaderFont.Charset = DEFAULT_CHARSET
    HeaderFont.Color = clWindowText
    HeaderFont.Height = -11
    HeaderFont.Name = 'MS Sans Serif'
    HeaderFont.Style = []
    HeaderStyle = hsFadeAway
    FullHeight = 296
    object sLabel2: TsLabel
      Left = 40
      Top = 48
      Width = 51
      Height = 13
      Caption = 'Nama Item'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object sLabel4: TsLabel
      Left = 40
      Top = 84
      Width = 36
      Height = 13
      Caption = 'Banyak'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object sLabel5: TsLabel
      Left = 40
      Top = 116
      Width = 66
      Height = 13
      Caption = 'Harga Satuan'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object sLabel6: TsLabel
      Left = 40
      Top = 144
      Width = 55
      Height = 13
      Caption = 'Keterangan'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object sLabel3: TsLabel
      Left = 204
      Top = 116
      Width = 92
      Height = 13
      Caption = '(Harga beli terakhir)'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Label1: TLabel
      Left = 344
      Top = 232
      Width = 153
      Height = 13
      Caption = '* stok pada grid adalah pada tgl:'
    end
    object cmb1: TsComboBox
      Left = 120
      Top = 46
      Width = 201
      Height = 21
      Alignment = taLeftJustify
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      SkinData.SkinSection = 'COMBOBOX'
      Color = clWhite
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ItemIndex = -1
      ParentFont = False
      TabOrder = 0
      OnChange = cmb1Change
      OnKeyPress = cmb1KeyPress
    end
    object cmb2: TsComboBox
      Left = 184
      Top = 80
      Width = 137
      Height = 21
      Alignment = taLeftJustify
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      SkinData.SkinSection = 'COMBOBOX'
      Color = clWhite
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ItemIndex = -1
      ParentFont = False
      TabOrder = 2
      OnEnter = cmb2Enter
      OnKeyPress = cmb2KeyPress
    end
    object e1: TsEdit
      Left = 120
      Top = 80
      Width = 57
      Height = 21
      Color = clWhite
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnKeyPress = e1KeyPress
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
    object e2: TsEdit
      Left = 120
      Top = 112
      Width = 81
      Height = 21
      Color = clWhite
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnKeyPress = e2KeyPress
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
    object btnSimpan: TsButton
      Left = 264
      Top = 240
      Width = 65
      Height = 25
      Caption = 'Simpan'
      Enabled = False
      TabOrder = 5
      OnClick = btnSimpanClick
      SkinData.SkinSection = 'BUTTON'
    end
    object btnBaru: TsButton
      Left = 120
      Top = 240
      Width = 65
      Height = 25
      Caption = 'Baru'
      TabOrder = 6
      OnClick = btnBaruClick
      SkinData.SkinSection = 'BUTTON'
    end
    object mm1: TsMemo
      Left = 120
      Top = 144
      Width = 209
      Height = 89
      Color = clWhite
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      SkinData.SkinSection = 'EDIT'
    end
    object btnBatal: TsButton
      Left = 192
      Top = 240
      Width = 68
      Height = 25
      Caption = 'Batal'
      Enabled = False
      TabOrder = 7
      OnClick = btnBatalClick
      SkinData.SkinSection = 'BUTTON'
    end
    object gridStok: TNextGrid
      Left = 344
      Top = 40
      Width = 417
      Height = 193
      AppearanceOptions = [aoHideSelection, aoHighlightSlideCells, aoIndicateSelectedCell]
      Color = clWhite
      Options = [goGrid, goHeader, goSelectFullRow]
      SlideSelectionColor = cl3DLight
      TabOrder = 8
      TabStop = True
      OnCellFormating = gridStokCellFormating
      object NxIncrementColumn2: TNxIncrementColumn
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
      object NxTextColumn1: TNxTextColumn
        DefaultWidth = 200
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Header.Caption = 'Nama Item'
        Position = 1
        SortType = stAlphabetic
        Width = 200
      end
      object NxTextColumn2: TNxNumberColumn
        Alignment = taLeftJustify
        DefaultValue = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Header.Caption = 'Stok Terakhir'
        Options = [coCanClick, coCanInput, coCanSort, coPublicUsing, coShowTextFitHint]
        Position = 2
        SortType = stNumeric
        FormatMask = '#,##0.0'
        Increment = 1.000000000000000000
        Precision = 0
      end
      object NxTextColumn3: TNxTextColumn
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Header.Caption = 'Satuan'
        Position = 3
        SortType = stAlphabetic
      end
    end
    object btnRefresh: TsButton
      Left = 672
      Top = 240
      Width = 83
      Height = 25
      Caption = 'Refresh Data'
      TabOrder = 9
      OnClick = btnRefreshClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object sPanel2: TsPanel
    Left = 0
    Top = 642
    Width = 770
    Height = 50
    Align = alTop
    TabOrder = 3
    SkinData.SkinSection = 'PANEL'
    object sLabel1: TsLabel
      Left = 8
      Top = 3
      Width = 238
      Height = 39
      Caption = 
        'Periksa kembali satuan yang anda gunakan, '#13#10'kesalahan dalam memb' +
        'erikan satuan pada barang'#13#10'akan berdampak pada kesalahan laporan' +
        ' stok!'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object btnKeluar: TsButton
      Left = 680
      Top = 17
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = 'Keluar'
      TabOrder = 0
      OnClick = btnKeluarClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object MainMenu1: TMainMenu
    Left = 424
    Top = 120
    object delete1: TMenuItem
      Caption = 'delete'
      ShortCut = 46
      Visible = False
      OnClick = delete1Click
    end
  end
end
