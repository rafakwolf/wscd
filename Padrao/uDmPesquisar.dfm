object DmPesquisar: TDmPesquisar
  OldCreateOrder = False
  Height = 506
  Width = 344
  object sqldPesqCliente: TSQLDataSet
    CommandText = 
      'select'#13#10'  cli.CODCLIENTE,'#13#10'  cli.NOME,'#13#10'  cli.TELEFONE,'#13#10'  cli.R' +
      'G_IE,'#13#10'  cli.CPF_CNPJ,'#13#10'  cli.DATA_NASC,'#13#10'  cid.DESCRICAO'#13#10'from ' +
      'CLIENTES cli'#13#10'left join CIDADES cid on (cli.CODCIDADE = cid.CODC' +
      'IDADE)'#13#10'order by cli.NOME'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 48
    object sqldPesqClienteCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
      Required = True
    end
    object sqldPesqClienteNOME: TStringField
      FieldName = 'NOME'
      Size = 80
    end
    object sqldPesqClienteTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
    object sqldPesqClienteRG_IE: TStringField
      FieldName = 'RG_IE'
    end
    object sqldPesqClienteCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
    end
    object sqldPesqClienteDATA_NASC: TDateField
      FieldName = 'DATA_NASC'
    end
    object sqldPesqClienteDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
  end
  object dspPesqCliente: TDataSetProvider
    DataSet = sqldPesqCliente
    Options = [poAllowCommandText]
    Left = 160
  end
  object cdsPesqCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesqCliente'
    Left = 272
    object cdsPesqClienteCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
      Required = True
    end
    object cdsPesqClienteNOME: TStringField
      FieldName = 'NOME'
      Size = 80
    end
    object cdsPesqClienteTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
    object cdsPesqClienteRG_IE: TStringField
      FieldName = 'RG_IE'
    end
    object cdsPesqClienteCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
    end
    object cdsPesqClienteDATA_NASC: TDateField
      FieldName = 'DATA_NASC'
    end
    object cdsPesqClienteDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
  end
  object sqldPesqData: TSQLDataSet
    CommandText = 
      'SELECT'#13#10'  CAST('#39'01.'#39'||EXTRACT(MONTH FROM CURRENT_DATE)||'#39'.'#39'||EXT' +
      'RACT(YEAR FROM CURRENT_DATE) AS DATE) DATAINI,'#13#10'  CAST('#39'30.'#39'||EX' +
      'TRACT(MONTH FROM CURRENT_DATE)||'#39'.'#39'||EXTRACT(YEAR FROM CURRENT_D' +
      'ATE) AS DATE) DATAFIM'#13#10'FROM RDB$DATABASE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 48
    Top = 48
    object sqldPesqDataDATAINI: TDateField
      FieldName = 'DATAINI'
      Required = True
    end
    object sqldPesqDataDATAFIM: TDateField
      FieldName = 'DATAFIM'
      Required = True
    end
  end
  object dspPesqData: TDataSetProvider
    DataSet = sqldPesqData
    Options = [poAllowCommandText]
    Left = 160
    Top = 48
  end
  object cdsPesqData: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesqData'
    Left = 272
    Top = 48
    object cdsPesqDataDATAINI: TDateField
      FieldName = 'DATAINI'
      Required = True
    end
    object cdsPesqDataDATAFIM: TDateField
      FieldName = 'DATAFIM'
      Required = True
    end
  end
  object sqldPesqCidade: TSQLDataSet
    CommandText = 'select CODCIDADE, DESCRICAO from CIDADES'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 48
    Top = 96
    object sqldPesqCidadeCODCIDADE: TIntegerField
      FieldName = 'CODCIDADE'
      Required = True
    end
    object sqldPesqCidadeDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
  end
  object dspPesqCidade: TDataSetProvider
    DataSet = sqldPesqCidade
    Options = [poAllowCommandText]
    Left = 160
    Top = 96
  end
  object cdsPesqCidade: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesqCidade'
    Left = 272
    Top = 96
    object cdsPesqCidadeCODCIDADE: TIntegerField
      FieldName = 'CODCIDADE'
      Required = True
    end
    object cdsPesqCidadeDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
  end
  object sqldPesqForn: TSQLDataSet
    CommandText = 
      'select '#13#10'  CODFORNECEDOR,'#13#10'  FANTAZIA,'#13#10'  CNPJ,'#13#10'  TELEFONE'#13#10'fro' +
      'm FORNECEDORES'#13#10'order by FANTAZIA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 48
    Top = 144
    object sqldPesqFornCODFORNECEDOR: TIntegerField
      FieldName = 'CODFORNECEDOR'
      Required = True
    end
    object sqldPesqFornFANTAZIA: TStringField
      FieldName = 'FANTAZIA'
      Size = 40
    end
    object sqldPesqFornCNPJ: TStringField
      FieldName = 'CNPJ'
    end
    object sqldPesqFornTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
  end
  object dspPesqForn: TDataSetProvider
    DataSet = sqldPesqForn
    Options = [poAllowCommandText]
    Left = 160
    Top = 144
  end
  object cdsPesqForn: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesqForn'
    Left = 272
    Top = 144
    object cdsPesqFornCODFORNECEDOR: TIntegerField
      FieldName = 'CODFORNECEDOR'
      Required = True
    end
    object cdsPesqFornFANTAZIA: TStringField
      FieldName = 'FANTAZIA'
      Size = 40
    end
    object cdsPesqFornCNPJ: TStringField
      FieldName = 'CNPJ'
    end
    object cdsPesqFornTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
  end
  object sqldPesqGrupo: TSQLDataSet
    CommandText = 'select '#13#10'  CODGRUPO, '#13#10'  DESCRICAO '#13#10'from GRUPOS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 48
    Top = 192
    object sqldPesqGrupoCODGRUPO: TIntegerField
      FieldName = 'CODGRUPO'
      Required = True
    end
    object sqldPesqGrupoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 30
    end
  end
  object dspPesqGrupo: TDataSetProvider
    DataSet = sqldPesqGrupo
    Options = [poAllowCommandText]
    Left = 160
    Top = 192
  end
  object cdsPesqGrupo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesqGrupo'
    Left = 272
    Top = 192
    object cdsPesqGrupoCODGRUPO: TIntegerField
      FieldName = 'CODGRUPO'
      Required = True
    end
    object cdsPesqGrupoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 30
    end
  end
  object sqldPesqBanco: TSQLDataSet
    CommandText = 'select '#13#10'  IDBANCO, '#13#10'  BANCO '#13#10'from BANCO'#13#10'order by BANCO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 48
    Top = 240
    object sqldPesqBancoIDBANCO: TIntegerField
      FieldName = 'IDBANCO'
      Required = True
    end
    object sqldPesqBancoBANCO: TStringField
      FieldName = 'BANCO'
      Size = 80
    end
  end
  object dspPesqBanco: TDataSetProvider
    DataSet = sqldPesqBanco
    Options = [poAllowCommandText]
    Left = 160
    Top = 240
  end
  object cdsPesqBanco: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesqBanco'
    Left = 272
    Top = 240
    object cdsPesqBancoIDBANCO: TIntegerField
      FieldName = 'IDBANCO'
      Required = True
    end
    object cdsPesqBancoBANCO: TStringField
      FieldName = 'BANCO'
      Size = 80
    end
  end
  object sqldPesqCfop: TSQLDataSet
    CommandText = 'SELECT'#13#10'  NUMERO,'#13#10'  OPERACAO'#13#10'FROM CFOP'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 48
    Top = 288
    object sqldPesqCfopNUMERO: TStringField
      FieldName = 'NUMERO'
      Required = True
    end
    object sqldPesqCfopOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Required = True
      Size = 250
    end
  end
  object dspPesqCfop: TDataSetProvider
    DataSet = sqldPesqCfop
    Options = [poAllowCommandText]
    Left = 160
    Top = 288
  end
  object cdsPesqCfop: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesqCfop'
    Left = 272
    Top = 288
    object cdsPesqCfopNUMERO: TStringField
      FieldName = 'NUMERO'
      Required = True
    end
    object cdsPesqCfopOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Required = True
      Size = 250
    end
  end
  object sqldPesqCaixas: TSQLDataSet
    CommandText = 'select '#13#10'  CODIGO, '#13#10'  NOME '#13#10'from CAIXAS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 48
    Top = 342
    object sqldPesqCaixasCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sqldPesqCaixasNOME: TStringField
      FieldName = 'NOME'
      Required = True
    end
  end
  object dspPesqCaixas: TDataSetProvider
    DataSet = sqldPesqCaixas
    Options = [poAllowCommandText]
    Left = 160
    Top = 342
  end
  object cdsPesqCaixas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesqCaixas'
    Left = 271
    Top = 341
    object cdsPesqCaixasCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsPesqCaixasNOME: TStringField
      FieldName = 'NOME'
      Required = True
    end
  end
  object sqldPesqAliquota: TSQLDataSet
    CommandText = 'select '#13#10'  CODALIQUOTA, '#13#10'  DESCRICAO '#13#10'from ALIQUOTAS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 48
    Top = 390
    object sqldPesqAliquotaCODALIQUOTA: TIntegerField
      FieldName = 'CODALIQUOTA'
      Required = True
    end
    object sqldPesqAliquotaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
    end
  end
  object dspPesqAliquota: TDataSetProvider
    DataSet = sqldPesqAliquota
    Options = [poAllowCommandText]
    Left = 160
    Top = 390
  end
  object cdsPesqAliquota: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesqAliquota'
    Left = 271
    Top = 390
    object cdsPesqAliquotaCODALIQUOTA: TIntegerField
      FieldName = 'CODALIQUOTA'
      Required = True
    end
    object cdsPesqAliquotaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
    end
  end
  object sqldPesqVendedor: TSQLDataSet
    CommandText = 'select * from VENDEDOR'#13#10'where ATIVO = '#39'S'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 48
    Top = 448
    object sqldPesqVendedorIDVENDEDOR: TIntegerField
      FieldName = 'IDVENDEDOR'
      Required = True
    end
    object sqldPesqVendedorVENDEDOR: TStringField
      FieldName = 'VENDEDOR'
      Size = 80
    end
    object sqldPesqVendedorATIVO: TStringField
      FieldName = 'ATIVO'
      FixedChar = True
      Size = 1
    end
  end
  object dspPesqVendedor: TDataSetProvider
    DataSet = sqldPesqVendedor
    Options = [poAllowCommandText]
    Left = 160
    Top = 448
  end
  object cdsPesqVendedor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesqVendedor'
    Left = 272
    Top = 448
    object cdsPesqVendedorIDVENDEDOR: TIntegerField
      FieldName = 'IDVENDEDOR'
      Required = True
    end
    object cdsPesqVendedorVENDEDOR: TStringField
      FieldName = 'VENDEDOR'
      Size = 80
    end
    object cdsPesqVendedorATIVO: TStringField
      FieldName = 'ATIVO'
      FixedChar = True
      Size = 1
    end
  end
end
