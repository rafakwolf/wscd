inherited frmCR: TfrmCR
  Left = 219
  Top = 148
  ClientHeight = 380
  ClientWidth = 522
  Caption = 'frmCR'
  OldCreateOrder = True
  ExplicitWidth = 528
  ExplicitHeight = 409
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbStatus: TStatusBar
    Top = 361
    Width = 522
    ExplicitTop = 361
    ExplicitWidth = 522
  end
  inherited pnBotoesPadrao: TPanel
    Width = 522
    TabOrder = 12
    ExplicitWidth = 522
  end
  object lbStatus: TLabel [2]
    Left = 8
    Top = 336
    Width = 46
    Height = 13
    Hint = ''
    ShowHint = True
    Caption = 'lbStatus'
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Name = 'Verdana'
    TabOrder = 16
  end
  object btnReceber: TBitBtn [3]
    Left = 424
    Top = 328
    Width = 89
    Height = 25
    Hint = ''
    ShowHint = True
    Caption = 'Receber'
    TabOrder = 15
    OnClick = btnReceberClick
  end
  object btnContas: TBitBtn [4]
    Left = 320
    Top = 328
    Width = 97
    Height = 25
    Hint = ''
    ShowHint = True
    Caption = 'Contas [F7]'
    TabOrder = 14
    OnClick = miContasClienteCorrenteClick
  end
  object dbeValorAtual: TDBEdit [5]
    Left = 136
    Top = 208
    Width = 121
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'TOTAL'
    DataSource = dsPadrao
    TabOrder = 7
    Color = clBtnFace
    ReadOnly = True
  end
  object dbeCliente: TDBEdit [6]
    Left = 8
    Top = 64
    Width = 267
    Height = 21
    Hint = 'Pesquisar < F2 >'
    ShowHint = True
    DataField = 'NOME'
    DataSource = dsPadrao
    TabOrder = 0
    Color = clBtnFace
    ReadOnly = True
  end
  object dbeDescricao: TDBEdit [7]
    Left = 8
    Top = 112
    Width = 505
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'DESCRICAO'
    DataSource = dsPadrao
    TabOrder = 2
    OnEnter = dbeDescricaoEnter
  end
  object dbeValor: TDBEdit [8]
    Left = 8
    Top = 208
    Width = 121
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'VALOR'
    DataSource = dsPadrao
    TabOrder = 6
  end
  object dbeDocumento: TDBEdit [9]
    Left = 328
    Top = 160
    Width = 185
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'DOCUMENTO'
    DataSource = dsPadrao
    TabOrder = 5
  end
  object dbeJuros: TDBEdit [10]
    Left = 264
    Top = 208
    Width = 73
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'JURO'
    DataSource = dsPadrao
    TabOrder = 8
  end
  object dbeOrigem: TDBEdit [11]
    Left = 344
    Top = 208
    Width = 73
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'ORIGEM'
    DataSource = dsPadrao
    TabOrder = 9
    Color = clBtnFace
    ReadOnly = True
  end
  object dbdData: TDBEdit [12]
    Left = 8
    Top = 160
    Width = 153
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'DATA'
    DataSource = dsPadrao
    TabOrder = 3
  end
  object dbdVencimento: TDBEdit [13]
    Left = 168
    Top = 160
    Width = 153
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'VENCIMENTO'
    DataSource = dsPadrao
    TabOrder = 4
  end
  object dbeVenda: TDBEdit [14]
    Left = 424
    Top = 208
    Width = 89
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'VENDA'
    DataSource = dsPadrao
    TabOrder = 10
    Color = clBtnFace
    ReadOnly = True
  end
  object dbeConta: TDBEdit [15]
    Left = 304
    Top = 64
    Width = 187
    Height = 21
    Hint = 'Pesquisar < F2 >'
    ShowHint = True
    DataField = 'CONTA'
    DataSource = dsPadrao
    TabOrder = 1
    Color = clBtnFace
    ReadOnly = True
  end
  object grpRecebimento: TGroupBox [16]
    Left = 8
    Top = 240
    Width = 505
    Height = 81
    Hint = ''
    ShowHint = True
    Caption = ' Informa'#231#245'es de recebimento '
    TabOrder = 11
    TabStop = False
    object dbeDataRecdo: TDBEdit
      Left = 8
      Top = 40
      Width = 89
      Height = 21
      Hint = ''
      ShowHint = True
      DataField = 'DATARECTO'
      DataSource = dsPadrao
      TabOrder = 0
      Color = clBtnFace
      ReadOnly = True
    end
    object dbeDesconto: TDBEdit
      Left = 104
      Top = 40
      Width = 89
      Height = 21
      Hint = ''
      ShowHint = True
      DataField = 'DESCTO'
      DataSource = dsPadrao
      TabOrder = 1
      Color = clBtnFace
      ReadOnly = True
    end
    object dbeCapitalRecdo: TDBEdit
      Left = 200
      Top = 40
      Width = 89
      Height = 21
      Hint = ''
      ShowHint = True
      DataField = 'CAPITALRECDO'
      DataSource = dsPadrao
      TabOrder = 2
      Color = clBtnFace
      ReadOnly = True
    end
    object dbeJuroRecdo: TDBEdit
      Left = 296
      Top = 40
      Width = 89
      Height = 21
      Hint = ''
      ShowHint = True
      DataField = 'JURORECDO'
      DataSource = dsPadrao
      TabOrder = 3
      Color = clBtnFace
      ReadOnly = True
    end
    object dbeTotalRecdo: TDBEdit
      Left = 392
      Top = 40
      Width = 105
      Height = 21
      Hint = ''
      ShowHint = True
      DataField = 'TOTALRECDO'
      DataSource = dsPadrao
      TabOrder = 4
      Color = clBtnFace
      ReadOnly = True
    end
  end
  inherited actlNavigateActions: TActionList
    Left = 400
    Top = 12
    inherited actPrint: TAction
      Hint = 'Relat'#243'rio para cliente'
      ShortCut = 0
      OnExecute = actPrintExecute
    end
    object actContasReceber: TAction
      Category = 'Navigate'
      Caption = 'Contas a receber por cliente'
      OnExecute = actContasReceberExecute
    end
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 205
    Top = 315
  end
  object sqldPadrao: TSQLDataSet
    CommandText = 
      'SELECT'#13#10'    CR.CODIGO,'#13#10'    CR.DATA,'#13#10'    CR.VENCIMENTO,'#13#10'    CR' +
      '.CLIENTE,'#13#10'    CL.NOME,'#13#10'    CR.IDCONTA,'#13#10'    CC.CAIXANOME AS CO' +
      'NTA,'#13#10'    CR.DESCRICAO,'#13#10'    CR.DOCUMENTO,'#13#10'    CR.VALOR,'#13#10'    C' +
      'R.JURO,'#13#10'    CR.RECEBER,'#13#10'    CR.RECDA,'#13#10'    CR.DATARECTO,'#13#10'    ' +
      'CR.ORIGEM,'#13#10'    CR.VENDA,'#13#10'    CR.CAPITALRECDO,'#13#10'    CR.JURORECD' +
      'O,'#13#10'    CR.DESCTO,'#13#10'    CR.OBS,'#13#10'    CR.ATRASO,'#13#10'    CR.VALORJUR' +
      'O,'#13#10'    CR.TOTAL,'#13#10'    CR.TOTALRECDO '#13#10'FROM CONTASRECEBER CR'#13#10'LE' +
      'FT JOIN CLIENTES CL ON (CR.CLIENTE = CL.CODCLIENTE)'#13#10'LEFT JOIN V' +
      'IEWCAIXAS CC ON (CC.IDCAIXAS = CR.IDCONTA)'#13#10'ORDER BY CR.CODIGO, ' +
      'CR.DATA'
    MaxBlobSize = 1
    Params = <>
    Left = 110
    Top = 315
    object sqldPadraoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqldPadraoDATA: TDateField
      FieldName = 'DATA'
    end
    object sqldPadraoVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
    end
    object sqldPadraoCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
    end
    object sqldPadraoNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 80
    end
    object sqldPadraoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
    object sqldPadraoDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
    end
    object sqldPadraoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 15
    end
    object sqldPadraoJURO: TFMTBCDField
      FieldName = 'JURO'
      Precision = 15
    end
    object sqldPadraoRECEBER: TStringField
      FieldName = 'RECEBER'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoRECDA: TStringField
      FieldName = 'RECDA'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoDATARECTO: TDateField
      FieldName = 'DATARECTO'
    end
    object sqldPadraoORIGEM: TIntegerField
      FieldName = 'ORIGEM'
    end
    object sqldPadraoVENDA: TIntegerField
      FieldName = 'VENDA'
    end
    object sqldPadraoCAPITALRECDO: TFMTBCDField
      FieldName = 'CAPITALRECDO'
      Precision = 15
    end
    object sqldPadraoJURORECDO: TFMTBCDField
      FieldName = 'JURORECDO'
      Precision = 15
    end
    object sqldPadraoDESCTO: TFMTBCDField
      FieldName = 'DESCTO'
      Precision = 15
    end
    object sqldPadraoOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sqldPadraoATRASO: TIntegerField
      FieldName = 'ATRASO'
    end
    object sqldPadraoIDCONTA: TIntegerField
      FieldName = 'IDCONTA'
    end
    object sqldPadraoCONTA: TStringField
      FieldName = 'CONTA'
      ProviderFlags = []
      Size = 80
    end
    object sqldPadraoVALORJURO: TFMTBCDField
      FieldName = 'VALORJURO'
    end
    object sqldPadraoTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
    end
    object sqldPadraoTOTALRECDO: TFMTBCDField
      FieldName = 'TOTALRECDO'
    end
  end
  object dspPadrao: TDataSetProvider
    DataSet = sqldPadrao
    UpdateMode = upWhereKeyOnly
    Left = 142
    Top = 315
  end
  object cdsPadrao: TMemDataset
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    AfterInsert = cdsPadraoAfterInsert
    AfterScroll = cdsPadraoAfterScroll
    Left = 174
    Top = 315
    object cdsPadraoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPadraoDATA: TDateField
      FieldName = 'DATA'
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      Required = True
      OnValidate = cdsPadraoCLIENTEValidate
    end
    object cdsPadraoNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 80
    end
    object cdsPadraoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
    object cdsPadraoDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
    end
    object cdsPadraoRECEBER: TStringField
      FieldName = 'RECEBER'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoRECDA: TStringField
      FieldName = 'RECDA'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoDATARECTO: TDateField
      FieldName = 'DATARECTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoORIGEM: TIntegerField
      FieldName = 'ORIGEM'
    end
    object cdsPadraoVENDA: TIntegerField
      FieldName = 'VENDA'
    end
    object cdsPadraoOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsPadraoATRASO: TIntegerField
      FieldName = 'ATRASO'
    end
    object cdsPadraoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 15
    end
    object cdsPadraoJURO: TFMTBCDField
      FieldName = 'JURO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 15
    end
    object cdsPadraoCAPITALRECDO: TFMTBCDField
      FieldName = 'CAPITALRECDO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 15
    end
    object cdsPadraoJURORECDO: TFMTBCDField
      FieldName = 'JURORECDO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 15
    end
    object cdsPadraoDESCTO: TFMTBCDField
      FieldName = 'DESCTO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 15
    end
    object cdsPadraoIDCONTA: TIntegerField
      FieldName = 'IDCONTA'
      OnValidate = cdsPadraoIDCONTAValidate
    end
    object cdsPadraoCONTA: TStringField
      FieldName = 'CONTA'
      ProviderFlags = []
      Size = 80
    end
    object cdsPadraoVALORJURO: TFMTBCDField
      FieldName = 'VALORJURO'
    end
    object cdsPadraoTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
    end
    object cdsPadraoTOTALRECDO: TFMTBCDField
      FieldName = 'TOTALRECDO'
    end
  end
  object sqlLimite: TSQLDataSet
    CommandText = 
      'select sum(TOTAL) as TOTAL_CONTAS from CONTASRECEBER '#13#10'where CLI' +
      'ENTE = :CLIENTE'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CLIENTE'
        ParamType = ptInput
      end>
    Left = 296
    Top = 12
    object sqlLimiteTOTAL_CONTAS: TFloatField
      FieldName = 'TOTAL_CONTAS'
    end
  end
  object sqldDeleta: TSQLDataSet
    CommandText = 'STPDELCR'
    CommandType = ctStoredProc
    DbxCommandType = 'Dbx.StoredProcedure'
    MaxBlobSize = -1
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
