unit ViewUI.PerfilUsuarioPesquisaUI;

interface

uses
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
  private
    { Private declarations }
    aController : TPerfilController;
  public
    { Public declarations }
    procedure New; override;
    procedure Edit; override;
    procedure Cancel; override;
    procedure Delete; override;
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
  //aController.Edit(DtmControleUsuario.fdQryPerfil);
end;

procedure TFrmPerfilUsuarioPesquisaUI.Edit;
begin
  aController.RefreshRecord(DtmControleUsuario.fdQryPerfil);
  //aController.Edit(DtmControleUsuario.fdQryPerfil);
end;

function TFrmPerfilUsuarioPesquisaUI.ExecutarPesquisa(
  const aAlertar: Boolean): Boolean;
begin
  Result := aController.ExecuteQuery(edTipoPesquisa.ItemIndex, DtmControleUsuario.fdQryPerfil, edPesquisa.Text);
  if (not Result) and aAlertar then
    ShowInforme(Self, 'Pesquisar', 'Dados não localizados!');
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
  AbrirTabela := True;
  aController := TPerfilController.GetInstance;
  aController.Model.addObserver(Self);
end;

procedure TFrmPerfilUsuarioPesquisaUI.New;
begin
  aController.New(DtmControleUsuario.fdQryPerfil);
  if gFormulario.ShowModalForm(Self, 'FrmPerfilUsuarioCadastroUI') then
    aController.RefreshRecord(DtmControleUsuario.fdQryPerfil)
  else
    aController.Cancel(DtmControleUsuario.fdQryPerfil);
end;

procedure TFrmPerfilUsuarioPesquisaUI.Refresh;
begin
  aController.Refresh(DtmControleUsuario.fdQryPerfil);
end;

initialization
  gFormulario.RegisterForm('FrmPerfilUsuarioPesquisaUI', TFrmPerfilUsuarioPesquisaUI);

end.
