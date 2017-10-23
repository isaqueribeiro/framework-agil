inherited FrmPerfilUsuarioPesquisaUI: TFrmPerfilUsuarioPesquisaUI
  Caption = 'Perfil de Usu'#225'rio, pesquisa!'
  PixelsPerInch = 96
  TextHeight = 13
  inherited bvlHeader: TBevel
    Top = 71
  end
  inherited pnlHeader: TPanel
    inherited lblHeaderTitle: TcxLabel
      Style.IsFontAssigned = True
    end
    inherited lblHeaderDescription: TcxLabel
      Style.IsFontAssigned = True
    end
  end
  inherited pnlBody: TPanel
    ExplicitTop = 75
    ExplicitHeight = 311
    inherited dbgPesquisa: TcxGrid
      ExplicitTop = 7
      ExplicitHeight = 201
    end
    inherited pgcPesquisa: TcxPageControl
      ExplicitTop = 218
    end
  end
  inherited brnEvento: TdxBarManager
    DockControlHeights = (
      0
      0
      22
      0)
  end
end
