inherited frmPrevNotaVendaMatric: TfrmPrevNotaVendaMatric
  Left = 235
  Top = 185
  ClientHeight = 227
  ClientWidth = 310
  Caption = 'frmPrevNotaVendaMatric'
  OldCreateOrder = True
  ExplicitWidth = 326
  ExplicitHeight = 266
  PixelsPerInch = 96
  TextHeight = 13
  object sqldCabecalho: TSQLDataSet
    CommandText = 
      'select * from CONFIGNOTA'#13#10'where (TIPO = '#39'C'#39') or '#13#10'((TIPO = '#39'T'#39' )' +
      ' and (REFERENCIA = '#39'Cabe'#231'alho'#39'))'#13#10'order by LINHA, COLUNA'
    MaxBlobSize = -1
    Params = <>
    Left = 48
    Top = 16
    object sqldCabecalhoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sqldCabecalhoCAMPO: TStringField
      FieldName = 'CAMPO'
      Size = 80
    end
    object sqldCabecalhoLAYOUT: TStringField
      FieldName = 'LAYOUT'
      Size = 80
    end
    object sqldCabecalhoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 80
    end
    object sqldCabecalhoTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object sqldCabecalhoLINHA: TIntegerField
      FieldName = 'LINHA'
    end
    object sqldCabecalhoCOLUNA: TIntegerField
      FieldName = 'COLUNA'
    end
    object sqldCabecalhoIMPRIMIR: TStringField
      FieldName = 'IMPRIMIR'
      FixedChar = True
      Size = 1
    end
  end
  object sqldCabItens: TSQLDataSet
    CommandText = 
      'select *  from CONFIGNOTA'#13#10'where ((TIPO = '#39'T'#39') and (REFERENCIA =' +
      ' '#39'Itens da nota'#39'))'#13#10'order by LINHA, COLUNA'
    MaxBlobSize = -1
    Params = <>
    Left = 48
    Top = 64
    object sqldCabItensCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sqldCabItensCAMPO: TStringField
      FieldName = 'CAMPO'
      Size = 80
    end
    object sqldCabItensLAYOUT: TStringField
      FieldName = 'LAYOUT'
      Size = 80
    end
    object sqldCabItensREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 80
    end
    object sqldCabItensTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object sqldCabItensLINHA: TIntegerField
      FieldName = 'LINHA'
    end
    object sqldCabItensCOLUNA: TIntegerField
      FieldName = 'COLUNA'
    end
    object sqldCabItensIMPRIMIR: TStringField
      FieldName = 'IMPRIMIR'
      FixedChar = True
      Size = 1
    end
  end
  object sqldRodape: TSQLDataSet
    CommandText = 
      'select *  from CONFIGNOTA'#13#10'where (TIPO = '#39'R'#39')'#13#10'or ((TIPO = '#39'T'#39') ' +
      'and (REFERENCIA = '#39'Rodap'#233#39'))'#13#10'order by LINHA, COLUNA'
    MaxBlobSize = -1
    Params = <>
    Left = 40
    Top = 176
    object sqldRodapeCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sqldRodapeCAMPO: TStringField
      FieldName = 'CAMPO'
      Size = 80
    end
    object sqldRodapeLAYOUT: TStringField
      FieldName = 'LAYOUT'
      Size = 80
    end
    object sqldRodapeREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 80
    end
    object sqldRodapeTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object sqldRodapeLINHA: TIntegerField
      FieldName = 'LINHA'
    end
    object sqldRodapeCOLUNA: TIntegerField
      FieldName = 'COLUNA'
    end
    object sqldRodapeIMPRIMIR: TStringField
      FieldName = 'IMPRIMIR'
      FixedChar = True
      Size = 1
    end
  end
  object sqldVenda: TSQLDataSet
    CommandText = 'select * from VIEWVENDA'#13#10'where CODIGO = :IDVENDA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'IDVENDA'
        ParamType = ptInput
      end>
    Left = 168
    Top = 16
    object sqldVendaCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object sqldVendaDATA: TDateField
      FieldName = 'DATA'
    end
    object sqldVendaCODVENDEDOR: TIntegerField
      FieldName = 'CODVENDEDOR'
    end
    object sqldVendaVENDEDOR: TStringField
      FieldName = 'VENDEDOR'
      Size = 80
    end
    object sqldVendaCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
    end
    object sqldVendaCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Size = 80
    end
    object sqldVendaCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
    end
    object sqldVendaCEPCLIENTE: TStringField
      FieldName = 'CEPCLIENTE'
      Size = 10
    end
    object sqldVendaCIDADECLIENTE: TStringField
      FieldName = 'CIDADECLIENTE'
      Size = 80
    end
    object sqldVendaFONECLIENTE: TStringField
      FieldName = 'FONECLIENTE'
    end
    object sqldVendaENDERECOCLIENTE: TStringField
      FieldName = 'ENDERECOCLIENTE'
      Size = 80
    end
    object sqldVendaTOTALDESCTO: TFMTBCDField
      FieldName = 'TOTALDESCTO'
      Precision = 15
    end
    object sqldVendaTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 15
    end
  end
  object sqldItemVenda: TSQLDataSet
    CommandText = 'select * from VIEWITEMVENDA'#13#10'where CODVENDA = :IDVENDA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'IDVENDA'
        ParamType = ptInput
      end>
    Left = 168
    Top = 72
    object sqldItemVendaCODVENDA: TIntegerField
      FieldName = 'CODVENDA'
    end
    object sqldItemVendaCODPRODUTO: TIntegerField
      FieldName = 'CODPRODUTO'
    end
    object sqldItemVendaPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Size = 80
    end
    object sqldItemVendaQTDE: TIntegerField
      FieldName = 'QTDE'
    end
    object sqldItemVendaDESCTO: TFMTBCDField
      FieldName = 'DESCTO'
      Precision = 15
    end
    object sqldItemVendaPRECO: TFMTBCDField
      FieldName = 'PRECO'
      Precision = 15
    end
    object sqldItemVendaTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 15
    end
  end
  object sqldDataItens: TSQLDataSet
    CommandText = 
      'select *  from CONFIGNOTA'#13#10'where ((TIPO = '#39'I'#39') and (REFERENCIA <' +
      '> '#39'Itens da nota'#39'))'#13#10'order by LINHA, COLUNA'
    MaxBlobSize = -1
    Params = <>
    Left = 48
    Top = 120
    object sqldDataItensCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sqldDataItensCAMPO: TStringField
      FieldName = 'CAMPO'
      Size = 80
    end
    object sqldDataItensLAYOUT: TStringField
      FieldName = 'LAYOUT'
      Size = 80
    end
    object sqldDataItensREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 80
    end
    object sqldDataItensTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object sqldDataItensLINHA: TIntegerField
      FieldName = 'LINHA'
    end
    object sqldDataItensCOLUNA: TIntegerField
      FieldName = 'COLUNA'
    end
    object sqldDataItensIMPRIMIR: TStringField
      FieldName = 'IMPRIMIR'
      FixedChar = True
      Size = 1
    end
  end
end
