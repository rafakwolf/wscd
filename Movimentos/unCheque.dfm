inherited frmCheque: TfrmCheque
  Left = 217
  Height = 401
  Top = 139
  Width = 648
  Caption = 'frmCheque'
  ClientHeight = 401
  ClientWidth = 648
  inherited sbStatus: TStatusBar
    Top = 383
    Width = 648
  end
  inherited pnBotoesPadrao: TPanel
    Width = 648
    ClientWidth = 648
    TabOrder = 15
  end
  object lbBaixado: TLabel[2]
    Left = 147
    Height = 15
    Top = 227
    Width = 60
    Caption = 'lbBaixado'
    Font.CharSet = ANSI_CHARSET
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object btnBaixar: TBitBtn[3]
    Left = 440
    Height = 25
    Top = 220
    Width = 81
    Action = actBaixar
    Glyph.Data = {
      36060000424D3606000000000000360000002800000020000000100000000100
      18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      000D6C000D68000C5D000A53000A4F000A4F000A4F000A4F000A4F000A4F000A
      4F000840FF00FFFF00FFFF00FFFF00FF9898989797979494949191918F8F8F8F
      8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8B8B8BFF00FFFF00FFFF00FF001397
      0017BB0016B40015AA0013A00013990013970013970013990013990013970013
      9E000F7B000840FF00FFFF00FFA3A3A3ACACACAAAAAAA8A8A8A6A6A6A4A4A4A3
      A3A3A3A3A3A4A4A4A4A4A4A3A3A3A5A5A59C9C9C8B8B8BFF00FFFF00FF0017B8
      001CE3001AD40019CC0018C50017BB0016B10016AF0016AF0016AF0016AF0016
      B600139E000A4FFF00FFFF00FFACACACB6B6B6B2B2B2B0B0B0AFAFAFACACACAA
      AAAAA9A9A9A9A9A9A9A9A9A9A9A9ABABABA5A5A58F8F8FFF00FFFF00FF0018C7
      001EF0001CE1001AD10018C70018C00016B60016AF0015AA0015A70014A50016
      AF001399000A51FF00FFFF00FFAFAFAFB9B9B9B5B5B5B2B2B2AFAFAFADADADAB
      ABABA9A9A9A8A8A8A7A7A7A7A7A7A9A9A9A4A4A4909090FF00FFFF00FF0018CA
      0224FF001FF6001CE3001AD40018CAFFFFFFFFFFFF0016B10015AA0015A70016
      AF001399000A4FFF00FFFF00FFB0B0B0BEBEBEBABABAB6B6B6B2B2B2B0B0B0FF
      FFFFFFFFFFAAAAAAA8A8A8A7A7A7A9A9A9A4A4A48F8F8FFF00FFFF00FF0018CA
      163BFF0629FF001FF6001CE3FEFEFEFFFFFFFFFFFFFFFFFF0016B40015AC0016
      AF001399000A4FFF00FFFF00FFB0B0B0C8C8C8C1C1C1BABABAB6B6B6FFFFFFFF
      FFFFFFFFFFFFFFFFAAAAAAA9A9A9A9A9A9A4A4A48F8F8FFF00FFFF00FF0018CA
      3559FF0F35FF0121FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0017B80016
      B600139C000A51FF00FFFF00FFB0B0B0D4D4D4C5C5C5BDBDBDFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFACACACABABABA4A4A4909090FF00FFFF00FF0018CA
      4E6EFF193FFFFFFFFFFFFFFFFFFFFF001CE6001CDEFFFFFFFFFFFFFFFFFF0018
      C00014A3000B59FF00FFFF00FFB0B0B0DCDCDCCACACAFFFFFFFFFFFFFFFFFFB6
      B6B6B5B5B5FFFFFFFFFFFFFFFFFFADADADA6A6A6929292FF00FFFF00FF0018CA
      5A79FF2146FFFFFFFFFFFFFF001EF0001DEE001DEB001CE1FFFFFFFFFFFF0019
      CC0016B1000D6AFF00FFFF00FFB0B0B0DFDFDFCDCDCDFFFFFFFFFFFFB9B9B9B8
      B8B8B8B8B8B5B5B5FFFFFFFFFFFFB0B0B0AAAAAA979797FF00FFFF00FF0018CA
      6783FF2D51FF1338FF0D31FF0325FF001FFF001FF8001DEE001CE6001CDE001B
      D90017BD000F79FF00FFFF00FFB0B0B0E3E3E3D1D1D1C7C7C7C4C4C4BFBFBFBC
      BCBCBBBBBBB8B8B8B6B6B6B5B5B5B3B3B3ADADAD9B9B9BFF00FFFF00FF0018CA
      7690FF4163FF1B40FF163BFF0C30FF0528FF0427FF001FFF001EF0001CE9001C
      E60018C7001187FF00FFFF00FFB0B0B0E7E7E7D7D7D7CACACAC8C8C8C4C4C4C0
      C0C0BFBFBFBCBCBCB9B9B9B7B7B7B6B6B6AFAFAF9F9F9FFF00FFFF00FF0018CA
      7F98FF728CFF5676FF4668FF3559FF2449FF163BFF0528FF001FF8001EF0001E
      F0001BD9001399FF00FFFF00FFB0B0B0E9E9E9E6E6E6DEDEDED9D9D9D4D4D4CE
      CECEC8C8C8C0C0C0BBBBBBB9B9B9B9B9B9B3B3B3A4A4A4FF00FFFF00FF0018CA
      5877FF7F98FF839CFF7690FF6582FF4A6BFF284CFF0E33FF0121FF001FF8001F
      FB001CE30014A5FF00FFFF00FFB0B0B0DFDFDFE9E9E9EBEBEBE7E7E7E2E2E2DA
      DADACFCFCFC5C5C5BDBDBDBBBBBBBBBBBBB6B6B6A7A7A7FF00FFFF00FFFF00FF
      001DEE0A2EFF0C30FF0A2EFF0629FF0121FF001DEE001CDE001AD10019CC0019
      CF0017B8FF00FFFF00FFFF00FFFF00FFB8B8B8C3C3C3C4C4C4C3C3C3C1C1C1BD
      BDBDB8B8B8B5B5B5B2B2B2B0B0B0B1B1B1ACACACFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
    }
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
  end
  object dbeDataBaixado: TDBEdit[4]
    Left = 16
    Height = 33
    Top = 224
    Width = 121
    DataField = 'DATABAIXADO'
    DataSource = dsPadrao
    ReadOnly = True
    CharCase = ecNormal
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
  end
  object dbeForn: TDBEdit[5]
    Left = 272
    Height = 33
    Hint = 'Pesquisar < F2 >'
    Top = 183
    Width = 227
    DataField = 'FORN'
    DataSource = dsPadrao
    ReadOnly = True
    CharCase = ecNormal
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
  end
  object dbeBandMagnetica: TDBEdit[6]
    Left = 120
    Height = 33
    Top = 60
    Width = 225
    DataField = 'BANDAMAGNETICA'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object dbeCliente: TDBEdit[7]
    Left = 16
    Height = 33
    Hint = 'Pesquisar < F2 >'
    Top = 183
    Width = 227
    DataField = 'CLIENTE'
    DataSource = dsPadrao
    ReadOnly = True
    CharCase = ecNormal
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
  end
  object dbeVenda: TDBEdit[8]
    Left = 336
    Height = 33
    Top = 142
    Width = 89
    DataField = 'VENDA'
    DataSource = dsPadrao
    ReadOnly = True
    CharCase = ecNormal
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
  end
  object dbeValor: TDBEdit[9]
    Left = 400
    Height = 33
    Top = 101
    Width = 121
    DataField = 'VALOR'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
  end
  object dbdBomPara: TDBEdit[10]
    Left = 176
    Height = 33
    Top = 142
    Width = 153
    DataField = 'BOMPARA'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
  end
  object dbeBanco: TDBEdit[11]
    Left = 352
    Height = 33
    Hint = 'Pesquisar < F2 >'
    Top = 60
    Width = 147
    DataField = 'BANCO'
    DataSource = dsPadrao
    ReadOnly = True
    CharCase = ecNormal
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object dbeAgencia: TDBEdit[12]
    Left = 16
    Height = 33
    Top = 101
    Width = 121
    DataField = 'AGENCIA'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object dbeConta: TDBEdit[13]
    Left = 144
    Height = 33
    Top = 101
    Width = 121
    DataField = 'CONTA'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object dbeNumero: TDBEdit[14]
    Left = 272
    Height = 33
    Top = 101
    Width = 121
    DataField = 'NUMERO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
  object dbdDataEmissao: TDBEdit[15]
    Left = 16
    Height = 33
    Top = 142
    Width = 153
    DataField = 'DATAEMISSAO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
  end
  object dbeCompra: TDBEdit[16]
    Left = 432
    Height = 33
    Top = 142
    Width = 89
    DataField = 'COMPRA'
    DataSource = dsPadrao
    ReadOnly = True
    CharCase = ecNormal
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
  end
  inherited actlNavigateActions: TActionList[17]
    Left = 376
    Top = 108
    inherited actPrint: TAction
      Hint = 'Cheques emitidos'
      OnExecute = actPrintExecute
      ShortCut = 0
    end
    object actBaixar: TAction[8]
      Category = 'Navigate'
      Caption = 'Baixar'
      Hint = 'Baixar cheque'
      OnExecute = actBaixarExecute
    end
    object actEstornarBaixa: TAction[9]
      Category = 'Navigate'
      Caption = 'Estornar baixa'
      Hint = 'Estornar cheque baixado'
      OnExecute = actEstornarBaixaExecute
    end
  end
  inherited dsPadrao: TDataSource[18]
    DataSet = cdsPadrao
    Left = 463
    Top = 172
  end
  object sqldPadrao: TSQLQuery[19]
    FieldDefs = <>
    Params = <>
    Left = 224
    Top = 172
    object sqldPadraoIDCHEQUE: TIntegerField
      FieldKind = fkData
      FieldName = 'IDCHEQUE'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object sqldPadraoIDBANCO: TIntegerField
      FieldKind = fkData
      FieldName = 'IDBANCO'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoBANCO: TStringField
      FieldKind = fkData
      FieldName = 'BANCO'
      Index = 2
      LookupCache = False
      ProviderFlags = []
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoAGENCIA: TStringField
      FieldKind = fkData
      FieldName = 'AGENCIA'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoCONTA: TStringField
      FieldKind = fkData
      FieldName = 'CONTA'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoNUMERO: TStringField
      FieldKind = fkData
      FieldName = 'NUMERO'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoDATAEMISSAO: TDateField
      FieldKind = fkData
      FieldName = 'DATAEMISSAO'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoBOMPARA: TDateField
      FieldKind = fkData
      FieldName = 'BOMPARA'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoIDCLIENTE: TIntegerField
      FieldKind = fkData
      FieldName = 'IDCLIENTE'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoCLIENTE: TStringField
      FieldKind = fkData
      FieldName = 'CLIENTE'
      Index = 9
      LookupCache = False
      ProviderFlags = []
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoIDFORN: TIntegerField
      FieldKind = fkData
      FieldName = 'IDFORN'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoFORN: TStringField
      FieldKind = fkData
      FieldName = 'FORN'
      Index = 11
      LookupCache = False
      ProviderFlags = []
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoVALOR: TFMTBCDField
      FieldKind = fkData
      FieldName = 'VALOR'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
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
    object sqldPadraoCOMPRA: TIntegerField
      FieldKind = fkData
      FieldName = 'COMPRA'
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoREPASSADO: TStringField
      FieldKind = fkData
      FieldName = 'REPASSADO'
      Index = 15
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object sqldPadraoBANDAMAGNETICA: TStringField
      FieldKind = fkData
      FieldName = 'BANDAMAGNETICA'
      Index = 16
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 35
    end
    object sqldPadraoDATABAIXADO: TDateField
      FieldKind = fkData
      FieldName = 'DATABAIXADO'
      Index = 17
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
  end
  object dspPadrao: TTimer[20]
    Left = 296
    Top = 172
  end
  object cdsPadrao: TMemDataset[21]
    FieldDefs = <>
    AfterInsert = cdsPadraoAfterInsert
    AfterScroll = cdsPadraoAfterScroll
    Left = 376
    Top = 172
    object cdsPadraoIDCHEQUE: TIntegerField
      FieldKind = fkData
      FieldName = 'IDCHEQUE'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object cdsPadraoIDBANCO: TIntegerField
      DisplayLabel = 'BANCO'
      FieldKind = fkData
      FieldName = 'IDBANCO'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      OnValidate = cdsPadraoIDBANCOValidate
    end
    object cdsPadraoBANCO: TStringField
      FieldKind = fkData
      FieldName = 'BANCO'
      Index = 2
      LookupCache = False
      ProviderFlags = []
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoAGENCIA: TStringField
      FieldKind = fkData
      FieldName = 'AGENCIA'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoCONTA: TStringField
      FieldKind = fkData
      FieldName = 'CONTA'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoNUMERO: TStringField
      FieldKind = fkData
      FieldName = 'NUMERO'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoDATAEMISSAO: TDateField
      DisplayLabel = 'DATA DE EMISSÃO'
      FieldKind = fkData
      FieldName = 'DATAEMISSAO'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoBOMPARA: TDateField
      FieldKind = fkData
      FieldName = 'BOMPARA'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoIDCLIENTE: TIntegerField
      FieldKind = fkData
      FieldName = 'IDCLIENTE'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      OnValidate = cdsPadraoIDCLIENTEValidate
    end
    object cdsPadraoCLIENTE: TStringField
      FieldKind = fkData
      FieldName = 'CLIENTE'
      Index = 9
      LookupCache = False
      ProviderFlags = []
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoIDFORN: TIntegerField
      FieldKind = fkData
      FieldName = 'IDFORN'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      OnValidate = cdsPadraoIDFORNValidate
    end
    object cdsPadraoFORN: TStringField
      FieldKind = fkData
      FieldName = 'FORN'
      Index = 11
      LookupCache = False
      ProviderFlags = []
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoVALOR: TFMTBCDField
      FieldKind = fkData
      FieldName = 'VALOR'
      Index = 12
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
    object cdsPadraoVENDA: TIntegerField
      FieldKind = fkData
      FieldName = 'VENDA'
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoCOMPRA: TIntegerField
      FieldKind = fkData
      FieldName = 'COMPRA'
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoREPASSADO: TStringField
      FieldKind = fkData
      FieldName = 'REPASSADO'
      Index = 15
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      OnGetText = cdsPadraoREPASSADOGetText
      OnSetText = cdsPadraoREPASSADOSetText
      Size = 1
    end
    object cdsPadraoBANDAMAGNETICA: TStringField
      DisplayLabel = 'BANDA MAGNÉTICA'
      FieldKind = fkData
      FieldName = 'BANDAMAGNETICA'
      Index = 16
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      OnChange = cdsPadraoBANDAMAGNETICAChange
      Size = 35
    end
    object cdsPadraoDATABAIXADO: TDateField
      FieldKind = fkData
      FieldName = 'DATABAIXADO'
      Index = 17
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd/mm/yyyy'
    end
  end
end
