inherited frmDuplicatas: TfrmDuplicatas
  Left = 221
  Top = 117
  ClientHeight = 526
  ClientWidth = 545
  Caption = 'frmDuplicatas'
  OldCreateOrder = True
  ExplicitWidth = 551
  ExplicitHeight = 555
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbStatus: TUniStatusBar
    Top = 507
    Width = 545
    ExplicitTop = 507
    ExplicitWidth = 545
  end
  inherited pnBotoesPadrao: TUniContainerPanel
    Width = 545
    TabOrder = 21
    ExplicitWidth = 545
  end
  object lbSacado: TUniLabel [2]
    Left = 8
    Top = 256
    Width = 55
    Height = 13
    Hint = ''
    ShowHint = True
    AutoSize = False
    Caption = 
      'Sacado----------------------------------------------------------' +
      '--------------------------------------------------------------'
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Name = 'Verdana'
    TabOrder = 23
  end
  object lbPracaPag: TUniLabel [3]
    Left = 8
    Top = 440
    Width = 55
    Height = 13
    Hint = ''
    ShowHint = True
    AutoSize = False
    Caption = 
      'Pra'#231'a de pagamento----------------------------------------------' +
      '-----------------------------------------------------'
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Name = 'Verdana'
    ParentColor = False
    Color = clBtnFace
    Transparent = False
    TabOrder = 24
  end
  object lbFatura: TUniLabel [4]
    Left = 8
    Top = 48
    Width = 55
    Height = 13
    Hint = ''
    ShowHint = True
    AutoSize = False
    Caption = 'Fatura-------------------------------------------------------'
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Name = 'Verdana'
    TabOrder = 25
  end
  object lbDuplicata: TUniLabel [5]
    Left = 8
    Top = 112
    Width = 55
    Height = 13
    Hint = ''
    ShowHint = True
    AutoSize = False
    Caption = 
      'Duplicata-------------------------------------------------------' +
      '--------------------------------------------------------------'
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Name = 'Verdana'
    TabOrder = 26
  end
  object lbDatas: TUniLabel [6]
    Left = 273
    Top = 48
    Width = 55
    Height = 13
    Hint = ''
    ShowHint = True
    AutoSize = False
    Caption = 'Datas---------------------------------------------------------'
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Name = 'Verdana'
    TabOrder = 27
  end
  object dbeDataEmissao: TUniDBEdit [7]
    Left = 280
    Top = 84
    Width = 121
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'DATAEMISSAO'
    DataSource = dsPadrao
    TabOrder = 2
  end
  object dbeCidade: TUniDBEdit [8]
    Left = 144
    Top = 412
    Width = 315
    Height = 21
    Hint = 'Pesquisar < F2 >'
    ShowHint = True
    DataField = 'NOMECIDADE'
    DataSource = dsPadrao
    TabOrder = 18
    Color = clBtnFace
    ReadOnly = True
  end
  object dbeDataPag: TUniDBEdit [9]
    Left = 400
    Top = 148
    Width = 129
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'DATADESCTO'
    DataSource = dsPadrao
    TabOrder = 7
  end
  object dbeDataVenc: TUniDBEdit [10]
    Left = 408
    Top = 84
    Width = 121
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'DATAVENC'
    DataSource = dsPadrao
    TabOrder = 3
  end
  object dbeValor: TUniDBEdit [11]
    Left = 144
    Top = 148
    Width = 121
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'VALOR'
    DataSource = dsPadrao
    TabOrder = 5
    Color = clInactiveCaption
    OnExit = dbeValorExit
  end
  object dbeDesconto: TUniDBEdit [12]
    Left = 272
    Top = 148
    Width = 121
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'DESCONTO'
    DataSource = dsPadrao
    TabOrder = 6
    OnExit = dbeDescontoExit
  end
  object dbeValorFatura: TUniDBEdit [13]
    Left = 144
    Top = 84
    Width = 121
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'VALOR_FATURA'
    DataSource = dsPadrao
    TabOrder = 1
  end
  object dbeNroDuplicata: TUniDBEdit [14]
    Left = 16
    Top = 148
    Width = 121
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'NRODUPLICATA'
    DataSource = dsPadrao
    TabOrder = 4
    Color = 8454143
  end
  object dbeNroFatura: TUniDBEdit [15]
    Left = 16
    Top = 84
    Width = 121
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'NROFATURA'
    DataSource = dsPadrao
    TabOrder = 0
  end
  object dbeValorExtenso: TUniDBEdit [16]
    Left = 16
    Top = 188
    Width = 513
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'VALOREXTENSO'
    DataSource = dsPadrao
    TabOrder = 8
    Color = clBtnFace
    ReadOnly = True
  end
  object dbeSacado: TUniDBEdit [17]
    Left = 16
    Top = 292
    Width = 513
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'SACADO'
    DataSource = dsPadrao
    TabOrder = 11
  end
  object dbeCpfCnpj: TUniDBEdit [18]
    Left = 16
    Top = 332
    Width = 161
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'CPF_CNPJ'
    DataSource = dsPadrao
    TabOrder = 12
  end
  object dbeRgIe: TUniDBEdit [19]
    Left = 184
    Top = 332
    Width = 161
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'IE'
    DataSource = dsPadrao
    TabOrder = 13
  end
  object dbeFoneFax: TUniDBEdit [20]
    Left = 352
    Top = 332
    Width = 177
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'FONEFAX'
    DataSource = dsPadrao
    TabOrder = 14
  end
  object dbeCep: TUniDBEdit [21]
    Left = 16
    Top = 372
    Width = 121
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'CEP'
    DataSource = dsPadrao
    TabOrder = 15
  end
  object dbeEndereco: TUniDBEdit [22]
    Left = 144
    Top = 372
    Width = 385
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'ENDERECO'
    DataSource = dsPadrao
    TabOrder = 16
  end
  object dbeBairro: TUniDBEdit [23]
    Left = 16
    Top = 412
    Width = 121
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'BAIRRO'
    DataSource = dsPadrao
    TabOrder = 17
  end
  object dbeEstado: TUniDBEdit [24]
    Left = 465
    Top = 412
    Width = 64
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'UF'
    DataSource = dsPadrao
    TabOrder = 19
  end
  object dbePracaPagamento: TUniDBEdit [25]
    Left = 16
    Top = 476
    Width = 513
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'PRACAPAGAMENTO'
    DataSource = dsPadrao
    TabOrder = 20
  end
  object dbeDataImpressao: TUniDBEdit [26]
    Left = 16
    Top = 228
    Width = 113
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'DATAIMPRESSAO'
    DataSource = dsPadrao
    TabOrder = 9
    Color = clBtnFace
    ReadOnly = True
  end
  object dbeImpressa: TUniDBEdit [27]
    Left = 136
    Top = 228
    Width = 57
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'IMPRESSA'
    DataSource = dsPadrao
    TabOrder = 10
    Color = clBtnFace
    ReadOnly = True
  end
  inherited actlNavigateActions: TActionList
    Left = 480
    Top = 4
    inherited actPrint: TAction
      Hint = 'Imprimir em formul'#225'rio pr'#233'-impresso'
      ShortCut = 0
      OnExecute = actPrintExecute
    end
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 391
    Top = 5
  end
  object cdsPadrao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    AfterInsert = cdsPadraoAfterInsert
    OnNewRecord = cdsPadraoNewRecord
    Left = 320
    Top = 5
    object cdsPadraoIDDUPLICATA: TIntegerField
      FieldName = 'IDDUPLICATA'
      Required = True
    end
    object cdsPadraoNRODUPLICATA: TStringField
      FieldName = 'NRODUPLICATA'
    end
    object cdsPadraoSACADO: TStringField
      FieldName = 'SACADO'
      Size = 80
    end
    object cdsPadraoCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
    end
    object cdsPadraoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 80
    end
    object cdsPadraoBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 80
    end
    object cdsPadraoCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object cdsPadraoIDCIDADE: TIntegerField
      FieldName = 'IDCIDADE'
      OnValidate = cdsPadraoIDCIDADEValidate
    end
    object cdsPadraoNOMECIDADE: TStringField
      FieldName = 'NOMECIDADE'
      ProviderFlags = []
      Size = 80
    end
    object cdsPadraoFONEFAX: TStringField
      FieldName = 'FONEFAX'
    end
    object cdsPadraoUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object cdsPadraoIE: TStringField
      FieldName = 'IE'
    end
    object cdsPadraoDATAEMISSAO: TDateField
      FieldName = 'DATAEMISSAO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoNROFATURA: TStringField
      FieldName = 'NROFATURA'
    end
    object cdsPadraoVALOR_FATURA: TFMTBCDField
      FieldName = 'VALOR_FATURA'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
    object cdsPadraoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
    object cdsPadraoDATAVENC: TDateField
      FieldName = 'DATAVENC'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
    object cdsPadraoPRACAPAGAMENTO: TStringField
      FieldName = 'PRACAPAGAMENTO'
      Size = 250
    end
    object cdsPadraoDATADESCTO: TDateField
      FieldName = 'DATADESCTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoVALOREXTENSO: TStringField
      FieldName = 'VALOREXTENSO'
      Size = 250
    end
    object cdsPadraoDATAIMPRESSAO: TDateField
      FieldName = 'DATAIMPRESSAO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoIMPRESSA: TStringField
      FieldName = 'IMPRESSA'
      FixedChar = True
      Size = 1
    end
  end
end
