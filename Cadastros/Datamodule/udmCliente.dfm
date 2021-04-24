inherited dmCliente: TdmCliente
  OldCreateOrder = True
  Height = 390
  HorizontalOffset = 377
  VerticalOffset = 173
  Width = 565
  object sqldPadrao: TSQLQuery[0]
    FieldDefs = <>
    Params = <>
    Left = 72
    Top = 36
    object sqldPadraoCODCLIENTE: TIntegerField
      FieldKind = fkData
      FieldName = 'CODCLIENTE'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = False
      Required = True
    end
    object sqldPadraoTIPO: TStringField
      FieldKind = fkData
      FieldName = 'TIPO'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object sqldPadraoNOME: TStringField
      FieldKind = fkData
      FieldName = 'NOME'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoENDERECO: TStringField
      FieldKind = fkData
      FieldName = 'ENDERECO'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoCEP: TStringField
      FieldKind = fkData
      FieldName = 'CEP'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
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
    object sqldPadraoTELEFONE: TStringField
      FieldKind = fkData
      FieldName = 'TELEFONE'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoFAX: TStringField
      FieldKind = fkData
      FieldName = 'FAX'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoCODCIDADE: TIntegerField
      FieldKind = fkData
      FieldName = 'CODCIDADE'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoDESCRICAO: TStringField
      FieldKind = fkData
      FieldName = 'DESCRICAO'
      Index = 9
      LookupCache = False
      ProviderFlags = []
      ReadOnly = False
      Required = False
      Size = 80
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
    object sqldPadraoTEMPO_MORADIA: TStringField
      FieldKind = fkData
      FieldName = 'TEMPO_MORADIA'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoEND_ANTERIOR: TStringField
      FieldKind = fkData
      FieldName = 'END_ANTERIOR'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoE_MAIL: TStringField
      FieldKind = fkData
      FieldName = 'E_MAIL'
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoTRABALHO: TStringField
      FieldKind = fkData
      FieldName = 'TRABALHO'
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoCARGO: TStringField
      FieldKind = fkData
      FieldName = 'CARGO'
      Index = 15
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoDATA_INICIO: TDateField
      FieldKind = fkData
      FieldName = 'DATA_INICIO'
      Index = 16
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoSALARIO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'SALARIO'
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
    object sqldPadraoESTADO_CIVIL: TStringField
      FieldKind = fkData
      FieldName = 'ESTADO_CIVIL'
      Index = 18
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object sqldPadraoCONJUGUE: TStringField
      FieldKind = fkData
      FieldName = 'CONJUGUE'
      Index = 19
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoLOCAL_TRAB: TStringField
      FieldKind = fkData
      FieldName = 'LOCAL_TRAB'
      Index = 20
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoDATA_NASC: TDateField
      FieldKind = fkData
      FieldName = 'DATA_NASC'
      Index = 21
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoPAI: TStringField
      FieldKind = fkData
      FieldName = 'PAI'
      Index = 22
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoMAE: TStringField
      FieldKind = fkData
      FieldName = 'MAE'
      Index = 23
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoCPF_CNPJ: TStringField
      FieldKind = fkData
      FieldName = 'CPF_CNPJ'
      Index = 24
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoRG_IE: TStringField
      FieldKind = fkData
      FieldName = 'RG_IE'
      Index = 25
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoREFER_PES: TStringField
      FieldKind = fkData
      FieldName = 'REFER_PES'
      Index = 26
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 250
    end
    object sqldPadraoREFER_COM: TStringField
      FieldKind = fkData
      FieldName = 'REFER_COM'
      Index = 27
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 250
    end
    object sqldPadraoFONE_COM: TStringField
      FieldKind = fkData
      FieldName = 'FONE_COM'
      Index = 28
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoCADASTRO: TDateField
      FieldKind = fkData
      FieldName = 'CADASTRO'
      Index = 29
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoOBS: TMemoField
      FieldKind = fkData
      FieldName = 'OBS'
      Index = 30
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      BlobType = ftMemo
      Size = 1
      Transliterate = False
    end
    object sqldPadraoNATURALIDADE: TStringField
      FieldKind = fkData
      FieldName = 'NATURALIDADE'
      Index = 31
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoLIMITE: TFMTBCDField
      FieldKind = fkData
      FieldName = 'LIMITE'
      Index = 32
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object sqldPadraoFOTO: TBlobField
      FieldKind = fkData
      FieldName = 'FOTO'
      Index = 33
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
  end
  object cdsPadrao: TMemDataset[1]
    FieldDefs = <>
    Left = 238
    Top = 36
    object cdsPadraoCODCLIENTE: TIntegerField
      FieldKind = fkData
      FieldName = 'CODCLIENTE'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = False
      Required = True
    end
    object cdsPadraoTIPO: TStringField
      FieldKind = fkData
      FieldName = 'TIPO'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 1
    end
    object cdsPadraoNOME: TStringField
      DisplayWidth = 80
      FieldKind = fkData
      FieldName = 'NOME'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 80
    end
    object cdsPadraoENDERECO: TStringField
      DisplayWidth = 80
      FieldKind = fkData
      FieldName = 'ENDERECO'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoCEP: TStringField
      FieldKind = fkData
      FieldName = 'CEP'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      EditMask = '99999\-999;1;_'
      Size = 10
    end
    object cdsPadraoBAIRRO: TStringField
      FieldKind = fkData
      FieldName = 'BAIRRO'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 30
    end
    object cdsPadraoTELEFONE: TStringField
      FieldKind = fkData
      FieldName = 'TELEFONE'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      EditMask = '!\(99\)9999-9999;1;_'
      Size = 15
    end
    object cdsPadraoCODCIDADE: TIntegerField
      DisplayLabel = 'Cidade'
      FieldKind = fkData
      FieldName = 'CODCIDADE'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object cdsPadraoDESCRICAO: TStringField
      FieldKind = fkData
      FieldName = 'DESCRICAO'
      Index = 8
      LookupCache = False
      ProviderFlags = []
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoUF: TStringField
      FieldKind = fkData
      FieldName = 'UF'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 2
    end
    object cdsPadraoTEMPO_MORADIA: TStringField
      FieldKind = fkData
      FieldName = 'TEMPO_MORADIA'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 30
    end
    object cdsPadraoEND_ANTERIOR: TStringField
      FieldKind = fkData
      FieldName = 'END_ANTERIOR'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 50
    end
    object cdsPadraoE_MAIL: TStringField
      FieldKind = fkData
      FieldName = 'E_MAIL'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 60
    end
    object cdsPadraoDATA_INICIO: TDateField
      FieldKind = fkData
      FieldName = 'DATA_INICIO'
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoTRABALHO: TStringField
      FieldKind = fkData
      FieldName = 'TRABALHO'
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 50
    end
    object cdsPadraoCARGO: TStringField
      FieldKind = fkData
      FieldName = 'CARGO'
      Index = 15
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 50
    end
    object cdsPadraoSALARIO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'SALARIO'
      Index = 16
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object cdsPadraoESTADO_CIVIL: TStringField
      FieldKind = fkData
      FieldName = 'ESTADO_CIVIL'
      Index = 17
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object cdsPadraoCONJUGUE: TStringField
      FieldKind = fkData
      FieldName = 'CONJUGUE'
      Index = 18
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 50
    end
    object cdsPadraoLOCAL_TRAB: TStringField
      FieldKind = fkData
      FieldName = 'LOCAL_TRAB'
      Index = 19
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 60
    end
    object cdsPadraoDATA_NASC: TDateField
      DisplayLabel = 'Data de nascimento'
      FieldKind = fkData
      FieldName = 'DATA_NASC'
      Index = 20
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoPAI: TStringField
      FieldKind = fkData
      FieldName = 'PAI'
      Index = 21
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 60
    end
    object cdsPadraoCADASTRO: TDateField
      FieldKind = fkData
      FieldName = 'CADASTRO'
      Index = 22
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoMAE: TStringField
      FieldKind = fkData
      FieldName = 'MAE'
      Index = 23
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 60
    end
    object cdsPadraoCPF_CNPJ: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldKind = fkData
      FieldName = 'CPF_CNPJ'
      Index = 24
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 18
    end
    object cdsPadraoRG_IE: TStringField
      DisplayLabel = 'RG/IE'
      FieldKind = fkData
      FieldName = 'RG_IE'
      Index = 25
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 11
    end
    object cdsPadraoREFER_PES: TStringField
      FieldKind = fkData
      FieldName = 'REFER_PES'
      Index = 26
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object cdsPadraoREFER_COM: TStringField
      FieldKind = fkData
      FieldName = 'REFER_COM'
      Index = 27
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object cdsPadraoFONE_COM: TStringField
      FieldKind = fkData
      FieldName = 'FONE_COM'
      Index = 28
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      EditMask = '!\(99\)9999-9999;1;_'
      Size = 15
    end
    object cdsPadraoOBS: TMemoField
      FieldKind = fkData
      FieldName = 'OBS'
      Index = 29
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      BlobType = ftMemo
      Size = 1
      Transliterate = False
    end
    object cdsPadraoNATURALIDADE: TStringField
      FieldKind = fkData
      FieldName = 'NATURALIDADE'
      Index = 30
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 50
    end
    object cdsPadraoFAX: TStringField
      FieldKind = fkData
      FieldName = 'FAX'
      Index = 31
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      EditMask = '!\(99\)9999-9999;1;_'
      Size = 15
    end
    object cdsPadraoLIMITE: TFMTBCDField
      FieldKind = fkData
      FieldName = 'LIMITE'
      Index = 32
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object cdsPadraoFOTO: TBlobField
      FieldKind = fkData
      FieldName = 'FOTO'
      Index = 33
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
  end
end
