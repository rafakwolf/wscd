inherited frmRelatorioFaturamento: TfrmRelatorioFaturamento
  ClientHeight = 127
  ClientWidth = 417
  Caption = 'frmRelatorioFaturamento'
  OldCreateOrder = True
  ExplicitWidth = 433
  ExplicitHeight = 166
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnButtons: TUniContainerPanel
    Top = 93
    Width = 417
    ExplicitTop = 97
    ExplicitWidth = 425
  end
  object chkLucro: TUniCheckBox [1]
    Left = 16
    Top = 67
    Width = 193
    Height = 17
    Hint = ''
    ShowHint = True
    Caption = 'Mostrar porcentagem de lucro'
    TabOrder = 3
  end
  object chkCusto: TUniCheckBox [2]
    Left = 16
    Top = 48
    Width = 154
    Height = 17
    Hint = ''
    ShowHint = True
    Caption = 'Mostrar pre'#231'o de custo'
    TabOrder = 2
  end
  object dbeForn: TUniDBEdit [3]
    Left = 16
    Top = 24
    Width = 371
    Height = 21
    Hint = 'Pesquisar < F2 >'
    ShowHint = True
    DataField = 'FANTAZIA'
    DataSource = dsPadrao
    TabOrder = 1
    Color = clBtnFace
    ReadOnly = True
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsForn
    Left = 360
    Top = 56
  end
  object sqldForn: TSQLDataSet
    CommandText = 
      'select'#13#10'  CODFORNECEDOR,'#13#10'  FANTAZIA,'#13#10'  CNPJ,'#13#10'  TELEFONE  '#13#10'fr' +
      'om FORNECEDORES'#13#10'order by FANTAZIA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 264
    Top = 56
    object sqldFornCODFORNECEDOR: TIntegerField
      FieldName = 'CODFORNECEDOR'
      Required = True
    end
    object sqldFornFANTAZIA: TStringField
      FieldName = 'FANTAZIA'
      Required = True
      Size = 40
    end
    object sqldFornCNPJ: TStringField
      FieldName = 'CNPJ'
      Required = True
    end
    object sqldFornTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Required = True
    end
  end
  object dspForn: TDataSetProvider
    DataSet = sqldForn
    Left = 296
    Top = 56
  end
  object cdsForn: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspForn'
    Left = 328
    Top = 56
    object cdsFornCODFORNECEDOR: TIntegerField
      FieldName = 'CODFORNECEDOR'
      Required = True
    end
    object cdsFornFANTAZIA: TStringField
      FieldName = 'FANTAZIA'
      Required = True
      Size = 40
    end
    object cdsFornCNPJ: TStringField
      FieldName = 'CNPJ'
      Required = True
    end
    object cdsFornTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Required = True
    end
  end
end
