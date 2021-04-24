inherited frmRelatorioFaturamento: TfrmRelatorioFaturamento
  Width = 460
  Caption = 'frmRelatorioFaturamento'
  ClientWidth = 460
  inherited pnButtons: TPanel
    Width = 460
    ClientWidth = 460
  end
  object chkLucro: TCheckBox[1]
    Left = 32
    Height = 23
    Top = 104
    Width = 209
    Caption = 'Mostrar porcentagem de lucro'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object chkCusto: TCheckBox[2]
    Left = 24
    Height = 23
    Top = 64
    Width = 166
    Caption = 'Mostrar preço de custo'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object dbeForn: TDBEdit[3]
    Left = 16
    Height = 33
    Hint = 'Pesquisar < F2 >'
    Top = 24
    Width = 371
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
  inherited dsPadrao: TDataSource[4]
    DataSet = cdsForn
    Left = 360
    Top = 56
  end
  object sqldForn: TSQLQuery[5]
    FieldDefs = <>
    Params = <>
    Left = 264
    Top = 56
    object sqldFornCODFORNECEDOR: TIntegerField
      FieldKind = fkData
      FieldName = 'CODFORNECEDOR'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object sqldFornFANTAZIA: TStringField
      FieldKind = fkData
      FieldName = 'FANTAZIA'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 40
    end
    object sqldFornCNPJ: TStringField
      FieldKind = fkData
      FieldName = 'CNPJ'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object sqldFornTELEFONE: TStringField
      FieldKind = fkData
      FieldName = 'TELEFONE'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
  end
  object dspForn: TTimer[6]
    Left = 296
    Top = 56
  end
  object cdsForn: TMemDataset[7]
    FieldDefs = <>
    Left = 328
    Top = 56
    object cdsFornCODFORNECEDOR: TIntegerField
      FieldKind = fkData
      FieldName = 'CODFORNECEDOR'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object cdsFornFANTAZIA: TStringField
      FieldKind = fkData
      FieldName = 'FANTAZIA'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 40
    end
    object cdsFornCNPJ: TStringField
      FieldKind = fkData
      FieldName = 'CNPJ'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object cdsFornTELEFONE: TStringField
      FieldKind = fkData
      FieldName = 'TELEFONE'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
  end
end
