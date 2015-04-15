object FrmModalAwal: TFrmModalAwal
  Left = 591
  Top = 202
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Modal'
  ClientHeight = 370
  ClientWidth = 487
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
  object sPanel1: TsPanel
    Left = 0
    Top = 0
    Width = 487
    Height = 56
    Align = alTop
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object sLabel1: TsLabel
      Left = 8
      Top = 8
      Width = 27
      Height = 14
      Caption = 'Bulan'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
    end
    object sLabel2: TsLabel
      Left = 120
      Top = 8
      Width = 30
      Height = 14
      Caption = 'Tahun'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
    end
    object cmbBulan: TsComboBox
      Left = 8
      Top = 24
      Width = 97
      Height = 22
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
      Style = csDropDownList
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ItemHeight = 14
      ItemIndex = -1
      ParentFont = False
      TabOrder = 0
    end
    object eTahun: TsEdit
      Left = 120
      Top = 24
      Width = 121
      Height = 22
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = 'eTahun'
      OnKeyPress = eTahunKeyPress
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
    object btnTampilkan: TsButton
      Left = 248
      Top = 22
      Width = 73
      Height = 25
      Caption = 'Tampilkan'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnTampilkanClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object grid: TNextGrid
    Left = 0
    Top = 56
    Width = 487
    Height = 281
    Align = alTop
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    InputSize = 20
    Options = [goDisableColumnMoving, goFooter, goGrid, goHeader, goInput, goSelectFullRow]
    ParentFont = False
    TabOrder = 1
    TabStop = True
    OnAfterEdit = gridAfterEdit
    OnBeforeEdit = gridBeforeEdit
    OnInputAccept = gridInputAccept
    OnInputAdded = gridInputAdded
    object NxIncrementColumn1: TNxIncrementColumn
      Color = clBtnFace
      DefaultWidth = 50
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Header.Caption = 'No.'
      Options = [coCanClick, coPublicUsing]
      ParentFont = False
      Position = 0
      SortType = stAlphabetic
      Width = 50
    end
    object tgl: TNxDateColumn
      DefaultValue = '10/21/2003'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Header.Caption = 'Date'
      Header.Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000006048405060403090504030D0503830FF503830F05038
        30C0503830300000000000000000000000000000000000000000000000000000
        00000000000070585070806050F0C08870FFE0A080FFF0A880FFD09870FFB078
        50FF705030FF5038307000000000000000000000000000000000000000000000
        000080686040907860F0E0B090FFFFC8B0FFFFC8B0FFFFC8B0FFFFC0A0FFF0A8
        80FFD08860FF705030FF50383030000000000000000000000000000000000000
        0000807060A0D0C0B0FFFFE0D0FFFFE0D0FFFFE0D0FFFFD8C0FFFFD0B0FFFFC8
        B0FFF0A880FFB07850FF503830A0000000000000000000000000000000000000
        0000908070D0F0E8E0FFFFF0F0FFFFF0E0FF504840FF504840FF807060FFC098
        90FFFFC0A0FFE09870FF503830E0000000000000000000000000000000000000
        0000A08880FFFFFFFFFFFFF8FFFFFFF8F0FF606060FFC0B0A0FFFFE0D0FFFFD8
        C0FFFFC8B0FFF0B090FF503830FF000000000000000000000000000000000000
        0000A09080D0FFFFFFFFFFFFFFFFFFFFFFFF908080FFD0C8C0FFFFF0E0FFFFE8
        E0FFFFD8C0FFE0B090FF504030F0000000000000000000000000000000000000
        0000A0909090F0F0F0FFFFFFFFFFFFFFFFFFA098A0FFF0E8E0FFFFF8F0FFFFF0
        E0FFFFE0D0FFC09880FF604030A0000000000000000000000000000000000000
        0000A0909040C0C0B0E0FFF8F0FFFFFFFFFFC0B8C0FFFFF8FFFFFFF8F0FFFFF0
        F0FFE0C0B0FF806860F060484040000000000000000000000000000000000000
        000000000000A0909060C0B8B0E0F0E8E0FFF0F0F0FFFFFFFFFFF0F0F0FFD0C0
        C0FF908070F07058506000000000000000000000000000000000000000000000
        00000000000000000000A0909040A0909090A09080D0A08880FF908070D08070
        60A0806860500000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      ParentFont = False
      Position = 1
      SlideBounds.Left = 96
      SlideBounds.Top = 22
      SortType = stDate
      FormatMask = 'dd-MM-yyyy'
      NoneCaption = 'None'
      TodayCaption = 'Today'
    end
    object besar: TNxNumberColumn
      Alignment = taLeftJustify
      DefaultValue = '0'
      DefaultWidth = 150
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Footer.TextBefore = 'Rp.'
      Footer.FormulaKind = fkSum
      Footer.FormatMask = '#,##0'
      Footer.FormatMaskKind = mkFloat
      Header.Caption = 'Besar'
      Options = [coCanClick, coCanInput, coCanSort, coEditing, coPublicUsing]
      ParentFont = False
      Position = 2
      SortType = stNumeric
      Width = 150
      FormatMask = '#,##0'
      TextBefore = 'Rp.'
      Increment = 1.000000000000000000
      Precision = 0
    end
    object NxNumberColumn2: TNxNumberColumn
      DefaultValue = '0'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Header.Caption = 'id'
      ParentFont = False
      Position = 3
      SortType = stNumeric
      Visible = False
      Increment = 1.000000000000000000
      Precision = 0
    end
    object keterangan: TNxMemoColumn
      DefaultWidth = 200
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Header.Caption = 'Keterangan'
      Options = [coCanClick, coCanInput, coCanSort, coEditing, coPublicUsing]
      ParentFont = False
      Position = 4
      SortType = stAlphabetic
      Width = 200
    end
    object daritutupbuku: TNxCheckBoxColumn
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Header.Caption = 'daritutupbuku'
      ParentFont = False
      Position = 5
      SortType = stBoolean
      Visible = False
    end
  end
  object btnClose: TsButton
    Left = 400
    Top = 342
    Width = 73
    Height = 25
    Cursor = crHandPoint
    Caption = 'Keluar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnCloseClick
    SkinData.SkinSection = 'BUTTON'
  end
  object MainMenu1: TMainMenu
    Left = 192
    Top = 128
    object Delete1: TMenuItem
      Caption = 'Delete'
      ShortCut = 46
      Visible = False
      OnClick = Delete1Click
    end
  end
end
