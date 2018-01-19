unit Controller.Perfil;

interface

Uses
  TypeAgil.Constants,
  TypeAgil.ComplexTypes,
  InterfaceAgil.Controller,
  ClasseAgil.BaseObject,
  Model.Perfil,

  System.Classes, System.SysUtils, System.StrUtils,

  FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  Data.DB, Datasnap.DBClient;

  Type
    TPerfilController = class(TInterfacedObject, IController)
    private
      class var aInstance : TPerfilController;
      aModel : TPerfil;
      procedure SetModel(Value : TPerfil);
      function GetModel : TPerfil;
    protected
      constructor Create;
    public
      class function GetInstance: TPerfilController;
      destructor Destroy; override;

      procedure New(const aDataSet: TDataSet); overload;
      procedure Load(const aDataSet: TDataSet);
      procedure Refresh(const aDataSet: TDataSet);
      procedure RefreshRecord(const aDataSet: TDataSet);

      function Save(const aDataSet: TDataSet) : Boolean;
      function Cancel(const aDataSet: TDataSet) : Boolean;
      function Find(ID: String; const aDataSet: TDataSet): TBaseObject;
      function New: TBaseObject; overload;
      function ExecuteQuery(const aTipoPesquisa : Integer; const aDataSet: TDataSet; aPesquisa : String) : Boolean;
    published
      property Model : TPerfil read GetModel write SetModel;
  end;

implementation

{ TPerfilController }

function TPerfilController.Cancel(const aDataSet: TDataSet) : Boolean;
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

constructor TPerfilController.Create;
begin
  inherited Create;
  aModel := TPerfil.Create;
end;

destructor TPerfilController.Destroy;
begin
  aModel.Free;
  inherited;
end;

function TPerfilController.ExecuteQuery(const aTipoPesquisa: Integer;
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

        ParamByName('id_perfil').Clear;
        ParamByName('cd_perfil').Clear;
        ParamByName('ds_perfil').Clear;

        Case aTipoPesquisa of
          TYPE_DEFAULT_QUERY_AUTOMATICO :
            if StrToIntDef(aPesquisa, 0) > 0 then
              ParamByName('cd_perfil').AsInteger := StrToIntDef(aPesquisa, 0)
            else
              ParamByName('ds_perfil').AsString  := aPesquisa + '%';
          TYPE_DEFAULT_QUERY_CODIGO     : ParamByName('cd_perfil').AsInteger := StrToIntDef(aPesquisa, 0);
          TYPE_DEFAULT_QUERY_DESCRITIVA : ParamByName('ds_perfil').AsString  := aPesquisa + '%';
        end;

        aDataSet.Open;

        aRetorno := not aDataSet.IsEmpty;
      end;
  finally
    Result := aRetorno;
  end;
end;

function TPerfilController.Find(ID: String;
  const aDataSet: TDataSet): TBaseObject;
begin
  // Carregar dados da base
  if Assigned(aDataSet) then
    with TFDQuery(aDataSet) do
    begin
      if aDataSet.Active then
        aDataSet.Close;

      ParamByName('id_perfil').AsString := Trim(ID);
      ParamByName('cd_perfil').Clear;
      ParamByName('ds_perfil').Clear;

      aDataSet.Open;
      if not aDataSet.IsEmpty then
      begin
        if (not FieldByName('id_perfil').IsNull) and (FieldByName('id_perfil').AsString <> EmptyStr) then
          aModel.ID := StringToGUID(FieldByName('id_perfil').AsString);

        aModel.Codigo     := FieldByName('cd_perfil').AsInteger;
        aModel.Descricao  := Trim(FieldByName('ds_perfil').AsString);
        aModel.UsoSistema := (FieldByName('sn_sistema').AsInteger = FLAG_SIM);
        aModel.Ativo      := (FieldByName('sn_ativo').AsInteger = FLAG_SIM);
        aModel.Saved      := True;
      end
      else
        aModel.Saved := False;
    end;

  Result := aModel;
end;

class function TPerfilController.GetInstance: TPerfilController;
begin
  if not Assigned(aInstance) then
    aInstance := TPerfilController.Create;
  Result := aInstance;
end;

function TPerfilController.GetModel: TPerfil;
begin
  Result := aModel;
end;

procedure TPerfilController.Load(const aDataSet: TDataSet);
begin
  ;
end;

procedure TPerfilController.New(const aDataSet: TDataSet);
begin
  if Assigned(aDataSet) then
  begin
    if not aDataSet.Active then
      TFDQuery(aDataSet).CreateDataSet;

    TFDQuery(aDataSet).Append;

    // Recuperar os valores padrão do DataSet para o Model
    aModel.ID     := StringToGUID(aDataSet.FieldByName('id_perfil').AsString);
    aModel.Codigo := aDataSet.FieldByName('cd_perfil').AsInteger;
    aModel.Ativo  := (aDataSet.FieldByName('sn_ativo').AsInteger = FLAG_SIM);
    aModel.UsoSistema := (aDataSet.FieldByName('sn_sistema').AsInteger = FLAG_SIM);
    aModel.Saved      := False;
  end;
end;

function TPerfilController.New: TBaseObject;
begin
  if Assigned(aModel) then
    aModel.Free;

  aModel := TPerfil.Create;
  Result := aModel;
end;

procedure TPerfilController.Refresh(const aDataSet: TDataSet);
begin
  if Assigned(aDataSet) then
    if aDataSet.Active then
      TFDQuery(aDataSet).Refresh;
end;

procedure TPerfilController.RefreshRecord(const aDataSet: TDataSet);
begin
  if Assigned(aDataSet) then
    if aDataSet.Active then
      TFDQuery(aDataSet).RefreshRecord;
end;

function TPerfilController.Save(const aDataSet: TDataSet) : Boolean;
begin
  if Assigned(aDataSet) then
    if aDataSet.Active then
      with TFDQuery(aDataSet) do
      begin
//        FieldByName('id_perfil').AsString  := GUIDToString(aModel.ID);
//        FieldByName('cd_perfil').AsString  := aModel.Codigo;
//        FieldByName('ds_perfil').AsString  := aModel.Descricao;

        TFDQuery(aDataSet).Post;
        if TFDQuery(aDataSet).CachedUpdates then
          TFDQuery(aDataSet).ApplyUpdates(0);

        TFDQuery(aDataSet).Connection.CommitRetaining;

        aModel.Saved := True;
      end;

  Result := aModel.Saved;
end;

procedure TPerfilController.SetModel(Value: TPerfil);
begin
  aModel := Value;
end;

end.
