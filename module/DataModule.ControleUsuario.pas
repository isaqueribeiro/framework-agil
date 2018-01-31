unit DataModule.ControleUsuario;

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
  TDtmControleUsuario = class(TDataModule)
    fdQryPerfil: TFDQuery;
    fdUpdPerfil: TFDUpdateSQL;
    fdQryUsuario: TFDQuery;
    fdUpdUsuario: TFDUpdateSQL;
    fdQryRotinaSistema: TFDQuery;
    fdUpdRotinaSistema: TFDUpdateSQL;
    procedure fdQryPerfilNewRecord(DataSet: TDataSet);
    procedure fdQryUsuarioNewRecord(DataSet: TDataSet);
    procedure fdQryUsuarioBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DtmControleUsuario: TDtmControleUsuario;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDtmControleUsuario.fdQryPerfilNewRecord(DataSet: TDataSet);
var
  aID : TGUID;
begin
  with fdQryPerfil do
  begin
    CreateGUID(aID);
    FieldByName('id_perfil').AsString   := GUIDToString(aID);
    FieldByName('cd_perfil').AsInteger  := DtmBase.GetNewValueDB('USR_PERFIL', 'CD_PERFIL', EmptyStr);
    FieldByName('sn_alterar_senha').AsInteger := FLAG_SIM;
    FieldByName('sn_ativo').AsInteger   := FLAG_SIM;
    FieldByName('sn_sistema').AsInteger := FLAG_NAO;
  end;
end;

procedure TDtmControleUsuario.fdQryUsuarioBeforePost(DataSet: TDataSet);
begin
  with fdQryUsuario do
  begin
    if not IsEncriptSenhaMD5(FieldByName('ds_senha').AsString, SYS_PASSWD_KEY) then
      FieldByName('ds_senha').AsString := EncriptSenhaMD5(
        FieldByName('ds_login').AsString +
        FieldByName('ds_senha').AsString, SYS_PASSWD_KEY);
  end;
end;

procedure TDtmControleUsuario.fdQryUsuarioNewRecord(DataSet: TDataSet);
var
  aID : TGUID;
begin
  with fdQryUsuario do
  begin
    CreateGUID(aID);
    FieldByName('id_usuario').AsString := GUIDToString(aID);
    FieldByName('ds_login').Clear;
    FieldByName('id_perfil').Clear;
    FieldByName('sn_ativo').AsInteger   := FLAG_SIM;
    FieldByName('dt_ativo').AsDateTime  := Now;
    FieldByName('sn_sistema').AsInteger := FLAG_NAO;
  end;
end;

end.
