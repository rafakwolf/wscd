inherited frmPrevContasReceber: TfrmPrevContasReceber
  Caption = 'frmPrevContasReceber'
  inherited rrPadrao: TRLReport
    inherited rbRodape: TRLBand
      Height = 57
      Top = 126
    end
    object rbDetalhe: TRLBand[2]
      Left = 38
      Height = 19
      Top = 107
      Width = 718
      BeforePrint = rbDetalheBeforePrint
      object rldbtdata: TRLDBText
        Left = 8
        Height = 15
        Top = 1
        Width = 36
        DataField = 'DATA'
        DataSource = dsPadrao
      end
      object rldbtVenc: TRLDBText
        Left = 88
        Height = 15
        Top = 1
        Width = 90
        DataField = 'VENCIMENTO'
        DataSource = dsPadrao
      end
      object rldbtClient: TRLDBText
        Left = 176
        Height = 15
        Top = 1
        Width = 59
        DataField = 'CLIENTE'
        DataSource = dsPadrao
      end
      object rldbtValorCapital: TRLDBText
        Left = 554
        Height = 15
        Top = 1
        Width = 56
        Alignment = taRightJustify
        DataField = 'CAPITAL'
        DataSource = dsPadrao
      end
      object rldbtTotal: TRLDBText
        Left = 668
        Height = 15
        Top = 1
        Width = 44
        Alignment = taRightJustify
        DataField = 'TOTAL'
        DataSource = dsPadrao
      end
    end
    object rbColunas: TRLBand[3]
      Left = 38
      Height = 21
      Top = 86
      Width = 718
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object rlbData: TRLLabel
        Left = 8
        Height = 15
        Top = 2
        Width = 31
        Caption = 'Data'
      end
      object rlbVenc: TRLLabel
        Left = 88
        Height = 15
        Top = 2
        Width = 72
        Caption = 'Vencimento'
      end
      object rlbCliente: TRLLabel
        Left = 176
        Height = 15
        Top = 2
        Width = 44
        Caption = 'Cliente'
      end
      object rlbValorCap: TRLLabel
        Left = 576
        Height = 15
        Top = 2
        Width = 33
        Caption = 'Valor'
      end
      object rlbTotal: TRLLabel
        Left = 683
        Height = 15
        Top = 2
        Width = 31
        Caption = 'Total'
      end
    end
  end
  inherited sqldPadrao: TSQLQuery
    Params = <    
      item
        DataType = ftString
        Name = 'PCLIENTE'
        ParamType = ptInput
      end>
    object sqldPadraoDATA: TDateField[0]
      FieldKind = fkData
      FieldName = 'DATA'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoVENCIMENTO: TDateField[1]
      FieldKind = fkData
      FieldName = 'VENCIMENTO'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoCLIENTE: TStringField[2]
      FieldKind = fkData
      FieldName = 'CLIENTE'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoCAPITAL: TFMTBCDField[3]
      FieldKind = fkData
      FieldName = 'CAPITAL'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object sqldPadraoTOTAL: TFMTBCDField[4]
      FieldKind = fkData
      FieldName = 'TOTAL'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
  end
end
