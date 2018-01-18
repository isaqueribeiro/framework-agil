inherited FormDefaultPesquisaUI: TFormDefaultPesquisaUI
  AutoSize = True
  Caption = 'FormDefaultPesquisaUI'
  ClientHeight = 387
  FormStyle = fsMDIChild
  Visible = True
  WindowState = wsMaximized
  OnResize = FormResize
  ExplicitHeight = 426
  PixelsPerInch = 96
  TextHeight = 13
  object shpLimite: TShape
    Left = 0
    Top = 0
    Width = 681
    Height = 9
    Brush.Style = bsClear
    Pen.Color = clBtnFace
    Pen.Style = psClear
    Visible = False
  end
  object pnlBody: TPanel
    Left = 0
    Top = 71
    Width = 681
    Height = 316
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object bvlGrid: TBevel
      Left = 0
      Top = 216
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
      Height = 210
      Align = alClient
      TabOrder = 0
      object dbgPesquisaDB: TcxGridDBBandedTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dtsPesquisa
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        Images = DtmRecursos.imgFlat16
        OptionsBehavior.CellHints = True
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
      Top = 223
      Width = 675
      Height = 90
      Align = alBottom
      TabOrder = 1
      Properties.ActivePage = tbsPesquisa
      Properties.CustomButtons.Buttons = <>
      Properties.Images = DtmRecursos.imgFlat16
      Properties.Options = [pcoAlwaysShowGoDialogButton, pcoGradientClientArea, pcoRedrawOnResize]
      LookAndFeel.SkinName = 'Office2013DarkGray'
      ClientRectBottom = 88
      ClientRectLeft = 2
      ClientRectRight = 673
      ClientRectTop = 29
      object tbsPesquisa: TcxTabSheet
        BorderWidth = 4
        Caption = 'Pesquisa'
        ImageIndex = 0
        object grpTipoPesquisa: TcxGroupBox
          AlignWithMargins = True
          Left = 3
          Top = 3
          Align = alLeft
          Caption = '  Tipo pesquisa'
          Ctl3D = True
          PanelStyle.Active = True
          PanelStyle.BorderWidth = 4
          ParentCtl3D = False
          Style.BorderStyle = ebsFlat
          TabOrder = 0
          Transparent = True
          Height = 45
          Width = 201
          object edTipoPesquisa: TcxImageComboBox
            Left = 6
            Top = 18
            Align = alBottom
            EditValue = 0
            Properties.DefaultImageIndex = 9
            Properties.Images = DtmRecursos.imgOffice2013
            Properties.Items = <
              item
                Description = 'Autom'#225'tico'
                ImageIndex = 9
                Value = 0
              end>
            TabOrder = 0
            Width = 189
          end
        end
        object grpPesquisa: TcxGroupBox
          AlignWithMargins = True
          Left = 210
          Top = 3
          Align = alClient
          Caption = '  Informe dados para pesquisa'
          PanelStyle.Active = True
          PanelStyle.BorderWidth = 4
          Style.BorderStyle = ebsFlat
          Style.Shadow = False
          TabOrder = 1
          Transparent = True
          Height = 45
          Width = 450
          object edPesquisa: TcxTextEdit
            Left = 6
            Top = 18
            Align = alBottom
            Properties.CharCase = ecUpperCase
            TabOrder = 0
            Width = 438
          end
        end
      end
    end
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
  object dtsPesquisa: TDataSource
    OnStateChange = dtsPesquisaStateChange
    Left = 32
    Top = 197
  end
  object acnEvento: TActionList
    Images = DtmRecursos.imgOffice2013
    Left = 32
    Top = 149
    object acnNovo: TAction
      Category = 'Cadastro'
      Caption = 'Novo'
      Hint = 'Novo Registro'
      ImageIndex = 20
      OnExecute = acnNovoExecute
    end
    object acnEditar: TAction
      Category = 'Cadastro'
      Caption = 'Editar'
      Hint = 'Editar Registro'
      ImageIndex = 137
      ShortCut = 113
      OnExecute = acnEditarExecute
    end
    object acnExcluir: TAction
      Category = 'Cadastro'
      Caption = 'Excluir'
      Hint = 'Excluir Registro'
      ImageIndex = 136
      OnExecute = acnExcluirExecute
    end
    object acnExportar: TAction
      Category = 'Registros'
      Caption = 'Exportar'
      Hint = 'Exportar Registro'
      ImageIndex = 140
      OnExecute = acnExportarExecute
    end
    object acnImprimir: TAction
      Category = 'Registros'
      Caption = 'Imprimir'
      Hint = 'Imprimir'
      ImageIndex = 213
      OnExecute = acnImprimirExecute
    end
    object acnPesquisar: TAction
      Category = 'Registros'
      Caption = '&Pesquisar'
      Hint = 'Pesquisar'
      ImageIndex = 167
      OnExecute = acnPesquisarExecute
    end
    object acnPrepararPesquisa: TAction
      Category = 'zOutras'
      ShortCut = 114
      OnExecute = acnPrepararPesquisaExecute
    end
    object acnAtualizar: TAction
      Category = 'Registros'
      Caption = 'Atualizar'
      ImageIndex = 22
      ShortCut = 116
      OnExecute = acnAtualizarExecute
    end
  end
  object brnEvento: TdxBarManager
    AllowReset = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Cadastro'
      'Registros')
    Categories.ItemsVisibles = (
      2
      2)
    Categories.Visibles = (
      True
      True)
    ImageOptions.Images = DtmRecursos.imgOffice2013
    LookAndFeel.SkinName = 'Office2013DarkGray'
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 64
    Top = 149
    DockControlHeights = (
      0
      0
      22
      0)
    object brFerramentas: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      BorderStyle = bbsNone
      Caption = 'Barra de Ferramentas'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 715
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      Images = DtmRecursos.imgOffice2013
      IsMainMenu = True
      ItemLinks = <
        item
          Visible = True
          ItemName = 'BrBtnPesquisar'
        end
        item
          Visible = True
          ItemName = 'BrBtnAtualizar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'BrBtnNovo'
        end
        item
          Visible = True
          ItemName = 'BrBtnEditar'
        end
        item
          Visible = True
          ItemName = 'BrBtnExcluir'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'BrBtnExportar'
        end
        item
          Visible = True
          ItemName = 'BrBtnImprimir'
        end>
      MultiLine = True
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object BrBtnNovo: TdxBarButton
      Action = acnNovo
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object BrBtnEditar: TdxBarButton
      Action = acnEditar
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object BrBtnExcluir: TdxBarButton
      Action = acnExcluir
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object BrBtnPesquisar: TdxBarButton
      Action = acnPesquisar
      Category = 1
      PaintStyle = psCaptionGlyph
    end
    object BrBtnAtualizar: TdxBarButton
      Action = acnAtualizar
      Category = 1
      PaintStyle = psCaptionGlyph
    end
    object BrBtnExportar: TdxBarButton
      Action = acnExportar
      Category = 1
      PaintStyle = psCaptionGlyph
    end
    object BrBtnImprimir: TdxBarButton
      Action = acnImprimir
      Category = 1
      PaintStyle = psCaptionGlyph
    end
  end
end
