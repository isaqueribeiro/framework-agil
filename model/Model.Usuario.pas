unit Model.Usuario;

interface
Uses
  TypeAgil.Constants,
  TypeAgil.ComplexTypes,
  ClasseAgil.BaseObject,
  Model.Perfil,

  IdHashMessageDigest,
  idHash,

  System.Classes, System.SysUtils, System.StrUtils;

Type
  TUsuario = class(TBaseObject)
  private
    aID : TGUID;
    aLogin       ,
    aPrimeiroNome,
    aSobrenome   ,
    aSenha       : String;
    aHash   : TStringList;
    aPerfil : TPerfil;
    aSistema,
    aAtivo  : Boolean;
    aDataAtivacao : TDateTime;
    procedure SetLogin(Value : String);
    procedure SetPrimeiroNome(Value : String);
    procedure SetSobrenome(Value : String);
    procedure SetSenha(Value : String);
    procedure SetPerfil(Value : TPerfil);
    procedure SetSistema(Value : Boolean);
    procedure SetAtivo(Value : Boolean);
    procedure SetDataAtivacao(Value : TDateTime);

    function GetUserID : String;
    function GetUser : String;
    function GetNome : String;
  public
    constructor Create;
    destructor Destroy;

    property ID : TGUID read aID write aID;
    property Login : String read aLogin write SetLogin;
    property PrimeiroNome : String read aPrimeiroNome write SetPrimeiroNome;
    property Sobrenome : String read aSobrenome write SetSobrenome;
    property Senha  : String read aSenha write SetSenha;
    property Hash   : TStringList read aHash write aHash;
    property Perfil : TPerfil read aPerfil write SetPerfil;
    property UsoSistema : Boolean read aSistema write SetSistema;
    property Ativo : Boolean read aAtivo write SetAtivo;
    property DataAtivacao : TDateTime read aDataAtivacao write SetDataAtivacao;
    property UserID : String read GetUserID;
    property Nome   : String read GetNome;
  end;

implementation

{ TUsuario }

constructor TUsuario.Create;
begin
  inherited Create;
  CreateGUID(aID);
  aLogin        := EmptyStr;
  aPrimeiroNome := EmptyStr;
  aSobrenome    := EmptyStr;
  aSenha        := EmptyStr;
  aSistema      := False;
  aAtivo        := False;
  aDataAtivacao := StrToDateTime(SYS_EMPTY_DATE);

  aHash   := TStringList.Create;
  aPerfil := TPerfil.Create;

  aPerfil.ID := StringToGUID(SYS_EMPTY_GUID);
end;

destructor TUsuario.Destroy;
begin
  aPerfil.Free;
  aHash.Free;
  inherited Destroy;
end;

function TUsuario.GetNome: String;
begin
  Result := Trim(aPrimeiroNome + ' ' + aSobrenome);
end;

function TUsuario.GetUser: String;
begin
  if (Pos('@', aLogin) > -1) then
    Result := Copy(aLogin, 1, Pos('@', aLogin) - 1)
  else
    Result := aLogin;
end;

function TUsuario.GetUserID: String;
var
  idHash   : TIdHashMessageDigest5;
  aRetorno : String;
begin
  idHash   := TIdHashMessageDigest5.Create;
  aRetorno := EmptyStr;
  try
    aRetorno := GUIDToString(aID);
    aRetorno := StringReplace(StringReplace(StringReplace(aRetorno, '-', '', [rfReplaceAll]), '{', '', [rfReplaceAll]), '}', '', [rfReplaceAll]);
    aRetorno := idHash.HashStringAsHex(aRetorno);
  finally
    idHash.Free;
    Result := aRetorno;
  end;
end;

procedure TUsuario.SetAtivo(Value: Boolean);
begin
  aAtivo := Value;
end;

procedure TUsuario.SetDataAtivacao(Value: TDateTime);
begin
  aDataAtivacao := Value;
end;

procedure TUsuario.SetLogin(Value: String);
begin
  aLogin := Trim(Value);
end;

procedure TUsuario.SetPrimeiroNome(Value: String);
begin
  aPrimeiroNome := Trim(Value);
end;

procedure TUsuario.SetPerfil(Value: TPerfil);
begin
  aPerfil := Value;
end;

procedure TUsuario.SetSenha(Value: String);
begin
  aSenha := Value;
end;

procedure TUsuario.SetSistema(Value: Boolean);
begin
  aSistema := Value;
end;

procedure TUsuario.SetSobrenome(Value: String);
begin
  aSobrenome := Trim(Value);
end;

end.
