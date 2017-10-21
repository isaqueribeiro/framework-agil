unit ViewUI.FormDefaultUI;

interface

uses
  InterfaceAgil.Observer,
  Controller.Rotina,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxRibbon, dxRibbonForm, dxRibbonSkins;

type
  TFormDefaultUI = class(TdxRibbonForm, IObservador)
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    aRotinaController: TRotinaController;
  protected
    constructor Create(AOwner: TComponent); override;
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
begin
  inherited Create(AOwner);
  aRotinaController := TRotinaController.CriarRotina(nil, Self.Name, Self.Caption);
  with aRotinaController do
    Model.addObserver(Self);
end;

constructor TFormDefaultUI.CreateForm(AOwner: TComponent;
  Controller: TRotinaController);
begin
  Self.Create(AOwner);
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
