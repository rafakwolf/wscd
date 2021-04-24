inherited frmDuplicatas: TfrmDuplicatas
  Left = 221
  Height = 546
  Top = 117
  Width = 740
  Caption = 'frmDuplicatas'
  ClientHeight = 546
  ClientWidth = 740
  inherited sbStatus: TStatusBar
    Top = 528
    Width = 740
  end
  inherited pnBotoesPadrao: TPanel
    Width = 740
    ClientWidth = 740
    TabOrder = 21
  end
  object lbDuplicata: TLabel[2]
    Left = 32
    Height = 13
    Top = 56
    Width = 656
    AutoSize = False
    Caption = 'Duplicata---------------------------------------------------------------------------------------------------------------------'
    Font.CharSet = ANSI_CHARSET
    Font.Name = 'Verdana'
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object dbeDataEmissao: TDBEdit[3]
    Left = 280
    Height = 33
    Top = 84
    Width = 121
    DataField = 'DATAEMISSAO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object dbeCidade: TDBEdit[4]
    Left = 144
    Height = 33
    Hint = 'Pesquisar < F2 >'
    Top = 412
    Width = 315
    DataField = 'NOMECIDADE'
    DataSource = dsPadrao
    ReadOnly = True
    CharCase = ecNormal
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 18
  end
  object dbeDataPag: TDBEdit[5]
    Left = 400
    Height = 33
    Top = 148
    Width = 129
    DataField = 'DATADESCTO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
  end
  object dbeDataVenc: TDBEdit[6]
    Left = 408
    Height = 33
    Top = 84
    Width = 121
    DataField = 'DATAVENC'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object dbeValor: TDBEdit[7]
    Left = 144
    Height = 33
    Top = 148
    Width = 121
    DataField = 'VALOR'
    DataSource = dsPadrao
    CharCase = ecNormal
    Color = clInactiveCaption
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnExit = dbeValorExit
  end
  object dbeDesconto: TDBEdit[8]
    Left = 272
    Height = 33
    Top = 148
    Width = 121
    DataField = 'DESCONTO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnExit = dbeDescontoExit
  end
  object dbeValorFatura: TDBEdit[9]
    Left = 144
    Height = 33
    Top = 84
    Width = 121
    DataField = 'VALOR_FATURA'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object dbeNroDuplicata: TDBEdit[10]
    Left = 16
    Height = 33
    Top = 148
    Width = 121
    DataField = 'NRODUPLICATA'
    DataSource = dsPadrao
    CharCase = ecNormal
    Color = 8454143
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
  object dbeNroFatura: TDBEdit[11]
    Left = 16
    Height = 33
    Top = 84
    Width = 121
    DataField = 'NROFATURA'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object dbeValorExtenso: TDBEdit[12]
    Left = 16
    Height = 33
    Top = 188
    Width = 513
    DataField = 'VALOREXTENSO'
    DataSource = dsPadrao
    ReadOnly = True
    CharCase = ecNormal
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
  end
  object dbeSacado: TDBEdit[13]
    Left = 16
    Height = 33
    Top = 292
    Width = 513
    DataField = 'SACADO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
  end
  object dbeCpfCnpj: TDBEdit[14]
    Left = 16
    Height = 33
    Top = 332
    Width = 161
    DataField = 'CPF_CNPJ'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
  end
  object dbeRgIe: TDBEdit[15]
    Left = 184
    Height = 33
    Top = 332
    Width = 161
    DataField = 'IE'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
  end
  object dbeFoneFax: TDBEdit[16]
    Left = 352
    Height = 33
    Top = 332
    Width = 177
    DataField = 'FONEFAX'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 14
  end
  object dbeCep: TDBEdit[17]
    Left = 16
    Height = 33
    Top = 372
    Width = 121
    DataField = 'CEP'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 15
  end
  object dbeEndereco: TDBEdit[18]
    Left = 144
    Height = 33
    Top = 372
    Width = 385
    DataField = 'ENDERECO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 16
  end
  object dbeBairro: TDBEdit[19]
    Left = 16
    Height = 33
    Top = 412
    Width = 121
    DataField = 'BAIRRO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 17
  end
  object dbeEstado: TDBEdit[20]
    Left = 465
    Height = 33
    Top = 412
    Width = 64
    DataField = 'UF'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 19
  end
  object dbePracaPagamento: TDBEdit[21]
    Left = 16
    Height = 33
    Top = 476
    Width = 513
    DataField = 'PRACAPAGAMENTO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 20
  end
  object dbeDataImpressao: TDBEdit[22]
    Left = 16
    Height = 33
    Top = 228
    Width = 113
    DataField = 'DATAIMPRESSAO'
    DataSource = dsPadrao
    ReadOnly = True
    CharCase = ecNormal
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
  end
  object dbeImpressa: TDBEdit[23]
    Left = 136
    Height = 33
    Top = 228
    Width = 57
    DataField = 'IMPRESSA'
    DataSource = dsPadrao
    ReadOnly = True
    CharCase = ecNormal
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
  end
  inherited actlNavigateActions: TActionList[24]
    Left = 496
    Top = 240
    inherited actPrint: TAction
      Hint = 'Imprimir em formulário pré-impresso'
      OnExecute = actPrintExecute
      ShortCut = 0
    end
  end
  inherited dsPadrao: TDataSource[25]
    DataSet = cdsPadrao
    Left = 359
    Top = 229
  end
  object cdsPadrao: TMemDataset[26]
    FieldDefs = <>
    AfterInsert = cdsPadraoAfterInsert
    OnNewRecord = cdsPadraoNewRecord
    Left = 272
    Top = 229
    object cdsPadraoIDDUPLICATA: TIntegerField
      FieldKind = fkData
      FieldName = 'IDDUPLICATA'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object cdsPadraoNRODUPLICATA: TStringField
      FieldKind = fkData
      FieldName = 'NRODUPLICATA'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoSACADO: TStringField
      FieldKind = fkData
      FieldName = 'SACADO'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoCPF_CNPJ: TStringField
      FieldKind = fkData
      FieldName = 'CPF_CNPJ'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoENDERECO: TStringField
      FieldKind = fkData
      FieldName = 'ENDERECO'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoBAIRRO: TStringField
      FieldKind = fkData
      FieldName = 'BAIRRO'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoCEP: TStringField
      FieldKind = fkData
      FieldName = 'CEP'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
    object cdsPadraoIDCIDADE: TIntegerField
      FieldKind = fkData
      FieldName = 'IDCIDADE'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      OnValidate = cdsPadraoIDCIDADEValidate
    end
    object cdsPadraoNOMECIDADE: TStringField
      FieldKind = fkData
      FieldName = 'NOMECIDADE'
      Index = 8
      LookupCache = False
      ProviderFlags = []
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoFONEFAX: TStringField
      FieldKind = fkData
      FieldName = 'FONEFAX'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoUF: TStringField
      FieldKind = fkData
      FieldName = 'UF'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 2
    end
    object cdsPadraoIE: TStringField
      FieldKind = fkData
      FieldName = 'IE'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoDATAEMISSAO: TDateField
      FieldKind = fkData
      FieldName = 'DATAEMISSAO'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoNROFATURA: TStringField
      FieldKind = fkData
      FieldName = 'NROFATURA'
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoVALOR_FATURA: TFMTBCDField
      FieldKind = fkData
      FieldName = 'VALOR_FATURA'
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '#,##0.00'
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object cdsPadraoVALOR: TFMTBCDField
      FieldKind = fkData
      FieldName = 'VALOR'
      Index = 15
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '#,##0.00'
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object cdsPadraoDATAVENC: TDateField
      FieldKind = fkData
      FieldName = 'DATAVENC'
      Index = 16
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoDESCONTO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'DESCONTO'
      Index = 17
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '#,##0.00'
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object cdsPadraoPRACAPAGAMENTO: TStringField
      FieldKind = fkData
      FieldName = 'PRACAPAGAMENTO'
      Index = 18
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 250
    end
    object cdsPadraoDATADESCTO: TDateField
      FieldKind = fkData
      FieldName = 'DATADESCTO'
      Index = 19
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoVALOREXTENSO: TStringField
      FieldKind = fkData
      FieldName = 'VALOREXTENSO'
      Index = 20
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 250
    end
    object cdsPadraoDATAIMPRESSAO: TDateField
      FieldKind = fkData
      FieldName = 'DATAIMPRESSAO'
      Index = 21
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoIMPRESSA: TStringField
      FieldKind = fkData
      FieldName = 'IMPRESSA'
      Index = 22
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
  end
end
