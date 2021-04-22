inherited frmPrevOrcamento: TfrmPrevOrcamento
  Caption = 'frmPrevOrcamento'
  ClientHeight = 485
  ClientWidth = 811
  OldCreateOrder = True
  ExplicitWidth = 827
  ExplicitHeight = 524
  PixelsPerInch = 96
  TextHeight = 13
  inherited rrPadrao: TRLReport
    inherited rbTitulo: TRLBand
      inherited lbTitulo: TRLLabel
        Top = 76
        Height = 31
        ExplicitTop = 76
        ExplicitHeight = 31
      end
      inherited rlmCabecalho: TRLMemo
        Height = 75
        ExplicitHeight = 75
      end
      inherited imgLogo: TRLImage
        Height = 75
        ExplicitHeight = 75
      end
    end
    inherited rbRodape: TRLBand
      Top = 293
      ExplicitTop = 293
    end
    object rlgCompras: TRLGroup
      Left = 38
      Top = 139
      Width = 718
      Height = 154
      DataFields = 'CODIGO'
      object rlsbDetalhe: TRLSubDetail
        Left = 0
        Top = 65
        Width = 718
        Height = 72
        DataSource = dsDetOrcam
        object rlbDetalheProdutos: TRLBand
          Left = 0
          Top = 18
          Width = 718
          Height = 17
          BeforePrint = rlbDetalheProdutosBeforePrint
          object rldbProduto: TRLDBText
            Left = 8
            Top = 0
            Width = 273
            Height = 16
            AutoSize = False
            DataField = 'NOMEPRODUTO'
            DataSource = dsDetOrcam
            Text = ''
          end
          object rldbQtde: TRLDBText
            Left = 287
            Top = 0
            Width = 36
            Height = 16
            Alignment = taRightJustify
            DataField = 'QTDE'
            DataSource = dsDetOrcam
            Text = ''
          end
          object rldbCusto: TRLDBText
            Left = 340
            Top = 0
            Width = 45
            Height = 16
            Alignment = taRightJustify
            DataField = 'CUSTO'
            DataSource = dsDetOrcam
            Text = ''
          end
          object rldbDesconto: TRLDBText
            Left = 465
            Top = 0
            Width = 52
            Height = 16
            Alignment = taRightJustify
            DataField = 'DESCTO'
            DataSource = dsDetOrcam
            Text = ''
          end
          object rldbVenda: TRLDBText
            Left = 402
            Top = 0
            Width = 43
            Height = 16
            Alignment = taRightJustify
            DataField = 'VENDA'
            DataSource = dsDetOrcam
            Text = ''
          end
          object rldbValorDescto: TRLDBText
            Left = 532
            Top = 0
            Width = 91
            Height = 16
            Alignment = taRightJustify
            DataField = 'VALORDESCTO'
            DataSource = dsDetOrcam
            Text = ''
          end
          object rldbSubTotal: TRLDBText
            Left = 671
            Top = 0
            Width = 43
            Height = 16
            Alignment = taRightJustify
            DataField = 'TOTAL'
            DataSource = dsDetOrcam
            Text = ''
          end
        end
        object rlbColunaDetalhes: TRLBand
          Left = 0
          Top = 0
          Width = 718
          Height = 18
          BandType = btTitle
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
          object lbQtde: TRLLabel
            Left = 288
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
            Left = 344
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
          object lbDesconto: TRLLabel
            Left = 452
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
          object lbVenda: TRLLabel
            Left = 400
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
          object lbValorDescto: TRLLabel
            Left = 536
            Top = 0
            Width = 87
            Height = 16
            Caption = 'Valor Descto'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbSubTotal: TRLLabel
            Left = 648
            Top = 0
            Width = 66
            Height = 16
            Caption = 'Sub-Total'
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
          Width = 718
          Height = 21
          BandType = btSummary
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = True
          Borders.DrawRight = False
          Borders.DrawBottom = False
          Color = clBtnFace
          ParentColor = False
          Transparent = False
          object lbTotal: TRLLabel
            Left = 16
            Top = 3
            Width = 36
            Height = 16
            Caption = 'Total'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object rldbTotal: TRLDBText
            Left = 57
            Top = 3
            Width = 43
            Height = 16
            DataField = 'TOTAL'
            DataSource = dsPadrao
            Text = ''
            Transparent = False
          end
          object lbItens: TRLLabel
            Left = 552
            Top = 3
            Width = 38
            Height = 16
            Caption = 'Itens'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object rldbItens: TRLDBText
            Left = 594
            Top = 3
            Width = 39
            Height = 16
            DataField = 'ITENS'
            DataSource = dsPadrao
            Text = ''
            Transparent = False
          end
        end
      end
      object rlbMestre: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 65
        BandType = btHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = True
        Color = clBtnFace
        ParentColor = False
        Transparent = False
        object lbNumero: TRLLabel
          Left = 16
          Top = 8
          Width = 58
          Height = 16
          Caption = 'N'#250'mero:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object rldbNumero: TRLDBText
          Left = 77
          Top = 8
          Width = 50
          Height = 16
          DataField = 'CODIGO'
          DataSource = dsPadrao
          Text = ''
          Transparent = False
        end
        object lbCliente: TRLLabel
          Left = 16
          Top = 24
          Width = 53
          Height = 16
          Caption = 'Cliente:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object rlmemdse: TRLDBText
          Left = 72
          Top = 24
          Width = 86
          Height = 16
          DataField = 'NOMECLIENTE'
          DataSource = dsPadrao
          Text = ''
          Transparent = False
        end
        object lbData: TRLLabel
          Left = 16
          Top = 40
          Width = 40
          Height = 16
          Caption = 'Data:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object rldbDATA: TRLDBText
          Left = 60
          Top = 40
          Width = 36
          Height = 16
          DataField = 'DATA'
          DataSource = dsPadrao
          Text = ''
          Transparent = False
        end
      end
    end
  end
  inherited sqldPadrao: TSQLDataSet
    CommandText = 
      'select'#13#10'    orc.CODIGO,'#13#10'    orc.CODCLIENTE,'#13#10'    cli.Nome NOMEC' +
      'LIENTE,'#13#10'    orc.DATA,'#13#10'    orc.OBS,'#13#10'    orc.TOTAL,'#13#10'    orc.IT' +
      'ENS,'#13#10'    orc.STATUS,'#13#10'    orc.CONCLUIDO'#13#10'from ORCAMENTO orc'#13#10'le' +
      'ft join CLIENTES cli on (orc.Codcliente = cli.Codcliente)'#13#10'where' +
      ' orc.CODIGO = :PCODIGO'
    Params = <
      item
        DataType = ftInteger
        Name = 'PCODIGO'
        ParamType = ptInput
      end>
    object sqldPadraoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sqldPadraoCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
    end
    object sqldPadraoNOMECLIENTE: TStringField
      FieldName = 'NOMECLIENTE'
      Size = 80
    end
    object sqldPadraoDATA: TDateField
      FieldName = 'DATA'
    end
    object sqldPadraoOBS: TStringField
      FieldName = 'OBS'
      Size = 250
    end
    object sqldPadraoTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 15
    end
    object sqldPadraoITENS: TIntegerField
      FieldName = 'ITENS'
    end
    object sqldPadraoSTATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoCONCLUIDO: TStringField
      FieldName = 'CONCLUIDO'
      FixedChar = True
      Size = 1
    end
  end
  inherited cdsPadrao: TMemDataset
    Params = <
      item
        DataType = ftInteger
        Name = 'PCODIGO'
        ParamType = ptInput
      end>
    object cdsPadraoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsPadraoCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
    end
    object cdsPadraoNOMECLIENTE: TStringField
      FieldName = 'NOMECLIENTE'
      Size = 80
    end
    object cdsPadraoDATA: TDateField
      FieldName = 'DATA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoOBS: TStringField
      FieldName = 'OBS'
      Size = 250
    end
    object cdsPadraoTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
    object cdsPadraoITENS: TIntegerField
      FieldName = 'ITENS'
    end
    object cdsPadraoSTATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoCONCLUIDO: TStringField
      FieldName = 'CONCLUIDO'
      FixedChar = True
      Size = 1
    end
    object cdsPadraosqldDetOrcam: TDataSetField
      FieldName = 'sqldDetOrcam'
    end
  end
  inherited dsPadrao: TDataSource
    Left = 111
  end
  object dsLink: TDataSource
    DataSet = sqldPadrao
    Left = 46
    Top = 40
  end
  object sqldDetOrcam: TSQLDataSet
    CommandText = 
      'select'#13#10'    iorc.CODIGO,'#13#10'    iorc.CODPRODUTO,'#13#10'    prod.Descric' +
      'ao NOMEPRODUTO,'#13#10'    iorc.QTDE,'#13#10'    iorc.CUSTO,'#13#10'    iorc.VENDA' +
      ','#13#10'    iorc.DESCTO,'#13#10'    iorc.VALORDESCTO,'#13#10'    iorc.TOTAL '#13#10'fro' +
      'm ITEMORCAMENTO iorc'#13#10'left join PRODUTOS prod on (iorc.Codprodut' +
      'o = prod.Idproduto)'#13#10'where iorc.CODIGO = :CODIGO'
    DataSource = dsLink
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
        Size = 4
      end>
    Left = 16
    Top = 40
    object sqldDetOrcamCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sqldDetOrcamCODPRODUTO: TIntegerField
      FieldName = 'CODPRODUTO'
    end
    object sqldDetOrcamNOMEPRODUTO: TStringField
      FieldName = 'NOMEPRODUTO'
      Size = 80
    end
    object sqldDetOrcamQTDE: TIntegerField
      FieldName = 'QTDE'
    end
    object sqldDetOrcamCUSTO: TFMTBCDField
      FieldName = 'CUSTO'
      Precision = 15
    end
    object sqldDetOrcamVENDA: TFMTBCDField
      FieldName = 'VENDA'
      Precision = 15
    end
    object sqldDetOrcamDESCTO: TFMTBCDField
      FieldName = 'DESCTO'
      Precision = 15
    end
    object sqldDetOrcamVALORDESCTO: TFMTBCDField
      FieldName = 'VALORDESCTO'
      Precision = 15
    end
    object sqldDetOrcamTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 15
    end
  end
  object cdsDetOrcam: TMemDataset
    Aggregates = <>
    DataSetField = cdsPadraosqldDetOrcam
    Params = <>
    Left = 78
    Top = 40
    object cdsDetOrcamCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsDetOrcamCODPRODUTO: TIntegerField
      FieldName = 'CODPRODUTO'
    end
    object cdsDetOrcamNOMEPRODUTO: TStringField
      FieldName = 'NOMEPRODUTO'
      Size = 80
    end
    object cdsDetOrcamQTDE: TIntegerField
      FieldName = 'QTDE'
    end
    object cdsDetOrcamCUSTO: TFMTBCDField
      FieldName = 'CUSTO'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
    object cdsDetOrcamVENDA: TFMTBCDField
      FieldName = 'VENDA'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
    object cdsDetOrcamDESCTO: TFMTBCDField
      FieldName = 'DESCTO'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
    object cdsDetOrcamVALORDESCTO: TFMTBCDField
      FieldName = 'VALORDESCTO'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
    object cdsDetOrcamTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
  end
  object dsDetOrcam: TDataSource
    DataSet = cdsDetOrcam
    Left = 110
    Top = 40
  end
end
