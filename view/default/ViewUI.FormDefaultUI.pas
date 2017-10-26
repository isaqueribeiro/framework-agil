unit ViewUI.FormDefaultUI;

interface

uses
  InterfaceAgil.Observer,
  Controller.Rotina,
  Model.Rotina,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  TypInfo, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxRibbon, dxRibbonForm, dxRibbonSkins;

type
  TFormDefaultUI = class(TdxRibbonForm, IObservador)
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    aRotina : TRotina;
    aRotinaController : TRotinaController;
    procedure SetRotinaController(Value : TRotinaController);
    function GetRotinaController : TRotinaController;
  protected
    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; Controller: TRotinaController); overload;
  public
    { Public declarations }
    property Rotina : TRotina read aRotina write aRotina;
    property RotinaController : TRotinaController read GetRotinaController write SetRotinaController;

    constructor CreateForm(AOwner: TComponent; Controller: TRotinaController); reintroduce;
//    procedure SetRotina;
    procedure Update(Observable: IObservable);
  end;

var
  FormDefaultUI: TFormDefaultUI;

implementation

{$R *.dfm}

{ TFormDefaultUI }

constructor TFormDefaultUI.Create(AOwner: TComponent);
var
  aRC : TRotinaController;
begin
  inherited Create(AOwner);
  aRC := nil;

  if Assigned(Self.Owner) then
  begin
    if (Self.Owner is TFormDefaultUI) then
      if (TFormDefaultUI(Self.Owner).RotinaController <> nil) then
        aRC := TFormDefaultUI(Self.Owner).RotinaController;
  end;

  if (aRC <> nil) then
    aRotinaController := TRotinaController.CriarRotina(aRC.Model, Self.Name, Self.Caption)
  else
    aRotinaController := TRotinaController.CriarRotina(nil, Self.Name, Self.Caption);

  with aRotinaController do
    Model.addObserver(Self);
end;

constructor TFormDefaultUI.Create(AOwner: TComponent; Controller: TRotinaController);
begin
  inherited Create(AOwner);
  aRotinaController := TRotinaController.CriarRotina(Controller.Model, Self.Name, Self.Caption);

  with aRotinaController do
    Model.addObserver(Self);
end;

constructor TFormDefaultUI.CreateForm(AOwner: TComponent;
  Controller: TRotinaController);
begin
  Self.Create(AOwner, Controller);
end;

procedure TFormDefaultUI.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFormDefaultUI.FormCreate(Sender: TObject);
var
  aParent : TRotina;
begin
  DisableAero := True;
  aRotina := TRotina.CriarRotina(Self.Name, Self.Caption);
  if Assigned(Self.Owner) then
  begin
    if (Self.Owner is TFormDefaultUI) then
      if (TFormDefaultUI(Self.Owner).Rotina <> nil) then
      begin
        aParent := TFormDefaultUI(Self.Owner).Rotina;
        aRotina.Parent := aParent;
      end;
  end;
end;

procedure TFormDefaultUI.FormShow(Sender: TObject);
begin
  aRotinaController.Load;
end;

function TFormDefaultUI.GetRotinaController: TRotinaController;
begin
  Result := aRotinaController;
end;

procedure TFormDefaultUI.SetRotinaController(Value: TRotinaController);
begin
  aRotinaController := Value;
end;

//procedure TFormDefaultUI.SetRotina;
//var
//  aParent : TRotinaController;
//begin
//  if (aRotinaController = nil) then
//  begin
//    aParent := nil;
//
//    if Assigned(Self.Owner) then
//    begin
//      if (Self.Owner is TFormDefaultUI) then
//        if (TFormDefaultUI(Self.Owner).RotinaController <> nil) then
//          aParent := TFormDefaultUI(Self.Owner).RotinaController;
//    end;
//
//    if (aParent <> nil) then
//      aRotinaController := TRotinaController.CriarRotina(aParent.Modelo, Self.Name, Self.Caption)
//    else
//      aRotinaController := TRotinaController.CriarRotina(nil, Self.Name, Self.Caption);
//
//    with aRotinaController do
//      Modelo.addObserver(Self);
//  end;
//end;
//
procedure TFormDefaultUI.Update(Observable: IObservable);
begin
  Self.Tag := aRotinaController.Model.Indice;
//  ShowMessage( aRotinaController.Modelo.Nome + ' - ' + aRotinaController.Modelo.Descricao );
end;

end.
