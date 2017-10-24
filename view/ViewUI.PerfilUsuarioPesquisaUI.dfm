inherited FrmPerfilUsuarioPesquisaUI: TFrmPerfilUsuarioPesquisaUI
  Caption = 'Perfil de Usu'#225'rio, pesquisa!'
  PixelsPerInch = 96
  TextHeight = 13
  inherited bvlHeader: TBevel
    ExplicitTop = 71
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
    ExplicitHeight = 312
    inherited dbgPesquisa: TcxGrid
      ExplicitHeight = 202
    end
    inherited pgcPesquisa: TcxPageControl
      ExplicitTop = 219
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
