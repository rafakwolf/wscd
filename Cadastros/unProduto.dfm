inherited frmProduto: TfrmProduto
  Left = 218
  Top = 129
  ClientHeight = 420
  ClientWidth = 513
  Caption = 'frmProduto'
  OldCreateOrder = True
  ExplicitWidth = 519
  ExplicitHeight = 449
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbStatus: TStatusBar
    Top = 401
    Width = 513
    ExplicitTop = 401
    ExplicitWidth = 513
  end
  inherited pnBotoesPadrao: TPanel
    Width = 513
    TabOrder = 20
    ExplicitWidth = 513
  end
  object dbeUnidade: TDBEdit [2]
    Left = 368
    Top = 64
    Width = 107
    Height = 21
    Hint = 'Pesquisar < F2 >'
    ShowHint = True
    DataField = 'UNIDADE'
    DataSource = dsPadrao
    TabOrder = 3
    Color = clBtnFace
    ReadOnly = True
  end
  object dbeGrupo: TDBEdit [3]
    Left = 16
    Top = 196
    Width = 227
    Height = 21
    Hint = 'Pesquisar < F2 >'
    ShowHint = True
    DataField = 'GRUPO'
    DataSource = dsPadrao
    TabOrder = 6
    Color = clBtnFace
    ReadOnly = True
  end
  object dbeFornecedor: TDBEdit [4]
    Left = 16
    Top = 152
    Width = 459
    Height = 21
    Hint = 'Pesquisar < F2 >'
    ShowHint = True
    DataField = 'FORNECEDOR'
    DataSource = dsPadrao
    TabOrder = 5
    Color = clBtnFace
    ReadOnly = True
  end
  object dbeQtdeRecebida: TDBEdit [5]
    Left = 200
    Top = 252
    Width = 81
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'QTDERECEBIDA'
    DataSource = dsPadrao
    TabOrder = 10
  end
  object dbeValorEstoque: TDBEdit [6]
    Left = 400
    Top = 252
    Width = 97
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'VALOR_ESTOQUE'
    DataSource = dsPadrao
    TabOrder = 12
  end
  object dbeTributacao: TDBEdit [7]
    Left = 272
    Top = 196
    Width = 203
    Height = 21
    Hint = 'Pesquisar < F2 >'
    ShowHint = True
    DataField = 'ALIQUOTA'
    DataSource = dsPadrao
    TabOrder = 7
    Color = clBtnFace
    ReadOnly = True
  end
  object dbeEstoqueMinimo: TDBEdit [8]
    Left = 96
    Top = 252
    Width = 97
    Height = 21
    Hint = 
      'Para alterar o estoque, tecle F10'#13#10'e digite a senha de administr' +
      'ador...'
    ShowHint = True
    DataField = 'ESTOQUEMINIMO'
    DataSource = dsPadrao
    TabOrder = 9
    OnKeyDown = dbeEstoqueKeyDown
    OnKeyPress = dbeEstoqueMinimoKeyPress
  end
  object dbeEstoque: TDBEdit [9]
    Left = 16
    Top = 252
    Width = 73
    Height = 21
    Hint = 
      'Para alterar o estoque, tecle F10'#13#10'e digite a senha de administr' +
      'ador...'
    ShowHint = True
    DataField = 'ESTOQUE'
    DataSource = dsPadrao
    TabOrder = 8
    OnKeyDown = dbeEstoqueKeyDown
    OnKeyPress = dbeEstoqueKeyPress
  end
  object dbePrecoVenda: TDBEdit [10]
    Left = 208
    Top = 308
    Width = 105
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'VENDA'
    DataSource = dsPadrao
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Name = 'Verdana'
    TabOrder = 15
    Color = 8454143
    OnExit = dbePrecoVendaExit
    OnKeyPress = dbePrecoVendaKeyPress
  end
  object dbeLucro: TDBEdit [11]
    Left = 120
    Top = 308
    Width = 81
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'LUCRO'
    DataSource = dsPadrao
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Name = 'Verdana'
    TabOrder = 14
    Color = 8454143
    OnExit = dbeLucroExit
    OnKeyPress = dbeLucroKeyPress
  end
  object dbePrecoCusto: TDBEdit [12]
    Left = 16
    Top = 308
    Width = 97
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'CUSTO'
    DataSource = dsPadrao
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Name = 'Verdana'
    TabOrder = 13
    Color = 8454143
    OnKeyPress = dbePrecoCustoKeyPress
  end
  object dbePrecoPromocao: TDBEdit [13]
    Left = 320
    Top = 308
    Width = 89
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'PRECO_PROMOCAO'
    DataSource = dsPadrao
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Name = 'Verdana'
    TabOrder = 16
    Color = 8454143
    OnKeyPress = dbePrecoPromocaoKeyPress
  end
  object dbdValidade: TDBEdit [14]
    Left = 120
    Top = 364
    Width = 97
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'DATAVALIDADE'
    DataSource = dsPadrao
    TabOrder = 19
  end
  object dbePeso: TDBEdit [15]
    Left = 16
    Top = 364
    Width = 97
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'PESO'
    DataSource = dsPadrao
    TabOrder = 18
    OnKeyPress = dbePesoKeyPress
  end
  object dbeNomeProduto: TDBEdit [16]
    Left = 16
    Top = 108
    Width = 459
    Height = 21
    Hint = 'Para efetuar uma busca r'#225'pida'#13#10'tecle F2...'
    ShowHint = True
    DataField = 'DESCRICAO'
    DataSource = dsPadrao
    TabOrder = 4
    OnChange = dbeNomeProdutoChange
  end
  object dbeCodigoBarra: TDBEdit [17]
    Left = 88
    Top = 64
    Width = 145
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'CODBARRA'
    DataSource = dsPadrao
    TabOrder = 1
    OnKeyPress = dbeCodigoBarraKeyPress
  end
  object dbeCodigoInterno: TDBEdit [18]
    Left = 16
    Top = 64
    Width = 65
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'IDPRODUTO'
    DataSource = dsPadrao
    TabOrder = 0
    Color = clBtnFace
    ReadOnly = True
  end
  object dbeReferencia: TDBEdit [19]
    Left = 240
    Top = 64
    Width = 121
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'REFERENCIA'
    DataSource = dsPadrao
    TabOrder = 2
  end
  object dbeDataReceb: TDBEdit [20]
    Left = 288
    Top = 252
    Width = 105
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'DATARECEBIDA'
    DataSource = dsPadrao
    TabOrder = 11
  end
  object bvlLinha1: TPanel [21]
    Left = 8
    Top = 280
    Width = 497
    Height = 2
    Hint = ''
    ShowHint = True
    TabOrder = 22
    Caption = 'bvlLinha1'
  end
  object bvlLinha2: TPanel [22]
    Left = 8
    Top = 336
    Width = 497
    Height = 2
    Hint = ''
    ShowHint = True
    TabOrder = 23
    Caption = 'bvlLinha2'
  end
  object bvlLinha3: TPanel [23]
    Left = 8
    Top = 224
    Width = 497
    Height = 2
    Hint = ''
    ShowHint = True
    TabOrder = 24
    Caption = 'bvlLinha3'
  end
  object dbckbPromocao: TDBCheckBox [24]
    Left = 421
    Top = 310
    Width = 76
    Height = 17
    Hint = ''
    ShowHint = True
    DataField = 'PROMOCAO'
    DataSource = dsPadrao
    ValueChecked = 'S'
    ValueUnchecked = 'N'
    Caption = 'Promo'#231#227'o'
    TabOrder = 17
    ParentColor = False
    Color = clBtnFace
    ReadOnly = True
  end
  object dbeObs: TDBEdit [25]
    Left = 223
    Top = 363
    Width = 282
    Height = 22
    Hint = ''
    ShowHint = True
    DataField = 'OBS'
    DataSource = dsPadrao
    TabOrder = 25
  end
  inherited actlNavigateActions: TActionList
    Left = 412
    Top = 188
    inherited actPrint: TAction
      Hint = 'Listagem de produtos'
      ShortCut = 0
      OnExecute = actPrintExecute
    end
    object actEstoqueMinimo: TAction
      Category = 'Navigate'
      Caption = 'Estoque m'#237'nimo'
      OnExecute = actEstoqueMinimoExecute
    end
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 391
    Top = 124
  end
  object sqldPadrao: TSQLQuery
    CommandText = 
      'select'#13#10'    prod.IDPRODUTO,'#13#10'    prod.CODBARRA,'#13#10'    prod.REFERE' +
      'NCIA,'#13#10'    prod.CODFORNECEDOR,'#13#10'    forn.FANTAZIA as FORNECEDOR,' +
      #13#10'    prod.CODGRUPO,'#13#10'    grp.DESCRICAO as GRUPO,'#13#10'    prod.DESC' +
      'RICAO,'#13#10'    prod.ABREVIACAO,'#13#10'    prod.DATAVALIDADE,'#13#10'    prod.C' +
      'ODUNIDADE,'#13#10'    und.DESCRICAO as UNIDADE,'#13#10'    prod.PESO,'#13#10'    p' +
      'rod.PRECO_PROMOCAO,'#13#10'    prod.CUSTO,'#13#10'    prod.LUCRO,'#13#10'    prod.' +
      'VENDA,'#13#10'    prod.ESTOQUE,'#13#10'    prod.ESTOQUEMINIMO,'#13#10'    prod.IDA' +
      'LIQUOTA,'#13#10'    alq.DESCRICAO as ALIQUOTA,'#13#10'    prod.NOVO,'#13#10'    pr' +
      'od.ALTERADO,'#13#10'    prod.VALOR_ESTOQUE,'#13#10'    prod.QTDERECEBIDA,'#13#10' ' +
      '   prod.DATARECEBIDA,'#13#10'    prod.EXCLUIR,'#13#10'    prod.PROMOCAO,'#13#10'  ' +
      '  prod.OBS'#13#10'from PRODUTOS prod'#13#10'left join FORNECEDORES forn on (' +
      'prod.CODFORNECEDOR = forn.CODFORNECEDOR)'#13#10'left join GRUPOS grp o' +
      'n (prod.CODGRUPO = grp.CODGRUPO)'#13#10'left join UNIDADES und on (pro' +
      'd.CODUNIDADE = und.CODUNIDADE)'#13#10'left join ALIQUOTAS alq on (prod' +
      '.IDALIQUOTA = alq.CODALIQUOTA)'#13#10'order by prod.DESCRICAO'
    MaxBlobSize = 1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 296
    Top = 124
    object sqldPadraoIDPRODUTO: TIntegerField
      FieldName = 'IDPRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqldPadraoCODBARRA: TStringField
      FieldName = 'CODBARRA'
      Size = 13
    end
    object sqldPadraoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object sqldPadraoCODFORNECEDOR: TIntegerField
      FieldName = 'CODFORNECEDOR'
    end
    object sqldPadraoFORNECEDOR: TStringField
      FieldName = 'FORNECEDOR'
      ProviderFlags = []
      Size = 80
    end
    object sqldPadraoCODGRUPO: TIntegerField
      FieldName = 'CODGRUPO'
    end
    object sqldPadraoGRUPO: TStringField
      FieldName = 'GRUPO'
      ProviderFlags = []
      Size = 80
    end
    object sqldPadraoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
    object sqldPadraoABREVIACAO: TStringField
      FieldName = 'ABREVIACAO'
      Size = 80
    end
    object sqldPadraoDATAVALIDADE: TDateField
      FieldName = 'DATAVALIDADE'
    end
    object sqldPadraoCODUNIDADE: TIntegerField
      FieldName = 'CODUNIDADE'
    end
    object sqldPadraoUNIDADE: TStringField
      FieldName = 'UNIDADE'
      ProviderFlags = []
    end
    object sqldPadraoPESO: TFMTBCDField
      FieldName = 'PESO'
      Precision = 15
    end
    object sqldPadraoCUSTO: TFMTBCDField
      FieldName = 'CUSTO'
      Precision = 15
    end
    object sqldPadraoLUCRO: TFMTBCDField
      FieldName = 'LUCRO'
      Precision = 15
    end
    object sqldPadraoVENDA: TFMTBCDField
      FieldName = 'VENDA'
      Precision = 15
    end
    object sqldPadraoESTOQUE: TIntegerField
      FieldName = 'ESTOQUE'
    end
    object sqldPadraoESTOQUEMINIMO: TIntegerField
      FieldName = 'ESTOQUEMINIMO'
    end
    object sqldPadraoIDALIQUOTA: TIntegerField
      FieldName = 'IDALIQUOTA'
    end
    object sqldPadraoALIQUOTA: TStringField
      FieldName = 'ALIQUOTA'
      ProviderFlags = []
    end
    object sqldPadraoNOVO: TIntegerField
      FieldName = 'NOVO'
    end
    object sqldPadraoALTERADO: TIntegerField
      FieldName = 'ALTERADO'
    end
    object sqldPadraoQTDERECEBIDA: TIntegerField
      FieldName = 'QTDERECEBIDA'
    end
    object sqldPadraoDATARECEBIDA: TDateField
      FieldName = 'DATARECEBIDA'
    end
    object sqldPadraoEXCLUIR: TStringField
      FieldName = 'EXCLUIR'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoPRECO_PROMOCAO: TFMTBCDField
      FieldName = 'PRECO_PROMOCAO'
      Precision = 15
    end
    object sqldPadraoPROMOCAO: TStringField
      FieldName = 'PROMOCAO'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sqldPadraoVALOR_ESTOQUE: TFMTBCDField
      FieldName = 'VALOR_ESTOQUE'
    end
  end
  object dspPadrao: TTimer
    DataSet = sqldPadrao
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 328
    Top = 124
  end
  object cdsPadrao: TMemDataset
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    AfterInsert = cdsPadraoAfterInsert
    AfterEdit = cdsPadraoAfterEdit
    AfterCancel = cdsPadraoAfterCancel
    Left = 360
    Top = 124
    object cdsPadraoIDPRODUTO: TIntegerField
      FieldName = 'IDPRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPadraoCODBARRA: TStringField
      DisplayLabel = 'Cod. barra'
      FieldName = 'CODBARRA'
      Required = True
      OnSetText = cdsPadraoCODBARRASetText
      Size = 13
    end
    object cdsPadraoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsPadraoCODFORNECEDOR: TIntegerField
      DisplayLabel = 'FORNECEDOR'
      FieldName = 'CODFORNECEDOR'
      Required = True
      OnValidate = cdsPadraoCODFORNECEDORValidate
    end
    object cdsPadraoFORNECEDOR: TStringField
      FieldName = 'FORNECEDOR'
      ProviderFlags = []
      Size = 80
    end
    object cdsPadraoCODGRUPO: TIntegerField
      DisplayLabel = 'GRUPO'
      FieldName = 'CODGRUPO'
      Required = True
      OnValidate = cdsPadraoCODGRUPOValidate
    end
    object cdsPadraoGRUPO: TStringField
      FieldName = 'GRUPO'
      ProviderFlags = []
      Size = 80
    end
    object cdsPadraoDESCRICAO: TStringField
      DisplayLabel = 'DESCRI'#199#195'O'
      FieldName = 'DESCRICAO'
      Required = True
      Size = 80
    end
    object cdsPadraoABREVIACAO: TStringField
      FieldName = 'ABREVIACAO'
      Size = 80
    end
    object cdsPadraoDATAVALIDADE: TDateField
      FieldName = 'DATAVALIDADE'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoCODUNIDADE: TIntegerField
      DisplayLabel = 'UNIDADE'
      FieldName = 'CODUNIDADE'
      Required = True
      OnValidate = cdsPadraoCODUNIDADEValidate
    end
    object cdsPadraoUNIDADE: TStringField
      FieldName = 'UNIDADE'
      ProviderFlags = []
    end
    object cdsPadraoIDALIQUOTA: TIntegerField
      FieldName = 'IDALIQUOTA'
      OnValidate = cdsPadraoIDALIQUOTAValidate
    end
    object cdsPadraoALIQUOTA: TStringField
      FieldName = 'ALIQUOTA'
      ProviderFlags = []
    end
    object cdsPadraoNOVO: TIntegerField
      FieldName = 'NOVO'
    end
    object cdsPadraoALTERADO: TIntegerField
      FieldName = 'ALTERADO'
    end
    object cdsPadraoDATARECEBIDA: TDateField
      FieldName = 'DATARECEBIDA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoEXCLUIR: TStringField
      FieldName = 'EXCLUIR'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoPESO: TFMTBCDField
      FieldName = 'PESO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 15
    end
    object cdsPadraoCUSTO: TFMTBCDField
      FieldName = 'CUSTO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 15
    end
    object cdsPadraoLUCRO: TFMTBCDField
      FieldName = 'LUCRO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 15
    end
    object cdsPadraoVENDA: TFMTBCDField
      FieldName = 'VENDA'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 15
    end
    object cdsPadraoESTOQUE: TIntegerField
      FieldName = 'ESTOQUE'
    end
    object cdsPadraoESTOQUEMINIMO: TIntegerField
      FieldName = 'ESTOQUEMINIMO'
    end
    object cdsPadraoQTDERECEBIDA: TIntegerField
      FieldName = 'QTDERECEBIDA'
    end
    object cdsPadraoPRECO_PROMOCAO: TFMTBCDField
      FieldName = 'PRECO_PROMOCAO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 15
    end
    object cdsPadraoPROMOCAO: TStringField
      FieldName = 'PROMOCAO'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsPadraoVALOR_ESTOQUE: TFMTBCDField
      FieldName = 'VALOR_ESTOQUE'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
  end
  object sqldUnidade: TSQLQuery
    CommandText = 'select * from UNIDADES'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 136
    Top = 88
  end
  object dspUnidade: TTimer
    DataSet = sqldUnidade
    Left = 168
    Top = 88
  end
  object cdsUnidade: TMemDataset
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUnidade'
    Left = 200
    Top = 88
    object cdsUnidadeCODUNIDADE: TIntegerField
      FieldName = 'CODUNIDADE'
      Required = True
    end
    object cdsUnidadeDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 10
    end
  end
  object sqldGrupo: TSQLQuery
    CommandText = 'select * from GRUPOS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 136
    Top = 120
  end
  object dspGrupo: TTimer
    DataSet = sqldGrupo
    Left = 168
    Top = 120
  end
  object cdsGrupo: TMemDataset
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGrupo'
    Left = 200
    Top = 120
    object cdsGrupoCODGRUPO: TIntegerField
      FieldName = 'CODGRUPO'
      Required = True
    end
    object cdsGrupoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 30
    end
  end
  object sqldAliquota: TSQLQuery
    CommandText = 'select * from ALIQUOTAS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 136
    Top = 152
  end
  object dspAliquota: TTimer
    DataSet = sqldAliquota
    Left = 168
    Top = 152
  end
  object cdsAliquota: TMemDataset
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAliquota'
    Left = 200
    Top = 152
    object cdsAliquotaCODALIQUOTA: TIntegerField
      FieldName = 'CODALIQUOTA'
      Required = True
    end
    object cdsAliquotaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
    end
  end
  object sqldForn: TSQLQuery
    CommandText = 
      'select'#13#10'  CODFORNECEDOR,'#13#10'  FANTAZIA,'#13#10'  CNPJ,'#13#10'  TELEFONE'#13#10'from' +
      ' FORNECEDORES'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 136
    Top = 184
  end
  object dspForn: TTimer
    DataSet = sqldForn
    Left = 168
    Top = 184
  end
  object cdsForn: TMemDataset
    Aggregates = <>
    Params = <>
    ProviderName = 'dspForn'
    Left = 200
    Top = 184
    object cdsFornCODFORNECEDOR: TIntegerField
      FieldName = 'CODFORNECEDOR'
      Required = True
    end
    object cdsFornFANTAZIA: TStringField
      FieldName = 'FANTAZIA'
      Required = True
      Size = 40
    end
    object cdsFornCNPJ: TStringField
      FieldName = 'CNPJ'
      Required = True
    end
    object cdsFornTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Required = True
    end
  end
end
