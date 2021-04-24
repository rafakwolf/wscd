inherited frmVendedor: TfrmVendedor
  Left = 229
  Top = 165
  Width = 691
  Caption = 'frmVendedor'
  ClientWidth = 691
  Font.Name = 'Verdana'
  inherited sbStatus: TStatusBar
    Width = 691
  end
  inherited pnBotoesPadrao: TPanel
    Width = 691
    ClientWidth = 691
    inherited btnNovo: TSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnAlterar: TSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnExcluir: TSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnSalvar: TSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnCancelar: TSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnConsultar: TSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnSair: TSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnPrint: TSpeedButton
      Font.Name = 'Verdana'
    end
  end
  object dbeIdVendedor: TDBEdit[2]
    Left = 80
    Height = 33
    Top = 56
    Width = 97
    DataField = 'IDVENDEDOR'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object dbeVendedor: TDBEdit[3]
    Left = 80
    Height = 33
    Top = 82
    Width = 305
    DataField = 'VENDEDOR'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object dbcbAtivo: TDBCheckBox[4]
    Left = 88
    Height = 25
    Top = 128
    Width = 80
    Caption = 'Ativo'
    DataField = 'ATIVO'
    DataSource = dsPadrao
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    ValueChecked = 'S'
    ValueUnchecked = 'N'
  end
  inherited actlNavigateActions: TActionList[5]
    Left = 184
    Top = 124
  end
  inherited dsPadrao: TDataSource[6]
    DataSet = cdsPadrao
    Left = 439
    Top = 60
  end
  object sqldPadrao: TSQLQuery[7]
    FieldDefs = <>
    Params = <>
    Left = 288
    Top = 124
    object sqldPadraoIDVENDEDOR: TIntegerField
      FieldKind = fkData
      FieldName = 'IDVENDEDOR'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object sqldPadraoVENDEDOR: TStringField
      FieldKind = fkData
      FieldName = 'VENDEDOR'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoATIVO: TStringField
      FieldKind = fkData
      FieldName = 'ATIVO'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
  end
  object dspPadrao: TTimer[8]
    Left = 376
    Top = 124
  end
  object cdsPadrao: TMemDataset[9]
    FieldDefs = <>
    AfterInsert = cdsPadraoAfterInsert
    AfterScroll = cdsPadraoAfterScroll
    Left = 448
    Top = 124
    object cdsPadraoIDVENDEDOR: TIntegerField
      FieldKind = fkData
      FieldName = 'IDVENDEDOR'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object cdsPadraoVENDEDOR: TStringField
      FieldKind = fkData
      FieldName = 'VENDEDOR'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoATIVO: TStringField
      FieldKind = fkData
      FieldName = 'ATIVO'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
  end
end
