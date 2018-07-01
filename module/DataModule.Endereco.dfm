object DtmEndereco: TDtmEndereco
  OldCreateOrder = False
  Height = 413
  Width = 590
  object fdQryTipoLograudo: TFDQuery
    Connection = DtmBase.fdConexao
    Transaction = DtmBase.trnConexao
    UpdateTransaction = DtmBase.trnConexao
    UpdateObject = fdUpdTipoLograudo
    SQL.Strings = (
      'Select'
      '    t.cd_tipo'
      '  , t.nm_tipo'
      '  , t.ds_tipo'
      'from TBL_TIPO_LOGRADOURO t'
      'where (t.cd_tipo = :cd_tipo)'
      '   or (upper(t.nm_tipo) like upper(:nm_tipo))'
      'order by'
      '   t.nm_tipo')
    Left = 72
    Top = 40
    ParamData = <
      item
        Name = 'CD_TIPO'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NM_TIPO'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end>
  end
  object fdUpdTipoLograudo: TFDUpdateSQL
    Connection = DtmBase.fdConexao
    InsertSQL.Strings = (
      'INSERT INTO TBL_TIPO_LOGRADOURO'
      '(CD_TIPO, NM_TIPO, DS_TIPO)'
      'VALUES (:NEW_CD_TIPO, :NEW_NM_TIPO, :NEW_DS_TIPO)')
    ModifySQL.Strings = (
      'UPDATE TBL_TIPO_LOGRADOURO'
      
        'SET CD_TIPO = :NEW_CD_TIPO, NM_TIPO = :NEW_NM_TIPO, DS_TIPO = :N' +
        'EW_DS_TIPO'
      'WHERE CD_TIPO = :OLD_CD_TIPO')
    DeleteSQL.Strings = (
      'DELETE FROM TBL_TIPO_LOGRADOURO'
      'WHERE CD_TIPO = :OLD_CD_TIPO')
    FetchRowSQL.Strings = (
      'SELECT CD_TIPO, NM_TIPO, DS_TIPO'
      'FROM TBL_TIPO_LOGRADOURO'
      'WHERE CD_TIPO = :CD_TIPO')
    Left = 72
    Top = 88
  end
  object fdQryEstado: TFDQuery
    Active = True
    Connection = DtmBase.fdConexao
    Transaction = DtmBase.trnConexao
    UpdateTransaction = DtmBase.trnConexao
    UpdateObject = fdUpdEstado
    SQL.Strings = (
      'Select'
      '    e.cd_estado'
      '  , e.nm_estado'
      '  , e.uf_estado'
      'from TBL_ESTADO e'
      'where (e.cd_estado = :cd_estado)'
      '   or (upper(e.nm_estado) like upper(:nm_estado))'
      'order by'
      '   e.nm_estado')
    Left = 72
    Top = 136
    ParamData = <
      item
        Name = 'CD_ESTADO'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NM_ESTADO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end>
  end
  object fdUpdEstado: TFDUpdateSQL
    Connection = DtmBase.fdConexao
    InsertSQL.Strings = (
      'INSERT INTO TBL_ESTADO'
      '(CD_ESTADO, NM_ESTADO, UF_ESTADO)'
      'VALUES (:NEW_CD_ESTADO, :NEW_NM_ESTADO, :NEW_UF_ESTADO)')
    ModifySQL.Strings = (
      'UPDATE TBL_ESTADO'
      
        'SET CD_ESTADO = :NEW_CD_ESTADO, NM_ESTADO = :NEW_NM_ESTADO, UF_E' +
        'STADO = :NEW_UF_ESTADO'
      'WHERE CD_ESTADO = :OLD_CD_ESTADO')
    DeleteSQL.Strings = (
      'DELETE FROM TBL_ESTADO'
      'WHERE CD_ESTADO = :OLD_CD_ESTADO')
    FetchRowSQL.Strings = (
      'SELECT CD_ESTADO, NM_ESTADO, UF_ESTADO'
      'FROM TBL_ESTADO'
      'WHERE CD_ESTADO = :CD_ESTADO')
    Left = 72
    Top = 184
  end
  object fdQryCidade: TFDQuery
    Active = True
    Connection = DtmBase.fdConexao
    Transaction = DtmBase.trnConexao
    UpdateTransaction = DtmBase.trnConexao
    UpdateObject = fdUpdCidade
    SQL.Strings = (
      'Select'
      '    c.cd_cidade'
      '  , c.cd_ibge'
      '  , c.cd_siafi'
      '  , c.nm_cidade'
      '  , c.nr_cep_inicial'
      '  , c.nr_cep_final'
      '  , c.cd_estado'
      '  , e.nm_estado'
      '  , e.uf_estado'
      '  , c.nm_cidade || '#39' ('#39' || e.uf_estado || '#39')'#39' as ds_cidade'
      'from TBL_CIDADE c'
      '  inner join TBL_ESTADO e on (e.cd_estado = c.cd_estado)'
      'where ((c.cd_estado = :cd_estado) or (:todas = 1))'
      
        '  and ((c.cd_cidade = :cd_cidade) or (upper(c.nm_cidade) like up' +
        'per(:nm_cidade)))'
      'order by'
      '   c.nm_cidade')
    Left = 184
    Top = 40
    ParamData = <
      item
        Name = 'CD_ESTADO'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'TODAS'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'CD_CIDADE'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'NM_CIDADE'
        DataType = ftString
        ParamType = ptInput
        Size = 150
      end>
  end
  object fdUpdCidade: TFDUpdateSQL
    Connection = DtmBase.fdConexao
    InsertSQL.Strings = (
      'INSERT INTO TBL_CIDADE'
      '(CD_CIDADE, CD_IBGE, CD_SIAFI, NM_CIDADE, '
      '  NR_CEP_INICIAL, NR_CEP_FINAL, CD_ESTADO)'
      
        'VALUES (:NEW_CD_CIDADE, :NEW_CD_IBGE, :NEW_CD_SIAFI, :NEW_NM_CID' +
        'ADE, '
      '  :NEW_NR_CEP_INICIAL, :NEW_NR_CEP_FINAL, :NEW_CD_ESTADO)')
    ModifySQL.Strings = (
      'UPDATE TBL_CIDADE'
      
        'SET CD_CIDADE = :NEW_CD_CIDADE, CD_IBGE = :NEW_CD_IBGE, CD_SIAFI' +
        ' = :NEW_CD_SIAFI, '
      
        '  NM_CIDADE = :NEW_NM_CIDADE, NR_CEP_INICIAL = :NEW_NR_CEP_INICI' +
        'AL, '
      '  NR_CEP_FINAL = :NEW_NR_CEP_FINAL, CD_ESTADO = :NEW_CD_ESTADO'
      'WHERE CD_CIDADE = :OLD_CD_CIDADE')
    DeleteSQL.Strings = (
      'DELETE FROM TBL_CIDADE'
      'WHERE CD_CIDADE = :OLD_CD_CIDADE')
    FetchRowSQL.Strings = (
      
        'SELECT CD_CIDADE, CD_IBGE, CD_SIAFI, NM_CIDADE, NR_CEP_INICIAL, ' +
        'NR_CEP_FINAL, '
      '  CD_ESTADO'
      'FROM TBL_CIDADE'
      'WHERE CD_CIDADE = :CD_CIDADE')
    Left = 184
    Top = 88
  end
  object fdQryBairro: TFDQuery
    Active = True
    BeforePost = fdQryBairroBeforePost
    OnNewRecord = fdQryBairroNewRecord
    Connection = DtmBase.fdConexao
    Transaction = DtmBase.trnConexao
    UpdateTransaction = DtmBase.trnConexao
    UpdateObject = fdUpdBairro
    SQL.Strings = (
      'Select'
      '    b.id_bairro'
      '  , b.cd_bairro'
      '  , b.nm_bairro'
      '  , b.cd_cidade'
      '  , b.sn_ativo'
      '  , c.nm_cidade || '#39' ('#39' || e.uf_estado || '#39')'#39' as ds_cidade'
      'from TBL_BAIRRO b'
      '  inner join TBL_CIDADE c on (c.cd_cidade = b.cd_cidade)'
      '  inner join TBL_ESTADO e on (e.cd_estado = c.cd_estado)'
      'where ((b.cd_cidade = :cd_cidade) or (:todos = 1))'
      
        '  and ((b.id_bairro = :id_bairro) or (upper(b.nm_bairro) like up' +
        'per(:nm_bairro)))'
      'order by'
      '   b.nm_bairro')
    Left = 184
    Top = 136
    ParamData = <
      item
        Name = 'CD_CIDADE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'TODOS'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'ID_BAIRRO'
        DataType = ftString
        ParamType = ptInput
        Size = 38
      end
      item
        Name = 'NM_BAIRRO'
        DataType = ftString
        ParamType = ptInput
        Size = 150
      end>
  end
  object fdUpdBairro: TFDUpdateSQL
    Connection = DtmBase.fdConexao
    InsertSQL.Strings = (
      'INSERT INTO TBL_BAIRRO'
      '(ID_BAIRRO, CD_BAIRRO, NM_BAIRRO, CD_CIDADE, '
      '  SN_ATIVO)'
      
        'VALUES (:NEW_ID_BAIRRO, :NEW_CD_BAIRRO, :NEW_NM_BAIRRO, :NEW_CD_' +
        'CIDADE, '
      '  :NEW_SN_ATIVO)')
    ModifySQL.Strings = (
      'UPDATE TBL_BAIRRO'
      
        'SET ID_BAIRRO = :NEW_ID_BAIRRO, CD_BAIRRO = :NEW_CD_BAIRRO, NM_B' +
        'AIRRO = :NEW_NM_BAIRRO, '
      '  CD_CIDADE = :NEW_CD_CIDADE, SN_ATIVO = :NEW_SN_ATIVO'
      'WHERE ID_BAIRRO = :OLD_ID_BAIRRO')
    DeleteSQL.Strings = (
      'DELETE FROM TBL_BAIRRO'
      'WHERE ID_BAIRRO = :OLD_ID_BAIRRO')
    FetchRowSQL.Strings = (
      'SELECT ID_BAIRRO, CD_BAIRRO, NM_BAIRRO, CD_CIDADE, SN_ATIVO'
      'FROM TBL_BAIRRO'
      'WHERE ID_BAIRRO = :ID_BAIRRO')
    Left = 184
    Top = 184
  end
  object fdQryCep: TFDQuery
    Active = True
    OnNewRecord = fdQryCepNewRecord
    Connection = DtmBase.fdConexao
    Transaction = DtmBase.trnConexao
    UpdateTransaction = DtmBase.trnConexao
    UpdateObject = fdUpdCep
    SQL.Strings = (
      'Select'
      '    c.id_cep'
      '  , c.nr_cep'
      '  , c.cd_tipo'
      '  , t.nm_tipo'
      '  , coalesce(nullif(trim(t.ds_tipo), '#39#39'), t.nm_tipo) as ds_tipo'
      '  , c.ds_logradouro'
      '  , c.ds_endereco'
      '  , c.id_bairro'
      '  , c.nm_bairro'
      '  , c.cd_cidade'
      '  , c.nm_cidade'
      '  , c.cd_estado'
      '  , c.uf'
      '  , c.sn_ativo'
      
        '  , substring(c.nr_cep from 1 for 5) || '#39'-'#39' || substring(c.nr_ce' +
        'p from 6 for 3) as nr_referencia'
      'from TBL_CEP c'
      '  left join TBL_TIPO_LOGRADOURO t on (t.cd_tipo = c.cd_tipo)'
      'where ((c.cd_cidade = :cd_cidade) or (:todos = 1))'
      
        '  and ((c.nr_cep = :nr_cep) or (upper(c.ds_endereco) like upper(' +
        ':ds_endereco)))'
      'order by'
      '   c.ds_endereco')
    Left = 280
    Top = 192
    ParamData = <
      item
        Name = 'CD_CIDADE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'TODOS'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'NR_CEP'
        DataType = ftLargeint
        ParamType = ptInput
      end
      item
        Name = 'DS_ENDERECO'
        DataType = ftString
        ParamType = ptInput
        Size = 250
      end>
  end
  object fdUpdCep: TFDUpdateSQL
    Connection = DtmBase.fdConexao
    InsertSQL.Strings = (
      'INSERT INTO TBL_CEP'
      '(ID_CEP, NR_CEP, CD_TIPO, ID_BAIRRO, CD_CIDADE, '
      '  CD_ESTADO, NM_BAIRRO, NM_CIDADE, UF, '
      '  DS_LOGRADOURO, DS_ENDERECO, SN_ATIVO)'
      
        'VALUES (:NEW_ID_CEP, :NEW_NR_CEP, :NEW_CD_TIPO, :NEW_ID_BAIRRO, ' +
        ':NEW_CD_CIDADE, '
      '  :NEW_CD_ESTADO, :NEW_NM_BAIRRO, :NEW_NM_CIDADE, :NEW_UF, '
      '  :NEW_DS_LOGRADOURO, :NEW_DS_ENDERECO, :NEW_SN_ATIVO)')
    ModifySQL.Strings = (
      'UPDATE TBL_CEP'
      
        'SET ID_CEP = :NEW_ID_CEP, NR_CEP = :NEW_NR_CEP, CD_TIPO = :NEW_C' +
        'D_TIPO, '
      '  ID_BAIRRO = :NEW_ID_BAIRRO, CD_CIDADE = :NEW_CD_CIDADE, '
      '  CD_ESTADO = :NEW_CD_ESTADO, NM_BAIRRO = :NEW_NM_BAIRRO, '
      
        '  NM_CIDADE = :NEW_NM_CIDADE, UF = :NEW_UF, DS_LOGRADOURO = :NEW' +
        '_DS_LOGRADOURO, '
      '  DS_ENDERECO = :NEW_DS_ENDERECO, SN_ATIVO = :NEW_SN_ATIVO'
      'WHERE ID_CEP = :OLD_ID_CEP')
    DeleteSQL.Strings = (
      'DELETE FROM TBL_CEP'
      'WHERE ID_CEP = :OLD_ID_CEP')
    FetchRowSQL.Strings = (
      'Select'
      '    c.id_cep'
      '  , c.nr_cep'
      '  , c.cd_tipo'
      '  , t.nm_tipo'
      '  , coalesce(nullif(trim(t.ds_tipo), '#39#39'), t.nm_tipo) as ds_tipo'
      '  , c.ds_logradouro'
      '  , c.ds_endereco'
      '  , c.id_bairro'
      '  , c.nm_bairro'
      '  , c.cd_cidade'
      '  , c.nm_cidade'
      '  , c.cd_estado'
      '  , c.uf'
      '  , c.sn_ativo'
      
        '  , substring(c.nr_cep from 1 for 5) || '#39'-'#39' || substring(c.nr_ce' +
        'p from 6 for 3) as nr_referencia'
      'from TBL_CEP c'
      '  left join TBL_TIPO_LOGRADOURO t on (t.cd_tipo = c.cd_tipo)'
      'WHERE ID_CEP = :ID_CEP')
    Left = 280
    Top = 240
  end
end
