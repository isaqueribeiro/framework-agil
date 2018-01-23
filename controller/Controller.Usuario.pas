unit Controller.Usuario;

interface

Uses
  TypeAgil.Constants,
  TypeAgil.ComplexTypes,
  InterfaceAgil.Controller,
  ClasseAgil.BaseObject,
  Model.Usuario,
  Controller.Mensagem,

//  IdCoder,
//  IdCoder3to4,
//  IdCoderMIME,
//  IdBaseComponent,

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
      procedure GerarHash;
      function GetModel : TUsuario;
    protected
      constructor Create;
    public
      class function GetInstance: TUsuarioController;
      destructor Destroy; override;

      procedure New(const aDataSet: TDataSet); overload; virtual; abstract;
      procedure Load(const aDataSet: TDataSet); virtual; abstract;
      procedure Refresh(const aDataSet: TDataSet); virtual; abstract;
      procedure RefreshRecord(const aDataSet: TDataSet); virtual; abstract;

      function Edit(const aDataSet: TDataSet) : Boolean; virtual; abstract;
      function Delete(const aDataSet: TDataSet) : Boolean; virtual; abstract;
      function Save(const aDataSet: TDataSet) : Boolean; virtual; abstract;
      function Cancel(const aDataSet: TDataSet) : Boolean; virtual; abstract;
      function Find(ID: String; const aDataSet: TDataSet): TBaseObject; virtual; abstract;
      function New: TBaseObject; overload; virtual; abstract;
      function ExecuteQuery(const aTipoPesquisa : Integer; const aDataSet: TDataSet; aPesquisa : String) : Boolean;
    published
      property Model : TUsuario read GetModel write SetModel;
    end;

implementation

{ TUsuarioController }

constructor TUsuarioController.Create;
begin
  inherited Create;
  aMsg   := TMensagemController.GetInstance;
  aModel := TUsuario.Create;
end;

destructor TUsuarioController.Destroy;
begin
  aModel.Free;
  inherited;
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

//        ParamByName('id_perfil').Clear;
//        ParamByName('cd_perfil').Clear;
//        ParamByName('ds_perfil').Clear;
//
//        Case aTipoPesquisa of
//          TYPE_DEFAULT_QUERY_AUTOMATICO :
//            if StrToIntDef(aPesquisa, 0) > 0 then
//              ParamByName('cd_perfil').AsInteger := StrToIntDef(aPesquisa, 0)
//            else
//              ParamByName('ds_perfil').AsString  := aPesquisa + '%';
//          TYPE_DEFAULT_QUERY_CODIGO     : ParamByName('cd_perfil').AsInteger := StrToIntDef(aPesquisa, 0);
//          TYPE_DEFAULT_QUERY_DESCRITIVA : ParamByName('ds_perfil').AsString  := aPesquisa + '%';
//        end;

        aDataSet.Open;

        aRetorno := not aDataSet.IsEmpty;
      end;
  finally
    Result := aRetorno;
  end;
end;

procedure TUsuarioController.GerarHash;
//var
//  sKeyChar    ,
//  sStrEncode  : String;
//  iTamanhoStr ,
//  iPosicaoKey : Integer;
//  IdEncoder   : TIdEncoderMIME;
begin
//  IdEncoder := TIdEncoderMIME.Create(nil);
//  with aModel, Hash do
//  begin
//    BeginUpdate;
//    try
//      sKeyChar   := IdEncoder.EncodeString(SYS_PASSWD_KEY);
//      sStrEncode := IdEncoder.EncodeString(
//          GUIDToString(ID)
//        + Login
//        + PrimeiroNome
//        + Sobrenome
//        + GUIDToString(Perfil.ID));
//      iTamanhoStr := Length(sStrEncode);
//
//      iPosicaoKey := -1;
//      while (iPosicaoKey < 0) do
//        iPosicaoKey := Random(iTamanhoStr);
//
//      if ((iPosicaoKey mod 2) = 0) then
//        sKeyChar := ReverseString(sKeyChar);
//
//      Clear;
//      Add( Copy(sStrEncode, 1, iPosicaoKey) + sKeyChar + Copy(sStrEncode, iPosicaoKey + 1, iTamanhoStr) );
//    finally
//      IdEncoder.Free;
//      EndUpdate;
//    end;
//  end;
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

procedure TUsuarioController.SetModel(Value: TUsuario);
begin
  aModel := Value;
end;

end.
