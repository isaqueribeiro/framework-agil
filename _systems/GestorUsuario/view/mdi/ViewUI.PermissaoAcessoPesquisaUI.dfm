inherited FrmPermissaoAcessoPesquisaUI: TFrmPermissaoAcessoPesquisaUI
  Hint = 
    'Controle para manuten'#231#227'o das pol'#237'ticas de acesso por perfis e us' +
    'u'#225'rios ao(s) sistema(s)'
  Caption = 'Permiss'#245'es de Acesso, controle!'
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
      ExplicitHeight = 290
    end
    inherited pgcPesquisa: TcxPageControl
      Top = 303
      ExplicitTop = 303
    end
    object pnlPesquisaDB: TPanel
      Left = 44
      Top = 40
      Width = 549
      Height = 241
      BevelOuter = bvNone
      TabOrder = 2
      object sptPesquisaDB: TSplitter
        Left = 286
        Top = 0
        Height = 241
        ExplicitLeft = 328
        ExplicitTop = 48
        ExplicitHeight = 100
      end
      object dbtPerfilUsuarioDB: TcxDBTreeList
        Left = 0
        Top = 0
        Width = 286
        Height = 241
        Align = alLeft
        Bands = <
          item
          end>
        DataController.DataSource = dtsPesquisa
        DataController.ImageIndexField = 'IMAGE'
        DataController.ParentField = 'PARENT'
        DataController.KeyField = 'ID'
        Images = DtmRecursos.imgFlat16
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
        TabOrder = 0
        object dbtPesquisaDBNM_ROTINA: TcxDBTreeListColumn
          Caption.Text = 'Perfis / Usu'#225'rios'
          DataBinding.FieldName = 'DESCRIPTION'
          Options.Editing = False
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
          Options.Sorting = False
          Width = 35
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object dbtPesquisaDBSN_SISTEMA: TcxDBTreeListColumn
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.ValueChecked = '1'
          Properties.ValueUnchecked = '0'
          Caption.AlignHorz = taCenter
          Caption.GlyphAlignHorz = taCenter
          Caption.Text = 'Sistema'
          DataBinding.FieldName = 'SN_SISTEMA'
          MinWidth = 50
          Options.Sizing = False
          Options.Editing = False
          Options.Focusing = False
          Options.Moving = False
          Options.Sorting = False
          Width = 50
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
      end
      object dbtPermissaoDB: TcxDBTreeList
        Left = 289
        Top = 0
        Width = 260
        Height = 241
        Align = alClient
        Bands = <
          item
          end>
        DataController.DataSource = dtsPesquisa
        DataController.ImageIndexField = 'IMAGE'
        DataController.ParentField = 'PARENT'
        DataController.KeyField = 'ID'
        Images = DtmRecursos.imgFlat16
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
        TabOrder = 1
        ExplicitLeft = 292
      end
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
  inherited dtsPesquisa: TDataSource
    DataSet = DtmControleUsuario.fdQryPerfilUsuario
    Left = 560
    Top = 61
  end
  inherited acnEvento: TActionList
    Left = 560
    Top = 13
  end
  inherited brnEvento: TdxBarManager
    Left = 592
    Top = 13
    DockControlHeights = (
      0
      0
      22
      0)
  end
end
