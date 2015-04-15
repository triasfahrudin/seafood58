object FrmMasterMenu_1: TFrmMasterMenu_1
  Left = 368
  Top = 180
  AutoScroll = False
  Caption = 'Master Menu'
  ClientHeight = 463
  ClientWidth = 576
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
  object NxHeaderPanel1: TNxHeaderPanel
    Left = 0
    Top = 0
    Width = 577
    Height = 417
    HeaderFont.Charset = DEFAULT_CHARSET
    HeaderFont.Color = clWindowText
    HeaderFont.Height = -11
    HeaderFont.Name = 'MS Sans Serif'
    HeaderFont.Style = []
    PanelStyle = ptGradient
    TabOrder = 0
    FullWidth = 577
    object sPageControl1: TsPageControl
      Left = 9
      Top = 32
      Width = 558
      Height = 379
      ActivePage = sTabSheet1
      Align = alClient
      MultiLine = True
      TabOrder = 0
      OnChange = sPageControl1Change
      SkinData.SkinSection = 'PAGECONTROL'
      object sTabSheet1: TsTabSheet
        Cursor = crHandPoint
        Caption = 'Makanan'
        SkinData.CustomColor = False
        SkinData.CustomFont = False
        object grid1: TNextGrid
          Left = 0
          Top = 0
          Width = 550
          Height = 351
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Options = [goGrid, goHeader, goIndicator, goInput, goSelectFullRow]
          ParentFont = False
          TabOrder = 0
          TabStop = True
          OnClick = grid1Click
          object NxTextColumn7: TNxNumberColumn
            Alignment = taLeftJustify
            DefaultValue = '0'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            Header.Caption = 'id menu'
            Options = [coCanClick, coCanInput, coCanSort, coPublicUsing, coShowTextFitHint]
            ParentFont = False
            Position = 0
            SortType = stNumeric
            Visible = False
            Increment = 1.000000000000000000
            Precision = 0
          end
          object NxIncrementColumn1: TNxIncrementColumn
            DefaultWidth = 50
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            Header.Caption = 'No.'
            Options = [coCanClick, coCanInput, coPublicUsing]
            ParentFont = False
            Position = 1
            SortType = stAlphabetic
            Width = 50
          end
          object colSubmenu: TNxComboBoxColumn
            DefaultWidth = 100
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            Header.Caption = 'Sub Menu'
            Options = [coCanClick, coCanInput, coEditing, coPublicUsing, coShowTextFitHint]
            ParentFont = False
            Position = 2
            SortType = stAlphabetic
            Width = 100
          end
          object NxTextColumn10: TNxNumberColumn
            Alignment = taLeftJustify
            DefaultValue = '0'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            Header.Caption = 'id_subjenis'
            Options = [coCanClick, coCanInput, coCanSort, coPublicUsing, coShowTextFitHint]
            ParentFont = False
            Position = 3
            SortType = stNumeric
            Visible = False
            Increment = 1.000000000000000000
            Precision = 0
          end
          object NxTextColumn12: TNxTextColumn
            DefaultWidth = 120
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            Header.Caption = 'Nama'
            Options = [coCanClick, coCanInput, coCanSort, coEditing, coPublicUsing, coShowTextFitHint]
            ParentFont = False
            Position = 4
            SortType = stAlphabetic
            Width = 120
          end
          object colSatuan: TNxComboBoxColumn
            DefaultWidth = 70
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
            Width = 70
          end
          object NxTextColumn11: TNxNumberColumn
            Alignment = taLeftJustify
            DefaultValue = '0'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            Header.Caption = 'id_satuan'
            Options = [coCanClick, coCanInput, coCanSort, coPublicUsing, coShowTextFitHint]
            ParentFont = False
            Position = 6
            SortType = stNumeric
            Visible = False
            Increment = 1.000000000000000000
            Precision = 0
          end
          object NxNumberColumn1: TNxNumberColumn
            DefaultValue = '0'
            DefaultWidth = 100
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            Header.Caption = 'Harga'
            Options = [coCanClick, coCanInput, coEditing, coPublicUsing]
            ParentFont = False
            Position = 7
            SortType = stNumeric
            Width = 100
            Increment = 1.000000000000000000
            Precision = 0
          end
        end
      end
      object sTabSheet2: TsTabSheet
        Tag = 1
        Caption = 'Minuman'
        SkinData.CustomColor = False
        SkinData.CustomFont = False
        object grid2: TNextGrid
          Left = 0
          Top = 0
          Width = 550
          Height = 351
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Options = [goGrid, goHeader, goIndicator, goInput, goSelectFullRow]
          ParentFont = False
          TabOrder = 0
          TabStop = True
          object NxIncrementColumn2: TNxIncrementColumn
            DefaultWidth = 50
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            Header.Caption = 'No.'
            ParentFont = False
            Position = 0
            SortType = stAlphabetic
            Width = 50
          end
          object NxTextColumn3: TNxTextColumn
            DefaultWidth = 200
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            Header.Caption = 'Nama'
            ParentFont = False
            Position = 1
            SortType = stAlphabetic
            Width = 200
          end
          object NxNumberColumn2: TNxNumberColumn
            DefaultValue = '0'
            DefaultWidth = 100
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            Header.Caption = 'Harga'
            ParentFont = False
            Position = 2
            SortType = stNumeric
            Width = 100
            Increment = 1.000000000000000000
            Precision = 0
          end
          object NxTextColumn8: TNxNumberColumn
            Alignment = taLeftJustify
            DefaultValue = '0'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            Header.Caption = 'id'
            Options = [coCanClick, coCanInput, coCanSort, coPublicUsing, coShowTextFitHint]
            ParentFont = False
            Position = 3
            SortType = stNumeric
            Visible = False
            Increment = 1.000000000000000000
            Precision = 0
          end
        end
      end
      object sTabSheet3: TsTabSheet
        Tag = 2
        Caption = 'Barcode'
        SkinData.CustomColor = False
        SkinData.CustomFont = False
        object grid3: TNextGrid
          Left = 0
          Top = 0
          Width = 550
          Height = 351
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Options = [goGrid, goHeader, goInput, goSelectFullRow]
          ParentFont = False
          TabOrder = 0
          TabStop = True
          object NxIncrementColumn3: TNxIncrementColumn
            DefaultWidth = 50
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            Header.Caption = 'No.'
            ParentFont = False
            Position = 0
            SortType = stAlphabetic
            Width = 50
          end
          object NxTextColumn4: TNxTextColumn
            DefaultWidth = 150
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            Header.Caption = 'Nama'
            ParentFont = False
            Position = 1
            SortType = stAlphabetic
            Width = 150
          end
          object NxTextColumn5: TNxTextColumn
            DefaultWidth = 200
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            Header.Caption = 'Barcode'
            ParentFont = False
            Position = 2
            SortType = stAlphabetic
            Width = 200
          end
          object NxTextColumn6: TNxTextColumn
            DefaultWidth = 100
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            Header.Caption = 'Harga'
            ParentFont = False
            Position = 3
            SortType = stAlphabetic
            Width = 100
          end
          object NxNumberColumn3: TNxNumberColumn
            DefaultValue = '0'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            Header.Caption = 'id'
            ParentFont = False
            Position = 4
            SortType = stNumeric
            Visible = False
            Increment = 1.000000000000000000
            Precision = 0
          end
        end
      end
    end
  end
  object btnKeluar: TsButton
    Left = 456
    Top = 424
    Width = 75
    Height = 25
    Caption = 'Keluar'
    TabOrder = 1
    OnClick = btnKeluarClick
    SkinData.SkinSection = 'BUTTON'
  end
end
