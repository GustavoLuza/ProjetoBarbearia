inherited FormPesquisaFornecedor: TFormPesquisaFornecedor
  Caption = 'Pesquisa de Fornecedor'
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
      'C'#243'digo do fornecedor'
      'Nome do fornecedor')
    OnClick = RadioFiltroClick
  end
  inherited Query: TIBQuery
    SQL.Strings = (
      
        'SELECT CODIGO_FORNECEDOR, NOME_FORNECEDOR,TELEFONE_FORNECEDOR, E' +
        'MAIL_FORNECEDOR FROM FORNECEDOR ORDER BY CODIGO_FORNECEDOR')
    object QueryCODIGO_FORNECEDOR: TIntegerField
      DisplayLabel = 'CODIGO DO FORNECEDOR'
      FieldName = 'CODIGO_FORNECEDOR'
      Origin = '"FORNECEDOR"."CODIGO_FORNECEDOR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryNOME_FORNECEDOR: TIBStringField
      DisplayLabel = 'NOME DO FORNECEDOR'
      FieldName = 'NOME_FORNECEDOR'
      Origin = '"FORNECEDOR"."NOME_FORNECEDOR"'
      Required = True
      Size = 100
    end
    object QueryTELEFONE_FORNECEDOR: TIBStringField
      DisplayLabel = 'TELEFONE DO FORNECEDOR'
      FieldName = 'TELEFONE_FORNECEDOR'
      Origin = '"FORNECEDOR"."TELEFONE_FORNECEDOR"'
      Required = True
      Size = 16
    end
    object QueryEMAIL_FORNECEDOR: TIBStringField
      DisplayLabel = 'EMAIL DO FORNECEDOR'
      FieldName = 'EMAIL_FORNECEDOR'
      Origin = '"FORNECEDOR"."EMAIL_FORNECEDOR"'
      Required = True
      Size = 100
    end
  end
  object DatasetFornecedor: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = Query
    BCDToCurrency = False
    Left = 592
    Top = 248
  end
  object ReportFornecedor: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43060.679830752310000000
    ReportOptions.LastChange = 43060.679830752310000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 584
    Top = 176
    Datasets = <
      item
        DataSet = DatasetFornecedor
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
        Height = 105.826840000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Left = 3.779530000000000000
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
        object Memo3: TfrxMemoView
          Left = 143.622140000000000000
          Width = 41.574830000000000000
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
          Left = 192.756030000000000000
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
        object Memo4: TfrxMemoView
          Left = 532.913730000000000000
          Width = 185.196970000000000000
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
        object Memo5: TfrxMemoView
          Left = 7.559060000000000000
          Top = 79.370130000000000000
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
          Left = 238.110390000000000000
          Top = 75.590600000000000000
          Width = 264.567100000000000000
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
          Top = 30.236240000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio de fornecedores')
          ParentFont = False
        end
        object Line5: TfrxLineView
          Top = 102.047310000000000000
          Width = 725.669760000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 30.236240000000000000
        Top = 340.157700000000000000
        Width = 718.110700000000000000
        object Line3: TfrxLineView
          Top = 3.779530000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Page: TfrxMemoView
          Left = 313.700990000000000000
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
            '[Page#]')
          ParentFont = False
        end
        object TotalPages: TfrxMemoView
          Left = 343.937230000000000000
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
        object Line4: TfrxLineView
          Left = 332.598640000000000000
          Top = 18.897650000000000000
          Width = 11.338590000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 185.196970000000000000
        Width = 718.110700000000000000
        DataSet = DatasetFornecedor
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object frxDBDataset1CODIGO_FORNECEDOR: TfrxMemoView
          Left = 7.559060000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'CODIGO_FORNECEDOR'
          DataSet = DatasetFornecedor
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."CODIGO_FORNECEDOR"]')
          ParentFont = False
        end
        object frxDBDataset1NOME_FORNECEDOR: TfrxMemoView
          Left = 238.110390000000000000
          Top = 3.779530000000000000
          Width = 264.567100000000000000
          Height = 18.897650000000000000
          DataField = 'NOME_FORNECEDOR'
          DataSet = DatasetFornecedor
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."NOME_FORNECEDOR"]')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Height = 49.133890000000000000
        Top = 268.346630000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Top = 15.118120000000000000
          Width = 714.331170000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            
              'Quantidade de fornecedores: [SUM(<frxDBDataset1."CODIGO_FORNECED' +
              'OR">,MasterData1)]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Top = 3.779530000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          Left = 3.779530000000000000
          Top = 41.574830000000000000
          Width = 714.331170000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
    end
  end
end
