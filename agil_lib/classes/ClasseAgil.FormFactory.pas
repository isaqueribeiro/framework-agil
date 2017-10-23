unit ClasseAgil.FormFactory;

interface

uses
  System.Classes, Vcl.Forms;

  type
    TFormFactory = class
    private
      class var _FormFactory: TFormFactory;
      FList: TStrings;
      constructor PrivateCreate;
    protected
      constructor Create;
      destructor Destroy; override;
    public
      function FormFactory: TFormFactory;
      function CreateForm(const AOnwer : TComponent; const aFormName: String): TForm; //overload;

      procedure RegisterForm(const aFormName: string; aFormClass: TComponentClass);

      class function GetInstance : TFormFactory;
  end;

//var
//  _FormFactory: TFormFactory;
//
implementation

{ TFormFactory }

constructor TFormFactory.Create;
begin
  inherited Create;
  FList := TStringList.Create;
end;

destructor TFormFactory.Destroy;
begin
  FList.Free;
  inherited;
end;

function TFormFactory.CreateForm(const AOnwer: TComponent;
  const aFormName: string): TForm;
var
  i : Integer;
begin
  i := FList.IndexOf(aFormName);
  Assert(i <> -1, 'Formulário ' + aFormName + ' não existe');
  Result := TComponentClass(FList.Objects[i]).Create(AOnwer) as TForm;
end;

function TFormFactory.FormFactory: TFormFactory;
begin
//  Result := _FormFactory;
  Result := Self.GetInstance;
end;

class function TFormFactory.GetInstance: TFormFactory;
begin
  if not Assigned(_FormFactory) then
    _FormFactory := TFormFactory.PrivateCreate;

  Result := _FormFactory;
end;

constructor TFormFactory.PrivateCreate;
begin
  inherited Create;
  FList := TStringList.Create;
end;

procedure TFormFactory.RegisterForm(const aFormName: string;
  aFormClass: TComponentClass);
var
  I : Integer;
begin
  I := FList.IndexOf(aFormName);
  if I = -1 then
    FList.AddObject(aFormName, TObject(aFormClass));
end;

initialization
  TFormFactory.GetInstance;
//  _FormFactory := TFormFactory.Create;

//finalization
//  _FormFactory.Free;
//
end.
