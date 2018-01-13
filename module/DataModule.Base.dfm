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
    Left = 360
    Top = 80
  end
  object fdUpdRotina: TFDUpdateSQL
    Connection = fdConexao
    Left = 360
    Top = 128
  end
  object FDGUIxErrorDialog: TFDGUIxErrorDialog
    Provider = 'Forms'
    Left = 96
    Top = 352
  end
end
