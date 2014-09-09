unit ViewUI.FormMainUI;

interface

uses
  DataModule.Recursos,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ViewUI.FormDefaultUI,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, System.Actions, Vcl.ActnList, Vcl.StdActns,
  Vcl.Menus, Vcl.StdCtrls;

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
    ImgCompany: TImage;
    LblCompany: TLabel;
    ImgUser: TImage;
    LblUser: TLabel;
    TmrContador: TTimer;
    ImgTime: TImage;
    LblTime: TLabel;
    ImgDate: TImage;
    LblDate: TLabel;
    MainMenu: TMainMenu;
    menuArquivo: TMenuItem;
    menuAjuda: TMenuItem;
    nmSobre: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure TmrContadorTimer(Sender: TObject);
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

procedure TFormMainUI.TmrContadorTimer(Sender: TObject);
begin
  LblDate.Caption := FormatDateTime('dddd, dd "de" mmmm "de" yyyy', Date);
  LblDate.Hint    := FormatDateTime('dddd, dd "de" mmmm "de" yyyy', Date);
  LblTime.Caption := TimeToStr(Time);
  LblTime.Hint    := TimeToStr(Time);
end;

end.
