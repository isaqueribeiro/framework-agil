unit ClasseAgil.BaseObject;

interface

uses
  InterfaceAgil.Observer,
  Vcl.Dialogs, System.SysUtils, Winapi.Windows, System.Classes, System.TypInfo;

Type
  TBaseObject = class(TInterfacedObject, IObservable)
  private
    aObservers : TInterfaceList;
    aIDGuid : String;
    procedure SetIDGuid(const Value: String);
    function GetIDGuid : String;
  protected
    constructor Create;
  public
    destructor Destroy; override;

    procedure addObserver(Observer: IObservador);
    procedure removeObserver(Observer: IObservador);
    procedure Notify;
    procedure Assign(const Source : TBaseObject);
  published
    property IDGuid: String read GetIDGuid write SetIDGuid;
  end;

implementation

{ TBaseObject }

procedure TBaseObject.addObserver(Observer: IObservador);
var
  I : Integer;
begin
//  if ( aObservers = nil ) then
//    aObservers := TInterfaceList.Create;
//
  I := aObservers.IndexOf(Observer);
  if ( I < 0 ) then
    aObservers.Add(Observer);
end;

procedure TBaseObject.Assign(const Source: TBaseObject);
var
  TypInfo  : PTypeInfo;
  PropList : TPropList;
  PropCount,
  I        : Integer;
  Value    : Variant;
begin
  TypInfo   := Source.ClassInfo;
  PropCount := GetPropList(TypInfo, tkAny, @PropList);

  for I := 0 to PropCount - 1 do
  begin
    // Verifica se possui acesso a escrita na propriedade
    if ( PropList[I]^.SetProc <> nil ) then
    begin
      Value := GetPropValue(Source, PropList[I]^.Name);
      SetPropValue(Self, PropList[I]^.Name, Value);
    end;
  end;
end;

constructor TBaseObject.Create;
var
  gID: TGUID;
begin
  aObservers := TInterfaceList.Create;

  if CreateGUID(gID) = S_OK then
    aIDGuid := GUIDToString(gID);
end;

destructor TBaseObject.Destroy;
begin
   FreeAndNil(aObservers);
  inherited;
end;

function TBaseObject.GetIDGuid: String;
begin
  Result := aIDGuid;
end;

procedure TBaseObject.Notify;
var
  I : Integer;
begin
//  if ( aObservers <> nil ) then
    for I := 0 to aObservers.Count - 1 do
      IObservador(aObservers[I]).Update(Self);
end;

procedure TBaseObject.removeObserver(Observer: IObservador);
var
  I : Integer;
begin
  I := aObservers.IndexOf(Observer);
  if ( I > - 1 ) then
    aObservers.Remove(Observer);
end;

procedure TBaseObject.SetIDGuid(const Value: String);
begin
  aIDGuid := Value;
end;

end.
