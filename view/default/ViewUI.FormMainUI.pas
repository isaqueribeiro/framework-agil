unit ViewUI.FormMainUI;

interface

uses
  DataModule.Recursos,
  ViewUI.FormDefaultUI,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  System.Actions, Vcl.ActnList, Vcl.StdActns, Vcl.Menus, Vcl.StdCtrls, cxClasses,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxNavBar, dxStatusBar,
  dxBar, dxRibbonSkins, dxSkinsdxRibbonPainter, dxRibbonCustomizationForm, dxRibbon,
  dxNavBarBase, dxNavBarCollns,

  dxSkinsCore, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinsdxStatusBarPainter, dxSkinsdxBarPainter;

type
  TFormMainUI = class(TFormDefaultUI)
    ImgLogoCompany: TImage;
    PnlStatusBar: TPanel;
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
    stbInforme: TdxStatusBar;
    BrManager: TdxBarManager;
    rbbMenuSistema: TdxRibbonTab;
    rbbMenu: TdxRibbon;
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
  LblDate.Caption := StringReplace(LblDate.Caption, '-', ' ', [rfReplaceAll]);
  LblDate.Caption := AnsiUpperCase(LblDate.Caption[1]) + Copy(LblDate.Caption, 2, Length(LblDate.Caption));
  LblDate.Hint    := LblDate.Caption;

  LblTime.Caption := TimeToStr(Time);
  LblTime.Hint    := TimeToStr(Time);

  stbInforme.Panels.Items[0].Text := LblDate.Caption;
  stbInforme.Panels.Items[1].Text := LblTime.Caption;
end;

end.
