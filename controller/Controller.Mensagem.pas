unit Controller.Mensagem;

interface

Uses
  TypeAgil.ComplexTypes,
  TypeAgil.Constants,

  Winapi.Windows, Vcl.Forms, Vcl.Dialogs, System.Classes, System.SysUtils, System.StrUtils;

  Type
    TMensagemController = class(TInterfacedObject)
    private
      class var aInstance : TMensagemController;
    protected
      constructor Create;
    public
      class function GetInstance: TMensagemController;
    published
      procedure ShowInformation(aTitulo, aMensagem : String);
      procedure ShowWarning(aTitulo, aMensagem : String);
      procedure ShowError(aTitulo, aMensagem : String);

      function ShowConfirmation(aTitulo, aMensagem : String) : Boolean;
  end;

implementation

{ TMensagemController }

constructor TMensagemController.Create;
begin
  inherited Create;
end;

class function TMensagemController.GetInstance: TMensagemController;
begin
  if not Assigned(aInstance) then
    aInstance := TMensagemController.Create;
  Result := aInstance;
end;

function TMensagemController.ShowConfirmation(aTitulo,
  aMensagem: String): Boolean;
begin
  //Result := (MessageDlg(aMensagem, mtConfirmation, [mbYes, mbNo], 0) = ID_YES);
  Result := (Application.MessageBox(PWideChar(aMensagem),
    PWideChar(aTitulo),
    MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = ID_YES);
end;

procedure TMensagemController.ShowInformation(aTitulo, aMensagem: String);
begin
  //MessageDlg(aMensagem, mtInformation, [mbOK], 0);
  Application.MessageBox(PWideChar(aMensagem), PWideChar(aTitulo), MB_ICONINFORMATION);
end;

procedure TMensagemController.ShowWarning(aTitulo, aMensagem: String);
begin
  //MessageDlg(aMensagem, mtWarning, [mbOK], 0);
  Application.MessageBox(PWideChar(aMensagem), PWideChar(aTitulo), MB_ICONEXCLAMATION);
end;

procedure TMensagemController.ShowError(aTitulo, aMensagem: String);
begin
  //MessageDlg(aMensagem, mtError, [mbOK], 0);
  Application.MessageBox(PWideChar(aMensagem), PWideChar(aTitulo), MB_ICONERROR);
end;

end.
