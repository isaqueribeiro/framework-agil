unit ViewUI.FormMainUI;

interface

uses
  DataModule.Recursos,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ViewUI.FormDefaultUI,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, System.Actions, Vcl.ActnList, Vcl.StdActns,
  Vcl.Menus;

type
  TFormMainUI = class(TFormDefaultUI)
    ImgLogoCompany: TImage;
    actMain: TActionList;
    actWindowClose: TWindowClose;
    actWindowCascade: TWindowCascade;
    actWindowTileHorizontal: TWindowTileHorizontal;
    actWindowTileVertical: TWindowTileVertical;
    actWindowMinimizeAll: TWindowMinimizeAll;
    actWindowArrange: TWindowArrange;
    actWindowCloseAll: TAction;
    PnlStatusBar: TPanel;
    actExit: TAction;
    PnlDate: TPanel;
    PnlTime: TPanel;
    PnlUser: TPanel;
    BvlStatusBar: TBevel;
    PnlCompany: TPanel;
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
  Self.Caption := Application.Title + ' - v' +
    gVersaoApp.ProductVersion + ' (Build ' +
    gVersaoApp.FileVersion + ')';
  inherited;
end;

end.
