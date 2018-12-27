object Conexao: TConexao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 249
  Width = 347
  object DB: TIBDatabase
    Connected = True
    DatabaseName = 'C:\Users\gusta\Desktop\Trabalho Avancada II\Dados\BANCO.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = TRANSACAO
    ServerType = 'IBServer'
    Left = 40
    Top = 80
  end
  object TRANSACAO: TIBTransaction
    DefaultDatabase = DB
    Left = 256
    Top = 88
  end
  object QUERY: TIBQuery
    Database = DB
    Transaction = TRANSACAO
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 128
    Top = 176
  end
end
