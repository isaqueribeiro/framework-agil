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
    procedure fdQryPerfilNewRecord(DataSet: TDataSet);
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
    FieldByName('sn_ativo').AsInteger   := FLAG_SIM;
    FieldByName('sn_sistema').AsInteger := FLAG_NAO;
  end;
end;

end.
