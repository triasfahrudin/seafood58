object FrmPrivilege: TFrmPrivilege
  Left = 319
  Top = 197
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Privilege'
  ClientHeight = 342
  ClientWidth = 402
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ct: TRzCheckTree
    Left = 0
    Top = 0
    Width = 402
    Height = 305
    Align = alTop
    Indent = 19
    SelectionPen.Color = clBtnShadow
    StateImages = ct.CheckImages
    TabOrder = 0
  end
  object btnKeluar: TsButton
    Left = 320
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Update'
    TabOrder = 1
    OnClick = btnKeluarClick
    SkinData.SkinSection = 'BUTTON'
  end
  object mySQLQuery1: TmySQLQuery
    Database = DM.mySQLDatabase1
    Left = 224
    Top = 128
  end
end
