program AgilGestorUsuario;

uses
  MidasLib,
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
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
  Controller.VersaoAplicacao in '..\..\controller\Controller.VersaoAplicacao.pas',
  Controller.Rotina in '..\..\controller\Controller.Rotina.pas',
  Controller.Licenca in '..\..\controller\Controller.Licenca.pas',
  Controller.Sistema in '..\..\controller\Controller.Sistema.pas',
  DataModule.Recursos in '..\..\module\DataModule.Recursos.pas' {DtmRecursos: TDataModule},
  DataModule.Base in '..\..\module\DataModule.Base.pas' {DtmBase: TDataModule},
  ViewUI.FormDefaultUI in '..\..\view\default\ViewUI.FormDefaultUI.pas' {FormDefaultUI},
  ViewUI.FormDefaultPesquisaUI in '..\..\view\default\ViewUI.FormDefaultPesquisaUI.pas' {FormDefaultPesquisaUI},
  ViewUI.FormSplashUI in '..\..\view\default\ViewUI.FormSplashUI.pas' {FormSplashUI},
  ViewUI.FormMainUI in '..\..\view\default\ViewUI.FormMainUI.pas' {FormMainUI},
  ViewUI.SplashGestorUsuarioUI in 'view\sdi\ViewUI.SplashGestorUsuarioUI.pas' {FormSplashGestorUsuarioUI},
  ViewUI.FormMainGestorUsuarioUI in 'view\mdi\ViewUI.FormMainGestorUsuarioUI.pas' {FormMainGestorUsuarioUI},
  ViewUI.PerfilUsuarioPesquisaUI in '..\..\view\ViewUI.PerfilUsuarioPesquisaUI.pas' {FrmPerfilUsuarioPesquisaUI},
  ViewUI.UsuarioSistemaPesquisaUI in '..\..\view\ViewUI.UsuarioSistemaPesquisaUI.pas' {FrmUsuarioSistemaPesquisaUI},
  TypeAgil.Constants in '..\..\agil_lib\units\TypeAgil.Constants.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Ágil Gestor Usuários';
  Application.CreateForm(TDtmRecursos, DtmRecursos);
  Application.CreateForm(TDtmBase, DtmBase);

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
