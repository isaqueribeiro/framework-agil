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
      //class var aInstance : TRotinaController;
      aModelo : TRotina;
      procedure SetModelo(Value : TRotina);
      function GetModelo : TRotina;
    protected
      constructor Create;
    public
      //class function GetInstance: TRotinaController;
      constructor CriarRotina(const aParent : TRotina; aNome, aDescricao : String);
      destructor Destroy; override;

      procedure Load;
      procedure Save;

      function Find(ID: String): TBaseObject;
      function New: TBaseObject;
    published
      property Modelo : TRotina read GetModelo write SetModelo;
  end;

implementation

{ TRotinaController }

constructor TRotinaController.Create;
begin
  inherited Create;
  aModelo := TRotina.CriarRotina(EmptyStr, EmptyStr);
end;

constructor TRotinaController.CriarRotina(const aParent : TRotina; aNome, aDescricao: String);
begin
  aModelo := TRotina.CriarRotina(aNome, aDescricao);
  if (aParent <> nil) then
    aModelo.Parent.Assign( aParent );
end;

destructor TRotinaController.Destroy;
begin
  inherited;
end;

function TRotinaController.Find(ID: String): TBaseObject;
begin
   Result := aModelo.Buscar(ID);
end;

//class function TRotinaController.GetInstance: TRotinaController;
//begin
//  if not Assigned(aInstance) then
//    aInstance := TRotinaController.Create;
//  Result := aInstance;
//end;
//
function TRotinaController.GetModelo: TRotina;
begin
  Result := aModelo;
end;

procedure TRotinaController.Load;
begin
  // Carregar dados
  ;
  // Notificar observadores
  aModelo.Notify;
end;

function TRotinaController.New: TBaseObject;
begin
  aModelo := TRotina.CriarRotina(EmptyStr, EmptyStr);
  Result  := aModelo;
end;

procedure TRotinaController.Save;
begin
  aModelo.Salvar;
end;

procedure TRotinaController.SetModelo(Value: TRotina);
begin
  aModelo := Value;
end;

end.
