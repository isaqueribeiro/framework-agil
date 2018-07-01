object DtmBase: TDtmBase
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 428
  Width = 674
  object fdConexao: TFDConnection
    Params.Strings = (
      'CharacterSet=WIN1252'
      'Protocol=TCPIP'
      'Server=localhost'
      'Port=3050'
      'User_Name=sysdba'
      'Password=masterkey'
      'Database=agil_system'
      'DriverID=FB')
    LoginPrompt = False
    Transaction = trnConexao
    UpdateTransaction = trnConexao
    Left = 96
    Top = 64
  end
  object trnConexao: TFDTransaction
    Connection = fdConexao
    Left = 96
    Top = 112
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 96
    Top = 256
  end
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    Left = 96
    Top = 208
  end
  object scpConexao: TFDScript
    SQLScripts = <>
    Connection = fdConexao
    Transaction = trnConexao
    ScriptDialog = FDGUIxScriptDialog
    Params = <>
    Macros = <>
    Left = 96
    Top = 160
  end
  object FDGUIxScriptDialog: TFDGUIxScriptDialog
    Provider = 'Forms'
    Left = 96
    Top = 304
  end
  object fdQrySistema: TFDQuery
    Connection = fdConexao
    Transaction = trnConexao
    UpdateObject = fdUpdSistema
    SQL.Strings = (
      'Select'
      '    s.id_sistema'
      '  , s.cd_sistema'
      '  , s.nm_sistema'
      '  , s.ds_sistema'
      '  , s.ky_sistema'
      '  , s.vs_sistema'
      'from SYS_SISTEMA s'
      'where s.ky_sistema = :key')
    Left = 288
    Top = 80
    ParamData = <
      item
        Name = 'KEY'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object fdUpdSistema: TFDUpdateSQL
    Connection = fdConexao
    InsertSQL.Strings = (
      'INSERT INTO SYS_SISTEMA'
      '(ID_SISTEMA, CD_SISTEMA, NM_SISTEMA, DS_SISTEMA, '
      '  KY_SISTEMA, VS_SISTEMA)'
      
        'VALUES (:NEW_ID_SISTEMA, :NEW_CD_SISTEMA, :NEW_NM_SISTEMA, :NEW_' +
        'DS_SISTEMA, '
      '  :NEW_KY_SISTEMA, :NEW_VS_SISTEMA)'
      'RETURNING ID_SISTEMA')
    ModifySQL.Strings = (
      'UPDATE SYS_SISTEMA'
      'SET ID_SISTEMA = :NEW_ID_SISTEMA, CD_SISTEMA = :NEW_CD_SISTEMA, '
      '  NM_SISTEMA = :NEW_NM_SISTEMA, DS_SISTEMA = :NEW_DS_SISTEMA, '
      '  KY_SISTEMA = :NEW_KY_SISTEMA, VS_SISTEMA = :NEW_VS_SISTEMA'
      'WHERE ID_SISTEMA = :OLD_ID_SISTEMA'
      'RETURNING ID_SISTEMA')
    DeleteSQL.Strings = (
      'DELETE FROM SYS_SISTEMA'
      'WHERE ID_SISTEMA = :OLD_ID_SISTEMA')
    FetchRowSQL.Strings = (
      
        'SELECT ID_SISTEMA, CD_SISTEMA, NM_SISTEMA, DS_SISTEMA, KY_SISTEM' +
        'A, '
      '  VS_SISTEMA'
      'FROM SYS_SISTEMA'
      'WHERE ID_SISTEMA = :ID_SISTEMA')
    Left = 288
    Top = 128
  end
  object fdQryRotina: TFDQuery
    Connection = fdConexao
    Transaction = trnConexao
    UpdateObject = fdUpdRotina
    SQL.Strings = (
      'Select'
      '    r.id_rotina'
      '  , r.cd_rotina'
      '  , r.nm_rotina'
      '  , r.ds_rotina'
      '  , r.ix_rotina'
      '  , r.tp_rotina'
      '  , r.sn_restringir_campo'
      '  , r.id_mestre'
      'from SYS_ROTINA r'
      'where r.cd_rotina = :key')
    Left = 320
    Top = 80
    ParamData = <
      item
        Name = 'KEY'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object fdUpdRotina: TFDUpdateSQL
    Connection = fdConexao
    InsertSQL.Strings = (
      'INSERT INTO SYS_ROTINA'
      '(ID_ROTINA, CD_ROTINA, NM_ROTINA, DS_ROTINA, '
      '  IX_ROTINA, TP_ROTINA, SN_RESTRINGIR_CAMPO, '
      '  ID_MESTRE)'
      
        'VALUES (:NEW_ID_ROTINA, :NEW_CD_ROTINA, :NEW_NM_ROTINA, :NEW_DS_' +
        'ROTINA, '
      '  :NEW_IX_ROTINA, :NEW_TP_ROTINA, :NEW_SN_RESTRINGIR_CAMPO, '
      '  :NEW_ID_MESTRE)'
      'RETURNING ID_ROTINA')
    ModifySQL.Strings = (
      'UPDATE SYS_ROTINA'
      
        'SET ID_ROTINA = :NEW_ID_ROTINA, CD_ROTINA = :NEW_CD_ROTINA, NM_R' +
        'OTINA = :NEW_NM_ROTINA, '
      '  DS_ROTINA = :NEW_DS_ROTINA, IX_ROTINA = :NEW_IX_ROTINA, '
      
        '  TP_ROTINA = :NEW_TP_ROTINA, SN_RESTRINGIR_CAMPO = :NEW_SN_REST' +
        'RINGIR_CAMPO, '
      '  ID_MESTRE = :NEW_ID_MESTRE'
      'WHERE ID_ROTINA = :OLD_ID_ROTINA'
      'RETURNING ID_ROTINA')
    DeleteSQL.Strings = (
      'DELETE FROM SYS_ROTINA'
      'WHERE ID_ROTINA = :OLD_ID_ROTINA')
    FetchRowSQL.Strings = (
      
        'SELECT ID_ROTINA, CD_ROTINA, NM_ROTINA, DS_ROTINA, IX_ROTINA, TP' +
        '_ROTINA, '
      '  SN_RESTRINGIR_CAMPO, ID_MESTRE'
      'FROM SYS_ROTINA'
      'WHERE ID_ROTINA = :ID_ROTINA')
    Left = 320
    Top = 128
  end
  object FDGUIxErrorDialog: TFDGUIxErrorDialog
    Provider = 'Forms'
    Left = 96
    Top = 352
  end
  object fdQryExecute: TFDQuery
    Connection = fdConexao
    Transaction = trnConexao
    UpdateTransaction = trnConexao
    Left = 192
    Top = 40
  end
  object fdQrySistemaRotina: TFDQuery
    Connection = fdConexao
    Transaction = trnConexao
    UpdateObject = fdUpdSistemaRotina
    SQL.Strings = (
      'Select'
      '    s.id'
      '  , s.id_sistema'
      '  , s.id_rotina'
      '  , s.sn_ativo'
      'from SYS_SISTEMA_ROTINA s'
      'where s.id_sistema = :id_sistema'
      '  and s.id_rotina  = :id_rotina')
    Left = 352
    Top = 80
    ParamData = <
      item
        Name = 'ID_SISTEMA'
        DataType = ftString
        ParamType = ptInput
        Size = 38
        Value = Null
      end
      item
        Name = 'ID_ROTINA'
        DataType = ftString
        ParamType = ptInput
        Size = 38
        Value = Null
      end>
  end
  object fdUpdSistemaRotina: TFDUpdateSQL
    Connection = fdConexao
    InsertSQL.Strings = (
      'INSERT INTO SYS_SISTEMA_ROTINA'
      '(ID, ID_SISTEMA, ID_ROTINA, SN_ATIVO)'
      'VALUES (:NEW_ID, :NEW_ID_SISTEMA, :NEW_ID_ROTINA, :NEW_SN_ATIVO)'
      'RETURNING ID')
    ModifySQL.Strings = (
      'UPDATE SYS_SISTEMA_ROTINA'
      
        'SET ID = :NEW_ID, ID_SISTEMA = :NEW_ID_SISTEMA, ID_ROTINA = :NEW' +
        '_ID_ROTINA, '
      '  SN_ATIVO = :NEW_SN_ATIVO'
      'WHERE ID = :OLD_ID'
      'RETURNING ID')
    DeleteSQL.Strings = (
      'DELETE FROM SYS_SISTEMA_ROTINA'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      'SELECT ID, ID_SISTEMA, ID_ROTINA, SN_ATIVO'
      'FROM SYS_SISTEMA_ROTINA'
      'WHERE ID = :ID')
    Left = 352
    Top = 128
  end
  object fdSetSistemaRotina: TFDStoredProc
    Connection = fdConexao
    Transaction = trnConexao
    UpdateTransaction = trnConexao
    StoredProcName = 'SET_ROTINA'
    Left = 320
    Top = 48
    ParamData = <
      item
        Position = 1
        Name = 'ID_SISTEMA'
        DataType = ftString
        FDDataType = dtWideString
        ParamType = ptInput
        Size = 38
      end
      item
        Position = 2
        Name = 'ID_ROTINA'
        DataType = ftString
        FDDataType = dtWideString
        ParamType = ptInput
        Size = 38
      end
      item
        Position = 3
        Name = 'CD_ROTINA'
        DataType = ftString
        FDDataType = dtWideString
        ParamType = ptInput
        Size = 150
      end
      item
        Position = 4
        Name = 'NM_ROTINA'
        DataType = ftString
        FDDataType = dtWideString
        ParamType = ptInput
        Size = 150
      end
      item
        Position = 5
        Name = 'DS_ROTINA'
        DataType = ftString
        FDDataType = dtWideString
        ParamType = ptInput
        Size = 150
      end
      item
        Position = 6
        Name = 'IX_ROTINA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'TP_ROTINA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'SN_RESTRINGIR_CAMPO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'ID_MESTRE'
        DataType = ftString
        FDDataType = dtWideString
        ParamType = ptInput
        Size = 38
      end>
  end
  object fdQryLicenca: TFDQuery
    Connection = fdConexao
    Transaction = trnConexao
    UpdateObject = fdUpdLicenca
    SQL.Strings = (
      'Select'
      '    l.id_licenca'
      '  , l.cd_licenca'
      '  , l.tx_licenca'
      'from SYS_LICENCA l'
      'where l.cd_licenca = :cd_licenca'
      '')
    Left = 400
    Top = 256
    ParamData = <
      item
        Name = 'CD_LICENCA'
        DataType = ftString
        ParamType = ptInput
        Size = 38
        Value = Null
      end>
  end
  object fdUpdLicenca: TFDUpdateSQL
    Connection = fdConexao
    InsertSQL.Strings = (
      'INSERT INTO SYS_LICENCA'
      '(ID_LICENCA, CD_LICENCA, TX_LICENCA)'
      'VALUES (:NEW_ID_LICENCA, :NEW_CD_LICENCA, :NEW_TX_LICENCA)'
      'RETURNING ID_LICENCA')
    ModifySQL.Strings = (
      'UPDATE SYS_LICENCA'
      'SET ID_LICENCA = :NEW_ID_LICENCA, CD_LICENCA = :NEW_CD_LICENCA, '
      '  TX_LICENCA = :NEW_TX_LICENCA'
      'WHERE ID_LICENCA = :OLD_ID_LICENCA'
      'RETURNING ID_LICENCA')
    DeleteSQL.Strings = (
      'DELETE FROM SYS_LICENCA'
      'WHERE ID_LICENCA = :OLD_ID_LICENCA')
    FetchRowSQL.Strings = (
      'SELECT ID_LICENCA, CD_LICENCA, TX_LICENCA'
      'FROM SYS_LICENCA'
      'WHERE ID_LICENCA = :ID_LICENCA')
    Left = 400
    Top = 304
  end
end
