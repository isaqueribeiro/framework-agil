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
    aParent : TRotina;
    procedure SetParent(Value : TRotina);
    procedure SetNome(Value : String);
    procedure SetDescricao(Value : String);
    procedure SetIndice(Value : Integer);
  protected
    constructor Create;
  public
    constructor CriarRotina(pNome, pDescricao : String);

    property ID : TGUID read aID write aID;
    property Nome : String read aNome write SetNome;
    property Descricao : String read aDescricao write SetDescricao;
    property Indice : Integer read aIndice write SetIndice;
    property Parent : TRotina read aParent write SetParent;

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

procedure TRotina.SetDescricao(Value: String);
begin
  aDescricao := Trim(Value);
end;

procedure TRotina.SetIndice(Value: Integer);
begin
  aIndice := Value;
  Notify;
end;

procedure TRotina.SetNome(Value: String);
begin
  aNome := Trim(Value);
end;

procedure TRotina.SetParent(Value: TRotina);
begin
  aParent := TRotina.CriarRotina(EmptyStr, EmptyStr);
  aParent.Assign(Value);
end;

constructor TRotina.Create;
begin
  inherited Create;
  aParent := nil;
end;

end.
