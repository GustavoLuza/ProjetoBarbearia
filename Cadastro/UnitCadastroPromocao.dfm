inherited FormCadastroPromocao: TFormCadastroPromocao
  Caption = 'Cadastro de Promo'#231#245'es'
  ClientHeight = 174
  ClientWidth = 572
  ExplicitWidth = 588
  ExplicitHeight = 213
  PixelsPerInch = 96
  TextHeight = 13
  inherited ButtonPesquisa: TSpeedButton
    Left = 543
    Top = 54
    Height = 21
    OnClick = ButtonPesquisaClick
    ExplicitLeft = 543
    ExplicitTop = 54
    ExplicitHeight = 21
  end
  inherited Navegador: TDBNavigator
    Top = 149
    Width = 572
    Hints.Strings = ()
    ExplicitTop = 149
    ExplicitWidth = 572
  end
  object GroupBoxPromocao: TGroupBox [2]
    Left = 0
    Top = 6
    Width = 537
    Height = 92
    Caption = 'Informa'#231#245'es da Promo'#231#227'o'
    TabOrder = 2
    object LabelNome: TLabel
      Left = 156
      Top = 29
      Width = 92
      Height = 13
      Caption = 'Nome da Promo'#231#227'o'
      FocusControl = DBEditNome
    end
    object LabelCodigo: TLabel
      Left = 16
      Top = 29
      Width = 98
      Height = 13
      Caption = 'C'#243'digo da Promo'#231#227'o'
      FocusControl = DBEditCodigo
    end
    object LabelDesconto: TLabel
      Left = 412
      Top = 30
      Width = 87
      Height = 13
      Caption = 'Valor do Desconto'
      FocusControl = DBEditDesconto
    end
    object DBEditCodigo: TDBEdit
      Left = 16
      Top = 48
      Width = 134
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CODIGO_PROMOCAO'
      DataSource = DS
      Enabled = False
      TabOrder = 0
    end
    object DBEditDesconto: TDBEdit
      Left = 412
      Top = 49
      Width = 125
      Height = 21
      CharCase = ecUpperCase
      DataField = 'VALOR_DESCONTO'
      DataSource = DS
      TabOrder = 2
    end
    object DBEditNome: TDBEdit
      Left = 156
      Top = 48
      Width = 250
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NOME_PROMOCAO'
      DataSource = DS
      TabOrder = 1
    end
  end
  inherited GroupBoxAcao: TGroupBox
    Top = 98
    Width = 572
    Caption = ''
    ExplicitTop = 98
    ExplicitWidth = 572
    inherited ButtonCancelar: TBitBtn
      Left = 296
      ExplicitLeft = 296
    end
    inherited ButtonExcluir: TBitBtn
      Left = 392
      ExplicitLeft = 392
    end
    inherited ButtonFechar: TBitBtn
      Left = 497
      ExplicitLeft = 497
    end
  end
  inherited Query: TIBQuery
    SQL.Strings = (
      'SELECT * FROM PROMOCAO'
      'ORDER BY CODIGO_PROMOCAO')
    Left = 176
    Top = 8
    object QueryCODIGO_PROMOCAO: TIntegerField
      FieldName = 'CODIGO_PROMOCAO'
      Origin = '"PROMOCAO"."CODIGO_PROMOCAO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryNOME_PROMOCAO: TIBStringField
      DisplayWidth = 30
      FieldName = 'NOME_PROMOCAO'
      Origin = '"PROMOCAO"."NOME_PROMOCAO"'
      Required = True
      Size = 100
    end
    object QueryVALOR_DESCONTO: TIBBCDField
      FieldName = 'VALOR_DESCONTO'
      Origin = '"PROMOCAO"."VALOR_DESCONTO"'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
  end
  inherited DS: TDataSource
    Left = 224
    Top = 8
  end
  inherited Update: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO_PROMOCAO,'
      '  NOME_PROMOCAO,'
      '  VALOR_DESCONTO'
      'from PROMOCAO '
      'where'
      '  CODIGO_PROMOCAO = :CODIGO_PROMOCAO')
    ModifySQL.Strings = (
      'update PROMOCAO'
      'set'
      '  CODIGO_PROMOCAO = :CODIGO_PROMOCAO,'
      '  NOME_PROMOCAO = :NOME_PROMOCAO,'
      '  VALOR_DESCONTO = :VALOR_DESCONTO'
      'where'
      '  CODIGO_PROMOCAO = :OLD_CODIGO_PROMOCAO')
    InsertSQL.Strings = (
      'insert into PROMOCAO'
      '  (CODIGO_PROMOCAO, NOME_PROMOCAO, VALOR_DESCONTO)'
      'values'
      '  (:CODIGO_PROMOCAO, :NOME_PROMOCAO, :VALOR_DESCONTO)')
    DeleteSQL.Strings = (
      'delete from PROMOCAO'
      'where'
      '  CODIGO_PROMOCAO = :OLD_CODIGO_PROMOCAO')
    Left = 264
    Top = 24
  end
end
