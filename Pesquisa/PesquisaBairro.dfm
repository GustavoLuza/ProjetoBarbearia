inherited FormPesquisaBairro: TFormPesquisaBairro
  Caption = 'Pesquisa de Bairro'
  ClientHeight = 397
  ExplicitWidth = 755
  ExplicitHeight = 436
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
    Items.Strings = (
      'C'#243'digo do bairro'
      'Nome do bairro'
      'Nome da cidade')
    OnClick = RadioFiltroClick
  end
  inherited GridPesquisa: TDBGrid
    Height = 260
  end
  inherited Query: TIBQuery
    SQL.Strings = (
      'SELECT BAIRRO.*,CIDADE.NOME_CIDADE FROM BAIRRO'
      'INNER JOIN CIDADE ON(CIDADE.CODIGO_CIDADE=BAIRRO.CODIGO_CIDADE)'
      'ORDER BY BAIRRO.CODIGO_BAIRRO')
    object QueryCODIGO_BAIRRO: TIntegerField
      DisplayLabel = 'CODIGO DO BAIRRO'
      FieldName = 'CODIGO_BAIRRO'
      Origin = '"BAIRRO"."CODIGO_BAIRRO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryNOME_BAIRRO: TIBStringField
      DisplayLabel = 'NOME DO BAIRRO'
      FieldName = 'NOME_BAIRRO'
      Origin = '"BAIRRO"."NOME_BAIRRO"'
      Required = True
      Size = 100
    end
    object QueryCODIGO_CIDADE: TIntegerField
      DisplayLabel = 'CODIGO DA CIDADE'
      FieldName = 'CODIGO_CIDADE'
      Origin = '"BAIRRO"."CODIGO_CIDADE"'
      Required = True
    end
    object QueryNOME_CIDADE: TIBStringField
      DisplayLabel = 'NOME DA CIDADE'
      FieldName = 'NOME_CIDADE'
      Origin = '"CIDADE"."NOME_CIDADE"'
      Required = True
      Size = 60
    end
  end
  object DataSetBairro: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = Query
    BCDToCurrency = False
    Left = 576
    Top = 232
  end
  object ReportBairro: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43035.808895150500000000
    ReportOptions.LastChange = 43035.808895150500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 576
    Top = 176
    Datasets = <
      item
        DataSet = DataSetBairro
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
        Height = 98.267780000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Date: TfrxMemoView
          Left = 45.354360000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            '[Date]')
        end
        object Time: TfrxMemoView
          Left = 173.858380000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            '[Time]')
        end
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Top = 68.031540000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'C'#243'digo do bairro')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 147.401670000000000000
          Top = 68.031540000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Bairro')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 366.614410000000000000
          Top = 68.031540000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'C'#243'digo da cidade')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 521.575140000000000000
          Top = 68.031540000000000000
          Width = 192.756030000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Cidade')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 3.779530000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Data:')
        end
        object Memo6: TfrxMemoView
          Left = 136.063080000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Hora:')
        end
        object Line1: TfrxLineView
          Left = 3.779530000000000000
          Top = 90.708720000000000000
          Width = 714.331170000000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo7: TfrxMemoView
          Left = 3.779530000000000000
          Top = 26.456710000000000000
          Width = 714.331170000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio de bairros')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 525.354670000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'BarberSys sistema de gest'#227'o')
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 34.015770000000000000
        Top = 355.275820000000000000
        Width = 718.110700000000000000
        object Page: TfrxMemoView
          Left = 302.362400000000000000
          Top = 15.118120000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            '[Page#]')
        end
        object TotalPages: TfrxMemoView
          Left = 332.598640000000000000
          Top = 15.118120000000000000
          Width = 15.118120000000000000
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
        object Line2: TfrxLineView
          Left = 321.260050000000000000
          Top = 26.456710000000000000
          Width = 7.559060000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line3: TfrxLineView
          Left = 3.779530000000000000
          Top = 7.559060000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Diagonal = True
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 177.637910000000000000
        Width = 718.110700000000000000
        DataSet = DataSetBairro
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object frxDBDataset1CODIGO_BAIRRO: TfrxMemoView
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DataField = 'CODIGO_BAIRRO'
          DataSet = DataSetBairro
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."CODIGO_BAIRRO"]')
          ParentFont = False
        end
        object frxDBDataset1NOME_BAIRRO: TfrxMemoView
          Left = 147.401670000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          DataField = 'NOME_BAIRRO'
          DataSet = DataSetBairro
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."NOME_BAIRRO"]')
          ParentFont = False
        end
        object frxDBDataset1CODIGO_CIDADE: TfrxMemoView
          Left = 366.614410000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DataField = 'CODIGO_CIDADE'
          DataSet = DataSetBairro
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."CODIGO_CIDADE"]')
          ParentFont = False
        end
        object frxDBDataset1NOME_CIDADE: TfrxMemoView
          Left = 521.575140000000000000
          Width = 192.756030000000000000
          Height = 18.897650000000000000
          DataField = 'NOME_CIDADE'
          DataSet = DataSetBairro
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."NOME_CIDADE"]')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Height = 68.031540000000000000
        Top = 264.567100000000000000
        Width = 718.110700000000000000
        object Memo9: TfrxMemoView
          Left = 7.559060000000000000
          Top = 22.677180000000000000
          Width = 710.551640000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Quantidade de bairros cadastrados: [COUNT(MasterData1)]')
          ParentFont = False
        end
        object Line4: TfrxLineView
          Left = 3.779530000000000000
          Top = 11.338590000000000000
          Width = 714.331170000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line5: TfrxLineView
          Left = -3.779530000000000000
          Top = 56.692950000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Diagonal = True
        end
      end
    end
  end
end
