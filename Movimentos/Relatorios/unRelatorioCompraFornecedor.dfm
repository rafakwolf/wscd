inherited frmRelatorioCompraFornecedor: TfrmRelatorioCompraFornecedor
  Left = 232
  Top = 203
  ClientHeight = 103
  ClientWidth = 369
  Caption = 'frmRelatorioCompraFornecedor'
  OldCreateOrder = True
  ExplicitWidth = 385
  ExplicitHeight = 142
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnButtons: TContainerPanel
    Top = 69
    Width = 369
    ExplicitTop = 69
    ExplicitWidth = 369
  end
  object dbeForn: TDBEdit [1]
    Left = 16
    Top = 32
    Width = 323
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
    DataSet = cdsSelecao
    Left = 264
    Top = 0
  end
  object sqldSelecao: TSQLDataSet
    CommandText = 
      'select '#13#10'  CODFORNECEDOR,'#13#10'  FANTAZIA,'#13#10'  CNPJ,'#13#10'  TELEFONE'#13#10'fro' +
      'm FORNECEDORES'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 168
    object sqldSelecaoCODFORNECEDOR: TIntegerField
      FieldName = 'CODFORNECEDOR'
      Required = True
    end
    object sqldSelecaoFANTAZIA: TStringField
      FieldName = 'FANTAZIA'
      Size = 80
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
    Left = 200
  end
  object cdsSelecao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSelecao'
    Left = 232
    object cdsSelecaoCODFORNECEDOR: TIntegerField
      FieldName = 'CODFORNECEDOR'
      Required = True
    end
    object cdsSelecaoFANTAZIA: TStringField
      FieldName = 'FANTAZIA'
      Size = 80
    end
    object cdsSelecaoCNPJ: TStringField
      FieldName = 'CNPJ'
    end
    object cdsSelecaoTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
  end
end
