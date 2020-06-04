inherited frmRelatorioProdutoVencimento: TfrmRelatorioProdutoVencimento
  ClientHeight = 298
  ClientWidth = 433
  Caption = 'frmRelatorioProdutoVencimento'
  OldCreateOrder = True
  ExplicitWidth = 449
  ExplicitHeight = 337
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnButtons: TContainerPanel
    Top = 264
    Width = 433
    ExplicitTop = 264
    ExplicitWidth = 433
  end
  object dbdDataVenc: TDBEdit [1]
    Left = 84
    Top = 104
    Width = 319
    Height = 21
    Hint = 'Produtos vencidos '#13#10'apartir desta data...'
    ShowHint = True
    DataField = 'DATA'
    DataSource = dsPadrao
    TabOrder = 2
  end
  object dbeUnidade: TDBEdit [2]
    Left = 84
    Top = 131
    Width = 319
    Height = 21
    Hint = 'Pesquisar < F2 >'
    ShowHint = True
    DataField = 'DESCRICAO'
    DataSource = dsUnidade
    TabOrder = 3
    Color = clBtnFace
    ReadOnly = True
  end
  object dbeForn: TDBEdit [3]
    Left = 84
    Top = 160
    Width = 319
    Height = 21
    Hint = 'Pesquisar < F2 >'
    ShowHint = True
    DataField = 'FANTAZIA'
    DataSource = dsForn
    TabOrder = 4
    Color = clBtnFace
    ReadOnly = True
  end
  object dbeGrupo: TDBEdit [4]
    Left = 84
    Top = 189
    Width = 319
    Height = 21
    Hint = 'Pesquisar < F2 >'
    ShowHint = True
    DataField = 'DESCRICAO'
    DataSource = dsGrupo
    TabOrder = 5
    Color = clBtnFace
    ReadOnly = True
  end
  object rgTipo: TRadioGroup [5]
    Left = 16
    Top = 16
    Width = 409
    Height = 81
    Hint = ''
    ShowHint = True
    Items.Strings = (
      'Todos'
      'Por Unidade de Venda'
      'Por Fornecedor'
      'Por Grupo')
    ItemIndex = 1
    Caption = ' Tipo de Relat'#243'rio '
    TabOrder = 1
    TabStop = False
    OnClick = rgTipoClick
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsSelecao
    Left = 312
    Top = 64
  end
  object sqldSelecao: TSQLDataSet
    CommandText = 'select'#13#10'  cast(NULL as TIMESTAMP) DATA'#13#10'from RDB$DATABASE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 216
    Top = 64
    object sqldSelecaoDATA: TSQLTimeStampField
      FieldName = 'DATA'
    end
  end
  object dspSelecao: TDataSetProvider
    DataSet = sqldSelecao
    Left = 248
    Top = 64
  end
  object cdsSelecao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSelecao'
    Left = 280
    Top = 64
    object cdsSelecaoDATA: TSQLTimeStampField
      FieldName = 'DATA'
    end
  end
  object sqldUnidade: TSQLDataSet
    CommandText = 'select * from UNIDADES'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 8
    Top = 216
  end
  object dspUnidade: TDataSetProvider
    DataSet = sqldUnidade
    Left = 40
    Top = 216
  end
  object cdsUnidade: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUnidade'
    Left = 72
    Top = 216
    object cdsUnidadeCODUNIDADE: TIntegerField
      FieldName = 'CODUNIDADE'
      Required = True
    end
    object cdsUnidadeDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 10
    end
  end
  object sqldForn: TSQLDataSet
    CommandText = 
      'select '#13#10'  CODFORNECEDOR,'#13#10'  FANTAZIA,'#13#10'  CNPJ,'#13#10'  TELEFONE'#13#10'fro' +
      'm FORNECEDORES'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 296
    Top = 216
    object sqldFornCODFORNECEDOR: TIntegerField
      FieldName = 'CODFORNECEDOR'
      Required = True
    end
    object sqldFornFANTAZIA: TStringField
      FieldName = 'FANTAZIA'
      Size = 80
    end
    object sqldFornCNPJ: TStringField
      FieldName = 'CNPJ'
    end
    object sqldFornTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
  end
  object dspForn: TDataSetProvider
    DataSet = sqldForn
    Left = 328
    Top = 216
  end
  object cdsForn: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspForn'
    Left = 360
    Top = 216
    object cdsFornCODFORNECEDOR: TIntegerField
      FieldName = 'CODFORNECEDOR'
      Required = True
    end
    object cdsFornFANTAZIA: TStringField
      FieldName = 'FANTAZIA'
      Size = 80
    end
    object cdsFornCNPJ: TStringField
      FieldName = 'CNPJ'
    end
    object cdsFornTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
  end
  object sqldGrupo: TSQLDataSet
    CommandText = 'select * from GRUPOS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 152
    Top = 216
  end
  object dspGrupo: TDataSetProvider
    DataSet = sqldGrupo
    Left = 184
    Top = 216
  end
  object cdsGrupo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGrupo'
    Left = 216
    Top = 216
    object cdsGrupoCODGRUPO: TIntegerField
      FieldName = 'CODGRUPO'
      Required = True
    end
    object cdsGrupoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 30
    end
  end
  object dsUnidade: TDataSource
    DataSet = cdsUnidade
    Left = 104
    Top = 216
  end
  object dsGrupo: TDataSource
    DataSet = cdsGrupo
    Left = 248
    Top = 216
  end
  object dsForn: TDataSource
    DataSet = cdsForn
    Left = 392
    Top = 216
  end
end
