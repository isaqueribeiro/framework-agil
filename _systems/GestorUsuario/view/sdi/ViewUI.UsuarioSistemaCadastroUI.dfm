inherited FrmUsuarioSistemaCadastroUI: TFrmUsuarioSistemaCadastroUI
  Caption = 'Usu'#225'rio de Sistema, cadastro!'
  PixelsPerInch = 96
  TextHeight = 13
  inherited wcCadastro: TdxWizardControl
    inherited pgNominal: TdxWizardControlPage
      Header.Description = 
        'Foruml'#225'rio para cadastro e manuten'#231#227'o dos registros de usu'#225'rios ' +
        'de acesso ao(s) sistema(s).'
      object lbl_dsPrimeiroNome: TcxLabel
        Left = 18
        Top = 31
        Caption = '&Primeiro Nome'
        FocusControl = dsPrimeiroNome
        Properties.Alignment.Horz = taRightJustify
        Transparent = True
        AnchorX = 90
      end
      object dsPrimeiroNome: TcxDBTextEdit
        Left = 96
        Top = 30
        DataBinding.DataField = 'DS_PRIMEIRONOME'
        DataBinding.DataSource = dtsCadastro
        TabOrder = 2
        Width = 345
      end
      object snAtivo: TcxDBCheckBox
        Left = 96
        Top = 160
        Caption = 'Cadastro ativo'
        DataBinding.DataField = 'SN_ATIVO'
        DataBinding.DataSource = dtsCadastro
        Properties.Alignment = taLeftJustify
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        TabOrder = 10
        Transparent = True
        Width = 121
      end
      object dbcUsoSistema: TcxDBCheckBox
        Left = 96
        Top = 185
        Caption = 'Usu'#225'rio padr'#227'o do sistema'
        DataBinding.DataField = 'SN_SISTEMA'
        DataBinding.DataSource = dtsCadastro
        Enabled = False
        Properties.Alignment = taLeftJustify
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        TabOrder = 12
        Transparent = True
        Width = 153
      end
      object lbl_dsSobreNome: TcxLabel
        Left = 32
        Top = 55
        Caption = 'Sobrenome'
        FocusControl = dsSobreNome
        Properties.Alignment.Horz = taRightJustify
        Transparent = True
        AnchorX = 90
      end
      object dsSobreNome: TcxDBTextEdit
        Left = 96
        Top = 54
        DataBinding.DataField = 'DS_SOBRENOME'
        DataBinding.DataSource = dtsCadastro
        TabOrder = 3
        Width = 345
      end
      object lbl_dsLogin: TcxLabel
        Left = 61
        Top = 4
        Caption = '&Login'
        FocusControl = dsLogin
        Properties.Alignment.Horz = taRightJustify
        Transparent = True
        AnchorX = 90
      end
      object dsLogin: TcxDBTextEdit
        Left = 96
        Top = 3
        DataBinding.DataField = 'DS_LOGIN'
        DataBinding.DataSource = dtsCadastro
        Properties.CharCase = ecLowerCase
        TabOrder = 1
        Width = 345
      end
      object lbl_idPerfil: TcxLabel
        Left = 11
        Top = 82
        Caption = 'Perfil de acesso'
        FocusControl = idPerfil
        Properties.Alignment.Horz = taRightJustify
        Transparent = True
        AnchorX = 90
      end
      object idPerfil: TcxDBLookupComboBox
        Left = 96
        Top = 81
        DataBinding.DataField = 'ID_PERFIL'
        DataBinding.DataSource = dtsCadastro
        Properties.KeyFieldNames = 'ID_PERFIL'
        Properties.ListColumns = <
          item
            FieldName = 'DS_PERFIL'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dtsPerfil
        TabOrder = 5
        Width = 345
      end
      object dsSenha: TcxTextEdit
        Left = 96
        Top = 108
        Properties.CharCase = ecLowerCase
        Properties.EchoMode = eemPassword
        TabOrder = 7
        Text = 'dssenha'
        Width = 193
      end
      object lbl_dsSenha: TcxLabel
        Left = 56
        Top = 109
        Caption = 'Senha'
        FocusControl = idPerfil
        Properties.Alignment.Horz = taRightJustify
        Transparent = True
        AnchorX = 90
      end
      object snAlterarSenha: TcxDBCheckBox
        Left = 96
        Top = 135
        Caption = 'Alterar senha no primeiro acesso'
        DataBinding.DataField = 'SN_ALTERAR_SENHA'
        DataBinding.DataSource = dtsCadastro
        Properties.Alignment = taLeftJustify
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        TabOrder = 8
        Transparent = True
        Width = 193
      end
    end
  end
  inherited dtsCadastro: TDataSource
    DataSet = DtmControleUsuario.fdQryUsuario
  end
  object dtsPerfil: TDataSource
    DataSet = DtmControleUsuario.fdQryPerfil
    Left = 608
    Top = 64
  end
end
