unit Controller.Endereco;

interface

Uses
  TypeAgil.ComplexTypes,
  TypeAgil.Constants,
  InterfaceAgil.Controller,
  ClasseAgil.BaseObject,
  Model.Endereco,
  Controller.Mensagem,

  System.Classes, System.SysUtils, System.StrUtils, IniFiles,

  FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  Data.DB, Datasnap.DBClient;

  Type
    TEnderecoController = class(TInterfacedObject, IController)
    private
      class var aInstance : TEnderecoController;
      aMsg   : TMensagemController;
      aModel : TEndereco;

      procedure SetModel(Value : TEndereco);
      function GetModel : TEndereco;
    protected
      constructor Create;
      procedure CarregarDados(const aDataSet : TDataSet); virtual; abstract;
      procedure FreeFieldsReadOnly(const aDataSet: TDataSet);
    public
      class function GetInstance: TEnderecoController;
      destructor Destroy; override;

      procedure New(const aDataSet: TDataSet); overload;
      procedure Load(const aDataSet: TDataSet); virtual; abstract;
      procedure Refresh(const aDataSet: TDataSet);
      procedure RefreshRecord(const aDataSet: TDataSet);

      function Edit(const aDataSet: TDataSet) : Boolean;
      function Delete(const aDataSet: TDataSet) : Boolean;
      function Save(const aDataSet: TDataSet) : Boolean;
      function Cancel(const aDataSet: TDataSet) : Boolean;
      function Find(ID: String; const aDataSet: TDataSet): TBaseObject; overload;
      function Find(aNumero: Currency; const aDataSet: TDataSet): TBaseObject; overload;
      function New: TBaseObject; overload;
      function ExecuteQuery(const aTipoPesquisa : Integer; const aDataSet: TDataSet; aPesquisa : String) : Boolean;
    published
      property Model : TEndereco read GetModel write SetModel;
    end;

implementation

{ TEnderecoController }

function TEnderecoController.Cancel(const aDataSet: TDataSet): Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;
  try
    if Assigned(aDataSet) then
      if (aDataSet.State in [dsEdit, dsInsert]) then
      begin
        TFDQuery(aDataSet).Cancel;
        aRetorno := True;
      end;
  finally
    Result := aRetorno;
  end;
end;

constructor TEnderecoController.Create;
begin
  inherited Create;
  aMsg   := TMensagemController.GetInstance;
  aModel := TEndereco.Create;
end;

function TEnderecoController.Delete(const aDataSet: TDataSet): Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;
  try
    if Assigned(aDataSet) then
      if (aDataSet.Active and (not aDataSet.IsEmpty)) then
        if aMsg.ShowConfirmation('Excluir', 'Confirma a exclusão do registros selecionado?') then
        begin
          TFDQuery(aDataSet).Delete;

          if TFDQuery(aDataSet).CachedUpdates then
            TFDQuery(aDataSet).ApplyUpdates(0);

          TFDQuery(aDataSet).Connection.CommitRetaining;

          aRetorno := True;
        end;
  finally
    Result := aRetorno;
  end;
end;

destructor TEnderecoController.Destroy;
begin
  aModel.Destroy;
  inherited;
end;

function TEnderecoController.Edit(const aDataSet: TDataSet): Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;
  try
    if Assigned(aDataSet) then
      if (aDataSet.Active and (not aDataSet.IsEmpty)) then
        begin
          TFDQuery(aDataSet).Edit;
          aRetorno := True;
        end;
  finally
    Result := aRetorno;
  end;
end;

function TEnderecoController.ExecuteQuery(const aTipoPesquisa: Integer;
  const aDataSet: TDataSet; aPesquisa: String): Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;
  try
    if Assigned(aDataSet) then
      with TFDQuery(aDataSet) do
      begin
        if aDataSet.Active then
          aDataSet.Close;

        ParamByName('id_cep').Clear;
        ParamByName('nr_cep').Clear;
        ParamByName('ds_endereco').Clear;
        ParamByName('cd_cidade').AsInteger := aModel.Cidade.Codigo;
        ParamByName('todos').AsInteger     := 0;

        Case aTipoPesquisa of
          TYPE_DEFAULT_QUERY_AUTOMATICO :
            begin
              if StrToCurrDef(Trim(aPesquisa), 0) > 0 then
                ParamByName('nr_cep').AsCurrency := StrToCurrDef(Trim(aPesquisa), 0)
              else
                ParamByName('ds_endereco').AsString := StringReplace(Trim(aPesquisa), ' ', '%', [rfReplaceAll]) + '%';
            end;
          TYPE_DEFAULT_QUERY_CODIGO     : ParamByName('nr_cep').AsCurrency := StrToCurrDef(Trim(aPesquisa), 0);
          TYPE_DEFAULT_QUERY_DESCRITIVA : ParamByName('ds_endereco').AsString := StringReplace(Trim(aPesquisa), ' ', '%', [rfReplaceAll]) + '%';
        end;

        aDataSet.Open;
        FreeFieldsReadOnly(aDataSet);

        aRetorno := not aDataSet.IsEmpty;
      end;
  finally
    Result := aRetorno;
  end;
end;

function TEnderecoController.Find(aNumero: Currency;
  const aDataSet: TDataSet): TBaseObject;
begin
  // Carregar dados da base
  if Assigned(aDataSet) then
    with TFDQuery(aDataSet) do
    begin
      if aDataSet.Active then
        aDataSet.Close;

      ParamByName('id_cep').Clear;
      ParamByName('nr_cep').AsCurrency := aNumero;
      ParamByName('todos').AsInteger   := 1;
      ParamByName('ds_endereco').Clear;
      ParamByName('cd_cidade').Clear;

      aDataSet.Open;
      if not aDataSet.IsEmpty then
        CarregarDados(aDataSet)
      else
        aModel.Saved := False;
    end;

  Result := aModel;
end;

procedure TEnderecoController.FreeFieldsReadOnly(const aDataSet: TDataSet);
var
  I : Integer;
begin
  if Assigned(aDataSet) then
    if aDataSet.Active then
      for I := 0 to aDataSet.Fields.Count - 1 do
        if aDataSet.Fields[I].ReadOnly then
          aDataSet.Fields[I].ReadOnly := False;
end;

function TEnderecoController.Find(ID: String;
  const aDataSet: TDataSet): TBaseObject;
begin
  // Carregar dados da base
  if Assigned(aDataSet) then
    with TFDQuery(aDataSet) do
    begin
      if aDataSet.Active then
        aDataSet.Close;

      ParamByName('id_cep').AsString   := Trim(ID);
      ParamByName('nr_cep').AsCurrency := 0;
      ParamByName('todos').AsInteger   := 1;
      ParamByName('ds_endereco').Clear;
      ParamByName('cd_cidade').Clear;

      aDataSet.Open;
      if not aDataSet.IsEmpty then
        CarregarDados(aDataSet)
      else
        aModel.Saved := False;
    end;

  Result := aModel;
end;

class function TEnderecoController.GetInstance: TEnderecoController;
begin
  if not Assigned(aInstance) then
    aInstance := TEnderecoController.Create;
  Result := aInstance;
end;

function TEnderecoController.GetModel: TEndereco;
begin
  Result := aModel;
end;

function TEnderecoController.New: TBaseObject;
begin
  if Assigned(aModel) then
    aModel.Free;

  aModel := TEndereco.Create;
  Result := aModel;
end;

procedure TEnderecoController.New(const aDataSet: TDataSet);
begin
  if Assigned(aDataSet) then
  begin
    if not aDataSet.Active then
      TFDQuery(aDataSet).CreateDataSet;

    TFDQuery(aDataSet).Append;

    // Recuperar os valores padrão do DataSet para o Model
    aModel.ID         := StringToGUID(aDataSet.FieldByName('id_cep').AsString);
//    aModel.Login      := aDataSet.FieldByName('ds_login').AsString;
//    aModel.Ativo      := (aDataSet.FieldByName('sn_ativo').AsInteger = FLAG_SIM);
//    aModel.UsoSistema := (aDataSet.FieldByName('sn_sistema').AsInteger = FLAG_SIM);
    aModel.Saved      := False;
  end;
end;

procedure TEnderecoController.Refresh(const aDataSet: TDataSet);
begin
  if Assigned(aDataSet) then
    if aDataSet.Active then
      TFDQuery(aDataSet).Refresh;
end;

procedure TEnderecoController.RefreshRecord(const aDataSet: TDataSet);
begin
  if Assigned(aDataSet) then
    if aDataSet.Active then
      with TFDQuery(aDataSet) do
      begin
        if RefreshRecord then
          CarregarDados(aDataSet);
      end;
end;

function TEnderecoController.Save(const aDataSet: TDataSet): Boolean;
begin
  if Assigned(aDataSet) then
    if aDataSet.Active then
      with TFDQuery(aDataSet) do
      begin
//        Self.GerarHash(aDataSet);
//        TMemoField(FieldByName('hs_usuario')).Text := aModel.Hash.Text;
//        FieldByName('ds_login').AsString := AnsiLowerCase(Trim(FieldByName('ds_login').AsString));
//
//        if (aModel.Senha <> EmptyStr) then
//          FieldByName('ds_senha').AsString := aModel.Senha;
//
//        if (FieldByName('sn_ativo').OldValue <> FieldByName('sn_ativo').NewValue) then
//        begin
//          if (FieldByName('sn_ativo').AsInteger = FLAG_SIM) then
//            FieldByName('dt_ativo').AsDateTime := Now
//          else
//            FieldByName('dt_ativo').Clear;
//        end;
//
//        if LoginCadastro(TFDQuery(aDataSet)) then
//          aMsg.ShowWarning('Alerta', 'Login informado já existe!')
//        else
//        begin
//          TFDQuery(aDataSet).Post;
//          if TFDQuery(aDataSet).CachedUpdates then
//            TFDQuery(aDataSet).ApplyUpdates(0);
//
//          TFDQuery(aDataSet).Connection.CommitRetaining;
//          Self.RefreshRecord(aDataSet);
//
//          aModel.Saved := True;
//        end;
      end;

  Result := aModel.Saved;
end;

procedure TEnderecoController.SetModel(Value: TEndereco);
begin
  aModel := Value;
end;

end.
