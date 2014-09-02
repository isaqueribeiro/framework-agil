program AgilGestorUsuario;

uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  TypeAgil.SimpleTypes in '..\..\agil_lib\units\TypeAgil.SimpleTypes.pas',
  TypeAgil.ComplexTypes in '..\..\agil_lib\units\TypeAgil.ComplexTypes.pas',
  ClasseAgil.BaseObject in '..\..\agil_lib\classes\ClasseAgil.BaseObject.pas',
  InterfaceAgil.Observer in '..\..\agil_lib\interfaces\InterfaceAgil.Observer.pas',
  InterfaceAgil.Controller in '..\..\agil_lib\interfaces\InterfaceAgil.Controller.pas',
  Model.Rotina in '..\..\model\Model.Rotina.pas',
  Model.Licenca in '..\..\model\Model.Licenca.pas',
  Controller.VersaoAplicacao in '..\..\controller\Controller.VersaoAplicacao.pas',
  Controller.Rotina in '..\..\controller\Controller.Rotina.pas',
  DataModule.Recursos in '..\..\module\DataModule.Recursos.pas' {DtmRecursos: TDataModule},
  ViewUI.FormDefaultUI in '..\..\view\default\ViewUI.FormDefaultUI.pas' {FormDefaultUI},
  ViewUI.FormSplashUI in '..\..\view\default\ViewUI.FormSplashUI.pas' {FormSplashUI},
  ViewUI.SplashGestorUsuarioUI in 'view\sdi\ViewUI.SplashGestorUsuarioUI.pas' {FormSplashGestorUsuarioUI},
  ViewUI.FormMainUI in '..\..\view\default\ViewUI.FormMainUI.pas' {FormMainUI},
  ViewUI.FormMainGestorUsuarioUI in 'view\mdi\ViewUI.FormMainGestorUsuarioUI.pas' {FormMainGestorUsuarioUI};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Ágil Gestor Usuários';
  TStyleManager.TrySetStyle('Metropolis UI Green');
  Application.CreateForm(TDtmRecursos, DtmRecursos);
  Application.CreateForm(TFormMainGestorUsuarioUI, FormMainGestorUsuarioUI);
  Application.Run;
end.
