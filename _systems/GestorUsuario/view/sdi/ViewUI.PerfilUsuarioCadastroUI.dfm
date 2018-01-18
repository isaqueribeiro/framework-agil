inherited FrmPerfilUsuarioCadastroUI: TFrmPerfilUsuarioCadastroUI
  Caption = 'Perfil de Usu'#225'rio, cadastro!'
  PixelsPerInch = 96
  TextHeight = 13
  inherited wcCadastro: TdxWizardControl
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 691
    ExplicitHeight = 396
    inherited pgNominal: TdxWizardControlPage
      Header.Description = 
        'Foruml'#225'rio para cadastro e manuten'#231#227'o dos registros de perfis de' +
        ' acesso ao(s) sistema(s).'
    end
  end
  inherited dtsCadastro: TDataSource
    DataSet = DtmControleUsuario.fdQryPerfil
  end
end
