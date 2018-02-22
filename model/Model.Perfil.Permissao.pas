unit Model.Perfil.Permissao;

interface

Uses
  TypeAgil.ComplexTypes,
  ClasseAgil.BaseObject,
  Model.Perfil,
  Model.Sistema,
  Model.Rotina,

  System.Classes, System.SysUtils, System.StrUtils;

Type
  TPermissaoPerfil = class(TBaseObject)
  private
    aID      : TGUID;
    aPerfil  : TPerfil;
    aSistema : TSistema;
    aRotina  : TRotina;
    aTipo    : ct_TipoPermissao;
    procedure SetPerfil(Value : TPerfil);
    procedure SetTipo(Value : ct_TipoPermissao);
    procedure SetRotina(const Value: TRotina);
    procedure SetSistema(const Value: TSistema);
//  protected
//    constructor Create;
//    destructor Destroy;
  public
    property ID : TGUID read aID write aID;
    property Perfil  : TPerfil read aPerfil write SetPerfil;
    property Sistema : TSistema read aSistema write SetSistema;
    property Rotina  : TRotina read aRotina write SetRotina;
    property Tipo    : ct_TipoPermissao read aTipo write SetTipo;

    constructor Create;
    destructor Destroy;
  end;

implementation

{ TPermissaoPerfil }

constructor TPermissaoPerfil.Create;
begin
  inherited Create;
  aPerfil  := TPerfil.Create;
  aSistema := TSistema.Create;
  aRotina  := TRotina.Create;
end;

destructor TPermissaoPerfil.Destroy;
begin
  aPerfil.Free;
  aSistema.Free;
  aRotina.Free;

  inherited Destroy;
end;

procedure TPermissaoPerfil.SetPerfil(Value: TPerfil);
begin
  aPerfil := Value;
end;

procedure TPermissaoPerfil.SetRotina(const Value: TRotina);
begin
  aRotina := Value;
end;

procedure TPermissaoPerfil.SetSistema(const Value: TSistema);
begin
  aSistema := Value;
end;

procedure TPermissaoPerfil.SetTipo(Value: ct_TipoPermissao);
begin
  // Campos de formuláros de cadastro permitem apenas dois tipos de permissão:
  // 1 - Apenas visualizá-los
  // 2 - Permissão para editá-los
  if (aRotina.Tipo = tr_CampoCadastro) then
    case Value of
      tp_SemAcesso  : Value := tp_Visualizar;
      tp_Visualizar : ;
      tp_Alterar    : ;
      tp_IncluirAlterar : Value := tp_Alterar;
      tp_ControleTotal  : Value := tp_Alterar;
    end;

  aTipo := Value;
end;

end.
