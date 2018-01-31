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
  cxLabel, dxGDIPlusClasses, Vcl.ExtCtrls, cxGroupBox, cxCheckBox,

  dxSkinsCore, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White;

type
  TFrmRotinaSistemaPesquisaUI = class(TFormDefaultPesquisaUI)
    dbgPesquisaDBID: TcxGridDBBandedColumn;
    dbgPesquisaDBID_ROTINA: TcxGridDBBandedColumn;
    dbgPesquisaDBSN_ATIVO: TcxGridDBBandedColumn;
    dbgPesquisaDBNM_SISTEMA: TcxGridDBBandedColumn;
    dbgPesquisaDBNM_ROTINA: TcxGridDBBandedColumn;
    dbgPesquisaDBIX_ROTINA: TcxGridDBBandedColumn;
    dbgPesquisaDBID_MESTRE: TcxGridDBBandedColumn;
    dbgPesquisaDBSN_RESTRINGIR_CAMPO: TcxGridDBBandedColumn;
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
