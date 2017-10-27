inherited frmRelatorioCRAtraso: TfrmRelatorioCRAtraso
  Left = 238
  Top = 199
  ClientHeight = 127
  ClientWidth = 401
  Caption = 'frmRelatorioCRAtraso'
  OldCreateOrder = True
  ExplicitWidth = 417
  ExplicitHeight = 166
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnButtons: TUniContainerPanel
    Top = 93
    Width = 401
    ExplicitTop = 97
    ExplicitWidth = 409
  end
  object dbeCliente: TUniDBEdit [1]
    Left = 16
    Top = 40
    Width = 355
    Height = 21
    Hint = 'Pesquisar < F2 >'
    ShowHint = True
    DataField = 'NOME'
    DataSource = dsPadrao
    TabOrder = 1
    Color = clBtnFace
    ReadOnly = True
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsCliente
    Left = 200
  end
  object sqldCliente: TSQLDataSet
    CommandText = 
      'select'#13#10'  cli.CODCLIENTE,'#13#10'  cli.NOME,'#13#10'  cli.TELEFONE,'#13#10'  cli.R' +
      'G_IE,'#13#10'  cli.CPF_CNPJ,'#13#10'  cli.DATA_NASC,'#13#10'  cli.LIMITE,'#13#10'  cid.D' +
      'ESCRICAO'#13#10'from CLIENTES cli'#13#10'left join CIDADES cid on (cli.CODCI' +
      'DADE = cid.CODCIDADE)'#13#10'order by cli.NOME'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 104
    Top = 8
    object sqldClienteCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
      Required = True
    end
    object sqldClienteNOME: TStringField
      FieldName = 'NOME'
      Size = 80
    end
    object sqldClienteTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
    object sqldClienteRG_IE: TStringField
      FieldName = 'RG_IE'
    end
    object sqldClienteCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
    end
    object sqldClienteDATA_NASC: TDateField
      FieldName = 'DATA_NASC'
    end
    object sqldClienteLIMITE: TFMTBCDField
      FieldName = 'LIMITE'
      Precision = 15
    end
    object sqldClienteDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
  end
  object dspCliente: TDataSetProvider
    DataSet = sqldCliente
    Options = [poAllowCommandText]
    Left = 136
    Top = 8
  end
  object cdsCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCliente'
    Left = 168
    Top = 8
    object cdsClienteCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
      Required = True
    end
    object cdsClienteNOME: TStringField
      FieldName = 'NOME'
      Size = 80
    end
    object cdsClienteTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
    object cdsClienteRG_IE: TStringField
      FieldName = 'RG_IE'
    end
    object cdsClienteCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
    end
    object cdsClienteDATA_NASC: TDateField
      FieldName = 'DATA_NASC'
    end
    object cdsClienteLIMITE: TFMTBCDField
      FieldName = 'LIMITE'
      Precision = 15
    end
    object cdsClienteDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
  end
end
