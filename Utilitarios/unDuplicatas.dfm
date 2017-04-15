inherited frmDuplicatas: TfrmDuplicatas
  Left = 221
  Top = 117
  Caption = 'frmDuplicatas'
  ClientHeight = 526
  ClientWidth = 545
  OldCreateOrder = True
  ExplicitWidth = 551
  ExplicitHeight = 575
  PixelsPerInch = 96
  TextHeight = 13
  object lbSacado: TLabel [0]
    Left = 8
    Top = 256
    Width = 529
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
    Color = clInactiveCaptionText
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
    Left = 488
    Top = 412
    Width = 41
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
  inherited actlNavigateActions: TActionList
    Left = 464
    Top = 68
    inherited actPrint: TAction
      Hint = 'Imprimir em formul'#225'rio pr'#233'-impresso'
      ShortCut = 0
      OnExecute = actPrintExecute
    end
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 223
    Top = 37
  end
  inherited mmPadrao: TMainMenu
    Left = 392
    Top = 4
    inherited miOpcoes: TMenuItem
      object N6: TMenuItem
        Caption = '-'
      end
      object miImportarCliente: TMenuItem
        Caption = 'Importar cliente'
        OnClick = miImportarClienteClick
      end
      object miImportarCR: TMenuItem
        Caption = 'Importar conta a receber'
        OnClick = miImportarCRClick
      end
      object N10: TMenuItem
        Caption = '-'
      end
      object miConfigurar: TMenuItem
        Caption = 'Configurar para formul'#225'rio pr'#233'-impresso'
        OnClick = miConfigurarClick
      end
    end
    inherited miRelatorios: TMenuItem
      inherited mImprimir: TMenuItem
        Caption = 'Em formul'#225'rio pr'#233'-impresso...'
      end
      object miFormSistema: TMenuItem [1]
        Caption = 'Em formul'#225'rio desenhado pelo sistema...'
        OnClick = miFormSistemaClick
      end
      object N9: TMenuItem [2]
        Caption = '-'
      end
      object miFormularioBranco: TMenuItem [3]
        Caption = 'Formul'#225'rio em branco'
        OnClick = miFormularioBrancoClick
      end
      object N5: TMenuItem [4]
        Caption = '-'
      end
    end
  end
  object sqldPadrao: TSQLDataSet
    CommandText = 
      'select'#13#10'  d.IDDUPLICATA,'#13#10'  d.NRODUPLICATA,'#13#10'  d.SACADO,'#13#10'  d.CP' +
      'F_CNPJ,'#13#10'  d.ENDERECO,'#13#10'  d.BAIRRO,'#13#10'  d.CEP,'#13#10'  d.IDCIDADE,'#13#10'  ' +
      'c.Descricao NOMECIDADE,'#13#10'  d.FONEFAX,'#13#10'  d.UF,'#13#10'  d.IE,'#13#10'  d.DAT' +
      'AEMISSAO,'#13#10'  d.NROFATURA,'#13#10'  d.VALOR_FATURA,'#13#10'  d.VALOR,'#13#10'  d.DA' +
      'TAVENC,'#13#10'  d.DESCONTO,'#13#10'  d.PRACAPAGAMENTO,'#13#10'  d.DATADESCTO,'#13#10'  ' +
      'd.VALOREXTENSO,'#13#10'  d.DATAIMPRESSAO,'#13#10'  d.IMPRESSA'#13#10'from DUPLICAT' +
      'A d'#13#10'left join CIDADES c on (d.Idcidade = c.Codcidade)'#13#10'order by' +
      ' IDDUPLICATA'
    MaxBlobSize = -1
    Params = <>
    Left = 120
    Top = 37
    object sqldPadraoIDDUPLICATA: TIntegerField
      FieldName = 'IDDUPLICATA'
      Required = True
    end
    object sqldPadraoNRODUPLICATA: TStringField
      FieldName = 'NRODUPLICATA'
    end
    object sqldPadraoSACADO: TStringField
      FieldName = 'SACADO'
      Size = 80
    end
    object sqldPadraoCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
    end
    object sqldPadraoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 80
    end
    object sqldPadraoBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 80
    end
    object sqldPadraoCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object sqldPadraoIDCIDADE: TIntegerField
      FieldName = 'IDCIDADE'
    end
    object sqldPadraoNOMECIDADE: TStringField
      FieldName = 'NOMECIDADE'
      ProviderFlags = []
      Size = 80
    end
    object sqldPadraoFONEFAX: TStringField
      FieldName = 'FONEFAX'
    end
    object sqldPadraoUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object sqldPadraoIE: TStringField
      FieldName = 'IE'
    end
    object sqldPadraoDATAEMISSAO: TDateField
      FieldName = 'DATAEMISSAO'
    end
    object sqldPadraoNROFATURA: TStringField
      FieldName = 'NROFATURA'
    end
    object sqldPadraoVALOR_FATURA: TFMTBCDField
      FieldName = 'VALOR_FATURA'
      Precision = 15
    end
    object sqldPadraoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 15
    end
    object sqldPadraoDATAVENC: TDateField
      FieldName = 'DATAVENC'
    end
    object sqldPadraoDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Precision = 15
    end
    object sqldPadraoPRACAPAGAMENTO: TStringField
      FieldName = 'PRACAPAGAMENTO'
      Size = 250
    end
    object sqldPadraoDATADESCTO: TDateField
      FieldName = 'DATADESCTO'
    end
    object sqldPadraoVALOREXTENSO: TStringField
      FieldName = 'VALOREXTENSO'
      Size = 250
    end
    object sqldPadraoDATAIMPRESSAO: TDateField
      FieldName = 'DATAIMPRESSAO'
    end
    object sqldPadraoIMPRESSA: TStringField
      FieldName = 'IMPRESSA'
      FixedChar = True
      Size = 1
    end
  end
  object dspPadrao: TDataSetProvider
    DataSet = sqldPadrao
    Options = [poAllowCommandText]
    Left = 152
    Top = 37
  end
  object cdsPadrao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    AfterInsert = cdsPadraoAfterInsert
    OnNewRecord = cdsPadraoNewRecord
    Left = 184
    Top = 37
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
      OnSetText = cdsPadraoCPF_CNPJSetText
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
  object sqldCliente: TSQLDataSet
    CommandText = 
      'select '#13#10'  cli.CODCLIENTE,'#13#10'  cli.TIPO, '#13#10'  cli.NOME, '#13#10'  cli.EN' +
      'DERECO, '#13#10'  cli.CEP,'#13#10'  BAIRRO, '#13#10'  cli.TELEFONE, '#13#10'  cli.CODCID' +
      'ADE,'#13#10'  cid.DESCRICAO,'#13#10'  cli.UF, '#13#10'  cli.CPF_CNPJ, '#13#10'  cli.RG_I' +
      'E, '#13#10'  cli.LIMITE,'#13#10'  cli.DATA_NASC '#13#10'from CLIENTES cli'#13#10'left jo' +
      'in CIDADES cid on (cli.CODCIDADE = cid.CODCIDADE)'#13#10'order by cli.' +
      'NOME'
    MaxBlobSize = -1
    Params = <>
    Left = 200
    Top = 216
    object sqldClienteCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
      Required = True
    end
    object sqldClienteTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object sqldClienteNOME: TStringField
      FieldName = 'NOME'
      Size = 80
    end
    object sqldClienteENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 80
    end
    object sqldClienteCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object sqldClienteBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 80
    end
    object sqldClienteTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
    object sqldClienteCODCIDADE: TIntegerField
      FieldName = 'CODCIDADE'
    end
    object sqldClienteDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
    object sqldClienteUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object sqldClienteCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
    end
    object sqldClienteRG_IE: TStringField
      FieldName = 'RG_IE'
    end
    object sqldClienteLIMITE: TFMTBCDField
      FieldName = 'LIMITE'
      Precision = 15
    end
    object sqldClienteDATA_NASC: TDateField
      FieldName = 'DATA_NASC'
    end
  end
  object dspCliente: TDataSetProvider
    DataSet = sqldCliente
    Options = [poAllowCommandText]
    Left = 232
    Top = 216
  end
  object cdsCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCliente'
    Left = 264
    Top = 216
    object cdsClienteCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
      Required = True
    end
    object cdsClienteTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsClienteNOME: TStringField
      FieldName = 'NOME'
      Size = 80
    end
    object cdsClienteENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 80
    end
    object cdsClienteCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object cdsClienteBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 80
    end
    object cdsClienteTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
    object cdsClienteCODCIDADE: TIntegerField
      FieldName = 'CODCIDADE'
    end
    object cdsClienteDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
    object cdsClienteUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object cdsClienteCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
    end
    object cdsClienteRG_IE: TStringField
      FieldName = 'RG_IE'
    end
    object cdsClienteLIMITE: TFMTBCDField
      FieldName = 'LIMITE'
      Precision = 15
    end
    object cdsClienteDATA_NASC: TDateField
      FieldName = 'DATA_NASC'
    end
  end
  object sqldCR: TSQLDataSet
    CommandText = 
      'select'#13#10'  cr.CODIGO,'#13#10'  cr.DATA,'#13#10'  cr.VENCIMENTO,'#13#10'  cr.DESCRIC' +
      'AO, '#13#10'  cr.CLIENTE,'#13#10'  c.NOME,'#13#10'  cr.DOCUMENTO,'#13#10'  cr.VALOR,'#13#10'  ' +
      'cr.TOTAL,'#13#10'  cr.VENDA'#13#10'from CONTASRECEBER cr'#13#10'left join CLIENTES' +
      ' c on (c.CODCLIENTE = cr.CLIENTE)'#13#10'order by cr.DATA'
    MaxBlobSize = -1
    Params = <>
    Left = 304
    Top = 216
    object sqldCRCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sqldCRDATA: TDateField
      FieldName = 'DATA'
    end
    object sqldCRVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
    end
    object sqldCRDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
    object sqldCRCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
    end
    object sqldCRNOME: TStringField
      FieldName = 'NOME'
      Size = 80
    end
    object sqldCRDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
    end
    object sqldCRVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 15
    end
    object sqldCRTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object sqldCRVENDA: TIntegerField
      FieldName = 'VENDA'
    end
  end
  object dspCR: TDataSetProvider
    DataSet = sqldCR
    Left = 336
    Top = 216
  end
  object cdsCR: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCR'
    Left = 368
    Top = 216
    object cdsCRCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsCRDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsCRVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
    end
    object cdsCRDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
    object cdsCRCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
    end
    object cdsCRNOME: TStringField
      FieldName = 'NOME'
      Size = 80
    end
    object cdsCRDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
    end
    object cdsCRVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 15
    end
    object cdsCRTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object cdsCRVENDA: TIntegerField
      FieldName = 'VENDA'
    end
  end
  object sqldDeleta: TSQLDataSet
    CommandText = 'STPDELDUPLICATA'
    CommandType = ctStoredProc
    DbxCommandType = 'Dbx.StoredProcedure'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    Left = 472
    Top = 4
  end
  object sqldCidade: TSQLDataSet
    CommandText = 
      'select '#13#10'  CODCIDADE, '#13#10'DESCRICAO from CIDADES'#13#10'order by DESCRIC' +
      'AO'
    MaxBlobSize = -1
    Params = <>
    Left = 408
    Top = 216
    object sqldCidadeCODCIDADE: TIntegerField
      FieldName = 'CODCIDADE'
      Required = True
    end
    object sqldCidadeDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
  end
  object dspCidade: TDataSetProvider
    DataSet = sqldCidade
    Left = 440
    Top = 216
  end
  object cdsCidade: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCidade'
    Left = 472
    Top = 216
    object cdsCidadeCODCIDADE: TIntegerField
      FieldName = 'CODCIDADE'
      Required = True
    end
    object cdsCidadeDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
  end
end
