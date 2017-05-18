inherited frmRelatorioCPFornecedor: TfrmRelatorioCPFornecedor
  Caption = 'frmRelatorioCPFornecedor'
  ClientHeight = 144
  ClientWidth = 385
  OldCreateOrder = True
  ExplicitWidth = 401
  ExplicitHeight = 183
  PixelsPerInch = 96
  TextHeight = 13
  object dbeForn: TDBEdit [0]
    Left = 16
    Top = 48
    Width = 339
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
    Width = 385
    ExplicitTop = 110
    ExplicitWidth = 385
    inherited btnVisualizar: TBitBtn
      OnClick = btnVisualizarClick
    end
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsSelecao
    Left = 240
  end
  object sqldSelecao: TSQLDataSet
    CommandText = 
      'select '#13#10'  CODFORNECEDOR,'#13#10'  FANTAZIA,'#13#10'  CNPJ,'#13#10'  TELEFONE'#13#10'fro' +
      'm FORNECEDORES'#13#10'order by FANTAZIA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 144
    Top = 8
    object sqldSelecaoCODFORNECEDOR: TIntegerField
      FieldName = 'CODFORNECEDOR'
      Required = True
    end
    object sqldSelecaoFANTAZIA: TStringField
      FieldName = 'FANTAZIA'
      Size = 40
    end
    object sqldSelecaoCNPJ: TStringField
      FieldName = 'CNPJ'
    end
    object sqldSelecaoTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
  end
  object dspSelecao: TDataSetProvider
    DataSet = sqldSelecao
    Options = [poAllowCommandText]
    Left = 176
    Top = 8
  end
  object cdsSelecao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSelecao'
    Left = 208
    Top = 8
    object cdsSelecaoCODFORNECEDOR: TIntegerField
      FieldName = 'CODFORNECEDOR'
      Required = True
    end
    object cdsSelecaoFANTAZIA: TStringField
      FieldName = 'FANTAZIA'
      Size = 40
    end
    object cdsSelecaoCNPJ: TStringField
      FieldName = 'CNPJ'
    end
    object cdsSelecaoTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
  end
end
