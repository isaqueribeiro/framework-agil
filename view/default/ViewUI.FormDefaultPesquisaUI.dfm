inherited FormDefaultPesquisaUI: TFormDefaultPesquisaUI
  Caption = 'FormDefaultPesquisaUI'
  FormStyle = fsMDIChild
  Visible = True
  ExplicitWidth = 697
  ExplicitHeight = 425
  PixelsPerInch = 96
  TextHeight = 13
  object bvlHeader: TBevel
    Left = 0
    Top = 49
    Width = 681
    Height = 4
    Align = alTop
    Shape = bsSpacer
  end
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 681
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 4
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object imgHeader: TImage
      Left = 636
      Top = 4
      Width = 41
      Height = 41
      Align = alRight
      Center = True
      Picture.Data = {
        0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000020
        000000200806000000737A7AF40000000467414D410000B18F0BFC6105000000
        097048597300000EC400000EC401952B0E1B000002F8494441545847C596CF4B
        545114C7D57E6142D4AABFA28D5841518BB04D314CAB7E6C346AD5225CB43328
        8AA09F2851062D2CB2A008DA29525010E8600DA6199335345229244923893123
        33CDE97B6E731FE7FE98793A43D385CFBBF77EDF39E77BEFBBE3F3D511D17FC5
        2BD612AFB81C1ADBFAB780B3E01948815930059E830BA0D99767E315CB81C2DB
        C00B500014C230D8E9ABA3F18A3E50A81E9C0379E0332BC56F701934F8EA3A82
        0F24B3F91D60146FBD18A7DE589AC667A93093219AF84E85BE9179DA777594D6
        B79BB1E0115865D73626A540229F6950ACB973A8F0711E77CAB42FBF88B69F89
        D9C7D4855B466D63E203493B40F0D8A3DD6390552B14E1E6EBD5F8C8AD777201
        BCA03D9083FA86990F24C4748196D3C3DA60456DD7F911F924DE400AEA1B6636
        08E65FBC4AE433E5C78AE6ECB2441F8CD31835B50FE80530BBA12B0FC75482C0
        2B3A29D2653C7ADDCBB1DD1B9A7514D721290FC75482C0219DF4786C1152E56D
        70322B17F01A92F2704C2508FCA693520BE1BBB47A439BCB91FC1DFC80A43C1C
        5309021775D202846A9BAE05B2982A0FC75482C0399D349D09DFA5D51BDA4FF4
        BA164843521E8EA90481719DD49FC0ABAE8AF6722AAFCD995148CAC3319520F0
        A64E6ABB9D80A45AC95D5ABDA19DE84BCA05F440521E8EA90481AD3AA9E9E800
        FD7D0D9436B17A43DB706C501EC15E48CAC331952090FF094DEAC4FDD7F8C9AD
        BC1DBC31A18D99F7A01EB2F2704C6D10DC2192A9E3C127C8AA39BBB47A35EE7C
        F2599AF35388400EEA1B663608DE0AD2C5E48068F738E51110D60EF7186F3FA6
        17B2E1614C2408F69A6B36E24C4FDE4F526C9A68A9B8DB1CFAF80CD1A98729DA
        74DC3873E62958273D1863A2416059F30AE08F99B53E2F47406039F31CB804F8
        E3D377DF26090ED81E126382E030F343C5B8D5200AEE810F6009704C16F05FCD
        5D1001DEEF40493040F0B2CC4B81FB6B7C7A18EA82E41650B17935A80B0CBE0A
        C39A9933EA029357C2B466E68CBAC0683348148D6B66CE040318F222DE824CAD
        CC196302E306D028B57F0BD5FD01D26D9BC645420FC30000000049454E44AE42
        6082}
      ExplicitLeft = 632
    end
    object lblHeaderTitle: TcxLabel
      AlignWithMargins = True
      Left = 8
      Top = 8
      Caption = 'Page title'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.SkinName = 'Office2013DarkGray'
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.SkinName = 'Office2013DarkGray'
      StyleFocused.LookAndFeel.SkinName = 'Office2013DarkGray'
      StyleHot.LookAndFeel.SkinName = 'Office2013DarkGray'
      Transparent = True
    end
    object lblHeaderDescription: TcxLabel
      AlignWithMargins = True
      Left = 28
      Top = 28
      Caption = 'Page description: this should help the user complete a subtask'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.LookAndFeel.SkinName = 'Office2013DarkGray'
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.SkinName = 'Office2013DarkGray'
      StyleFocused.LookAndFeel.SkinName = 'Office2013DarkGray'
      StyleHot.LookAndFeel.SkinName = 'Office2013DarkGray'
      Transparent = True
    end
  end
  object pnlBody: TPanel
    Left = 0
    Top = 53
    Width = 681
    Height = 333
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitLeft = 256
    ExplicitTop = 128
    ExplicitWidth = 185
    ExplicitHeight = 41
    object bvlGrid: TBevel
      Left = 0
      Top = 233
      Width = 681
      Height = 4
      Align = alBottom
      Shape = bsSpacer
      ExplicitTop = 49
    end
    object dbgPesquisa: TcxGrid
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 675
      Height = 227
      Align = alClient
      TabOrder = 0
      ExplicitTop = 2
      object dbgPesquisaDB: TcxGridDBBandedTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dtsPesquisa
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        Images = DtmRecursos.imgFlat16
        OptionsCustomize.ColumnMoving = False
        OptionsCustomize.BandMoving = False
        OptionsCustomize.BandSizing = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.CellEndEllipsis = True
        OptionsView.NoDataToDisplayInfoText = '<N'#227'o h'#225' registros. Fa'#231'a uma nova pesquisa>'
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        Bands = <>
      end
      object dbgPesquisaLv: TcxGridLevel
        GridView = dbgPesquisaDB
      end
    end
    object pgcPesquisa: TcxPageControl
      AlignWithMargins = True
      Left = 3
      Top = 240
      Width = 675
      Height = 90
      Align = alBottom
      TabOrder = 1
      Properties.ActivePage = tbsPesquisa
      Properties.CustomButtons.Buttons = <>
      Properties.Images = DtmRecursos.imgFlat16
      LookAndFeel.SkinName = 'Office2013DarkGray'
      ClientRectBottom = 88
      ClientRectLeft = 2
      ClientRectRight = 673
      ClientRectTop = 29
      object tbsPesquisa: TcxTabSheet
        Caption = 'Pesquisa'
        ImageIndex = 0
        ExplicitLeft = 0
        ExplicitTop = 28
        object cxLabel1: TcxLabel
          Left = 23
          Top = 11
          Caption = 'cxLabel1'
          Style.LookAndFeel.SkinName = 'Office2013DarkGray'
          StyleDisabled.LookAndFeel.SkinName = 'Office2013DarkGray'
          StyleFocused.LookAndFeel.SkinName = 'Office2013DarkGray'
          StyleHot.LookAndFeel.SkinName = 'Office2013DarkGray'
          Transparent = True
        end
        object cxImageComboBox1: TcxImageComboBox
          Left = 23
          Top = 26
          Properties.Items = <>
          TabOrder = 1
          Width = 121
        end
        object cxTextEdit1: TcxTextEdit
          Left = 150
          Top = 26
          TabOrder = 2
          Text = 'cxTextEdit1'
          Width = 419
        end
        object btnPesquisar: TcxButton
          Left = 575
          Top = 24
          Width = 75
          Height = 25
          Caption = '&Pesquisar'
          LookAndFeel.SkinName = 'Office2013DarkGray'
          OptionsImage.Images = DtmRecursos.imgFlat16
          TabOrder = 3
        end
      end
    end
  end
  object dtsPesquisa: TDataSource
    Left = 120
    Top = 165
  end
end
