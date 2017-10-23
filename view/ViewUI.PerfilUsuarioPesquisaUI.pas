unit ViewUI.PerfilUsuarioPesquisaUI;

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
  cxLabel, dxGDIPlusClasses, Vcl.ExtCtrls,

  dxSkinsCore, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White;

type
  TFrmPerfilUsuarioPesquisaUI = class(TFormDefaultPesquisaUI)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPerfilUsuarioPesquisaUI: TFrmPerfilUsuarioPesquisaUI;

implementation

{$R *.dfm}

uses
  DataModule.Base, DataModule.Recursos;

initialization
  gFormulario.RegisterForm('FrmPerfilUsuarioPesquisaUI', TFrmPerfilUsuarioPesquisaUI);

end.
