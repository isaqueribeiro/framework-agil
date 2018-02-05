unit ViewUI.RotinaSistemaPesquisaUI;

interface

uses
  TypeAgil.Constants,
  ViewUI.FormDefaultPesquisaUI,
  InterfaceAgil.Observer,
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
    dbgPesquisaDBColumn1: TcxGridDBBandedColumn;
    dbgPesquisaDBColumn2: TcxGridDBBandedColumn;
    dbgPesquisaDBColumn3: TcxGridDBBandedColumn;
    dbtPesquisaDB: TcxDBTreeList;
    cxDBTreeList1cxDBTreeListColumn1: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn2: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn3: TcxDBTreeListColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
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

function TFrmRotinaSistemaPesquisaUI.ExecutarPesquisa(
  const aAlertar: Boolean): Boolean;
begin
  DtmControleUsuario.fdQryRotinaSistema.Open;
end;

procedure TFrmRotinaSistemaPesquisaUI.FormCreate(Sender: TObject);
begin
  inherited;
  AbrirTabela        := True;
//  FormularioCadastro := 'FrmUsuarioSistemaCadastroUI';
//
//  aController := TUsuarioController.GetInstance;
//  aController.Model.addObserver(Self);
end;

initialization
  gFormulario.RegisterForm('FrmRotinaSistemaPesquisaUI', TFrmRotinaSistemaPesquisaUI);

end.
