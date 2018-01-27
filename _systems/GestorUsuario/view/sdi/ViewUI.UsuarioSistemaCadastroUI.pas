unit ViewUI.UsuarioSistemaCadastroUI;

interface

uses
  TypeAgil.Constants,
  ViewUI.FormDefaultCadastroUI,
  InterfaceAgil.Observer,
  Controller.Perfil,
  Controller.Usuario,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, Data.DB, dxCustomWizardControl,
  dxWizardControl, System.Actions, Vcl.ActnList, cxContainer, cxEdit, cxCheckBox,
  cxDBEdit, cxTextEdit, cxMaskEdit, cxLabel, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox,

  dxSkinsCore, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White;

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
    dtsPerfil: TDataSource;
    dsSenha: TcxTextEdit;
    lbl_dsSenha: TcxLabel;
    snAlterarSenha: TcxDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dtsCadastroStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    aController : TUsuarioController;
    procedure CarregarPerfis;
    procedure LimparCampoSenha;
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
  LimparCampoSenha;
end;

procedure TFrmUsuarioSistemaCadastroUI.CarregarPerfis;
var
  aPerfil : TPerfilController;
begin
  aPerfil := TPerfilController.GetInstance;
  aPerfil.ExecuteQuery(TYPE_DEFAULT_QUERY_DESCRITIVA, DtmControleUsuario.fdQryPerfil, EmptyStr)
end;

procedure TFrmUsuarioSistemaCadastroUI.dtsCadastroStateChange(Sender: TObject);
begin
  inherited;
  dsLogin.Properties.ReadOnly := (dtsCadastro.DataSet.State = dsEdit);
  dsSenha.Properties.ReadOnly := not (dtsCadastro.DataSet.State in [dsEdit, dsInsert]);
end;

procedure TFrmUsuarioSistemaCadastroUI.Edit;
begin
  if Assigned(aController) then
  begin
    aController.RefreshRecord(DtmControleUsuario.fdQryUsuario);
    aController.Edit(DtmControleUsuario.fdQryUsuario);
    LimparCampoSenha;
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

procedure TFrmUsuarioSistemaCadastroUI.FormShow(Sender: TObject);
begin
  inherited;
  LimparCampoSenha;
  CarregarPerfis;
  if (wcCadastro.ActivePage = pgNominal) then
    if dsLogin.Visible and dsLogin.Enabled then
      dsLogin.SetFocus;
end;

procedure TFrmUsuarioSistemaCadastroUI.LimparCampoSenha;
begin
  dsSenha.Text := EmptyStr;
end;

procedure TFrmUsuarioSistemaCadastroUI.New;
begin
  if Assigned(aController) then
  begin
    aController.New(DtmControleUsuario.fdQryUsuario);
    LimparCampoSenha;
  end;
end;

procedure TFrmUsuarioSistemaCadastroUI.RefreshRecord;
begin
  if Assigned(aController) then
  begin
    aController.RefreshRecord(DtmControleUsuario.fdQryUsuario);
    LimparCampoSenha;
  end;
end;

procedure TFrmUsuarioSistemaCadastroUI.Save;
begin
  if Assigned(aController) then
    if not RequiredFields(Self, 'Usuário do Sistema') then
    begin
      aController.Model.Senha := Trim(dsSenha.Text);
      aController.Save(DtmControleUsuario.fdQryUsuario);
      LimparCampoSenha;
    end;
end;

initialization
  gFormulario.RegisterForm('FrmUsuarioSistemaCadastroUI', TFrmUsuarioSistemaCadastroUI);

end.
