inherited FormpesquisaOS: TFormpesquisaOS
  Caption = 'Pesquisa de ordem de servi'#231'o ( OS )'
  ExplicitWidth = 755
  PixelsPerInch = 96
  TextHeight = 13
  inherited GroupBoxOpcao: TGroupBox
    inherited ButtonPesquisar: TBitBtn
      OnClick = ButtonPesquisarClick
    end
  end
  inherited RadioFiltro: TRadioGroup
    Items.Strings = (
      'C'#243'digo OS'
      'C'#243'digo produto'
      'C'#243'digo servi'#231'o')
    OnClick = RadioFiltroClick
  end
  inherited Query: TIBQuery
    SQL.Strings = (
      'SELECT OS.*, CLIENTE.CODIGO_CLIENTE, PAGAMENTO.CODIGO_PAGAMENTO,'
      'PROMOCAO.CODIGO_PROMOCAO,COLABORADOR.CODIGO_COLABORADOR'
      ''
      'FROM ORDEM_SERVICO OS'
      ''
      'INNER JOIN CLIENTE CLIENTE'
      'ON(CLIENTE.CODIGO_CLIENTE = OS.CODIGO_CLIENTE)'
      ''
      'INNER JOIN PAGAMENTO PAGAMENTO'
      'ON(PAGAMENTO.CODIGO_PAGAMENTO = OS.CODIGO_PAGAMENTO)'
      ''
      ''
      'INNER JOIN PROMOCAO PROMOCAO'
      'ON(PROMOCAO.CODIGO_PROMOCAO = PROMOCAO.CODIGO_PROMOCAO)'
      ''
      'INNER JOIN COLABORADOR COLABORADOR'
      'ON(COLABORADOR.CODIGO_COLABORADOR = OS.CODIGO_COLABORADOR)'
      ''
      'ORDER BY OS.CODIGO_OS')
    object QueryCODIGO_OS: TIntegerField
      FieldName = 'CODIGO_OS'
      Origin = '"ORDEM_SERVICO"."CODIGO_OS"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryDATA_OS: TDateField
      FieldName = 'DATA_OS'
      Origin = '"ORDEM_SERVICO"."DATA_OS"'
      Required = True
    end
    object QueryCODIGO_CLIENTE: TIntegerField
      FieldName = 'CODIGO_CLIENTE'
      Origin = '"ORDEM_SERVICO"."CODIGO_CLIENTE"'
      Required = True
    end
    object QueryCODIGO_PAGAMENTO: TIntegerField
      FieldName = 'CODIGO_PAGAMENTO'
      Origin = '"ORDEM_SERVICO"."CODIGO_PAGAMENTO"'
      Required = True
    end
    object QueryCODIGO_PROMOCAO: TIntegerField
      FieldName = 'CODIGO_PROMOCAO'
      Origin = '"ORDEM_SERVICO"."CODIGO_PROMOCAO"'
    end
    object QueryCODIGO_COLABORADOR: TIntegerField
      FieldName = 'CODIGO_COLABORADOR'
      Origin = '"ORDEM_SERVICO"."CODIGO_COLABORADOR"'
      Required = True
    end
    object QueryCODIGO_CLIENTE1: TIntegerField
      FieldName = 'CODIGO_CLIENTE1'
      Origin = '"CLIENTE"."CODIGO_CLIENTE"'
      Required = True
    end
    object QueryCODIGO_PAGAMENTO1: TIntegerField
      FieldName = 'CODIGO_PAGAMENTO1'
      Origin = '"PAGAMENTO"."CODIGO_PAGAMENTO"'
      Required = True
    end
    object QueryCODIGO_PROMOCAO1: TIntegerField
      FieldName = 'CODIGO_PROMOCAO1'
      Origin = '"PROMOCAO"."CODIGO_PROMOCAO"'
      Required = True
    end
    object QueryCODIGO_COLABORADOR1: TIntegerField
      FieldName = 'CODIGO_COLABORADOR1'
      Origin = '"COLABORADOR"."CODIGO_COLABORADOR"'
      Required = True
    end
  end
  inherited queryProduto: TIBQuery
    SQL.Strings = (
      'SELECT IT.*, PRODUTO.NOME_PRODUTO'
      ''
      'FROM ITEM_PRODUTO it'
      ''
      'INNER JOIN PRODUTO '
      'ON(PRODUTO.CODIGO_PRODUTO = IT.CODIGO_PRODUTO)'
      ''
      'WHERE IT.CODIGO_OS = :NUMERO'
      ''
      ''
      'ORDER BY PRODUTO.CODIGO_PRODUTO')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NUMERO'
        ParamType = ptUnknown
      end>
    object queryProdutoCODIGO_OS: TIntegerField
      FieldName = 'CODIGO_OS'
      Origin = '"ITEM_PRODUTO"."CODIGO_OS"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object queryProdutoCODIGO_PRODUTO: TIntegerField
      FieldName = 'CODIGO_PRODUTO'
      Origin = '"ITEM_PRODUTO"."CODIGO_PRODUTO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object queryProdutoVALOR_VENDA: TIBBCDField
      FieldName = 'VALOR_VENDA'
      Origin = '"ITEM_PRODUTO"."VALOR_VENDA"'
      Required = True
      Precision = 18
      Size = 2
    end
    object queryProdutoQUANTIDADE_PRODUTO: TIntegerField
      FieldName = 'QUANTIDADE_PRODUTO'
      Origin = '"ITEM_PRODUTO"."QUANTIDADE_PRODUTO"'
      Required = True
    end
    object queryProdutoNOME_PRODUTO: TIBStringField
      FieldName = 'NOME_PRODUTO'
      Origin = '"PRODUTO"."NOME_PRODUTO"'
      Required = True
      Size = 100
    end
  end
  inherited QueryServico: TIBQuery
    Database = Conexao.DB
    Transaction = Conexao.TRANSACAO
    SQL.Strings = (
      'SELECT SER.*, SERVICO.NOME_SERVICO'
      ''
      'FROM ITEM_SERVICO SER'
      ''
      'INNER JOIN SERVICO'
      'ON(SERVICO.CODIGO_SERVICO = SER.CODIGO_SERVICO)'
      ''
      'WHERE SER.CODIGO_OS = :NUMERO'
      ''
      ''
      'ORDER BY SER.CODIGO_SERVICO')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NUMERO'
        ParamType = ptUnknown
      end>
    object QueryServicoCODIGO_SERVICO: TIntegerField
      FieldName = 'CODIGO_SERVICO'
      Origin = '"ITEM_SERVICO"."CODIGO_SERVICO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryServicoCODIGO_OS: TIntegerField
      FieldName = 'CODIGO_OS'
      Origin = '"ITEM_SERVICO"."CODIGO_OS"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryServicoVALOR_SERVICO: TIBBCDField
      FieldName = 'VALOR_SERVICO'
      Origin = '"ITEM_SERVICO"."VALOR_SERVICO"'
      Required = True
      Precision = 18
      Size = 2
    end
    object QueryServicoNOME_SERVICO: TIBStringField
      FieldName = 'NOME_SERVICO'
      Origin = '"SERVICO"."NOME_SERVICO"'
      Required = True
      Size = 100
    end
  end
end
