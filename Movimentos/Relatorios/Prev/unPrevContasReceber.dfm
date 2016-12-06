inherited frmPrevContasReceber: TfrmPrevContasReceber
  Caption = 'frmPrevContasReceber'
  ClientHeight = 460
  ClientWidth = 811
  OldCreateOrder = True
  ExplicitWidth = 827
  ExplicitHeight = 498
  PixelsPerInch = 96
  TextHeight = 13
  inherited rrPadrao: TRLReport
    DataSource = dsPadrao
    inherited rbRodape: TRLBand
      Top = 179
      Height = 57
      ExplicitTop = 179
      ExplicitHeight = 57
    end
    object rbDetalhe: TRLBand
      Left = 38
      Top = 160
      Width = 718
      Height = 19
      BeforePrint = rbDetalheBeforePrint
      object rldbtdata: TRLDBText
        Left = 8
        Top = 1
        Width = 38
        Height = 16
        DataField = 'DATA'
        DataSource = dsPadrao
        Text = ''
      end
      object rldbtVenc: TRLDBText
        Left = 88
        Top = 1
        Width = 89
        Height = 16
        DataField = 'VENCIMENTO'
        DataSource = dsPadrao
        Text = ''
      end
      object rldbtClient: TRLDBText
        Left = 176
        Top = 1
        Width = 57
        Height = 16
        DataField = 'CLIENTE'
        DataSource = dsPadrao
        Text = ''
      end
      object rldbtValorCapital: TRLDBText
        Left = 553
        Top = 1
        Width = 57
        Height = 16
        Alignment = taRightJustify
        DataField = 'CAPITAL'
        DataSource = dsPadrao
        Text = ''
      end
      object rldbtTotal: TRLDBText
        Left = 668
        Top = 1
        Width = 44
        Height = 16
        Alignment = taRightJustify
        DataField = 'TOTAL'
        DataSource = dsPadrao
        Text = ''
      end
    end
    object rbColunas: TRLBand
      Left = 38
      Top = 139
      Width = 718
      Height = 21
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object rlbData: TRLLabel
        Left = 8
        Top = 2
        Width = 31
        Height = 16
        Caption = 'Data'
      end
      object rlbVenc: TRLLabel
        Left = 88
        Top = 2
        Width = 73
        Height = 16
        Caption = 'Vencimento'
      end
      object rlbCliente: TRLLabel
        Left = 176
        Top = 2
        Width = 44
        Height = 16
        Caption = 'Cliente'
      end
      object rlbValorCap: TRLLabel
        Left = 576
        Top = 2
        Width = 34
        Height = 16
        Caption = 'Valor'
      end
      object rlbTotal: TRLLabel
        Left = 683
        Top = 2
        Width = 32
        Height = 16
        Caption = 'Total'
      end
    end
  end
  inherited sqldPadrao: TSQLDataSet
    CommandText = 
      'select '#13#10'  DATA, '#13#10'  VENCIMENTO, '#13#10'  CLIENTE, '#13#10'  CAPITAL, '#13#10'  T' +
      'OTAL '#13#10'from VIEWRELCR'#13#10'WHERE CLIENTE = :PCLIENTE'#13#10'order by DATA'
    Params = <
      item
        DataType = ftString
        Name = 'PCLIENTE'
        ParamType = ptInput
      end>
    SQLConnection = DmPrincipal.Conexao
    object sqldPadraoDATA: TDateField
      FieldName = 'DATA'
    end
    object sqldPadraoVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
    end
    object sqldPadraoCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Size = 80
    end
    object sqldPadraoCAPITAL: TFMTBCDField
      FieldName = 'CAPITAL'
      Precision = 15
    end
    object sqldPadraoTOTAL: TSingleField
      FieldName = 'TOTAL'
    end
  end
  inherited cdsPadrao: TClientDataSet
    Params = <
      item
        DataType = ftString
        Name = 'PCLIENTE'
        ParamType = ptInput
      end>
    object cdsPadraoDATA: TDateField
      FieldName = 'DATA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Size = 80
    end
    object cdsPadraoCAPITAL: TFMTBCDField
      FieldName = 'CAPITAL'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
    object cdsPadraoTOTAL: TSingleField
      FieldName = 'TOTAL'
    end
  end
end
