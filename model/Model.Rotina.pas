unit Model.Rotina;

interface

Uses
  ClasseAgil.BaseObject,
  System.Classes, System.SysUtils, System.StrUtils;

Type
  TRotina = class(TBaseObject)
  private
    aID : TGUID;
    aNome ,
    aDescricao : String;
    aIndice : Integer;
  protected
    constructor Create;
  public
    constructor CriarRotina(pNome, pDescricao : String);

    property ID : TGUID read aID write aID;
    property Nome : String read aNome write aNome;
    property Descricao : String read aDescricao write aDescricao;
    property Indice : Integer read aIndice write aIndice;

    procedure Salvar; virtual; abstract;
    function Buscar(Codigo: String): TRotina; virtual; abstract;
  end;

implementation

{ TRotina }

constructor TRotina.CriarRotina(pNome, pDescricao: String);
begin
  Self.Create;
  CreateGUID(aID);
  aNome      := Trim(pNome);
  aDescricao := Trim(pDescricao);
  aIndice    := 0;
end;

constructor TRotina.Create;
begin
  inherited Create;
end;

end.
