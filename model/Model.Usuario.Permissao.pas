unit Model.Usuario.Permissao;

interface

Uses
  TypeAgil.ComplexTypes,
  ClasseAgil.BaseObject,
  Model.Usuario,
  Model.Sistema,
  Model.Rotina,

  System.Classes, System.SysUtils, System.StrUtils;

Type
  TPermissaoUsuario = class(TBaseObject)
  private
    aID      : TGUID;
    aUsuario : TUsuario;
    aSistema : TSistema;
    aRotina  : TRotina;
    aTipo    : ct_TipoPermissao;
    procedure SetUsuario(Value : TUsuario);
    procedure SetTipo(Value : ct_TipoPermissao);
    procedure SetRotina(const Value: TRotina);
    procedure SetSistema(const Value: TSistema);
//  protected
//    constructor Create;
//    destructor Destroy;
  public
    property ID : TGUID read aID write aID;
    property Usuario  : TUsuario read aUsuario write SetUsuario;
    property Sistema : TSistema read aSistema write SetSistema;
    property Rotina  : TRotina read aRotina write SetRotina;
    property Tipo    : ct_TipoPermissao read aTipo write SetTipo;

    constructor Create;
    destructor Destroy;
  end;

implementation

{ TPermissaoUsuario }

constructor TPermissaoUsuario.Create;
begin
  inherited Create;
  aUsuario := TUsuario.Create;
  aSistema := TSistema.Create;
  aRotina  := TRotina.Create;
end;

destructor TPermissaoUsuario.Destroy;
begin
  aUsuario.Free;
  aSistema.Free;
  aRotina.Free;

  inherited Destroy;
end;

procedure TPermissaoUsuario.SetUsuario(Value: TUsuario);
begin
  aUsuario := Value;
end;

procedure TPermissaoUsuario.SetRotina(const Value: TRotina);
begin
  aRotina := Value;
end;

procedure TPermissaoUsuario.SetSistema(const Value: TSistema);
begin
  aSistema := Value;
end;

procedure TPermissaoUsuario.SetTipo(Value: ct_TipoPermissao);
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
