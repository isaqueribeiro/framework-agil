unit Controller.Perfil;

interface

Uses
  TypeAgil.ComplexTypes,
  InterfaceAgil.Controller,
  ClasseAgil.BaseObject,
  Model.Perfil,

  System.Classes, System.SysUtils, System.StrUtils,

  FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  Data.DB, Datasnap.DBClient;

  Type
    TPerfilController = class(TInterfacedObject, IController)
    private
      class var aInstance : TPerfilController;
      aModel : TPerfil;
      procedure SetModel(Value : TPerfil);
      function GetModel : TPerfil;
    protected
      constructor Create;
    public
      class function GetInstance: TPerfilController;
      destructor Destroy; override;

      procedure Load(const aDataSet: TDataSet);
      procedure Save(const aDataSet: TDataSet); overload;

      function Find(ID: String; const aDataSet: TDataSet): TBaseObject;
      function New: TBaseObject;
      function ExecuteQuery(const aTipoPesquisa : Integer; const aDataSet: TDataSet; aPesquisa : String) : Boolean;
    published
      property Model : TPerfil read GetModel write SetModel;
  end;

implementation

{ TPerfilController }

constructor TPerfilController.Create;
begin
  inherited Create;
  aModel := TPerfil.Create;
end;

destructor TPerfilController.Destroy;
begin
  aModel.Free;
  inherited;
end;

function TPerfilController.ExecuteQuery(const aTipoPesquisa: Integer;
  const aDataSet: TDataSet; aPesquisa: String): Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;
  try
    ;
  finally
    Result := aRetorno;
  end;
end;

function TPerfilController.Find(ID: String;
  const aDataSet: TDataSet): TBaseObject;
begin
  ;
end;

class function TPerfilController.GetInstance: TPerfilController;
begin
  if not Assigned(aInstance) then
    aInstance := TPerfilController.Create;
  Result := aInstance;
end;

function TPerfilController.GetModel: TPerfil;
begin
  Result := aModel;
end;

procedure TPerfilController.Load(const aDataSet: TDataSet);
begin
  ;
end;

function TPerfilController.New: TBaseObject;
begin
  aModel := TPerfil.Create;
  Result := aModel;
end;

procedure TPerfilController.Save(const aDataSet: TDataSet);
begin
  ;
end;

procedure TPerfilController.SetModel(Value: TPerfil);
begin
  aModel := Value;
end;

end.
