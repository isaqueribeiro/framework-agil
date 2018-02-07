inherited FormDefaultCadastroUI: TFormDefaultCadastroUI
  BorderStyle = bsDialog
  Caption = 'FormDefaultCadastroUI'
  ClientHeight = 396
  ClientWidth = 691
  Position = poOwnerFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object wcCadastro: TdxWizardControl
    Left = 0
    Top = 0
    Width = 691
    Height = 396
    Buttons.Back.Caption = '&Voltar'
    Buttons.Back.ImageIndex = 80
    Buttons.Cancel.Caption = '&Cancelar'
    Buttons.Cancel.ImageIndex = 11
    Buttons.CustomButtons.Buttons = <>
    Buttons.Finish.Caption = '&Salvar'
    Buttons.Finish.ImageIndex = 141
    Buttons.Help.Caption = 'A&juda'
    Buttons.Help.Visible = False
    Buttons.Images = DtmRecursos.imgOffice2013
    Buttons.Next.Caption = '&Avan'#231'ar'
    Buttons.Next.ImageIndex = 79
    Header.AssignedValues = [wchvDescriptionFont, wchvGlyph, wchvTitleFont]
    Header.DescriptionFont.Charset = DEFAULT_CHARSET
    Header.DescriptionFont.Color = clDefault
    Header.DescriptionFont.Height = -11
    Header.DescriptionFont.Name = 'Tahoma'
    Header.DescriptionFont.Style = []
    Header.Glyph.Data = {
      89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
      F40000000467414D410000B18F0BFC6105000000097048597300000EC400000E
      C401952B0E1B00000346494441545847ED95CF4F135110C78B8A1CF0FFF1E689
      100E80A5B56D6869C586A8E16240488B21462E2492C001A2F1042478D4022D96
      96462F4D8C07DA78313146D39898A6B045A8B468DA6EC799D7D7767779E8F687
      7A71924F76FB6676E6FBDE9B660C0060B8E20D5CAC07FAA65550F1B708D4C93B
      51B2462001B226B95EDA4509EB85048892EBE1BC2861BD342AA0847420C21EE1
      5C12AC9DEA9F664EA041FC1F3402FCB41B41E09FC22FAB0478BCF7205F90EBA2
      2897F0DBC66C6A6A0AEE781F9CC3D7B2005AF89B46F5BC5EEF3F1770015F7F2F
      606969092C160B984C26989F9F8742A1C03D8D9B6E016EB71BFAFBFBC16AB532
      8C4623381C0EEE55DBCCCC0C8C8D8D9D09F92BA64B40241281DEDE5EB0D96C2A
      FAFAFAC0E7F3F1A8C64C9780C5C545181818382580AE6276769647D5ACE527B0
      B2B22214406BD417CD982E01922441575717BBFB4A717AA7B54422C1A36AA638
      813CF204B98C74226DE86685386D58AF53B976661346A351E8E9E9618D487477
      77432814E25EA1CD21866CE446FB61C83572F0C2B926059CF13DFF9084C8F4DC
      0F0CC5D35BCEB5C3A0EBE67164B883E2850282C120643219F6B70B87C3ACF0C9
      C909637B7B9B47D58CDFB141F2DB27B110E825B569BF7F4AC0C2C202DB39359C
      D6E81AC8474D2A30437AE716A4D6AF616287B06015F4A7D62DB0B7E5069580DD
      DD5D5680EE9C044C4C4C700F80C7E3A93626C5C46231EEA99D40A9700C47B1C7
      2C79F2B911923E13A47CE6B2287CD2EFE4335C47FF51EC11147369B580E9E969
      309BCDD5C6A382E3E3E34C88F25F413114AB31C3BE7F10B21F8320177250CC67
      219F7E0FB9CF51B6464FFA5D445FA9F803B2891D486DD86B024AA512D8ED7655
      E7578A294511951859A6C9AAE88100DE2BEEB6BC7B0B482FEFC2C1EB876CB707
      6FE6407A3509C90D2B3B8594AF7C555501948C0A690588A0188AD5CC0614E054
      DFF3E620EED28658F97390AD2BFB417505ABABABD506A421448594540613C52C
      2F2FF3AF9427A010A0139500B2783CCE26DFE8E828DB2D0D2182DE698D7CCA06
      54586B043461FF05342EA0157001DF45457E414E39A99A0607905350E44C7038
      DD16266A069C765745C5B460F1118A17266905DF76864D5F83AEA7D296F31316
      03BC9E2F7842EB99F075572D0E0C3F01E51A01AD23D950F10000000049454E44
      AE426082}
    Header.TitleFont.Charset = DEFAULT_CHARSET
    Header.TitleFont.Color = clDefault
    Header.TitleFont.Height = -13
    Header.TitleFont.Name = 'Tahoma'
    Header.TitleFont.Style = [fsBold]
    InfoPanel.Caption = 'Novo (Ins) | Editar (F2)'
    InfoPanel.Font.Charset = DEFAULT_CHARSET
    InfoPanel.Font.Color = clDefault
    InfoPanel.Font.Height = -11
    InfoPanel.Font.Name = 'Tahoma'
    InfoPanel.Font.Style = [fsBold]
    LookAndFeel.NativeStyle = False
    OptionsViewStyleAero.Title.Font.Charset = DEFAULT_CHARSET
    OptionsViewStyleAero.Title.Font.Color = clDefault
    OptionsViewStyleAero.Title.Font.Height = -11
    OptionsViewStyleAero.Title.Font.Name = 'Tahoma'
    OptionsViewStyleAero.Title.Font.Style = []
    OnButtonClick = wcCadastroButtonClick
    object pgNominal: TdxWizardControlPage
    end
  end
  object dtsCadastro: TDataSource
    AutoEdit = False
    OnStateChange = dtsCadastroStateChange
    Left = 608
    Top = 16
  end
  object acnEvento: TActionList
    Images = DtmRecursos.imgOffice2013
    Left = 576
    Top = 16
    object acnCancelarFechar: TAction
      Category = 'zOutras'
      ShortCut = 27
      OnExecute = acnCancelarFecharExecute
    end
    object acnNovo: TAction
      Category = 'Cadastro'
      Caption = 'Novo'
      Hint = 'Novo Registro'
      ImageIndex = 20
      ShortCut = 45
      OnExecute = acnNovoExecute
    end
    object acnEditar: TAction
      Category = 'Cadastro'
      Caption = 'Editar'
      Hint = 'Editar Registro'
      ImageIndex = 137
      ShortCut = 113
      OnExecute = acnEditarExecute
    end
  end
end
