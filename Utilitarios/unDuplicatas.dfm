inherited frmDuplicatas: TfrmDuplicatas
  Left = 221
  Top = 117
  Caption = 'frmDuplicatas'
  ClientHeight = 526
  ClientWidth = 545
  OldCreateOrder = True
  ExplicitWidth = 551
  ExplicitHeight = 555
  PixelsPerInch = 96
  TextHeight = 13
  object lbSacado: TLabel [0]
    Left = 8
    Top = 256
    Width = 350
    Height = 16
    AutoSize = False
    Caption = 
      'Sacado----------------------------------------------------------' +
      '--------------------------------------------------------------'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbPracaPag: TLabel [1]
    Left = 8
    Top = 440
    Width = 529
    Height = 16
    AutoSize = False
    Caption = 
      'Pra'#231'a de pagamento----------------------------------------------' +
      '-----------------------------------------------------'
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
  end
  object lbFatura: TLabel [2]
    Left = 8
    Top = 48
    Width = 265
    Height = 16
    AutoSize = False
    Caption = 'Fatura-------------------------------------------------------'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbDuplicata: TLabel [3]
    Left = 8
    Top = 112
    Width = 529
    Height = 16
    AutoSize = False
    Caption = 
      'Duplicata-------------------------------------------------------' +
      '--------------------------------------------------------------'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbDatas: TLabel [4]
    Left = 273
    Top = 48
    Width = 265
    Height = 16
    AutoSize = False
    Caption = 'Datas---------------------------------------------------------'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dbeDataEmissao: TDBEdit [5]
    Left = 280
    Top = 84
    Width = 121
    Height = 21
    DataField = 'DATAEMISSAO'
    DataSource = dsPadrao
    TabOrder = 2
  end
  object dbeCidade: TDBEdit [6]
    Left = 144
    Top = 412
    Width = 315
    Height = 21
    Hint = 'Pesquisar < F2 >'
    Color = clBtnFace
    DataField = 'NOMECIDADE'
    DataSource = dsPadrao
    ReadOnly = True
    TabOrder = 18
  end
  object dbeDataPag: TDBEdit [7]
    Left = 400
    Top = 148
    Width = 129
    Height = 21
    DataField = 'DATADESCTO'
    DataSource = dsPadrao
    TabOrder = 7
  end
  object dbeDataVenc: TDBEdit [8]
    Left = 408
    Top = 84
    Width = 121
    Height = 21
    DataField = 'DATAVENC'
    DataSource = dsPadrao
    TabOrder = 3
  end
  object dbeValor: TDBEdit [9]
    Left = 144
    Top = 148
    Width = 121
    Height = 21
    Color = clInactiveCaption
    DataField = 'VALOR'
    DataSource = dsPadrao
    TabOrder = 5
    OnExit = dbeValorExit
  end
  object dbeDesconto: TDBEdit [10]
    Left = 272
    Top = 148
    Width = 121
    Height = 21
    DataField = 'DESCONTO'
    DataSource = dsPadrao
    TabOrder = 6
    OnExit = dbeDescontoExit
  end
  object dbeValorFatura: TDBEdit [11]
    Left = 144
    Top = 84
    Width = 121
    Height = 21
    DataField = 'VALOR_FATURA'
    DataSource = dsPadrao
    TabOrder = 1
  end
  object dbeNroDuplicata: TDBEdit [12]
    Left = 16
    Top = 148
    Width = 121
    Height = 21
    Color = 8454143
    DataField = 'NRODUPLICATA'
    DataSource = dsPadrao
    TabOrder = 4
  end
  object dbeNroFatura: TDBEdit [13]
    Left = 16
    Top = 84
    Width = 121
    Height = 21
    DataField = 'NROFATURA'
    DataSource = dsPadrao
    TabOrder = 0
  end
  object dbeValorExtenso: TDBEdit [14]
    Left = 16
    Top = 188
    Width = 513
    Height = 21
    Color = clBtnFace
    DataField = 'VALOREXTENSO'
    DataSource = dsPadrao
    ReadOnly = True
    TabOrder = 8
  end
  object dbeSacado: TDBEdit [15]
    Left = 16
    Top = 292
    Width = 513
    Height = 21
    DataField = 'SACADO'
    DataSource = dsPadrao
    TabOrder = 11
  end
  object dbeCpfCnpj: TDBEdit [16]
    Left = 16
    Top = 332
    Width = 161
    Height = 21
    DataField = 'CPF_CNPJ'
    DataSource = dsPadrao
    TabOrder = 12
  end
  object dbeRgIe: TDBEdit [17]
    Left = 184
    Top = 332
    Width = 161
    Height = 21
    DataField = 'IE'
    DataSource = dsPadrao
    TabOrder = 13
  end
  object dbeFoneFax: TDBEdit [18]
    Left = 352
    Top = 332
    Width = 177
    Height = 21
    DataField = 'FONEFAX'
    DataSource = dsPadrao
    TabOrder = 14
  end
  object dbeCep: TDBEdit [19]
    Left = 16
    Top = 372
    Width = 121
    Height = 21
    DataField = 'CEP'
    DataSource = dsPadrao
    TabOrder = 15
  end
  object dbeEndereco: TDBEdit [20]
    Left = 144
    Top = 372
    Width = 385
    Height = 21
    DataField = 'ENDERECO'
    DataSource = dsPadrao
    TabOrder = 16
  end
  object dbeBairro: TDBEdit [21]
    Left = 16
    Top = 412
    Width = 121
    Height = 21
    DataField = 'BAIRRO'
    DataSource = dsPadrao
    TabOrder = 17
  end
  object dbeEstado: TDBEdit [22]
    Left = 465
    Top = 412
    Width = 64
    Height = 21
    DataField = 'UF'
    DataSource = dsPadrao
    TabOrder = 19
  end
  object dbePracaPagamento: TDBEdit [23]
    Left = 16
    Top = 476
    Width = 513
    Height = 21
    DataField = 'PRACAPAGAMENTO'
    DataSource = dsPadrao
    TabOrder = 20
  end
  object dbeDataImpressao: TDBEdit [24]
    Left = 16
    Top = 228
    Width = 113
    Height = 21
    Color = clBtnFace
    DataField = 'DATAIMPRESSAO'
    DataSource = dsPadrao
    ReadOnly = True
    TabOrder = 9
  end
  object dbeImpressa: TDBEdit [25]
    Left = 136
    Top = 228
    Width = 57
    Height = 21
    Color = clBtnFace
    DataField = 'IMPRESSA'
    DataSource = dsPadrao
    ReadOnly = True
    TabOrder = 10
  end
  inherited sbStatus: TStatusBar
    Top = 507
    Width = 545
    ExplicitTop = 507
    ExplicitWidth = 545
  end
  inherited pnBotoesPadrao: TPanel
    Width = 545
    TabOrder = 21
    ExplicitWidth = 545
  end
  object btnCadastraSacadoCliente: TcxButton [28]
    Left = 374
    Top = 253
    Width = 155
    Height = 25
    Caption = 'Cadastrar Cliente'
    OptionsImage.Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000040000000C0000000A0000000400000004000000070000000A0000
      000B0000000D0000000D0000000D0000000C0000000A00000007000000000000
      00000000000B0B5D2FFF042D15AC0002011C32496397113866B70A3972D2093A
      76DB0A458BFF0A448AFF083873DC07346DD4052B5AB8041F4089000000070000
      000B00000016126737FF3CA885FF094321D47093ABFF8BB7DFFF4391D9FF2B85
      D7FF308FE4FF308FE4FF2A84D7FF2981D3FF2A7DCAFF0B488EFF13542FBD1875
      41FF187341FF177340FF2AC696FF24B07EFF196940FD74A0ABFFAAD2EDFF6DB6
      EEFF3F9EEBFF3F9EEBFF46A2ECFF56ADEDFF3B89CDFF0C447FDA20824BFF7AE4
      C9FF39CD9EFF37CC9DFF35CB9CFF33CA9BFF35C193FF278056FE518887FD7EBA
      E3FF51A5E2FF50A6E1FF58A6DFFF1A64A9FA0C3864A3020B1329258C53FFB5F2
      E4FFB5F2E4FFB3F2E4FF7DE6CAFF4AD2A8FF78DCC0FF3F9A6CFB133F2C89416E
      99E03E6C9DFF366596FF184F81DB02080E260000000500000002206F45C02B95
      5AFF299459FF299358FF9AECD6FF7DD6B9FF318D5CEC09201345000000194261
      88DC7DA4CDFF588BC1FF1C4070DE000000190000000000000000000000020000
      0003000000072D9B5FFF7ECEADFF257A4CCB040E092000000005020304205379
      ACF9BDE0F5FF8BC2EBFF335C95FD0103052D0000000300000000000000000000
      000000000002309F63FC1D5F3B9A0104020B000000010000000517335FC05C80
      B0FFCAE8F6FF94C6E9FF375D95FF102345AC0000000900000000000000000000
      0000000000000000000100000001000000000000000000000006205090F64F7C
      B1FF517CAFFF2C5088FF325D98FF183871F40000000B00000000000000000000
      0000000000000000000000000000000000000000000000000003255A9AE66C9D
      D0FE5C8CC1FF76A5D3FF5385BEFF1C427DF70000000700000000000000000000
      00000000000000000000000000000000000000000000000000010C1F3249255B
      92C22E6EB0E62F72B8FA204E82C80A192D590000000300000000000000000000
      0000000000000000000000000000000000000000000000000000000000010000
      0002000000030000000300000003000000020000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000}
    TabOrder = 23
    OnClick = btnCadastraSacadoClienteClick
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
