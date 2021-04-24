inherited frmCR: TfrmCR
  Left = 219
  Height = 444
  Top = 148
  Width = 754
  Caption = 'frmCR'
  ClientHeight = 444
  ClientWidth = 754
  inherited sbStatus: TStatusBar
    Top = 426
    Width = 754
  end
  inherited pnBotoesPadrao: TPanel
    Width = 754
    ClientWidth = 754
    TabOrder = 12
  end
  object lbStatus: TLabel[2]
    Left = 8
    Height = 15
    Top = 336
    Width = 53
    Caption = 'lbStatus'
    Font.CharSet = ANSI_CHARSET
    Font.Name = 'Verdana'
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object btnReceber: TBitBtn[3]
    Left = 424
    Height = 25
    Top = 328
    Width = 89
    Caption = 'Receber'
    OnClick = btnReceberClick
    ParentShowHint = False
    ShowHint = True
    TabOrder = 15
  end
  object btnContas: TBitBtn[4]
    Left = 320
    Height = 25
    Top = 328
    Width = 97
    Caption = 'Contas [F7]'
    OnClick = miContasClienteCorrenteClick
    ParentShowHint = False
    ShowHint = True
    TabOrder = 14
  end
  object dbeValorAtual: TDBEdit[5]
    Left = 136
    Height = 33
    Top = 208
    Width = 121
    DataField = 'TOTAL'
    DataSource = dsPadrao
    ReadOnly = True
    CharCase = ecNormal
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
  end
  object dbeCliente: TDBEdit[6]
    Left = 8
    Height = 33
    Hint = 'Pesquisar < F2 >'
    Top = 64
    Width = 267
    DataField = 'NOME'
    DataSource = dsPadrao
    ReadOnly = True
    CharCase = ecNormal
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object dbeDescricao: TDBEdit[7]
    Left = 8
    Height = 33
    Top = 112
    Width = 505
    DataField = 'DESCRICAO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnEnter = dbeDescricaoEnter
  end
  object dbeValor: TDBEdit[8]
    Left = 8
    Height = 33
    Top = 208
    Width = 121
    DataField = 'VALOR'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
  end
  object dbeDocumento: TDBEdit[9]
    Left = 328
    Height = 33
    Top = 160
    Width = 185
    DataField = 'DOCUMENTO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
  end
  object dbeJuros: TDBEdit[10]
    Left = 264
    Height = 33
    Top = 208
    Width = 73
    DataField = 'JURO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
  end
  object dbeOrigem: TDBEdit[11]
    Left = 344
    Height = 33
    Top = 208
    Width = 73
    DataField = 'ORIGEM'
    DataSource = dsPadrao
    ReadOnly = True
    CharCase = ecNormal
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
  end
  object dbdData: TDBEdit[12]
    Left = 8
    Height = 33
    Top = 160
    Width = 153
    DataField = 'DATA'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object dbdVencimento: TDBEdit[13]
    Left = 168
    Height = 33
    Top = 160
    Width = 153
    DataField = 'VENCIMENTO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
  object dbeVenda: TDBEdit[14]
    Left = 424
    Height = 33
    Top = 208
    Width = 89
    DataField = 'VENDA'
    DataSource = dsPadrao
    ReadOnly = True
    CharCase = ecNormal
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
  end
  object dbeConta: TDBEdit[15]
    Left = 304
    Height = 33
    Hint = 'Pesquisar < F2 >'
    Top = 64
    Width = 187
    DataField = 'CONTA'
    DataSource = dsPadrao
    ReadOnly = True
    CharCase = ecNormal
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object grpRecebimento: TGroupBox[16]
    Left = 8
    Height = 81
    Top = 240
    Width = 505
    Caption = ' Informações de recebimento '
    ClientHeight = 63
    ClientWidth = 503
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
    object dbeDataRecdo: TDBEdit
      Left = 8
      Height = 33
      Top = 14
      Width = 89
      DataField = 'DATARECTO'
      DataSource = dsPadrao
      ReadOnly = True
      CharCase = ecNormal
      Color = clBtnFace
      MaxLength = 0
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object dbeDesconto: TDBEdit
      Left = 104
      Height = 33
      Top = 14
      Width = 89
      DataField = 'DESCTO'
      DataSource = dsPadrao
      ReadOnly = True
      CharCase = ecNormal
      Color = clBtnFace
      MaxLength = 0
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object dbeCapitalRecdo: TDBEdit
      Left = 200
      Height = 33
      Top = 14
      Width = 89
      DataField = 'CAPITALRECDO'
      DataSource = dsPadrao
      ReadOnly = True
      CharCase = ecNormal
      Color = clBtnFace
      MaxLength = 0
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
    object dbeJuroRecdo: TDBEdit
      Left = 296
      Height = 33
      Top = 14
      Width = 89
      DataField = 'JURORECDO'
      DataSource = dsPadrao
      ReadOnly = True
      CharCase = ecNormal
      Color = clBtnFace
      MaxLength = 0
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
    object dbeTotalRecdo: TDBEdit
      Left = 392
      Height = 33
      Top = 14
      Width = 105
      DataField = 'TOTALRECDO'
      DataSource = dsPadrao
      ReadOnly = True
      CharCase = ecNormal
      Color = clBtnFace
      MaxLength = 0
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
    end
  end
  inherited actlNavigateActions: TActionList[17]
    Left = 608
    Top = 168
    inherited actPrint: TAction
      Hint = 'Relatório para cliente'
      OnExecute = actPrintExecute
      ShortCut = 0
    end
    object actContasReceber: TAction[8]
      Category = 'Navigate'
      Caption = 'Contas a receber por cliente'
      OnExecute = actContasReceberExecute
    end
  end
  inherited dsPadrao: TDataSource[18]
    DataSet = cdsPadrao
    Left = 205
    Top = 315
  end
  object sqldPadrao: TSQLQuery[19]
    FieldDefs = <>
    Params = <>
    Left = 110
    Top = 315
    object sqldPadraoCODIGO: TIntegerField
      FieldKind = fkData
      FieldName = 'CODIGO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = False
      Required = True
    end
    object sqldPadraoDATA: TDateField
      FieldKind = fkData
      FieldName = 'DATA'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoVENCIMENTO: TDateField
      FieldKind = fkData
      FieldName = 'VENCIMENTO'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoCLIENTE: TIntegerField
      FieldKind = fkData
      FieldName = 'CLIENTE'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoNOME: TStringField
      FieldKind = fkData
      FieldName = 'NOME'
      Index = 4
      LookupCache = False
      ProviderFlags = []
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoDESCRICAO: TStringField
      FieldKind = fkData
      FieldName = 'DESCRICAO'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoDOCUMENTO: TStringField
      FieldKind = fkData
      FieldName = 'DOCUMENTO'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoVALOR: TFMTBCDField
      FieldKind = fkData
      FieldName = 'VALOR'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object sqldPadraoJURO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'JURO'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object sqldPadraoRECEBER: TStringField
      FieldKind = fkData
      FieldName = 'RECEBER'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object sqldPadraoRECDA: TStringField
      FieldKind = fkData
      FieldName = 'RECDA'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object sqldPadraoDATARECTO: TDateField
      FieldKind = fkData
      FieldName = 'DATARECTO'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoORIGEM: TIntegerField
      FieldKind = fkData
      FieldName = 'ORIGEM'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoVENDA: TIntegerField
      FieldKind = fkData
      FieldName = 'VENDA'
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoCAPITALRECDO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'CAPITALRECDO'
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object sqldPadraoJURORECDO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'JURORECDO'
      Index = 15
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object sqldPadraoDESCTO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'DESCTO'
      Index = 16
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object sqldPadraoOBS: TMemoField
      FieldKind = fkData
      FieldName = 'OBS'
      Index = 17
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      BlobType = ftMemo
      Size = 1
      Transliterate = False
    end
    object sqldPadraoATRASO: TIntegerField
      FieldKind = fkData
      FieldName = 'ATRASO'
      Index = 18
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoIDCONTA: TIntegerField
      FieldKind = fkData
      FieldName = 'IDCONTA'
      Index = 19
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoCONTA: TStringField
      FieldKind = fkData
      FieldName = 'CONTA'
      Index = 20
      LookupCache = False
      ProviderFlags = []
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoVALORJURO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'VALORJURO'
      Index = 21
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object sqldPadraoTOTAL: TFMTBCDField
      FieldKind = fkData
      FieldName = 'TOTAL'
      Index = 22
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object sqldPadraoTOTALRECDO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'TOTALRECDO'
      Index = 23
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
  end
  object dspPadrao: TTimer[20]
    Left = 142
    Top = 315
  end
  object cdsPadrao: TMemDataset[21]
    FieldDefs = <>
    AfterInsert = cdsPadraoAfterInsert
    AfterScroll = cdsPadraoAfterScroll
    Left = 174
    Top = 315
    object cdsPadraoCODIGO: TIntegerField
      FieldKind = fkData
      FieldName = 'CODIGO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = False
      Required = True
    end
    object cdsPadraoDATA: TDateField
      FieldKind = fkData
      FieldName = 'DATA'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoVENCIMENTO: TDateField
      FieldKind = fkData
      FieldName = 'VENCIMENTO'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoCLIENTE: TIntegerField
      FieldKind = fkData
      FieldName = 'CLIENTE'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      OnValidate = cdsPadraoCLIENTEValidate
    end
    object cdsPadraoNOME: TStringField
      FieldKind = fkData
      FieldName = 'NOME'
      Index = 4
      LookupCache = False
      ProviderFlags = []
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoDESCRICAO: TStringField
      FieldKind = fkData
      FieldName = 'DESCRICAO'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoDOCUMENTO: TStringField
      FieldKind = fkData
      FieldName = 'DOCUMENTO'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoRECEBER: TStringField
      FieldKind = fkData
      FieldName = 'RECEBER'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object cdsPadraoRECDA: TStringField
      FieldKind = fkData
      FieldName = 'RECDA'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object cdsPadraoDATARECTO: TDateField
      FieldKind = fkData
      FieldName = 'DATARECTO'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoORIGEM: TIntegerField
      FieldKind = fkData
      FieldName = 'ORIGEM'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoVENDA: TIntegerField
      FieldKind = fkData
      FieldName = 'VENDA'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoOBS: TMemoField
      FieldKind = fkData
      FieldName = 'OBS'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      BlobType = ftMemo
      Size = 1
      Transliterate = False
    end
    object cdsPadraoATRASO: TIntegerField
      FieldKind = fkData
      FieldName = 'ATRASO'
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoVALOR: TFMTBCDField
      FieldKind = fkData
      FieldName = 'VALOR'
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object cdsPadraoJURO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'JURO'
      Index = 15
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object cdsPadraoCAPITALRECDO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'CAPITALRECDO'
      Index = 16
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object cdsPadraoJURORECDO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'JURORECDO'
      Index = 17
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object cdsPadraoDESCTO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'DESCTO'
      Index = 18
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object cdsPadraoIDCONTA: TIntegerField
      FieldKind = fkData
      FieldName = 'IDCONTA'
      Index = 19
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      OnValidate = cdsPadraoIDCONTAValidate
    end
    object cdsPadraoCONTA: TStringField
      FieldKind = fkData
      FieldName = 'CONTA'
      Index = 20
      LookupCache = False
      ProviderFlags = []
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoVALORJURO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'VALORJURO'
      Index = 21
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object cdsPadraoTOTAL: TFMTBCDField
      FieldKind = fkData
      FieldName = 'TOTAL'
      Index = 22
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object cdsPadraoTOTALRECDO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'TOTALRECDO'
      Index = 23
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
  end
  object sqlLimite: TSQLQuery[22]
    FieldDefs = <>
    Params = <    
      item
        DataType = ftString
        Name = 'CLIENTE'
        ParamType = ptInput
      end>
    Left = 600
    Top = 72
    object sqlLimiteTOTAL_CONTAS: TFloatField
      FieldKind = fkData
      FieldName = 'TOTAL_CONTAS'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
  end
  object sqldDeleta: TSQLQuery[23]
    FieldDefs = <>
    Params = <    
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    Left = 248
    Top = 320
  end
end
