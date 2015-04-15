object FrmMasterMenus: TFrmMasterMenus
  Left = 291
  Top = 95
  Width = 512
  Height = 571
  Caption = 'Form Menu'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 20
  object sPanel1: TsPanel
    Left = 0
    Top = 0
    Width = 504
    Height = 41
    Align = alTop
    Caption = 'Menu'
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
  end
  object sGroupBox1: TsGroupBox
    Left = 0
    Top = 41
    Width = 504
    Height = 240
    Align = alTop
    Caption = 'Data Menu'
    TabOrder = 1
    SkinData.SkinSection = 'GROUPBOX'
    object sLabelFX1: TsLabelFX
      Left = 24
      Top = 62
      Width = 44
      Height = 22
      Caption = 'Nama'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object sLabelFX2: TsLabelFX
      Left = 24
      Top = 166
      Width = 46
      Height = 22
      Caption = 'Harga'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object sLabelFX3: TsLabelFX
      Left = 24
      Top = 24
      Width = 62
      Height = 22
      Caption = 'Barcode'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object sLabelFX4: TsLabelFX
      Left = 24
      Top = 96
      Width = 39
      Height = 22
      Caption = 'Jenis'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object sLabelFX5: TsLabelFX
      Left = 24
      Top = 132
      Width = 54
      Height = 22
      Caption = 'Satuan'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object eNama: TsEdit
      Left = 112
      Top = 62
      Width = 361
      Height = 28
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Text = 'eNama'
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
    object eHarga: TsEdit
      Left = 112
      Top = 166
      Width = 169
      Height = 28
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      Text = 'eHarga'
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
    object eBarcode: TsEdit
      Left = 112
      Top = 24
      Width = 361
      Height = 28
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = 'eBarcode'
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
      Left = 384
      Top = 208
      Width = 91
      Height = 25
      Caption = 'Simpan'
      TabOrder = 6
      OnClick = btnSimpanClick
      SkinData.SkinSection = 'BUTTON'
    end
    object btnBatal: TsButton
      Left = 296
      Top = 208
      Width = 75
      Height = 25
      Caption = 'Batal'
      TabOrder = 7
      OnClick = btnBatalClick
      SkinData.SkinSection = 'BUTTON'
    end
    object btnBaru: TsButton
      Left = 32
      Top = 208
      Width = 75
      Height = 25
      Caption = 'Baru'
      TabOrder = 0
      OnClick = btnBaruClick
      SkinData.SkinSection = 'BUTTON'
    end
    object cmbJenisMenu: TsComboBox
      Left = 112
      Top = 96
      Width = 169
      Height = 28
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 20
      ItemIndex = -1
      ParentFont = False
      TabOrder = 3
      Text = 'cmbJenisMenu'
    end
    object btnJenis: TsButton
      Left = 288
      Top = 96
      Width = 75
      Height = 25
      Caption = 'Jenis'
      TabOrder = 8
      OnClick = btnJenisClick
      SkinData.SkinSection = 'BUTTON'
    end
    object cmbSatuan: TsComboBox
      Left = 112
      Top = 128
      Width = 169
      Height = 28
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 20
      ItemIndex = -1
      ParentFont = False
      TabOrder = 4
      Text = 'cmbSatuan'
    end
    object btnSatuan: TsButton
      Left = 288
      Top = 128
      Width = 75
      Height = 25
      Caption = 'Satuan'
      TabOrder = 9
      OnClick = btnSatuanClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object btnKeluar: TsButton
    Left = 400
    Top = 512
    Width = 91
    Height = 25
    Caption = 'Keluar'
    TabOrder = 2
    OnClick = btnKeluarClick
    SkinData.SkinSection = 'BUTTON'
  end
  object lv1: TListView
    Left = 0
    Top = 281
    Width = 504
    Height = 208
    Align = alTop
    Columns = <
      item
        Caption = 'No.'
      end
      item
        Caption = 'ID'
        Width = 0
      end
      item
        Caption = 'Barcode'
        Width = 0
      end
      item
        Caption = 'Nama'
        Width = 300
      end
      item
        Caption = 'Jenis Makanan'
        Width = 0
      end
      item
        Caption = 'Satuan'
        Width = 0
      end
      item
        Caption = 'Harga'
        Width = 100
      end>
    GridLines = True
    ReadOnly = True
    RowSelect = True
    TabOrder = 3
    ViewStyle = vsReport
  end
end
