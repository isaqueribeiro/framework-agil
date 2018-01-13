unit ViewUI.FormMainUI;

interface

uses
  DataModule.Recursos,
  ViewUI.FormDefaultUI,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  System.Actions, Vcl.ActnList, Vcl.StdActns, Vcl.Menus, Vcl.StdCtrls, cxClasses,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxNavBar, dxStatusBar,
  dxBar, dxRibbonSkins, dxSkinsdxRibbonPainter, dxRibbonCustomizationForm, dxRibbon,
  dxNavBarBase, dxNavBarCollns,

  dxSkinsCore, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinsdxStatusBarPainter, dxSkinsdxBarPainter,
  dxRibbonBackstageView, cxPC, dxSkinscxPCPainter, dxBarBuiltInMenu, dxTabbedMDI;

type
  TFormMainUI = class(TFormDefaultUI)
    PnlStatusBar: TPanel;
    PnlDate: TPanel;
    PnlTime: TPanel;
    PnlUser: TPanel;
    BvlStatusBar: TBevel;
    PnlCompany: TPanel;
    ImgCompany: TImage;
    LblCompany: TLabel;
    ImgUser: TImage;
    LblUser: TLabel;
    TmrContador: TTimer;
    ImgTime: TImage;
    LblTime: TLabel;
    ImgDate: TImage;
    LblDate: TLabel;
    stbInforme: TdxStatusBar;
    brnMenu: TdxBarManager;
    rbbMenuSistema: TdxRibbonTab;
    rbbMenu: TdxRibbon;
    acnMenu: TActionList;
    acnCadastroPerfilUsuario: TAction;
    acnCadastroUsuario: TAction;
    rbvMenu: TdxRibbonBackstageView;
    acnAlterarSenhaUsuario: TAction;
    BrBtnCadastroPerfilUsuario: TdxBarLargeButton;
    BrBtnCadastroUsuario: TdxBarLargeButton;
    BrBtnAlterarSenhaUsuario: TdxBarLargeButton;
    acnBloquearApp: TAction;
    BrBtnBloquearApp: TdxBarLargeButton;
    acnFecharApp: TAction;
    BrBtnFecharApp: TdxBarLargeButton;
    ImgLogoCompany: TImage;
    tbsMDI: TdxTabbedMDIManager;
    acnPermissaoAcesso: TAction;
    BrBtnPermissaoAcesso: TdxBarLargeButton;
    procedure FormCreate(Sender: TObject);
    procedure TmrContadorTimer(Sender: TObject);
    procedure acnFecharAppExecute(Sender: TObject);
    procedure acnCadastroPerfilUsuarioExecute(Sender: TObject);
    procedure acnCadastroUsuarioExecute(Sender: TObject);
    procedure acnAlterarSenhaUsuarioExecute(Sender: TObject);
    procedure acnBloquearAppExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMainUI: TFormMainUI;

implementation

{$R *.dfm}

procedure TFormMainUI.acnAlterarSenhaUsuarioExecute(Sender: TObject);
begin
  ;
end;

procedure TFormMainUI.acnBloquearAppExecute(Sender: TObject);
begin
  ;
end;

procedure TFormMainUI.acnCadastroPerfilUsuarioExecute(Sender: TObject);
begin
  gFormulario.ShowForm(Self, 'FrmPerfilUsuarioPesquisaUI');
end;

procedure TFormMainUI.acnCadastroUsuarioExecute(Sender: TObject);
begin
  gFormulario.ShowForm(Self, 'FrmUsuarioSistemaPesquisaUI');
end;

procedure TFormMainUI.acnFecharAppExecute(Sender: TObject);
begin
  Self.Close;
end;

procedure TFormMainUI.FormCreate(Sender: TObject);
begin
  rbbMenu.ShowTabGroups := False;
  inherited;

  Self.Caption := Application.Title + ' - v' +
    gVersaoApp.ProductVersion + ' (Build ' +
    gVersaoApp.FileVersion + ')';
end;

procedure TFormMainUI.TmrContadorTimer(Sender: TObject);
begin
  LblDate.Caption := FormatDateTime('dddd, dd "de" mmmm "de" yyyy', Date);
  LblDate.Caption := StringReplace(LblDate.Caption, '-', ' ', [rfReplaceAll]);
  LblDate.Caption := AnsiUpperCase(LblDate.Caption[1]) + Copy(LblDate.Caption, 2, Length(LblDate.Caption));
  LblDate.Hint    := LblDate.Caption;

  LblTime.Caption := TimeToStr(Time);
  LblTime.Hint    := TimeToStr(Time);

  LblUser.Caption := 'user_name@' +
    AnsiLowerCase(gSistema.Conexao.Servidor) + '\' +
    IntToStr(gSistema.Conexao.Porta)         + '.' +
    AnsiLowerCase(gSistema.Conexao.Base);

  stbInforme.Panels.Items[0].Text := LblDate.Caption;
  stbInforme.Panels.Items[1].Text := LblTime.Caption;
  stbInforme.Panels.Items[2].Text := LblUser.Caption;
end;

end.
