unit ViewUI.UsuarioSistemaPesquisaUI;

interface

uses
  TypeAgil.Constants,
  ViewUI.FormDefaultPesquisaUI,
  InterfaceAgil.Observer,
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
  dxSkinOffice2013White;

type
  TFrmUsuarioSistemaPesquisaUI = class(TFormDefaultPesquisaUI)
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

procedure TFrmUsuarioSistemaPesquisaUI.UsuarioUsoSistema;
begin
  ;
end;

initialization
  gFormulario.RegisterForm('FrmUsuarioSistemaPesquisaUI', TFrmUsuarioSistemaPesquisaUI);

end.
