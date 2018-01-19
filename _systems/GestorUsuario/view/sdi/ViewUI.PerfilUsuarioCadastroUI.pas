unit ViewUI.PerfilUsuarioCadastroUI;

interface

uses
  TypeAgil.Constants,
  ViewUI.FormDefaultCadastroUI,
  InterfaceAgil.Observer,
  Controller.Perfil,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, Data.DB, dxCustomWizardControl,
  dxWizardControl, System.Actions, Vcl.ActnList, cxContainer, cxEdit, cxCheckBox,
  cxDBEdit, cxTextEdit, cxMaskEdit, cxLabel,

  dxSkinsCore, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White;

type
  TFrmPerfilUsuarioCadastroUI = class(TFormDefaultCadastroUI)
    lbl_cdPerfil: TcxLabel;
    cdPerfil: TcxDBMaskEdit;
    dsPerfil: TcxDBTextEdit;
    lbl_dsPerfil: TcxLabel;
    dbcAtivo: TcxDBCheckBox;
    dbcUsoSistema: TcxDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    aController : TPerfilController;
  public
    { Public declarations }
    procedure New; override;
    procedure Edit; override;
    procedure Cancel; override;
    procedure Save; override;
    procedure RefreshRecord; override;
  end;

var
  FrmPerfilUsuarioCadastroUI: TFrmPerfilUsuarioCadastroUI;

implementation

{$R *.dfm}

uses
  DataModule.Recursos,
  DataModule.Base,
  DataModule.ControleUsuario;

procedure TFrmPerfilUsuarioCadastroUI.Cancel;
begin
  aController.Cancel(DtmControleUsuario.fdQryPerfil);
end;

procedure TFrmPerfilUsuarioCadastroUI.Edit;
begin
  if Assigned(aController) then
  begin
    aController.RefreshRecord(DtmControleUsuario.fdQryPerfil);
    aController.Edit(DtmControleUsuario.fdQryPerfil);
  end;
end;

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

procedure TFrmPerfilUsuarioCadastroUI.New;
begin
  if Assigned(aController) then
    aController.New(DtmControleUsuario.fdQryPerfil);
end;

procedure TFrmPerfilUsuarioCadastroUI.RefreshRecord;
begin
  if Assigned(aController) then
    aController.RefreshRecord(DtmControleUsuario.fdQryPerfil);
end;

procedure TFrmPerfilUsuarioCadastroUI.Save;
begin
  if Assigned(aController) then
    if not RequiredFields(Self, 'Perfil de Usuário') then
      aController.Save(DtmControleUsuario.fdQryPerfil);
//  if Assigned(aController) then
//  begin
//
// Este código abaixo é apenas para exemplificar quando a inserção dos dados é pelo Model do Controller.
//
//    aController.Model.Codigo     := dbeCodigo.DataBinding.Field.AsInteger;
//    aController.Model.Descricao  := Trim(dbeDescricao.DataBinding.Field.AsString);
//    aController.Model.Ativo      := (dbcAtivo.DataBinding.Field.AsInteger = FLAG_SIM);
//    aController.Model.UsoSistema := (dbcUsoSistema.DataBinding.Field.AsInteger = FLAG_SIM);
//    aController.Save(DtmControleUsuario.fdQryPerfil);
//  end;
end;

initialization
  gFormulario.RegisterForm('FrmPerfilUsuarioCadastroUI', TFrmPerfilUsuarioCadastroUI);

end.
