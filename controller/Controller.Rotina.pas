unit Controller.Rotina;

interface

Uses
  TypeAgil.Constants,
  TypeAgil.ComplexTypes,
  InterfaceAgil.Controller,
  ClasseAgil.BaseObject,
  Model.Rotina,
  Controller.Mensagem,

  System.Classes, System.SysUtils, System.StrUtils, System.Math,

  FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  Data.DB, Datasnap.DBClient;

  Type
    TRotinaController = class(TInterfacedObject, IController)
    private
      aModel : TRotina;
      aMsg   : TMensagemController;
      procedure SetModel(Value : TRotina);
      procedure FreeFieldsReadOnly(const aDataSet: TDataSet);
      procedure CarregarDados(const aDataSet : TDataSet);

      function GetModel : TRotina;
      function NewIndex(const aProcedure: TFDStoredProc) : Integer;
      function RotinaCadastrada(const aProcedure: TFDStoredProc; const aCodigo : String) : Boolean;
    public
      constructor Create;
//      constructor CriarRotina(const aParent : TRotina; aNome, aDescricao : String);
      destructor Destroy; override;

      procedure New(const aDataSet: TDataSet); overload;
      procedure Load(const aDataSet: TDataSet);
      procedure Refresh(const aDataSet: TDataSet);
      procedure RefreshRecord(const aDataSet: TDataSet);
      procedure SaveFieldsRestinctions(const AOnwer : TComponent;
        const aDataSet: TDataSet; const aProcedure: TFDStoredProc);
      procedure ClearFieldsRestinctions(const AOnwer : TComponent;
        const aDataSet: TFDQuery; const aConfirmar : Boolean);

      function Edit(const aDataSet: TDataSet) : Boolean;
      function Delete(const aDataSet: TDataSet) : Boolean;
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

uses
  Vcl.StdCtrls,
  cxLabel,
  cxDBEdit;

{ TRotinaController }

procedure TRotinaController.CarregarDados(const aDataSet: TDataSet);
begin
  if Assigned(aDataSet) then
    with aDataSet do
    begin
      if (not FieldByName('id_rotina').IsNull) and (FieldByName('id_rotina').AsString <> EmptyStr) then
        aModel.ID := StringToGUID(FieldByName('id_rotina').AsString);

      aModel.Codigo    := Trim(FieldByName('cd_rotina').AsString);
      aModel.Nome      := Trim(FieldByName('nm_rotina').AsString);
      aModel.Descricao := Trim(FieldByName('ds_rotina').AsString);
      aModel.Indice    := FieldByName('ix_rotina').AsInteger;
      aModel.Tipo      := ct_TipoRotina(FieldByName('tp_rotina').AsInteger);
      aModel.RestricaoCampo := (FieldByName('sn_restringir_campo').AsInteger = FLAG_SIM);

      if (not FieldByName('id_mestre').IsNull) then
        aModel.Parent.ID := StringToGUID(FieldByName('id_mestre').AsString)
      else
        aModel.Parent := nil;

      aModel.Saved := True;
    end;
end;

procedure TRotinaController.ClearFieldsRestinctions(const AOnwer: TComponent;
  const aDataSet: TFDQuery; const aConfirmar : Boolean);
var
  aQry : TFDQuery;
begin
  aQry := TFDQuery.Create(nil);
  try
    if not aModel.Cadastro then
      Abort;

    if not aModel.RestricaoCampo then
      Abort;

    if aConfirmar then
      if not aMsg.ShowConfirmation('Remover', 'Confirma a remoção para restrição de controles da rotina selecionada?') then
        Abort;

    with aQry, SQL do
    begin
      Connection  := aDataSet.Connection;
      Transaction := aDataSet.Transaction;

      BeginUpdate;
      Clear;
      Add('Delete');
      Add('from SYS_ROTINA r');
      Add('where (r.id_mestre = :id_mestre)');
      Add('  and (r.tp_rotina = :tp_rotina)');
      EndUpdate;

      ParamByName('id_mestre').AsString  := GUIDToString(aModel.ID);
      ParamByName('tp_rotina').AsInteger := Ord(tr_CampoCadastro);
      OpenOrExecute;

      if aQry.CachedUpdates then
        aQry.ApplyUpdates(0);

      BeginUpdate;
      Clear;
      Add('Update SYS_ROTINA r Set');
      Add('  r.sn_restringir_campo = 0');
      Add('where (r.id_rotina = :id_rotina)');
      EndUpdate;

      ParamByName('id_rotina').AsString  := GUIDToString(aModel.ID);
      OpenOrExecute;

      if aQry.CachedUpdates then
        aQry.ApplyUpdates(0);

      BeginUpdate;
      Clear;
      Add('Update SYS_SISTEMA_ROTINA r Set');
      Add('  r.sn_restringir_campo = 0');
      Add('where (r.id_rotina = :id_rotina)');
      EndUpdate;

      ParamByName('id_rotina').AsString  := GUIDToString(aModel.ID);
      OpenOrExecute;

      if aQry.CachedUpdates then
        aQry.ApplyUpdates(0);

      aQry.Connection.CommitRetaining;
    end;
  finally
    aQry.Free;
  end;
end;

constructor TRotinaController.Create;
begin
  inherited Create;
  aModel := TRotina.CriarRotina(EmptyStr, EmptyStr);
  aMsg   := TMensagemController.GetInstance;
end;

//constructor TRotinaController.CriarRotina(const aParent : TRotina; aNome, aDescricao: String);
//begin
//  Self.Create;
//  aModel.Nome      := aNome;
//  aModel.Descricao := aDescricao;
//  aModel.Parent    := aParent;
//end;
//
function TRotinaController.Delete(const aDataSet: TDataSet): Boolean;
begin
  Result := False;
end;

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
    if Assigned(aDataSet) then
      with TFDQuery(aDataSet) do
      begin
        if aDataSet.Active then
          aDataSet.Close;

        if (TFDQuery(aDataSet).Params.FindParam('key') <> nil) then
          ParamByName('key').Clear;
        if (TFDQuery(aDataSet).Params.FindParam('nm_rotina') <> nil) then
          ParamByName('nm_rotina').Clear;

        Case aTipoPesquisa of
          TYPE_DEFAULT_QUERY_AUTOMATICO :
            if (TFDQuery(aDataSet).Params.FindParam('nm_rotina') <> nil) then
              ParamByName('nm_rotina').AsString  := aPesquisa + '%';
          else
            if (TFDQuery(aDataSet).Params.FindParam('nm_rotina') <> nil) then
              ParamByName('nm_rotina').AsString  := aPesquisa + '%';
        end;

        aDataSet.Open;

        aRetorno := not aDataSet.IsEmpty;

        if aRetorno then
          CarregarDados(aDataSet);
      end;
  finally
    Result := aRetorno;
  end;
end;

function TRotinaController.Cancel(const aDataSet: TDataSet) : Boolean;
begin
  Result := False;
end;

function TRotinaController.Edit(const aDataSet: TDataSet) : Boolean;
begin
  Result := False;
end;

function TRotinaController.Find(ID: String; const aDataSet: TDataSet): TBaseObject;
begin
  // Carregar dados da base
  if Assigned(aDataSet) then
    with TFDQuery(aDataSet) do
    begin
      if (TFDQuery(aDataSet).Params.FindParam('key') <> nil) then
      begin
        if aDataSet.Active then
          aDataSet.Close;

        TFDQuery(aDataSet).ParamByName('key').AsString := Trim(ID); // "cd_rotina" será o campo de referência para o projeto

        aDataSet.Open;
      end;

      if not aDataSet.IsEmpty then
//      begin
//        if (not FieldByName('id_rotina').IsNull) and (FieldByName('id_rotina').AsString <> EmptyStr) then
//          aModel.ID := StringToGUID(FieldByName('id_rotina').AsString);
//
//        aModel.Codigo    := Trim(FieldByName('cd_rotina').AsString);
//        aModel.Nome      := Trim(FieldByName('nm_rotina').AsString);
//        aModel.Descricao := Trim(FieldByName('ds_rotina').AsString);
//        aModel.Indice    := FieldByName('ix_rotina').AsInteger;
//        aModel.Tipo      := ct_TipoRotina(FieldByName('tp_rotina').AsInteger);
//        aModel.RestricaoCampo := (FieldByName('sn_restringir_campo').AsInteger = FLAG_SIM);
//        aModel.Saved     := True;
//
//        if (not FieldByName('id_mestre').IsNull) then
//          aModel.Parent.ID := StringToGUID(FieldByName('id_mestre').AsString)
//        else
//          aModel.Parent := nil;
//      end
        CarregarDados(aDataSet)
      else
        aModel.Saved := False;

      FreeFieldsReadOnly(aDataSet);
    end;

  Result := aModel;
end;

procedure TRotinaController.FreeFieldsReadOnly(const aDataSet: TDataSet);
var
  I : Integer;
begin
  if Assigned(aDataSet) then
    if aDataSet.Active then
      for I := 0 to aDataSet.Fields.Count - 1 do
        if aDataSet.Fields[I].ReadOnly then
          aDataSet.Fields[I].ReadOnly := False;
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

function TRotinaController.NewIndex(
  const aProcedure: TFDStoredProc): Integer;
var
  aRetorno : Integer;
  aQry : TFDQuery;
begin
  aRetorno := 0;
  aQry := TFDQuery.Create(nil);
  try
    with aQry, SQL do
    begin
      Connection  := aProcedure.Connection;
      Transaction := aProcedure.Transaction;

      BeginUpdate;
      Clear;
      Add('Select');
      Add('  max(IX_ROTINA) as ID');
      Add('from SYS_ROTINA');
      EndUpdate;

      OpenOrExecute;

      aRetorno := FieldByName('ID').AsInteger + 1;
    end;
  finally
    aQry.Free;
    Result := aRetorno;
  end;
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

function TRotinaController.RotinaCadastrada(
  const aProcedure: TFDStoredProc; const aCodigo : String): Boolean;
var
  aRetorno : Boolean;
  aQry : TFDQuery;
begin
  aRetorno := False;
  aQry := TFDQuery.Create(nil);
  try
    with aQry, SQL do
    begin
      Connection  := aProcedure.Connection;
      Transaction := aProcedure.Transaction;

      BeginUpdate;
      Clear;
      Add('Select');
      Add('  r.id_rotina');
      Add('from SYS_ROTINA r');
      Add('where (r.cd_rotina = :cd_rotina)');
      EndUpdate;

      ParamByName('cd_rotina').AsString := aCodigo;
      OpenOrExecute;

      aRetorno := not IsEmpty;
    end;
  finally
    aQry.Free;
    Result := aRetorno;
  end;
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

          // Remover identicadores de pesquisa
          aModel.Nome := Trim(StringReplace(aModel.Nome, ', pesquisa!', '', []));
          aModel.Nome := Trim(StringReplace(aModel.Nome, '!', '', []));
          aModel.Nome := Trim(StringReplace(aModel.Nome, ', pesquisa', '', []));

          FieldByName('id_rotina').AsString  := GUIDToString(aModel.ID);
          FieldByName('cd_rotina').AsString  := aModel.Codigo;
          FieldByName('nm_rotina').AsString  := aModel.Nome;
          FieldByName('ds_rotina').AsString  := aModel.Descricao;
          FieldByName('ix_rotina').AsInteger := aModel.Indice;
          FieldByName('tp_rotina').AsInteger := Ord(aModel.Tipo);
          FieldByName('sn_restringir_campo').AsInteger := IfThen(aModel.RestricaoCampo, FLAG_SIM, FLAG_NAO);
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
        // Remover identicadores de pesquisa
        aModel.Nome := Trim(StringReplace(aModel.Nome, ', pesquisa!', '', []));
        aModel.Nome := Trim(StringReplace(aModel.Nome, '!', '', []));
        aModel.Nome := Trim(StringReplace(aModel.Nome, ', pesquisa', '', []));

        ParamByName('id_sistema').AsString  := GUIDToString(aModel.Sistema.ID);
        ParamByName('id_rotina').AsString   := GUIDToString(aModel.ID);
        ParamByName('cd_rotina').AsString   := aModel.Codigo;
        ParamByName('nm_rotina').AsString   := aModel.Nome;
        ParamByName('ds_rotina').AsString   := aModel.Descricao;
        ParamByName('ix_rotina').AsInteger  := aModel.Indice;
        ParamByName('tp_rotina').AsSmallInt := Ord(aModel.Tipo);
        ParamByName('sn_restringir_campo').AsSmallInt := IfThen(aModel.RestricaoCampo, FLAG_SIM, FLAG_NAO);

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

procedure TRotinaController.SaveFieldsRestinctions(const AOnwer: TComponent;
  const aDataSet: TDataSet; const aProcedure: TFDStoredProc);
var
  I  ,
  ix : Integer;
  aCampo    ,
  aRotulo   ,
  aRotina   : String;
  aControle ,
  aLabel    : TComponent;
  aListagem : TStringList;
  aID : TGUID;
  aQry : TFDQuery;
begin
  aListagem := TStringList.Create;
  try
    if not aModel.Cadastro then
      Abort;

    if Assigned(aDataSet) then
    begin
      aListagem.BeginUpdate;
      aListagem.Clear;
      aListagem.Delimiter := '|';
      for I := 0 to aDataSet.FieldCount - 1 do
      begin
        aCampo    := StringReplace(aDataSet.Fields[I].FieldName, '_', '', [rfReplaceAll]);
        aRotulo   := 'lbl_' + aCampo;
        aControle := AOnwer.FindComponent(aCampo);
        aLabel    := AOnwer.FindComponent(aRotulo);
        if (aControle <> nil) then
        begin
          // Identificar campos de controles e seus rótulos
          aRotina := aModel.Codigo + '.' + aControle.Name;
          if Assigned(aLabel) then
          begin
            if (aLabel is TcxLabel) then
              aRotina := aRotina + '|' + StringReplace(TcxLabel(aLabel).Caption, '&', '', [rfReplaceAll])
            else
            if (aLabel is TLabel)   then
              aRotina := aRotina + '|' + StringReplace(TLabel(aLabel).Caption,   '&', '', [rfReplaceAll]);
          end
          else
          if (aControle is TcxDBCheckBox) then
            aRotina := aRotina + '|' + StringReplace(TcxDBCheckBox(aControle).Caption,   '&', '', [rfReplaceAll]);

          aListagem.Add(aRotina);
        end;
      end;
      aListagem.EndUpdate;

      // Gravar campos identificados com Rotinas do Tipo (4) para aplicar regras de restrição por perfis de acesso
      for I := 0 to aListagem.Count - 1 do
        if (Trim(aListagem.Strings[I]) <> EmptyStr) then
        begin
          if Assigned(aProcedure) then
            with aProcedure do
            begin
              aRotina := aListagem.Strings[I];
              if not RotinaCadastrada(aProcedure, Copy(aRotina, 1, Pos(aListagem.Delimiter, aRotina) - 1)) then
              begin
                ix := NewIndex(aProcedure);
                CreateGUID(aID);

                ParamByName('id_sistema').AsString  := GUIDToString(aModel.Sistema.ID);
                ParamByName('id_rotina').AsString   := GUIDToString(aID);
                ParamByName('cd_rotina').AsString   := Copy(aRotina, 1, Pos(aListagem.Delimiter, aRotina) - 1);
                ParamByName('nm_rotina').AsString   := Copy(aRotina, Pos(aListagem.Delimiter, aRotina) + 1, Length(aRotina));
                ParamByName('ds_rotina').AsString   := EmptyStr;
                ParamByName('ix_rotina').AsInteger  := ix;
                ParamByName('tp_rotina').AsSmallInt := Ord(tr_CampoCadastro);
                ParamByName('sn_restringir_campo').AsSmallInt := FLAG_NAO;
                ParamByName('id_mestre').AsString  := GUIDToString(aModel.ID);

                aProcedure.ExecProc;
                if aProcedure.CachedUpdates then
                  aProcedure.ApplyUpdates(0);

                aProcedure.Connection.CommitRetaining;
              end;
            end;
        end;

      aQry := TFDQuery.Create(nil);
      with aQry, SQL do
      begin
        Connection  := aProcedure.Connection;
        Transaction := aProcedure.Transaction;

        BeginUpdate;
        Clear;
        Add('Update SYS_SISTEMA_ROTINA r Set');
        Add('  r.sn_restringir_campo = 1');
        Add('where (r.id_rotina = :id_rotina)');
        EndUpdate;

        ParamByName('id_rotina').AsString  := GUIDToString(aModel.ID);
        OpenOrExecute;

        if CachedUpdates then
          ApplyUpdates(0);

        Connection.CommitRetaining;
      end;
    end;
  finally
    aListagem.Free;
    aQry.Free;
  end;
end;

procedure TRotinaController.SetModel(Value: TRotina);
begin
  aModel := Value;
end;

end.
