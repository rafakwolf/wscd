inherited frmCadastroCaixa: TfrmCadastroCaixa
  Left = 213
  Width = 624
  Caption = 'frmCadastroCaixa'
  ClientWidth = 624
  Font.Name = 'Verdana'
  inherited sbStatus: TStatusBar
    Width = 624
  end
  inherited pnBotoesPadrao: TPanel
    Width = 624
    ClientWidth = 624
    TabOrder = 3
    inherited btnConsultar: TSpeedButton
      Left = 253
      Width = 65
    end
    inherited btnSair: TSpeedButton
      Left = 378
      Width = 53
    end
    inherited btnPrint: TSpeedButton
      Left = 319
      Width = 59
    end
  end
  object dbeNomeCaixa: TDBEdit[2]
    Left = 64
    Height = 33
    Top = 104
    Width = 305
    DataField = 'NOME'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object dbeCodCaixa: TDBEdit[3]
    Left = 64
    Height = 33
    Top = 57
    Width = 121
    DataField = 'CODIGO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object dbchkInativo: TDBCheckBox[4]
    Left = 56
    Height = 17
    Top = 152
    Width = 87
    Caption = 'Inativo'
    DataField = 'INATIVO'
    DataSource = dsPadrao
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    ValueChecked = 'S'
    ValueUnchecked = 'N'
  end
  inherited actlNavigateActions: TActionList[5]
    Left = 208
    Top = 36
  end
  inherited dsPadrao: TDataSource[6]
    DataSet = cdsPadrao
    Left = 471
    Top = 36
  end
  object sqldPadrao: TSQLQuery[7]
    FieldDefs = <>
    Params = <>
    Left = 280
    Top = 20
    object sqldPadraoCODIGO: TIntegerField
      FieldKind = fkData
      FieldName = 'CODIGO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = False
      Required = True
    end
    object sqldPadraoNOME: TStringField
      FieldKind = fkData
      FieldName = 'NOME'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoINATIVO: TStringField
      FieldKind = fkData
      FieldName = 'INATIVO'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
  end
  object dspPadrao: TTimer[8]
    Left = 344
    Top = 44
  end
  object cdsPadrao: TMemDataset[9]
    FieldDefs = <>
    AfterInsert = cdsPadraoAfterInsert
    AfterScroll = cdsPadraoAfterScroll
    Left = 408
    Top = 92
    object cdsPadraoCODIGO: TIntegerField
      FieldKind = fkData
      FieldName = 'CODIGO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = False
      Required = True
    end
    object cdsPadraoNOME: TStringField
      FieldKind = fkData
      FieldName = 'NOME'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoINATIVO: TStringField
      FieldKind = fkData
      FieldName = 'INATIVO'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
  end
end
