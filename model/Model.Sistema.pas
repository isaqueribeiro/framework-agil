unit Model.Sistema;

interface

Uses
  ClasseAgil.BaseObject,
  System.Classes, System.SysUtils, System.StrUtils;

Type
  TSistema = class(TBaseObject)
  private
    aID : TGUID;
    aCodigo   : Integer;
    aNome     ,
    aDescricao,
    aKey      ,
    aVersao   : String;
    procedure SetNome(Value : String);
    procedure SetDescricao(Value : String);
    procedure SetKey(Value : String);
    procedure SetVersao(Value : String);
    function GetCodigo :Integer;
  protected
    constructor Create;
  public
    constructor CriarSistema(pNome, pDescricao, pKey : String);

    property ID : TGUID read aID write aID;
    property Codigo : Integer read GetCodigo;
    property Nome : String read aNome write SetNome;
    property Descricao : String read aDescricao write SetDescricao;
    property Key : String read aKey write SetKey;
    property Versao : String read aVersao write SetVersao;
  end;

implementation

{ TSistema }

constructor TSistema.Create;
begin
  inherited Create;
  aNome      := EmptyStr;
  aDescricao := EmptyStr;
  aKey       := EmptyStr;
end;

constructor TSistema.CriarSistema(pNome, pDescricao, pKey: String);
begin
  Self.Create;
  CreateGUID(aID);
  aNome      := Trim(pNome);
  aDescricao := Trim(pDescricao);
  aKey       := Trim(pKey);
end;

function TSistema.GetCodigo: Integer;
begin
  Result := StrToIntDef(Copy(aKey, 12, 3), 0);
end;

procedure TSistema.SetDescricao(Value: String);
begin
  aDescricao := Trim(Value);
end;

procedure TSistema.SetKey(Value: String);
begin
  aCodigo := StrToIntDef(Copy(Trim(Value), 12, 3), 0);
  aKey    := Trim(Value);
end;

procedure TSistema.SetNome(Value: String);
begin
  aNome := Trim(Value);
end;

procedure TSistema.SetVersao(Value: String);
begin
  aVersao := Trim(Value);
end;

end.
