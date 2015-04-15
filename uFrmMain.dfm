object FrmMain: TFrmMain
  Left = 189
  Top = 169
  Width = 1278
  Height = 770
  Caption = 'Sea Food 58 - POS Application'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = mm1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object NxLabel7: TNxLabel
    Left = 8
    Top = 40
    Width = 128
    Height = 16
    Caption = 'Pendapatan Hari Ini'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    HorizontalPosition = hpLeft
    InnerHorizontal = True
    InnerVertical = False
    InnerMargins.Horizontal = 0
    InnerMargins.Vertical = 2
    VerticalPosition = vpTop
  end
  object NxLabel8: TNxLabel
    Left = 8
    Top = 64
    Width = 131
    Height = 16
    Caption = 'Pengeluaran Hari Ini'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    HorizontalPosition = hpLeft
    InnerHorizontal = True
    InnerVertical = False
    InnerMargins.Horizontal = 0
    InnerMargins.Vertical = 2
    VerticalPosition = vpTop
  end
  object NxLabel9: TNxLabel
    Left = 8
    Top = 88
    Width = 88
    Height = 16
    Caption = 'Modal Tersisa'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    HorizontalPosition = hpLeft
    InnerHorizontal = True
    InnerVertical = False
    InnerMargins.Horizontal = 0
    InnerMargins.Vertical = 2
    VerticalPosition = vpTop
  end
  object NxLabel10: TNxLabel
    Left = 152
    Top = 88
    Width = 92
    Height = 16
    Caption = 'Rp.#.###.###'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    HorizontalPosition = hpLeft
    InnerHorizontal = True
    InnerVertical = False
    InnerMargins.Horizontal = 0
    InnerMargins.Vertical = 2
    VerticalPosition = vpTop
  end
  object NxLabel11: TNxLabel
    Left = 152
    Top = 64
    Width = 92
    Height = 16
    Caption = 'Rp.#.###.###'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    HorizontalPosition = hpLeft
    InnerHorizontal = True
    InnerVertical = False
    InnerMargins.Horizontal = 0
    InnerMargins.Vertical = 2
    VerticalPosition = vpTop
  end
  object NxLabel12: TNxLabel
    Left = 152
    Top = 40
    Width = 92
    Height = 16
    Caption = 'Rp.#.###.###'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    HorizontalPosition = hpLeft
    InnerHorizontal = True
    InnerVertical = False
    InnerMargins.Horizontal = 0
    InnerMargins.Vertical = 2
    VerticalPosition = vpTop
  end
  object sLabelFX10: TsLabelFX
    Left = 60
    Top = 65
    Width = 165
    Height = 30
    Caption = 'Total Setelah Disc.'
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = []
  end
  object RzLEDDisplay2: TRzLEDDisplay
    Left = 226
    Top = 67
    Width = 223
    Height = 24
    Caption = '10.000'
  end
  object sToolBar1: TsToolBar
    Left = 0
    Top = 0
    Width = 1294
    Height = 41
    ButtonHeight = 38
    Caption = 'sToolBar1'
    TabOrder = 0
    SkinData.SkinSection = 'TOOLBAR'
    object lblMeja: TsLabelFX
      Left = 0
      Top = 2
      Width = 1281
      Height = 38
      Align = alClient
      Alignment = taCenter
      AutoSize = False
      Caption = '###'
      ParentFont = False
      Layout = tlCenter
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -29
      Font.Name = 'Arial'
      Font.Style = [fsBold]
    end
  end
  object sPanel1: TsPanel
    Left = 0
    Top = 41
    Width = 1294
    Height = 776
    Align = alClient
    Caption = 'sPanel1'
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    object sPanel3: TsPanel
      Left = 249
      Top = 1
      Width = 1044
      Height = 774
      Align = alClient
      Caption = 'sPanel3'
      TabOrder = 0
      SkinData.SkinSection = 'PANEL'
      object sPanel4: TsPanel
        Left = 1
        Top = 1
        Width = 1042
        Height = 80
        Align = alTop
        TabOrder = 0
        SkinData.SkinSection = 'PANEL'
        object sLabelFX1: TsLabelFX
          Left = 11
          Top = 6
          Width = 66
          Height = 35
          Caption = 'Items'
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = []
        end
        object sLabelFX3: TsLabelFX
          Left = 8
          Top = 42
          Width = 88
          Height = 35
          Caption = 'Banyak'
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = []
        end
        object lblNama_Barcode: TsLabelFX
          Left = 499
          Top = 6
          Width = 15
          Height = 35
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = []
        end
        object cmbCari: TsComboBox
          Left = 97
          Top = 7
          Width = 392
          Height = 27
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
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ItemHeight = 19
          ItemIndex = -1
          ParentFont = False
          TabOrder = 0
          Text = 'cmbCari'
          OnChange = cmbCariChange
          OnKeyPress = cmbCariKeyPress
          Items.Strings = (
            'sasa'
            'baba')
        end
        object eBanyak: TsEdit
          Left = 98
          Top = 44
          Width = 71
          Height = 27
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnEnter = eBanyakEnter
          OnKeyPress = eBanyakKeyPress
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
      end
      object sPanel6: TsPanel
        Left = 1
        Top = 566
        Width = 1042
        Height = 207
        Align = alBottom
        TabOrder = 1
        SkinData.SkinSection = 'PANEL'
        object sLabel4: TsLabel
          Left = 1
          Top = 1
          Width = 371
          Height = 205
          Align = alLeft
          Caption = 
            'Perhatian:'#13#10'  1.Pastikan kolom banyak dalam keadaan tidak kosong' +
            ' saat mengganti harga,'#13#10'     agar perubahan dapat langsung terli' +
            'hat.'#13#10'  2.Perubahan harga yang dilakukan disini tidak bersifat p' +
            'ermanen,'#13#10'     untuk perubahan yang bersifat permanen, silahkan ' +
            'menggunakan'#13#10'     menu Master->Menu sajian (pada kolom harga)'
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
        end
        object sPanel7: TsPanel
          Left = 430
          Top = 1
          Width = 611
          Height = 205
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          SkinData.SkinSection = 'PAGECONTROLLEFT'
          object sLabelFX2: TsLabelFX
            Left = 60
            Top = 65
            Width = 165
            Height = 30
            Caption = 'Total Setelah Disc.'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -19
            Font.Name = 'Arial'
            Font.Style = []
          end
          object sLabelFX8: TsLabelFX
            Left = 134
            Top = 160
            Width = 89
            Height = 44
            Caption = 'Bayar'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -32
            Font.Name = 'Arial'
            Font.Style = []
          end
          object lblTotalBersih: TRzLEDDisplay
            Left = 226
            Top = 67
            Width = 223
            Height = 24
            Caption = '10.000'
          end
          object lblTotalKotor: TRzLEDDisplay
            Left = 226
            Top = 8
            Width = 223
            Height = 23
            Caption = '10.000'
          end
          object sLabelFX4: TsLabelFX
            Left = 130
            Top = 8
            Width = 92
            Height = 30
            Caption = 'Total Awal'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -19
            Font.Name = 'Arial'
            Font.Style = []
          end
          object sLabelFX5: TsLabelFX
            Left = 143
            Top = 35
            Width = 82
            Height = 30
            Caption = 'Discount'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -19
            Font.Name = 'Arial'
            Font.Style = []
          end
          object sLabelFX6: TsLabelFX
            Left = 288
            Top = 35
            Width = 29
            Height = 35
            Caption = '%'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -24
            Font.Name = 'Arial'
            Font.Style = []
          end
          object lblDiscount: TRzLEDDisplay
            Left = 322
            Top = 35
            Width = 128
            Height = 24
            Caption = '10.000'
          end
          object sLabelFX7: TsLabelFX
            Left = 173
            Top = 94
            Width = 54
            Height = 30
            Caption = 'Pajak'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -19
            Font.Name = 'Arial'
            Font.Style = []
          end
          object sLabelFX9: TsLabelFX
            Left = 288
            Top = 95
            Width = 29
            Height = 35
            Caption = '%'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -24
            Font.Name = 'Arial'
            Font.Style = []
          end
          object lblPajak: TRzLEDDisplay
            Left = 322
            Top = 95
            Width = 128
            Height = 24
            Caption = '10.000'
          end
          object sLabelFX11: TsLabelFX
            Left = 60
            Top = 124
            Width = 153
            Height = 44
            Caption = 'Total Akhir'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -32
            Font.Name = 'Arial'
            Font.Style = []
          end
          object lblTotalAkhir: TRzLEDDisplay
            Left = 226
            Top = 127
            Width = 223
            Height = 36
            Caption = '10.000'
          end
          object btnBayar: TsButton
            Left = 453
            Top = 48
            Width = 148
            Height = 153
            Cursor = crHandPoint
            Caption = 'Simpan '#13#10'&& '#13#10'Print'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -24
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = btnBayarClick
            SkinData.SkinSection = 'BUTTON'
          end
          object eBayar: TsEdit
            Left = 226
            Top = 167
            Width = 224
            Height = 32
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -19
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Text = '0'
            OnEnter = eBayarEnter
            OnKeyPress = eBayarKeyPress
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
          object btnBatal: TsButton
            Left = 453
            Top = 8
            Width = 148
            Height = 33
            Cursor = crHandPoint
            Caption = 'Batal'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -24
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            Visible = False
            OnClick = btnBatalClick
            SkinData.SkinSection = 'BUTTON'
          end
          object eDiscount: TsEdit
            Left = 226
            Top = 35
            Width = 55
            Height = 28
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            Text = '0'
            OnEnter = eDiscountEnter
            OnExit = eDiscountExit
            OnKeyPress = eDiscountKeyPress
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
          object ePajak: TsEdit
            Left = 226
            Top = 93
            Width = 55
            Height = 28
            Color = clWhite
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            Text = '10'
            OnEnter = eDiscountEnter
            OnExit = eDiscountExit
            OnKeyPress = ePajakKeyPress
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
        end
      end
      object grid: TNextGrid
        Left = 1
        Top = 81
        Width = 1042
        Height = 485
        Align = alClient
        BorderStyle = bsNone
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Arial'
        Font.Style = []
        GridLinesColor = clMoneyGreen
        HeaderSize = 30
        HeaderStyle = hsVista
        InputEnterMode = imAllways
        Options = [goGrid, goHeader, goIndicator]
        RowSize = 25
        ParentFont = False
        PopupMenu = PopupMenu1
        TabOrder = 2
        TabStop = True
        OnAfterEdit = gridAfterEdit
        OnBeforeEdit = gridBeforeEdit
        OnCellFormating = gridCellFormating
        object id: TNxTextColumn
          DefaultWidth = 8
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Courier'
          Font.Style = [fsBold]
          Header.Caption = 'ID'
          Options = [coCanClick, coCanInput, coPublicUsing, coShowTextFitHint]
          ParentFont = False
          Position = 0
          SortType = stAlphabetic
          Visible = False
          Width = 8
        end
        object satuan: TNxComboBoxColumn
          DefaultWidth = 90
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Header.Caption = 'SATUAN'
          Options = [coCanClick, coCanInput, coEditing, coPublicUsing, coShowTextFitHint]
          ParentFont = False
          Position = 1
          SortType = stAlphabetic
          Width = 90
          DropDownCount = 10
          ListWidth = 10
          Style = cbsDropDownList
        end
        object banyak: TNxNumberColumn
          Alignment = taCenter
          DefaultValue = '0'
          DefaultWidth = 90
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Courier'
          Font.Style = [fsBold]
          Header.Caption = 'BANYAK'
          Options = [coCanClick, coCanInput, coEditing, coPublicUsing, coShowTextFitHint]
          ParentFont = False
          Position = 2
          SortType = stNumeric
          Width = 90
          FormatMask = '#,##0.0'
          Increment = 1.000000000000000000
          Precision = 0
        end
        object menu: TNxTextColumn
          Color = clSkyBlue
          DefaultWidth = 400
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Courier'
          Font.Style = [fsBold]
          Header.Caption = 'MASAKAN/MINUMAN'
          Options = [coCanClick, coCanInput, coPublicUsing, coShowTextFitHint]
          ParentFont = False
          Position = 3
          SortType = stAlphabetic
          Width = 400
        end
        object harga: TNxNumberColumn
          Alignment = taLeftJustify
          DefaultValue = '0'
          DefaultWidth = 120
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Courier New'
          Font.Style = []
          Header.Caption = 'HARGA'
          Options = [coCanClick, coCanInput, coEditing, coPublicUsing, coShowTextFitHint]
          ParentFont = False
          Position = 4
          SortType = stNumeric
          Width = 120
          FormatMask = '#,##0'
          TextBefore = 'Rp.'
          Increment = 1.000000000000000000
          Precision = 0
        end
        object NxTextColumn1: TNxNumberColumn
          Alignment = taLeftJustify
          DefaultValue = '0'
          DefaultWidth = 170
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Courier New'
          Font.Style = []
          Header.Caption = 'TOTAL HARGA'
          Options = [coCanClick, coCanInput, coPublicUsing, coShowTextFitHint]
          ParentFont = False
          Position = 5
          SortType = stNumeric
          Width = 170
          FormatMask = '#,##0'
          TextBefore = 'Rp.'
          Increment = 1.000000000000000000
          Precision = 0
        end
        object keterangan: TNxTextColumn
          DefaultWidth = 300
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Courier'
          Font.Style = [fsBold]
          Header.Caption = 'KETERANGAN'
          Options = [coCanClick, coCanInput, coEditing, coPublicUsing, coShowTextFitHint]
          ParentFont = False
          Position = 6
          SortType = stAlphabetic
          Width = 300
        end
        object NxTextColumn3: TNxTextColumn
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Courier'
          Font.Style = [fsBold]
          Header.Caption = 'Warna'
          ParentFont = False
          Position = 7
          SortType = stAlphabetic
        end
      end
    end
    object NxHeaderPanel1: TNxHeaderPanel
      Left = 1
      Top = 1
      Width = 248
      Height = 774
      Align = alLeft
      CollapseWidth = 20
      Color = clBlack
      ColorScheme = csBlack
      HeaderFont.Charset = DEFAULT_CHARSET
      HeaderFont.Color = clWindowText
      HeaderFont.Height = -11
      HeaderFont.Name = 'MS Sans Serif'
      HeaderFont.Style = []
      HeaderStyle = psVista
      InnerMargins.Left = 1
      InnerMargins.Top = 1
      InnerMargins.Bottom = 1
      InnerMargins.Right = 1
      PanelStyle = ptGradient
      TabOrder = 1
      FullWidth = 248
      object sPanel2: TsPanel
        Left = 1
        Top = 28
        Width = 244
        Height = 743
        Align = alClient
        Caption = 'sPanel2'
        TabOrder = 0
        SkinData.SkinSection = 'PANEL'
        object tvMeja: TsTreeView
          Left = 1
          Top = 1
          Width = 242
          Height = 601
          Cursor = crHandPoint
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = clWhite
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Indent = 29
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          RowSelect = True
          ShowLines = False
          ShowRoot = False
          TabOrder = 0
          OnChange = tvMejaChange
          Items.Data = {
            020000001D0000000000000000000000FFFFFFFFFFFFFFFF0000000000000000
            04585858581E0000000000000000000000FFFFFFFFFFFFFFFF00000000000000
            00055858585858}
          BoundLabel.Caption = 'tvMeja'
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
        object sPanel5: TsPanel
          Left = 1
          Top = 602
          Width = 242
          Height = 140
          Align = alBottom
          TabOrder = 1
          SkinData.SkinSection = 'PANEL'
          object sLabel1: TsLabel
            Left = 8
            Top = 47
            Width = 103
            Height = 14
            Caption = 'Pendapatan hari ini   :'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
          end
          object sLabel2: TsLabel
            Left = 8
            Top = 71
            Width = 103
            Height = 14
            Caption = 'Pengeluaran hari ini  :'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
          end
          object sLabel3: TsLabel
            Left = 8
            Top = 95
            Width = 102
            Height = 14
            Caption = 'Modal Tersisa           :'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
          end
          object lblPendapatan: TsLabel
            Left = 120
            Top = 48
            Width = 6
            Height = 14
            Cursor = crHandPoint
            Caption = '#'
            ParentFont = False
            OnClick = lblPendapatanClick
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsUnderline]
          end
          object lblPengeluaran: TsLabel
            Left = 120
            Top = 72
            Width = 6
            Height = 14
            Cursor = crHandPoint
            Caption = '#'
            ParentFont = False
            OnClick = lblPengeluaranClick
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsUnderline]
          end
          object lblModalSisa: TsLabel
            Left = 120
            Top = 96
            Width = 6
            Height = 14
            Caption = '#'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
          end
          object btnRefreshInfo: TsButton
            Left = 8
            Top = 8
            Width = 75
            Height = 24
            Caption = 'Refresh Info'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = btnRefreshInfoClick
            SkinData.SkinSection = 'BUTTON'
          end
        end
      end
    end
  end
  object sStatusBar1: TsStatusBar
    Left = 0
    Top = 817
    Width = 1294
    Height = 19
    Panels = <
      item
        Text = 'panel1'
        Width = 350
      end
      item
        Width = 200
      end>
    SkinData.SkinSection = 'STATUSBAR'
  end
  object NxPanel1: TNxPanel
    Left = 24
    Top = 153
    Width = 1270
    Height = 664
    Caption = 'NxPanel1'
    UseDockManager = False
    InnerMargins.Left = 0
    InnerMargins.Top = 0
    InnerMargins.Bottom = 0
    InnerMargins.Right = 0
    ParentBackground = False
    TabOrder = 3
    object NxHeaderPanel2: TNxHeaderPanel
      Left = 8
      Top = 8
      Width = 305
      Height = 177
      Caption = 'Info Hari Ini'
      HeaderFont.Charset = DEFAULT_CHARSET
      HeaderFont.Color = clWindowText
      HeaderFont.Height = -11
      HeaderFont.Name = 'MS Sans Serif'
      HeaderFont.Style = []
      TabOrder = 0
      FullWidth = 305
      object NxLabel1: TNxLabel
        Left = 8
        Top = 40
        Width = 128
        Height = 16
        Caption = 'Pendapatan Hari Ini'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        HorizontalPosition = hpLeft
        InnerHorizontal = True
        InnerVertical = False
        InnerMargins.Horizontal = 0
        InnerMargins.Vertical = 2
        VerticalPosition = vpTop
      end
      object lblPendapatan_1: TNxLabel
        Left = 152
        Top = 40
        Width = 92
        Height = 16
        Caption = 'Rp.#.###.###'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        HorizontalPosition = hpLeft
        InnerHorizontal = True
        InnerVertical = False
        InnerMargins.Horizontal = 0
        InnerMargins.Vertical = 2
        VerticalPosition = vpTop
      end
      object NxLabel3: TNxLabel
        Left = 8
        Top = 64
        Width = 131
        Height = 16
        Caption = 'Pengeluaran Hari Ini'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        HorizontalPosition = hpLeft
        InnerHorizontal = True
        InnerVertical = False
        InnerMargins.Horizontal = 0
        InnerMargins.Vertical = 2
        VerticalPosition = vpTop
      end
      object lblPengeluaran_1: TNxLabel
        Left = 152
        Top = 64
        Width = 92
        Height = 16
        Caption = 'Rp.#.###.###'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        HorizontalPosition = hpLeft
        InnerHorizontal = True
        InnerVertical = False
        InnerMargins.Horizontal = 0
        InnerMargins.Vertical = 2
        VerticalPosition = vpTop
      end
      object NxLabel5: TNxLabel
        Left = 8
        Top = 88
        Width = 88
        Height = 16
        Caption = 'Modal Tersisa'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        HorizontalPosition = hpLeft
        InnerHorizontal = True
        InnerVertical = False
        InnerMargins.Horizontal = 0
        InnerMargins.Vertical = 2
        VerticalPosition = vpTop
      end
      object lblModalSisa_1: TNxLabel
        Left = 152
        Top = 88
        Width = 92
        Height = 16
        Caption = 'Rp.#.###.###'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        HorizontalPosition = hpLeft
        InnerHorizontal = True
        InnerVertical = False
        InnerMargins.Horizontal = 0
        InnerMargins.Vertical = 2
        VerticalPosition = vpTop
      end
      object Bevel1: TBevel
        Left = 8
        Top = 105
        Width = 289
        Height = 8
        Shape = bsBottomLine
      end
      object NxLabel13: TNxLabel
        Left = 6
        Top = 120
        Width = 134
        Height = 16
        Caption = 'Pendapatan Kemarin'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        HorizontalPosition = hpLeft
        InnerHorizontal = True
        InnerVertical = False
        InnerMargins.Horizontal = 0
        InnerMargins.Vertical = 2
        VerticalPosition = vpTop
      end
      object NxLabel14: TNxLabel
        Left = 6
        Top = 144
        Width = 137
        Height = 16
        Caption = 'Pengeluaran Kemarin'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        HorizontalPosition = hpLeft
        InnerHorizontal = True
        InnerVertical = False
        InnerMargins.Horizontal = 0
        InnerMargins.Vertical = 2
        VerticalPosition = vpTop
      end
      object lblPengeluaran_2: TNxLabel
        Left = 152
        Top = 144
        Width = 92
        Height = 16
        Caption = 'Rp.#.###.###'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        HorizontalPosition = hpLeft
        InnerHorizontal = True
        InnerVertical = False
        InnerMargins.Horizontal = 0
        InnerMargins.Vertical = 2
        VerticalPosition = vpTop
      end
      object lblPendapatan_2: TNxLabel
        Left = 152
        Top = 120
        Width = 92
        Height = 16
        Caption = 'Rp.#.###.###'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        HorizontalPosition = hpLeft
        InnerHorizontal = True
        InnerVertical = False
        InnerMargins.Horizontal = 0
        InnerMargins.Vertical = 2
        VerticalPosition = vpTop
      end
    end
    object frxPreview1: TfrxPreview
      Left = 328
      Top = 40
      Width = 929
      Height = 617
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      OutlineVisible = False
      OutlineWidth = 120
      ThumbnailVisible = True
      UseReportHints = True
    end
    object btnRefresh: TsButton
      Left = 232
      Top = 192
      Width = 75
      Height = 25
      Caption = 'Refresh'
      TabOrder = 2
      OnClick = btnRefreshClick
      SkinData.SkinSection = 'BUTTON'
    end
    object cbReport: TsComboBox
      Left = 328
      Top = 12
      Width = 121
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
      Style = csDropDownList
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 13
      ItemIndex = -1
      ParentFont = False
      TabOrder = 3
      Items.Strings = (
        'Pendapatan Harian'
        'Pendapatan Bulanan'
        '--------------------------'
        'Pengeluaran Harian'
        'Pengeluaran Bulanan'
        '--------------------------'
        'Rugi/Laba'
        '--------------------------'
        'Stok')
    end
    object btnOK: TsButton
      Left = 456
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 4
      OnClick = btnOKClick
      SkinData.SkinSection = 'BUTTON'
    end
    object btnPrint: TsButton
      Left = 536
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Print'
      TabOrder = 5
      OnClick = btnPrintClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object mm1: TMainMenu
    Left = 704
    Top = 152
    object Application1: TMenuItem
      Tag = 100
      Caption = 'Application'
      object LogOut1: TMenuItem
        Tag = 101
        Caption = 'LogOut'
        OnClick = LogOut1Click
      end
      object N14: TMenuItem
        Caption = '-'
      end
      object GantiPassword1: TMenuItem
        Tag = 102
        Caption = 'Ganti Password'
        OnClick = GantiPassword1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object BackupDatabase1: TMenuItem
        Tag = 103
        Caption = 'Backup && Restore Database'
        OnClick = BackupDatabase1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object LockDesktop1: TMenuItem
        Tag = 104
        Caption = 'Lock Desktop'
        OnClick = LockDesktop1Click
      end
      object ShutdownsWindows1: TMenuItem
        Tag = 105
        Caption = 'Shutdowns Windows'
        OnClick = ShutdownsWindows1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object entang1: TMenuItem
        Tag = 106
        Caption = 'Tentang'
        OnClick = entang1Click
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Tag = 107
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Settings1: TMenuItem
      Tag = 200
      Caption = 'Settings'
      OnClick = Settings1Click
    end
    object Master1: TMenuItem
      Tag = 300
      Caption = 'Master'
      object MasterMeja1: TMenuItem
        Tag = 301
        Caption = 'Master Meja'
        OnClick = MasterMeja1Click
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object MasterSatuan1: TMenuItem
        Tag = 302
        Caption = 'Master Satuan'
        OnClick = MasterSatuan1Click
      end
      object MasterKonversiSatuan1: TMenuItem
        Tag = 303
        Caption = 'Master Konversi Satuan'
        OnClick = MasterKonversiSatuan1Click
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object MasterJenis1: TMenuItem
        Tag = 304
        Caption = 'Master Jenis'
        OnClick = MasterJenis1Click
      end
      object N10: TMenuItem
        Caption = '-'
      end
      object MasterSubJenis1: TMenuItem
        Tag = 305
        Caption = 'Menu Sajian Barcode'
        OnClick = MasterSubJenis1Click
      end
      object FoodandDrinks1: TMenuItem
        Tag = 306
        Caption = 'Menu Sajian NON barcode'
        OnClick = FoodandDrinks1Click
      end
      object N21: TMenuItem
        Caption = '-'
      end
      object BahanDapur1: TMenuItem
        Tag = 307
        Caption = 'Bahan NON Menu '
        OnClick = BahanDapur1Click
      end
      object N12: TMenuItem
        Caption = '-'
      end
      object Employees1: TMenuItem
        Tag = 308
        Caption = 'Pegawai'
        OnClick = Employees1Click
      end
    end
    object Reports1: TMenuItem
      Tag = 400
      Caption = 'Reports'
      object Harian1: TMenuItem
        Tag = 410
        Caption = 'Pendapatan'
        object Pendapatan1: TMenuItem
          Tag = 411
          Caption = 'Harian'
          OnClick = Pendapatan1Click
        end
        object PendapatanBualanan1: TMenuItem
          Tag = 412
          Caption = 'Bulanan'
          OnClick = PendapatanBualanan1Click
        end
      end
      object Bulanan1: TMenuItem
        Tag = 420
        Caption = 'Pengeluaran'
        object Penjualan1: TMenuItem
          Tag = 421
          Caption = 'Harian'
          OnClick = Penjualan1Click
        end
        object Pengeluaran2: TMenuItem
          Tag = 422
          Caption = 'Bulanan'
          OnClick = Pengeluaran2Click
        end
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object RugiLaba1: TMenuItem
        Tag = 430
        Caption = 'Rugi / Laba'
        OnClick = RugiLaba1Click
      end
      object N13: TMenuItem
        Caption = '-'
      end
      object Stok1: TMenuItem
        Tag = 431
        Caption = 'Stok'
        OnClick = Stok1Click
      end
      object PerubahanStok1: TMenuItem
        Tag = 432
        Caption = 'Perubahan Stok'
        OnClick = PerubahanStok1Click
      end
      object N11: TMenuItem
        Caption = '-'
      end
      object utupBuku1: TMenuItem
        Tag = 433
        Caption = 'Tutup Buku Harian'
        OnClick = utupBuku1Click
      end
      object N25: TMenuItem
        Caption = '-'
      end
      object Modal1: TMenuItem
        Tag = 434
        Caption = 'Modal'
        OnClick = Modal1Click
      end
      object N23: TMenuItem
        Caption = '-'
      end
      object Pajak1: TMenuItem
        Tag = 440
        Caption = 'Pajak'
        object SPTPD1: TMenuItem
          Tag = 441
          Caption = 'SPTPD (Surat Pemberitahuan Pajak Daerah)'
          OnClick = SPTPD1Click
        end
        object SSPDSuratSetoranPajakDaerah1: TMenuItem
          Tag = 442
          Caption = 'SSPD (Surat Setoran Pajak Daerah)'
          OnClick = SSPDSuratSetoranPajakDaerah1Click
        end
        object N29: TMenuItem
          Caption = '-'
        end
        object RekapitulasiPenjualan1: TMenuItem
          Tag = 443
          Caption = 'Rekapitulasi Penjualan'
          OnClick = RekapitulasiPenjualan1Click
        end
      end
      object N27: TMenuItem
        Caption = '-'
      end
      object Design1: TMenuItem
        Tag = 450
        Caption = 'Design'
        object DesignStruk1: TMenuItem
          Tag = 451
          Caption = 'Struk'
          OnClick = DesignStruk1Click
        end
        object N17: TMenuItem
          Caption = '-'
        end
        object Pendapatan2: TMenuItem
          Tag = 452
          Caption = 'Pendapatan Harian'
          OnClick = Pendapatan2Click
        end
        object Penjualan2: TMenuItem
          Tag = 453
          Caption = 'Pengeluaran Harian'
          OnClick = Penjualan2Click
        end
        object N20: TMenuItem
          Caption = '-'
        end
        object PendapatanBulanan1: TMenuItem
          Tag = 454
          Caption = 'Pendapatan Bulanan'
          OnClick = PendapatanBulanan1Click
        end
        object PengeluaranBulanan1: TMenuItem
          Tag = 455
          Caption = 'Pengeluaran Bulanan'
          OnClick = PengeluaranBulanan1Click
        end
        object N18: TMenuItem
          Caption = '-'
        end
        object RugiLaba2: TMenuItem
          Tag = 456
          Caption = 'Rugi / Laba'
          OnClick = RugiLaba2Click
        end
        object N19: TMenuItem
          Caption = '-'
        end
        object Stok2: TMenuItem
          Tag = 457
          Caption = 'Stok'
          OnClick = Stok2Click
        end
        object PerubahanStok2: TMenuItem
          Tag = 458
          Caption = 'Perubahan Stok'
          OnClick = PerubahanStok2Click
        end
        object N24: TMenuItem
          Caption = '-'
        end
        object utupBukuHarian2: TMenuItem
          Tag = 459
          Caption = 'Tutup Buku Harian'
          OnClick = utupBukuHarian2Click
        end
        object N26: TMenuItem
          Caption = '-'
        end
        object Modal2: TMenuItem
          Tag = 460
          Caption = 'Modal'
          OnClick = Modal2Click
        end
        object N28: TMenuItem
          Caption = '-'
        end
        object SPTPD2: TMenuItem
          Tag = 461
          Caption = 'SPTPD'
          OnClick = SPTPD2Click
        end
        object SSPD1: TMenuItem
          Tag = 462
          Caption = 'SSPD'
          OnClick = SSPD1Click
        end
        object RekapPenjualan1: TMenuItem
          Tag = 463
          Caption = 'Rekap Penjualan'
          OnClick = RekapPenjualan1Click
        end
      end
    end
    object ransaksi1: TMenuItem
      Tag = 500
      Caption = 'Transaksi'
      object Pengeluaran1: TMenuItem
        Tag = 501
        Caption = 'Pengeluaran Biasa '
        OnClick = Pengeluaran1Click
      end
      object PengeluaranuntukBahanUtamaNONBarcode1: TMenuItem
        Tag = 502
        Caption = 'Pengeluaran untuk Bahan Utama, Barcode dan NON Menu'
        OnClick = PengeluaranuntukBahanUtamaNONBarcode1Click
      end
      object N15: TMenuItem
        Caption = '-'
      end
      object HistoryPendapatan1: TMenuItem
        Tag = 503
        Caption = '(History) Pendapatan'
        OnClick = HistoryPendapatan1Click
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object PendapatanLain1: TMenuItem
        Tag = 504
        Caption = 'Pendapatan Lain'
        OnClick = PendapatanLain1Click
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object ModalAwal1: TMenuItem
        Tag = 505
        Caption = 'Modal Awal'
        OnClick = ModalAwal1Click
      end
      object N16: TMenuItem
        Caption = '-'
      end
      object penguranganStok1: TMenuItem
        Tag = 506
        Caption = 'Perubahan / Penyesuaian Stok secara Manual'
        Visible = False
        OnClick = penguranganStok1Click
      end
      object N22: TMenuItem
        Caption = '-'
      end
      object utupBukuHarian1: TMenuItem
        Tag = 507
        Caption = 'Tutup Buku Harian'
        OnClick = utupBukuHarian1Click
      end
    end
    object View1: TMenuItem
      Caption = 'View'
      object InfoHariini1: TMenuItem
        Caption = 'Info Hari ini'
        ShortCut = 121
        OnClick = InfoHariini1Click
      end
      object Search1: TMenuItem
        Caption = 'Search'
        ShortCut = 114
        OnClick = Search1Click
      end
    end
  end
  object mySQLQueryCari: TmySQLQuery
    Database = DM.mySQLDatabase1
    Left = 1018
    Top = 71
  end
  object mySQLQueryCmbCari: TmySQLQuery
    Database = DM.mySQLDatabase1
    Left = 977
    Top = 70
  end
  object mySQLQueryMenu: TmySQLQuery
    Database = DM.mySQLDatabase1
    Left = 938
    Top = 71
  end
  object MySQLMonitor1: TMySQLMonitor
    TraceFlags = [tfQPrepare, tfQExecute, tfQFetch, tfConnect, tfTransact]
    Left = 506
    Top = 91
  end
  object PopupMenu1: TPopupMenu
    Left = 721
    Top = 298
    object Editbahanpembentuk1: TMenuItem
      Caption = 'Edit bahan pembentuk'
      OnClick = Editbahanpembentuk1Click
    end
  end
  object frxReport1: TfrxReport
    Version = '4.9.32'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    Preview = frxPreview1
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.OutlineVisible = True
    PreviewOptions.ThumbnailVisible = True
    PreviewOptions.ShowCaptions = True
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40445.647215706020000000
    ReportOptions.LastChange = 40445.647215706020000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnBeforePrint = frxReport1BeforePrint
    Left = 640
    Top = 49
    Datasets = <>
    Variables = <>
    Style = <>
  end
end
