inherited frmRelatorioBobinaVenda: TfrmRelatorioBobinaVenda
  Left = 211
  Top = 116
  Caption = 'frmRelatorioBobinaVenda'
  ClientHeight = 445
  ClientWidth = 361
  OldCreateOrder = True
  ExplicitWidth = 377
  ExplicitHeight = 484
  PixelsPerInch = 96
  TextHeight = 13
  object lbCopias: TLabel
    Left = 304
    Top = 8
    Width = 39
    Height = 13
    Caption = 'Copias'
  end
  object edtImpressora: TLabeledEdit
    Left = 8
    Top = 24
    Width = 289
    Height = 21
    EditLabel.Width = 66
    EditLabel.Height = 13
    EditLabel.Caption = 'Impressora'
    TabOrder = 0
  end
  object seCopias: TSpinEdit
    Left = 304
    Top = 24
    Width = 57
    Height = 22
    MaxValue = 1000
    MinValue = 1
    TabOrder = 1
    Value = 1
  end
  object btnCancelar: TBitBtn
    Left = 280
    Top = 416
    Width = 81
    Height = 25
    Caption = 'Cancelar'
    Glyph.Data = {
      36060000424D3606000000000000360000002800000020000000100000000100
      18000000000000060000C40E0000C40E00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF00009A00009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00009A0000
      9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
      00009A174AFD103BF400009AFF00FFFF00FFFF00FFFF00FF00009A002CF80030
      FC00009AFF00FFFF00FFFF00FFFF00FF6B6B6BA8A8A8A0A0A06B6B6BFF00FFFF
      00FFFF00FFFF00FF6B6B6B9A9A9A9C9C9C6B6B6BFF00FFFF00FFFF00FFFF00FF
      00009A1A47F81A4CFF123BF100009AFF00FFFF00FF00009A012DF60132FF002A
      F300009AFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7AAAAAA9F9F9F6B6B6BFF
      00FFFF00FF6B6B6B9999999E9E9E9797976B6B6BFF00FFFF00FFFF00FFFF00FF
      FF00FF00009A1C47F61B4DFF143EF400009A00009A002DF80134FF032BF20000
      9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7ABABABA2A2A26B
      6B6B6B6B6B9A9A9A9E9E9E9898986B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF00009A1D48F61D50FF103DFB0431FE0132FF002CF600009AFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7ACACACA3
      A3A39F9F9F9E9E9E9999996B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF00009A1A48F91342FF0C3CFF0733F600009AFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7A7
      A7A7A3A3A39C9C9C6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF00009A214EFC1D4BFF1847FF1743F600009AFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BACACACAC
      ACACA9A9A9A4A4A46B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF00009A2E5BF92C5FFF224DF8204BF82355FF1B46F600009AFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BB1B1B1B3B3B3AB
      ABABAAAAAAAFAFAFA6A6A66B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF00009A3664FA386BFF2D59F400009A00009A224CF42558FF1D49F60000
      9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BB6B6B6B9B9B9AEAEAE6B
      6B6B6B6B6BA9A9A9B0B0B0A7A7A76B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
      00009A4071FA4274FF325DF100009AFF00FFFF00FF00009A224DF1275AFF204C
      F800009AFF00FFFF00FFFF00FFFF00FF6B6B6BBBBBBBBEBEBEAFAFAF6B6B6BFF
      00FFFF00FF6B6B6BA7A7A7B1B1B1AAAAAA6B6B6BFF00FFFF00FFFF00FFFF00FF
      00009A497AFC3B66F300009AFF00FFFF00FFFF00FFFF00FF00009A2550F42655
      FA00009AFF00FFFF00FFFF00FFFF00FF6B6B6BC0C0C0B5B5B56B6B6BFF00FFFF
      00FFFF00FFFF00FF6B6B6BAAAAAAAEAEAE6B6B6BFF00FFFF00FFFF00FFFF00FF
      FF00FF00009A00009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00009A0000
      9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    NumGlyphs = 2
    TabOrder = 2
    OnClick = btnCancelarClick
  end
  object btnOk: TBitBtn
    Left = 184
    Top = 416
    Width = 89
    Height = 25
    Caption = 'Imprimir'
    Glyph.Data = {
      36060000424D3606000000000000360000002800000020000000100000000100
      18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FF6C6A6A6C6A6AFF00FFFF00FF6C6A6A6C6A6AFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF989898989898FF00FFFF
      00FF989898989898FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF6C6A6AAAA7A7A19F9F6C6A6A6C6A6A6C6A6AE5E3E36C6A6A6C6A6A6C6A
      6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF989898BFBFBFBABABA98989898
      9898989898E1E1E1989898989898989898FF00FFFF00FFFF00FFFF00FFFF00FF
      6C6A6ADAD9D9A19F9FA19F9FA19F9F3736363535356C6D6DBFBFBFE1E2E2B7B6
      B66C6A6A6C6A6A6C6A6AFF00FFFF00FF989898DBDBDBBABABABABABABABABA72
      7272717171999999CCCCCCDFDFDFC7C7C7989898989898989898FF00FF6C6A6A
      D4D3D3CACACA8E8C8C8E8C8C8E8C8C3C3B3B0A090A0707070B0B0B0707077A7A
      7ABBBBBB6C6A6AFF00FFFF00FF989898D7D7D7D3D3D3AEAEAEAEAEAEAEAEAE76
      7676474747454545494949454545A2A2A2CACACA989898FF00FF6C6A6ACACACA
      CACACA8E8C8CD7D4D4CECBCBBFBCBCB1AFAFA3A0A08886865E5B5C0707070909
      090808086C6A6A767373989898D3D3D3D3D3D3AEAEAED9D9D9D3D3D3CBCBCBC3
      C3C3BABABAAAAAAA8E8E8E4545454747474646469898989D9D9D6C6A6ACACACA
      8E8C8CEFEEEEFFFEFEFBFAFAE3E0E1DEDEDEDEDDDDCFCECEBDBCBCADABAB8B89
      895856567A7878757373989898D3D3D3AEAEAEE6E6E6EFEFEFEDEDEDDFDFDFDE
      DEDEDDDDDDD4D4D4CACACAC1C1C1ACACAC8A8A8AA1A1A19D9D9D6C6A6A8E8C8C
      FFFFFFFEFCFCFAFAFAD5D4D5989193A09899B2ABACC4C0C1D7D7D7D8D8D8C7C6
      C6B7B6B6918F8F6C6969989898AEAEAEEFEFEFEFEFEFEDEDEDD8D8D8B3B3B3B7
      B7B7C2C2C2CDCDCDDADADADBDBDBD0D0D0C7C7C7AFAFAF979797FF00FF6C6A6A
      6C6A6AEDEBEBB1A6A77A6F728A83889692959690919D97989A93959E9899BBBA
      BAD1D1D1C2C2C26C6A6AFF00FF989898989898E6E6E6C1C1C19E9E9EAAAAAAB2
      B2B2B1B1B1B6B6B6B4B4B4B7B7B7C9C9C9D7D7D7CECECE989898FF00FFFF00FF
      FF00FF6C6A6ABB897FA7876D8B6F647D67606F62657973798F8B8EA9A3A4CBCA
      CAC1C1C16C6A6AFF00FFFF00FFFF00FFFF00FF989898A7A7A79999998A8A8A9A
      9A9A9696969F9F9FAEAEAEBDBDBDD3D3D3CDCDCD989898FF00FFFF00FFFF00FF
      FF00FFFF00FFBD8281FFE3B4FFD39FE9B281C99973BA916CBD8281807D7E6C6A
      6A6C6A6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA9A9A9D3D3D3CCCCCCB8
      B8B8A7A7A79F9F9FA9A9A9A5A5A5989898989898FF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFBD8281FFE0B8FFD3A7FFD09DFFCE90FFC688BD8281FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA9A9A9D5D5D5CFCFCFCB
      CBCBC6C6C6C3C3C3A9A9A9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFC08683FFE7CFFFE0C0FFD9B2FFD3A5FFD099BD8281FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFABABABDDDDDDD8D8D8D3D3D3CE
      CECECACACAA9A9A9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFBD8281FEEBD8FFE6CCFFDEBDFFD8B1FED3A4BD8281FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA9A9A9E0E0E0DCDCDCD7D7D7D3
      D3D3CDCDCDA9A9A9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      BD8281FFFFF2FFFFF2FFEBD8FFE5CAFFE1BDF3C7A7BD8281FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFA9A9A9EAEAEAEAEAEAE1E1E1DCDCDCD7
      D7D7CBCBCBA9A9A9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      BD8281BD8281BD8281FBEFE2FBE3CFFBDDC2BD8281FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFA9A9A9A9A9A9A9A9A9E3E3E3DCDCDCD8
      D8D8A9A9A9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFBD8281BD8281BD8281FF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA9A9A9A9A9A9A9
      A9A9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    NumGlyphs = 2
    TabOrder = 3
    OnClick = btnOkClick
  end
  object mmoVenda: TMemo
    Left = 8
    Top = 56
    Width = 353
    Height = 353
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 4
  end
  object sqlVendas: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select'
      '  ven.CODIGO,'
      '  ven.CODCLIENTE,'
      '  cli.Nome CLIENTE,'
      '  ven.DATA,'
      '  ven.OBS,'
      '  ven.TOTALDESCTO,'
      '  ven.TOTAL,'
      '  ven.CONCLUIDA,'
      '  ven.BAIXADO'
      'from VENDA ven'
      'left join CLIENTES cli on (cli.Codcliente = ven.Codcliente)')
    SQLConnection = DmPrincipal.Conexao
    Left = 19
    Top = 67
    object sqlVendasCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sqlVendasCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
    end
    object sqlVendasCLIENTE: TStringField
      FieldName = 'CLIENTE'
      ProviderFlags = []
      Size = 80
    end
    object sqlVendasDATA: TDateField
      FieldName = 'DATA'
    end
    object sqlVendasOBS: TStringField
      FieldName = 'OBS'
      Size = 250
    end
    object sqlVendasTOTALDESCTO: TFMTBCDField
      FieldName = 'TOTALDESCTO'
      Precision = 15
    end
    object sqlVendasTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 15
    end
    object sqlVendasCONCLUIDA: TStringField
      FieldName = 'CONCLUIDA'
      FixedChar = True
      Size = 1
    end
    object sqlVendasBAIXADO: TStringField
      FieldName = 'BAIXADO'
      FixedChar = True
      Size = 1
    end
  end
  object sqlItens: TSQLQuery
    DataSource = dsLnkVenda
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'select'
      '  itv.CODIGO,'
      '  itv.CODPRODUTO,'
      '  pro.Descricao PRODUTO,'
      '  itv.QTD,'
      '  itv.CUSTO,'
      '  itv.VENDA,'
      '  itv.DESCTO,'
      '  itv.VALORDESCTO,'
      '  itv.TOTAL'
      'from ITEMVENDA itv'
      'left join PRODUTOS pro on (itv.Codproduto = pro.Idproduto)'
      'where itv.Codigo = :CODIGO')
    SQLConnection = DmPrincipal.Conexao
    Left = 19
    Top = 102
    object sqlItensCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sqlItensCODPRODUTO: TIntegerField
      FieldName = 'CODPRODUTO'
    end
    object sqlItensPRODUTO: TStringField
      FieldName = 'PRODUTO'
      ProviderFlags = []
      Size = 80
    end
    object sqlItensQTD: TIntegerField
      FieldName = 'QTD'
    end
    object sqlItensCUSTO: TFMTBCDField
      FieldName = 'CUSTO'
      Precision = 15
    end
    object sqlItensVENDA: TFMTBCDField
      FieldName = 'VENDA'
      Precision = 15
    end
    object sqlItensDESCTO: TFMTBCDField
      FieldName = 'DESCTO'
      Precision = 15
    end
    object sqlItensVALORDESCTO: TFMTBCDField
      FieldName = 'VALORDESCTO'
      Precision = 15
    end
    object sqlItensTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 15
    end
  end
  object dtVendas: TDataSetProvider
    DataSet = sqlVendas
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowCommandText]
    Left = 48
    Top = 67
  end
  object dsLnkVenda: TDataSource
    DataSet = sqlVendas
    Left = 50
    Top = 102
  end
  object cdsVendas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dtVendas'
    Left = 80
    Top = 67
    object cdsVendasCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsVendasCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
    end
    object cdsVendasCLIENTE: TStringField
      FieldName = 'CLIENTE'
      ProviderFlags = []
      Size = 80
    end
    object cdsVendasDATA: TDateField
      FieldName = 'DATA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsVendasOBS: TStringField
      FieldName = 'OBS'
      Size = 250
    end
    object cdsVendasTOTALDESCTO: TFMTBCDField
      FieldName = 'TOTALDESCTO'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
    object cdsVendasTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
    object cdsVendasCONCLUIDA: TStringField
      FieldName = 'CONCLUIDA'
      FixedChar = True
      Size = 1
    end
    object cdsVendasBAIXADO: TStringField
      FieldName = 'BAIXADO'
      FixedChar = True
      Size = 1
    end
    object cdsVendassqlItens: TDataSetField
      FieldName = 'sqlItens'
    end
  end
  object cdsItens: TClientDataSet
    Aggregates = <>
    DataSetField = cdsVendassqlItens
    Params = <>
    Left = 80
    Top = 102
    object cdsItensCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsItensCODPRODUTO: TIntegerField
      FieldName = 'CODPRODUTO'
    end
    object cdsItensPRODUTO: TStringField
      FieldName = 'PRODUTO'
      ProviderFlags = []
      Size = 80
    end
    object cdsItensQTD: TIntegerField
      FieldName = 'QTD'
    end
    object cdsItensCUSTO: TFMTBCDField
      FieldName = 'CUSTO'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
    object cdsItensVENDA: TFMTBCDField
      FieldName = 'VENDA'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
    object cdsItensDESCTO: TFMTBCDField
      FieldName = 'DESCTO'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
    object cdsItensVALORDESCTO: TFMTBCDField
      FieldName = 'VALORDESCTO'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
    object cdsItensTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
  end
  object sqldPagamento: TSQLDataSet
    CommandText = 
      'select '#13#10'  FORMARECTO, '#13#10'  VALORRECDO '#13#10'from RECTOVENDA'#13#10'where I' +
      'DVENDA = :VENDA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'VENDA'
        ParamType = ptInput
      end>
    SQLConnection = DmPrincipal.Conexao
    Left = 72
    Top = 184
    object sqldPagamentoFORMARECTO: TStringField
      FieldName = 'FORMARECTO'
    end
    object sqldPagamentoVALORRECDO: TFMTBCDField
      FieldName = 'VALORRECDO'
      Precision = 15
    end
  end
  object dspPagamento: TDataSetProvider
    DataSet = sqldPagamento
    Left = 104
    Top = 184
  end
  object cdspagamento: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'VENDA'
        ParamType = ptInput
      end>
    ProviderName = 'dspPagamento'
    Left = 136
    Top = 184
    object cdspagamentoFORMARECTO: TStringField
      FieldName = 'FORMARECTO'
    end
    object cdspagamentoVALORRECDO: TFMTBCDField
      FieldName = 'VALORRECDO'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
  end
end