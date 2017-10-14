inherited FormMainGestorUsuarioUI: TFormMainGestorUsuarioUI
  Caption = #193'gil Gestor Usu'#225'rios'
  ClientHeight = 589
  ClientWidth = 997
  ExplicitWidth = 1013
  ExplicitHeight = 628
  PixelsPerInch = 96
  TextHeight = 13
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
    ExplicitWidth = 997
    inherited rbbMenuSistema: TdxRibbonTab
      Index = 0
    end
  end
  object nvbMenu: TdxNavBar [4]
    Left = 0
    Top = 122
    Width = 169
    Height = 403
    Align = alLeft
    ActiveGroupIndex = 0
    TabOrder = 7
    ViewReal = 15
    OptionsImage.DisabledLargeImages = DtmRecursos.imgFlat32Disable
    OptionsImage.HotLargeImages = DtmRecursos.imgFlat32Hot
    OptionsImage.LargeImages = DtmRecursos.imgFlat32
    OptionsImage.SmallImages = DtmRecursos.imgFlat16
    OptionsStyle.DefaultStyles.NavigationPaneHeader.BackColor = clNone
    OptionsStyle.DefaultStyles.NavigationPaneHeader.BackColor2 = clNone
    OptionsStyle.DefaultStyles.NavigationPaneHeader.Font.Charset = ANSI_CHARSET
    OptionsStyle.DefaultStyles.NavigationPaneHeader.Font.Color = clNone
    OptionsStyle.DefaultStyles.NavigationPaneHeader.Font.Height = -13
    OptionsStyle.DefaultStyles.NavigationPaneHeader.Font.Name = 'Tahoma'
    OptionsStyle.DefaultStyles.NavigationPaneHeader.Font.Style = [fsBold]
    OptionsStyle.DefaultStyles.NavigationPaneHeader.AssignedValues = [savFont]
    ExplicitTop = 120
    object nvbMenuGrpCadastro: TdxNavBarGroup
      Caption = 'Cadastro'
      SelectedLinkIndex = -1
      TopVisibleLinkIndex = 0
      Links = <>
    end
    object nvbMenuGrpRelatorio: TdxNavBarGroup
      Caption = 'Relat'#243'rios'
      SelectedLinkIndex = -1
      TopVisibleLinkIndex = 0
      Links = <>
    end
    object nvbMenuGrpConfiguracao: TdxNavBarGroup
      Caption = 'Configura'#231#245'es'
      SelectedLinkIndex = -1
      TopVisibleLinkIndex = 0
      Links = <>
    end
  end
  inherited TmrContador: TTimer
    Left = 280
    Top = 480
  end
  inherited BrManager: TdxBarManager
    LookAndFeel.SkinName = ''
    LookAndFeel.SkinName = ''
    DockControlHeights = (
      0
      0
      0
      0)
  end
end
