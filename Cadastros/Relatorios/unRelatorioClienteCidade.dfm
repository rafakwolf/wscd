inherited frmRelatorioClienteCidade: TfrmRelatorioClienteCidade
  Height = 324
  Width = 543
  Caption = 'frmRelatorioClienteCidade'
  ClientHeight = 324
  ClientWidth = 543
  inherited pnButtons: TPanel
    Top = 290
    Width = 543
    ClientWidth = 543
  end
  object dbeCidade: TDBEdit[1]
    Left = 16
    Height = 33
    Hint = 'Pesquisar < F2 >'
    Top = 48
    Width = 339
    DataField = 'DESCRICAO'
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
    DataSet = cdsCidade
    Left = 224
  end
  object sqldCidade: TSQLQuery[3]
    FieldDefs = <>
    Params = <>
    Left = 128
    Top = 8
    object sqldCidadeCODCIDADE: TIntegerField
      FieldKind = fkData
      FieldName = 'CODCIDADE'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object sqldCidadeDESCRICAO: TStringField
      FieldKind = fkData
      FieldName = 'DESCRICAO'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 30
    end
  end
  object dspCidade: TTimer[4]
    Left = 160
    Top = 8
  end
  object cdsCidade: TMemDataset[5]
    FieldDefs = <>
    Left = 192
    Top = 8
    object cdsCidadeCODCIDADE: TIntegerField
      FieldKind = fkData
      FieldName = 'CODCIDADE'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object cdsCidadeDESCRICAO: TStringField
      FieldKind = fkData
      FieldName = 'DESCRICAO'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 30
    end
  end
end
