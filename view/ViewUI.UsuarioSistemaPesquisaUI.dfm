inherited FrmUsuarioSistemaPesquisaUI: TFrmUsuarioSistemaPesquisaUI
  Caption = 'Usu'#225'rio de Sistema, pesquisa!'
  ClientHeight = 467
  ExplicitHeight = 506
  PixelsPerInch = 96
  TextHeight = 13
  inherited bvlHeader: TBevel
    Top = 71
    ExplicitTop = 71
  end
  inherited pnlBody: TPanel
    Height = 392
    ExplicitTop = 75
    ExplicitWidth = 681
    ExplicitHeight = 392
    inherited bvlGrid: TBevel
      Top = 292
    end
    inherited dbgPesquisa: TcxGrid
      Height = 282
      ExplicitWidth = 675
      ExplicitHeight = 282
    end
    inherited pgcPesquisa: TcxPageControl
      Top = 299
      ExplicitTop = 299
      ExplicitWidth = 675
      inherited tbsPesquisa: TcxTabSheet
        inherited grpTipoPesquisa: TcxGroupBox
          ExplicitLeft = 3
          ExplicitHeight = 45
          inherited edTipoPesquisa: TcxImageComboBox
            ExplicitLeft = 6
            ExplicitTop = 18
            ExplicitWidth = 189
          end
        end
        inherited grpPesquisa: TcxGroupBox
          ExplicitWidth = 450
          inherited edPesquisa: TcxTextEdit
            ExplicitLeft = 6
            ExplicitTop = 18
            ExplicitWidth = 438
          end
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    ExplicitTop = 0
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
