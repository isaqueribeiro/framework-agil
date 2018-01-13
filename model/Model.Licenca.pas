unit Model.Licenca;

interface

Uses
  ClasseAgil.BaseObject,
  TypeAgil.ComplexTypes,
  System.Classes, System.SysUtils, System.StrUtils;

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
      procedure SetRazaoSocial(Value : String);
      procedure SetNomeFantasia(Value : String);
      procedure SetNotificacaoSplash(Value : String);
    protected
      constructor Create;
    public
      property RazaoSocial  : String read aRazaoSocial write SetRazaoSocial;
      property NomeFantasia : String read aNomeFantasia write SetNomeFantasia;
      property Cnpj         : String read aCnpj;
      property Endereco     : ct_Endereco read aEndereco;
      property CompetenciaLimite : Integer read aCompetenciaLimite write aCompetenciaLimite;
      property DataBloqueio      : TDateTime read aDataBloqueio write aDataBloqueio;
      property Sistema           : ct_Sistema read aSistema write aSistema;
      property NotificacaoSplash : String read aNotificacaoSplash write SetNotificacaoSplash;
  end;

implementation

{ TLicenca }

constructor TLicenca.Create;
begin
  inherited Create;

  aRazaoSocial  := 'EMPRESA DE DEMONSTRAÇÃO';
  aNomeFantasia := 'Empresa de Demonstração';
  aCnpj         := '71.841.661/0001-98';      // CNJP virtual válido

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
