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
      'Database=agil_softwares'
      'SQLDialect=3'
      'DriverID=FB')
    LoginPrompt = False
    Transaction = trnConexao
    UpdateTransaction = trnConexao
    Left = 96
    Top = 64
  end
  object trnConexao: TFDTransaction
    Options.AutoStart = False
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
    Left = 288
    Top = 80
  end
  object fdUpdSistema: TFDUpdateSQL
    Connection = fdConexao
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
