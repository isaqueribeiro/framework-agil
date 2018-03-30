unit ViewUI.PermissaoAcessoPesquisaUI;

interface

uses
  TypeAgil.Constants,
  TypeAgil.ComplexTypes,
  ViewUI.FormDefaultPesquisaUI,
//  InterfaceAgil.Observer,
  Controller.Perfil,
  Controller.Perfil.Permissao,
//  Controller.Usuario,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, dxBarBuiltInMenu,
  Vcl.Menus, dxSkinsdxBarPainter, dxBar, cxClasses, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxImageComboBox, cxPC, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridBandedTableView, cxGridDBBandedTableView, cxGrid,
  cxLabel, dxGDIPlusClasses, Vcl.ExtCtrls, cxGroupBox, cxCheckBox, cxTL,
  cxTLdxBarBuiltInMenu, cxInplaceContainer, cxTLData, cxDBTL,

  dxSkinsCore, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White;

type
  TFrmPermissaoAcessoPesquisaUI = class(TFormDefaultPesquisaUI)
    pnlPesquisaDB: TPanel;
    dbtPerfilUsuarioDB: TcxDBTreeList;
    dbtPesquisaDBNM_ROTINA: TcxDBTreeListColumn;
    dbtPesquisaDBSN_ATIVO: TcxDBTreeListColumn;
    dbtPesquisaDBSN_SISTEMA: TcxDBTreeListColumn;
    sptPesquisaDB: TSplitter;
    dtsPermissao: TDataSource;
    pnlPesquisaDBPermissao: TPanel;
    dbtPermissaoDB: TcxDBTreeList;
    dbtPermissaoDBcxDBtColumnDESCRIPTION: TcxDBTreeListColumn;
    dbtPermissaoDBcxDBColumnTP_PERMISSAO: TcxDBTreeListColumn;
    grpPesquisaDBPermissao: TcxGroupBox;
    edPesquisaDBPermissao: TcxTextEdit;
    Bevel1: TBevel;
    acnRemoverPermissao: TAction;
    BrBtnRemoverPermissao: TdxBarButton;
    procedure FormCreate(Sender: TObject);
    procedure acnPesquisarExecute(Sender: TObject);
    procedure dbtPerfilUsuarioDBClick(Sender: TObject);
    procedure dbtPerfilUsuarioDBKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure acnRemoverPermissaoExecute(Sender: TObject);
  private
    { Private declarations }
    aControllerPerfil    : TPerfilController;
    aControllerPermissao : TPermissaoPerfilController;
  public
    { Public declarations }
    procedure New; override;
    procedure Edit; override;
    procedure Delete; override;
    procedure Cancel; override;
    procedure Refresh; override;
    procedure RefreshRecord; override;
    procedure ExportData; override;
    procedure CarregarPermissaoAcesso;

    function ExecutarPesquisa(const aAlertar : Boolean = TRUE) : Boolean; override;
  end;

var
  FrmPermissaoAcessoPesquisaUI: TFrmPermissaoAcessoPesquisaUI;

implementation

uses
  cxGridExportLink,
  DataModule.Recursos,
  DataModule.Base,
  DataModule.ControleUsuario;

{$R *.dfm}

procedure TFrmPermissaoAcessoPesquisaUI.acnPesquisarExecute(Sender: TObject);
begin
  inherited;
  dbtPerfilUsuarioDB.SetFocus;
end;

procedure TFrmPermissaoAcessoPesquisaUI.acnRemoverPermissaoExecute(
  Sender: TObject);
begin
  if Assigned(aControllerPermissao) then
    with aControllerPermissao, dtsPesquisa.DataSet do
      if (FieldByName('sn_perfil').AsInteger = 1) then
      begin
        CarregarPermissaoAcesso;
        Model.Perfil.ID         := StringToGUID(FieldByName('id_perfil').AsString);
        Model.Perfil.Codigo     := FieldByName('cd_perfil').AsInteger;
        Model.Perfil.Descricao  := FieldByName('ds_perfil').AsString;
        Model.Perfil.Ativo      := (FieldByName('sn_ativo').AsInteger = FLAG_SIM);
        Model.Perfil.UsoSistema := (FieldByName('sn_sistema').AsInteger = FLAG_SIM);
        RemoverPermissoes(DtmControleUsuario.fdQryPermissaoAcesso);
      end;
end;

procedure TFrmPermissaoAcessoPesquisaUI.Cancel;
begin
  ;
end;

procedure TFrmPermissaoAcessoPesquisaUI.CarregarPermissaoAcesso;
var
  aRetorno : Boolean;
begin
  grpPesquisaDBPermissao.Caption := '  Perfil / Usuário : ?';
  edPesquisaDBPermissao.Text     := EmptyStr;
  if Assigned(aControllerPerfil) then
    with DtmControleUsuario do
    begin
      aControllerPerfil.CarregarDados(dtsPesquisa.DataSet);

      if (dtsPesquisa.DataSet.FieldByName('sn_perfil').AsInteger = 1) then
        grpPesquisaDBPermissao.Caption := '  Perfil :'
      else
        grpPesquisaDBPermissao.Caption := '  Usuário :';

      edPesquisaDBPermissao.Text := dtsPesquisa.DataSet.FieldByName('description').AsString;

      aRetorno := aControllerPermissao.ExecuteQuery(
          (dtsPesquisa.DataSet.FieldByName('sn_perfil').AsInteger = 1)
        , fdQryPermissaoAcesso
        , GUIDToString(aControllerPerfil.Model.ID));

      if aRetorno then
        dbtPermissaoDB.FullExpand;
    end;
end;

procedure TFrmPermissaoAcessoPesquisaUI.dbtPerfilUsuarioDBClick(
  Sender: TObject);
begin
  CarregarPermissaoAcesso;
end;

procedure TFrmPermissaoAcessoPesquisaUI.dbtPerfilUsuarioDBKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
    CarregarPermissaoAcesso;
end;

procedure TFrmPermissaoAcessoPesquisaUI.Delete;
begin
  ;
end;

procedure TFrmPermissaoAcessoPesquisaUI.Edit;
begin
  ;
end;

function TFrmPermissaoAcessoPesquisaUI.ExecutarPesquisa(
  const aAlertar: Boolean): Boolean;
begin
  Result := aControllerPerfil.PesquisarPerfilUsuario(edTipoPesquisa.ItemIndex, DtmControleUsuario.fdQryPerfilUsuario, edPesquisa.Text);
  if (not Result) and aAlertar then
    Msg.ShowInformation('Pesquisar', 'Dados não localizados!')
  else
    dbtPerfilUsuarioDB.FullExpand;
end;

procedure TFrmPermissaoAcessoPesquisaUI.ExportData;
begin
  ;
end;

procedure TFrmPermissaoAcessoPesquisaUI.FormCreate(Sender: TObject);
begin
  inherited;
  AbrirTabela := True;

  aControllerPerfil    := TPerfilController.Create;
  aControllerPermissao := TPermissaoPerfilController.Create;
  pnlPesquisaDB.Align  := alClient;
end;

procedure TFrmPermissaoAcessoPesquisaUI.New;
begin
  ;
end;

procedure TFrmPermissaoAcessoPesquisaUI.Refresh;
begin
  if Assigned(aControllerPerfil) then
    aControllerPerfil.Refresh(DtmControleUsuario.fdQryPerfilUsuario);
  if Assigned(aControllerPermissao) then
    aControllerPermissao.Refresh(DtmControleUsuario.fdQryPermissaoAcesso);
end;

procedure TFrmPermissaoAcessoPesquisaUI.RefreshRecord;
begin
  if dbtPerfilUsuarioDB.Focused then
    if Assigned(aControllerPerfil) then
      aControllerPerfil.RefreshRecord(DtmControleUsuario.fdQryPerfilUsuario);

  if dbtPermissaoDB.Focused then
    if Assigned(aControllerPermissao) then
      aControllerPermissao.RefreshRecord(DtmControleUsuario.fdQryPermissaoAcesso);
end;

initialization
  gFormulario.RegisterForm('FrmPermissaoAcessoPesquisaUI', TFrmPermissaoAcessoPesquisaUI);

end.
