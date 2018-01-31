inherited FrmRotinaSistemaPesquisaUI: TFrmRotinaSistemaPesquisaUI
  Hint = 
    'Controle das rotinas no(s) sistema(s) para pesquisa e ativa'#231#227'o d' +
    'a disponibilidade aos usu'#225'rios'
  Caption = 'Rotina de Sistema, pesquisa!'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBody: TPanel
    inherited dbgPesquisa: TcxGrid
      inherited dbgPesquisaDB: TcxGridDBBandedTableView
        OptionsView.GroupByBox = True
        Bands = <
          item
            Caption = 'Rotinas dos Sistemas'
          end>
        object dbgPesquisaDBID: TcxGridDBBandedColumn
          DataBinding.FieldName = 'ID'
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object dbgPesquisaDBID_ROTINA: TcxGridDBBandedColumn
          DataBinding.FieldName = 'ID_ROTINA'
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object dbgPesquisaDBNM_SISTEMA: TcxGridDBBandedColumn
          DataBinding.FieldName = 'NM_SISTEMA'
          Visible = False
          GroupIndex = 0
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
        object dbgPesquisaDBNM_ROTINA: TcxGridDBBandedColumn
          DataBinding.FieldName = 'NM_ROTINA'
          Position.BandIndex = 0
          Position.ColIndex = 3
          Position.RowIndex = 0
        end
        object dbgPesquisaDBIX_ROTINA: TcxGridDBBandedColumn
          DataBinding.FieldName = 'IX_ROTINA'
          Position.BandIndex = 0
          Position.ColIndex = 4
          Position.RowIndex = 0
        end
        object dbgPesquisaDBID_MESTRE: TcxGridDBBandedColumn
          DataBinding.FieldName = 'ID_MESTRE'
          Position.BandIndex = 0
          Position.ColIndex = 5
          Position.RowIndex = 0
        end
        object dbgPesquisaDBSN_RESTRINGIR_CAMPO: TcxGridDBBandedColumn
          DataBinding.FieldName = 'SN_RESTRINGIR_CAMPO'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.ValueChecked = '1'
          Properties.ValueUnchecked = '0'
          Position.BandIndex = 0
          Position.ColIndex = 6
          Position.RowIndex = 0
        end
        object dbgPesquisaDBSN_ATIVO: TcxGridDBBandedColumn
          DataBinding.FieldName = 'SN_ATIVO'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.ValueChecked = '1'
          Properties.ValueUnchecked = '0'
          Position.BandIndex = 0
          Position.ColIndex = 7
          Position.RowIndex = 0
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    inherited lblHeaderTitle: TcxLabel
      Style.IsFontAssigned = True
    end
    inherited lblHeaderDescription: TcxLabel
      Caption = 
        'Controle das rotinas no(s) sistema(s) para pesquisa e ativa'#231#227'o d' +
        'a disponibilidade aos usu'#225'rios'
      Style.IsFontAssigned = True
      ExplicitWidth = 454
    end
  end
  inherited dtsPesquisa: TDataSource
    DataSet = DtmControleUsuario.fdQryRotinaSistema
    Left = 512
    Top = 56
  end
  inherited acnEvento: TActionList
    Left = 512
    Top = 8
    inherited acnNovo: TAction
      Enabled = False
    end
    inherited acnEditar: TAction
      Enabled = False
    end
    inherited acnExcluir: TAction
      Enabled = False
    end
  end
  inherited brnEvento: TdxBarManager
    Left = 544
    Top = 8
    DockControlHeights = (
      0
      0
      22
      0)
  end
end
