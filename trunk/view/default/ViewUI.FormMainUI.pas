unit ViewUI.FormMainUI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ViewUI.FormDefaultUI;

type
  TFormMainUI = class(TFormDefaultUI)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMainUI: TFormMainUI;

implementation

{$R *.dfm}

procedure TFormMainUI.FormCreate(Sender: TObject);
begin
  Self.Caption := Application.Title;
  inherited;
end;

end.
