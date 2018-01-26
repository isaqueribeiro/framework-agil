unit ViewUI.UsuarioSistemaPesquisaUI;

interface

uses
  TypeAgil.Constants,
  ViewUI.FormDefaultPesquisaUI,
  InterfaceAgil.Observer,
  Controller.Perfil,
  Controller.Usuario,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, dxBarBuiltInMenu,
  Vcl.Menus, dxSkinsdxBarPainter, dxBar, cxClasses, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxImageComboBox, cxPC, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridBandedTableView, cxGridDBBandedTableView, cxGrid,
  cxLabel, dxGDIPlusClasses, Vcl.ExtCtrls, cxGroupBox,

  dxSkinsCore, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, cxCheckBox;

type
  TFrmUsuarioSistemaPesquisaUI = class(TFormDefaultPesquisaUI)
    dbgPesquisaDBSN_ATIVO: TcxGridDBBandedColumn;
    dbgPesquisaDBSN_SISTEMA: TcxGridDBBandedColumn;
    dbgPesquisaDBDS_PERFIL: TcxGridDBBandedColumn;
    dbgPesquisaDBDS_LOGIN: TcxGridDBBandedColumn;
    dbgPesquisaDBDS_NOME: TcxGridDBBandedColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    aController : TUsuarioController;
    procedure UsuarioUsoSistema;
  public
    { Public declarations }
    procedure New; override;
    procedure Edit; override;
    procedure Delete; override;
    procedure Cancel; override;
    procedure Refresh; override;
    procedure RefreshRecord; override;

    function ExecutarPesquisa(const aAlertar : Boolean = TRUE) : Boolean; override;
  end;

var
  FrmUsuarioSistemaPesquisaUI: TFrmUsuarioSistemaPesquisaUI;

implementation

{$R *.dfm}

uses
  DataModule.Recursos,
  DataModule.Base,
  DataModule.ControleUsuario;

{ TFrmUsuarioSistemaPesquisaUI }

procedure TFrmUsuarioSistemaPesquisaUI.Cancel;
begin
  aController.Cancel(DtmControleUsuario.fdQryUsuario);
end;

procedure TFrmUsuarioSistemaPesquisaUI.Delete;
begin
  aController.RefreshRecord(DtmControleUsuario.fdQryUsuario);
  aController.Delete(DtmControleUsuario.fdQryUsuario);
end;

procedure TFrmUsuarioSistemaPesquisaUI.Edit;
begin
  aController.RefreshRecord(DtmControleUsuario.fdQryUsuario);
  if aController.Edit(DtmControleUsuario.fdQryUsuario) then
    if gFormulario.ShowModalForm(Self, FormularioCadastro) then
      aController.RefreshRecord(DtmControleUsuario.fdQryUsuario)
    else
      aController.Cancel(DtmControleUsuario.fdQryUsuario);
end;

function TFrmUsuarioSistemaPesquisaUI.ExecutarPesquisa(
  const aAlertar: Boolean): Boolean;
begin
  Result := aController.ExecuteQuery(edTipoPesquisa.ItemIndex, DtmControleUsuario.fdQryUsuario, edPesquisa.Text);
  if (not Result) and aAlertar then
    Msg.ShowInformation('Pesquisar', 'Dados não localizados!');
end;

procedure TFrmUsuarioSistemaPesquisaUI.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if Assigned(aController) then
    aController.Model.removeObserver(Self);
end;

procedure TFrmUsuarioSistemaPesquisaUI.FormCreate(Sender: TObject);
begin
  inherited;
  AbrirTabela        := True;
  FormularioCadastro := 'FrmUsuarioSistemaCadastroUI';

  aController := TUsuarioController.GetInstance;
  aController.Model.addObserver(Self);
end;

procedure TFrmUsuarioSistemaPesquisaUI.FormShow(Sender: TObject);
begin
  UsuarioUsoSistema;
  inherited;
end;

procedure TFrmUsuarioSistemaPesquisaUI.New;
begin
  aController.New(DtmControleUsuario.fdQryUsuario);
  if gFormulario.ShowModalForm(Self, FormularioCadastro) then
    aController.RefreshRecord(DtmControleUsuario.fdQryUsuario)
  else
    aController.Cancel(DtmControleUsuario.fdQryUsuario);
end;

procedure TFrmUsuarioSistemaPesquisaUI.Refresh;
begin
  aController.Refresh(DtmControleUsuario.fdQryUsuario);
end;

procedure TFrmUsuarioSistemaPesquisaUI.RefreshRecord;
begin
  aController.RefreshRecord(DtmControleUsuario.fdQryUsuario);
end;

procedure TFrmUsuarioSistemaPesquisaUI.UsuarioUsoSistema;
var
  aPerfil : TPerfilController;
begin
  aPerfil := TPerfilController.GetInstance;
  try
    // Localizar Perfil do Sistema
    if aPerfil.ExecuteQuery(TYPE_DEFAULT_QUERY_CODIGO, DtmControleUsuario.fdQryPerfil, IntToStr(CD_PERFIL_SYSTEM)) then
    begin
      // Inserir Usuário "Ágil Soluções"
      if aController.ExecuteQuery(TYPE_DEFAULT_QUERY_CODIGO, DtmControleUsuario.fdQryUsuario, SYS_USER_SYSTEM) then
      begin
        aController.Model.UsoSistema := False; // Forçar a edição do registros
        aController.Edit(DtmControleUsuario.fdQryUsuario);
      end
      else
        aController.New(DtmControleUsuario.fdQryUsuario);

      with DtmControleUsuario.fdQryUsuario do
      begin
        FieldByName('ds_login').AsString        := AnsiLowerCase(SYS_USER_SYSTEM);
        FieldByName('id_perfil').AsString       := GUIDToString(aPerfil.Model.ID);
        FieldByName('ds_primeironome').AsString := 'Ágil';
        FieldByName('ds_sobrenome').AsString    := 'Soluções';
        FieldByName('ds_senha').AsString        := SYS_PASSWD_KEY;
        FieldByName('sn_ativo').AsInteger       := FLAG_SIM;
        FieldByName('sn_sistema').AsInteger     := FLAG_SIM;
      end;

      aController.Save(DtmControleUsuario.fdQryUsuario);
      aController.ExecuteQuery(TYPE_DEFAULT_QUERY_AUTOMATICO, DtmControleUsuario.fdQryUsuario, 'ZZZ');
    end;
  finally
    aPerfil.ExecuteQuery(TYPE_DEFAULT_QUERY_CODIGO, DtmControleUsuario.fdQryPerfil, '-1');
  end;
end;

initialization
  gFormulario.RegisterForm('FrmUsuarioSistemaPesquisaUI', TFrmUsuarioSistemaPesquisaUI);

end.
