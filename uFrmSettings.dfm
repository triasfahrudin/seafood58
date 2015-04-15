object FrmSettings: TFrmSettings
  Left = 693
  Top = 206
  AutoScroll = False
  Caption = 'Form Settings'
  ClientHeight = 385
  ClientWidth = 487
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sPageControl1: TsPageControl
    Left = 0
    Top = 0
    Width = 487
    Height = 345
    ActivePage = sTabSheet3
    Align = alTop
    TabOrder = 0
    SkinData.SkinSection = 'PAGECONTROL'
    object sTabSheet1: TsTabSheet
      Caption = 'Laporan'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object sLabel4: TsLabel
        Left = 16
        Top = 16
        Width = 58
        Height = 13
        Caption = 'Printer Struk'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object ComboBox1: TsComboBox
        Left = 88
        Top = 13
        Width = 145
        Height = 21
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
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 0
        ItemIndex = -1
        ParentFont = False
        TabOrder = 0
        Text = 'ComboBox1'
      end
      object btnRefreshPrinter: TsButton
        Left = 240
        Top = 10
        Width = 105
        Height = 25
        Caption = 'Reload Printer List'
        TabOrder = 1
        OnClick = btnRefreshPrinterClick
        SkinData.SkinSection = 'BUTTON'
      end
    end
    object sTabSheet2: TsTabSheet
      Caption = 'Lain-Lain'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object sLabel5: TsLabel
        Left = 407
        Top = 132
        Width = 25
        Height = 13
        Caption = 'menit'
        Enabled = False
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object sGroupBox1: TsGroupBox
        Left = 0
        Top = 0
        Width = 479
        Height = 121
        Caption = 'Setting Tombol'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        SkinData.SkinSection = 'GROUPBOX'
        object sLabel1: TsLabel
          Left = 8
          Top = 32
          Width = 21
          Height = 13
          Caption = 'Font'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object sLabel2: TsLabel
          Left = 8
          Top = 72
          Width = 20
          Height = 13
          Caption = 'Size'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object sLabel3: TsLabel
          Left = 8
          Top = 104
          Width = 204
          Height = 14
          Caption = '* memerlukan logout untuk melihat hasilnya'
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          UseSkinColor = False
        end
        object sFontComboBox1: TsFontComboBox
          Left = 64
          Top = 32
          Width = 153
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
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ItemHeight = 16
          ParentFont = False
          TabOrder = 0
          OnChange = sFontComboBox1Change
        end
        object eFontSize: TsEdit
          Left = 64
          Top = 72
          Width = 49
          Height = 22
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnChange = eFontSizeChange
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
      end
      object NxHeaderPanel1: TNxHeaderPanel
        Left = 0
        Top = 128
        Width = 193
        Height = 185
        Caption = 'Skin'
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'MS Sans Serif'
        HeaderFont.Style = []
        InnerMargins.Left = 1
        InnerMargins.Top = 1
        InnerMargins.Bottom = 1
        InnerMargins.Right = 1
        Options = [hoColorSchemeFont, hoCollapseButton]
        TabOrder = 1
        FullWidth = 193
        object lstboxSkin: TsListBox
          Left = 1
          Top = 28
          Width = 189
          Height = 154
          Cursor = crHandPoint
          AutoCompleteDelay = 500
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'MS Sans Serif'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
          ItemHeight = 14
          Align = alClient
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnDblClick = lstboxSkinDblClick
        end
      end
      object sCheckBox1: TsCheckBox
        Left = 200
        Top = 128
        Width = 145
        Height = 19
        Caption = 'Logout ketika idle selama'
        Enabled = False
        TabOrder = 2
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object sComboBox1: TsComboBox
        Left = 344
        Top = 128
        Width = 57
        Height = 21
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
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ItemIndex = -1
        ParentFont = False
        TabOrder = 3
        Items.Strings = (
          '10'
          '15'
          '20'
          '25'
          '30')
      end
    end
    object sTabSheet3: TsTabSheet
      Caption = 'Ijin Perubahan'
      Enabled = False
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object cbOnChangeHargaSatuan: TsCheckBox
        Left = 8
        Top = 16
        Width = 183
        Height = 19
        Caption = 'Harga satuan pada tampilan awal'
        TabOrder = 0
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
    end
  end
  object btnOK: TsButton
    Left = 240
    Top = 354
    Width = 75
    Height = 25
    Caption = 'OK'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ModalResult = 1
    ParentFont = False
    TabOrder = 1
    OnClick = btnOKClick
    SkinData.SkinSection = 'BUTTON'
  end
  object btnCancel: TsButton
    Left = 320
    Top = 354
    Width = 75
    Height = 25
    Caption = 'Cancel'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ModalResult = 2
    ParentFont = False
    TabOrder = 2
    OnClick = btnCancelClick
    SkinData.SkinSection = 'BUTTON'
  end
  object btnApply: TsButton
    Left = 400
    Top = 354
    Width = 75
    Height = 25
    Caption = 'Apply'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnApplyClick
    SkinData.SkinSection = 'BUTTON'
  end
end
