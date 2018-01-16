inherited FrmUsuarioSistemaPesquisaUI: TFrmUsuarioSistemaPesquisaUI
  Caption = 'Usu'#225'rio de Sistema, pesquisa!'
  ClientHeight = 467
  ExplicitWidth = 697
  ExplicitHeight = 506
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBody: TPanel
    Height = 396
    ExplicitHeight = 396
    inherited bvlGrid: TBevel
      Top = 296
      ExplicitTop = 292
    end
    inherited dbgPesquisa: TcxGrid
      Height = 290
      ExplicitHeight = 290
    end
    inherited pgcPesquisa: TcxPageControl
      Top = 303
      ExplicitTop = 303
    end
  end
  inherited pnlHeader: TPanel
    inherited lblHeaderTitle: TcxLabel
      Style.IsFontAssigned = True
    end
    inherited lblHeaderDescription: TcxLabel
      Caption = 
        'Controle para pesquisa e manuten'#231#227'o dos registros de usu'#225'rios de' +
        ' acesso ao(s) sistema(s).'
      Style.IsFontAssigned = True
      ExplicitWidth = 444
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
