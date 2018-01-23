unit Model.Perfil;

interface

Uses
  TypeAgil.ComplexTypes,
  ClasseAgil.BaseObject,

  System.Classes, System.SysUtils, System.StrUtils;

Type
  TPerfil = class(TBaseObject)
  private
    aID : TGUID;
    aCodigo : Integer;
    aDescricao : String;
    aSistema,
    aAtivo  : Boolean;
    procedure SetCodigo(Value : Integer);
    procedure SetDescricao(Value : String);
    procedure SetSistema(Value : Boolean);
    procedure SetAtivo(Value : Boolean);
  protected
    constructor Create;
  public
    property ID : TGUID read aID write aID;
    property Codigo : Integer read aCodigo write SetCodigo;
    property Descricao  : String read aDescricao write SetDescricao;
    property UsoSistema : Boolean read aSistema write SetSistema;
    property Ativo : Boolean read aAtivo write SetAtivo;
  end;

implementation

{ TPerfil }

constructor TPerfil.Create;
begin
  inherited Create;
  CreateGUID(aID);
  aCodigo    := 0;
  aDescricao := EmptyStr;
  aSistema   := False;
  aAtivo     := False;
end;

procedure TPerfil.SetAtivo(Value: Boolean);
begin
  aAtivo := Value;
end;

procedure TPerfil.SetCodigo(Value: Integer);
begin
  aCodigo := Value;
end;

procedure TPerfil.SetDescricao(Value: String);
begin
  aDescricao := Trim(Value);
end;

procedure TPerfil.SetSistema(Value: Boolean);
begin
  aSistema := Value;
end;

end.
