inherited dmCliente: TdmCliente
  OldCreateOrder = True
  Height = 251
  Width = 334
  inherited LocalConnection1: TLocalConnection
    Left = 160
    Top = 144
  end
  object sqldPadrao: TSQLDataSet
    CommandText = 
      'select'#13#10'  cli.CODCLIENTE,'#13#10'  cli.TIPO,'#13#10'  cli.NOME,'#13#10'  cli.ENDER' +
      'ECO,'#13#10'  cli.CEP,'#13#10'  cli.BAIRRO,'#13#10'  cli.TELEFONE,'#13#10'  cli.FAX,'#13#10'  ' +
      'cli.CODCIDADE,'#13#10'  cid.DESCRICAO,'#13#10'  cli.UF,'#13#10'  cli.TEMPO_MORADIA' +
      ','#13#10'  cli.END_ANTERIOR,'#13#10'  cli.E_MAIL,'#13#10'  cli.TRABALHO,'#13#10'  cli.CA' +
      'RGO,'#13#10'  cli.DATA_INICIO,'#13#10'  cli.SALARIO,'#13#10'  cli.ESTADO_CIVIL,'#13#10' ' +
      ' cli.CONJUGUE,'#13#10'  cli.LOCAL_TRAB,'#13#10'  cli.DATA_NASC,'#13#10'  cli.PAI,'#13 +
      #10'  cli.MAE,'#13#10'  cli.CPF_CNPJ,'#13#10'  cli.RG_IE,'#13#10'  cli.REFER_PES,'#13#10'  ' +
      'cli.REFER_COM,'#13#10'  cli.FONE_COM,'#13#10'  cli.CADASTRO,'#13#10'  cli.OBS,'#13#10'  ' +
      'cli.NATURALIDADE,'#13#10'  cli.LIMITE,'#13#10'  cli.FOTO'#13#10'from CLIENTES cli'#13 +
      #10'left join CIDADES cid on (cli.CODCIDADE = cid.CODCIDADE)'#13#10'order' +
      ' by cli.NOME'
    MaxBlobSize = 1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 72
    Top = 36
    object sqldPadraoCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqldPadraoTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoNOME: TStringField
      FieldName = 'NOME'
      Size = 80
    end
    object sqldPadraoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 80
    end
    object sqldPadraoCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object sqldPadraoBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 80
    end
    object sqldPadraoTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
    object sqldPadraoFAX: TStringField
      FieldName = 'FAX'
    end
    object sqldPadraoCODCIDADE: TIntegerField
      FieldName = 'CODCIDADE'
    end
    object sqldPadraoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = []
      Size = 80
    end
    object sqldPadraoUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object sqldPadraoTEMPO_MORADIA: TStringField
      FieldName = 'TEMPO_MORADIA'
      Size = 80
    end
    object sqldPadraoEND_ANTERIOR: TStringField
      FieldName = 'END_ANTERIOR'
      Size = 80
    end
    object sqldPadraoE_MAIL: TStringField
      FieldName = 'E_MAIL'
      Size = 80
    end
    object sqldPadraoTRABALHO: TStringField
      FieldName = 'TRABALHO'
      Size = 80
    end
    object sqldPadraoCARGO: TStringField
      FieldName = 'CARGO'
      Size = 80
    end
    object sqldPadraoDATA_INICIO: TDateField
      FieldName = 'DATA_INICIO'
    end
    object sqldPadraoSALARIO: TFMTBCDField
      FieldName = 'SALARIO'
      Precision = 15
    end
    object sqldPadraoESTADO_CIVIL: TStringField
      FieldName = 'ESTADO_CIVIL'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoCONJUGUE: TStringField
      FieldName = 'CONJUGUE'
      Size = 80
    end
    object sqldPadraoLOCAL_TRAB: TStringField
      FieldName = 'LOCAL_TRAB'
      Size = 80
    end
    object sqldPadraoDATA_NASC: TDateField
      FieldName = 'DATA_NASC'
    end
    object sqldPadraoPAI: TStringField
      FieldName = 'PAI'
      Size = 80
    end
    object sqldPadraoMAE: TStringField
      FieldName = 'MAE'
      Size = 80
    end
    object sqldPadraoCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
    end
    object sqldPadraoRG_IE: TStringField
      FieldName = 'RG_IE'
    end
    object sqldPadraoREFER_PES: TStringField
      FieldName = 'REFER_PES'
      Size = 250
    end
    object sqldPadraoREFER_COM: TStringField
      FieldName = 'REFER_COM'
      Size = 250
    end
    object sqldPadraoFONE_COM: TStringField
      FieldName = 'FONE_COM'
    end
    object sqldPadraoCADASTRO: TDateField
      FieldName = 'CADASTRO'
    end
    object sqldPadraoOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sqldPadraoNATURALIDADE: TStringField
      FieldName = 'NATURALIDADE'
      Size = 80
    end
    object sqldPadraoLIMITE: TFMTBCDField
      FieldName = 'LIMITE'
      Precision = 15
    end
    object sqldPadraoFOTO: TBlobField
      FieldName = 'FOTO'
      Size = 1
    end
  end
  object dspPadrao: TDataSetProvider
    DataSet = sqldPadrao
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    AfterUpdateRecord = dspPadraoAfterUpdateRecord
    Left = 160
    Top = 36
  end
  object cdsPadrao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 238
    Top = 36
    object cdsPadraoCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPadraoTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 1
    end
    object cdsPadraoNOME: TStringField
      DisplayWidth = 80
      FieldName = 'NOME'
      Required = True
      Size = 80
    end
    object cdsPadraoENDERECO: TStringField
      DisplayWidth = 80
      FieldName = 'ENDERECO'
      Size = 80
    end
    object cdsPadraoCEP: TStringField
      FieldName = 'CEP'
      EditMask = '99999\-999;1;_'
      Size = 10
    end
    object cdsPadraoBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object cdsPadraoTELEFONE: TStringField
      FieldName = 'TELEFONE'
      EditMask = '!\(99\)9999-9999;1;_'
      Size = 15
    end
    object cdsPadraoCODCIDADE: TIntegerField
      DisplayLabel = 'Cidade'
      FieldName = 'CODCIDADE'
      Required = True
    end
    object cdsPadraoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = []
      Size = 80
    end
    object cdsPadraoUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object cdsPadraoTEMPO_MORADIA: TStringField
      FieldName = 'TEMPO_MORADIA'
      Size = 30
    end
    object cdsPadraoEND_ANTERIOR: TStringField
      FieldName = 'END_ANTERIOR'
      Size = 50
    end
    object cdsPadraoE_MAIL: TStringField
      FieldName = 'E_MAIL'
      Size = 60
    end
    object cdsPadraoDATA_INICIO: TDateField
      FieldName = 'DATA_INICIO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoTRABALHO: TStringField
      FieldName = 'TRABALHO'
      Size = 50
    end
    object cdsPadraoCARGO: TStringField
      FieldName = 'CARGO'
      Size = 50
    end
    object cdsPadraoSALARIO: TFMTBCDField
      FieldName = 'SALARIO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 15
    end
    object cdsPadraoESTADO_CIVIL: TStringField
      FieldName = 'ESTADO_CIVIL'
      Size = 1
    end
    object cdsPadraoCONJUGUE: TStringField
      FieldName = 'CONJUGUE'
      Size = 50
    end
    object cdsPadraoLOCAL_TRAB: TStringField
      FieldName = 'LOCAL_TRAB'
      Size = 60
    end
    object cdsPadraoDATA_NASC: TDateField
      DisplayLabel = 'Data de nascimento'
      FieldName = 'DATA_NASC'
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoPAI: TStringField
      FieldName = 'PAI'
      Size = 60
    end
    object cdsPadraoCADASTRO: TDateField
      FieldName = 'CADASTRO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoMAE: TStringField
      FieldName = 'MAE'
      Size = 60
    end
    object cdsPadraoCPF_CNPJ: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'CPF_CNPJ'
      Required = True
      Size = 18
    end
    object cdsPadraoRG_IE: TStringField
      DisplayLabel = 'RG/IE'
      FieldName = 'RG_IE'
      Required = True
      Size = 11
    end
    object cdsPadraoREFER_PES: TStringField
      FieldName = 'REFER_PES'
      Size = 100
    end
    object cdsPadraoREFER_COM: TStringField
      FieldName = 'REFER_COM'
      Size = 100
    end
    object cdsPadraoFONE_COM: TStringField
      FieldName = 'FONE_COM'
      EditMask = '!\(99\)9999-9999;1;_'
      Size = 15
    end
    object cdsPadraoOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsPadraoNATURALIDADE: TStringField
      FieldName = 'NATURALIDADE'
      Size = 50
    end
    object cdsPadraoFAX: TStringField
      FieldName = 'FAX'
      EditMask = '!\(99\)9999-9999;1;_'
      Size = 15
    end
    object cdsPadraoLIMITE: TFMTBCDField
      FieldName = 'LIMITE'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 15
    end
    object cdsPadraoFOTO: TBlobField
      FieldName = 'FOTO'
      Size = 1
    end
  end
end
