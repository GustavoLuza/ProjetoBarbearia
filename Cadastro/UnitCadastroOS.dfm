inherited FormCadastroOS: TFormCadastroOS
  Caption = 'Cadastro de Ordem de Servi'#231'o'
  ClientHeight = 713
  ExplicitHeight = 752
  PixelsPerInch = 96
  TextHeight = 13
  inherited ButtonPesquisa: TSpeedButton
    Left = 148
    Top = 46
    Height = 21
    OnClick = ButtonPesquisaClick
    ExplicitLeft = 148
    ExplicitTop = 46
    ExplicitHeight = 21
  end
  object LabelCodigoOS: TLabel [1]
    Left = 8
    Top = 27
    Width = 50
    Height = 13
    Caption = 'C'#243'digo OS'
    FocusControl = DBEditCodigoOS
  end
  object LabelData: TLabel [2]
    Left = 8
    Top = 83
    Width = 40
    Height = 13
    Caption = 'Data OS'
    FocusControl = DBEditData
  end
  object LabelCodigoCLiente: TLabel [3]
    Left = 216
    Top = 83
    Width = 67
    Height = 13
    Caption = 'C'#243'digo cliente'
    FocusControl = DBEditCodigoCLiente
  end
  object LabelCodigoPagamento: TLabel [4]
    Left = 8
    Top = 154
    Width = 90
    Height = 13
    Caption = 'C'#243'digo pagamento'
    FocusControl = DBEditCodigoPagamento
  end
  object LabelCodigoPromocao: TLabel [5]
    Left = 176
    Top = 154
    Width = 106
    Height = 13
    Caption = 'CODIGO_PROMOCAO'
    FocusControl = DBEditCodigoPromocao
  end
  object LabelCodigoColaborador: TLabel [6]
    Left = 397
    Top = 83
    Width = 108
    Height = 13
    Caption = 'C'#243'digo do colaborador'
    FocusControl = DBEditCodigoColaborador
  end
  inherited Navegador: TDBNavigator
    Top = 688
    Hints.Strings = ()
    ExplicitTop = 688
  end
  inherited GroupBoxAcao: TGroupBox
    Top = 637
    ExplicitTop = 637
  end
  inherited grouProduto: TGroupBox
    Top = 245
    ExplicitTop = 245
    inherited buttonNovoItem: TSpeedButton
      Top = 92
      ExplicitTop = 92
    end
    inherited buttonEditarItem: TSpeedButton
      Left = 149
      Top = 92
      ExplicitLeft = 149
      ExplicitTop = 92
    end
    inherited buttonSalvarItem: TSpeedButton
      Top = 92
      ExplicitTop = 92
    end
    inherited buttonDesfazerItem: TSpeedButton
      Top = 92
      ExplicitTop = 92
    end
    inherited buttonExcluirItem: TSpeedButton
      Top = 92
      ExplicitTop = 92
    end
    object LabelCodigoProduto: TLabel [5]
      Left = 8
      Top = 32
      Width = 89
      Height = 13
      Caption = 'C'#243'digo do produto'
      FocusControl = DBEditCodigoProduto
    end
    object LabelNomeProduto: TLabel [6]
      Left = 176
      Top = 32
      Width = 84
      Height = 13
      Caption = 'NOME_PRODUTO'
      FocusControl = DBEditNomeProduto
    end
    inherited gridItem: TDBGrid
      Top = 120
      Height = 70
    end
    object DBEditCodigoProduto: TDBEdit
      Left = 8
      Top = 65
      Width = 134
      Height = 21
      DataField = 'CODIGO_PRODUTO'
      DataSource = dsProduto
      TabOrder = 1
    end
    object DBEditNomeProduto: TDBEdit
      Left = 176
      Top = 65
      Width = 300
      Height = 21
      DataField = 'NOME_PRODUTO'
      DataSource = dsProduto
      Enabled = False
      TabOrder = 2
    end
  end
  inherited GroupBoxServico: TGroupBox
    Top = 437
    ExplicitTop = 437
    inherited ButtonCancelarServico: TSpeedButton
      Top = 92
      ExplicitTop = 92
    end
    inherited ButtonEditarServico: TSpeedButton
      Left = 149
      Top = 92
      ExplicitLeft = 149
      ExplicitTop = 92
    end
    inherited ButtonExcluirServico: TSpeedButton
      Top = 92
      ExplicitTop = 92
    end
    inherited ButtonNovoServico: TSpeedButton
      Top = 92
      ExplicitTop = 92
    end
    inherited ButtonSalvarServico: TSpeedButton
      Top = 92
      ExplicitTop = 92
    end
    object LabelCodigoServico: TLabel [5]
      Left = 8
      Top = 35
      Width = 70
      Height = 13
      Caption = 'C'#243'digo servi'#231'o'
      FocusControl = DBEditCodigoServico
    end
    object LabelNomeServico: TLabel [6]
      Left = 160
      Top = 34
      Width = 79
      Height = 13
      Caption = 'Nome do servi'#231'o'
      FocusControl = DBEditNomeServico
    end
    inherited DBGridServico: TDBGrid
      Left = 1
      Top = 120
      Width = 668
      Height = 78
      Align = alNone
      DataSource = DSServico
    end
    object DBEditCodigoServico: TDBEdit
      Left = 8
      Top = 54
      Width = 134
      Height = 21
      DataField = 'CODIGO_SERVICO'
      DataSource = DSServico
      TabOrder = 1
    end
    object DBEditNomeServico: TDBEdit
      Left = 160
      Top = 53
      Width = 300
      Height = 21
      DataField = 'NOME_SERVICO'
      DataSource = DSServico
      Enabled = False
      TabOrder = 2
    end
  end
  object DBEditCodigoOS: TDBEdit [11]
    Left = 8
    Top = 46
    Width = 134
    Height = 21
    DataField = 'CODIGO_OS'
    DataSource = DS
    Enabled = False
    TabOrder = 4
  end
  object DBEditData: TDBEdit [12]
    Left = 8
    Top = 102
    Width = 134
    Height = 21
    DataField = 'DATA_OS'
    DataSource = DS
    TabOrder = 5
  end
  object DBEditCodigoCLiente: TDBEdit [13]
    Left = 216
    Top = 102
    Width = 134
    Height = 21
    DataField = 'CODIGO_CLIENTE'
    DataSource = DS
    TabOrder = 6
  end
  object DBEditCodigoPagamento: TDBEdit [14]
    Left = 8
    Top = 173
    Width = 134
    Height = 21
    DataField = 'CODIGO_PAGAMENTO'
    DataSource = DS
    TabOrder = 7
  end
  object DBEditCodigoPromocao: TDBEdit [15]
    Left = 176
    Top = 173
    Width = 134
    Height = 21
    DataField = 'CODIGO_PROMOCAO'
    DataSource = DS
    TabOrder = 8
  end
  object DBEditCodigoColaborador: TDBEdit [16]
    Left = 397
    Top = 102
    Width = 134
    Height = 21
    DataField = 'CODIGO_COLABORADOR'
    DataSource = DS
    TabOrder = 9
  end
  inherited Query: TIBQuery
    AfterScroll = QueryAfterScroll
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
    Left = 544
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
      EditMask = '  /  /    '
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
  end
  inherited DS: TDataSource
    Left = 544
    Top = 64
  end
  inherited Update: TIBUpdateSQL
    Left = 544
    Top = 120
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
    Left = 592
    Top = 192
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
  inherited updateProduto: TIBUpdateSQL
    Left = 432
    Top = 200
  end
  inherited dsProduto: TDataSource
    Left = 512
    Top = 192
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
    UpdateObject = UpdateServico
    Left = 192
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
  inherited UpdateServico: TIBUpdateSQL
    Left = 240
  end
  inherited DSServico: TDataSource
    DataSet = QueryServico
    Left = 304
    Top = 16
  end
end
