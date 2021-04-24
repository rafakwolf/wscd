inherited frmPrevListaFaturamento: TfrmPrevListaFaturamento
  Caption = 'frmPrevListaFaturamento'
  ClientHeight = 436
  ClientWidth = 807
  OldCreateOrder = True
  ExplicitWidth = 823
  ExplicitHeight = 474
  PixelsPerInch = 96
  TextHeight = 13
  inherited rrPadrao: TRLReport
    inherited rbTitulo: TRLBand
      inherited lbTitulo: TRLLabel
        Top = 77
        Height = 30
        ExplicitTop = 77
        ExplicitHeight = 30
      end
      inherited rlmCabecalho: TRLMemo
        Height = 76
        ExplicitHeight = 76
      end
      inherited imgLogo: TRLImage
        Height = 76
        ExplicitHeight = 76
      end
    end
    inherited rbRodape: TRLBand
      Top = 225
      ExplicitTop = 225
    end
    object rlbColunas: TRLBand
      Left = 38
      Top = 136
      Width = 718
      Height = 26
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Color = clSilver
      Degrade.OppositeColor = 15790320
      ParentColor = False
      Transparent = False
      object lbFornecedor: TRLLabel
        Left = 3
        Top = 4
        Width = 82
        Height = 16
        Caption = 'Fornecedor:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object rldbForn: TRLDBText
        Left = 87
        Top = 4
        Width = 83
        Height = 16
        DataField = 'FORNECEDOR'
        DataSource = dsPadrao
        Text = ''
        Transparent = False
      end
    end
    object rlsbDetalhes: TRLSubDetail
      Left = 38
      Top = 162
      Width = 718
      Height = 63
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      DataSource = dsDetalhe
      object rlbDetalhe: TRLBand
        Left = 0
        Top = 40
        Width = 718
        Height = 17
        BeforePrint = rlbDetalheBeforePrint
        object rldbCodBarra: TRLDBText
          Left = 3
          Top = 0
          Width = 111
          Height = 16
          AutoSize = False
          DataField = 'CODBARRA'
          DataSource = dsDetalhe
          Text = ''
        end
        object rldbProduto: TRLDBText
          Left = 117
          Top = 0
          Width = 289
          Height = 16
          AutoSize = False
          DataField = 'PRODUTO'
          DataSource = dsDetalhe
          Text = ''
        end
        object rldbPrecoCusto: TRLDBText
          Left = 465
          Top = 0
          Width = 45
          Height = 16
          Alignment = taRightJustify
          DataField = 'CUSTO'
          DataSource = dsDetalhe
          Text = ''
        end
        object rldbLucro: TRLDBText
          Left = 541
          Top = 0
          Width = 43
          Height = 16
          Alignment = taRightJustify
          DataField = 'LUCRO'
          DataSource = dsDetalhe
          Text = ''
        end
        object rldbPrecoVenda: TRLDBText
          Left = 672
          Top = 0
          Width = 43
          Height = 16
          Alignment = taRightJustify
          DataField = 'VENDA'
          DataSource = dsDetalhe
          Text = ''
        end
      end
      object rlbColunaProduto: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 40
        BandType = btColumnHeader
        object lbCodBarra: TRLLabel
          Left = 3
          Top = 22
          Width = 72
          Height = 16
          Caption = 'Cod. Barra'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object lbProduto: TRLLabel
          Left = 117
          Top = 22
          Width = 56
          Height = 16
          Caption = 'Produto'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object lbCusto: TRLLabel
          Left = 408
          Top = 22
          Width = 102
          Height = 16
          Caption = 'Pre'#231'o de Custo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object lbLucro: TRLLabel
          Left = 544
          Top = 22
          Width = 40
          Height = 16
          Caption = 'Lucro'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object lbPrecoVenda: TRLLabel
          Left = 609
          Top = 22
          Width = 106
          Height = 16
          Alignment = taRightJustify
          Caption = 'Pre'#231'o de Venda'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object rlblData: TRLLabel
          Left = 203
          Top = 2
          Width = 94
          Height = 16
          Caption = 'Data da nota:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rldbtDataNota: TRLDBText
          Left = 299
          Top = 2
          Width = 69
          Height = 16
          DataField = 'DATANOTA'
          DataSource = dsPadrao
          Text = ''
        end
        object rlblNroNota: TRLLabel
          Left = 3
          Top = 2
          Width = 65
          Height = 16
          Caption = 'Nro nota:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rldbtNroNota: TRLDBText
          Left = 70
          Top = 2
          Width = 54
          Height = 16
          DataField = 'NUMERO'
          DataSource = dsPadrao
          Text = ''
        end
      end
    end
  end
  inherited sqldPadrao: TSQLQuery
    CommandText = 
      'select'#13#10'  nf.NUMERO, '#13#10'  nf.CODFORNECEDOR, '#13#10'  fn.FANTAZIA FORNE' +
      'CEDOR, '#13#10'  nf.DATANOTA, '#13#10'  nf.DATAENTRADA, '#13#10'   c.OPERACAO, '#13#10' ' +
      ' nf.DESCONTO, '#13#10'  nf.ICMS, '#13#10'  nf.IPI, '#13#10'  nf.FRETE, '#13#10'  nf.DESP' +
      'ESAS, '#13#10'  nf.TOTALPRODUTO, '#13#10'  nf.TOTAL, '#13#10'  nf.OBS, '#13#10'  nf.BAIX' +
      'ADO, '#13#10'  nf.CONCLUIDA '#13#10'from NOTAS_FISCAIS nf '#13#10'left join FORNEC' +
      'EDORES fn on(nf.CODFORNECEDOR = fn.CODFORNECEDOR) '#13#10'left join CF' +
      'OP c on (c.NUMERO = nf.CFOP)'#13#10'where nf.CODFORNECEDOR = :COD'#13#10'ord' +
      'er by nf.NUMERO'
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
  inherited cdsPadrao: TMemDataset
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
    object cdsPadraosqldDetalhe: TDataset
      FieldName = 'sqldDetalhe'
    end
  end
  object dsDetalhe: TDataSource
    DataSet = cdsDetalhe
    Left = 110
    Top = 38
  end
  object cdsDetalhe: TMemDataset
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
    object cdsDetalheALIQUOTA: TIntegerField
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
  object dsLink: TDataSource
    DataSet = sqldPadrao
    Left = 46
    Top = 38
  end
  object sqldDetalhe: TSQLQuery
    CommandText = 
      'select    '#13#10'  dnf.NUMERO,'#13#10'  p.CODBARRA,   '#13#10'  p.DESCRICAO PRODU' +
      'TO, '#13#10'  dnf.ALIQUOTA, '#13#10'  dnf.QTDE,   '#13#10'  dnf.TOTAL,   '#13#10'  dnf.C' +
      'USTO,    '#13#10'  dnf.LUCRO,'#13#10'  dnf.VENDA,  '#13#10'  dnf.IPI,       '#13#10'  dn' +
      'f.DESCONTO'#13#10'from ITEMNOTAFISCAL dnf'#13#10'left join PRODUTOS p on (p.' +
      'IDPRODUTO = dnf.PRODUTO)'#13#10'where NUMERO = :NUMERO'
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
    object sqldDetalheALIQUOTA: TIntegerField
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
end
