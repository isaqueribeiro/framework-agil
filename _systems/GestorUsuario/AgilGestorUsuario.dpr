program AgilGestorUsuario;

uses
  MidasLib,
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  TypeAgil.Constants in '..\..\agil_lib\units\TypeAgil.Constants.pas',
  TypeAgil.SimpleTypes in '..\..\agil_lib\units\TypeAgil.SimpleTypes.pas',
  TypeAgil.ComplexTypes in '..\..\agil_lib\units\TypeAgil.ComplexTypes.pas',
  InterfaceAgil.Observer in '..\..\agil_lib\interfaces\InterfaceAgil.Observer.pas',
  InterfaceAgil.Controller in '..\..\agil_lib\interfaces\InterfaceAgil.Controller.pas',
  ClasseAgil.BaseObject in '..\..\agil_lib\classes\ClasseAgil.BaseObject.pas',
  ClasseAgil.FormFactory in '..\..\agil_lib\classes\ClasseAgil.FormFactory.pas',
  ClasseAgil.Formulario in '..\..\agil_lib\classes\ClasseAgil.Formulario.pas',
  Model.Rotina in '..\..\model\Model.Rotina.pas',
  Model.Licenca in '..\..\model\Model.Licenca.pas',
  Model.Sistema in '..\..\model\Model.Sistema.pas',
  Model.Perfil in '..\..\model\Model.Perfil.pas',
  Model.Perfil.Permissao in '..\..\model\Model.Perfil.Permissao.pas',
  Model.Usuario in '..\..\model\Model.Usuario.pas',
  Model.Usuario.Permissao in '..\..\model\Model.Usuario.Permissao.pas',
  Controller.Mensagem in '..\..\controller\Controller.Mensagem.pas',
  Controller.VersaoAplicacao in '..\..\controller\Controller.VersaoAplicacao.pas',
  Controller.Sistema in '..\..\controller\Controller.Sistema.pas',
  Controller.Licenca in '..\..\controller\Controller.Licenca.pas',
  Controller.Rotina in '..\..\controller\Controller.Rotina.pas',
  Controller.Perfil in '..\..\controller\Controller.Perfil.pas',
  Controller.Perfil.Permissao in '..\..\controller\Controller.Perfil.Permissao.pas',
  Controller.Usuario in '..\..\controller\Controller.Usuario.pas',
  DataModule.Recursos in '..\..\module\DataModule.Recursos.pas' {DtmRecursos: TDataModule},
  DataModule.Base in '..\..\module\DataModule.Base.pas' {DtmBase: TDataModule},
  DataModule.ControleUsuario in '..\..\module\DataModule.ControleUsuario.pas' {DtmControleUsuario: TDataModule},
  ViewUI.FormRequiredFields in '..\..\view\ViewUI.FormRequiredFields.pas' {FormRequiredFields},
  ViewUI.FormDefaultUI in '..\..\view\default\ViewUI.FormDefaultUI.pas' {FormDefaultUI},
  ViewUI.FormDefaultPesquisaUI in '..\..\view\default\ViewUI.FormDefaultPesquisaUI.pas' {FormDefaultPesquisaUI},
  ViewUI.FormDefaultCadastroUI in '..\..\view\default\ViewUI.FormDefaultCadastroUI.pas' {FormDefaultCadastroUI},
  ViewUI.FormSplashUI in '..\..\view\default\ViewUI.FormSplashUI.pas' {FormSplashUI},
  ViewUI.FormMainUI in '..\..\view\default\ViewUI.FormMainUI.pas' {FormMainUI},
  ViewUI.SplashGestorUsuarioUI in 'view\sdi\ViewUI.SplashGestorUsuarioUI.pas' {FormSplashGestorUsuarioUI},
  ViewUI.FormMainGestorUsuarioUI in 'view\mdi\ViewUI.FormMainGestorUsuarioUI.pas' {FormMainGestorUsuarioUI},
  ViewUI.PerfilUsuarioPesquisaUI in 'view\mdi\ViewUI.PerfilUsuarioPesquisaUI.pas' {FrmPerfilUsuarioPesquisaUI},
  ViewUI.PerfilUsuarioCadastroUI in 'view\sdi\ViewUI.PerfilUsuarioCadastroUI.pas' {FrmPerfilUsuarioCadastroUI},
  ViewUI.UsuarioSistemaPesquisaUI in 'view\mdi\ViewUI.UsuarioSistemaPesquisaUI.pas' {FrmUsuarioSistemaPesquisaUI},
  ViewUI.UsuarioSistemaCadastroUI in 'view\sdi\ViewUI.UsuarioSistemaCadastroUI.pas' {FrmUsuarioSistemaCadastroUI},
  ViewUI.RotinaSistemaPesquisaUI in 'view\mdi\ViewUI.RotinaSistemaPesquisaUI.pas' {FrmRotinaSistemaPesquisaUI},
  ViewUI.PermissaoAcessoPesquisaUI in 'view\mdi\ViewUI.PermissaoAcessoPesquisaUI.pas' {FrmPermissaoAcessoPesquisaUI};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Ágil Gestor Usuários';
  Application.CreateForm(TDtmRecursos, DtmRecursos);
  Application.CreateForm(TDtmBase, DtmBase);
  Application.CreateForm(TDtmControleUsuario, DtmControleUsuario);
  if DtmBase.Conectado then
  begin
    Application.CreateForm(TFormMainGestorUsuarioUI, FormMainGestorUsuarioUI);
    Application.Run;
  end
  else
  begin
    DtmBase.Free;
    DtmRecursos.Free;
    Application.Terminate;
  end;
end.
