unit Model.Endereco;

interface

Uses
  TypeAgil.ComplexTypes,
  ClasseAgil.BaseObject,

  System.Classes, System.SysUtils, System.StrUtils;

Type
  TTipoEndereco = class(TBaseObject)
    private
      aID : TGUID;
      aCodigo   : Smallint;
      aDescricao,
      aSigla    : String;
      function GetDescricao : String;
      function GetSigla     : String;
    public
      property ID : TGUID read aID write aID;
      property Descricao : String read GetDescricao write aDescricao;
      property Sigla : String read GetSigla write aSigla;

      constructor Create;
  end;

  TEstado = class(TBaseObject)
    private
      aID : TGUID;
      aCodigo : Smallint;
      aNome   ,
      aUF     : String;

      function GetUF : String;
    public
      property ID   : TGUID read aID write aID;
      property Nome : String read aNome write aNome;
      property UF   : String read GetUF write aUF;

      constructor Create;
  end;

  TCidade = class(TBaseObject)
    private
      aID : TGUID;
      aCodigo,
      aIBGE  ,
      aSIAFI : Integer;
      aNome  : String;
      aEstado : TEstado;
      aCepInicial,
      aCepFinal  : Currency;
    public
      property ID : TGUID read aID write aID;
      property Codigo : Integer read aCodigo write aCodigo;
      property IBGE   : Integer read aIBGE write aIBGE;
      property SIAFI  : Integer read aSIAFI write aSIAFI;
      property Nome   : String read aNome write aNome;
      property Estado : TEstado read aEstado write aEstado;
      property CepInicial : Currency read aCepInicial write aCepInicial;
      property CepFinal   : Currency read aCepFinal write aCepFinal;

      constructor Create;
      destructor Destroy;
  end;

  TBairro = class(TBaseObject)
    private
      aID : TGUID;
      aCodigo : Currency;
      aNome   : String;
      aCidade : TCidade;
      aAtivo  : Boolean;

      function GetNome : String;
    public
      property ID : TGUID read aID write aID;
      property Codigo : Currency read aCodigo write aCodigo;
      property Nome   : String read GetNome write aNome;
      property Cidade : TCidade read aCidade write aCidade;
      property Ativo  : Boolean read aAtivo write aAtivo;

      constructor Create;
      destructor Destroy;
  end;

  TCep = class(TBaseObject)
    private
      aID : TGUID;
      aReferencia : Currency;
      aBairro : TBairro;
      aTipo   : TTipoEndereco;
      aLogradouro,
      aDescricao : String;

      function GetCidade : TCidade;
      function GetEstado : TEstado;
    public
      property ID : TGUID read aID write aID;
      property Referencia : Currency read aReferencia write aReferencia;
      property Bairro : TBairro read aBairro write aBairro;
      property Cidade : TCidade read GetCidade;
      property Estado : TEstado read GetEstado;
      property Tipo   : TTipoEndereco read aTipo write aTipo;
      property Logradouro : String read aLogradouro write aLogradouro;
      property Descricao  : String read aDescricao write aDescricao; // Endereço (Tipo + Logradouro)

      function StrNumero : String;

      constructor Create;
      destructor Destroy;
  end;

  TEndereco = class(TCep)
    private
      aNumero      ,
      aComplemento : String;
    public
      property Numero : String read aNumero write aNumero;
      property Complemento : String read aComplemento write aComplemento;

      constructor Create;
  end;

implementation

{ TTipoEndereco }

constructor TTipoEndereco.Create;
begin
  inherited Create;
  CreateGUID(aID);
  aCodigo    := 0;
  aDescricao := EmptyStr;
  aSigla     := EmptyStr;
end;

function TTipoEndereco.GetDescricao: String;
begin
  Result := Trim(aDescricao);
end;

function TTipoEndereco.GetSigla: String;
begin
  Result := AnsiUpperCase(Trim(aSigla));
end;

{ TEstado }

constructor TEstado.Create;
begin
  inherited Create;
  CreateGUID(aID);
  aCodigo := 0;
  aNome := EmptyStr;
  aUF   := EmptyStr;
end;

function TEstado.GetUF: String;
begin
  Result := AnsiUpperCase(Trim(aUF));
end;

{ TCidade }

constructor TCidade.Create;
begin
  inherited Create;
  CreateGUID(aID);
  aCodigo := 0;
  aIBGE   := 0;
  aSIAFI  := 0;
  aNome   := EmptyStr;
  aEstado := TEstado.Create;
  aCepInicial := 0;
  aCepFinal   := 0;
end;

destructor TCidade.Destroy;
begin
  aEstado.Free;
  inherited Destroy;
end;

{ TBairro }

constructor TBairro.Create;
begin
  inherited Create;
  CreateGUID(aID);
  aCodigo := 0;
  aNome   := EmptyStr;
  aCidade := TCidade.Create;
end;

destructor TBairro.Destroy;
begin
  aCidade.Free;
  inherited Destroy;
end;

function TBairro.GetNome: String;
begin
  Result := Trim(aNome);
end;

{ TCep }

constructor TCep.Create;
begin
  inherited Create;
  CreateGUID(aID);
  aReferencia := 0;
  aBairro     := TBairro.Create;
  aTipo       := TTipoEndereco.Create;
  aLogradouro := EmptyStr;
  aDescricao  := EmptyStr;
end;

destructor TCep.Destroy;
begin
  aBairro.Destroy;
  aTipo.Destroy;
  inherited Destroy;
end;

function TCep.GetCidade: TCidade;
begin
  Result := aBairro.aCidade;
end;

function TCep.GetEstado: TEstado;
begin
  Result := aBairro.Cidade.Estado;
end;

function TCep.StrNumero: String;
var
  sNumero : String;
begin
  sNumero := FormatFloat('00000000', aReferencia);
  Result := Copy(sNumero, 1, 5) + '-' + Copy(sNumero, 6, 3);
end;

{ TEndereco }

constructor TEndereco.Create;
begin
  inherited Create;
  CreateGUID(aID);
  aNumero      := 'S/N';
  aComplemento := EmptyStr;
end;

end.
