object FrmSatuanKonversi: TFrmSatuanKonversi
  Left = 439
  Top = 258
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Konversi Satuan'
  ClientHeight = 308
  ClientWidth = 348
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object sLabel1: TsLabel
    Left = 8
    Top = 231
    Width = 126
    Height = 65
    Caption = 
      'contoh:'#13#10'1 kg = 1000 g,'#13#10'maka satuan dasar = g'#13#10'         satuan ' +
      'konversi = kg'#13#10'         pengali = 1000'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object grid: TNextGrid
    Left = 0
    Top = 0
    Width = 348
    Height = 225
    Align = alTop
    Options = [goGrid, goHeader, goInput, goSelectFullRow]
    TabOrder = 0
    TabStop = True
    OnAfterEdit = gridAfterEdit
    OnBeforeEdit = gridBeforeEdit
    OnInputAccept = gridInputAccept
    OnInputAdded = gridInputAdded
    object NxTextColumn1: TNxTextColumn
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Header.Caption = 'id'
      Position = 0
      SortType = stAlphabetic
      Visible = False
    end
    object NxIncrementColumn1: TNxIncrementColumn
      DefaultWidth = 50
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Header.Caption = 'No.'
      Options = [coCanClick, coCanInput, coPublicUsing]
      Position = 1
      SortType = stAlphabetic
      Width = 50
    end
    object satuankonversi: TNxComboBoxColumn
      DefaultWidth = 100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Header.Caption = 'Satuan Konversi'
      Options = [coCanClick, coCanInput, coPublicUsing, coShowTextFitHint]
      Position = 2
      SortType = stAlphabetic
      Width = 100
      Style = cbsDropDownList
    end
    object satuandasar: TNxComboBoxColumn
      DefaultWidth = 100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Header.Caption = 'Satuan Dasar'
      Options = [coCanClick, coCanInput, coPublicUsing, coShowTextFitHint]
      Position = 3
      SortType = stAlphabetic
      Width = 100
      Style = cbsDropDownList
    end
    object pengali: TNxNumberColumn
      Alignment = taLeftJustify
      DefaultValue = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Header.Caption = 'Pengali'
      Options = [coCanClick, coCanInput, coEditing, coPublicUsing, coShowTextFitHint]
      Position = 4
      SortType = stNumeric
      FormatMask = '#,##0'
      Increment = 1.000000000000000000
      Precision = 0
    end
  end
  object btnKeluar: TsButton
    Left = 256
    Top = 232
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Caption = 'Keluar'
    TabOrder = 1
    OnClick = btnKeluarClick
    SkinData.SkinSection = 'BUTTON'
  end
  object MainMenu1: TMainMenu
    Left = 152
    Top = 152
    object delete1: TMenuItem
      Caption = 'delete'
      ShortCut = 46
      Visible = False
      OnClick = delete1Click
    end
  end
end
