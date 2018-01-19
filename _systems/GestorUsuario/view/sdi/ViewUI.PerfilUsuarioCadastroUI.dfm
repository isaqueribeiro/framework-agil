inherited FrmPerfilUsuarioCadastroUI: TFrmPerfilUsuarioCadastroUI
  Caption = 'Perfil de Usu'#225'rio, cadastro!'
  PixelsPerInch = 96
  TextHeight = 13
  inherited wcCadastro: TdxWizardControl
    inherited pgNominal: TdxWizardControlPage
      Header.Description = 
        'Foruml'#225'rio para cadastro e manuten'#231#227'o dos registros de perfis de' +
        ' acesso ao(s) sistema(s).'
      object lbl_cdPerfil: TcxLabel
        Left = 53
        Top = 4
        Caption = 'C'#243'digo'
        FocusControl = cdPerfil
        Properties.Alignment.Horz = taRightJustify
        Transparent = True
        AnchorX = 90
      end
      object cdPerfil: TcxDBMaskEdit
        Left = 96
        Top = 3
        DataBinding.DataField = 'CD_PERFIL'
        DataBinding.DataSource = dtsCadastro
        Properties.ReadOnly = True
        TabOrder = 1
        Width = 49
      end
      object dsPerfil: TcxDBTextEdit
        Left = 96
        Top = 30
        DataBinding.DataField = 'DS_PERFIL'
        DataBinding.DataSource = dtsCadastro
        TabOrder = 2
        Width = 345
      end
      object lbl_dsPerfil: TcxLabel
        Left = 40
        Top = 31
        Caption = 'Descri'#231#227'o'
        FocusControl = dsPerfil
        Properties.Alignment.Horz = taRightJustify
        Transparent = True
        AnchorX = 90
      end
      object dbcAtivo: TcxDBCheckBox
        Left = 96
        Top = 57
        Caption = 'Cadastro ativo'
        DataBinding.DataField = 'SN_ATIVO'
        DataBinding.DataSource = dtsCadastro
        Properties.Alignment = taLeftJustify
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        TabOrder = 4
        Transparent = True
        Width = 121
      end
      object dbcUsoSistema: TcxDBCheckBox
        Left = 96
        Top = 82
        Caption = 'Perfil padr'#227'o do sistema'
        DataBinding.DataField = 'SN_SISTEMA'
        DataBinding.DataSource = dtsCadastro
        Enabled = False
        Properties.Alignment = taLeftJustify
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        TabOrder = 5
        Transparent = True
        Width = 153
      end
    end
  end
  inherited dtsCadastro: TDataSource
    DataSet = DtmControleUsuario.fdQryPerfil
  end
end
