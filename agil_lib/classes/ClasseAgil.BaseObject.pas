unit ClasseAgil.BaseObject;

interface

uses
  InterfaceAgil.Observer,
  Vcl.Dialogs, System.SysUtils, Winapi.Windows, System.Classes;

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
  published
    property IDGuid: String read GetIDGuid write SetIDGuid;
  end;

implementation

{ TBaseObject }

procedure TBaseObject.addObserver(Observer: IObservador);
var
  I : Integer;
begin
  I := aObservers.IndexOf(Observer);
  if ( I < 0 ) then
    aObservers.Add(Observer);
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
  Observer : IInterface;
begin
  for Observer in aObservers do
    IObservador(Observer).Update(Self);
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
