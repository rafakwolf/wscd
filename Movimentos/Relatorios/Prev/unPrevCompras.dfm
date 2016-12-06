inherited frmPrevCompras: TfrmPrevCompras
  Left = 2
  Top = 1
  Caption = 'frmPrevCompras'
  ClientHeight = 530
  ClientWidth = 1009
  OldCreateOrder = True
  ExplicitWidth = 1025
  ExplicitHeight = 568
  PixelsPerInch = 96
  TextHeight = 13
  inherited rrPadrao: TRLReport
    Width = 1123
    Height = 794
    PageSetup.Orientation = poLandscape
    ExplicitWidth = 1123
    ExplicitHeight = 794
    inherited rbTitulo: TRLBand
      Width = 1047
      ExplicitWidth = 1047
      inherited lbTitulo: TRLLabel
        Width = 1045
        Height = 30
        ExplicitWidth = 1045
        ExplicitHeight = 30
      end
      inherited rlmCabecalho: TRLMemo
        Width = 947
        Height = 76
        ExplicitWidth = 947
        ExplicitHeight = 76
      end
      inherited imgLogo: TRLImage
        Height = 76
        ExplicitHeight = 76
      end
    end
    inherited rbRodape: TRLBand
      Top = 311
      Width = 1047
      ExplicitTop = 311
      ExplicitWidth = 1047
      inherited sysData: TRLSystemInfo
        Left = 935
        ExplicitLeft = 935
      end
      inherited sysPage: TRLSystemInfo
        Left = 871
        ExplicitLeft = 871
      end
    end
    object rlgCompras: TRLGroup
      Left = 38
      Top = 139
      Width = 1047
      Height = 172
      DataFields = 'NUMERO'
      object rlbMestre: TRLBand
        Left = 0
        Top = 0
        Width = 1047
        Height = 70
        BandType = btHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = True
        Color = clSilver
        ParentColor = False
        Transparent = False
        object lbNumero: TRLLabel
          Left = 7
          Top = 3
          Width = 53
          Height = 16
          Caption = 'N'#250'mero'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object rldbNumero: TRLDBText
          Left = 64
          Top = 3
          Width = 54
          Height = 16
          DataField = 'NUMERO'
          DataSource = dsPadrao
          Text = ''
          Transparent = False
        end
        object lbFornecedor: TRLLabel
          Left = 7
          Top = 19
          Width = 77
          Height = 16
          Caption = 'Fornecedor'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object rldbFornecedor: TRLDBText
          Left = 87
          Top = 19
          Width = 83
          Height = 16
          DataField = 'FORNECEDOR'
          DataSource = dsPadrao
          Text = ''
          Transparent = False
        end
        object lbOperacao: TRLLabel
          Left = 199
          Top = 3
          Width = 66
          Height = 16
          Caption = 'Opera'#231#227'o'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object rldbOperacao: TRLDBText
          Left = 269
          Top = 3
          Width = 68
          Height = 16
          DataField = 'OPERACAO'
          DataSource = dsPadrao
          Text = ''
          Transparent = False
        end
        object lbDataChegada: TRLLabel
          Left = 7
          Top = 51
          Width = 110
          Height = 16
          Caption = 'Data de Entrega'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object lbSaida: TRLLabel
          Left = 7
          Top = 35
          Width = 89
          Height = 16
          Caption = 'Data da nota'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object rlddDataSaida: TRLDBText
          Left = 100
          Top = 35
          Width = 69
          Height = 16
          DataField = 'DATANOTA'
          DataSource = dsPadrao
          Text = ''
          Transparent = False
        end
        object rldbEntrada: TRLDBText
          Left = 120
          Top = 51
          Width = 91
          Height = 16
          DataField = 'DATAENTRADA'
          DataSource = dsPadrao
          Text = ''
          Transparent = False
        end
      end
      object rlsbDetalhe: TRLSubDetail
        Left = 0
        Top = 70
        Width = 1047
        Height = 71
        DataSource = dsDetalhe
        object rlbDetalheProdutos: TRLBand
          Left = 0
          Top = 18
          Width = 1047
          Height = 17
          BeforePrint = rlbDetalheProdutosBeforePrint
          object rldbProduto: TRLDBText
            Left = 8
            Top = 0
            Width = 401
            Height = 16
            AutoSize = False
            DataField = 'PRODUTO'
            DataSource = dsDetalhe
            Text = ''
          end
          object rldbAliquota: TRLDBText
            Left = 416
            Top = 0
            Width = 64
            Height = 16
            DataField = 'ALIQUOTA'
            DataSource = dsDetalhe
            Text = ''
          end
          object rldbQtde: TRLDBText
            Left = 551
            Top = 0
            Width = 36
            Height = 16
            Alignment = taRightJustify
            DataField = 'QTDE'
            DataSource = dsDetalhe
            Text = ''
          end
          object rldbCusto: TRLDBText
            Left = 668
            Top = 0
            Width = 45
            Height = 16
            Alignment = taRightJustify
            DataField = 'CUSTO'
            DataSource = dsDetalhe
            Text = ''
          end
          object rldbLucro: TRLDBText
            Left = 741
            Top = 0
            Width = 43
            Height = 16
            DataField = 'LUCRO'
            DataSource = dsDetalhe
            Text = ''
          end
          object rldbVenda: TRLDBText
            Left = 810
            Top = 0
            Width = 43
            Height = 16
            Alignment = taRightJustify
            DataField = 'VENDA'
            DataSource = dsDetalhe
            Text = ''
          end
          object rldbIPI: TRLDBText
            Left = 915
            Top = 0
            Width = 19
            Height = 16
            Alignment = taRightJustify
            DataField = 'IPI'
            DataSource = dsDetalhe
            Text = ''
          end
          object rldbDesconto: TRLDBText
            Left = 964
            Top = 0
            Width = 69
            Height = 16
            Alignment = taRightJustify
            DataField = 'DESCONTO'
            DataSource = dsDetalhe
            Text = ''
          end
        end
        object rlbColunaDetalhes: TRLBand
          Left = 0
          Top = 0
          Width = 1047
          Height = 18
          BandType = btColumnHeader
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = True
          object lbProduto: TRLLabel
            Left = 8
            Top = 0
            Width = 56
            Height = 16
            Caption = 'Produto'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbAliquota: TRLLabel
            Left = 416
            Top = 0
            Width = 58
            Height = 16
            Caption = 'Aliquota'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbQtde: TRLLabel
            Left = 552
            Top = 0
            Width = 35
            Height = 16
            Caption = 'Qtde'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbCusto: TRLLabel
            Left = 672
            Top = 0
            Width = 41
            Height = 16
            Caption = 'Custo'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbLucro: TRLLabel
            Left = 744
            Top = 0
            Width = 40
            Height = 16
            Caption = 'Lucro'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbVenda: TRLLabel
            Left = 808
            Top = 0
            Width = 45
            Height = 16
            Caption = 'Venda'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbIPI: TRLLabel
            Left = 912
            Top = 0
            Width = 22
            Height = 16
            Caption = 'IPI'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbDesconto: TRLLabel
            Left = 968
            Top = 0
            Width = 65
            Height = 16
            Caption = 'Desconto'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object rlbSumario: TRLBand
          Left = 0
          Top = 35
          Width = 1047
          Height = 20
          BandType = btSummary
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = True
          Borders.DrawRight = False
          Borders.DrawBottom = False
          object lbTotal: TRLLabel
            Left = 987
            Top = 2
            Width = 57
            Height = 16
            Alignment = taRightJustify
            Caption = '<total>'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
      end
    end
  end
  inherited sqldPadrao: TSQLDataSet
    CommandText = 
      'select'#13#10'  nf.NUMERO, '#13#10'  nf.CODFORNECEDOR, '#13#10'  fn.FANTAZIA FORNE' +
      'CEDOR, '#13#10'  nf.DATANOTA, '#13#10'  nf.DATAENTRADA, '#13#10'   c.OPERACAO, '#13#10' ' +
      ' nf.DESCONTO, '#13#10'  nf.ICMS, '#13#10'  nf.IPI, '#13#10'  nf.FRETE, '#13#10'  nf.DESP' +
      'ESAS, '#13#10'  nf.TOTALPRODUTO, '#13#10'  nf.TOTAL, '#13#10'  nf.OBS, '#13#10'  nf.CFOP' +
      ', '#13#10'  nf.BAIXADO, '#13#10'  nf.CONCLUIDA '#13#10' from NOTAS_FISCAIS nf '#13#10'le' +
      'ft join FORNECEDORES fn on(nf.CODFORNECEDOR = fn.CODFORNECEDOR) ' +
      #13#10'left join CFOP c on (c.NUMERO = nf.CFOP)'#13#10'where nf.CODFORNECED' +
      'OR = :COD'#13#10'order by nf.NUMERO'
    Params = <
      item
        DataType = ftInteger
        Name = 'COD'
        ParamType = ptInput
      end>
    object sqldPadraoNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Required = True
    end
    object sqldPadraoCODFORNECEDOR: TIntegerField
      FieldName = 'CODFORNECEDOR'
    end
    object sqldPadraoFORNECEDOR: TStringField
      FieldName = 'FORNECEDOR'
      Size = 80
    end
    object sqldPadraoDATANOTA: TDateField
      FieldName = 'DATANOTA'
    end
    object sqldPadraoDATAENTRADA: TDateField
      FieldName = 'DATAENTRADA'
    end
    object sqldPadraoOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Size = 250
    end
    object sqldPadraoDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Precision = 15
    end
    object sqldPadraoICMS: TFMTBCDField
      FieldName = 'ICMS'
      Precision = 15
    end
    object sqldPadraoIPI: TFMTBCDField
      FieldName = 'IPI'
      Precision = 15
    end
    object sqldPadraoFRETE: TFMTBCDField
      FieldName = 'FRETE'
      Precision = 15
    end
    object sqldPadraoDESPESAS: TFMTBCDField
      FieldName = 'DESPESAS'
      Precision = 15
    end
    object sqldPadraoTOTALPRODUTO: TFMTBCDField
      FieldName = 'TOTALPRODUTO'
      Precision = 15
    end
    object sqldPadraoTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 15
    end
    object sqldPadraoOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sqldPadraoCFOP: TStringField
      FieldName = 'CFOP'
    end
    object sqldPadraoBAIXADO: TStringField
      FieldName = 'BAIXADO'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoCONCLUIDA: TStringField
      FieldName = 'CONCLUIDA'
      FixedChar = True
      Size = 1
    end
  end
  inherited cdsPadrao: TClientDataSet
    Params = <
      item
        DataType = ftInteger
        Name = 'COD'
        ParamType = ptInput
      end>
    object cdsPadraoNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Required = True
    end
    object cdsPadraoCODFORNECEDOR: TIntegerField
      FieldName = 'CODFORNECEDOR'
    end
    object cdsPadraoFORNECEDOR: TStringField
      FieldName = 'FORNECEDOR'
      Size = 80
    end
    object cdsPadraoDATANOTA: TDateField
      FieldName = 'DATANOTA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoDATAENTRADA: TDateField
      FieldName = 'DATAENTRADA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Size = 250
    end
    object cdsPadraoDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
    object cdsPadraoICMS: TFMTBCDField
      FieldName = 'ICMS'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
    object cdsPadraoIPI: TFMTBCDField
      FieldName = 'IPI'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
    object cdsPadraoFRETE: TFMTBCDField
      FieldName = 'FRETE'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
    object cdsPadraoDESPESAS: TFMTBCDField
      FieldName = 'DESPESAS'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
    object cdsPadraoTOTALPRODUTO: TFMTBCDField
      FieldName = 'TOTALPRODUTO'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
    object cdsPadraoTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
    object cdsPadraoOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsPadraoCFOP: TStringField
      FieldName = 'CFOP'
    end
    object cdsPadraoBAIXADO: TStringField
      FieldName = 'BAIXADO'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoCONCLUIDA: TStringField
      FieldName = 'CONCLUIDA'
      FixedChar = True
      Size = 1
    end
    object cdsPadraosqldDetalhe: TDataSetField
      FieldName = 'sqldDetalhe'
    end
  end
  object sqldDetalhe: TSQLDataSet
    CommandText = 
      'select    '#13#10'  dnf.NUMERO,'#13#10'  p.CODBARRA,   '#13#10'  p.DESCRICAO PRODU' +
      'TO, '#13#10'  a.DESCRICAO ALIQUOTA, '#13#10'  dnf.QTDE,   '#13#10'  dnf.TOTAL,   '#13 +
      #10'  dnf.CUSTO,    '#13#10'  dnf.LUCRO,'#13#10'  dnf.VENDA,  '#13#10'  dnf.IPI,     ' +
      '  '#13#10'  dnf.DESCONTO'#13#10'from ITEMNOTAFISCAL dnf'#13#10'left join PRODUTOS ' +
      'p on (p.IDPRODUTO = dnf.PRODUTO)'#13#10'left join ALIQUOTAS a on (a.CO' +
      'DALIQUOTA = dnf.ALIQUOTA)'#13#10'where dnf.NUMERO = :NUMERO'
    DataSource = dsLink
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'NUMERO'
        ParamType = ptInput
        Size = 4
      end>
    Left = 16
    Top = 38
    object sqldDetalheNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Required = True
    end
    object sqldDetalheCODBARRA: TStringField
      FieldName = 'CODBARRA'
      Size = 13
    end
    object sqldDetalhePRODUTO: TStringField
      FieldName = 'PRODUTO'
      Size = 80
    end
    object sqldDetalheALIQUOTA: TStringField
      FieldName = 'ALIQUOTA'
    end
    object sqldDetalheQTDE: TIntegerField
      FieldName = 'QTDE'
    end
    object sqldDetalheTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 15
    end
    object sqldDetalheCUSTO: TFMTBCDField
      FieldName = 'CUSTO'
      Precision = 15
    end
    object sqldDetalheLUCRO: TIntegerField
      FieldName = 'LUCRO'
    end
    object sqldDetalheVENDA: TFMTBCDField
      FieldName = 'VENDA'
      Precision = 15
    end
    object sqldDetalheIPI: TFMTBCDField
      FieldName = 'IPI'
      Precision = 15
    end
    object sqldDetalheDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Precision = 15
    end
  end
  object dsLink: TDataSource
    DataSet = sqldPadrao
    Left = 46
    Top = 38
  end
  object cdsDetalhe: TClientDataSet
    Aggregates = <>
    DataSetField = cdsPadraosqldDetalhe
    Params = <>
    Left = 78
    Top = 38
    object cdsDetalheNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Required = True
    end
    object cdsDetalheCODBARRA: TStringField
      FieldName = 'CODBARRA'
      Size = 13
    end
    object cdsDetalhePRODUTO: TStringField
      FieldName = 'PRODUTO'
      Size = 80
    end
    object cdsDetalheALIQUOTA: TStringField
      FieldName = 'ALIQUOTA'
    end
    object cdsDetalheQTDE: TIntegerField
      FieldName = 'QTDE'
    end
    object cdsDetalheTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
    object cdsDetalheCUSTO: TFMTBCDField
      FieldName = 'CUSTO'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
    object cdsDetalheLUCRO: TIntegerField
      FieldName = 'LUCRO'
      DisplayFormat = '#,##0.00'
    end
    object cdsDetalheVENDA: TFMTBCDField
      FieldName = 'VENDA'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
    object cdsDetalheIPI: TFMTBCDField
      FieldName = 'IPI'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
    object cdsDetalheDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
  end
  object dsDetalhe: TDataSource
    DataSet = cdsDetalhe
    Left = 110
    Top = 38
  end
end
