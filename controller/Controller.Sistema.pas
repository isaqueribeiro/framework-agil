unit Controller.Sistema;

interface

Uses
  TypeAgil.ComplexTypes,
  TypeAgil.Constants,
  InterfaceAgil.Controller,
  ClasseAgil.BaseObject,
  Model.Sistema,

  System.Classes, System.SysUtils, System.StrUtils, IniFiles,

  FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  Data.DB, Datasnap.DBClient;

  Type
    TSistemaController = class(TInterfacedObject, IController)
    private
      class var aInstance : TSistemaController;
      aModel : TSistema;
      aConexao  : ct_Conexao;
      procedure SetModel(Value : TSistema);
      procedure SetConexao(Value : ct_Conexao);
      function GetModel : TSistema;
      function GetConexao : ct_Conexao;
    protected
      constructor Create;
      procedure New(const aDataSet: TDataSet); overload;
      procedure FreeFieldsReadOnly(const aDataSet: TDataSet);
      procedure SaveFieldsRestinctions(const AOnwer : TComponent; const aDataSet: TDataSet);

      function Edit(const aDataSet: TDataSet) : Boolean;
      function Delete(const aDataSet: TDataSet) : Boolean;
      function Cancel(const aDataSet: TDataSet) : Boolean;
      function Find(ID: String; const aDataSet: TDataSet): TBaseObject;
      function New: TBaseObject; overload;
    public
      class function GetInstance: TSistemaController;
      destructor Destroy; override;
      procedure Load(const aDataSet: TDataSet);
      procedure Refresh(const aDataSet: TDataSet);
      procedure RefreshRecord(const aDataSet: TDataSet);

      function Save(const aDataSet: TDataSet) : Boolean;
    published
      property Model : TSistema read GetModel write SetModel;
      property Conexao : ct_Conexao read GetConexao write SetConexao;
  end;

implementation

{ TSistemaController }

constructor TSistemaController.Create;
var
  ini : TIniFile;
begin
  ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Conexao.ini');
  try
    inherited Create;
    Self.New;

    aConexao.Servidor := ini.ReadString ('Conexao', 'Servidor', 'localhost');
    aConexao.Porta    := ini.ReadInteger('Conexao', 'Porta', SYS_SERVER_PORT);
    aConexao.Base     := ini.ReadString ('Conexao', 'Base', SYS_DATABASE);
    aConexao.Usuario  := SYS_SYSDBA_LOGIN;
    aConexao.Senha    := SYS_SYSDBA_PWD;
  finally
    ini.WriteString  ('Conexao', 'Servidor', aConexao.Servidor);
    ini.WriteInteger ('Conexao', 'Porta',    aConexao.Porta);
    ini.WriteString  ('Conexao', 'Base',     aConexao.Base);
    ini.WriteDateTime('Informe', 'Acesso',   Now);

    ini.UpdateFile;
    ini.Destroy;
  end;
end;

function TSistemaController.Delete(const aDataSet: TDataSet): Boolean;
begin
  Result := False;
end;

destructor TSistemaController.Destroy;
begin
  aModel.Destroy;
  inherited;
end;

function TSistemaController.Cancel(const aDataSet: TDataSet) : Boolean;
begin
  Result := False;
end;

function TSistemaController.Edit(const aDataSet: TDataSet) : Boolean;
begin
  Result := False;
end;

function TSistemaController.Find(ID: String; const aDataSet: TDataSet): TBaseObject;
begin
  // Carregar dados da base
  if Assigned(aDataSet) then
    with TFDQuery(aDataSet) do
    begin
      if aDataSet.Active then
        aDataSet.Close;

      TFDQuery(aDataSet).ParamByName('key').AsString := ID;

      aDataSet.Open;

      if (not FieldByName('id_sistema').IsNull) and (FieldByName('id_sistema').AsString <> EmptyStr) then
        aModel.ID := StringToGUID(FieldByName('id_sistema').AsString);

      aModel.Nome      := FieldByName('nm_sistema').AsString;
      aModel.Descricao := FieldByName('ds_sistema').AsString;
      aModel.Key       := FieldByName('ky_sistema').AsString;
      aModel.Saved     := True;
    end;

  Result := aModel;
end;

procedure TSistemaController.FreeFieldsReadOnly(const aDataSet: TDataSet);
begin
  ;
end;

class function TSistemaController.GetInstance: TSistemaController;
begin
  if not Assigned(aInstance) then
    aInstance := TSistemaController.Create;
  Result := aInstance;
end;

function TSistemaController.GetModel: TSistema;
begin
  Result := aModel;
end;

procedure TSistemaController.Load(const aDataSet: TDataSet);
begin
  Self.Find(aModel.Key, aDataSet);
  aModel.Notify;
end;

procedure TSistemaController.New(const aDataSet: TDataSet);
begin
  ;
end;

function TSistemaController.New: TBaseObject;
begin
  try
    aModel := TSistema.CriarSistema(EmptyStr, EmptyStr, EmptyStr);
  finally
    Result := aModel;
  end;
end;

function TSistemaController.Save(const aDataSet: TDataSet) : Boolean;
begin
  if Assigned(aDataSet) then
    if aDataSet.Active then
      with TFDQuery(aDataSet) do
      begin
        if not aModel.Saved then
        begin
          if TFDQuery(aDataSet).IsEmpty then
          begin
            TFDQuery(aDataSet).Append;
            FieldByName('vs_sistema').AsString := aModel.Versao;
          end
          else
            TFDQuery(aDataSet).Edit;

          FieldByName('id_sistema').AsString  := GUIDToString(aModel.ID);
          FieldByName('cd_sistema').AsInteger := aModel.Codigo;
          FieldByName('nm_sistema').AsString  := aModel.Nome;
          FieldByName('ds_sistema').AsString  := aModel.Descricao;
          FieldByName('ky_sistema').AsString  := aModel.Key;

          if (FieldByName('vs_sistema').AsString <> aModel.Versao) then
            FieldByName('vs_sistema').AsString := aModel.Versao;

          TFDQuery(aDataSet).Post;
          if TFDQuery(aDataSet).CachedUpdates then
            TFDQuery(aDataSet).ApplyUpdates(0);

          TFDQuery(aDataSet).Connection.CommitRetaining;
          aModel.Saved := True;
        end;
      end;

  Result := aModel.Saved;
end;

procedure TSistemaController.SaveFieldsRestinctions(const AOnwer: TComponent;
  const aDataSet: TDataSet);
begin
  ;
end;

function TSistemaController.GetConexao: ct_Conexao;
begin
  Result := aConexao;
end;

procedure TSistemaController.SetConexao(Value: ct_Conexao);
begin
  aConexao := Value;
end;

procedure TSistemaController.SetModel(Value: TSistema);
begin
  aModel := Value;
end;

procedure TSistemaController.Refresh(const aDataSet: TDataSet);
begin
  if Assigned(aDataSet) then
    if aDataSet.Active then
      TFDQuery(aDataSet).Refresh;
end;

procedure TSistemaController.RefreshRecord(const aDataSet: TDataSet);
begin
  if Assigned(aDataSet) then
    if aDataSet.Active then
      TFDQuery(aDataSet).RefreshRecord;
end;

end.
