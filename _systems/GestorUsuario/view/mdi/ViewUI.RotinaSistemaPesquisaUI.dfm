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
      ExplicitTop = 296
    end
    inherited dbgPesquisa: TcxGrid
      Height = 290
      OnEnter = dbgPesquisaEnter
      ExplicitHeight = 290
      inherited dbgPesquisaDB: TcxGridDBBandedTableView
        OptionsView.GroupByBox = True
        Bands = <
          item
            Caption = 'Rotinas dos Sistemas'
          end>
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
      DataController.ImageIndexField = 'IDX_IMAGE'
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
      Styles.Content = DtmRecursos.stl_Content
      Styles.Inactive = DtmRecursos.stl_Inactive
      Styles.Selection = DtmRecursos.stl_Selection
      Styles.ContentEven = DtmRecursos.stl_ContentEven
      TabOrder = 2
      OnKeyDown = dbtPesquisaDBKeyDown
      object dbtPesquisaDBNM_ROTINA: TcxDBTreeListColumn
        Caption.Text = 'Rotinas do(s) Sistema(s)'
        DataBinding.FieldName = 'NM_ROTINA'
        Options.Editing = False
        Options.Focusing = False
        Options.Moving = False
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object dbtPesquisaDBSN_ATIVO: TcxDBTreeListColumn
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        Caption.AlignHorz = taCenter
        Caption.Text = 'Ativo'
        DataBinding.FieldName = 'SN_ATIVO'
        MinWidth = 35
        Options.Sizing = False
        Options.Editing = False
        Options.Focusing = False
        Options.Moving = False
        Width = 35
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object dbtPesquisaDBSN_RESTRINGIR_CAMPO: TcxDBTreeListColumn
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Images = DtmRecursos.imgOffice2013
        Properties.Items = <
          item
            Value = -1
          end
          item
            Description = 'Livre'
            ImageIndex = 3
            Value = 0
          end
          item
            Description = 'Restrito'
            ImageIndex = 11
            Value = 1
          end>
        Caption.AlignHorz = taCenter
        Caption.Text = 'Controles'
        DataBinding.FieldName = 'SN_RESTRINGIR_CAMPO_EDIT'
        MinWidth = 70
        Options.Sizing = False
        Options.Moving = False
        Width = 70
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
      Visible = False
    end
    inherited acnEditar: TAction
      Enabled = False
      Visible = False
    end
    inherited acnExcluir: TAction
      Caption = 'Remover Restri'#231#245'es'
      Hint = 'Remover Restri'#231#245'es do Cadastro'
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
    inherited brFerramentas: TdxBar
      ItemLinks = <
        item
          Visible = True
          ItemName = 'BrBtnPesquisar'
        end
        item
          Visible = True
          ItemName = 'BrBtnAtualizar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'BrBtnExcluir'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'BrBtnExportar'
        end
        item
          Visible = True
          ItemName = 'BrBtnImprimir'
        end>
    end
  end
end
