inherited FormCadastroServico: TFormCadastroServico
  Caption = 'Cadastro de Servi'#231'os'
  ClientHeight = 178
  ClientWidth = 604
  ExplicitWidth = 620
  ExplicitHeight = 217
  PixelsPerInch = 96
  TextHeight = 13
  inherited ButtonPesquisa: TSpeedButton
    Left = 575
    Top = 57
    Height = 21
    OnClick = ButtonPesquisaClick
    ExplicitLeft = 575
    ExplicitTop = 57
    ExplicitHeight = 21
  end
  inherited Navegador: TDBNavigator
    Top = 153
    Width = 604
    Hints.Strings = ()
    ExplicitTop = 153
    ExplicitWidth = 604
  end
  object GroupBoxServico: TGroupBox [2]
    Left = 0
    Top = 6
    Width = 569
    Height = 96
    Caption = 'Informa'#231#245'es do Servi'#231'o'
    TabOrder = 2
    object LabelNome: TLabel
      Left = 143
      Top = 32
      Width = 80
      Height = 13
      Caption = 'Nome do Servi'#231'o'
      FocusControl = DBEditNome
    end
    object LabelCódigo: TLabel
      Left = 19
      Top = 32
      Width = 86
      Height = 13
      Caption = 'C'#243'digo do Servi'#231'o'
      FocusControl = DBEditCodigo
    end
    object LabelValor: TLabel
      Left = 439
      Top = 32
      Width = 77
      Height = 13
      Caption = 'Valor do Servi'#231'o'
      FocusControl = DBEditValor
    end
    object DBEditCodigo: TDBEdit
      Left = 19
      Top = 51
      Width = 118
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CODIGO_SERVICO'
      DataSource = DS
      Enabled = False
      TabOrder = 0
    end
    object DBEditNome: TDBEdit
      Left = 143
      Top = 51
      Width = 290
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NOME_SERVICO'
      DataSource = DS
      TabOrder = 1
    end
    object DBEditValor: TDBEdit
      Left = 439
      Top = 51
      Width = 130
      Height = 21
      CharCase = ecUpperCase
      DataField = 'VALOR_SERVICO'
      DataSource = DS
      TabOrder = 2
    end
  end
  inherited GroupBoxAcao: TGroupBox
    Top = 102
    Width = 604
    Caption = ''
    ExplicitTop = 102
    ExplicitWidth = 604
    inherited ButtonEditar: TBitBtn
      Left = 104
      ExplicitLeft = 104
    end
    inherited ButtonSalvar: TBitBtn
      Left = 208
      ExplicitLeft = 208
    end
    inherited ButtonCancelar: TBitBtn
      Left = 312
      ExplicitLeft = 312
    end
    inherited ButtonExcluir: TBitBtn
      Left = 416
      ExplicitLeft = 416
    end
    inherited ButtonFechar: TBitBtn
      Left = 529
      ExplicitLeft = 529
    end
  end
  inherited Query: TIBQuery
    SQL.Strings = (
      'SELECT * FROM SERVICO'
      'ORDER BY CODIGO_SERVICO')
    Left = 352
    Top = 8
    object QueryCODIGO_SERVICO: TIntegerField
      FieldName = 'CODIGO_SERVICO'
      Origin = '"SERVICO"."CODIGO_SERVICO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryNOME_SERVICO: TIBStringField
      FieldName = 'NOME_SERVICO'
      Origin = '"SERVICO"."NOME_SERVICO"'
      Required = True
      Size = 100
    end
    object QueryVALOR_SERVICO: TIBBCDField
      FieldName = 'VALOR_SERVICO'
      Origin = '"SERVICO"."VALOR_SERVICO"'
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
      '  CODIGO_SERVICO,'
      '  NOME_SERVICO,'
      '  VALOR_SERVICO'
      'from SERVICO '
      'where'
      '  CODIGO_SERVICO = :CODIGO_SERVICO')
    ModifySQL.Strings = (
      'update SERVICO'
      'set'
      '  CODIGO_SERVICO = :CODIGO_SERVICO,'
      '  NOME_SERVICO = :NOME_SERVICO,'
      '  VALOR_SERVICO = :VALOR_SERVICO'
      'where'
      '  CODIGO_SERVICO = :OLD_CODIGO_SERVICO')
    InsertSQL.Strings = (
      'insert into SERVICO'
      '  (CODIGO_SERVICO, NOME_SERVICO, VALOR_SERVICO)'
      'values'
      '  (:CODIGO_SERVICO, :NOME_SERVICO, :VALOR_SERVICO)')
    DeleteSQL.Strings = (
      'delete from SERVICO'
      'where'
      '  CODIGO_SERVICO = :OLD_CODIGO_SERVICO')
    Left = 272
    Top = 8
  end
end
