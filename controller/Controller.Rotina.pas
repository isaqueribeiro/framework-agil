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

      procedure Load(const aDataSet: TDataSet);
      procedure Save(const aDataSet: TDataSet);

      function Find(ID: String; const aDataSet: TDataSet): TBaseObject;
      function New: TBaseObject;
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

      if (not FieldByName('id_rotina').IsNull) and (FieldByName('id_rotina').AsString <> EmptyStr) then
        aModel.ID := StringToGUID(FieldByName('id_rotina').AsString);

      aModel.Codigo    := Trim(FieldByName('cd_rotina').AsString);
      aModel.Nome      := Trim(FieldByName('nm_rotina').AsString);
      aModel.Descricao := Trim(FieldByName('ds_rotina').AsString);
      aModel.Indice    := FieldByName('ix_rotina').AsInteger;
      aModel.Tipo      := ct_TipoRotina(FieldByName('tp_rotina').AsInteger);

      if (not FieldByName('id_mestre').IsNull) then
        aModel.Parent.ID := StringToGUID(FieldByName('id_mestre').AsString)
      else
        aModel.Parent := nil;
    end;

  Result := aModel;
end;

function TRotinaController.GetModel: TRotina;
begin
  Result := aModel;
end;

procedure TRotinaController.Load(const aDataSet: TDataSet);
begin
  Self.Find(aModel.Nome, aDataSet);
  aModel.Notify;
end;

function TRotinaController.New: TBaseObject;
begin
  aModel := TRotina.CriarRotina(EmptyStr, EmptyStr);
  Result := aModel;
end;

procedure TRotinaController.Save(const aDataSet: TDataSet);
begin
  if Assigned(aDataSet) then
    if aDataSet.Active then
      with TFDQuery(aDataSet) do
      begin
//        if TFDQuery(aDataSet).IsEmpty then
//        begin
//          TFDQuery(aDataSet).Append;
//          FieldByName('vs_sistema').AsString := aModel.Versao;
//        end
//        else
//          TFDQuery(aDataSet).Edit;
//
//        FieldByName('id_sistema').AsString  := GUIDToString(aModel.ID);
//        FieldByName('cd_sistema').AsInteger := aModel.Codigo;
//        FieldByName('nm_sistema').AsString  := aModel.Nome;
//        FieldByName('ds_sistema').AsString  := aModel.Descricao;
//        FieldByName('ky_sistema').AsString  := aModel.Key;
//
//        TFDQuery(aDataSet).Post;
//        if TFDQuery(aDataSet).CachedUpdates then
//          TFDQuery(aDataSet).ApplyUpdates(0);
//
//        TFDQuery(aDataSet).Connection.CommitRetaining;
      end;
end;

procedure TRotinaController.SetModel(Value: TRotina);
begin
  aModel := Value;
end;

end.
