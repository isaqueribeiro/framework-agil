inherited FrmRotinaSistemaPesquisaUI: TFrmRotinaSistemaPesquisaUI
  Hint = 
    'Controle das rotinas no(s) sistema(s) para pesquisa e ativa'#231#227'o d' +
    'a disponibilidade aos usu'#225'rios'
  Caption = 'Rotina de Sistema, pesquisa!'
  ClientHeight = 467
  ExplicitHeight = 506
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBody: TPanel
    Height = 396
    ExplicitHeight = 396
    inherited bvlGrid: TBevel
      Top = 296
    end
    inherited dbgPesquisa: TcxGrid
      Height = 290
      ExplicitWidth = 204
      ExplicitHeight = 190
      inherited dbgPesquisaDB: TcxGridDBBandedTableView
        OptionsView.GroupByBox = True
        Bands = <
          item
            Caption = 'Rotinas dos Sistemas'
          end>
        object dbgPesquisaDBColumn1: TcxGridDBBandedColumn
          DataBinding.FieldName = 'ID_ROTINA'
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object dbgPesquisaDBColumn2: TcxGridDBBandedColumn
          DataBinding.FieldName = 'ID_MESTRE'
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object dbgPesquisaDBColumn3: TcxGridDBBandedColumn
          DataBinding.FieldName = 'NM_ROTINA'
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
      end
    end
    inherited pgcPesquisa: TcxPageControl
      Top = 303
      ExplicitTop = 303
    end
    object dbtPesquisaDB: TcxDBTreeList
      Left = 8
      Top = 80
      Width = 449
      Height = 201
      Anchors = [akLeft, akTop, akRight, akBottom]
      Bands = <
        item
        end>
      DataController.DataSource = dtsPesquisa
      DataController.ParentField = 'ID_MESTRE'
      DataController.KeyField = 'ID_ROTINA'
      Images = DtmRecursos.imgOffice2013
      Navigator.Buttons.CustomButtons = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.ExpandOnIncSearch = True
      OptionsData.Editing = False
      OptionsData.Deleting = False
      OptionsView.CellAutoHeight = True
      OptionsView.CellEndEllipsis = True
      OptionsView.ColumnAutoWidth = True
      RootValue = -1
      TabOrder = 2
      object cxDBTreeList1cxDBTreeListColumn1: TcxDBTreeListColumn
        Caption.Text = 'Rotinas do(s) Sistema(s)'
        DataBinding.FieldName = 'NM_ROTINA'
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object cxDBTreeList1cxDBTreeListColumn2: TcxDBTreeListColumn
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        Caption.AlignHorz = taCenter
        Caption.Text = 'A'
        DataBinding.FieldName = 'SN_ATIVO'
        MinWidth = 7
        Width = 7
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object cxDBTreeList1cxDBTreeListColumn3: TcxDBTreeListColumn
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        Caption.AlignHorz = taCenter
        Caption.Text = 'R'
        DataBinding.FieldName = 'SN_RESTRINGIR_CAMPO'
        MinWidth = 7
        Width = 7
        Position.ColIndex = 2
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
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
