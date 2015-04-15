object FrmPenguranganStok: TFrmPenguranganStok
  Left = 308
  Top = 145
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Perubahan Stok'
  ClientHeight = 716
  ClientWidth = 867
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
    Top = 673
    Width = 867
    Height = 44
    Align = alTop
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object btnKeluar: TsButton
      Left = 688
      Top = 8
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = 'Keluar'
      TabOrder = 0
      OnClick = btnKeluarClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object sPanel2: TsPanel
    Left = 0
    Top = 0
    Width = 867
    Height = 41
    Align = alTop
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    object cal: TESBCalEdit
      Left = 96
      Top = 11
      FormatType = edfCustom
      BoundLower = 40404.000000000000000000
      BoundUpper = 40404.000000000000000000
      BoundLowerYear = 2010
      BoundUpperYear = 2010
      YearCutoff = 1920
      YearDigitType = edyCutOff
      Format = 'dd-MM-yyyy'
      OnChange = calChange
      TabOrder = 0
    end
    object btnNext: TsButton
      Left = 208
      Top = 8
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = '>'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnNextClick
      SkinData.SkinSection = 'BUTTON'
    end
    object btnPrev: TsButton
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = '<'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
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
    Top = 321
    Width = 867
    Height = 352
    Align = alTop
    Caption = 'List Pengurangan Stok'
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
    FullHeight = 352
    object grid: TNextGrid
      Left = 9
      Top = 23
      Width = 850
      Height = 325
      Align = alClient
      Options = [goEscClearEdit, goFooter, goGrid, goHeader, goSelectFullRow]
      TabOrder = 0
      TabStop = True
      WantReturns = True
      WantTabs = True
      OnAfterEdit = gridAfterEdit
      OnBeforeEdit = gridBeforeEdit
      OnInputAccept = gridInputAccept
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
      object Id: TNxNumberColumn
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
      object items: TNxComboBoxColumn
        Color = clBtnFace
        DefaultWidth = 150
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Header.Caption = 'Nama SubItems / Items'
        Position = 2
        SortType = stAlphabetic
        Width = 150
      end
      object is_pengurangan: TNxCheckBoxColumn
        DefaultWidth = 70
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Header.Caption = 'Pengurangan'
        Position = 3
        SortType = stBoolean
        Width = 70
      end
      object banyak: TNxNumberColumn
        DefaultValue = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Header.Caption = 'Banyak'
        Options = [coCanClick, coCanInput, coCanSort, coEditing, coPublicUsing]
        Position = 4
        SortType = stNumeric
        FormatMask = '#,##0.0'
        Increment = 1.000000000000000000
        Precision = 0
      end
      object satuan: TNxComboBoxColumn
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Header.Caption = 'Satuan'
        Options = [coCanClick, coCanInput, coCanSort, coEditing, coPublicUsing, coShowTextFitHint]
        Position = 5
        SortType = stAlphabetic
      end
      object harga_satuan: TNxNumberColumn
        DefaultValue = '0'
        DefaultWidth = 100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Header.Caption = 'Harga Jual Satuan'
        Options = [coCanClick, coCanInput, coCanSort, coEditing, coPublicUsing]
        Position = 6
        SortType = stNumeric
        Width = 100
        FormatMask = '#,##0'
        Increment = 1.000000000000000000
        Precision = 0
      end
      object NxNumberColumn3: TNxNumberColumn
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
        Header.Caption = 'Sub Total'
        Options = [coCanClick, coCanInput, coCanSort, coEditing, coPublicUsing]
        Position = 7
        SortType = stNumeric
        Width = 100
        FormatMask = '#,##0'
        TextBefore = 'Rp.'
        Increment = 1.000000000000000000
        Precision = 0
      end
      object alasan: TNxTextColumn
        DefaultWidth = 200
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Header.Caption = 'Alasan Pengurangan'
        Options = [coCanClick, coCanInput, coCanSort, coEditing, coPublicUsing, coShowTextFitHint]
        Position = 8
        SortType = stAlphabetic
        Width = 200
      end
    end
  end
  object NxFlipPanel2: TNxFlipPanel
    Left = 0
    Top = 41
    Width = 867
    Height = 280
    Align = alTop
    Caption = 'Entry pengurangan Stok'
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
    FullHeight = 280
    object sLabel2: TsLabel
      Left = 40
      Top = 48
      Width = 71
      Height = 13
      Caption = 'Nama Subjenis'
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
      Width = 99
      Height = 13
      Caption = 'Alasan Pengurangan'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cmb1: TsComboBox
      Left = 144
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
    object e1: TsEdit
      Left = 144
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
    object cmb2: TsComboBox
      Left = 208
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
      Style = csDropDownList
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
    object e2: TsEdit
      Left = 144
      Top = 112
      Width = 113
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
    object mm1: TsMemo
      Left = 144
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
    object btnBaru: TsButton
      Left = 144
      Top = 240
      Width = 65
      Height = 25
      Caption = 'Baru'
      TabOrder = 5
      OnClick = btnBaruClick
      SkinData.SkinSection = 'BUTTON'
    end
    object btnBatal: TsButton
      Left = 216
      Top = 240
      Width = 68
      Height = 25
      Caption = 'Batal'
      Enabled = False
      TabOrder = 6
      OnClick = btnBatalClick
      SkinData.SkinSection = 'BUTTON'
    end
    object btnSimpan: TsButton
      Left = 288
      Top = 240
      Width = 65
      Height = 25
      Caption = 'Simpan'
      Enabled = False
      TabOrder = 7
      OnClick = btnSimpanClick
      SkinData.SkinSection = 'BUTTON'
    end
    object cb1: TsCheckBox
      Left = 40
      Top = 24
      Width = 114
      Height = 19
      Caption = 'Pengurangan Stok'
      Checked = True
      Color = clMenuBar
      ParentColor = False
      State = cbChecked
      TabOrder = 8
      SkinData.SkinSection = 'CHECKBOX'
      ImgChecked = 0
      ImgUnchecked = 0
    end
  end
  object MainMenu1: TMainMenu
    Left = 376
    Top = 192
    object Delete1: TMenuItem
      Caption = 'Delete'
      ShortCut = 46
      Visible = False
      OnClick = Delete1Click
    end
  end
end
