unit ViewUI.RotinaSistemaPesquisaUI;

interface

uses
  TypeAgil.Constants,
  ViewUI.FormDefaultPesquisaUI,
  InterfaceAgil.Observer,
  Controller.Rotina,
//  Controller.Perfil,
//  Controller.Usuario,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
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
  TFrmRotinaSistemaPesquisaUI = class(TFormDefaultPesquisaUI)
    dbtPesquisaDB: TcxDBTreeList;
    dbtPesquisaDBNM_ROTINA: TcxDBTreeListColumn;
    dbtPesquisaDBSN_ATIVO: TcxDBTreeListColumn;
    dbtPesquisaDBSN_RESTRINGIR_CAMPO: TcxDBTreeListColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbtPesquisaDBKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgPesquisaEnter(Sender: TObject);
  private
    { Private declarations }
    aController : TRotinaController;
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
  FrmRotinaSistemaPesquisaUI: TFrmRotinaSistemaPesquisaUI;

implementation

{$R *.dfm}

uses
  DataModule.Recursos,
  DataModule.Base,
  DataModule.ControleUsuario;

{ TFrmRotinaSistemaPesquisaUI }

procedure TFrmRotinaSistemaPesquisaUI.Cancel;
begin
  if Assigned(aController) then
    aController.Cancel(DtmControleUsuario.fdQryRotinaSistema);
end;

procedure TFrmRotinaSistemaPesquisaUI.dbgPesquisaEnter(Sender: TObject);
begin
  if dbtPesquisaDB.Visible and dbtPesquisaDB.Enabled then
    dbtPesquisaDB.SetFocus;
end;

procedure TFrmRotinaSistemaPesquisaUI.dbtPesquisaDBKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DELETE) then
    Self.Delete;
end;

procedure TFrmRotinaSistemaPesquisaUI.Delete;
begin
  if Assigned(aController) then
  begin
    try
      aController.Find(EmptyStr, DtmControleUsuario.fdQryRotinaSistema);
    except
    end;
    aController.ClearFieldsRestinctions(Self, DtmControleUsuario.fdQryRotinaSistema, True);
    aController.RefreshRecord(DtmControleUsuario.fdQryRotinaSistema);
  end;
end;

procedure TFrmRotinaSistemaPesquisaUI.Edit;
begin
  ;
end;

function TFrmRotinaSistemaPesquisaUI.ExecutarPesquisa(
  const aAlertar: Boolean): Boolean;
begin
  Result := aController.ExecuteQuery(edTipoPesquisa.ItemIndex, DtmControleUsuario.fdQryRotinaSistema, edPesquisa.Text);
  if (not Result) and aAlertar then
    Msg.ShowInformation('Pesquisar', 'Dados não localizados!')
  else
    dbtPesquisaDB.FullExpand;
end;

procedure TFrmRotinaSistemaPesquisaUI.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
//  if Assigned(aController) then
//    aController.Model.removeObserver(Self);
end;

procedure TFrmRotinaSistemaPesquisaUI.FormCreate(Sender: TObject);
begin
  inherited;
  AbrirTabela := True;

  aController := TRotinaController.Create;
  //aController.Model.addObserver(Self);
  dbtPesquisaDB.Align := alClient;
end;

procedure TFrmRotinaSistemaPesquisaUI.New;
begin
  ;
end;

procedure TFrmRotinaSistemaPesquisaUI.Refresh;
begin
  if Assigned(aController) then
    aController.Refresh(DtmControleUsuario.fdQryRotinaSistema);
end;

procedure TFrmRotinaSistemaPesquisaUI.RefreshRecord;
begin
  if Assigned(aController) then
    aController.RefreshRecord(DtmControleUsuario.fdQryRotinaSistema);
end;

initialization
  gFormulario.RegisterForm('FrmRotinaSistemaPesquisaUI', TFrmRotinaSistemaPesquisaUI);

end.
