unit Controller.Perfil.Permissao;

interface

Uses
  TypeAgil.Constants,
  TypeAgil.ComplexTypes,
  InterfaceAgil.Controller,
  ClasseAgil.BaseObject,
  Model.Perfil.Permissao,
  Controller.Mensagem,

  System.Classes, System.SysUtils, System.StrUtils,

  FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  Data.DB, Datasnap.DBClient;

  Type
    TPermissaoPerfilController = class(TInterfacedObject, IController)
    private
      class var aInstance : TPermissaoPerfilController;
      aMsg   : TMensagemController;
      aModel : TPermissaoPerfil;
      procedure SetModel(Value : TPermissaoPerfil);
      function GetModel : TPermissaoPerfil;
    protected
//      constructor Create;
      procedure CarregarDados(const aDataSet : TDataSet);
      procedure FreeFieldsReadOnly(const aDataSet: TDataSet);
    public
      class function GetInstance: TPermissaoPerfilController;
      constructor Create;
      destructor Destroy; override;

      procedure New(const aDataSet: TDataSet); overload;
      procedure Load(const aDataSet: TDataSet);
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
      property Model : TPermissaoPerfil read GetModel write SetModel;
    end;

implementation

{ TPermissaoPerfilController }

function TPermissaoPerfilController.Cancel(const aDataSet: TDataSet): Boolean;
begin
  ;
end;

procedure TPermissaoPerfilController.CarregarDados(const aDataSet: TDataSet);
begin
  ;
end;

constructor TPermissaoPerfilController.Create;
begin
  inherited Create;
  aMsg   := TMensagemController.GetInstance;
  aModel := TPermissaoPerfil.Create;
end;

function TPermissaoPerfilController.Delete(const aDataSet: TDataSet): Boolean;
begin
  ;
end;

destructor TPermissaoPerfilController.Destroy;
begin
  aModel.Free;
  inherited Destroy;
end;

function TPermissaoPerfilController.Edit(const aDataSet: TDataSet): Boolean;
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

function TPermissaoPerfilController.ExecuteQuery(const aTipoPesquisa: Integer;
  const aDataSet: TDataSet; aPesquisa: String): Boolean;
begin
  ;
end;

function TPermissaoPerfilController.Find(ID: String;
  const aDataSet: TDataSet): TBaseObject;
begin
  ;
end;

procedure TPermissaoPerfilController.FreeFieldsReadOnly(
  const aDataSet: TDataSet);
begin
  ;
end;

class function TPermissaoPerfilController.GetInstance: TPermissaoPerfilController;
begin
  if not Assigned(aInstance) then
    aInstance := TPermissaoPerfilController.Create;
  Result := aInstance;
end;

function TPermissaoPerfilController.GetModel: TPermissaoPerfil;
begin
  Result := aModel;
end;

procedure TPermissaoPerfilController.Load(const aDataSet: TDataSet);
begin
  ;
end;

function TPermissaoPerfilController.New: TBaseObject;
begin
  if Assigned(aModel) then
    aModel.Free;

  aModel := TPermissaoPerfil.Create;
  Result := aModel;
end;

procedure TPermissaoPerfilController.New(const aDataSet: TDataSet);
begin
  ;
end;

procedure TPermissaoPerfilController.Refresh(const aDataSet: TDataSet);
begin
  if Assigned(aDataSet) then
    if aDataSet.Active then
      TFDQuery(aDataSet).Refresh;
end;

procedure TPermissaoPerfilController.RefreshRecord(const aDataSet: TDataSet);
begin
  if Assigned(aDataSet) then
    if aDataSet.Active then
      with TFDQuery(aDataSet) do
      begin
        if RefreshRecord then
        begin
//          aModel.ID         := StringToGUID(FieldByName('id_perfil').AsString);
//          aModel.Codigo     := FieldByName('cd_perfil').AsInteger;
//          aModel.Descricao  := FieldByName('ds_perfil').AsString;
//          aModel.Ativo      := (FieldByName('sn_ativo').AsInteger = FLAG_SIM);
//          aModel.UsoSistema := (FieldByName('sn_sistema').AsInteger = FLAG_SIM);
//          aModel.Saved      := True;
        end;
      end;
end;

function TPermissaoPerfilController.Save(const aDataSet: TDataSet): Boolean;
begin
  ;
end;

procedure TPermissaoPerfilController.SetModel(Value: TPermissaoPerfil);
begin
  aModel := Value;
end;

end.
