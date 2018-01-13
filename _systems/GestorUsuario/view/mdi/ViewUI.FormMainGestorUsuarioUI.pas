unit ViewUI.FormMainGestorUsuarioUI;

interface

uses
  DataModule.Recursos,
  ViewUI.FormMainUI,
  Controller.Rotina,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.StdActns, System.Actions, Vcl.ActnList, Vcl.Imaging.pngimage, Vcl.Menus,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxStatusBar, cxClasses,
  dxBar, dxNavBar, dxRibbonSkins, dxSkinsdxRibbonPainter, dxRibbonCustomizationForm,
  dxRibbon, dxNavBarBase, dxNavBarCollns, dxRibbonBackstageView, cxContainer,
  cxEdit, cxLabel, cxPC, dxBarBuiltInMenu, dxTabbedMDI,

  dxSkinsCore, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinsdxStatusBarPainter, dxSkinsdxBarPainter,
  dxSkinscxPCPainter, dxSkinsdxNavBarPainter;

type
  TFormMainGestorUsuarioUI = class(TFormMainUI)
    BrBtnPerfilUsuario: TdxBarLargeButton;
    nvbMenu: TdxNavBar;
    nvbGrpCadastro: TdxNavBarGroup;
    nvbCadastroPerfilUsuario: TdxNavBarItem;
    nvbCadastroUsuario: TdxNavBarItem;
    brnAcessoRapido: TdxBar;
    rbvConfigurarCertificado: TdxRibbonBackstageViewTabSheet;
    lblConfigurarCertificado: TcxLabel;
    rbvConfigurarEmpresa: TdxRibbonBackstageViewTabSheet;
    lblConfigurarEmpresa: TcxLabel;
    acnTeste: TAction;
    BrBtnTeste: TdxBarButton;
    nvbCadastroPermissaoAcesso: TdxNavBarItem;
    procedure acnTesteExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMainGestorUsuarioUI: TFormMainGestorUsuarioUI;

implementation

{$R *.dfm}

procedure TFormMainGestorUsuarioUI.acnTesteExecute(Sender: TObject);
begin
//  SetRotina;
  ShowMessage( RotinaController.Model.Nome + ' - ' + RotinaController.Model.Descricao );
//  ShowMessage( Rotina.Nome + ' - ' + Rotina.Descricao );
end;

procedure TFormMainGestorUsuarioUI.FormCreate(Sender: TObject);
begin
  inherited;
  ;
end;

end.
