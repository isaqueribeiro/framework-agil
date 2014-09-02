unit Controller.Licenca;

interface

Uses
  InterfaceAgil.Controller,
  ClasseAgil.BaseObject,
  Model.Licenca,
  System.Classes, System.SysUtils, System.StrUtils;

  Type
    TLicencaController = class(TInterfacedObject, IController)
    private
      class var aInstance : TLicencaController;
      aModel : TLicenca;
      function GetModel : TLicenca;
    protected
      constructor Create;
    public
      class function GetInstance: TLicencaController;
      destructor Destroy; override;
      procedure Save;
      procedure Load;
      function Find(ID: String): TBaseObject;
      function New: TBaseObject;
    published
      property Model : TLicenca read GetModel;
  end;

implementation

{ TLicencaController }

constructor TLicencaController.Create;
begin
  inherited Create;
  aModel := TLicenca.Create;
end;

destructor TLicencaController.Destroy;
begin
  inherited;
end;

function TLicencaController.Find(ID: String): TBaseObject;
begin
  Result := aModel;
end;

class function TLicencaController.GetInstance: TLicencaController;
begin
  if not Assigned(aInstance) then
    aInstance := TLicencaController.Create;
  Result := aInstance;
end;

function TLicencaController.GetModel: TLicenca;
begin
  Result := aModel;
end;

procedure TLicencaController.Load;
begin
  ;
  aModel.Notify;
end;

function TLicencaController.New: TBaseObject;
begin
  aModel := TLicenca.Create;
  Result := aModel;
end;

procedure TLicencaController.Save;
begin
  ;
end;

end.
