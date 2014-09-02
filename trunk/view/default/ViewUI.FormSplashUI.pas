unit ViewUI.FormSplashUI;

interface

uses
  InterfaceAgil.Observer,
  Controller.VersaoAplicacao,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ViewUI.FormDefaultUI, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TFormSplashUI = class(TFormDefaultUI, IObservador)
    lblCompanyName: TLabel;
    lblLegalCopyright: TLabel;
    lblSplashName: TLabel;
    lblSplashDescription: TLabel;
    lblProductVersion: TLabel;
    ImgBackgroud: TImage;
    lblRegistradoPara: TLabel;
    lblCarregando: TLabel;
    imgAppIcon: TImage;
  private
    { Private declarations }
    procedure CarregarInformacao;
  public
    { Public declarations }
    procedure Update(Observable: IObservable);
  end;

var
  FormSplashUI: TFormSplashUI;

implementation

{$R *.dfm}

{ TFormSplashUI }

procedure TFormSplashUI.CarregarInformacao;
var
  aVersao : TVersaoAplicacaoController;
begin
  aVersao := TVersaoAplicacaoController.GetInstance();
  with aVersao do
  begin
    lblSplashName.Caption        := SplashName;
    lblSplashDescription.Caption := SplashDescription;
    lblProductVersion.Caption    := 'Versão do Produto: ' + ProductVersion + ' (Build ' + FileVersion + ')';

    lblCompanyName.Caption       := CompanyName;
    lblLegalCopyright.Caption    := LegalCopyright;
  end;
end;

procedure TFormSplashUI.Update(Observable: IObservable);
begin
  ;
end;

end.
