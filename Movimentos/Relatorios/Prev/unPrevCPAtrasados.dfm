inherited frmRelatorioCPAtrasados: TfrmRelatorioCPAtrasados
  Left = 219
  Top = 164
  Caption = 'frmRelatorioCPAtrasados'
  ClientHeight = 144
  ClientWidth = 361
  OldCreateOrder = True
  ExplicitWidth = 377
  ExplicitHeight = 183
  PixelsPerInch = 96
  TextHeight = 13
  object dbeFornecedor: TDBEdit [0]
    Left = 16
    Top = 48
    Width = 321
    Height = 21
    Hint = 'Pesquisar < F2 >'
    Color = clBtnFace
    DataField = 'FANTAZIA'
    DataSource = dsPadrao
    ReadOnly = True
    TabOrder = 1
  end
  inherited pnButtons: TPanel
    Top = 110
    Width = 361
    ExplicitTop = 110
    ExplicitWidth = 361
    inherited btnVisualizar: TBitBtn
      OnClick = btnVisualizarClick
    end
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
