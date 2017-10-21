inherited FormMainGestorUsuarioUI: TFormMainGestorUsuarioUI
  Caption = #193'gil Gestor Usu'#225'rios'
  ClientHeight = 589
  ClientWidth = 997
  ExplicitWidth = 1013
  ExplicitHeight = 628
  PixelsPerInch = 96
  TextHeight = 13
  inherited ImgLogoCompany: TImage
    Left = 550
    Top = 277
    Anchors = [akRight, akBottom]
    ExplicitLeft = 550
    ExplicitTop = 277
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
      Width = 403
      ExplicitWidth = 403
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
    Width = 121
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
      LargeImageIndex = 1
      LinksUseSmallImages = False
      SelectedLinkIndex = -1
      SmallImageIndex = 1
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
    object nvbCadastroPerfilUsuario: TdxNavBarItem
      Action = acnCadastroPerfilUsuario
    end
    object nvbCadastroUsuario: TdxNavBarItem
      Action = acnCadastroUsuario
    end
  end
  inherited rbvMenu: TdxRibbonBackstageView
    object dxRibbonBackstageViewTabSheet1: TdxRibbonBackstageViewTabSheet
      Left = 132
      Top = 0
      Active = True
      Caption = 'Teste'
    end
  end
  inherited brnMenu: TdxBarManager
    Categories.Strings = (
      'Cadastro')
    LookAndFeel.SkinName = ''
    LookAndFeel.SkinName = ''
    DockControlHeights = (
      0
      0
      0
      0)
    object brnAcessoRapido: TdxBar
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
      ItemLinks = <>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object BrBtnPerfilUsuario: TdxBarLargeButton
      Caption = 'Perfil de Usu'#225'rio'
      Category = 0
      Hint = 'Perfil de Usu'#225'rio'
      Visible = ivAlways
      LargeImageIndex = 0
      HotImageIndex = 0
      SyncImageIndex = False
      ImageIndex = 0
    end
  end
end
