inherited FormMainGestorUsuarioUI: TFormMainGestorUsuarioUI
  Caption = #193'gil Gestor Usu'#225'rios'
  ClientHeight = 589
  ClientWidth = 997
  ExplicitWidth = 1013
  ExplicitHeight = 628
  PixelsPerInch = 96
  TextHeight = 13
  inherited ImgLogoCompany: TImage
    Left = 861
    Top = 421
    ExplicitLeft = 861
    ExplicitTop = 421
  end
  inherited PnlStatusBar: TPanel
    Top = 525
    Width = 997
    ExplicitTop = 525
    ExplicitWidth = 997
    inherited BvlStatusBar: TBevel
      Width = 997
      ExplicitWidth = 997
    end
    inherited PnlCompany: TPanel
      Width = 333
      ExplicitWidth = 333
    end
  end
  inherited stbInforme: TdxStatusBar
    Top = 563
    Width = 997
    ExplicitTop = 563
    ExplicitWidth = 997
  end
  inherited rbbMenu: TdxRibbon
    Width = 997
    Height = 155
    QuickAccessToolbar.Toolbar = brnAcessoRapido
    ExplicitWidth = 997
    ExplicitHeight = 155
    inherited rbbMenuSistema: TdxRibbonTab
      Index = 0
    end
  end
  object nvbMenu: TdxNavBar [4]
    Left = 0
    Top = 155
    Width = 129
    Height = 370
    Align = alLeft
    ActiveGroupIndex = 0
    TabOrder = 6
    Cursors.HotTrackedGroupCursor = -1118
    ViewReal = 15
    OptionsBehavior.Common.DragDropFlags = []
    OptionsBehavior.NavigationPane.AllowCustomizing = False
    OptionsImage.DisabledLargeImages = DtmRecursos.imgFlat32Disable
    OptionsImage.HotLargeImages = DtmRecursos.imgFlat32Hot
    OptionsImage.LargeImages = DtmRecursos.imgFlat32
    OptionsImage.SmallImages = DtmRecursos.imgFlat16
    object nvbGrpCadastro: TdxNavBarGroup
      Caption = 'Cadastro'
      LargeImageIndex = 12
      LinksUseSmallImages = False
      SelectedLinkIndex = -1
      SmallImageIndex = 12
      TopVisibleLinkIndex = 0
      OptionsExpansion.ShowExpandButton = False
      Links = <
        item
          Item = nvbCadastroPerfilUsuario
        end
        item
          Item = nvbCadastroUsuario
        end>
    end
    object nvbGrpConfiguracao: TdxNavBarGroup
      Caption = 'Configura'#231#245'es'
      LargeImageIndex = 15
      LinksUseSmallImages = False
      SelectedLinkIndex = -1
      SmallImageIndex = 15
      TopVisibleLinkIndex = 0
      OptionsExpansion.ShowExpandButton = False
      Links = <
        item
          Item = nvbControleRotinaSistema
        end
        item
          Item = nvbCadastroPermissaoAcesso
        end>
    end
    object nvbCadastroPerfilUsuario: TdxNavBarItem
      Action = acnCadastroPerfilUsuario
    end
    object nvbCadastroUsuario: TdxNavBarItem
      Action = acnCadastroUsuario
    end
    object nvbControleRotinaSistema: TdxNavBarItem
      Action = acnControleRotinaSistema
    end
    object nvbCadastroPermissaoAcesso: TdxNavBarItem
      Action = acnPermissaoAcesso
    end
  end
  inherited rbvMenu: TdxRibbonBackstageView
    Buttons = <
      item
        BeginGroup = True
        Item = BrBtnBloquearApp
        Position = mbpAfterTabs
      end
      item
        Item = BrBtnAlterarSenhaUsuario
        Position = mbpAfterTabs
      end
      item
        BeginGroup = True
        Item = BrBtnFecharApp
        Position = mbpAfterTabs
      end>
    object rbvConfigurarEmpresa: TdxRibbonBackstageViewTabSheet
      Left = 183
      Top = 0
      Active = True
      Caption = 'Configurar Empresa'
      DesignSize = (
        367
        328)
      object lblConfigurarEmpresa: TcxLabel
        Left = 20
        Top = 19
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Caption = 'Configurar Empresa'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -16
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TransparentBorder = False
        Style.IsFontAssigned = True
        Properties.LineOptions.Alignment = cxllaBottom
        Properties.LineOptions.Visible = True
        Transparent = True
        Height = 26
        Width = 333
      end
    end
    object rbvConfigurarCertificado: TdxRibbonBackstageViewTabSheet
      Left = 183
      Top = 0
      Caption = 'Configurar Certificado'
      DesignSize = (
        367
        328)
      object lblConfigurarCertificado: TcxLabel
        Left = 20
        Top = 19
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Caption = 'Configurar Certificado Digital'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -16
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TransparentBorder = False
        Style.IsFontAssigned = True
        Properties.LineOptions.Alignment = cxllaBottom
        Properties.LineOptions.Visible = True
        Transparent = True
        Height = 26
        Width = 333
      end
    end
  end
  inherited brnMenu: TdxBarManager
    Categories.Strings = (
      'Cadastro'
      'Testes')
    LookAndFeel.SkinName = ''
    LookAndFeel.SkinName = ''
    DockControlHeights = (
      0
      0
      0
      0)
    object brnAcessoRapido: TdxBar [0]
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Acesso R'#225'pido'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1031
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      Images = DtmRecursos.imgFlat16
      ItemLinks = <
        item
          Visible = True
          ItemName = 'BrBtnBloquearApp'
        end
        item
          Visible = True
          ItemName = 'BrBtnAlterarSenhaUsuario'
        end
        item
          Visible = True
          ItemName = 'BrBtnTeste'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object BrBtnPerfilUsuario: TdxBarLargeButton [1]
      Caption = 'Perfil de Usu'#225'rio'
      Category = 0
      Hint = 'Perfil de Usu'#225'rio'
      Visible = ivAlways
      LargeImageIndex = 0
      HotImageIndex = 0
      SyncImageIndex = False
      ImageIndex = 0
    end
    object BrBtnTeste: TdxBarButton [5]
      Action = acnTeste
      Category = 1
    end
  end
  inherited acnMenu: TActionList
    object acnTeste: TAction [5]
      Caption = 'acnTeste'
      OnExecute = acnTesteExecute
    end
  end
end
