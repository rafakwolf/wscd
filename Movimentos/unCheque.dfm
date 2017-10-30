inherited frmCheque: TfrmCheque
  Left = 217
  Top = 139
  ClientHeight = 276
  ClientWidth = 537
  Caption = 'frmCheque'
  OldCreateOrder = True
  ExplicitWidth = 543
  ExplicitHeight = 305
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbStatus: TUniStatusBar
    Top = 254
    Width = 537
    Height = 22
    ExplicitTop = 254
    ExplicitWidth = 537
    ExplicitHeight = 22
  end
  inherited pnBotoesPadrao: TUniContainerPanel
    Width = 537
    TabOrder = 15
    ExplicitWidth = 537
  end
  object lbBaixado: TUniLabel [2]
    Left = 147
    Top = 227
    Width = 46
    Height = 13
    Hint = ''
    ShowHint = True
    Caption = 'lbBaixado'
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    TabOrder = 16
  end
  object btnBaixar: TUniBitBtn [3]
    Left = 440
    Top = 220
    Width = 81
    Height = 25
    ShowHint = True
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
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    TabOrder = 13
  end
  object dbeDataBaixado: TUniDBEdit [4]
    Left = 16
    Top = 224
    Width = 121
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'DATABAIXADO'
    DataSource = dsPadrao
    TabOrder = 12
    Color = clBtnFace
    ReadOnly = True
  end
  object dbeForn: TUniDBEdit [5]
    Left = 272
    Top = 183
    Width = 227
    Height = 21
    Hint = 'Pesquisar < F2 >'
    ShowHint = True
    DataField = 'FORN'
    DataSource = dsPadrao
    TabOrder = 11
    Color = clBtnFace
    ReadOnly = True
  end
  object dbeBandMagnetica: TUniDBEdit [6]
    Left = 120
    Top = 60
    Width = 225
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'BANDAMAGNETICA'
    DataSource = dsPadrao
    TabOrder = 0
  end
  object dbeCliente: TUniDBEdit [7]
    Left = 16
    Top = 183
    Width = 227
    Height = 21
    Hint = 'Pesquisar < F2 >'
    ShowHint = True
    DataField = 'CLIENTE'
    DataSource = dsPadrao
    TabOrder = 10
    Color = clBtnFace
    ReadOnly = True
  end
  object dbeVenda: TUniDBEdit [8]
    Left = 336
    Top = 142
    Width = 89
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'VENDA'
    DataSource = dsPadrao
    TabOrder = 8
    Color = clBtnFace
    ReadOnly = True
  end
  object dbeValor: TUniDBEdit [9]
    Left = 400
    Top = 101
    Width = 121
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'VALOR'
    DataSource = dsPadrao
    TabOrder = 5
  end
  object dbdBomPara: TUniDBEdit [10]
    Left = 176
    Top = 142
    Width = 153
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'BOMPARA'
    DataSource = dsPadrao
    TabOrder = 7
  end
  object dbeBanco: TUniDBEdit [11]
    Left = 352
    Top = 60
    Width = 147
    Height = 21
    Hint = 'Pesquisar < F2 >'
    ShowHint = True
    DataField = 'BANCO'
    DataSource = dsPadrao
    TabOrder = 1
    Color = clBtnFace
    ReadOnly = True
  end
  object dbeAgencia: TUniDBEdit [12]
    Left = 16
    Top = 101
    Width = 121
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'AGENCIA'
    DataSource = dsPadrao
    TabOrder = 2
  end
  object dbeConta: TUniDBEdit [13]
    Left = 144
    Top = 101
    Width = 121
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'CONTA'
    DataSource = dsPadrao
    TabOrder = 3
  end
  object dbeNumero: TUniDBEdit [14]
    Left = 272
    Top = 101
    Width = 121
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'NUMERO'
    DataSource = dsPadrao
    TabOrder = 4
  end
  object dbdDataEmissao: TUniDBEdit [15]
    Left = 16
    Top = 142
    Width = 153
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'DATAEMISSAO'
    DataSource = dsPadrao
    TabOrder = 6
  end
  object dbeCompra: TUniDBEdit [16]
    Left = 432
    Top = 142
    Width = 89
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'COMPRA'
    DataSource = dsPadrao
    TabOrder = 9
    Color = clBtnFace
    ReadOnly = True
  end
  inherited actlNavigateActions: TActionList
    Left = 376
    Top = 108
    inherited actPrint: TAction
      Hint = 'Cheques emitidos'
      ShortCut = 0
      OnExecute = actPrintExecute
    end
    object actBaixar: TAction
      Category = 'Navigate'
      Caption = 'Baixar'
      Hint = 'Baixar cheque'
      OnExecute = actBaixarExecute
    end
    object actEstornarBaixa: TAction
      Category = 'Navigate'
      Caption = 'Estornar baixa'
      Hint = 'Estornar cheque baixado'
      OnExecute = actEstornarBaixaExecute
    end
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 463
    Top = 172
  end
  object sqldPadrao: TSQLDataSet
    CommandText = 
      'SELECT'#13#10'  CH.IDCHEQUE,'#13#10'  CH.IDBANCO,'#13#10'  BC.BANCO,'#13#10'  CH.AGENCIA' +
      ','#13#10'  CH.CONTA,'#13#10'  CH.NUMERO,'#13#10'  CH.DATAEMISSAO,'#13#10'  CH.BOMPARA,'#13#10 +
      '  CH.IDCLIENTE,'#13#10'  CLI.NOME AS CLIENTE,'#13#10'  CH.IDFORN,'#13#10'  F.RAZAO' +
      'SOCIAL AS FORN,'#13#10'  CH.VALOR,'#13#10'  CH.VENDA,'#13#10'  CH.COMPRA,'#13#10'  CH.RE' +
      'PASSADO,'#13#10'  CH.BANDAMAGNETICA,'#13#10'  CH.DATABAIXADO'#13#10'FROM CHEQUE CH' +
      #13#10'LEFT JOIN BANCO BC ON (CH.IDBANCO = BC.IDBANCO)'#13#10'LEFT JOIN CLI' +
      'ENTES CLI ON (CLI.CODCLIENTE = CH.IDCLIENTE)'#13#10'LEFT JOIN FORNECED' +
      'ORES F ON (F.CODFORNECEDOR = CH.IDFORN)'#13#10'ORDER BY CH.DATAEMISSAO'
    MaxBlobSize = -1
    Params = <>
    Left = 224
    Top = 172
    object sqldPadraoIDCHEQUE: TIntegerField
      FieldName = 'IDCHEQUE'
      Required = True
    end
    object sqldPadraoIDBANCO: TIntegerField
      FieldName = 'IDBANCO'
    end
    object sqldPadraoBANCO: TStringField
      FieldName = 'BANCO'
      ProviderFlags = []
      Size = 80
    end
    object sqldPadraoAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Size = 80
    end
    object sqldPadraoCONTA: TStringField
      FieldName = 'CONTA'
    end
    object sqldPadraoNUMERO: TStringField
      FieldName = 'NUMERO'
    end
    object sqldPadraoDATAEMISSAO: TDateField
      FieldName = 'DATAEMISSAO'
    end
    object sqldPadraoBOMPARA: TDateField
      FieldName = 'BOMPARA'
    end
    object sqldPadraoIDCLIENTE: TIntegerField
      FieldName = 'IDCLIENTE'
    end
    object sqldPadraoCLIENTE: TStringField
      FieldName = 'CLIENTE'
      ProviderFlags = []
      Size = 80
    end
    object sqldPadraoIDFORN: TIntegerField
      FieldName = 'IDFORN'
    end
    object sqldPadraoFORN: TStringField
      FieldName = 'FORN'
      ProviderFlags = []
      Size = 80
    end
    object sqldPadraoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 15
    end
    object sqldPadraoVENDA: TIntegerField
      FieldName = 'VENDA'
    end
    object sqldPadraoCOMPRA: TIntegerField
      FieldName = 'COMPRA'
    end
    object sqldPadraoREPASSADO: TStringField
      FieldName = 'REPASSADO'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoBANDAMAGNETICA: TStringField
      FieldName = 'BANDAMAGNETICA'
      Size = 35
    end
    object sqldPadraoDATABAIXADO: TDateField
      FieldName = 'DATABAIXADO'
    end
  end
  object dspPadrao: TDataSetProvider
    DataSet = sqldPadrao
    Options = [poAllowCommandText]
    Left = 296
    Top = 172
  end
  object cdsPadrao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    AfterInsert = cdsPadraoAfterInsert
    AfterScroll = cdsPadraoAfterScroll
    Left = 376
    Top = 172
    object cdsPadraoIDCHEQUE: TIntegerField
      FieldName = 'IDCHEQUE'
      Required = True
    end
    object cdsPadraoIDBANCO: TIntegerField
      DisplayLabel = 'BANCO'
      FieldName = 'IDBANCO'
      Required = True
      OnValidate = cdsPadraoIDBANCOValidate
    end
    object cdsPadraoBANCO: TStringField
      FieldName = 'BANCO'
      ProviderFlags = []
      Size = 80
    end
    object cdsPadraoAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Size = 80
    end
    object cdsPadraoCONTA: TStringField
      FieldName = 'CONTA'
    end
    object cdsPadraoNUMERO: TStringField
      FieldName = 'NUMERO'
    end
    object cdsPadraoDATAEMISSAO: TDateField
      DisplayLabel = 'DATA DE EMISS'#195'O'
      FieldName = 'DATAEMISSAO'
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoBOMPARA: TDateField
      FieldName = 'BOMPARA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoIDCLIENTE: TIntegerField
      FieldName = 'IDCLIENTE'
      OnValidate = cdsPadraoIDCLIENTEValidate
    end
    object cdsPadraoCLIENTE: TStringField
      FieldName = 'CLIENTE'
      ProviderFlags = []
      Size = 80
    end
    object cdsPadraoIDFORN: TIntegerField
      FieldName = 'IDFORN'
      OnValidate = cdsPadraoIDFORNValidate
    end
    object cdsPadraoFORN: TStringField
      FieldName = 'FORN'
      ProviderFlags = []
      Size = 80
    end
    object cdsPadraoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 15
    end
    object cdsPadraoVENDA: TIntegerField
      FieldName = 'VENDA'
    end
    object cdsPadraoCOMPRA: TIntegerField
      FieldName = 'COMPRA'
    end
    object cdsPadraoREPASSADO: TStringField
      FieldName = 'REPASSADO'
      OnGetText = cdsPadraoREPASSADOGetText
      OnSetText = cdsPadraoREPASSADOSetText
      FixedChar = True
      Size = 1
    end
    object cdsPadraoBANDAMAGNETICA: TStringField
      DisplayLabel = 'BANDA MAGN'#201'TICA'
      FieldName = 'BANDAMAGNETICA'
      Required = True
      OnChange = cdsPadraoBANDAMAGNETICAChange
      Size = 35
    end
    object cdsPadraoDATABAIXADO: TDateField
      FieldName = 'DATABAIXADO'
      DisplayFormat = 'dd/mm/yyyy'
    end
  end
end
