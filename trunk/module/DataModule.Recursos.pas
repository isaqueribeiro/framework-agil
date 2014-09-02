(*******************************************************************************
  Autot : Isaque Marinho Ribeiro
  Data  : 29/08/2014

  Objectivo:
  Esta unidade poder� ser usada por todos os formul�rios do projeto para que estes
  tenham acesso a vari�veis (objetos) globais do sistemas. E como recomenda��o
  para diminuir o acoplamento desnecess�rio entre diferentes unidades de c�digos
  de diferentes projetos, recumenta-se declara neste Data Module apenas objetivos
  que poder�o ser usados em todos os projetos sem comprometer a sua compila��o.
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
