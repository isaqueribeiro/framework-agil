unit ViewUI.FormDefaultCadastroUI;

interface

uses
  InterfaceAgil.Observer,
  Controller.Rotina,
  DataModule.Recursos,
  ViewUI.FormDefaultUI,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, Data.DB,
  cxLookAndFeels, cxLookAndFeelPainters, dxCustomWizardControl, dxWizardControl,

  dxSkinsCore, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White;

type
  TFormDefaultCadastroUI = class(TFormDefaultUI)
    wcCadastro: TdxWizardControl;
    pgNominal: TdxWizardControlPage;
    dtsCadastro: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure dtsCadastroStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDefaultCadastroUI: TFormDefaultCadastroUI;

implementation

{$R *.dfm}

procedure TFormDefaultCadastroUI.dtsCadastroStateChange(Sender: TObject);
begin
  if Assigned(dtsCadastro.DataSet) then
    wcCadastro.Buttons.Finish.Enabled := (dtsCadastro.DataSet.State in [dsEdit, dsInsert])
end;

procedure TFormDefaultCadastroUI.FormCreate(Sender: TObject);
begin
  Descricao := pgNominal.Header.Description;
  inherited;
  wcCadastro.ActivePage  := pgNominal;
  pgNominal.Header.Title := Trim(Self.Caption);
end;

end.
