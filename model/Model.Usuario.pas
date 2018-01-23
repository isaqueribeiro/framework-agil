unit Model.Usuario;

interface
Uses
  TypeAgil.Constants,
  TypeAgil.ComplexTypes,
  ClasseAgil.BaseObject,
  Model.Perfil,

//  IdHashMessageDigest,
//  idHash,
//
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
//
//    function GetHash : TStringList;
  protected
//    constructor Create;
//    destructor Destroy;
  public
    constructor Create;
    destructor Destroy;

    property ID : TGUID read aID write aID;
    property Login : String read aLogin write SetLogin;
    property PrimeiroNome : String read aPrimeiroNome write SetPrimeiroNome;
    property Sobrenome : String read aSobrenome write SetSobrenome;
    property Senha : String read aSenha write SetSenha;
//    property Hash  : TStringList read GetHash;
    property Hash  : TStringList read aHash write aHash;
    property Perfil : TPerfil read aPerfil write SetPerfil;
    property UsoSistema : Boolean read aSistema write SetSistema;
    property Ativo : Boolean read aAtivo write SetAtivo;
    property DataAtivacao : TDateTime read aDataAtivacao write SetDataAtivacao;
    property UserID : String read GetUserID;
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

function TUsuario.GetUserID: String;
var
//  idHash   : TIdHashMessageDigest5;
  aRetorno : String;
begin
//  idHash   := TIdHashMessageDigest5.Create;
  aRetorno := EmptyStr;
  try
    aRetorno := GUIDToString(aID);
    aRetorno := StringReplace(StringReplace(StringReplace(aRetorno, '-', '', [rfReplaceAll]), '{', '', [rfReplaceAll]), '}', '', [rfReplaceAll]);
//    aRetorno := idHash.HashStringAsHex(aRetorno);
  finally
//    idHash.Free;
    Result := aRetorno;
  end;
end;

//function TUsuario.GetHash: TStringList;
//var
//  idHash : TIdHashMessageDigest5;
//  sKey   : String;
//  sHash  : WideString;
//  I : Integer;
//begin
//  idHash := TIdHashMessageDigest5.Create;
//
//  if not Assigned(aHash) then
//    aHash := TStringList.Create;
//
//  aHash.BeginUpdate;
//  aHash.Clear;
//  try
//    sKey  := idHash.HashStringAsHex(SYS_PASSWD_KEY);
//    sHash := idHash.HashStringAsHex(GUIDToString(aID) + aLogin + aPrimeiroNome + aSobrenome + GUIDToString(aPerfil.ID));
//
//    I := 0;
//    while (I = 0) do
//      I := Random(Length(sHash));
//
//    if ((I mod 2) = 0) then
//      sKey := ReverseString(sKey);
//
//    aHash.Add( Copy(sHash, 1, I) + sKey + Copy(sHash, I + 1, Length(sHash) - I)  );
//  finally
//    aHash.EndUpdate;
//    idHash.Free;
//    Result := aHash;
//  end;
//end;

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
