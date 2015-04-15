object FrmUangKembalian: TFrmUangKembalian
  Left = 293
  Top = 207
  Width = 726
  Height = 265
  BorderIcons = [biSystemMenu]
  Caption = 'Kembalian'
  Color = clCream
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 24
  object lblKembalian: TsLabelFX
    Left = 0
    Top = 75
    Width = 718
    Height = 119
    Align = alTop
    Alignment = taCenter
    Caption = 'Rp.#######'
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -96
    Font.Name = 'Arial'
    Font.Style = [fsBold]
  end
  object sLabel1: TsLabel
    Left = 0
    Top = 0
    Width = 718
    Height = 75
    Align = alTop
    Alignment = taCenter
    Caption = 'KEMBALI :'
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -64
    Font.Name = 'Arial'
    Font.Style = [fsBold]
  end
  object btnClose: TsButton
    Left = 480
    Top = 184
    Width = 163
    Height = 41
    Caption = 'Close'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 0
    SkinData.SkinSection = 'BUTTON'
  end
end
