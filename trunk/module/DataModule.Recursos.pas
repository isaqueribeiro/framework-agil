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
  System.SysUtils, System.Classes;

type
  TDtmRecursos = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DtmRecursos: TDtmRecursos;
  gVersaoApp : TVersaoAplicacaoController;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

initialization
  gVersaoApp := TVersaoAplicacaoController.GetInstance();

end.
