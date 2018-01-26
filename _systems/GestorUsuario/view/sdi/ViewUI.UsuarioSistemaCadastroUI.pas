unit ViewUI.UsuarioSistemaCadastroUI;

interface

uses
  TypeAgil.Constants,
  ViewUI.FormDefaultCadastroUI,
  InterfaceAgil.Observer,
  Controller.Usuario,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, Data.DB, dxCustomWizardControl,
  dxWizardControl, System.Actions, Vcl.ActnList, cxContainer, cxEdit, cxCheckBox,
  cxDBEdit, cxTextEdit, cxMaskEdit, cxLabel,

  dxSkinsCore, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox;

type
  TFrmUsuarioSistemaCadastroUI = class(TFormDefaultCadastroUI)
    lbl_dsPrimeiroNome: TcxLabel;
    dsPrimeiroNome: TcxDBTextEdit;
    dbcAtivo: TcxDBCheckBox;
    dbcUsoSistema: TcxDBCheckBox;
    lbl_dsSobreNome: TcxLabel;
    dsSobreNome: TcxDBTextEdit;
    lbl_dsLogin: TcxLabel;
    dsLogin: TcxDBTextEdit;
    lbl_idPerfil: TcxLabel;
    idPerfil: TcxDBLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dtsCadastroStateChange(Sender: TObject);
  private
    { Private declarations }
    aController : TUsuarioController;
  public
    { Public declarations }
    procedure New; override;
    procedure Edit; override;
    procedure Cancel; override;
    procedure Save; override;
    procedure RefreshRecord; override;
  end;

var
  FrmUsuarioSistemaCadastroUI: TFrmUsuarioSistemaCadastroUI;

implementation

{$R *.dfm}

uses
  DataModule.Recursos,
  DataModule.Base,
  DataModule.ControleUsuario;

{ TFrmUsuarioSistemaCadastroUI }

procedure TFrmUsuarioSistemaCadastroUI.Cancel;
begin
  aController.Cancel(DtmControleUsuario.fdQryUsuario);
end;

procedure TFrmUsuarioSistemaCadastroUI.dtsCadastroStateChange(Sender: TObject);
begin
  inherited;
  dsLogin.Properties.ReadOnly := (dtsCadastro.DataSet.State = dsEdit);
end;

procedure TFrmUsuarioSistemaCadastroUI.Edit;
begin
  if Assigned(aController) then
  begin
    aController.RefreshRecord(DtmControleUsuario.fdQryUsuario);
    aController.Edit(DtmControleUsuario.fdQryUsuario);
  end;
end;

procedure TFrmUsuarioSistemaCadastroUI.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if Assigned(aController) then
    aController.Model.removeObserver(Self);
end;

procedure TFrmUsuarioSistemaCadastroUI.FormCreate(Sender: TObject);
begin
  inherited;
  aController := TUsuarioController.GetInstance;
  aController.Model.addObserver(Self);
end;

procedure TFrmUsuarioSistemaCadastroUI.New;
begin
  if Assigned(aController) then
    aController.New(DtmControleUsuario.fdQryUsuario);
end;

procedure TFrmUsuarioSistemaCadastroUI.RefreshRecord;
begin
  if Assigned(aController) then
    aController.RefreshRecord(DtmControleUsuario.fdQryUsuario);
end;

procedure TFrmUsuarioSistemaCadastroUI.Save;
begin
  if Assigned(aController) then
    if not RequiredFields(Self, 'Usuário do Sistema') then
      aController.Save(DtmControleUsuario.fdQryUsuario);
end;

initialization
  gFormulario.RegisterForm('FrmUsuarioSistemaCadastroUI', TFrmUsuarioSistemaCadastroUI);

end.
