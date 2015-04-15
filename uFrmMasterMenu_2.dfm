object FrmMasterMenu_2: TFrmMasterMenu_2
  Left = 513
  Top = 123
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Master Menu NON Barcode'
  ClientHeight = 562
  ClientWidth = 582
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 528
    Width = 294
    Height = 13
    Caption = '* Menu dengan warna merah = mempunyai bahan pembentuk;'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object grid: TNextGrid
    Left = 0
    Top = 0
    Width = 582
    Height = 521
    Align = alTop
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    InputSize = 20
    Options = [goGrid, goHeader, goIndicator, goInput, goSelectFullRow]
    RowSize = 20
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 0
    TabStop = True
    WantReturns = True
    WantTabs = True
    OnAfterEdit = gridAfterEdit
    OnBeforeEdit = gridBeforeEdit
    OnInputAccept = gridInputAccept
    OnInputAdded = gridInputAdded
    OnCellFormating = gridCellFormating
    object NxNumberColumn1: TNxNumberColumn
      DefaultValue = '0'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Header.Caption = 'id'
      ParentFont = False
      Position = 0
      SortType = stNumeric
      Visible = False
      Increment = 1.000000000000000000
      Precision = 0
    end
    object NxIncrementColumn1: TNxIncrementColumn
      Alignment = taCenter
      DefaultWidth = 50
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Header.Caption = 'No.'
      ParentFont = False
      Position = 1
      SortType = stAlphabetic
      Width = 50
    end
    object jenismenu: TNxComboBoxColumn
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Header.Caption = 'Jenis Menu'
      Options = [coCanClick, coCanInput, coEditing, coPublicUsing, coShowTextFitHint]
      ParentFont = False
      Position = 2
      SortType = stAlphabetic
      Style = cbsDropDownList
    end
    object subjenismenu: TNxComboBoxColumn
      DefaultWidth = 100
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Header.Caption = 'Sub Jenis Menu'
      Options = [coCanClick, coCanInput, coEditing, coPublicUsing, coShowTextFitHint]
      ParentFont = False
      Position = 3
      SortType = stAlphabetic
      Width = 100
      Style = cbsDropDownList
    end
    object namaitems: TNxTextColumn
      DefaultWidth = 150
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Header.Caption = 'Nama Items'
      Options = [coCanClick, coCanInput, coEditing, coPublicUsing, coShowTextFitHint]
      ParentFont = False
      Position = 4
      SortType = stAlphabetic
      Width = 150
    end
    object satuan: TNxComboBoxColumn
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Header.Caption = 'Satuan'
      Options = [coCanClick, coCanInput, coEditing, coPublicUsing, coShowTextFitHint]
      ParentFont = False
      Position = 5
      SortType = stAlphabetic
      Style = cbsDropDownList
    end
    object harga: TNxNumberColumn
      Alignment = taLeftJustify
      DefaultValue = '0'
      DefaultWidth = 100
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Header.Caption = 'Harga Jual'
      Options = [coCanClick, coCanInput, coEditing, coPublicUsing]
      ParentFont = False
      Position = 6
      SortType = stNumeric
      Width = 100
      FormatMask = '#,##0'
      TextBefore = 'Rp.'
      Increment = 1.000000000000000000
      Precision = 0
    end
    object isUsedBahanPembentuk: TNxNumberColumn
      DefaultValue = '0'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Position = 7
      SortType = stNumeric
      Visible = False
      Increment = 1.000000000000000000
      Precision = 0
    end
  end
  object btnKeluar: TsButton
    Left = 496
    Top = 528
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Caption = 'Keluar'
    TabOrder = 1
    OnClick = btnKeluarClick
    SkinData.SkinSection = 'BUTTON'
  end
  object MainMenu1: TMainMenu
    Left = 392
    Top = 144
    object delete: TMenuItem
      Caption = 'delete'
      ShortCut = 46
      Visible = False
      OnClick = deleteClick
    end
    object SubJenisMenu1: TMenuItem
      Caption = 'Edit Sub Jenis Menu'
      OnClick = SubJenisMenu1Click
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 160
    Top = 184
    object Editbahanpembentuk1: TMenuItem
      Caption = 'Edit bahan pembentuk'
      OnClick = Editbahanpembentuk1Click
    end
  end
end
