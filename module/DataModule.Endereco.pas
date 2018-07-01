unit DataModule.Endereco;

interface

uses
  TypeAgil.Constants,
  DataModule.Recursos,
  DataModule.Base,

  Vcl.Forms, System.SysUtils, System.Classes, Data.DB,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Phys.FBDef, FireDAC.Phys.IBBase,
  FireDAC.Phys.FB, FireDAC.Comp.UI, FireDAC.Comp.Client, FireDAC.Comp.ScriptCommands,
  FireDAC.Stan.Util, FireDAC.VCLUI.Script, FireDAC.Comp.Script,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TDtmEndereco = class(TDataModule)
    fdQryTipoLograudo: TFDQuery;
    fdUpdTipoLograudo: TFDUpdateSQL;
    fdQryEstado: TFDQuery;
    fdUpdEstado: TFDUpdateSQL;
    fdQryCidade: TFDQuery;
    fdUpdCidade: TFDUpdateSQL;
    fdQryBairro: TFDQuery;
    fdUpdBairro: TFDUpdateSQL;
    fdQryCep: TFDQuery;
    fdUpdCep: TFDUpdateSQL;
    procedure fdQryBairroNewRecord(DataSet: TDataSet);
    procedure fdQryBairroBeforePost(DataSet: TDataSet);
    procedure fdQryCepNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DtmEndereco: TDtmEndereco;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDtmEndereco.fdQryBairroBeforePost(DataSet: TDataSet);
begin
  with fdQryBairro do
  begin
    if (FieldByName('cd_bairro').AsCurrency = 0) then
      FieldByName('cd_bairro').AsCurrency := DtmBase.GetCurrNewValueDB('TBL_BAIRRO', 'CD_BAIRRO', EmptyStr);
  end;
end;

procedure TDtmEndereco.fdQryBairroNewRecord(DataSet: TDataSet);
var
  aID : TGUID;
begin
  with fdQryBairro do
  begin
    CreateGUID(aID);
    FieldByName('id_bairro').AsString   := GUIDToString(aID);
    FieldByName('cd_bairro').AsCurrency := 0; //DtmBase.GetNewValueDB('TBL_BAIRRO', 'CD_BAIRRO', EmptyStr);
    FieldByName('sn_ativo').AsInteger   := FLAG_SIM;
  end;
end;

procedure TDtmEndereco.fdQryCepNewRecord(DataSet: TDataSet);
var
  aID : TGUID;
begin
  with fdQryCep do
  begin
    CreateGUID(aID);
    FieldByName('id_cep').AsString    := GUIDToString(aID);
    FieldByName('sn_ativo').AsInteger := FLAG_SIM;
  end;
end;

initialization
  gLicencaApp.Model.NotificacaoSplash := 'Carregando base de endereços...';

end.
