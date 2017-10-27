object frmPrevNotaVenda: TfrmPrevNotaVenda
  Left = 2
  Top = 1
  ClientHeight = 530
  ClientWidth = 824
  Caption = 'frmPrevNotaVenda'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Name = 'MS Sans Serif'
  PixelsPerInch = 96
  TextHeight = 13
  object rlrNotaVenda: TRLReport
    Left = 0
    Top = 0
    Width = 816
    Height = 1056
    DataSource = dsVenda
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Courier New'
    Font.Style = []
    PageSetup.PaperSize = fpLetter
    PreviewOptions.ShowModal = True
    RealBounds.UsedUnit = buMilimeters
    BeforePrint = rlrNotaVendaBeforePrint
    object rlbCabecalho: TRLBand
      Left = 38
      Top = 38
      Width = 740
      Height = 120
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object rlblEmpresa: TRLLabel
        Left = 4
        Top = 6
        Width = 732
        Height = 16
        AutoSize = False
        Caption = 'Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rlblCidadeEstado: TRLLabel
        Left = 4
        Top = 39
        Width = 732
        Height = 14
        AutoSize = False
        Caption = 'CidadeEstado'
      end
      object rlblFoneEmail: TRLLabel
        Left = 4
        Top = 54
        Width = 732
        Height = 14
        AutoSize = False
        Caption = 'FoneEmail'
      end
      object rlblTituloPedido: TRLLabel
        Left = 4
        Top = 78
        Width = 732
        Height = 14
        Alignment = taCenter
        AutoSize = False
        Caption = 'TituloPedido'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rlsyData: TRLSystemInfo
        Left = 4
        Top = 102
        Width = 49
        Height = 15
        Text = ''
      end
      object rlsyPageNro: TRLSystemInfo
        Left = 589
        Top = 102
        Width = 147
        Height = 15
        Alignment = taRightJustify
        Info = itPageNumber
        Text = 'P'#225'gina: '
      end
      object rllbCnpjCpf_RgIe: TRLLabel
        Left = 4
        Top = 23
        Width = 732
        Height = 15
        AutoSize = False
      end
    end
    object rlbDadosCliente: TRLBand
      Left = 38
      Top = 158
      Width = 740
      Height = 87
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object rlblCliente: TRLLabel
        Left = 4
        Top = 3
        Width = 70
        Height = 15
        Caption = 'Cliente.:'
      end
      object rlblEndereco: TRLLabel
        Left = 4
        Top = 19
        Width = 70
        Height = 15
        Caption = 'Endere'#231'o:'
      end
      object rlblBairro: TRLLabel
        Left = 4
        Top = 35
        Width = 70
        Height = 15
        Caption = 'Bairro..:'
      end
      object rlblCidadeEstadoCliente: TRLLabel
        Left = 4
        Top = 52
        Width = 70
        Height = 15
        Caption = 'Cidade..:'
      end
      object rlblVendedor: TRLLabel
        Left = 4
        Top = 68
        Width = 70
        Height = 15
        Caption = 'Vendedor:'
      end
      object rlblCpfCnpj: TRLLabel
        Left = 484
        Top = 3
        Width = 70
        Height = 15
        Caption = 'Cpf/Cnpj:'
      end
      object rlblRgIe: TRLLabel
        Left = 484
        Top = 19
        Width = 70
        Height = 15
        Caption = 'Rg/Ie...:'
      end
      object rlblCep: TRLLabel
        Left = 484
        Top = 35
        Width = 70
        Height = 15
        Caption = 'Cep.....:'
      end
      object rlblFone: TRLLabel
        Left = 484
        Top = 52
        Width = 70
        Height = 15
        Caption = 'Telefone:'
      end
      object rlblDataVenda: TRLLabel
        Left = 484
        Top = 68
        Width = 70
        Height = 15
        Caption = 'Data....:'
      end
      object rldbtCliente: TRLDBText
        Left = 86
        Top = 5
        Width = 396
        Height = 14
        AutoSize = False
        DataField = 'CLIENTE'
        DataSource = dsVenda
        Text = ''
      end
      object rldbtEndereco: TRLDBText
        Left = 86
        Top = 21
        Width = 396
        Height = 14
        AutoSize = False
        DataField = 'ENDERECO'
        DataSource = dsVenda
        Text = ''
      end
      object rldbtBairro: TRLDBText
        Left = 86
        Top = 37
        Width = 396
        Height = 14
        AutoSize = False
        DataField = 'BAIRRO'
        DataSource = dsVenda
        Text = ''
      end
      object rldbtCidade: TRLDBText
        Left = 86
        Top = 54
        Width = 396
        Height = 14
        AutoSize = False
        DataField = 'CIDADE'
        DataSource = dsVenda
        Text = ''
      end
      object rldbtVendedor: TRLDBText
        Left = 86
        Top = 70
        Width = 396
        Height = 14
        AutoSize = False
        DataField = 'VENDEDOR'
        DataSource = dsVenda
        Text = ''
      end
      object rldbtCpjCnpj: TRLDBText
        Left = 566
        Top = 5
        Width = 170
        Height = 14
        AutoSize = False
        DataField = 'CPF_CNPJ'
        DataSource = dsVenda
        Text = ''
      end
      object rldbtRgIe: TRLDBText
        Left = 566
        Top = 21
        Width = 170
        Height = 14
        AutoSize = False
        DataField = 'RG_IE'
        DataSource = dsVenda
        Text = ''
      end
      object rldbtCep: TRLDBText
        Left = 566
        Top = 37
        Width = 170
        Height = 14
        AutoSize = False
        DataField = 'CEP'
        DataSource = dsVenda
        Text = ''
      end
      object rldbtFone: TRLDBText
        Left = 566
        Top = 54
        Width = 170
        Height = 14
        AutoSize = False
        DataField = 'TELEFONE'
        DataSource = dsVenda
        Text = ''
      end
      object rldbtDataVenda: TRLDBText
        Left = 566
        Top = 70
        Width = 170
        Height = 14
        AutoSize = False
        DataField = 'DATA'
        DataSource = dsVenda
        Text = ''
      end
    end
    object rlsdProdutoVenda: TRLSubDetail
      Left = 38
      Top = 245
      Width = 740
      Height = 90
      DataSource = dsItemVenda
      object rlbColuna: TRLBand
        Left = 0
        Top = 0
        Width = 740
        Height = 17
        BandType = btColumnHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object rlblCodigo: TRLLabel
          Left = 4
          Top = 1
          Width = 49
          Height = 15
          Caption = 'C'#243'digo'
        end
        object rlblDescricao: TRLLabel
          Left = 88
          Top = 1
          Width = 70
          Height = 15
          Caption = 'Descri'#231#227'o'
        end
        object rlblQtde: TRLLabel
          Left = 416
          Top = 1
          Width = 35
          Height = 15
          Caption = 'Qtde'
        end
        object rlblPreco: TRLLabel
          Left = 480
          Top = 1
          Width = 42
          Height = 15
          Caption = 'Pre'#231'o'
        end
        object rlblDescto: TRLLabel
          Left = 572
          Top = 1
          Width = 63
          Height = 15
          Caption = 'Desconto'
        end
        object rlblTotal: TRLLabel
          Left = 688
          Top = 1
          Width = 42
          Height = 15
          Caption = 'Total'
        end
      end
      object rlbDetalhe: TRLBand
        Left = 0
        Top = 17
        Width = 740
        Height = 18
        object rldbtCodigo: TRLDBText
          Left = 4
          Top = 2
          Width = 77
          Height = 15
          DataField = 'CODPRODUTO'
          DataSource = dsItemVenda
          Text = ''
        end
        object rldbtDescricao: TRLDBText
          Left = 88
          Top = 2
          Width = 297
          Height = 14
          AutoSize = False
          DataField = 'PRODUTO'
          DataSource = dsItemVenda
          Text = ''
        end
        object rldbtQtde: TRLDBText
          Left = 428
          Top = 2
          Width = 28
          Height = 15
          Alignment = taRightJustify
          DataField = 'QTD'
          DataSource = dsItemVenda
          Text = ''
        end
        object rldbtPreco: TRLDBText
          Left = 486
          Top = 2
          Width = 42
          Height = 15
          Alignment = taRightJustify
          DataField = 'VENDA'
          DataSource = dsItemVenda
          Text = ''
        end
        object rldbtDescto: TRLDBText
          Left = 560
          Top = 2
          Width = 84
          Height = 15
          Alignment = taRightJustify
          DataField = 'VALORDESCTO'
          DataSource = dsItemVenda
          Text = ''
        end
        object rldbtTotal: TRLDBText
          Left = 694
          Top = 2
          Width = 42
          Height = 15
          Alignment = taRightJustify
          DataField = 'TOTAL'
          DataSource = dsItemVenda
          Text = ''
        end
      end
      object rlbTotais: TRLBand
        Left = 0
        Top = 35
        Width = 740
        Height = 53
        BandType = btSummary
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = False
        object rlblTotalVenda: TRLLabel
          Left = 560
          Top = 8
          Width = 49
          Height = 15
          Caption = 'Total:'
        end
        object rldbtTotalVenda: TRLDBText
          Left = 618
          Top = 8
          Width = 42
          Height = 15
          DataField = 'TOTAL'
          DataSource = dsVenda
          Text = ''
        end
        object rlblAssCliente: TRLLabel
          Left = 4
          Top = 32
          Width = 262
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = True
          Borders.DrawRight = False
          Borders.DrawBottom = False
          Caption = 'Assinatura'
        end
      end
    end
  end
  object sqldVenda: TSQLDataSet
    CommandText = 
      'select'#13#10'  ven.CODIGO,'#13#10'  ven.CODCLIENTE,'#13#10'  cli.NOME as CLIENTE,' +
      #13#10'  cli.ENDERECO,'#13#10'  cli.BAIRRO,'#13#10'  cid.DESCRICAO as CIDADE,'#13#10'  ' +
      'cli.CPF_CNPJ,'#13#10'  cli.RG_IE,'#13#10'  cli.CEP,'#13#10'  cli.TELEFONE,'#13#10'  vd.V' +
      'ENDEDOR,'#13#10'  ven.DATA,'#13#10'  ven.OBS,'#13#10'  ven.TOTALDESCTO,'#13#10'  ven.TOT' +
      'AL,'#13#10'  ven.CONCLUIDA,'#13#10'  ven.BAIXADO'#13#10'from VENDA ven'#13#10'left join ' +
      'CLIENTES cli on (cli.Codcliente = ven.Codcliente)'#13#10'left join VEN' +
      'DEDOR vd on (vd.IDVENDEDOR = ven.IDVENDEDOR)'#13#10'left join CIDADES ' +
      'cid on (cid.CODCIDADE = cli.CODCIDADE)'#13#10'where ven.CODIGO = :IDVE' +
      'NDA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'IDVENDA'
        ParamType = ptInput
      end>
    Left = 24
    Top = 360
    object sqldVendaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sqldVendaCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
    end
    object sqldVendaCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Size = 80
    end
    object sqldVendaENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 80
    end
    object sqldVendaBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 80
    end
    object sqldVendaCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 80
    end
    object sqldVendaCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
    end
    object sqldVendaRG_IE: TStringField
      FieldName = 'RG_IE'
    end
    object sqldVendaCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object sqldVendaTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
    object sqldVendaVENDEDOR: TStringField
      FieldName = 'VENDEDOR'
      Size = 80
    end
    object sqldVendaDATA: TDateField
      FieldName = 'DATA'
    end
    object sqldVendaOBS: TStringField
      FieldName = 'OBS'
      Size = 250
    end
    object sqldVendaTOTALDESCTO: TFMTBCDField
      FieldName = 'TOTALDESCTO'
      Precision = 15
    end
    object sqldVendaTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 15
    end
    object sqldVendaCONCLUIDA: TStringField
      FieldName = 'CONCLUIDA'
      FixedChar = True
      Size = 1
    end
    object sqldVendaBAIXADO: TStringField
      FieldName = 'BAIXADO'
      FixedChar = True
      Size = 1
    end
  end
  object dspVenda: TDataSetProvider
    DataSet = sqldVenda
    Options = [poPropogateChanges, poUseQuoteChar]
    Left = 56
    Top = 360
  end
  object cdsVenda: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'IDVENDA'
        ParamType = ptInput
      end>
    ProviderName = 'dspVenda'
    Left = 88
    Top = 360
    object cdsVendaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsVendaCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
    end
    object cdsVendaCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Size = 80
    end
    object cdsVendaENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 80
    end
    object cdsVendaBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 80
    end
    object cdsVendaCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 80
    end
    object cdsVendaCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
    end
    object cdsVendaRG_IE: TStringField
      FieldName = 'RG_IE'
    end
    object cdsVendaCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object cdsVendaTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
    object cdsVendaVENDEDOR: TStringField
      FieldName = 'VENDEDOR'
      Size = 80
    end
    object cdsVendaDATA: TDateField
      FieldName = 'DATA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsVendaOBS: TStringField
      FieldName = 'OBS'
      Size = 250
    end
    object cdsVendaTOTALDESCTO: TFMTBCDField
      FieldName = 'TOTALDESCTO'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
    object cdsVendaTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
    object cdsVendaCONCLUIDA: TStringField
      FieldName = 'CONCLUIDA'
      FixedChar = True
      Size = 1
    end
    object cdsVendaBAIXADO: TStringField
      FieldName = 'BAIXADO'
      FixedChar = True
      Size = 1
    end
    object cdsVendasqldItemVenda: TDataSetField
      FieldName = 'sqldItemVenda'
    end
  end
  object dsVenda: TDataSource
    DataSet = cdsVenda
    Left = 120
    Top = 360
  end
  object sqldItemVenda: TSQLDataSet
    CommandText = 
      'select'#13#10'  itv.CODPRODUTO,'#13#10'  pro.DESCRICAO as PRODUTO,'#13#10'  itv.QT' +
      'D,'#13#10'  itv.VENDA,'#13#10'  itv.VALORDESCTO,'#13#10'  itv.TOTAL '#13#10'from ITEMVEN' +
      'DA itv'#13#10'left join PRODUTOS pro on (pro.IDPRODUTO = itv.CODPRODUT' +
      'O)'#13#10'where itv.CODIGO = :CODIGO'
    DataSource = dsLigaVenda
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
        Size = 4
      end>
    Left = 24
    Top = 392
    object sqldItemVendaCODPRODUTO: TIntegerField
      FieldName = 'CODPRODUTO'
    end
    object sqldItemVendaPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Size = 80
    end
    object sqldItemVendaQTD: TIntegerField
      FieldName = 'QTD'
    end
    object sqldItemVendaVENDA: TFMTBCDField
      FieldName = 'VENDA'
      Precision = 15
    end
    object sqldItemVendaVALORDESCTO: TFMTBCDField
      FieldName = 'VALORDESCTO'
      Precision = 15
    end
    object sqldItemVendaTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 15
    end
  end
  object dsLigaVenda: TDataSource
    DataSet = sqldVenda
    Left = 56
    Top = 392
  end
  object cdsItemVenda: TClientDataSet
    Aggregates = <>
    DataSetField = cdsVendasqldItemVenda
    Params = <>
    Left = 88
    Top = 392
    object cdsItemVendaCODPRODUTO: TIntegerField
      FieldName = 'CODPRODUTO'
    end
    object cdsItemVendaPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Size = 80
    end
    object cdsItemVendaQTD: TIntegerField
      FieldName = 'QTD'
    end
    object cdsItemVendaVENDA: TFMTBCDField
      FieldName = 'VENDA'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
    object cdsItemVendaVALORDESCTO: TFMTBCDField
      FieldName = 'VALORDESCTO'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
    object cdsItemVendaTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
  end
  object dsItemVenda: TDataSource
    DataSet = cdsItemVenda
    Left = 120
    Top = 392
  end
end
