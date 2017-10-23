unit ViewUI.FormDefaultUI;

interface

uses
  InterfaceAgil.Observer,
  Controller.Rotina,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  TypInfo, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxRibbon, dxRibbonForm, dxRibbonSkins;

type
  TFormDefaultUI = class(TdxRibbonForm, IObservador)
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    aRotinaController: TRotinaController;
  protected
    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; Controller: TRotinaController); overload;
  public
    { Public declarations }
    constructor CreateForm(AOwner: TComponent; Controller: TRotinaController); reintroduce;
    procedure Update(Observable: IObservable);

    property RotinaController : TRotinaController read aRotinaController;
  end;

var
  FormDefaultUI: TFormDefaultUI;

implementation

{$R *.dfm}

{ TFormDefaultUI }

constructor TFormDefaultUI.Create(AOwner: TComponent);
var
  PropInfo : PPropInfo;
  aRotina  : TObject;
begin
  inherited Create(AOwner);
  PropInfo := GetPropInfo(AOwner.ClassInfo, 'RotinaController');
  if (PropInfo <> nil) then
    aRotina := GetObjectProp(AOwner.ClassInfo, PropInfo)
  else
    aRotina := nil;

  if Assigned(aRotina) then
    aRotinaController := TRotinaController.CriarRotina(TRotinaController(aRotina).Model, Self.Name, Self.Caption)
  else
    aRotinaController := TRotinaController.CriarRotina(nil, Self.Name, Self.Caption);

  with aRotinaController do
    Model.addObserver(Self);
end;

constructor TFormDefaultUI.Create(AOwner: TComponent; Controller: TRotinaController);
var
  PropInfo : PPropInfo;
  aRotina  : TObject;
begin
  inherited Create(AOwner);
  PropInfo := GetPropInfo(AOwner.ClassInfo, 'RotinaController');
  if (PropInfo <> nil) then
    aRotina := GetObjectProp(AOwner.ClassInfo, PropInfo)
  else
    aRotina := nil;

  if Assigned(aRotina) then
    aRotinaController := TRotinaController.CriarRotina(TRotinaController(aRotina).Model, Self.Name, Self.Caption)
  else
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
begin
  DisableAero := True;
end;

procedure TFormDefaultUI.FormShow(Sender: TObject);
begin
  aRotinaController.Load;
end;

procedure TFormDefaultUI.Update(Observable: IObservable);
begin
  Self.Tag := aRotinaController.Model.Indice;
//  ShowMessage( aRotinaController.Model.Nome + ' - ' + aRotinaController.Model.Descricao );
end;

end.
