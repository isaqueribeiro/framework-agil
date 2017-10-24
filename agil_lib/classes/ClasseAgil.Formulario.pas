unit ClasseAgil.Formulario;

interface

uses
  InterfaceAgil.Observer,
  ClasseAgil.FormFactory,

  System.Classes, System.StrUtils, System.SysUtils, Vcl.Forms, Vcl.Controls, TypInfo;

  type
    TFormularios = class
    private
    public
      class function EstaAberto(sForm: String): Boolean;
      class function ShowModalForm(const AOnwer : TComponent; NomeForm: String): Boolean;
      class function ShowModalFormObserver(const AOnwer : TComponent; NomeForm: String; Observador : IObservador): Boolean;

      class procedure ShowForm(const AOnwer : TComponent; NomeForm: String);
      class procedure RegisterForm(const aFormName: string; aFormClass: TComponentClass);
      class procedure FecharTodos;
  end;


implementation

{ TFormularios }

class function TFormularios.EstaAberto(sForm: String): Boolean;
var
  I : Integer;
begin
  // Verificar se já foi Chamada
  Result := False;
  for I := Screen.FormCount - 1 downto 0 do
    if AnsiUpperCase(Screen.Forms[i].Name) = AnsiUpperCase(sForm) then
    begin
      Result := True;
      Exit;
    end;
end;

class procedure TFormularios.FecharTodos;
var
  I : Integer;
  aForm : TForm;
  sForm : String;
begin
  // Fecha todos os formulários Abertos
  for I := Screen.FormCount - 1 downto 0 do
  begin
    sForm := AnsiUpperCase(Screen.Forms[I].Name);
    if (sForm <> AnsiUpperCase('frmPrincipal')) and (sForm <> AnsiUpperCase('frmMain')) then
      if Assigned(Screen.Forms[I]) then
      begin
         aForm := Screen.Forms[I];
         aForm.Close;
      end;
  end;
end;

class procedure TFormularios.RegisterForm(const aFormName: string;
  aFormClass: TComponentClass);
begin
  TFormFactory.GetInstance.RegisterForm(aFormName, aFormClass);
end;

class procedure TFormularios.ShowForm(const AOnwer: TComponent;
  NomeForm: String);
var
  aForm : TForm;
begin
  if TFormularios.EstaAberto(NomeForm) then
  begin
    aForm := TFormFactory.GetInstance.GetForm(NomeForm);
    aForm.BringToFront;
  end
  else
  begin
    aForm := TFormFactory.GetInstance.CreateForm(AOnwer, NomeForm);
    aForm.Show;
  end;
end;

class function TFormularios.ShowModalForm(const AOnwer: TComponent;
  NomeForm: String): Boolean;
var
  aForm : TForm;
begin
  try
    if TFormularios.EstaAberto(NomeForm) then
      aForm := TFormFactory.GetInstance.GetForm(NomeForm)
    else
      aForm := TFormFactory.GetInstance.CreateForm(AOnwer, NomeForm);

    try
      Result := (aForm.ShowModal = mrOk);
    except
      aForm  := TFormFactory.GetInstance.CreateForm(AOnwer, NomeForm);
      Result := (aForm.ShowModal = mrOk);
    end;
  finally
    aForm.Free;
  end;
end;

class function TFormularios.ShowModalFormObserver(const AOnwer: TComponent;
  NomeForm: String; Observador: IObservador): Boolean;
var
  aForm : TForm;
begin
  try
    if TFormularios.EstaAberto(NomeForm) then
      aForm := TFormFactory.GetInstance.GetForm(NomeForm)
    else
      aForm := TFormFactory.GetInstance.CreateForm(AOnwer, NomeForm);

    // Adicionando o "Observador" no formulário "Observado"
    IObservable(aForm as IObservable).addObserver(Observador);

    try
      Result := (aForm.ShowModal = mrOk);
    except
      aForm  := TFormFactory.GetInstance.CreateForm(AOnwer, NomeForm);

      // Adicionando o "Observador" no formulário "Observado"
      IObservable(aForm as IObservable).addObserver(Observador);

      Result := (aForm.ShowModal = mrOk);
    end;
  finally
    aForm.Free;
  end;
end;

end.
