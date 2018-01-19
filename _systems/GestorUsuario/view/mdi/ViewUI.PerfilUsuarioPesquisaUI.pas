unit ViewUI.PerfilUsuarioPesquisaUI;

interface

uses
  TypeAgil.Constants,
  ViewUI.FormDefaultPesquisaUI,
  InterfaceAgil.Observer,
  Controller.Perfil,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, dxBarBuiltInMenu,
  Vcl.Menus, dxSkinsdxBarPainter, dxBar, cxClasses, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxImageComboBox, cxPC, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridBandedTableView, cxGridDBBandedTableView, cxGrid,
  cxLabel, dxGDIPlusClasses, Vcl.ExtCtrls, cxGroupBox, cxCheckBox,

  dxSkinsCore, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White;

type
  TFrmPerfilUsuarioPesquisaUI = class(TFormDefaultPesquisaUI, IObservador)
    dbgPesquisaDBCD_PERFIL: TcxGridDBBandedColumn;
    dbgPesquisaDBDS_PERFIL: TcxGridDBBandedColumn;
    dbgPesquisaDBSN_SISTEMA: TcxGridDBBandedColumn;
    dbgPesquisaDBSN_ATIVO: TcxGridDBBandedColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    aController : TPerfilController;
    procedure PerfilUsoSistema;
  public
    { Public declarations }
    procedure New; override;
    procedure Edit; override;
    procedure Delete; override;
    procedure Cancel; override;
    procedure Refresh; override;

    function ExecutarPesquisa(const aAlertar : Boolean = TRUE) : Boolean; override;
  end;

var
  FrmPerfilUsuarioPesquisaUI: TFrmPerfilUsuarioPesquisaUI;

implementation

{$R *.dfm}

uses
  DataModule.Recursos,
  DataModule.Base,
  DataModule.ControleUsuario;

procedure TFrmPerfilUsuarioPesquisaUI.Cancel;
begin
  aController.Cancel(DtmControleUsuario.fdQryPerfil);
end;

procedure TFrmPerfilUsuarioPesquisaUI.Delete;
begin
  aController.RefreshRecord(DtmControleUsuario.fdQryPerfil);
  aController.Delete(DtmControleUsuario.fdQryPerfil);
end;

procedure TFrmPerfilUsuarioPesquisaUI.Edit;
begin
  aController.RefreshRecord(DtmControleUsuario.fdQryPerfil);
  if aController.Edit(DtmControleUsuario.fdQryPerfil) then
    if gFormulario.ShowModalForm(Self, FormularioCadastro) then
      aController.RefreshRecord(DtmControleUsuario.fdQryPerfil)
    else
      aController.Cancel(DtmControleUsuario.fdQryPerfil);
end;

function TFrmPerfilUsuarioPesquisaUI.ExecutarPesquisa(
  const aAlertar: Boolean): Boolean;
begin
  Result := aController.ExecuteQuery(edTipoPesquisa.ItemIndex, DtmControleUsuario.fdQryPerfil, edPesquisa.Text);
  if (not Result) and aAlertar then
    Msg.ShowInformation('Pesquisar', 'Dados não localizados!');
end;

procedure TFrmPerfilUsuarioPesquisaUI.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if Assigned(aController) then
    aController.Model.removeObserver(Self);
end;

procedure TFrmPerfilUsuarioPesquisaUI.FormCreate(Sender: TObject);
begin
  inherited;
  AbrirTabela        := True;
  FormularioCadastro := 'FrmPerfilUsuarioCadastroUI';

  aController := TPerfilController.GetInstance;
  aController.Model.addObserver(Self);
end;

procedure TFrmPerfilUsuarioPesquisaUI.FormShow(Sender: TObject);
begin
  PerfilUsoSistema;
  inherited;
end;

procedure TFrmPerfilUsuarioPesquisaUI.New;
begin
  aController.New(DtmControleUsuario.fdQryPerfil);
  if gFormulario.ShowModalForm(Self, FormularioCadastro) then
    aController.RefreshRecord(DtmControleUsuario.fdQryPerfil)
  else
    aController.Cancel(DtmControleUsuario.fdQryPerfil);
end;

procedure TFrmPerfilUsuarioPesquisaUI.PerfilUsoSistema;
begin
  // Inserir Perfil "Administrador do Sistema"
  if aController.ExecuteQuery(TYPE_DEFAULT_QUERY_CODIGO, DtmControleUsuario.fdQryPerfil, IntToStr(CD_PERFIL_SYSTEM)) then
    aController.Edit(DtmControleUsuario.fdQryPerfil)
  else
    aController.New(DtmControleUsuario.fdQryPerfil);

  with DtmControleUsuario.fdQryPerfil do
  begin
    FieldByName('cd_perfil').AsInteger  := CD_PERFIL_SYSTEM;
    FieldByName('ds_perfil').AsString   := 'Administrador do Sistema';
    FieldByName('sn_ativo').AsInteger   := FLAG_SIM;
    FieldByName('sn_sistema').AsInteger := FLAG_SIM;
  end;

  // Inserir Perfil "Suporte DTI"
  if aController.ExecuteQuery(TYPE_DEFAULT_QUERY_CODIGO, DtmControleUsuario.fdQryPerfil, IntToStr(CD_PERFIL_SUPORTE)) then
    aController.Edit(DtmControleUsuario.fdQryPerfil)
  else
    aController.New(DtmControleUsuario.fdQryPerfil);

  with DtmControleUsuario.fdQryPerfil do
  begin
    FieldByName('cd_perfil').AsInteger  := CD_PERFIL_SUPORTE;
    FieldByName('ds_perfil').AsString   := 'Suporte DTI';
    FieldByName('sn_ativo').AsInteger   := FLAG_SIM;
    FieldByName('sn_sistema').AsInteger := FLAG_SIM;
  end;

  aController.Save(DtmControleUsuario.fdQryPerfil);
end;

procedure TFrmPerfilUsuarioPesquisaUI.Refresh;
begin
  aController.Refresh(DtmControleUsuario.fdQryPerfil);
end;

initialization
  gFormulario.RegisterForm('FrmPerfilUsuarioPesquisaUI', TFrmPerfilUsuarioPesquisaUI);

end.
