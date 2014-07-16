program ControleUsuario;

uses
  Vcl.Forms,
  ViewUI.FormDefaultUI in '..\..\view\default\ViewUI.FormDefaultUI.pas' {FormDefaultUI},
  Vcl.Themes,
  Vcl.Styles,
  Model.Rotina in '..\..\model\Model.Rotina.pas',
  ViewUI.FormSplashUI in '..\..\view\default\ViewUI.FormSplashUI.pas' {FormSplashUI};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Metropolis UI Green');
  Application.CreateForm(TFormDefaultUI, FormDefaultUI);
  Application.CreateForm(TFormSplashUI, FormSplashUI);
  Application.Run;
end.
