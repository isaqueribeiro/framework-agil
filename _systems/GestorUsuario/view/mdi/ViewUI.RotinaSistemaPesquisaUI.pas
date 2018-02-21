unit ViewUI.RotinaSistemaPesquisaUI;

interface

uses
  TypeAgil.Constants,
  TypeAgil.ComplexTypes,
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
    procedure ExportData; override;

    function ExecutarPesquisa(const aAlertar : Boolean = TRUE) : Boolean; override;
  end;

var
  FrmRotinaSistemaPesquisaUI: TFrmRotinaSistemaPesquisaUI;

implementation

{$R *.dfm}

uses
  cxGridExportLink,
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
    Self.Delete
  else
  if (Key = VK_F2) then
    Self.Edit
  else
  if (Key = VK_RETURN) then
  begin
    try
      aController.CarregarDados(DtmControleUsuario.fdQryRotinaSistema);
    except
    end;
    if aController.Model.Cadastro then
      gFormulario.ShowModalForm(Self, aController.Model.Codigo);
  end;
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
  if Assigned(aController) then
  begin
    try
      aController.Find(EmptyStr, DtmControleUsuario.fdQryRotinaSistema);
    except
    end;
    aController.SetFieldRestinction(Self, DtmControleUsuario.fdQryRotinaSistema, True);
    aController.RefreshRecord(DtmControleUsuario.fdQryRotinaSistema);
    if aController.Model.Cadastro then
      gFormulario.ShowModalForm(Self, aController.Model.Codigo);
  end;
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

procedure TFrmRotinaSistemaPesquisaUI.ExportData;
//var
//  aFileName : String;
//  aExtensao : ct_ExtensaoFileExport;
begin
//  if Assigned(dtsPesquisa.DataSet) then
//    if ExportTable(Self, aFileName, aExtensao) then
//      Case aExtensao of
//        efe_XLS  : ExportGridToExcel(aFileName + '.xls',  dbgPesquisa);
//        efe_XLSX : ExportGridToXLSX(aFileName  + '.xlsx', dbgPesquisa);
//        efe_TXT  : ExportGridToText(aFileName  + '.txt',  dbgPesquisa);
//        efe_XML  : ExportGridToXML(aFileName   + '.xml',  dbgPesquisa);
//      end;
end;

procedure TFrmRotinaSistemaPesquisaUI.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
//  Esta rotina está fazendo o objeto ser destruído antes do tempo
//  Funcionará se o padrão do Controller for Singleton, que não se aplica a este caso
//
//  if Assigned(aController) then
//    aController.Model.removeObserver(Self);
end;

procedure TFrmRotinaSistemaPesquisaUI.FormCreate(Sender: TObject);
begin
  inherited;
  AbrirTabela := True;

  aController := TRotinaController.Create;
  dbtPesquisaDB.Align := alClient;
//  Esta rotina está fazendo o objeto ser destruído antes do tempo
//  Funcionará se o padrão do Controller for Singleton, que não se aplica a este caso
//
//  aController.Model.addObserver(Self);
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
