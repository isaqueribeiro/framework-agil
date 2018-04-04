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
      ExplicitTop = 296
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
      Left = 8
      Top = 49
      Width = 660
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
        OptionsBehavior.IncSearch = True
        OptionsData.Editing = False
        OptionsData.Deleting = False
        OptionsView.CellAutoHeight = True
        OptionsView.CellEndEllipsis = True
        OptionsView.ColumnAutoWidth = True
        RootValue = '-1'
        Styles.Content = DtmRecursos.stl_Content
        Styles.Inactive = DtmRecursos.stl_Inactive
        Styles.Selection = DtmRecursos.stl_Selection
        Styles.ContentEven = DtmRecursos.stl_ContentEven
        Styles.IncSearch = DtmRecursos.stl_Selection
        Styles.Indicator = DtmRecursos.stl_Selection
        TabOrder = 0
        OnClick = dbtPerfilUsuarioDBClick
        OnKeyDown = dbtPerfilUsuarioDBKeyDown
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
      object pnlPesquisaDBPermissao: TPanel
        Left = 289
        Top = 0
        Width = 371
        Height = 241
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Bevel1: TBevel
          Left = 0
          Top = 191
          Width = 371
          Height = 4
          Align = alBottom
          Shape = bsSpacer
          ExplicitLeft = 3
          ExplicitTop = 181
        end
        object dbtPermissaoDB: TcxDBTreeList
          Left = 0
          Top = 0
          Width = 371
          Height = 191
          Align = alClient
          Bands = <
            item
            end>
          DataController.DataSource = dtsPermissao
          DataController.ImageIndexField = 'IMAGE'
          DataController.ParentField = 'PARENT'
          DataController.KeyField = 'ID'
          Images = DtmRecursos.imgOffice2013
          Navigator.Buttons.CustomButtons = <>
          OptionsBehavior.CellHints = True
          OptionsBehavior.ExpandOnIncSearch = True
          OptionsBehavior.IncSearch = True
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
          object dbtPermissaoDBcxDBtColumnDESCRIPTION: TcxDBTreeListColumn
            Caption.Text = 'Rotinas / Campos'
            DataBinding.FieldName = 'DESCRIPTION'
            Options.Editing = False
            Options.Moving = False
            Width = 196
            Position.ColIndex = 0
            Position.RowIndex = 0
            Position.BandIndex = 0
            Summary.FooterSummaryItems = <>
            Summary.GroupFooterSummaryItems = <>
          end
          object dbtPermissaoDBcxDBColumnTP_PERMISSAO: TcxDBTreeListColumn
            PropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.Images = DtmRecursos.imgTipoPermissao
            Properties.Items = <
              item
                Value = -1
              end
              item
                Description = '0. Sem acesso'
                ImageIndex = 0
                Value = 0
              end
              item
                Description = '1. Visulizar'
                ImageIndex = 1
                Value = 1
              end
              item
                Description = '2. Alterar'
                ImageIndex = 2
                Value = 2
              end
              item
                Description = '3. Inserir / Alterar'
                ImageIndex = 3
                Value = 3
              end
              item
                Description = '4. Controle Total'
                ImageIndex = 4
                Value = 4
              end>
            Caption.Text = 'Tipo de permiss'#227'o'
            DataBinding.FieldName = 'TP_PERMISSAO'
            MinWidth = 130
            Options.Sizing = False
            Options.IncSearch = False
            Options.Moving = False
            Options.Sorting = False
            Width = 130
            Position.ColIndex = 1
            Position.RowIndex = 0
            Position.BandIndex = 0
            Summary.FooterSummaryItems = <>
            Summary.GroupFooterSummaryItems = <>
          end
        end
        object grpPesquisaDBPermissao: TcxGroupBox
          Left = 0
          Top = 195
          Align = alBottom
          Caption = '  Perfil / Usu'#225'rio : ?'
          PanelStyle.Active = True
          PanelStyle.BorderWidth = 4
          ParentFont = False
          Style.BorderStyle = ebsFlat
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clNavy
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.Shadow = False
          Style.IsFontAssigned = True
          TabOrder = 1
          Transparent = True
          Height = 46
          Width = 371
          object edPesquisaDBPermissao: TcxTextEdit
            Left = 6
            Top = 19
            Align = alBottom
            Properties.CharCase = ecUpperCase
            Properties.ReadOnly = True
            Style.Color = clGradientActiveCaption
            TabOrder = 0
            OnKeyDown = edPesquisaKeyDown
            Width = 359
          end
        end
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
    inherited acnNovo: TAction
      Enabled = False
    end
    inherited acnEditar: TAction
      Enabled = False
    end
    inherited acnExcluir: TAction
      Enabled = False
    end
    object acnRemoverPermissao: TAction
      Category = 'zOutras'
      Caption = 'Remover Permiss'#245'es'
      Hint = 'Remover Todas Permiss'#245'es'
      ImageIndex = 5
      ShortCut = 16430
      OnExecute = acnRemoverPermissaoExecute
    end
    object acnSalvarPermissao: TAction
      Category = 'zOutras'
      Caption = '&Salvar Permiss'#245'es'
      Hint = 'Salvar Todas Permiss'#245'es'
      ImageIndex = 141
      OnExecute = acnSalvarPermissaoExecute
    end
  end
  inherited brnEvento: TdxBarManager
    Categories.Strings = (
      'Cadastro'
      'Registros'
      'Outras')
    Categories.ItemsVisibles = (
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True)
    Left = 592
    Top = 13
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
          ItemName = 'BrBtnRemoverPermissao'
        end
        item
          Visible = True
          ItemName = 'BrBtnSalvarPermissao'
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
    object BrBtnRemoverPermissao: TdxBarButton
      Action = acnRemoverPermissao
      Category = 2
      PaintStyle = psCaptionGlyph
    end
    object BrBtnSalvarPermissao: TdxBarButton
      Action = acnSalvarPermissao
      Category = 2
      PaintStyle = psCaptionGlyph
    end
  end
  object dtsPermissao: TDataSource
    DataSet = DtmControleUsuario.fdQryPermissaoAcesso
    Left = 592
    Top = 63
  end
end
