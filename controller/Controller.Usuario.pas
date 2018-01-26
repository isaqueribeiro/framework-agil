unit Controller.Usuario;

interface

Uses
  TypeAgil.Constants,
  TypeAgil.ComplexTypes,
  InterfaceAgil.Controller,
  ClasseAgil.BaseObject,
  Model.Usuario,
  Controller.Mensagem,

  IdCoder,
  IdCoder3to4,
  IdCoderMIME,
  IdBaseComponent,

  System.Classes, System.SysUtils, System.StrUtils,

  FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  Data.DB, Datasnap.DBClient;

  Type
    TUsuarioController = class(TInterfacedObject, IController)
    private
      class var aInstance : TUsuarioController;
      aMsg   : TMensagemController;
      aModel : TUsuario;
      procedure SetModel(Value : TUsuario);
      procedure GerarHash(const aDataSet : TDataSet);
      function GetModel : TUsuario;
    protected
      constructor Create;
      procedure CarregarDados(const aDataSet : TDataSet);
    public
      class function GetInstance: TUsuarioController;
      destructor Destroy; override;

      procedure New(const aDataSet: TDataSet); overload;
      procedure Load(const aDataSet: TDataSet); virtual; abstract;
      procedure Refresh(const aDataSet: TDataSet);
      procedure RefreshRecord(const aDataSet: TDataSet);

      function Edit(const aDataSet: TDataSet) : Boolean;
      function Delete(const aDataSet: TDataSet) : Boolean;
      function Save(const aDataSet: TDataSet) : Boolean;
      function Cancel(const aDataSet: TDataSet) : Boolean;
      function Find(ID: String; const aDataSet: TDataSet): TBaseObject;
      function New: TBaseObject; overload;
      function ExecuteQuery(const aTipoPesquisa : Integer; const aDataSet: TDataSet; aPesquisa : String) : Boolean;
    published
      property Model : TUsuario read GetModel write SetModel;
    end;

implementation

{ TUsuarioController }

function TUsuarioController.Cancel(const aDataSet: TDataSet): Boolean;
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

procedure TUsuarioController.CarregarDados(const aDataSet: TDataSet);
begin
  if Assigned(aDataSet) then
    with aDataSet do
    begin
      if (not FieldByName('id_usuario').IsNull) and (FieldByName('id_usuario').AsString <> EmptyStr) then
        aModel.ID := StringToGUID(FieldByName('id_usuario').AsString);

      aModel.Login        := FieldByName('ds_login').AsString;
      aModel.PrimeiroNome := FieldByName('ds_primeironome').AsString;
      aModel.Sobrenome    := FieldByName('ds_sobrenome').AsString;
      aModel.Senha        := FieldByName('ds_senha').AsString;
      aModel.Ativo        := (FieldByName('sn_ativo').AsInteger = FLAG_SIM);
      aModel.UsoSistema   := (FieldByName('sn_sistema').AsInteger = FLAG_SIM);
      aModel.Saved        := True;

      if not FieldByName('id_perfil').IsNull then
      begin
        aModel.Perfil.ID        := StringToGUID(FieldByName('id_perfil').AsString);
        aModel.Perfil.Descricao := FieldByName('ds_perfil').AsString;
      end
      else
      begin
        aModel.Perfil.ID        := StringToGUID(SYS_EMPTY_GUID);
        aModel.Perfil.Descricao := EmptyStr;
      end;
    end;
end;

constructor TUsuarioController.Create;
begin
  inherited Create;
  aMsg   := TMensagemController.GetInstance;
  aModel := TUsuario.Create;
end;

function TUsuarioController.Delete(const aDataSet: TDataSet): Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;
  try
    if Assigned(aDataSet) then
      if (aDataSet.Active and (not aDataSet.IsEmpty)) then
        if aModel.UsoSistema then
          aMsg.ShowWarning('Alerta', 'Usuário padrão de uso do sistema não pode ser excuído')
        else
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

destructor TUsuarioController.Destroy;
begin
  aModel.Free;
  inherited;
end;

function TUsuarioController.Edit(const aDataSet: TDataSet): Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;
  try
    if Assigned(aDataSet) then
      if (aDataSet.Active and (not aDataSet.IsEmpty)) then
        if aModel.UsoSistema then
          aMsg.ShowWarning('Alerta', 'Usuário padrão de uso do sistema não pode ser alterado')
        else
        begin
          TFDQuery(aDataSet).Edit;
          aRetorno := True;
        end;
  finally
    Result := aRetorno;
  end;
end;

function TUsuarioController.ExecuteQuery(const aTipoPesquisa: Integer;
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

        ParamByName('id_usuario').Clear;
        ParamByName('ds_login').Clear;
        ParamByName('ds_nome').Clear;

        Case aTipoPesquisa of
          TYPE_DEFAULT_QUERY_AUTOMATICO :
            begin
              ParamByName('ds_login').AsString := AnsiLowerCase(aPesquisa) + '%';
              ParamByName('ds_nome').AsString  := AnsiUpperCase(StringReplace(Trim(aPesquisa), ' ', '%', [rfReplaceAll])) + '%';
            end;
          TYPE_DEFAULT_QUERY_CODIGO     : ParamByName('ds_login').AsString := AnsiLowerCase(aPesquisa) + '%';
          TYPE_DEFAULT_QUERY_DESCRITIVA : ParamByName('ds_nome').AsString  := AnsiUpperCase(StringReplace(Trim(aPesquisa), ' ', '%', [rfReplaceAll])) + '%';
        end;

        aDataSet.Open;

        aRetorno := not aDataSet.IsEmpty;
      end;
  finally
    Result := aRetorno;
  end;
end;

function TUsuarioController.Find(ID: String;
  const aDataSet: TDataSet): TBaseObject;
begin
  // Carregar dados da base
  if Assigned(aDataSet) then
    with TFDQuery(aDataSet) do
    begin
      if aDataSet.Active then
        aDataSet.Close;

      ParamByName('id_usuario').AsString := Trim(ID);
      ParamByName('ds_login').Clear;
      ParamByName('ds_nome').Clear;

      aDataSet.Open;
      if not aDataSet.IsEmpty then
        CarregarDados(aDataSet)
      else
        aModel.Saved := False;
    end;

  Result := aModel;
end;

procedure TUsuarioController.GerarHash(const aDataSet : TDataSet);
var
  sKeyChar    ,
  sStrEncode  : String;
  iTamanhoStr ,
  iPosicaoKey : Integer;
  IdEncoder   : TIdEncoderMIME;
begin
  IdEncoder := TIdEncoderMIME.Create(nil);
  with aModel, Hash do
  begin
    BeginUpdate;
    try
      if Assigned(aDataSet) then
        if aDataSet.Active then
          with aDataSet do
            begin
              aModel.Login        := FieldByName('ds_login').AsString;
              aModel.PrimeiroNome := FieldByName('ds_primeironome').AsString;
              aModel.Sobrenome    := FieldByName('ds_sobrenome').AsString;
              aModel.Perfil.ID    := StringToGUID(FieldByName('id_perfil').AsString);
            end;

      sKeyChar   := IdEncoder.EncodeString(SYS_PASSWD_KEY);
      sStrEncode := IdEncoder.EncodeString(
          GUIDToString(ID)
        + Login
        + PrimeiroNome
        + Sobrenome
        + GUIDToString(Perfil.ID));
      iTamanhoStr := Length(sStrEncode);

      iPosicaoKey := -1;
      while (iPosicaoKey < 0) do
        iPosicaoKey := Random(iTamanhoStr);

      if ((iPosicaoKey mod 2) = 0) then
        sKeyChar := ReverseString(sKeyChar);

      Clear;
      Add( Copy(sStrEncode, 1, iPosicaoKey) + sKeyChar + Copy(sStrEncode, iPosicaoKey + 1, iTamanhoStr) );
    finally
      IdEncoder.Free;
      EndUpdate;
    end;
  end;
end;

class function TUsuarioController.GetInstance: TUsuarioController;
begin
  if not Assigned(aInstance) then
    aInstance := TUsuarioController.Create;
  Result := aInstance;
end;

function TUsuarioController.GetModel: TUsuario;
begin
  Result := aModel;
end;

function TUsuarioController.New: TBaseObject;
begin
  if Assigned(aModel) then
    aModel.Free;

  aModel := TUsuario.Create;
  Result := aModel;
end;

procedure TUsuarioController.New(const aDataSet: TDataSet);
begin
  if Assigned(aDataSet) then
  begin
    if not aDataSet.Active then
      TFDQuery(aDataSet).CreateDataSet;

    TFDQuery(aDataSet).Append;

    // Recuperar os valores padrão do DataSet para o Model
    aModel.ID         := StringToGUID(aDataSet.FieldByName('id_usuario').AsString);
    aModel.Login      := aDataSet.FieldByName('ds_login').AsString;
    aModel.Ativo      := (aDataSet.FieldByName('sn_ativo').AsInteger = FLAG_SIM);
    aModel.UsoSistema := (aDataSet.FieldByName('sn_sistema').AsInteger = FLAG_SIM);
    aModel.Saved      := False;
  end;
end;

function TUsuarioController.Save(const aDataSet: TDataSet): Boolean;
begin
  if Assigned(aDataSet) then
    if aDataSet.Active then
      with TFDQuery(aDataSet) do
      begin
//        FieldByName('id_usuario').AsString := GUIDToString(aModel.ID);
//        FieldByName('ds_login').AsString   := aModel.Login;

        Self.GerarHash(aDataSet);
        TMemoField(FieldByName('hs_usuario')).Text := aModel.Hash.Text;
        FieldByName('ds_login').AsString := AnsiLowerCase(Trim(FieldByName('ds_login').AsString));

        TFDQuery(aDataSet).Post;
        if TFDQuery(aDataSet).CachedUpdates then
          TFDQuery(aDataSet).ApplyUpdates(0);

        TFDQuery(aDataSet).Connection.CommitRetaining;

        aModel.Saved := True;
      end;

  Result := aModel.Saved;
end;

procedure TUsuarioController.SetModel(Value: TUsuario);
begin
  aModel := Value;
end;

procedure TUsuarioController.Refresh(const aDataSet: TDataSet);
begin
  if Assigned(aDataSet) then
    if aDataSet.Active then
      TFDQuery(aDataSet).Refresh;
end;

procedure TUsuarioController.RefreshRecord(const aDataSet: TDataSet);
begin
  if Assigned(aDataSet) then
    if aDataSet.Active then
      with TFDQuery(aDataSet) do
      begin
        if RefreshRecord then
          CarregarDados(aDataSet);
      end;
end;

end.
