inherited dmDuplicatas: TdmDuplicatas
  OldCreateOrder = True
  Height = 254
  HorizontalOffset = 397
  VerticalOffset = 191
  Width = 490
  object sqldPadrao: TSQLQuery[0]
    FieldDefs = <>
    Params = <>
    Left = 56
    Top = 101
    object sqldPadraoIDDUPLICATA: TIntegerField
      FieldKind = fkData
      FieldName = 'IDDUPLICATA'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object sqldPadraoNRODUPLICATA: TStringField
      FieldKind = fkData
      FieldName = 'NRODUPLICATA'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoSACADO: TStringField
      FieldKind = fkData
      FieldName = 'SACADO'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoCPF_CNPJ: TStringField
      FieldKind = fkData
      FieldName = 'CPF_CNPJ'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoENDERECO: TStringField
      FieldKind = fkData
      FieldName = 'ENDERECO'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoBAIRRO: TStringField
      FieldKind = fkData
      FieldName = 'BAIRRO'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoCEP: TStringField
      FieldKind = fkData
      FieldName = 'CEP'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
    object sqldPadraoIDCIDADE: TIntegerField
      FieldKind = fkData
      FieldName = 'IDCIDADE'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoNOMECIDADE: TStringField
      FieldKind = fkData
      FieldName = 'NOMECIDADE'
      Index = 8
      LookupCache = False
      ProviderFlags = []
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoFONEFAX: TStringField
      FieldKind = fkData
      FieldName = 'FONEFAX'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoUF: TStringField
      FieldKind = fkData
      FieldName = 'UF'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 2
    end
    object sqldPadraoIE: TStringField
      FieldKind = fkData
      FieldName = 'IE'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoDATAEMISSAO: TDateField
      FieldKind = fkData
      FieldName = 'DATAEMISSAO'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoNROFATURA: TStringField
      FieldKind = fkData
      FieldName = 'NROFATURA'
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoVALOR_FATURA: TFMTBCDField
      FieldKind = fkData
      FieldName = 'VALOR_FATURA'
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object sqldPadraoVALOR: TFMTBCDField
      FieldKind = fkData
      FieldName = 'VALOR'
      Index = 15
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object sqldPadraoDATAVENC: TDateField
      FieldKind = fkData
      FieldName = 'DATAVENC'
      Index = 16
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoDESCONTO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'DESCONTO'
      Index = 17
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object sqldPadraoPRACAPAGAMENTO: TStringField
      FieldKind = fkData
      FieldName = 'PRACAPAGAMENTO'
      Index = 18
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 250
    end
    object sqldPadraoDATADESCTO: TDateField
      FieldKind = fkData
      FieldName = 'DATADESCTO'
      Index = 19
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoVALOREXTENSO: TStringField
      FieldKind = fkData
      FieldName = 'VALOREXTENSO'
      Index = 20
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 250
    end
    object sqldPadraoDATAIMPRESSAO: TDateField
      FieldKind = fkData
      FieldName = 'DATAIMPRESSAO'
      Index = 21
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoIMPRESSA: TStringField
      FieldKind = fkData
      FieldName = 'IMPRESSA'
      Index = 22
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
  end
  object sqldDeleta: TSQLQuery[1]
    FieldDefs = <>
    Params = <    
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    Left = 56
    Top = 20
  end
end
