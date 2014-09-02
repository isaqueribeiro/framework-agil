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
      class var aInstance : TRotinaController;
      aModel : TRotina;
      function GetModel : TRotina;
    protected
      constructor Create;
      procedure Load;
    public
      class function GetInstance: TRotinaController;
      constructor CriarRotina(const aParent : TRotina; aNome, aDescricao : String);
      destructor Destroy; override;
      procedure Save;
      function Find(ID: String): TBaseObject;
      function New: TBaseObject;
    published
      property Model : TRotina read GetModel;
  end;

implementation

{ TRotinaController }

constructor TRotinaController.Create;
begin
  inherited Create;
  aModel := TRotina.CriarRotina(EmptyStr, EmptyStr);
end;

constructor TRotinaController.CriarRotina(const aParent : TRotina; aNome, aDescricao: String);
begin
  aModel := TRotina.CriarRotina(aNome, aDescricao);
  if (aParent <> nil) then
    aModel.Parent.Assign( aParent );
end;

destructor TRotinaController.Destroy;
begin
  inherited;
end;

function TRotinaController.Find(ID: String): TBaseObject;
begin
   Result := aModel.Buscar(ID);
end;

class function TRotinaController.GetInstance: TRotinaController;
begin
  if not Assigned(aInstance) then
    aInstance := TRotinaController.Create;
  Result := aInstance;
end;

function TRotinaController.GetModel: TRotina;
begin
  Result := aModel;
end;

procedure TRotinaController.Load;
begin
  ;
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

end.
