inherited frmPrevEnvelopeCliente: TfrmPrevEnvelopeCliente
  Top = 115
  Caption = 'frmPrevEnvelopeCliente'
  OldCreateOrder = True
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 13
  inherited sqldPadrao: TSQLQuery
    CommandText = 
      'select'#13#10'  cast(NULL as Varchar(100)) NOME,'#13#10'  cast(NULL as DATE)' +
      ' DATA, '#13#10'  cast(NULL as Varchar(100)) ENDERECO,'#13#10'  cast(NULL as ' +
      'Varchar(100)) CIDADE,'#13#10'  cast(NULL as Varchar(100)) BAIRRO,'#13#10'  c' +
      'ast(NULL as Varchar(10)) CEP'#13#10'from RDB$DATABASE'
    object sqldPadraoDATA: TDateField
      FieldName = 'DATA'
    end
  end
  inherited cdsPadrao: TMemDataset
    object cdsPadraoDATA: TDateField
      FieldName = 'DATA'
    end
  end
end
