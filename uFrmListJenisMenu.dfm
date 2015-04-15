object FrmListJenisMenu: TFrmListJenisMenu
  Left = 422
  Top = 223
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Jenis Menu'
  ClientHeight = 199
  ClientWidth = 374
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 20
  object btnKeluar: TsButton
    Left = 264
    Top = 168
    Width = 91
    Height = 25
    Caption = 'Keluar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btnKeluarClick
    SkinData.SkinSection = 'BUTTON'
  end
  object grid: TNextGrid
    Left = 0
    Top = 0
    Width = 374
    Height = 161
    Align = alTop
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    HeaderStyle = hsFlatBorders
    Options = [goGrid, goHeader, goIndicator]
    RowSize = 20
    ParentFont = False
    PopupMenu = pm1
    TabOrder = 1
    TabStop = True
    OnAfterEdit = gridAfterEdit
    OnCellFormating = gridCellFormating
    object NxTextColumn1: TNxTextColumn
      DefaultWidth = 50
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Header.Caption = 'id'
      ParentFont = False
      Position = 0
      SortType = stAlphabetic
      Visible = False
      Width = 50
    end
    object NxIncrementColumn1: TNxIncrementColumn
      DefaultWidth = 50
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Header.Caption = 'No.'
      Options = [coCanClick, coCanInput, coPublicUsing]
      ParentFont = False
      Position = 1
      SortType = stAlphabetic
      Width = 50
    end
    object NxTextColumn2: TNxTextColumn
      DefaultWidth = 150
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Header.Caption = 'Jenis Menu'
      Options = [coCanClick, coCanInput, coPublicUsing, coShowTextFitHint]
      ParentFont = False
      Position = 2
      SortType = stAlphabetic
      Width = 150
    end
    object NxColorColumn1: TNxColorColumn
      DefaultWidth = 150
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Header.Caption = 'Warna Grid'
      Options = [coCanClick, coCanInput, coEditing, coPublicUsing, coShowTextFitHint]
      ParentFont = False
      Position = 3
      SortType = stAlphabetic
      Width = 150
    end
  end
  object pm1: TPopupMenu
    Left = 120
    Top = 88
    object Add1: TMenuItem
      Caption = 'Tambah'
      Enabled = False
      OnClick = Add1Click
    end
    object Delete1: TMenuItem
      Caption = 'Hapus'
      Enabled = False
      OnClick = Delete1Click
    end
  end
end
