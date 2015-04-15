object FrmPengeluaran: TFrmPengeluaran
  Left = 272
  Top = 167
  Width = 807
  Height = 420
  Caption = 'Pengeluaran'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 16
  object sPanel1: TsPanel
    Left = 0
    Top = 0
    Width = 799
    Height = 57
    Align = alTop
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object sLabelFX1: TsLabelFX
      Left = 1
      Top = 1
      Width = 797
      Height = 37
      Align = alTop
      Alignment = taCenter
      Caption = 'Catatan Pengeluaran'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
  end
  object sGroupBox1: TsGroupBox
    Left = 0
    Top = 57
    Width = 799
    Height = 336
    Align = alTop
    Caption = 'Details'
    TabOrder = 1
    SkinData.SkinSection = 'GROUPBOX'
    object sLabelFX4: TsLabelFX
      Left = 20
      Top = 66
      Width = 61
      Height = 24
      Caption = 'Pegawai'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object sLabelFX2: TsLabelFX
      Left = 16
      Top = 24
      Width = 59
      Height = 24
      Caption = 'Tanggal'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object sLabelFX3: TsLabelFX
      Left = 20
      Top = 124
      Width = 76
      Height = 24
      Caption = 'Penjelasan'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object sLabelFX5: TsLabelFX
      Left = 20
      Top = 228
      Width = 80
      Height = 24
      Caption = 'Harga Total'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object sLabelFX6: TsLabelFX
      Left = 20
      Top = 96
      Width = 33
      Height = 24
      Caption = 'Item'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object bvl1: TBevel
      Left = 19
      Top = 296
      Width = 766
      Height = 17
      Shape = bsTopLine
    end
    object sLabelFX7: TsLabelFX
      Left = 584
      Top = 264
      Width = 72
      Height = 24
      Caption = 'Total Akhir'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object lblTotAkhir: TsLabelFX
      Left = 664
      Top = 264
      Width = 99
      Height = 24
      Caption = '#############'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cmbPegawai: TsComboBox
      Left = 105
      Top = 66
      Width = 145
      Height = 24
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
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 16
      ItemIndex = -1
      ParentFont = False
      TabOrder = 0
      Text = 'cmbPegawai'
    end
    object NxDatePicker1: TNxDatePicker
      Left = 104
      Top = 24
      Width = 143
      Height = 24
      TabOrder = 1
      Text = '7/12/2010'
      HideFocus = False
      Date = 40371.000000000000000000
      NoneCaption = 'None'
      TodayCaption = 'Today'
    end
    object sMemo1: TsMemo
      Left = 105
      Top = 123
      Width = 289
      Height = 97
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Lines.Strings = (
        'sMemo1')
      ParentFont = False
      TabOrder = 2
      Text = 'sMemo1'
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
    object sEdit1: TsEdit
      Left = 105
      Top = 227
      Width = 289
      Height = 32
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      Text = 'sEdit1'
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
    object sEdit2: TsEdit
      Left = 105
      Top = 95
      Width = 289
      Height = 24
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Text = 'sEdit2'
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
    object btnTambah: TsButton
      Left = 317
      Top = 265
      Width = 75
      Height = 25
      Caption = 'Tambah'
      TabOrder = 5
      SkinData.SkinSection = 'BUTTON'
    end
    object btnPrev: TsButton
      Left = 248
      Top = 24
      Width = 75
      Height = 25
      Caption = '<'
      TabOrder = 6
      SkinData.SkinSection = 'BUTTON'
    end
    object btnNext: TsButton
      Left = 328
      Top = 24
      Width = 75
      Height = 25
      Caption = '>'
      TabOrder = 7
      SkinData.SkinSection = 'BUTTON'
    end
    object btnKeluar: TsButton
      Left = 704
      Top = 304
      Width = 75
      Height = 25
      Caption = 'btnKeluar'
      TabOrder = 8
      SkinData.SkinSection = 'BUTTON'
    end
    object ListView1: TListView
      Left = 408
      Top = 56
      Width = 377
      Height = 201
      Columns = <
        item
          Caption = 'No.'
        end
        item
          Caption = 'Item'
          Width = 200
        end
        item
          Caption = 'Harga Total'
          Width = 100
        end>
      GridLines = True
      RowSelect = True
      TabOrder = 9
      ViewStyle = vsReport
    end
    object btnSimpan: TsButton
      Left = 624
      Top = 304
      Width = 75
      Height = 25
      Caption = 'btnSimpan'
      TabOrder = 10
      SkinData.SkinSection = 'BUTTON'
    end
    object btnBatal: TsButton
      Left = 544
      Top = 304
      Width = 75
      Height = 25
      Caption = 'btnBatal'
      TabOrder = 11
      SkinData.SkinSection = 'BUTTON'
    end
  end
end
