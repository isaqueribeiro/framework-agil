unit ClasseAgil.Formulario;

interface

uses
  InterfaceAgil.Observer,
  ClasseAgil.FormFactory,

  System.Classes, Vcl.Forms, Vcl.Controls, TypInfo;

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


var
  FForm : TForm;

implementation

{ TFormularios }

class function TFormularios.EstaAberto(sForm: String): Boolean;
var
  I : Integer;
begin
  // Verificar se já foi Chamada
  Result := False;
  for I := Screen.FormCount - 1 downto 0 do
    if Screen.Forms[i].name  = sForm then
    begin
      Result := True;
      Exit;
    end;
end;

class procedure TFormularios.FecharTodos;
var
  I : Integer;
  aForm : TForm;
begin
  // Fecha todos os formulários Abertos
  for I := Screen.FormCount - 1 downto 0 do
    if (Screen.Forms[I].Name <> 'frmPrincipal') and (Screen.Forms[I].Name <> 'frmMain') then
      if Assigned(Screen.Forms[I]) then
      begin
         aForm := Screen.Forms[I];
         aForm.Close;
      end;
end;

class procedure TFormularios.RegisterForm(const aFormName: string;
  aFormClass: TComponentClass);
begin
  TFormFactory.GetInstance.RegisterForm(aFormName, aFormClass);
end;

class procedure TFormularios.ShowForm(const AOnwer: TComponent;
  NomeForm: String);
begin
  if TFormularios.EstaAberto(NomeForm) then
    FForm.BringToFront
  else
  begin
    FForm := TFormFactory.GetInstance.CreateForm(AOnwer, NomeForm);
    FForm.Show;
  end;
//  if not TFormularios.EstaAberto(NomeForm) then
//    FForm := TFormFactory.GetInstance.CreateForm(AOnwer, NomeForm);
//  FForm.Show;
end;

class function TFormularios.ShowModalForm(const AOnwer: TComponent;
  NomeForm: String): Boolean;
begin
  try
    if not TFormularios.EstaAberto(NomeForm) then
      FForm := TFormFactory.GetInstance.CreateForm(AOnwer, NomeForm);
    try
      Result := (FForm.ShowModal = mrOk);
    except
      FForm  := TFormFactory.GetInstance.CreateForm(AOnwer, NomeForm);
      Result := (FForm.ShowModal = mrOk);
    end;
  finally
    FForm.Free;
  end;
end;

class function TFormularios.ShowModalFormObserver(const AOnwer: TComponent;
  NomeForm: String; Observador: IObservador): Boolean;
begin
  try
    if not TFormularios.EstaAberto(NomeForm) then
      FForm := TFormFactory.GetInstance.CreateForm(AOnwer, NomeForm);

    // Adicionando o "Observador" no formulário "Observado"
    IObservable(FForm as IObservable).addObserver(Observador);

    try
      Result := (FForm.ShowModal = mrOk);
    except
      FForm  := TFormFactory.GetInstance.CreateForm(AOnwer, NomeForm);

      // Adicionando o "Observador" no formulário "Observado"
      IObservable(FForm as IObservable).addObserver(Observador);

      Result := (FForm.ShowModal = mrOk);
    end;
  finally
    FForm.Free;
  end;
end;

end.
