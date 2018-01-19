unit DataModule.Base;

interface

uses
  DataModule.Recursos,

  Vcl.Forms, System.SysUtils, System.Classes,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Phys.FBDef, FireDAC.Phys.IBBase,
  FireDAC.Phys.FB, FireDAC.Comp.UI, FireDAC.Comp.Client, FireDAC.Comp.ScriptCommands,
  FireDAC.Stan.Util, FireDAC.VCLUI.Script, FireDAC.Comp.Script,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,

  Data.DB, Datasnap.DBClient, FireDAC.VCLUI.Error;

type
  TDtmBase = class(TDataModule)
    fdConexao: TFDConnection;
    trnConexao: TFDTransaction;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    FDPhysFBDriverLink: TFDPhysFBDriverLink;
    scpConexao: TFDScript;
    FDGUIxScriptDialog: TFDGUIxScriptDialog;
    fdQrySistema: TFDQuery;
    fdUpdSistema: TFDUpdateSQL;
    fdQryRotina: TFDQuery;
    fdUpdRotina: TFDUpdateSQL;
    FDGUIxErrorDialog: TFDGUIxErrorDialog;
    fdQryExecute: TFDQuery;
    fdQrySistemaRotina: TFDQuery;
    fdUpdSistemaRotina: TFDUpdateSQL;
    fdSetSistemaRotina: TFDStoredProc;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    procedure Conectar;
    procedure GravarSistema;

    function GetConectado : Boolean;
  public
    { Public declarations }
    property Conectado : Boolean read GetConectado;

    function GetNewValueDB(aTabela, aCampo, aCondicao : String) : Integer;
    function EmptyFields(const aDataSet : TDataSet) : TStringList;
  end;

var
  DtmBase: TDtmBase;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDtmBase }

procedure TDtmBase.Conectar;
var
  aBase   ,
  aFileDB : String;
begin
  try
    with fdConexao do
    begin
      aBase := gSistema.Conexao.Base;

      aFileDB := ExtractFilePath(ParamStr(0)) + aBase + '.fdb';
      if FileExists(aFileDB) then
        aBase := aFileDB
      else
      begin
        aFileDB := ExtractFilePath(ParamStr(0)) + 'db\' + aBase + '.fdb';
        if FileExists(aFileDB) then
          aBase := aFileDB
      end;

      if Connected then
        Connected := False;

      DriverName := 'FB';

      Params.Clear;
      Params.Add('DriverID=FB');
      Params.Add('Server='   + gSistema.Conexao.Servidor);
      Params.Add('Database=' + aBase);
      Params.Add('Port='     + IntToStr(gSistema.Conexao.Porta));
      Params.Add('Protocol=TCPIP');
      Params.Add('User_Name=' + gSistema.Conexao.Usuario);
      Params.Add('Password='  + gSistema.Conexao.Senha);
      Params.Add('SQLDialect=3');
      Params.Add('CharacterSet=WIN1252');

      Connected := True;
    end;
  except
    On E : Exception do
      ShowError(Application, 'Erro', 'Erro ao tentar conectar na base de dados.' + #13#13 + E.Message);
  end;
end;

procedure TDtmBase.DataModuleCreate(Sender: TObject);
begin
  FDGUIxScriptDialog.Caption := gVersaoApp.SplashName + ', processando...';
  FDGUIxErrorDialog.Caption  := gVersaoApp.SplashName + ' - Erro';

  Conectar;
  if Self.Conectado then
    GravarSistema;
end;

function TDtmBase.EmptyFields(const aDataSet: TDataSet): TStringList;
var
  I : Integer;
  aLista : TStringList;
begin
  aLista := TStringList.Create;
  try
    // Limpar as campos que são cadeias de caracteres e que estão em branco
    for I := 0 to aDataSet.Fields.Count - 1 do
      if (aDataSet.Fields[I].DataType in [ftString, ftMemo, ftWideString, ftWideMemo]) then
        if ( Trim(aDataSet.Fields[I].AsString) = EmptyStr ) then
          aDataSet.Fields[I].Clear;

    aLista.BeginUpdate;
    aLista.Clear;

    // Buscar campos com preenchimento obrigatório que estão vazios
    for I := 0 to aDataSet.Fields.Count - 1 do
      if (aDataSet.Fields[I].Required and aDataSet.Fields[I].IsNull) then
        aLista.Add(aDataSet.Fields[I].FieldName);

    aLista.EndUpdate;
  finally
    Result := aLista;
  end;
end;

function TDtmBase.GetConectado: Boolean;
begin
  Result := fdConexao.Connected;
end;

function TDtmBase.GetNewValueDB(aTabela, aCampo, aCondicao: String): Integer;
var
  aRetorno : Integer;
begin
  aRetorno := 0;
  try
    with fdQryExecute, SQL do
    begin
      if fdQryExecute.Active then
        fdQryExecute.Close;

      BeginUpdate;
      Clear;

      Add('Select');
      Add('  max(' + aCampo + ') as ID');
      Add('from ' + aTabela);

      if (Trim(aCondicao) <> EmptyStr) then
        Add('where ' + aCondicao);

      EndUpdate;
      if OpenOrExecute then
        aRetorno := FieldByName('ID').AsInteger + 1;
    end;
  finally
    if fdQryExecute.Active then
      fdQryExecute.Close;

    Result := aRetorno;
  end;
end;

procedure TDtmBase.GravarSistema;
begin
  with gSistema, gVersaoApp do
  begin
    Model.Key := ProductKey;
    Load(fdQrySistema);

    Model.Nome      := SplashName;
    Model.Descricao := SplashDescription;
    Model.Key       := ProductKey;
    Model.Versao    := FileVersion;

    Save(fdQrySistema);
  end;
end;

end.
