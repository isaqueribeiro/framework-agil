unit ViewUI.FormRequiredFields;

interface

uses
  TypeAgil.Constants,
  DataModule.Recursos,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  cxLabel, dxGDIPlusClasses, Vcl.ExtCtrls, cxMCListBox;

type
  TFormRequiredFields = class(TForm)
    pnlHeader: TPanel;
    imgHeader: TImage;
    lblHeaderTitle: TcxLabel;
    lblHeaderDescription: TcxLabel;
    ltbCampos: TcxMCListBox;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function ShowRequiredFields(const AOwner : TComponent; aListFields : TStringList;
    aTableName : String) : Boolean;

implementation

{$R *.dfm}

function ShowRequiredFields(const AOwner : TComponent; aListFields : TStringList;
  aTableName : String) : Boolean;
var
  aForm : TFormRequiredFields;
  aRetorno : Boolean;
  I : Integer;
begin
  try
    aRetorno := (aListFields.Count > 0);
    if aRetorno then
    begin
      aForm := TFormRequiredFields.Create(AOwner);
      with aForm, ltbCampos do
      begin
        lblHeaderTitle.Caption := aTableName;

        Items.BeginUpdate;
        Items.Clear;

        for I := 0 to (aListFields.Count - 1) do
          Items.Add( FormatFloat('#0', I + 1) + Delimiter + aListFields.Strings[I] );

        Items.EndUpdate;

        ShowModal;
      end;
    end;
  finally
    if Assigned(aForm) then
      aForm.Free;

    Result := aRetorno;
  end;
end;

procedure TFormRequiredFields.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFormRequiredFields.FormCreate(Sender: TObject);
begin
  lblHeaderTitle.Left := 8;
  lblHeaderTitle.Top  := 8;
  lblHeaderDescription.Left := 28;
  lblHeaderDescription.Top  := 28;
end;

procedure TFormRequiredFields.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) then
    Self.Close;
end;

end.
