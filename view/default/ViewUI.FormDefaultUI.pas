unit ViewUI.FormDefaultUI;

interface

uses
  //Model.Rotina,
  InterfaceAgil.Observer,
  Controller.Rotina,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TFormDefaultUI = class(TForm, IObservador)
  private
    { Private declarations }
    aRotinaController: TRotinaController;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; Controller: TRotinaController); reintroduce;
    procedure Update(Observable: IObservable);
  end;

var
  FormDefaultUI: TFormDefaultUI;

implementation

{$R *.dfm}

{ TFormDefaultUI }

constructor TFormDefaultUI.Create(AOwner: TComponent;
  Controller: TRotinaController);
begin
  inherited Create(AOwner);
  aRotinaController := TRotinaController.CriarRotina(Self.Caption, Self.Hint);
  with aRotinaController do
    Model.addObserver(Self);
end;

procedure TFormDefaultUI.Update(Observable: IObservable);
begin
  Self.Tag := aRotinaController.Model.Indice;
end;

end.
