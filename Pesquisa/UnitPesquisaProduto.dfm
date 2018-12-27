inherited FormPesquisaProduto: TFormPesquisaProduto
  Caption = 'Pesquisa de Produto'
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
      'C'#243'digo do produto'
      'Nome do produto')
    OnClick = RadioFiltroClick
  end
  inherited Query: TIBQuery
    SQL.Strings = (
      'SELECT * FROM PRODUTO ORDER BY CODIGO_PRODUTO')
    object QueryNOME_PRODUTO: TIBStringField
      DisplayLabel = 'NOME DO PRODUTO'
      FieldName = 'NOME_PRODUTO'
      Origin = '"PRODUTO"."NOME_PRODUTO"'
      Required = True
      Size = 100
    end
    object QueryVALOR_ENTRADA: TIBBCDField
      DisplayLabel = 'VALOR DE ENTRADA'
      FieldName = 'VALOR_ENTRADA'
      Origin = '"PRODUTO"."VALOR_ENTRADA"'
      Required = True
      Precision = 18
      Size = 2
    end
    object QueryQUANTIDADE_PRODUTO: TIntegerField
      DisplayLabel = 'QUANTIDADE DO PRODUTO'
      FieldName = 'QUANTIDADE_PRODUTO'
      Origin = '"PRODUTO"."QUANTIDADE_PRODUTO"'
      Required = True
    end
    object QueryCODIGO_FORNECEDOR: TIntegerField
      DisplayLabel = 'CODIGO DO FORNECEDOR'
      FieldName = 'CODIGO_FORNECEDOR'
      Origin = '"PRODUTO"."CODIGO_FORNECEDOR"'
      Required = True
    end
    object QueryCODIGO_PRODUTO: TIntegerField
      DisplayLabel = 'CODIGO DO PRODUTO'
      FieldName = 'CODIGO_PRODUTO'
      Origin = '"PRODUTO"."CODIGO_PRODUTO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryVALOR_VENDA: TIBBCDField
      DisplayLabel = 'VALOR DE VENDA'
      FieldName = 'VALOR_VENDA'
      Origin = '"PRODUTO"."VALOR_VENDA"'
      Required = True
      Precision = 18
      Size = 2
    end
    object QueryMARCA_PRODUTO: TIBStringField
      DisplayLabel = 'MARCA DO PRODUTO'
      FieldName = 'MARCA_PRODUTO'
      Origin = '"PRODUTO"."MARCA_PRODUTO"'
      Required = True
      Size = 100
    end
  end
  object ReportProduto: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43060.691797210650000000
    ReportOptions.LastChange = 43060.691797210650000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 608
    Top = 184
    Datasets = <
      item
        DataSet = DatasetProduto
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
        Height = 90.708720000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
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
            'Data: ')
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
          Left = 139.842610000000000000
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
            'Hora: ')
          ParentFont = False
        end
        object Time: TfrxMemoView
          Left = 185.196970000000000000
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
          Left = 532.913730000000000000
          Top = 3.779530000000000000
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
          Top = 30.236240000000000000
          Width = 733.228820000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio de produtos')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Top = 86.929190000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo5: TfrxMemoView
          Left = 3.779530000000000000
          Top = 68.031540000000000000
          Width = 94.488250000000000000
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
        object Memo6: TfrxMemoView
          Left = 226.771800000000000000
          Top = 64.252010000000000000
          Width = 234.330860000000000000
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
        object Memo7: TfrxMemoView
          Left = 619.842920000000000000
          Top = 60.472480000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Quantidade')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 313.700990000000000000
        Width = 718.110700000000000000
        object Line4: TfrxLineView
          Top = 3.779530000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line5: TfrxLineView
          Left = 351.496290000000000000
          Top = 15.118120000000000000
          Width = 11.338590000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Page: TfrxMemoView
          Left = 328.819110000000000000
          Top = 7.559060000000000000
          Width = 22.677180000000000000
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
        object TotalPages: TfrxMemoView
          Left = 362.834880000000000000
          Top = 7.559060000000000000
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
        Height = 37.795300000000000000
        Top = 253.228510000000000000
        Width = 718.110700000000000000
        object Line2: TfrxLineView
          Top = 3.779530000000000000
          Width = 725.669760000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line3: TfrxLineView
          Top = 34.015770000000000000
          Width = 744.567410000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo8: TfrxMemoView
          Left = 3.779530000000000000
          Top = 11.338590000000000000
          Width = 710.551640000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            
              'Quantidade de produtos: [SUM(<frxDBDataset1."CODIGO_PRODUTO">,Ma' +
              'sterData1)]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 170.078850000000000000
        Width = 718.110700000000000000
        DataSet = DatasetProduto
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object frxDBDataset1CODIGO_PRODUTO: TfrxMemoView
          Left = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'CODIGO_PRODUTO'
          DataSet = DatasetProduto
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."CODIGO_PRODUTO"]')
          ParentFont = False
        end
        object frxDBDataset1NOME_PRODUTO: TfrxMemoView
          Left = 226.771800000000000000
          Width = 234.330860000000000000
          Height = 18.897650000000000000
          DataField = 'NOME_PRODUTO'
          DataSet = DatasetProduto
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."NOME_PRODUTO"]')
          ParentFont = False
        end
        object frxDBDataset1QUANTIDADE_PRODUTO: TfrxMemoView
          Left = 619.842920000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'QUANTIDADE_PRODUTO'
          DataSet = DatasetProduto
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."QUANTIDADE_PRODUTO"]')
          ParentFont = False
        end
      end
    end
  end
  object DatasetProduto: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = Query
    BCDToCurrency = False
    Left = 608
    Top = 248
  end
end
