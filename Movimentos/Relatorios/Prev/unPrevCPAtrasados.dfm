inherited frmRelatorioCPAtrasados: TfrmRelatorioCPAtrasados
  Left = 219
  Top = 164
  ClientHeight = 144
  ClientWidth = 361
  Caption = 'frmRelatorioCPAtrasados'
  OldCreateOrder = True
  ExplicitWidth = 377
  ExplicitHeight = 183
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnButtons: TContainerPanel
    Top = 110
    Width = 361
    ExplicitTop = 110
    ExplicitWidth = 361
  end
  object dbeFornecedor: TDBEdit [1]
    Left = 16
    Top = 48
    Width = 321
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
    Left = 240
  end
  object sqldForn: TSQLDataSet
    CommandText = 
      'select '#13#10'  CODFORNECEDOR,'#13#10'  FANTAZIA,'#13#10'  CNPJ,'#13#10'  TELEFONE'#13#10'fro' +
      'm FORNECEDORES'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 144
    Top = 8
  end
  object dspForn: TDataSetProvider
    DataSet = sqldForn
    Options = [poAllowCommandText]
    Left = 176
    Top = 8
  end
  object cdsForn: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspForn'
    Left = 208
    Top = 8
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
