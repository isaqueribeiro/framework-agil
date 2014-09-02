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
      procedure SetRazaoSocial(Value : String);
      procedure SetNomeFantasia(Value : String);
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
  end;

implementation

{ TLicenca }

constructor TLicenca.Create;
begin
  inherited Create;

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

procedure TLicenca.SetRazaoSocial(Value: String);
begin
  aRazaoSocial := Trim(Value);
end;

end.
