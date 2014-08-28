program AgilGestorUsuario;

uses
  Vcl.Forms,
  ViewUI.FormDefaultUI in '..\..\view\default\ViewUI.FormDefaultUI.pas' {FormDefaultUI},
  Vcl.Themes,
  Vcl.Styles,
  Model.Rotina in '..\..\model\Model.Rotina.pas',
  ViewUI.FormSplashUI in '..\..\view\default\ViewUI.FormSplashUI.pas' {FormSplashUI},
  Controller.Rotina in '..\..\controller\Controller.Rotina.pas',
  InterfaceAgil.Observer in '..\..\agil_lib\interfaces\InterfaceAgil.Observer.pas',
  ClasseAgil.BaseObject in '..\..\agil_lib\classes\ClasseAgil.BaseObject.pas',
  InterfaceAgil.Controller in '..\..\agil_lib\interfaces\InterfaceAgil.Controller.pas',
  ViewUI.FormMainUI in '..\..\view\default\ViewUI.FormMainUI.pas' {FormMainUI},
  ViewUI.FormMainGestorUsuarioUI in 'view\mdi\ViewUI.FormMainGestorUsuarioUI.pas' {FormMainControleUsuarioUI};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Ágil Gestor Usuários';
  TStyleManager.TrySetStyle('Metropolis UI Green');
  Application.CreateForm(TFormMainControleUsuarioUI, FormMainControleUsuarioUI);
  Application.Run;
end.
