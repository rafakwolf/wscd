inherited dmDuplicatas: TdmDuplicatas
  OldCreateOrder = True
  Height = 294
  Width = 445
  object sqldPadrao: TSQLDataSet [0]
    CommandText = 
      'select'#13#10'  d.IDDUPLICATA,'#13#10'  d.NRODUPLICATA,'#13#10'  d.SACADO,'#13#10'  d.CP' +
      'F_CNPJ,'#13#10'  d.ENDERECO,'#13#10'  d.BAIRRO,'#13#10'  d.CEP,'#13#10'  d.IDCIDADE,'#13#10'  ' +
      'c.Descricao NOMECIDADE,'#13#10'  d.FONEFAX,'#13#10'  d.UF,'#13#10'  d.IE,'#13#10'  d.DAT' +
      'AEMISSAO,'#13#10'  d.NROFATURA,'#13#10'  d.VALOR_FATURA,'#13#10'  d.VALOR,'#13#10'  d.DA' +
      'TAVENC,'#13#10'  d.DESCONTO,'#13#10'  d.PRACAPAGAMENTO,'#13#10'  d.DATADESCTO,'#13#10'  ' +
      'd.VALOREXTENSO,'#13#10'  d.DATAIMPRESSAO,'#13#10'  d.IMPRESSA'#13#10'from DUPLICAT' +
      'A d'#13#10'left join CIDADES c on (d.Idcidade = c.Codcidade)'#13#10'order by' +
      ' IDDUPLICATA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 56
    Top = 101
    object sqldPadraoIDDUPLICATA: TIntegerField
      FieldName = 'IDDUPLICATA'
      Required = True
    end
    object sqldPadraoNRODUPLICATA: TStringField
      FieldName = 'NRODUPLICATA'
    end
    object sqldPadraoSACADO: TStringField
      FieldName = 'SACADO'
      Size = 80
    end
    object sqldPadraoCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
    end
    object sqldPadraoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 80
    end
    object sqldPadraoBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 80
    end
    object sqldPadraoCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object sqldPadraoIDCIDADE: TIntegerField
      FieldName = 'IDCIDADE'
    end
    object sqldPadraoNOMECIDADE: TStringField
      FieldName = 'NOMECIDADE'
      ProviderFlags = []
      Size = 80
    end
    object sqldPadraoFONEFAX: TStringField
      FieldName = 'FONEFAX'
    end
    object sqldPadraoUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object sqldPadraoIE: TStringField
      FieldName = 'IE'
    end
    object sqldPadraoDATAEMISSAO: TDateField
      FieldName = 'DATAEMISSAO'
    end
    object sqldPadraoNROFATURA: TStringField
      FieldName = 'NROFATURA'
    end
    object sqldPadraoVALOR_FATURA: TFMTBCDField
      FieldName = 'VALOR_FATURA'
      Precision = 15
    end
    object sqldPadraoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 15
    end
    object sqldPadraoDATAVENC: TDateField
      FieldName = 'DATAVENC'
    end
    object sqldPadraoDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Precision = 15
    end
    object sqldPadraoPRACAPAGAMENTO: TStringField
      FieldName = 'PRACAPAGAMENTO'
      Size = 250
    end
    object sqldPadraoDATADESCTO: TDateField
      FieldName = 'DATADESCTO'
    end
    object sqldPadraoVALOREXTENSO: TStringField
      FieldName = 'VALOREXTENSO'
      Size = 250
    end
    object sqldPadraoDATAIMPRESSAO: TDateField
      FieldName = 'DATAIMPRESSAO'
    end
    object sqldPadraoIMPRESSA: TStringField
      FieldName = 'IMPRESSA'
      FixedChar = True
      Size = 1
    end
  end
  object dspPadrao: TDataSetProvider [1]
    DataSet = sqldPadrao
    Options = [poAllowCommandText]
    Left = 152
    Top = 109
  end
  object sqldDeleta: TSQLDataSet [2]
    CommandText = 'STPDELDUPLICATA'
    CommandType = ctStoredProc
    DbxCommandType = 'Dbx.StoredProcedure'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    Left = 56
    Top = 20
  end
  inherited LocalConnection1: TLocalConnection
    Left = 296
    Top = 48
  end
end
