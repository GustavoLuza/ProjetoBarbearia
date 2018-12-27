inherited FormCadastroCidade: TFormCadastroCidade
  Caption = 'Cadastro de Cidades'
  ClientHeight = 172
  ClientWidth = 591
  ExplicitWidth = 607
  ExplicitHeight = 211
  PixelsPerInch = 96
  TextHeight = 13
  inherited ButtonPesquisa: TSpeedButton
    Left = 562
    Top = 52
    OnClick = ButtonPesquisaClick
    ExplicitLeft = 562
    ExplicitTop = 52
  end
  inherited Navegador: TDBNavigator
    Top = 147
    Width = 591
    Hints.Strings = ()
    ExplicitTop = 147
    ExplicitWidth = 586
  end
  object GroupBoxCidade: TGroupBox [2]
    Left = 0
    Top = 8
    Width = 556
    Height = 89
    Caption = 'Informa'#231#245'es da Cidade'
    TabOrder = 2
    object LabelCodigo: TLabel
      Left = 16
      Top = 29
      Width = 84
      Height = 13
      Caption = 'C'#243'digo da Cidade'
      FocusControl = DBEditCodigo
    end
    object LabelSigla: TLabel
      Left = 462
      Top = 29
      Width = 13
      Height = 13
      Caption = 'UF'
    end
    object LabelNome: TLabel
      Left = 156
      Top = 29
      Width = 78
      Height = 13
      Caption = 'Nome da Cidade'
      FocusControl = DBEditNome
    end
    object ComboBoxSigla: TDBComboBox
      Left = 462
      Top = 48
      Width = 80
      Height = 21
      Style = csDropDownList
      CharCase = ecUpperCase
      DataField = 'SIGLA_ESTADO'
      DataSource = DS
      Items.Strings = (
        'AC'
        'AL'
        'AP'
        'AM'
        'BA'
        'CE'
        'DF'
        'ES'
        'GO'
        'MA'
        'MT'
        'MS'
        'MG'
        'PA'
        'PB'
        'PR'
        'PE'
        'PI'
        'RJ'
        'RN'
        'RS'
        'RO'
        'RR'
        'SC'
        'SP'
        'SE'
        'TO')
      TabOrder = 2
    end
    object DBEditCodigo: TDBEdit
      Left = 16
      Top = 48
      Width = 134
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CODIGO_CIDADE'
      DataSource = DS
      Enabled = False
      TabOrder = 0
    end
    object DBEditNome: TDBEdit
      Left = 156
      Top = 48
      Width = 300
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NOME_CIDADE'
      DataSource = DS
      TabOrder = 1
    end
  end
  inherited GroupBoxAcao: TGroupBox
    Top = 96
    Width = 591
    Caption = ''
    ExplicitTop = 96
    ExplicitWidth = 586
    inherited ButtonEditar: TBitBtn
      Left = 104
      ExplicitLeft = 104
    end
    inherited ButtonSalvar: TBitBtn
      Left = 200
      ExplicitLeft = 200
    end
    inherited ButtonCancelar: TBitBtn
      Left = 304
      ExplicitLeft = 304
    end
    inherited ButtonExcluir: TBitBtn
      Left = 408
      ExplicitLeft = 408
    end
    inherited ButtonFechar: TBitBtn
      Left = 516
      ExplicitLeft = 516
    end
  end
  inherited Query: TIBQuery
    SQL.Strings = (
      'SELECT * FROM CIDADE'
      'ORDER BY CODIGO_CIDADE')
    Left = 144
    Top = 0
    object QueryCODIGO_CIDADE: TIntegerField
      FieldName = 'CODIGO_CIDADE'
      Origin = '"CIDADE"."CODIGO_CIDADE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryNOME_CIDADE: TIBStringField
      FieldName = 'NOME_CIDADE'
      Origin = '"CIDADE"."NOME_CIDADE"'
      Required = True
      Size = 60
    end
    object QuerySIGLA_ESTADO: TIBStringField
      FieldName = 'SIGLA_ESTADO'
      Origin = '"CIDADE"."SIGLA_ESTADO"'
      Required = True
      FixedChar = True
      Size = 2
    end
  end
  inherited DS: TDataSource
    Left = 184
    Top = 0
  end
  inherited Update: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO_CIDADE,'
      '  NOME_CIDADE,'
      '  SIGLA_ESTADO'
      'from CIDADE '
      'where'
      '  CODIGO_CIDADE = :CODIGO_CIDADE')
    ModifySQL.Strings = (
      'update CIDADE'
      'set'
      '  CODIGO_CIDADE = :CODIGO_CIDADE,'
      '  NOME_CIDADE = :NOME_CIDADE,'
      '  SIGLA_ESTADO = :SIGLA_ESTADO'
      'where'
      '  CODIGO_CIDADE = :OLD_CODIGO_CIDADE')
    InsertSQL.Strings = (
      'insert into CIDADE'
      '  (CODIGO_CIDADE, NOME_CIDADE, SIGLA_ESTADO)'
      'values'
      '  (:CODIGO_CIDADE, :NOME_CIDADE, :SIGLA_ESTADO)')
    DeleteSQL.Strings = (
      'delete from CIDADE'
      'where'
      '  CODIGO_CIDADE = :OLD_CODIGO_CIDADE')
    Left = 224
    Top = 0
  end
end
