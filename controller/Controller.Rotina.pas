unit Controller.Rotina;

interface

Uses
  InterfaceAgil.Controller,
  ClasseAgil.BaseObject,
  Model.Rotina,

  System.Classes, System.SysUtils, System.StrUtils;

  Type
    TRotinaController = class(TInterfacedObject, IController)
    private
      aModel : TRotina;
      procedure SetModel(Value : TRotina);
      function GetModel : TRotina;
    public
      constructor Create;
//      constructor CriarRotina(const aParent : TRotina; aNome, aDescricao : String);
      destructor Destroy; override;

      procedure Load;
      procedure Save;

      function Find(ID: String): TBaseObject;
      function New: TBaseObject;
    published
      property Model : TRotina read GetModel write SetModel;
  end;

implementation

{ TRotinaController }

constructor TRotinaController.Create;
begin
  inherited Create;
  aModel := TRotina.CriarRotina(EmptyStr, EmptyStr);
end;

//constructor TRotinaController.CriarRotina(const aParent : TRotina; aNome, aDescricao: String);
//begin
//  Self.Create;
//  aModel.Nome      := aNome;
//  aModel.Descricao := aDescricao;
//  aModel.Parent    := aParent;
//end;
//
destructor TRotinaController.Destroy;
begin
  aModel.Destroy;
  inherited;
end;

function TRotinaController.Find(ID: String): TBaseObject;
begin
  Result := aModel.Buscar(ID);
end;

function TRotinaController.GetModel: TRotina;
begin
  Result := aModel;
end;

procedure TRotinaController.Load;
begin
  // Carregar dados
  ;
  // Notificar observadores
  aModel.Notify;
end;

function TRotinaController.New: TBaseObject;
begin
  aModel := TRotina.CriarRotina(EmptyStr, EmptyStr);
  Result := aModel;
end;

procedure TRotinaController.Save;
begin
  aModel.Salvar;
end;

procedure TRotinaController.SetModel(Value: TRotina);
begin
  aModel := Value;
end;

end.
