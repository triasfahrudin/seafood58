object FrmPencarian: TFrmPencarian
  Left = 477
  Top = 196
  AutoScroll = False
  Caption = 'Form Pencarian'
  ClientHeight = 258
  ClientWidth = 461
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object lbl2: TNxLabel
    Left = 304
    Top = 16
    Width = 52
    Height = 13
    Caption = 'BARCODE'
    HorizontalPosition = hpLeft
    InnerHorizontal = True
    InnerVertical = False
    InnerMargins.Horizontal = 0
    InnerMargins.Vertical = 2
    VerticalPosition = vpTop
  end
  object nxpnl1: TNxPanel
    Left = 0
    Top = 0
    Width = 461
    Height = 73
    Align = alTop
    UseDockManager = False
    InnerMargins.Left = 0
    InnerMargins.Top = 0
    InnerMargins.Bottom = 0
    InnerMargins.Right = 0
    ParentBackground = False
    TabOrder = 0
    object lbl3: TNxLabel
      Left = 16
      Top = 16
      Width = 61
      Height = 24
      Caption = 'NAMA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      HorizontalPosition = hpLeft
      InnerHorizontal = True
      InnerVertical = False
      InnerMargins.Horizontal = 0
      InnerMargins.Vertical = 2
      VerticalPosition = vpTop
    end
    object sLabel1: TsLabel
      Left = 16
      Top = 52
      Width = 250
      Height = 13
      Caption = '* tekan Reload Stok untuk meng-update stok barang'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object btnReloadStok: TsButton
      Left = 376
      Top = 8
      Width = 75
      Height = 41
      Caption = 'Reload Stok'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Visible = False
      OnClick = btnReloadStokClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object edNama: TNxEdit
    Left = 88
    Top = 12
    Width = 273
    Height = 32
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnChange = edNamaChange
    OnKeyPress = edNamaKeyPress
  end
  object grid: TNextGrid
    Left = 0
    Top = 73
    Width = 461
    Height = 185
    Align = alClient
    Options = [goGrid, goHeader, goIndicator, goSelectFullRow]
    TabOrder = 2
    TabStop = True
    OnDblClick = gridDblClick
    OnKeyPress = gridKeyPress
    object NxTextColumn1: TNxTextColumn
      DefaultWidth = 350
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Header.Caption = 'NAMA'
      Position = 0
      SortType = stAlphabetic
      Width = 350
    end
    object NxTextColumn2: TNxTextColumn
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Header.Caption = 'Stok'
      Position = 1
      SortType = stAlphabetic
      Visible = False
    end
    object NxTextColumn3: TNxTextColumn
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Header.Caption = 'SATUAN'
      Position = 2
      SortType = stAlphabetic
      Visible = False
    end
  end
end
