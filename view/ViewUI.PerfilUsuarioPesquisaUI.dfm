inherited FrmPerfilUsuarioPesquisaUI: TFrmPerfilUsuarioPesquisaUI
  Caption = 'Perfil de Usu'#225'rio, pesquisa!'
  ClientHeight = 467
  ExplicitHeight = 506
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBody: TPanel
    Height = 396
    ExplicitHeight = 392
    inherited bvlGrid: TBevel
      Top = 296
      ExplicitTop = 292
    end
    inherited dbgPesquisa: TcxGrid
      Height = 290
      ExplicitHeight = 282
    end
    inherited pgcPesquisa: TcxPageControl
      Top = 303
      ExplicitTop = 299
    end
  end
  inherited pnlHeader: TPanel
    inherited lblHeaderTitle: TcxLabel
      Style.IsFontAssigned = True
    end
    inherited lblHeaderDescription: TcxLabel
      Style.IsFontAssigned = True
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
