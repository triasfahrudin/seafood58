object FrmTutupBukuHarian: TFrmTutupBukuHarian
  Left = 400
  Top = 195
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Tutup Buku Harian'
  ClientHeight = 330
  ClientWidth = 367
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
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 16
    Width = 131
    Height = 16
    Caption = 'Tanggal tutup buku :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 48
    Width = 169
    Height = 16
    Caption = 'Total pendapatan hari ini :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 8
    Top = 72
    Width = 345
    Height = 9
    Shape = bsBottomLine
  end
  object Label3: TLabel
    Left = 96
    Top = 96
    Width = 118
    Height = 16
    Caption = 'Dikirimkan ke Bos:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 120
    Width = 194
    Height = 32
    Caption = 'Digunakan sebagai tambahan '#13#10'Modal besok:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbltotalpendapatan: TLabel
    Left = 184
    Top = 48
    Width = 28
    Height = 16
    Caption = 'Rp.0'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblmodalbesok: TLabel
    Left = 224
    Top = 128
    Width = 28
    Height = 16
    Caption = 'Rp.0'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 8
    Top = 160
    Width = 82
    Height = 16
    Caption = 'Keterangan :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbltgl: TLabel
    Left = 184
    Top = 16
    Width = 56
    Height = 16
    Caption = '########'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 248
    Width = 206
    Height = 65
    Caption = 
      '1. tutup buku harian hanya '#13#10'    dapat dilakukan sekali sehari.'#13 +
      #10#13#10'2. transaksi pendapatan pada hari yg sama '#13#10'    setelah tutup' +
      ' buku, akan ditolak'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Edit1: TEdit
    Left = 224
    Top = 96
    Width = 121
    Height = 21
    TabOrder = 0
    OnExit = Edit1Exit
  end
  object btnTutupBuku: TButton
    Left = 240
    Top = 248
    Width = 115
    Height = 73
    Cursor = crHandPoint
    Caption = 'Tutup Buku'
    TabOrder = 1
    OnClick = btnTutupBukuClick
  end
  object Memo1: TMemo
    Left = 8
    Top = 176
    Width = 345
    Height = 65
    TabOrder = 2
  end
end
