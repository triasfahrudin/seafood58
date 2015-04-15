object FrmReportParam: TFrmReportParam
  Left = 599
  Top = 360
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Parameter Laporan'
  ClientHeight = 113
  ClientWidth = 275
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 24
    Width = 39
    Height = 13
    Caption = 'Tanggal'
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 27
    Height = 13
    Caption = 'Bulan'
  end
  object Label3: TLabel
    Left = 8
    Top = 85
    Width = 31
    Height = 13
    Caption = 'Tahun'
  end
  object cal: TESBCalEdit
    Left = 56
    Top = 24
    Width = 129
    FormatType = edfCustom
    BoundLower = 40385.000000000000000000
    BoundUpper = 40385.000000000000000000
    BoundLowerYear = 2010
    BoundUpperYear = 2010
    YearCutoff = 1920
    YearDigitType = edyCutOff
    Format = 'dd-MM-yyyy'
    TabOrder = 0
  end
  object btnOK: TsButton
    Left = 200
    Top = 24
    Width = 73
    Height = 49
    Caption = 'OK'
    TabOrder = 1
    OnClick = btnOKClick
    SkinData.SkinSection = 'BUTTON'
  end
  object cmbbulan: TComboBox
    Left = 56
    Top = 56
    Width = 129
    Height = 21
    ItemHeight = 13
    TabOrder = 2
    Text = 'cmbbulan'
  end
  object cbLangsungCetak: TCheckBox
    Left = 8
    Top = 0
    Width = 97
    Height = 17
    Caption = 'Langsung Cetak'
    TabOrder = 3
    OnClick = cbLangsungCetakClick
  end
  object eTahun: TEdit
    Left = 56
    Top = 80
    Width = 129
    Height = 21
    TabOrder = 4
    Text = 'eTahun'
    OnKeyPress = eTahunKeyPress
  end
  object ComboBox1: TComboBox
    Left = 112
    Top = 0
    Width = 153
    Height = 21
    Style = csDropDownList
    Enabled = False
    ItemHeight = 13
    TabOrder = 5
  end
  object btnKeluar: TsButton
    Left = 200
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Keluar'
    TabOrder = 6
    OnClick = btnKeluarClick
    SkinData.SkinSection = 'BUTTON'
  end
  object mySQLQuery_stok_helper: TmySQLQuery
    Database = DM.mySQLDatabase1
    Left = 128
    Top = 40
  end
end
