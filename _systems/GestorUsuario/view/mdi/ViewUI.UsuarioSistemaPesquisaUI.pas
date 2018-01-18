unit ViewUI.UsuarioSistemaPesquisaUI;

interface

uses
  ViewUI.FormDefaultPesquisaUI,

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
  private
    { Private declarations }
  public
    { Public declarations }
    function ExecutarPesquisa(const aAlertar : Boolean = TRUE) : Boolean; override;
  end;

var
  FrmUsuarioSistemaPesquisaUI: TFrmUsuarioSistemaPesquisaUI;

implementation

{$R *.dfm}

uses
  DataModule.Base, DataModule.Recursos;

{ TFrmUsuarioSistemaPesquisaUI }

function TFrmUsuarioSistemaPesquisaUI.ExecutarPesquisa(
  const aAlertar: Boolean): Boolean;
begin
//  Result := aController.ExecuteQuery(edTipoPesquisa.ItemIndex, DtmControleUsuario.fdQryPerfil, edPesquisa.Text);
  Result := False;
  if (not Result) and aAlertar then
    ShowInforme(Self, 'Pesquisar', 'Dados não localizados!');
end;

initialization
  gFormulario.RegisterForm('FrmUsuarioSistemaPesquisaUI', TFrmUsuarioSistemaPesquisaUI);

end.
