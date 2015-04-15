object FrmBahanPembentuk: TFrmBahanPembentuk
  Left = 419
  Top = 200
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Bahan Pembentuk'
  ClientHeight = 384
  ClientWidth = 371
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sPanel1: TsPanel
    Left = 0
    Top = 0
    Width = 371
    Height = 65
    Align = alTop
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 32
      Height = 13
      Caption = 'Label1'
      Transparent = True
    end
  end
  object grid: TNextGrid
    Left = 0
    Top = 65
    Width = 371
    Height = 279
    Align = alClient
    Options = [goGrid, goHeader, goInput, goSelectFullRow]
    TabOrder = 1
    TabStop = True
    OnAfterEdit = gridAfterEdit
    OnBeforeEdit = gridBeforeEdit
    OnInputAccept = gridInputAccept
    OnInputAdded = gridInputAdded
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
    object NxNumberColumn1: TNxNumberColumn
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
    object nama: TNxComboBoxColumn
      DefaultWidth = 150
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Header.Caption = 'Nama Item'
      Position = 2
      SortType = stAlphabetic
      Width = 150
    end
    object banyak: TNxNumberColumn
      DefaultValue = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Header.Caption = 'Banyak'
      Position = 3
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
      Position = 4
      SortType = stAlphabetic
    end
  end
  object sPanel2: TsPanel
    Left = 0
    Top = 344
    Width = 371
    Height = 40
    Align = alBottom
    TabOrder = 2
    SkinData.SkinSection = 'PANEL'
    object btnkeluar: TsButton
      Left = 280
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Keluar'
      TabOrder = 0
      OnClick = btnkeluarClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object MainMenu1: TMainMenu
    Left = 112
    Top = 184
    object Delete1: TMenuItem
      Caption = 'Delete'
      ShortCut = 46
      Visible = False
      OnClick = Delete1Click
    end
  end
end
