unit ViewUI.PerfilUsuarioCadastroUI;

interface

uses
  ViewUI.FormDefaultCadastroUI,
  InterfaceAgil.Observer,
  Controller.Perfil,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, Data.DB, dxCustomWizardControl, dxWizardControl,

  dxSkinsCore, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White;

type
  TFrmPerfilUsuarioCadastroUI = class(TFormDefaultCadastroUI)
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    aController : TPerfilController;
  public
    { Public declarations }
  end;

var
  FrmPerfilUsuarioCadastroUI: TFrmPerfilUsuarioCadastroUI;

implementation

{$R *.dfm}

uses
  DataModule.Recursos,
  DataModule.Base,
  DataModule.ControleUsuario;

procedure TFrmPerfilUsuarioCadastroUI.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if Assigned(aController) then
    aController.Model.removeObserver(Self);
end;

procedure TFrmPerfilUsuarioCadastroUI.FormCreate(Sender: TObject);
begin
  inherited;
  aController := TPerfilController.GetInstance;
  aController.Model.addObserver(Self);
end;

initialization
  gFormulario.RegisterForm('FrmPerfilUsuarioCadastroUI', TFrmPerfilUsuarioCadastroUI);

end.
