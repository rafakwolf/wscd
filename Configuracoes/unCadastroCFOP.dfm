inherited frmCadastroCFOP: TfrmCadastroCFOP
  Width = 664
  Caption = 'frmCadastroCFOP'
  ClientWidth = 664
  Font.Name = 'Verdana'
  inherited sbStatus: TStatusBar
    Width = 664
  end
  inherited pnBotoesPadrao: TPanel
    Width = 664
    ClientWidth = 664
    TabOrder = 3
  end
  object dbeNomeCfop: TDBEdit[2]
    Left = 79
    Height = 33
    Top = 96
    Width = 449
    DataField = 'OPERACAO'
    DataSource = dsPadrao
    CharCase = ecNormal
    Font.CharSet = ANSI_CHARSET
    MaxLength = 0
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object dbeCodCfop: TDBEdit[3]
    Left = 79
    Height = 33
    Top = 56
    Width = 218
    DataField = 'NUMERO'
    DataSource = dsPadrao
    CharCase = ecNormal
    Font.CharSet = ANSI_CHARSET
    MaxLength = 0
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object dbmCfNota: TDBMemo[4]
    Left = 79
    Height = 161
    Top = 136
    Width = 449
    DataField = 'CFNOTA'
    DataSource = dsPadrao
    Font.CharSet = ANSI_CHARSET
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  inherited actlNavigateActions: TActionList[5]
    Left = 128
    Top = 180
    inherited actPrint: TAction
      Hint = 'Listagem'
      OnExecute = actPrintExecute
      ShortCut = 0
    end
  end
  inherited dsPadrao: TDataSource[6]
    DataSet = cdsPadrao
    Left = 447
    Top = 188
  end
  object sqldPadrao: TSQLQuery[7]
    FieldDefs = <>
    Params = <>
    Left = 240
    Top = 172
    object sqldPadraoNUMERO: TStringField
      FieldKind = fkData
      FieldName = 'NUMERO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object sqldPadraoOPERACAO: TStringField
      FieldKind = fkData
      FieldName = 'OPERACAO'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 250
    end
    object sqldPadraoCFNOTA: TStringField
      FieldKind = fkData
      FieldName = 'CFNOTA'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1000
    end
  end
  object dspPadrao: TTimer[8]
    Left = 312
    Top = 180
  end
  object cdsPadrao: TMemDataset[9]
    FieldDefs = <>
    Left = 376
    Top = 180
    object cdsPadraoNUMERO: TStringField
      FieldKind = fkData
      FieldName = 'NUMERO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object cdsPadraoOPERACAO: TStringField
      FieldKind = fkData
      FieldName = 'OPERACAO'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 250
    end
    object cdsPadraoCFNOTA: TStringField
      FieldKind = fkData
      FieldName = 'CFNOTA'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1000
    end
  end
end
