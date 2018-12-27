inherited FormCadastroPagamento: TFormCadastroPagamento
  Caption = 'Cadastro de Formas de Pagamento'
  ClientHeight = 177
  ClientWidth = 591
  ExplicitWidth = 607
  ExplicitHeight = 216
  PixelsPerInch = 96
  TextHeight = 13
  inherited ButtonPesquisa: TSpeedButton
    Left = 543
    Top = 58
    Height = 21
    OnClick = ButtonPesquisaClick
    ExplicitLeft = 543
    ExplicitTop = 58
    ExplicitHeight = 21
  end
  inherited Navegador: TDBNavigator
    Top = 152
    Width = 591
    Hints.Strings = ()
    ExplicitTop = 152
    ExplicitWidth = 591
  end
  object GroupBoxInformacao: TGroupBox [2]
    Left = 0
    Top = 5
    Width = 537
    Height = 96
    Caption = 'Informa'#231#245'es do Pagamento'
    TabOrder = 2
    object LabelCodigo: TLabel
      Left = 16
      Top = 34
      Width = 105
      Height = 13
      Caption = 'C'#243'digo do Pagamento'
      FocusControl = DBEditCodigo
    end
    object LabelForma: TLabel
      Left = 168
      Top = 34
      Width = 102
      Height = 13
      Caption = 'Forma de Pagamento'
      FocusControl = DBEditForma
    end
    object LabelParcela: TLabel
      Left = 462
      Top = 34
      Width = 40
      Height = 13
      Caption = 'Parcelas'
    end
    object DBEditCodigo: TDBEdit
      Left = 16
      Top = 53
      Width = 146
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CODIGO_PAGAMENTO'
      DataSource = DS
      Enabled = False
      TabOrder = 0
    end
    object DBComboBoxParcela: TDBComboBox
      Left = 462
      Top = 53
      Width = 75
      Height = 21
      Style = csDropDownList
      CharCase = ecUpperCase
      DataField = 'PARCELA'
      DataSource = DS
      Items.Strings = (
        '00'
        '01'
        '02'
        '03'
        '04'
        '05'
        '06'
        '07'
        '08'
        '09'
        '10'
        '11'
        '12')
      TabOrder = 2
    end
    object DBEditForma: TDBEdit
      Left = 168
      Top = 53
      Width = 288
      Height = 21
      CharCase = ecUpperCase
      DataField = 'FORMA_PAGAMENTO'
      DataSource = DS
      TabOrder = 1
    end
  end
  inherited GroupBoxAcao: TGroupBox
    Top = 101
    Width = 591
    Caption = ''
    ExplicitTop = 101
    ExplicitWidth = 591
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
      Left = 516
      ExplicitLeft = 516
    end
  end
  inherited Query: TIBQuery
    SQL.Strings = (
      'SELECT * FROM PAGAMENTO'
      'ORDER BY CODIGO_PAGAMENTO')
    Left = 184
    Top = 16
    object QueryCODIGO_PAGAMENTO: TIntegerField
      FieldName = 'CODIGO_PAGAMENTO'
      Origin = '"PAGAMENTO"."CODIGO_PAGAMENTO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryFORMA_PAGAMENTO: TIBStringField
      FieldName = 'FORMA_PAGAMENTO'
      Origin = '"PAGAMENTO"."FORMA_PAGAMENTO"'
      Required = True
      Size = 100
    end
    object QueryPARCELA: TIBStringField
      FieldName = 'PARCELA'
      Origin = '"PAGAMENTO"."PARCELA"'
      Required = True
      FixedChar = True
      Size = 2
    end
  end
  inherited DS: TDataSource
    Left = 224
    Top = 16
  end
  inherited Update: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO_PAGAMENTO,'
      '  FORMA_PAGAMENTO,'
      '  PARCELA'
      'from PAGAMENTO '
      'where'
      '  CODIGO_PAGAMENTO = :CODIGO_PAGAMENTO')
    ModifySQL.Strings = (
      'update PAGAMENTO'
      'set'
      '  CODIGO_PAGAMENTO = :CODIGO_PAGAMENTO,'
      '  FORMA_PAGAMENTO = :FORMA_PAGAMENTO,'
      '  PARCELA = :PARCELA'
      'where'
      '  CODIGO_PAGAMENTO = :OLD_CODIGO_PAGAMENTO')
    InsertSQL.Strings = (
      'insert into PAGAMENTO'
      '  (CODIGO_PAGAMENTO, FORMA_PAGAMENTO, PARCELA)'
      'values'
      '  (:CODIGO_PAGAMENTO, :FORMA_PAGAMENTO, :PARCELA)')
    DeleteSQL.Strings = (
      'delete from PAGAMENTO'
      'where'
      '  CODIGO_PAGAMENTO = :OLD_CODIGO_PAGAMENTO')
    Left = 264
    Top = 16
  end
end
