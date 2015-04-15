object FrmCatatanPengeluaran: TFrmCatatanPengeluaran
  Left = 229
  Top = 266
  Width = 870
  Height = 522
  BorderIcons = [biSystemMenu]
  Caption = 'Catatan Pengeluaran'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sPanel1: TsPanel
    Left = 0
    Top = 0
    Width = 862
    Height = 49
    Align = alTop
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object sLabel1: TsLabel
      Left = 408
      Top = 31
      Width = 199
      Height = 13
      Caption = 'Modal tersisa s/d sekarang (dd-MM-yyyy) :'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object sLabel2: TsLabel
      Left = 616
      Top = 24
      Width = 96
      Height = 20
      Caption = 'Rp.#.###.###'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object calender: TESBCalEdit
      Left = 88
      Top = 14
      FormatType = edfCustom
      BoundLower = 40372.000000000000000000
      BoundUpper = 40372.000000000000000000
      BoundLowerYear = 2010
      BoundUpperYear = 2010
      YearCutoff = 1920
      YearDigitType = edyCutOff
      Format = 'dd-MM-yyyy'
      OnChange = calenderChange
      TabOrder = 0
    end
    object btnPrev: TsButton
      Left = 8
      Top = 14
      Width = 75
      Height = 25
      Caption = '<'
      TabOrder = 1
      OnClick = btnPrevClick
      SkinData.SkinSection = 'BUTTON'
    end
    object btnNext: TsButton
      Left = 192
      Top = 14
      Width = 75
      Height = 25
      Caption = '>'
      TabOrder = 2
      OnClick = btnNextClick
      SkinData.SkinSection = 'BUTTON'
    end
    object btnAddRow: TsButton
      Left = 278
      Top = 14
      Width = 81
      Height = 25
      Caption = 'Tambah Baris'
      TabOrder = 3
      OnClick = btnAddRowClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object sPanel2: TsPanel
    Left = 0
    Top = 392
    Width = 862
    Height = 57
    Align = alTop
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    object sLabelFX1: TsLabelFX
      Left = 432
      Top = 8
      Width = 170
      Height = 37
      Caption = 'TOTAL AKHIR '
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object lblTotAkhir: TsLabelFX
      Left = 616
      Top = 5
      Width = 120
      Height = 45
      Caption = 'Rp.0,00'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -32
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object sLabel3: TsLabel
      Left = 8
      Top = 16
      Width = 224
      Height = 28
      Caption = 
        '* Total Akhir dan Modal tersisa akan dihitung '#13#10'   saat anda men' +
        'ekan tombol simpan'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsItalic]
    end
  end
  object sg: TRzStringGrid
    Left = 0
    Top = 49
    Width = 862
    Height = 343
    Align = alTop
    ColCount = 7
    TabOrder = 2
    OnClick = sgClick
    OnSelectCell = sgSelectCell
  end
  object mmKeterangan: TMemo
    Left = 368
    Top = 224
    Width = 185
    Height = 89
    Lines.Strings = (
      'mmKeterangan')
    TabOrder = 3
    OnChange = cmbItemChange
    OnExit = mmKeteranganExit
    OnKeyPress = mmKeteranganKeyPress
  end
  object eBanyak: TEdit
    Left = 208
    Top = 248
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'eBanyak'
    OnChange = cmbItemChange
    OnExit = eBanyakExit
    OnKeyPress = eBanyakKeyPress
  end
  object eHargaSatuan: TEdit
    Left = 208
    Top = 272
    Width = 121
    Height = 21
    TabOrder = 5
    Text = 'eHargaSatuan'
    OnChange = cmbItemChange
    OnExit = eHargaSatuanExit
    OnKeyPress = eHargaSatuanKeyPress
  end
  object cmbItem: TComboBox
    Left = 208
    Top = 224
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 6
    Text = 'cmbItem'
    OnChange = cmbItemChange
    OnExit = cmbItemExit
  end
  object btnBatal: TsButton
    Left = 624
    Top = 458
    Width = 75
    Height = 25
    Caption = 'Batal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = btnBatalClick
    SkinData.SkinSection = 'BUTTON'
  end
  object btnSimpan: TsButton
    Left = 704
    Top = 458
    Width = 75
    Height = 25
    Caption = 'Simpan'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = btnSimpanClick
    SkinData.SkinSection = 'BUTTON'
  end
  object btnKeluar: TsButton
    Left = 784
    Top = 458
    Width = 75
    Height = 25
    Caption = 'Keluar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnClick = btnKeluarClick
    SkinData.SkinSection = 'BUTTON'
  end
end
