unit Controller.Rotina;

interface

Uses
  TypeAgil.ComplexTypes,
  InterfaceAgil.Controller,
  ClasseAgil.BaseObject,
  Model.Rotina,

  System.Classes, System.SysUtils, System.StrUtils,

  FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  Data.DB, Datasnap.DBClient;

  Type
    TRotinaController = class(TInterfacedObject, IController)
    private
      aModel : TRotina;
      procedure SetModel(Value : TRotina);
      function GetModel : TRotina;
    public
      constructor Create;
//      constructor CriarRotina(const aParent : TRotina; aNome, aDescricao : String);
      destructor Destroy; override;

      procedure New(const aDataSet: TDataSet); overload;
      procedure Load(const aDataSet: TDataSet);
      procedure Refresh(const aDataSet: TDataSet);
      procedure RefreshRecord(const aDataSet: TDataSet);

      function Save(const aDataSet: TDataSet) : Boolean; overload;
      function Save(const aProcedure: TFDStoredProc) : Boolean; overload;
      function Cancel(const aDataSet: TDataSet) : Boolean;
      function Find(ID: String; const aDataSet: TDataSet): TBaseObject;
      function New: TBaseObject; overload;
      function ExecuteQuery(const aTipoPesquisa : Integer; const aDataSet: TDataSet; aPesquisa : String) : Boolean;
    published
      property Model : TRotina read GetModel write SetModel;
  end;

implementation

{ TRotinaController }

constructor TRotinaController.Create;
begin
  inherited Create;
  aModel := TRotina.CriarRotina(EmptyStr, EmptyStr);
end;

//constructor TRotinaController.CriarRotina(const aParent : TRotina; aNome, aDescricao: String);
//begin
//  Self.Create;
//  aModel.Nome      := aNome;
//  aModel.Descricao := aDescricao;
//  aModel.Parent    := aParent;
//end;
//
destructor TRotinaController.Destroy;
begin
  aModel.Destroy;
  inherited;
end;

function TRotinaController.ExecuteQuery(const aTipoPesquisa: Integer;
  const aDataSet: TDataSet; aPesquisa: String): Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;
  try
    ;
  finally
    Result := aRetorno;
  end;
end;

function TRotinaController.Cancel(const aDataSet: TDataSet) : Boolean;
begin
  Result := False;
end;

function TRotinaController.Find(ID: String; const aDataSet: TDataSet): TBaseObject;
begin
  // Carregar dados da base
  if Assigned(aDataSet) then
    with TFDQuery(aDataSet) do
    begin
      if aDataSet.Active then
        aDataSet.Close;

      TFDQuery(aDataSet).ParamByName('key').AsString := Trim(ID); // "cd_rotina" será o campo de referência para o projeto

      aDataSet.Open;
      if not aDataSet.IsEmpty then
      begin
        if (not FieldByName('id_rotina').IsNull) and (FieldByName('id_rotina').AsString <> EmptyStr) then
          aModel.ID := StringToGUID(FieldByName('id_rotina').AsString);

        aModel.Codigo    := Trim(FieldByName('cd_rotina').AsString);
        aModel.Nome      := Trim(FieldByName('nm_rotina').AsString);
        aModel.Descricao := Trim(FieldByName('ds_rotina').AsString);
        aModel.Indice    := FieldByName('ix_rotina').AsInteger;
        aModel.Tipo      := ct_TipoRotina(FieldByName('tp_rotina').AsInteger);
        aModel.Saved     := True;

        if (not FieldByName('id_mestre').IsNull) then
          aModel.Parent.ID := StringToGUID(FieldByName('id_mestre').AsString)
        else
          aModel.Parent := nil;
      end
      else
        aModel.Saved := False;
    end;

  Result := aModel;
end;

function TRotinaController.GetModel: TRotina;
begin
  Result := aModel;
end;

procedure TRotinaController.Load(const aDataSet: TDataSet);
begin
  Self.Find(aModel.Codigo, aDataSet);
  aModel.Notify;
end;

procedure TRotinaController.New(const aDataSet: TDataSet);
begin
  ;
end;

function TRotinaController.New: TBaseObject;
begin
  aModel := TRotina.CriarRotina(EmptyStr, EmptyStr);
  Result := aModel;
end;

procedure TRotinaController.Refresh(const aDataSet: TDataSet);
begin
  if Assigned(aDataSet) then
    if aDataSet.Active then
      TFDQuery(aDataSet).Refresh;
end;

procedure TRotinaController.RefreshRecord(const aDataSet: TDataSet);
begin
  if Assigned(aDataSet) then
    if aDataSet.Active then
      TFDQuery(aDataSet).RefreshRecord;
end;

function TRotinaController.Save(const aDataSet: TDataSet) : Boolean;
begin
  if Assigned(aDataSet) then
    if aDataSet.Active then
      with TFDQuery(aDataSet) do
      begin
        if not aModel.Saved then
        begin
          if TFDQuery(aDataSet).IsEmpty then
            TFDQuery(aDataSet).Append
          else
            TFDQuery(aDataSet).Edit;

          FieldByName('id_rotina').AsString  := GUIDToString(aModel.ID);
          FieldByName('cd_rotina').AsString  := aModel.Codigo;
          FieldByName('nm_rotina').AsString  := aModel.Nome;
          FieldByName('ds_rotina').AsString  := aModel.Descricao;
          FieldByName('ix_rotina').AsInteger := aModel.Indice;
          FieldByName('tp_rotina').AsInteger := Ord(aModel.Tipo);
          if Assigned(aModel.Parent) then
            if (aModel.Parent.Indice > 0) then
              FieldByName('id_mestre').AsString  := GUIDToString(aModel.Parent.ID)
            else
              FieldByName('id_mestre').Clear
          else
            FieldByName('id_mestre').Clear;

          TFDQuery(aDataSet).Post;
          if TFDQuery(aDataSet).CachedUpdates then
            TFDQuery(aDataSet).ApplyUpdates(0);

          TFDQuery(aDataSet).Connection.CommitRetaining;

          aModel.Saved := True;
        end;
      end;

  Result := aModel.Saved;
end;

function TRotinaController.Save(const aProcedure: TFDStoredProc) : Boolean;
begin
  if Assigned(aProcedure) then
    with aProcedure do
    begin
      if not aModel.Saved then
      begin
        ParamByName('id_sistema').AsString  := GUIDToString(aModel.Sistema.ID);
        ParamByName('id_rotina').AsString   := GUIDToString(aModel.ID);
        ParamByName('cd_rotina').AsString   := aModel.Codigo;
        ParamByName('nm_rotina').AsString   := aModel.Nome;
        ParamByName('ds_rotina').AsString   := aModel.Descricao;
        ParamByName('ix_rotina').AsInteger  := aModel.Indice;
        ParamByName('tp_rotina').AsSmallInt := Ord(aModel.Tipo);

        if Assigned(aModel.Parent) then
          if (aModel.Parent.Indice > 0) then
            ParamByName('id_mestre').AsString  := GUIDToString(aModel.Parent.ID)
          else
            ParamByName('id_mestre').Clear
        else
          ParamByName('id_mestre').Clear;

        aProcedure.ExecProc;
        if aProcedure.CachedUpdates then
          aProcedure.ApplyUpdates(0);

        aProcedure.Connection.CommitRetaining;

        aModel.Saved := True;
      end;
    end;

  Result := aModel.Saved;
end;

procedure TRotinaController.SetModel(Value: TRotina);
begin
  aModel := Value;
end;

end.
