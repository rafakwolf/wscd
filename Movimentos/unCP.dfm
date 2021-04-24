inherited frmCP: TfrmCP
  Left = 218
  Height = 419
  Width = 720
  Caption = 'frmCP'
  ClientHeight = 419
  ClientWidth = 720
  inherited sbStatus: TStatusBar
    Top = 401
    Width = 720
  end
  inherited pnBotoesPadrao: TPanel
    Width = 720
    ClientWidth = 720
    TabOrder = 12
  end
  object lbStatus: TLabel[2]
    Left = 8
    Height = 15
    Top = 364
    Width = 53
    Caption = 'lbStatus'
    Color = clBtnFace
    Font.CharSet = ANSI_CHARSET
    Font.Name = 'Verdana'
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Transparent = False
  end
  object btnPagar: TBitBtn[3]
    Left = 424
    Height = 25
    Top = 348
    Width = 89
    Caption = 'Pagar'
    OnClick = btnPagarClick
    ParentShowHint = False
    ShowHint = True
    TabOrder = 14
  end
  object btnContas: TBitBtn[4]
    Left = 320
    Height = 25
    Top = 348
    Width = 97
    Caption = 'Contas [F7]'
    OnClick = miContasFornecCorrenteClick
    ParentShowHint = False
    ShowHint = True
    TabOrder = 15
  end
  object dbdVencimento: TDBEdit[5]
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
  object dbdData: TDBEdit[6]
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
  object dbeOrigem: TDBEdit[7]
    Left = 360
    Height = 33
    Top = 208
    Width = 65
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
  object dbeJuros: TDBEdit[8]
    Left = 264
    Height = 33
    Top = 208
    Width = 89
    DataField = 'JURO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
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
  object dbeValor: TDBEdit[10]
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
  object dbeDescricao: TDBEdit[11]
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
  object dbeFornecedor: TDBEdit[12]
    Left = 8
    Height = 33
    Hint = 'Pesquisar < F2 >'
    Top = 64
    Width = 267
    DataField = 'FANTAZIA'
    DataSource = dsPadrao
    ReadOnly = True
    CharCase = ecNormal
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object dbeCompra: TDBEdit[13]
    Left = 432
    Height = 33
    Top = 208
    Width = 81
    DataField = 'COMPRA'
    DataSource = dsPadrao
    ReadOnly = True
    CharCase = ecNormal
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
  end
  object dbeValorAtual: TDBEdit[14]
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
  object dbeConta: TDBEdit[15]
    Left = 304
    Height = 33
    Hint = 'Pesquisar < F2 >'
    Top = 64
    Width = 187
    DataField = 'NOME'
    DataSource = dsPadrao
    ReadOnly = True
    CharCase = ecNormal
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object grpPagamento: TGroupBox[16]
    Left = 8
    Height = 95
    Top = 240
    Width = 505
    Caption = ' Informações de pagamento '
    ClientHeight = 77
    ClientWidth = 503
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
    object dbeDataPagto: TDBEdit
      Left = 8
      Height = 33
      Top = 40
      Width = 89
      DataField = 'DATAPAGTO'
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
      Top = 40
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
    object dbeCapitalPago: TDBEdit
      Left = 200
      Height = 33
      Top = 40
      Width = 89
      DataField = 'CAPITALPAGO'
      DataSource = dsPadrao
      ReadOnly = True
      CharCase = ecNormal
      Color = clBtnFace
      MaxLength = 0
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
    object dbeJuroPago: TDBEdit
      Left = 296
      Height = 33
      Top = 40
      Width = 89
      DataField = 'JUROPAGO'
      DataSource = dsPadrao
      ReadOnly = True
      CharCase = ecNormal
      Color = clBtnFace
      MaxLength = 0
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
    object dbeTotalPago: TDBEdit
      Left = 392
      Height = 33
      Top = 40
      Width = 105
      DataField = 'TOTALPAGO'
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
    Left = 592
    Top = 152
    inherited actPrint: TAction
      OnExecute = actPrintExecute
      ShortCut = 0
    end
    object actContas: TAction[8]
      Category = 'Navigate'
      Caption = 'Contas a pagar por fornecedor'
      OnExecute = actContasExecute
    end
  end
  inherited dsPadrao: TDataSource[18]
    DataSet = cdsPadrao
    Left = 206
    Top = 308
  end
  object sqldPadrao: TSQLQuery[19]
    FieldDefs = <>
    Params = <>
    Left = 111
    Top = 308
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
    object sqldPadraoFORNECEDOR: TIntegerField
      FieldKind = fkData
      FieldName = 'FORNECEDOR'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoFANTAZIA: TStringField
      FieldKind = fkData
      FieldName = 'FANTAZIA'
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
    object sqldPadraoPAGAR: TStringField
      FieldKind = fkData
      FieldName = 'PAGAR'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object sqldPadraoPAGA: TStringField
      FieldKind = fkData
      FieldName = 'PAGA'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object sqldPadraoDATAPAGTO: TDateField
      FieldKind = fkData
      FieldName = 'DATAPAGTO'
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
    object sqldPadraoCOMPRA: TIntegerField
      FieldKind = fkData
      FieldName = 'COMPRA'
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoCAPITALPAGO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'CAPITALPAGO'
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
    object sqldPadraoJUROPAGO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'JUROPAGO'
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
    object sqldPadraoNOME: TStringField
      FieldKind = fkData
      FieldName = 'NOME'
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
    object sqldPadraoTOTALPAGO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'TOTALPAGO'
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
    Left = 143
    Top = 308
  end
  object cdsPadrao: TMemDataset[21]
    FieldDefs = <>
    AfterInsert = cdsPadraoAfterInsert
    AfterScroll = cdsPadraoAfterScroll
    Left = 175
    Top = 308
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
    object cdsPadraoFORNECEDOR: TIntegerField
      FieldKind = fkData
      FieldName = 'FORNECEDOR'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      OnValidate = cdsPadraoFORNECEDORValidate
    end
    object cdsPadraoFANTAZIA: TStringField
      FieldKind = fkData
      FieldName = 'FANTAZIA'
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
    object cdsPadraoPAGAR: TStringField
      FieldKind = fkData
      FieldName = 'PAGAR'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object cdsPadraoPAGA: TStringField
      FieldKind = fkData
      FieldName = 'PAGA'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object cdsPadraoDATAPAGTO: TDateField
      FieldKind = fkData
      FieldName = 'DATAPAGTO'
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
    object cdsPadraoCOMPRA: TIntegerField
      FieldKind = fkData
      FieldName = 'COMPRA'
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
    object cdsPadraoCAPITALPAGO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'CAPITALPAGO'
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
    object cdsPadraoJUROPAGO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'JUROPAGO'
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
    object cdsPadraoNOME: TStringField
      FieldKind = fkData
      FieldName = 'NOME'
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
    object cdsPadraoTOTALPAGO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'TOTALPAGO'
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
  object sqldDeleta: TSQLQuery[22]
    FieldDefs = <>
    Params = <    
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    Left = 552
    Top = 48
  end
end
