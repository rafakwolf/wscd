inherited frmVendas: TfrmVendas
  Left = 228
  Height = 549
  Top = 69
  Width = 913
  Caption = 'Vendas'
  ClientHeight = 549
  ClientWidth = 913
  Font.Name = 'Verdana'
  inherited sbStatus: TStatusBar
    Top = 531
    Width = 913
  end
  inherited pnBotoesPadrao: TPanel
    Width = 913
    ClientWidth = 913
    TabOrder = 20
    inherited btnNovo: TSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnAlterar: TSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnExcluir: TSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnSalvar: TSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnCancelar: TSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnConsultar: TSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnSair: TSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnPrint: TSpeedButton
      Font.Name = 'Verdana'
    end
  end
  object pnlTotal: TPanel[2]
    Left = 0
    Height = 35
    Top = 496
    Width = 913
    Align = alBottom
    ClientHeight = 35
    ClientWidth = 913
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 19
    object lbTotalDesc: TLabel
      Left = 503
      Height = 15
      Top = 11
      Width = 94
      Caption = 'Total desconto'
      ParentColor = False
      ParentShowHint = False
      ShowHint = True
    end
    object lbTotal: TLabel
      Left = 724
      Height = 15
      Top = 11
      Width = 31
      Caption = 'Total'
      ParentColor = False
      ParentShowHint = False
      ShowHint = True
    end
    object dbeTotalDesc: TDBEdit
      Left = 592
      Height = 33
      Top = 7
      Width = 121
      DataField = 'TOTALDESCTO'
      DataSource = dsVendas
      CharCase = ecNormal
      MaxLength = 0
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object dbeTotal: TDBEdit
      Left = 756
      Height = 33
      Top = 7
      Width = 127
      DataField = 'TOTAL'
      DataSource = dsVendas
      CharCase = ecNormal
      Color = clInfoBk
      Font.CharSet = ANSI_CHARSET
      Font.Name = 'Verdana'
      MaxLength = 0
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
  end
  object LabelObs: TLabel[3]
    Left = 16
    Height = 15
    Top = 120
    Width = 77
    Caption = 'Observação'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbNumero: TLabel[4]
    Left = 16
    Height = 15
    Top = 40
    Width = 80
    Caption = 'Nº da venda'
    Font.CharSet = ANSI_CHARSET
    Font.Name = 'Verdana'
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object LabelConcluida: TLabel[5]
    Left = 744
    Height = 15
    Top = 40
    Width = 64
    Caption = 'Concluída'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object btnInsereProduto: TBitBtn[6]
    Left = 864
    Height = 21
    Top = 208
    Width = 25
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF046209035F09035606014F04014C0401
      4C04014C04014C04014C04014C04014C04013D03FF00FFFF00FFFF00FF078216
      0C9C23099A1D07961505920F03900B038F0A038F0A03900A03900A038F0A0396
      0B027407013D03FF00FFFF00FF0D982513B53A0FAF2D0CAC2309AB1C06A71504
      A50E03A50C03A50C03A50C03A40C03AC0D03960A014C04FF00FFFF00FF10A02D
      1CB44916AD3911A92F0DA7260AA41E07A016059F10039E0C039D0B039C0B03A4
      0C03900A014D04FF00FFFF00FF11A12F28B85B1FB24CFEFEFE12AA350EA72A0B
      A522FEFEFE05A013039F0D039D0B03A50C03900A014C04FF00FFFF00FF11A12F
      3EC2702DBA5FFEFEFEFEFEFE13AB360FA92DFEFEFEFEFEFE06A016049E0F03A4
      0C03900A014C04FF00FFFF00FF11A12F5CCC8838BD6724B757FEFEFEFEFEFE14
      AC3A11AB31FEFEFEFEFEFE08A11905A71203910B014D04FF00FFFF00FF11A12F
      70D49742C2702AB85B21B553FEFEFEFEFEFE15AD3E11AB35FEFEFEFEFEFE09A9
      1C059311025405FF00FFFF00FF11A12F7DD79F4AC5762FBB5FFEFEFEFEFEFE1C
      B24E1AB14AFEFEFEFEFEFE0FA92D0DAC2709991B035F09FF00FFFF00FF11A12F
      86DAA654C97FFEFEFEFEFEFE28B85923B555FEFEFEFEFEFE18B04515AD3B12AF
      350D9E25056B0CFF00FFFF00FF11A12F93DEB166CF8CFEFEFE3FC16D34BD642C
      BA5DFEFEFE23B5551DB25019B04817B14210A12F06760FFF00FFFF00FF11A130
      99E1B590DDAD78D59A6CD0915DCB864CC6783FC16D2CBA5D20B5531DB2511CB5
      4F15A93D088414FF00FFFF00FF11A12F79D79F99E1B69DE2B893DEB183DAA56D
      D3954FC97E35BF6824B75920B5551FB85818AD43098E16FF00FFFF00FFFF00FF
      22A94037B55539B55637B55433B2502AAF4921AA401AA63913A43112A13212A4
      310C9A23FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
    }
    OnClick = btnInsereProdutoClick
    ParentShowHint = False
    ShowHint = True
    TabOrder = 17
  end
  object dbConcluida: TDBEdit[7]
    Left = 744
    Height = 33
    Top = 56
    Width = 57
    DataField = 'CONCLUIDA'
    DataSource = dsVendas
    ReadOnly = True
    CharCase = ecNormal
    Color = clBtnFace
    Font.CharSet = ANSI_CHARSET
    Font.Name = 'Verdana'
    MaxLength = 0
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
  object dbProduto: TDBEdit[8]
    Left = 1
    Height = 33
    Hint = 'Pesquisar < F2 >'
    Top = 208
    Width = 303
    DataField = 'NOMEPRODUTO'
    DataSource = dsSelecao
    ReadOnly = True
    CharCase = ecNormal
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
  end
  object dbeNumero: TDBEdit[9]
    Left = 16
    Height = 33
    Top = 56
    Width = 89
    DataField = 'CODIGO'
    DataSource = dsVendas
    ReadOnly = True
    CharCase = ecNormal
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object dbQtde: TDBEdit[10]
    Left = 327
    Height = 33
    Top = 208
    Width = 48
    DataField = 'QTDE'
    DataSource = dsSelecao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
  end
  object dbCusto: TDBEdit[11]
    Left = 377
    Height = 33
    Top = 208
    Width = 79
    DataField = 'CUSTO'
    DataSource = dsSelecao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
    OnKeyPress = dbCustoKeyPress
  end
  object dbVenda: TDBEdit[12]
    Left = 458
    Height = 33
    Top = 208
    Width = 75
    DataField = 'VENDA'
    DataSource = dsSelecao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
    OnExit = dbVendaExit
    OnKeyPress = dbVendaKeyPress
  end
  object dbDescto: TDBEdit[13]
    Left = 535
    Height = 33
    Top = 208
    Width = 72
    DataField = 'DESCTO'
    DataSource = dsSelecao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
    OnExit = dbDesctoExit
    OnKeyPress = dbDesctoKeyPress
  end
  object dbValorDescto: TDBEdit[14]
    Left = 608
    Height = 33
    Top = 208
    Width = 82
    DataField = 'VALORDESCTO'
    DataSource = dsSelecao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 14
    OnKeyPress = dbValorDesctoKeyPress
  end
  object dbTotalProduto: TDBEdit[15]
    Left = 692
    Height = 33
    Top = 208
    Width = 84
    DataField = 'TOTAL'
    DataSource = dsSelecao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 15
    OnKeyPress = dbTotalProdutoKeyPress
  end
  object dbCodCliente: TDBEdit[16]
    Left = 16
    Height = 33
    Hint = 'Pesquisar < F2 >'
    Top = 96
    Width = 91
    DataField = 'CODCLIENTE'
    DataSource = dsVendas
    ReadOnly = True
    CharCase = ecNormal
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
  end
  object dbdDataVenda: TDBEdit[17]
    Left = 112
    Height = 33
    Top = 56
    Width = 121
    DataField = 'DATA'
    DataSource = dsVendas
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object dbeIdVendedor: TDBEdit[18]
    Left = 240
    Height = 33
    Hint = 'Pesquisar < F2 >'
    Top = 56
    Width = 91
    DataField = 'IDVENDEDOR'
    DataSource = dsVendas
    ReadOnly = True
    CharCase = ecNormal
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object dbeVendedor: TDBEdit[19]
    Left = 360
    Height = 33
    Top = 56
    Width = 377
    DataField = 'VENDEDOR'
    DataSource = dsVendas
    ReadOnly = True
    CharCase = ecNormal
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object dbeCliente: TDBEdit[20]
    Left = 136
    Height = 33
    Top = 96
    Width = 737
    DataField = 'CLIENTE'
    DataSource = dsVendas
    ReadOnly = True
    CharCase = ecNormal
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
  end
  object dbeCancelada: TDBEdit[21]
    Left = 808
    Height = 33
    Top = 56
    Width = 65
    DataField = 'CANCELADO'
    DataSource = dsVendas
    ReadOnly = True
    CharCase = ecNormal
    Color = clBtnFace
    Font.CharSet = ANSI_CHARSET
    Font.Name = 'Verdana'
    MaxLength = 0
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
  end
  object dbeComissao: TDBEdit[22]
    Left = 778
    Height = 33
    Top = 208
    Width = 85
    DataField = 'COMISSAO'
    DataSource = dsSelecao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 16
  end
  object bvlLinha: TPanel[23]
    Left = 1
    Height = 2
    Top = 183
    Width = 888
    Caption = 'bvlLinha'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 22
  end
  object dbmObs: TDBMemo[24]
    Left = 16
    Height = 41
    Top = 136
    Width = 857
    DataField = 'OBS'
    DataSource = dsVendas
    ParentShowHint = False
    ScrollBars = ssVertical
    ShowHint = True
    TabOrder = 8
  end
  object grdItens: TDBGrid[25]
    Left = 0
    Height = 222
    Top = 274
    Width = 913
    Align = alBottom
    Color = clWindow
    Columns = <>
    DataSource = dsItens
    Font.CharSet = ANSI_CHARSET
    Font.Name = 'Verdana'
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ShowHint = True
    TabOrder = 18
    OnDblClick = grdItensDblClick
  end
  inherited actlNavigateActions: TActionList[26]
    Left = 440
    Top = 292
  end
  inherited dsPadrao: TDataSource[27]
    DataSet = cdsVendas
    Left = 503
    Top = 292
  end
  object sqldClientes: TSQLQuery[28]
    FieldDefs = <>
    Params = <>
    Left = 24
    Top = 312
    object sqldClientesCODCLIENTE: TIntegerField
      FieldKind = fkData
      FieldName = 'CODCLIENTE'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object sqldClientesNOME: TStringField
      FieldKind = fkData
      FieldName = 'NOME'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldClientesTELEFONE: TStringField
      FieldKind = fkData
      FieldName = 'TELEFONE'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldClientesRG_IE: TStringField
      FieldKind = fkData
      FieldName = 'RG_IE'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldClientesCPF_CNPJ: TStringField
      FieldKind = fkData
      FieldName = 'CPF_CNPJ'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldClientesDATA_NASC: TDateField
      FieldKind = fkData
      FieldName = 'DATA_NASC'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldClientesDESCRICAO: TStringField
      FieldKind = fkData
      FieldName = 'DESCRICAO'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
  end
  object dspClientes: TTimer[29]
    Left = 56
    Top = 312
  end
  object cdsClientes: TMemDataset[30]
    FieldDefs = <>
    Left = 88
    Top = 312
    object cdsClientesCODCLIENTE: TIntegerField
      FieldKind = fkData
      FieldName = 'CODCLIENTE'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object cdsClientesNOME: TStringField
      FieldKind = fkData
      FieldName = 'NOME'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsClientesTELEFONE: TStringField
      FieldKind = fkData
      FieldName = 'TELEFONE'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsClientesRG_IE: TStringField
      FieldKind = fkData
      FieldName = 'RG_IE'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsClientesCPF_CNPJ: TStringField
      FieldKind = fkData
      FieldName = 'CPF_CNPJ'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsClientesDATA_NASC: TDateField
      FieldKind = fkData
      FieldName = 'DATA_NASC'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsClientesDESCRICAO: TStringField
      FieldKind = fkData
      FieldName = 'DESCRICAO'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
  end
  object sqldProdutos: TSQLQuery[31]
    FieldDefs = <>
    Params = <>
    Left = 24
    Top = 344
    object sqldProdutosIDPRODUTO: TIntegerField
      FieldKind = fkData
      FieldName = 'IDPRODUTO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object sqldProdutosCODBARRA: TStringField
      FieldKind = fkData
      FieldName = 'CODBARRA'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 13
    end
    object sqldProdutosDESCRICAO: TStringField
      FieldKind = fkData
      FieldName = 'DESCRICAO'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldProdutosABREVIACAO: TStringField
      FieldKind = fkData
      FieldName = 'ABREVIACAO'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldProdutosPRECO_PROMOCAO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'PRECO_PROMOCAO'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object sqldProdutosCUSTO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'CUSTO'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object sqldProdutosLUCRO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'LUCRO'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object sqldProdutosVENDA: TFMTBCDField
      FieldKind = fkData
      FieldName = 'VENDA'
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
    object sqldProdutosESTOQUE: TIntegerField
      FieldKind = fkData
      FieldName = 'ESTOQUE'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldProdutosESTOQUEMINIMO: TIntegerField
      FieldKind = fkData
      FieldName = 'ESTOQUEMINIMO'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldProdutosPROMOCAO: TStringField
      FieldKind = fkData
      FieldName = 'PROMOCAO'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
  end
  object dspProdutos: TTimer[32]
    Left = 56
    Top = 344
  end
  object cdsProdutos: TMemDataset[33]
    FieldDefs = <>
    Left = 88
    Top = 344
    object cdsProdutosIDPRODUTO: TIntegerField
      FieldKind = fkData
      FieldName = 'IDPRODUTO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object cdsProdutosCODBARRA: TStringField
      FieldKind = fkData
      FieldName = 'CODBARRA'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 13
    end
    object cdsProdutosDESCRICAO: TStringField
      FieldKind = fkData
      FieldName = 'DESCRICAO'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsProdutosABREVIACAO: TStringField
      FieldKind = fkData
      FieldName = 'ABREVIACAO'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsProdutosPRECO_PROMOCAO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'PRECO_PROMOCAO'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object cdsProdutosCUSTO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'CUSTO'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object cdsProdutosLUCRO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'LUCRO'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object cdsProdutosVENDA: TFMTBCDField
      FieldKind = fkData
      FieldName = 'VENDA'
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
    object cdsProdutosESTOQUE: TIntegerField
      FieldKind = fkData
      FieldName = 'ESTOQUE'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsProdutosESTOQUEMINIMO: TIntegerField
      FieldKind = fkData
      FieldName = 'ESTOQUEMINIMO'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsProdutosPROMOCAO: TStringField
      FieldKind = fkData
      FieldName = 'PROMOCAO'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
  end
  object sqldSelecao: TSQLQuery[34]
    FieldDefs = <>
    Params = <>
    Left = 264
    Top = 288
    object sqldSelecaoPRODUTO: TIntegerField
      FieldKind = fkData
      FieldName = 'PRODUTO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldSelecaoNOMEPRODUTO: TStringField
      FieldKind = fkData
      FieldName = 'NOMEPRODUTO'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldSelecaoQTDE: TFMTBCDField
      FieldKind = fkData
      FieldName = 'QTDE'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object sqldSelecaoCUSTO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'CUSTO'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object sqldSelecaoVENDA: TFMTBCDField
      FieldKind = fkData
      FieldName = 'VENDA'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object sqldSelecaoDESCTO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'DESCTO'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object sqldSelecaoVALORDESCTO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'VALORDESCTO'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object sqldSelecaoTOTAL: TFMTBCDField
      FieldKind = fkData
      FieldName = 'TOTAL'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object sqldSelecaoCOMISSAO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'COMISSAO'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
  end
  object dspSelecao: TTimer[35]
    Left = 296
    Top = 288
  end
  object cdsSelecao: TMemDataset[36]
    FieldDefs = <>
    AfterPost = cdsSelecaoAfterPost
    Left = 328
    Top = 288
    object cdsSelecaoPRODUTO: TIntegerField
      FieldKind = fkData
      FieldName = 'PRODUTO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsSelecaoNOMEPRODUTO: TStringField
      FieldKind = fkData
      FieldName = 'NOMEPRODUTO'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsSelecaoQTDE: TFMTBCDField
      FieldKind = fkData
      FieldName = 'QTDE'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object cdsSelecaoCUSTO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'CUSTO'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object cdsSelecaoVENDA: TFMTBCDField
      FieldKind = fkData
      FieldName = 'VENDA'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object cdsSelecaoDESCTO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'DESCTO'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object cdsSelecaoVALORDESCTO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'VALORDESCTO'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object cdsSelecaoTOTAL: TFMTBCDField
      FieldKind = fkData
      FieldName = 'TOTAL'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object cdsSelecaoCOMISSAO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'COMISSAO'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
  end
  object dsSelecao: TDataSource[37]
    DataSet = cdsSelecao
    Left = 360
    Top = 288
  end
  object sqlVendas: TSQLQuery[38]
    FieldDefs = <>
    SQL.Strings = (
      'select'
      '  ven.CODIGO,'
      '  ven.CODCLIENTE,'
      '  cli.Nome CLIENTE,'
      '  ven.IDVENDEDOR,'
      '  vd.VENDEDOR,'
      '  ven.DATA,'
      '  ven.OBS,'
      '  ven.TOTALDESCTO,'
      '  ven.TOTAL,'
      '  ven.CONCLUIDA,'
      '  ven.BAIXADO,'
      '  ven.CANCELADO'
      'from VENDA ven'
      'left join CLIENTES cli on (cli.Codcliente = ven.Codcliente)'
      'left join VENDEDOR vd on (vd.IDVENDEDOR = ven.IDVENDEDOR)'
      'where ven.CANCELADO = ''N'''
    )
    Params = <>
    Left = 263
    Top = 339
    object sqlVendasCODIGO: TIntegerField
      FieldKind = fkData
      FieldName = 'CODIGO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object sqlVendasCODCLIENTE: TIntegerField
      FieldKind = fkData
      FieldName = 'CODCLIENTE'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqlVendasCLIENTE: TStringField
      FieldKind = fkData
      FieldName = 'CLIENTE'
      Index = 2
      LookupCache = False
      ProviderFlags = []
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqlVendasIDVENDEDOR: TIntegerField
      FieldKind = fkData
      FieldName = 'IDVENDEDOR'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqlVendasVENDEDOR: TStringField
      FieldKind = fkData
      FieldName = 'VENDEDOR'
      Index = 4
      LookupCache = False
      ProviderFlags = []
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqlVendasDATA: TDateField
      FieldKind = fkData
      FieldName = 'DATA'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqlVendasOBS: TStringField
      FieldKind = fkData
      FieldName = 'OBS'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 250
    end
    object sqlVendasTOTALDESCTO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'TOTALDESCTO'
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
    object sqlVendasTOTAL: TFMTBCDField
      FieldKind = fkData
      FieldName = 'TOTAL'
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
    object sqlVendasCONCLUIDA: TStringField
      FieldKind = fkData
      FieldName = 'CONCLUIDA'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object sqlVendasBAIXADO: TStringField
      FieldKind = fkData
      FieldName = 'BAIXADO'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object sqlVendasCANCELADO: TStringField
      FieldKind = fkData
      FieldName = 'CANCELADO'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
  end
  object sqlItens: TSQLQuery[39]
    FieldDefs = <>
    SQL.Strings = (
      'SELECT'
      '  ITV.CODIGO,'
      '  ITV.CODPRODUTO,'
      '  PRO.DESCRICAO PRODUTO,'
      '  ITV.QTD,'
      '  ITV.CUSTO,'
      '  ITV.VENDA,'
      '  ITV.DESCTO,'
      '  ITV.VALORDESCTO,'
      '  ITV.TOTAL,'
      '  ITV.COMISSAO,'
      '  ITV.VALORCOMISSAO'
      'FROM ITEMVENDA ITV'
      'LEFT JOIN PRODUTOS PRO ON (ITV.CODPRODUTO = PRO.IDPRODUTO)'
      'WHERE ITV.CODIGO = :CODIGO'
    )
    Params = <    
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
        Size = 4
      end>
    DataSource = dsLigaVenda
    Left = 263
    Top = 370
    object sqlItensCODIGO: TIntegerField
      FieldKind = fkData
      FieldName = 'CODIGO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object sqlItensCODPRODUTO: TIntegerField
      FieldKind = fkData
      FieldName = 'CODPRODUTO'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqlItensPRODUTO: TStringField
      FieldKind = fkData
      FieldName = 'PRODUTO'
      Index = 2
      LookupCache = False
      ProviderFlags = []
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqlItensQTD: TIntegerField
      FieldKind = fkData
      FieldName = 'QTD'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqlItensCUSTO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'CUSTO'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object sqlItensVENDA: TFMTBCDField
      FieldKind = fkData
      FieldName = 'VENDA'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object sqlItensDESCTO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'DESCTO'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object sqlItensVALORDESCTO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'VALORDESCTO'
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
    object sqlItensTOTAL: TFMTBCDField
      FieldKind = fkData
      FieldName = 'TOTAL'
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
    object sqlItensCOMISSAO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'COMISSAO'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object sqlItensVALORCOMISSAO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'VALORCOMISSAO'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
  end
  object dsLigaVenda: TDataSource[40]
    DataSet = sqlVendas
    Left = 294
    Top = 370
  end
  object dtVendas: TTimer[41]
    Left = 294
    Top = 339
  end
  object cdsVendas: TMemDataset[42]
    FieldDefs = <>
    AfterInsert = cdsVendasAfterInsert
    Left = 324
    Top = 339
    object cdsVendasCODIGO: TIntegerField
      FieldKind = fkData
      FieldName = 'CODIGO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object cdsVendasCODCLIENTE: TIntegerField
      FieldKind = fkData
      FieldName = 'CODCLIENTE'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      OnValidate = cdsVendasCODCLIENTEValidate
    end
    object cdsVendasCLIENTE: TStringField
      FieldKind = fkData
      FieldName = 'CLIENTE'
      Index = 2
      LookupCache = False
      ProviderFlags = []
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsVendasIDVENDEDOR: TIntegerField
      FieldKind = fkData
      FieldName = 'IDVENDEDOR'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      OnValidate = cdsVendasIDVENDEDORValidate
    end
    object cdsVendasVENDEDOR: TStringField
      FieldKind = fkData
      FieldName = 'VENDEDOR'
      Index = 4
      LookupCache = False
      ProviderFlags = []
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsVendasDATA: TDateField
      FieldKind = fkData
      FieldName = 'DATA'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsVendasOBS: TStringField
      FieldKind = fkData
      FieldName = 'OBS'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 250
    end
    object cdsVendasTOTALDESCTO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'TOTALDESCTO'
      Index = 7
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
    object cdsVendasTOTAL: TFMTBCDField
      FieldKind = fkData
      FieldName = 'TOTAL'
      Index = 8
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
    object cdsVendasCONCLUIDA: TStringField
      Alignment = taCenter
      FieldKind = fkData
      FieldName = 'CONCLUIDA'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object cdsVendasBAIXADO: TStringField
      Alignment = taCenter
      FieldKind = fkData
      FieldName = 'BAIXADO'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object cdsVendasCANCELADO: TStringField
      Alignment = taCenter
      FieldKind = fkData
      FieldName = 'CANCELADO'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object cdsVendassqlItens: TStringField
      FieldKind = fkData
      FieldName = 'sqlItens'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
  end
  object cdsItens: TMemDataset[43]
    FieldDefs = <>
    BeforePost = cdsItensBeforePost
    BeforeDelete = cdsItensBeforeDelete
    Left = 324
    Top = 370
    object cdsItensCODIGO: TIntegerField
      FieldKind = fkData
      FieldName = 'CODIGO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object cdsItensCODPRODUTO: TIntegerField
      FieldKind = fkData
      FieldName = 'CODPRODUTO'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      OnValidate = cdsItensCODPRODUTOValidate
    end
    object cdsItensPRODUTO: TStringField
      FieldKind = fkData
      FieldName = 'PRODUTO'
      Index = 2
      LookupCache = False
      ProviderFlags = []
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsItensQTD: TIntegerField
      FieldKind = fkData
      FieldName = 'QTD'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsItensCUSTO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'CUSTO'
      Index = 4
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
    object cdsItensVENDA: TFMTBCDField
      FieldKind = fkData
      FieldName = 'VENDA'
      Index = 5
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
    object cdsItensDESCTO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'DESCTO'
      Index = 6
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
    object cdsItensVALORDESCTO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'VALORDESCTO'
      Index = 7
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
    object cdsItensTOTAL: TFMTBCDField
      FieldKind = fkData
      FieldName = 'TOTAL'
      Index = 8
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
    object cdsItensCOMISSAO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'COMISSAO'
      Index = 9
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
    object cdsItensVALORCOMISSAO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'VALORCOMISSAO'
      Index = 10
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
  end
  object dsVendas: TDataSource[44]
    AutoEdit = False
    DataSet = cdsVendas
    Left = 357
    Top = 339
  end
  object dsItens: TDataSource[45]
    AutoEdit = False
    DataSet = cdsItens
    Left = 357
    Top = 370
  end
  object sqldVendedor: TSQLQuery[46]
    FieldDefs = <>
    Params = <>
    Left = 24
    Top = 376
    object sqldVendedorIDVENDEDOR: TIntegerField
      FieldKind = fkData
      FieldName = 'IDVENDEDOR'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object sqldVendedorVENDEDOR: TStringField
      FieldKind = fkData
      FieldName = 'VENDEDOR'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldVendedorATIVO: TStringField
      FieldKind = fkData
      FieldName = 'ATIVO'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
  end
  object dspVendedor: TTimer[47]
    Left = 56
    Top = 376
  end
  object cdsVendedor: TMemDataset[48]
    FieldDefs = <>
    Left = 88
    Top = 376
    object cdsVendedorIDVENDEDOR: TIntegerField
      FieldKind = fkData
      FieldName = 'IDVENDEDOR'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object cdsVendedorVENDEDOR: TStringField
      FieldKind = fkData
      FieldName = 'VENDEDOR'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsVendedorATIVO: TStringField
      FieldKind = fkData
      FieldName = 'ATIVO'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
  end
  object spDeleta: TSQLQuery[49]
    FieldDefs = <>
    Params = <    
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    Left = 168
    Top = 344
  end
  object spEstorna: TSQLQuery[50]
    FieldDefs = <>
    Params = <    
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    Left = 168
    Top = 376
  end
  object spBaixa: TSQLQuery[51]
    FieldDefs = <>
    Params = <    
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    Left = 168
    Top = 408
  end
  object mnVenda: TMainMenu[52]
    Left = 456
    Top = 351
    object miRegistros: TMenuItem
      Caption = 'Registros'
      object miIncluir: TMenuItem
        Caption = 'Novo'
        OnClick = btnNovoClick
      end
      object miAlterar: TMenuItem
        Caption = 'Alterar'
        ShortCut = 116
      end
      object miCancelar: TMenuItem
        Caption = 'Cancelar'
        OnClick = btnCancelClick
      end
    end
    object miFerramentas: TMenuItem
      Caption = 'Ferramentas'
      object miLocalizar: TMenuItem
        Caption = 'Pesquisar'
        ShortCut = 119
        OnClick = btnConsultarClick
      end
      object miOutrosFiltros: TMenuItem
        Caption = 'Outros filtros'
        object miFiltrarData: TMenuItem
          Caption = 'Filtrar por data'
          OnClick = miFiltrarDataClick
        end
        object miFiltrarCli: TMenuItem
          Caption = 'Filtrar por cliente'
        end
        object miVendasNaoConc: TMenuItem
          Caption = 'Vendas não concluídas'
          OnClick = miVendasNaoConcClick
        end
      end
      object miMostrarTodos: TMenuItem
        Caption = 'Limpar filtros'
        OnClick = miMostrarTodosClick
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object N11: TMenuItem
        Caption = '-'
      end
      object miCadastroCliente: TMenuItem
        Caption = 'Cadastrar cliente'
        OnClick = miCadastroClienteClick
      end
      object miCadastravendedor: TMenuItem
        Caption = 'Cadastra vendedor'
        OnClick = miCadastravendedorClick
      end
      object miCadastraproduto: TMenuItem
        Caption = 'Cadastra produto'
        OnClick = miCadastraprodutoClick
      end
    end
    object miRelatorio: TMenuItem
      Caption = 'Relatórios'
      object miRelVendaAtual: TMenuItem
        Caption = 'Venda atual'
        OnClick = miRelVendaAtualClick
      end
      object N10: TMenuItem
        Caption = '-'
      end
      object miVendaBobina: TMenuItem
        Caption = 'Venda em bobina'
        OnClick = miVendaBobinaClick
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object miRelVendaMes: TMenuItem
        Caption = 'Vendas por mês'
      end
      object miRelVendaAno: TMenuItem
        Caption = 'Vendas por ano'
      end
      object miRelVendaPeriodo: TMenuItem
        Caption = 'Vendas por período'
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object miRelVendaCliente: TMenuItem
        Caption = 'Vendas por cliente'
        OnClick = miRelVendaClienteClick
      end
      object N12: TMenuItem
        Caption = '-'
      end
      object miRelComissaoVendedor: TMenuItem
        Caption = 'Comissão do vendedor'
        OnClick = miRelComissaoVendedorClick
      end
    end
  end
end
