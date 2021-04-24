inherited frmRelatorioCompraFornecedor: TfrmRelatorioCompraFornecedor
  Left = 232
  Top = 203
  Width = 457
  Caption = 'frmRelatorioCompraFornecedor'
  ClientWidth = 457
  inherited pnButtons: TPanel
    Width = 457
    ClientWidth = 457
  end
  object dbeForn: TDBEdit[1]
    Left = 16
    Height = 33
    Hint = 'Pesquisar < F2 >'
    Top = 32
    Width = 323
    DataField = 'FANTAZIA'
    DataSource = dsPadrao
    ReadOnly = True
    CharCase = ecNormal
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  inherited dsPadrao: TDataSource[2]
    DataSet = cdsSelecao
    Left = 264
    Top = 0
  end
  object sqldSelecao: TSQLQuery[3]
    FieldDefs = <>
    Params = <>
    Left = 168
    object sqldSelecaoCODFORNECEDOR: TIntegerField
      FieldKind = fkData
      FieldName = 'CODFORNECEDOR'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object sqldSelecaoFANTAZIA: TStringField
      FieldKind = fkData
      FieldName = 'FANTAZIA'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldSelecaoCNPJ: TStringField
      FieldKind = fkData
      FieldName = 'CNPJ'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldSelecaoTELEFONE: TStringField
      FieldKind = fkData
      FieldName = 'TELEFONE'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
  end
  object dspSelecao: TTimer[4]
    Left = 200
  end
  object cdsSelecao: TMemDataset[5]
    FieldDefs = <>
    Left = 232
    object cdsSelecaoCODFORNECEDOR: TIntegerField
      FieldKind = fkData
      FieldName = 'CODFORNECEDOR'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object cdsSelecaoFANTAZIA: TStringField
      FieldKind = fkData
      FieldName = 'FANTAZIA'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsSelecaoCNPJ: TStringField
      FieldKind = fkData
      FieldName = 'CNPJ'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsSelecaoTELEFONE: TStringField
      FieldKind = fkData
      FieldName = 'TELEFONE'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
  end
end
