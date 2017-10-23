(*******************************************************************************
  Autot : Isaque Marinho Ribeiro
  Data  : 29/08/2014

  Objectivo:

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
  ClasseAgil.Formulario,

  System.SysUtils, System.Classes, Vcl.ImgList, Vcl.Controls, cxClasses, cxLookAndFeels,

  dxSkinsCore, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinsForm, cxGraphics, dxScreenTip, cxEdit,
  dxCustomHint, cxHint;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DtmRecursos : TDtmRecursos;
  gVersaoApp  : TVersaoAplicacaoController;
  gLicencaApp : TLicencaController;
  gFormulario : TFormularios;


implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

initialization
  gVersaoApp  := TVersaoAplicacaoController.GetInstance();
  gLicencaApp := TLicencaController.GetInstance();
  gFormulario := TFormularios.Create;

end.
