unit ViewUI.FormDefaultUI;

interface

uses
  Model.Rotina,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TFormDefaultUI = class(TForm)
  private
    { Private declarations }
    aRotina : TRotina;
    function GetRotina : TRotina;
  public
    { Public declarations }
    property Rotina : TRotina read GetRotina;
  end;

var
  FormDefaultUI: TFormDefaultUI;

implementation

{$R *.dfm}

{ TFormDefaultUI }

function TFormDefaultUI.GetRotina: TRotina;
begin
  if not Assigned(aRotina) then
    aRotina := TRotina.CriarRotina(Self.UnitName, Self.Hint);

  Result := aRotina;
end;

end.
