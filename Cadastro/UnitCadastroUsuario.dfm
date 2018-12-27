inherited FormCadastroUsuario: TFormCadastroUsuario
  Caption = 'Cadastro de Usu'#225'rios'
  ClientHeight = 175
  ClientWidth = 575
  ExplicitWidth = 591
  ExplicitHeight = 214
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
    Top = 150
    Width = 575
    Hints.Strings = ()
    ExplicitTop = 150
    ExplicitWidth = 575
  end
  object GroupBoxLogin: TGroupBox [2]
    Left = 0
    Top = 6
    Width = 537
    Height = 93
    Caption = 'Informa'#231#245'es de Login'
    TabOrder = 2
    object LabelUsuario: TLabel
      Left = 16
      Top = 29
      Width = 36
      Height = 13
      Caption = 'Usu'#225'rio'
      FocusControl = DBEditUsuario
    end
    object LabelSenha: TLabel
      Left = 322
      Top = 29
      Width = 30
      Height = 13
      Caption = 'Senha'
      FocusControl = DBEditSenha
    end
    object DBEditUsuario: TDBEdit
      Left = 16
      Top = 48
      Width = 300
      Height = 21
      DataField = 'LOGIN'
      DataSource = DS
      TabOrder = 0
    end
    object DBEditSenha: TDBEdit
      Left = 322
      Top = 48
      Width = 215
      Height = 21
      DataField = 'SENHA'
      DataSource = DS
      PasswordChar = '*'
      TabOrder = 1
    end
  end
  inherited GroupBoxAcao: TGroupBox
    Top = 99
    Width = 575
    Caption = ''
    ExplicitTop = 99
    ExplicitWidth = 575
    inherited ButtonSalvar: TBitBtn
      Left = 200
      ExplicitLeft = 200
    end
    inherited ButtonCancelar: TBitBtn
      Left = 304
      ExplicitLeft = 304
    end
    inherited ButtonExcluir: TBitBtn
      Left = 400
      ExplicitLeft = 400
    end
    inherited ButtonFechar: TBitBtn
      Left = 500
      ExplicitLeft = 500
    end
  end
  inherited Query: TIBQuery
    SQL.Strings = (
      'SELECT * FROM USUARIO'
      'ORDER BY LOGIN')
    Left = 160
    Top = 16
    object QueryLOGIN: TIBStringField
      FieldName = 'LOGIN'
      Origin = '"USUARIO"."LOGIN"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 100
    end
    object QuerySENHA: TIBStringField
      FieldName = 'SENHA'
      Origin = '"USUARIO"."SENHA"'
      Required = True
      Size = 50
    end
  end
  inherited DS: TDataSource
    Left = 232
    Top = 16
  end
  inherited Update: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  LOGIN,'
      '  SENHA'
      'from USUARIO '
      'where'
      '  LOGIN = :LOGIN')
    ModifySQL.Strings = (
      'update USUARIO'
      'set'
      '  LOGIN = :LOGIN,'
      '  SENHA = :SENHA'
      'where'
      '  LOGIN = :OLD_LOGIN')
    InsertSQL.Strings = (
      'insert into USUARIO'
      '  (LOGIN, SENHA)'
      'values'
      '  (:LOGIN, :SENHA)')
    DeleteSQL.Strings = (
      'delete from USUARIO'
      'where'
      '  LOGIN = :OLD_LOGIN')
    Left = 280
    Top = 16
  end
end
