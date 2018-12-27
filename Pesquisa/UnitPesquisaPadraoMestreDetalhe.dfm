inherited FormPesquisaPadraoMesttreDetalhe: TFormPesquisaPadraoMesttreDetalhe
  Caption = 'FormPesquisaPadraoMestreDetalhe'
  ExplicitWidth = 586
  ExplicitHeight = 429
  PixelsPerInch = 96
  TextHeight = 13
  inherited gridPesquisa: TDBGrid
    Height = 192
  end
  object gridItem: TDBGrid [2]
    Left = 0
    Top = 192
    Width = 570
    Height = 88
    Align = alBottom
    DataSource = dsItem
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object queryItem: TIBQuery
    Database = Conexao.DB
    Transaction = Conexao.Transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 344
    Top = 32
  end
  object dsItem: TDataSource
    DataSet = queryItem
    Left = 344
    Top = 88
  end
end
