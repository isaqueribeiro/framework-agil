object DtmControleUsuario: TDtmControleUsuario
  OldCreateOrder = False
  Height = 451
  Width = 712
  object fdQryPerfil: TFDQuery
    OnNewRecord = fdQryPerfilNewRecord
    Connection = DtmBase.fdConexao
    Transaction = DtmBase.trnConexao
    UpdateTransaction = DtmBase.trnConexao
    UpdateObject = fdUpdPerfil
    SQL.Strings = (
      'Select'
      '    p.id_perfil'
      '  , p.cd_perfil'
      '  , p.ds_perfil'
      '  , p.sn_sistema'
      '  , p.sn_ativo'
      'from USR_PERFIL p'
      'where (p.id_perfil = :id_perfil)'
      '   or (p.cd_perfil = :cd_perfil)'
      '   or (upper(p.ds_perfil) like upper(:ds_perfil))'
      'order by'
      '   p.ds_perfil')
    Left = 120
    Top = 80
    ParamData = <
      item
        Name = 'ID_PERFIL'
        DataType = ftString
        ParamType = ptInput
        Size = 38
        Value = Null
      end
      item
        Name = 'CD_PERFIL'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'DS_PERFIL'
        DataType = ftString
        ParamType = ptInput
        Size = 50
        Value = Null
      end>
  end
  object fdUpdPerfil: TFDUpdateSQL
    Connection = DtmBase.fdConexao
    InsertSQL.Strings = (
      'INSERT INTO USR_PERFIL'
      '(ID_PERFIL, CD_PERFIL, DS_PERFIL, SN_SISTEMA, '
      '  SN_ATIVO)'
      
        'VALUES (:NEW_ID_PERFIL, :NEW_CD_PERFIL, :NEW_DS_PERFIL, :NEW_SN_' +
        'SISTEMA, '
      '  :NEW_SN_ATIVO)'
      'RETURNING ID_PERFIL, CD_PERFIL')
    ModifySQL.Strings = (
      'UPDATE USR_PERFIL'
      
        'SET ID_PERFIL = :NEW_ID_PERFIL, CD_PERFIL = :NEW_CD_PERFIL, DS_P' +
        'ERFIL = :NEW_DS_PERFIL, '
      '  SN_SISTEMA = :NEW_SN_SISTEMA, SN_ATIVO = :NEW_SN_ATIVO'
      'WHERE ID_PERFIL = :OLD_ID_PERFIL'
      'RETURNING ID_PERFIL, CD_PERFIL')
    DeleteSQL.Strings = (
      'DELETE FROM USR_PERFIL'
      'WHERE ID_PERFIL = :OLD_ID_PERFIL')
    FetchRowSQL.Strings = (
      'SELECT ID_PERFIL, CD_PERFIL, DS_PERFIL, SN_SISTEMA, SN_ATIVO'
      'FROM USR_PERFIL'
      'WHERE ID_PERFIL = :ID_PERFIL')
    Left = 120
    Top = 128
  end
end
