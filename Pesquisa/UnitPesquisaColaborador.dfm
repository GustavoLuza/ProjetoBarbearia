inherited FormPesquisaColaborador: TFormPesquisaColaborador
  Caption = 'Pesquisa de Colaborador'
  ExplicitWidth = 755
  ExplicitHeight = 449
  PixelsPerInch = 96
  TextHeight = 13
  inherited GroupBoxOpcao: TGroupBox
    inherited ButtonPesquisar: TBitBtn
      OnClick = ButtonPesquisarClick
    end
    inherited ButtonImprimir: TBitBtn
      OnClick = ButtonImprimirClick
    end
  end
  inherited RadioFiltro: TRadioGroup
    Caption = ''
    Items.Strings = (
      'C'#243'digo do colaborador'
      'Nome do colaborador')
    OnClick = RadioFiltroClick
  end
  inherited Query: TIBQuery
    SQL.Strings = (
      
        'SELECT CODIGO_COLABORADOR, NOME_COLABORADOR, NUMERO_TELEFONE, DA' +
        'TA_NASCIMENTO, EMAIL, CONTA_BANCARIA  FROM COLABORADOR ORDER BY ' +
        'CODIGO_COLABORADOR')
    object QueryCODIGO_COLABORADOR: TIntegerField
      DisplayLabel = 'CODIGO DO COLABORADOR'
      FieldName = 'CODIGO_COLABORADOR'
      Origin = '"COLABORADOR"."CODIGO_COLABORADOR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryNOME_COLABORADOR: TIBStringField
      DisplayLabel = 'NOME DO COLABORADOR'
      FieldName = 'NOME_COLABORADOR'
      Origin = '"COLABORADOR"."NOME_COLABORADOR"'
      Required = True
      Size = 100
    end
    object QueryNUMERO_TELEFONE: TIBStringField
      DisplayLabel = 'NUMERO DO TELEFONE'
      FieldName = 'NUMERO_TELEFONE'
      Origin = '"COLABORADOR"."NUMERO_TELEFONE"'
      Required = True
      Size = 16
    end
    object QueryDATA_NASCIMENTO: TDateField
      DisplayLabel = 'DATA DE NASCIMENTO'
      FieldName = 'DATA_NASCIMENTO'
      Origin = '"COLABORADOR"."DATA_NASCIMENTO"'
      Required = True
    end
    object QueryEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = '"COLABORADOR"."EMAIL"'
      Required = True
      Size = 100
    end
    object QueryCONTA_BANCARIA: TIBStringField
      DisplayLabel = 'CONTA BANCARIA'
      FieldName = 'CONTA_BANCARIA'
      Origin = '"COLABORADOR"."CONTA_BANCARIA"'
      Required = True
      Size = 16
    end
  end
  object ReportColaborador: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43058.831402071760000000
    ReportOptions.LastChange = 43058.831402071760000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 592
    Top = 184
    Datasets = <
      item
        DataSet = DataSetColaborador
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 94.488250000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 7.559060000000000000
          Top = 3.779530000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Data:')
          ParentFont = False
        end
        object Date: TfrxMemoView
          Left = 49.133890000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 136.063080000000000000
          Top = 3.779530000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Hora:')
          ParentFont = False
        end
        object Time: TfrxMemoView
          Left = 177.637910000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Time]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 536.693260000000000000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'BarberSys sistema de gest'#227'o')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Top = 34.015770000000000000
          Width = 725.669760000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio de colaboradores')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 7.559060000000000000
          Top = 60.472480000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'C'#243'digo')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Top = 86.929190000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo6: TfrxMemoView
          Left = 241.889920000000000000
          Top = 60.472480000000000000
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Nome')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 173.858380000000000000
        Width = 718.110700000000000000
        DataSet = DataSetColaborador
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object frxDBDataset1CODIGO_COLABORADOR: TfrxMemoView
          Left = 7.559060000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'CODIGO_COLABORADOR'
          DataSet = DataSetColaborador
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."CODIGO_COLABORADOR"]')
          ParentFont = False
        end
        object frxDBDataset1NOME_COLABORADOR: TfrxMemoView
          Left = 241.889920000000000000
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          DataField = 'NOME_COLABORADOR'
          DataSet = DataSetColaborador
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."NOME_COLABORADOR"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 34.015770000000000000
        Top = 313.700990000000000000
        Width = 718.110700000000000000
        object Page: TfrxMemoView
          Left = 321.260050000000000000
          Top = 11.338590000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Page#]')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Width = 718.110700000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line3: TfrxLineView
          Left = 340.157700000000000000
          Top = 22.677180000000000000
          Width = 11.338590000000000000
          Color = clBlack
          Diagonal = True
        end
        object TotalPages: TfrxMemoView
          Left = 351.496290000000000000
          Top = 11.338590000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[TotalPages#]')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Height = 34.015770000000000000
        Top = 257.008040000000000000
        Width = 718.110700000000000000
        object Line4: TfrxLineView
          Width = 721.890230000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line5: TfrxLineView
          Top = 30.236240000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo7: TfrxMemoView
          Top = 7.559060000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Quantidade de colaboradores: [COUNT(MasterData1)]')
          ParentFont = False
        end
      end
    end
  end
  object DataSetColaborador: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = Query
    BCDToCurrency = False
    Left = 584
    Top = 256
  end
end
