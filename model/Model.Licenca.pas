unit Model.Licenca;

interface

Uses
  ClasseAgil.BaseObject,
  TypeAgil.ComplexTypes,
  System.Classes, System.SysUtils, System.StrUtils, System.DateUtils;

Type
  TLicenca = class(TBaseObject)
    private
      aRazaoSocial ,
      aNomeFantasia,
      aCnpj        : String;
      aEndereco    : ct_Endereco;
      aCompetenciaLimite : Integer;
      aDataBloqueio      : TDateTime;
      aSistema           : ct_Sistema;
      aNotificacaoSplash : String;
      aTexto : TStringList;
      aCarregada : Boolean;
      procedure SetRazaoSocial(Value : String);
      procedure SetNomeFantasia(Value : String);
      procedure SetNotificacaoSplash(Value : String);
      procedure SetValorDefault;

      function GetChave : String;
      function GetTextoCrip : TStringList;
    protected
      destructor Destroy; override;
    public
      constructor Create;
      constructor Criar;

      property Chave : String read GetChave;
      property RazaoSocial  : String read aRazaoSocial write SetRazaoSocial;
      property NomeFantasia : String read aNomeFantasia write SetNomeFantasia;
      property Cnpj         : String read aCnpj;
      property Endereco     : ct_Endereco read aEndereco;
      property CompetenciaLimite : Integer read aCompetenciaLimite write aCompetenciaLimite;
      property DataBloqueio      : TDateTime read aDataBloqueio write aDataBloqueio;
      property Sistema           : ct_Sistema read aSistema write aSistema;
      property NotificacaoSplash : String read aNotificacaoSplash write SetNotificacaoSplash;
      property TextoCrip : TStringList read GetTextoCrip;
      property Carregada : Boolean read aCarregada write aCarregada;
  end;

implementation

{ TLicenca }

constructor TLicenca.Create;
begin
  inherited Create;
  SetValorDefault;
end;

constructor TLicenca.Criar;
begin
  inherited Create;
  SetValorDefault;
end;

destructor TLicenca.Destroy;
begin
  aTexto.Free;
  inherited;
end;

procedure TLicenca.SetValorDefault;
begin
  aRazaoSocial  := 'EMPRESA DE DEMONSTRAÇÃO';
  aNomeFantasia := 'Empresa de Demonstração';
  aCnpj         := '71.841.661/0001-98';      // CNJP virtual válido
  aCarregada    := False;

  aCompetenciaLimite := StrToInt(FormatDateTime('yyyymm', Date));
  aDataBloqueio      := StrToDate(FormatFloat('00', DaysInMonth(Date)) + '/' + FormatDateTime('mm/yyyy', Date));
  aNotificacaoSplash := EmptyStr;

  with aEndereco do
  begin
    Logradouro  := EmptyStr;
    Numero      := EmptyStr;
    Complemento := EmptyStr;
    Bairro      := EmptyStr;
    Cidade      := 'Ananindeua';
    UF          := 'PA';
    Cep         := '67.125-775';
  end;

  SetLength(aSistema, 1);

  with aSistema[Low(aSistema)] do
  begin
    ProductKey  := EmptyStr;
    ProductName := EmptyStr;
  end;

  aTexto := TStringList.Create;
end;

function TLicenca.GetChave: String;
var
  aChave : String;
begin
  aChave := StringReplace(StringReplace(IDGuid, '{', '', [rfReplaceAll]), '}', '', [rfReplaceAll]);
  Result := Trim(aChave);
end;

function TLicenca.GetTextoCrip: TStringList;
var
  I : Integer;
  aSistemas : String;
begin
  try
    aSistemas := EmptyStr;
    for I := Low(aSistema) to High(aSistema) do
      aSistemas := aSistemas + aSistema[I].ProductKey + '|';

    aTexto.BeginUpdate;
    aTexto.Clear;
    aTexto.Add('[Licenca]');
    aTexto.Add('RazaoSocial='  + aRazaoSocial);
    aTexto.Add('NomeFantasia=' + aNomeFantasia);
    aTexto.Add('Cnpj='         + aCnpj);
    aTexto.Add('Chave='        + Chave);
    aTexto.Add('CompetenciaLimite=' + IntToStr(aCompetenciaLimite));
    aTexto.Add('DataBloqueio='      + FormatDateTime('dd/mm/yyyy', aDataBloqueio));
    aTexto.Add('Sistemas='          + aSistemas);

    aTexto.Add('[Endereco]');
    aTexto.Add('Logradouro='  + aEndereco.Logradouro);
    aTexto.Add('Numero='      + aEndereco.Numero);
    aTexto.Add('Complemento=' + aEndereco.Complemento);
    aTexto.Add('Bairro='      + aEndereco.Bairro);
    aTexto.Add('Cidade='      + aEndereco.Cidade);
    aTexto.Add('UF='          + aEndereco.UF);
    aTexto.Add('Cep='         + aEndereco.Cep);
  finally
    aTexto.EndUpdate;
    aTexto.SaveToFile(ExtractFilePath(ParamStr(0)) + 'Licenca.ini');

    Result := aTexto;
  end;
end;

procedure TLicenca.SetNomeFantasia(Value: String);
begin
  aNomeFantasia := Trim(Value);
end;

procedure TLicenca.SetNotificacaoSplash(Value: String);
begin
  aNotificacaoSplash := Trim(Value);
  Self.Notify;
end;

procedure TLicenca.SetRazaoSocial(Value: String);
begin
  aRazaoSocial := Trim(Value);
end;

end.
