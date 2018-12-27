inherited FormPesquisaPadraoMesttreDetalhe: TFormPesquisaPadraoMesttreDetalhe
  Caption = 'FormPesquisaPadraoMestreDetalhe'
  ClientHeight = 526
  ExplicitHeight = 565
  PixelsPerInch = 96
  TextHeight = 13
  inherited RadioFiltro: TRadioGroup
    Caption = ''
  end
  object GridProduto: TDBGrid [2]
    Left = 0
    Top = 280
    Width = 739
    Height = 128
    DataSource = DSProduto
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  inherited GridPesquisa: TDBGrid
    Height = 144
    Align = alNone
  end
  object GridServico: TDBGrid [4]
    Left = 0
    Top = 406
    Width = 739
    Height = 120
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  inherited Query: TIBQuery
    Left = 208
    Top = 8
  end
  inherited DS: TDataSource
    Left = 248
    Top = 8
  end
  object queryProduto: TIBQuery
    Database = Conexao.DB
    Transaction = Conexao.TRANSACAO
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 360
    Top = 8
  end
  object DSProduto: TDataSource
    DataSet = queryProduto
    Left = 432
    Top = 8
  end
  object DSservico: TDataSource
    Left = 640
  end
  object QueryServico: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 552
  end
end
