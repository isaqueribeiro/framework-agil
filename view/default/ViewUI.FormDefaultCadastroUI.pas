unit ViewUI.FormDefaultCadastroUI;

interface

uses
  TypeAgil.Constants,
  InterfaceAgil.Observer,
  Controller.Rotina,
  DataModule.Recursos,
  ViewUI.FormDefaultUI,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, Data.DB,
  cxLookAndFeels, cxLookAndFeelPainters, dxCustomWizardControl, dxWizardControl,
  System.Actions, Vcl.ActnList,

  dxSkinsCore, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White;

type
  TFormDefaultCadastroUI = class(TFormDefaultUI)
    wcCadastro: TdxWizardControl;
    pgNominal: TdxWizardControlPage;
    dtsCadastro: TDataSource;
    acnEvento: TActionList;
    acnCancelarFechar: TAction;
    acnNovo: TAction;
    procedure FormCreate(Sender: TObject);
    procedure dtsCadastroStateChange(Sender: TObject);
    procedure wcCadastroButtonClick(Sender: TObject;
      AKind: TdxWizardControlButtonKind; var AHandled: Boolean);
    procedure acnCancelarFecharExecute(Sender: TObject);
    procedure acnNovoExecute(Sender: TObject);
  private
    { Private declarations }
    function GetEmEdicao : Boolean;
  public
    { Public declarations }
    property FormularioEmEdicao : Boolean read GetEmEdicao;

    procedure New; virtual; abstract;
    procedure Cancel; virtual; abstract;
    procedure Save; virtual; abstract;
    procedure RefreshRecord; virtual; abstract;

  end;

var
  FormDefaultCadastroUI: TFormDefaultCadastroUI;

implementation

{$R *.dfm}

procedure TFormDefaultCadastroUI.acnCancelarFecharExecute(Sender: TObject);
begin
  if FormularioEmEdicao then
    Cancel
  else
    Self.Close;
end;

procedure TFormDefaultCadastroUI.acnNovoExecute(Sender: TObject);
begin
  if Assigned(dtsCadastro.DataSet) then
  begin
    Self.New;
    wcCadastro.ActivePage := pgNominal;
  end;
end;

procedure TFormDefaultCadastroUI.dtsCadastroStateChange(Sender: TObject);
begin
  if Assigned(dtsCadastro.DataSet) then
    with wcCadastro.Buttons do
    begin
      Finish.Enabled := FormularioEmEdicao;

      if FormularioEmEdicao then
      begin
        Cancel.Caption    := '&Cancelar';
        Cancel.ImageIndex := IDX_OFFICE13_IMAGE_CANCEL;
      end
      else
      begin
        Cancel.Caption    := '&Fechar';
        Cancel.ImageIndex := IDX_OFFICE13_IMAGE_CLOSE;
      end;
    end;
end;

procedure TFormDefaultCadastroUI.FormCreate(Sender: TObject);
begin
  Descricao := pgNominal.Header.Description;
  inherited;
  wcCadastro.ActivePage  := pgNominal;
  pgNominal.Header.Title := Trim(Self.Caption);
end;

function TFormDefaultCadastroUI.GetEmEdicao: Boolean;
begin
  if Assigned(dtsCadastro.DataSet) then
    Result := (dtsCadastro.DataSet.State in [dsEdit, dsInsert])
  else
    Result := False;
end;

procedure TFormDefaultCadastroUI.wcCadastroButtonClick(Sender: TObject;
  AKind: TdxWizardControlButtonKind; var AHandled: Boolean);
begin
  Case AKind of
    wcbkBack   : ;
    wcbkNext   : ;
    wcbkFinish : Save;
    wcbkCancel : acnCancelarFechar.Execute;
    wcbkHelp   : ;
  end;
end;

end.
