object FrmPembelianKredit: TFrmPembelianKredit
  Left = 294
  Top = 214
  Width = 389
  Height = 252
  Caption = 'Form Pembelian Kredit'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblNoKartu: TLabel
    Left = 16
    Top = 128
    Width = 71
    Height = 20
    Caption = 'No.Kartu'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblNoTrace: TLabel
    Left = 16
    Top = 160
    Width = 73
    Height = 20
    Caption = 'No.Trace'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object rgBankName: TRadioGroup
    Left = 16
    Top = 8
    Width = 353
    Height = 105
    Caption = 'Nama Bank'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ItemIndex = 0
    Items.Strings = (
      'MANDIRI'
      'BCA'
      'BANK LAIN')
    ParentFont = False
    TabOrder = 0
  end
  object edtNoKartu: TEdit
    Left = 112
    Top = 128
    Width = 257
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object edtNoTrace: TEdit
    Left = 112
    Top = 160
    Width = 153
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object btnPrint: TButton
    Left = 296
    Top = 192
    Width = 81
    Height = 25
    Caption = 'Print'
    ModalResult = 1
    TabOrder = 3
    OnClick = btnPrintClick
  end
  object btnBatal: TButton
    Left = 208
    Top = 192
    Width = 75
    Height = 25
    Caption = 'Batal'
    ModalResult = 2
    TabOrder = 4
    OnClick = btnBatalClick
  end
  object edtBankLain: TEdit
    Left = 160
    Top = 80
    Width = 193
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
end
