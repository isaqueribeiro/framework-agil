(*******************************************************************************
  Autot : Isaque Marinho Ribeiro
  Data  : 29/08/2014

  Objetivo:

  Esta unidade poderá ser usada por todos os formulários do projeto para que estes
  tenham acesso a variáveis (objetos) globais do sistemas. E como recomendação
  para diminuir o acoplamento desnecessário entre diferentes unidades de códigos
  de diferentes projetos, recumenta-se declara neste Data Module apenas objetivos
  que poderão ser usados em todos os projetos sem comprometer a sua compilação.
*******************************************************************************)
unit DataModule.Recursos;

interface

uses
  Controller.VersaoAplicacao,
  Controller.Licenca,
  Controller.Sistema,
  ClasseAgil.Formulario,

  Winapi.Windows,
  System.SysUtils, System.Classes,
  Vcl.Forms, Vcl.ImgList, Vcl.Controls, Vcl.Dialogs,
  cxClasses, cxLookAndFeels,

  dxSkinsCore, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinsForm, cxGraphics, dxScreenTip, cxEdit,
  dxCustomHint, cxHint, cxStyles;

type
  TDtmRecursos = class(TDataModule)
    SkinController: TdxSkinController;
    LookAndFeelController: TcxLookAndFeelController;
    imgFlat16: TcxImageList;
    imgFlat32: TcxImageList;
    imgFlat32Disable: TcxImageList;
    imgFlat32Hot: TcxImageList;
    StyleControllerHint: TcxHintStyleController;
    StyleControllerDefaultEdit: TcxDefaultEditStyleController;
    imgOffice2013: TcxImageList;
    StyleRepository: TcxStyleRepository;
    stl_Selection: TcxStyle;
    stl_Content: TcxStyle;
    stl_ContentEven: TcxStyle;
    stl_Inactive: TcxStyle;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DtmRecursos : TDtmRecursos;
  gVersaoApp  : TVersaoAplicacaoController;
  gLicencaApp : TLicencaController;
  gSistema    : TSistemaController;
  gFormulario : TFormularios;

  procedure ShowInforme(const AOnwer : TComponent; aTitulo, aMensagem : String);
  procedure ShowError(const AOnwer : TComponent; aTitulo, aMensagem : String);

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure ShowInforme(const AOnwer : TComponent; aTitulo, aMensagem : String);
begin
  //MessageDlg(aMensagem, mtError, [mbOK], 0);
  Application.MessageBox(PWideChar(aMensagem), PWideChar(aTitulo), MB_ICONINFORMATION);
end;

procedure ShowError(const AOnwer : TComponent; aTitulo, aMensagem : String);
begin
  //MessageDlg(aMensagem, mtError, [mbOK], 0);
  Application.MessageBox(PWideChar(aMensagem), PWideChar(aTitulo), MB_ICONERROR);
end;

initialization
  gVersaoApp  := TVersaoAplicacaoController.GetInstance();
  gLicencaApp := TLicencaController.GetInstance();
  gSistema    := TSistemaController.GetInstance();
  gFormulario := TFormularios.Create;

end.
