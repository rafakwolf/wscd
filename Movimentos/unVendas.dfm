inherited frmVendas: TfrmVendas
  Left = 200
  Top = 114
  Caption = 'Vendas'
  ClientHeight = 570
  ClientWidth = 890
  Menu = mnVenda
  ExplicitWidth = 896
  ExplicitHeight = 619
  PixelsPerInch = 96
  TextHeight = 13
  object LabelObs: TLabel [0]
    Left = 16
    Top = 120
    Width = 68
    Height = 13
    Caption = 'Observa'#231#227'o'
  end
  object lbNumero: TLabel [1]
    Left = 16
    Top = 40
    Width = 71
    Height = 13
    Caption = 'N'#186' da venda'
    FocusControl = dbeNumero
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object LabelConcluida: TLabel [2]
    Left = 744
    Top = 40
    Width = 56
    Height = 13
    Caption = 'Conclu'#237'da'
  end
  object bvlLinha: TBevel [3]
    Left = 1
    Top = 183
    Width = 888
    Height = 2
  end
  object dbConcluida: TDBEdit [4]
    Left = 744
    Top = 56
    Width = 57
    Height = 21
    Color = clBtnFace
    DataField = 'CONCLUIDA'
    DataSource = dsVendas
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
  end
  object grdItens: TDBGrid [5]
    Left = 0
    Top = 231
    Width = 890
    Height = 285
    Align = alBottom
    Ctl3D = True
    DataSource = dsItens
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 18
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'Verdana'
    TitleFont.Style = []
    OnDblClick = grdItensDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'PRODUTO'
        Title.Caption = 'Produto'
        Width = 313
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTD'
        Title.Caption = 'Qtde'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUSTO'
        Title.Caption = 'Custo'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VENDA'
        Title.Caption = 'Venda'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCTO'
        Title.Caption = 'Descto %'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALORDESCTO'
        Title.Caption = 'Valor Descto'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        Title.Caption = 'Total'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMISSAO'
        Title.Caption = 'Comiss'#227'o'
        Width = 82
        Visible = True
      end>
  end
  object dbProduto: TDBEdit [6]
    Left = 1
    Top = 208
    Width = 303
    Height = 21
    Hint = 'Pesquisar < F2 >'
    Color = clBtnFace
    DataField = 'NOMEPRODUTO'
    DataSource = dsSelecao
    ReadOnly = True
    TabOrder = 9
  end
  object dbeNumero: TDBEdit [7]
    Left = 16
    Top = 56
    Width = 89
    Height = 21
    BiDiMode = bdRightToLeft
    Color = clBtnFace
    Ctl3D = True
    DataField = 'CODIGO'
    DataSource = dsVendas
    ParentBiDiMode = False
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 0
  end
  object dbQtde: TDBEdit [8]
    Left = 327
    Top = 208
    Width = 48
    Height = 21
    DataField = 'QTDE'
    DataSource = dsSelecao
    TabOrder = 10
  end
  object dbCusto: TDBEdit [9]
    Left = 377
    Top = 208
    Width = 79
    Height = 21
    DataField = 'CUSTO'
    DataSource = dsSelecao
    TabOrder = 11
    OnKeyPress = dbCustoKeyPress
  end
  object dbVenda: TDBEdit [10]
    Left = 458
    Top = 208
    Width = 75
    Height = 21
    DataField = 'VENDA'
    DataSource = dsSelecao
    TabOrder = 12
    OnExit = dbVendaExit
    OnKeyPress = dbVendaKeyPress
  end
  object dbDescto: TDBEdit [11]
    Left = 535
    Top = 208
    Width = 72
    Height = 21
    DataField = 'DESCTO'
    DataSource = dsSelecao
    TabOrder = 13
    OnExit = dbDesctoExit
    OnKeyPress = dbDesctoKeyPress
  end
  object dbValorDescto: TDBEdit [12]
    Left = 608
    Top = 208
    Width = 82
    Height = 21
    DataField = 'VALORDESCTO'
    DataSource = dsSelecao
    TabOrder = 14
    OnKeyPress = dbValorDesctoKeyPress
  end
  object dbTotalProduto: TDBEdit [13]
    Left = 692
    Top = 208
    Width = 84
    Height = 21
    DataField = 'TOTAL'
    DataSource = dsSelecao
    TabOrder = 15
    OnKeyPress = dbTotalProdutoKeyPress
  end
  object btnInsereProduto: TBitBtn [14]
    Left = 864
    Top = 208
    Width = 25
    Height = 21
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
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    TabOrder = 17
    OnClick = btnInsereProdutoClick
  end
  object dbCodCliente: TDBEdit [15]
    Left = 16
    Top = 96
    Width = 91
    Height = 21
    Hint = 'Pesquisar < F2 >'
    Color = clBtnFace
    DataField = 'CODCLIENTE'
    DataSource = dsVendas
    ReadOnly = True
    TabOrder = 6
  end
  object dbdDataVenda: TDBEdit [16]
    Left = 112
    Top = 56
    Width = 121
    Height = 21
    DataField = 'DATA'
    DataSource = dsVendas
    TabOrder = 1
  end
  object dbmObs: TDBMemo [17]
    Left = 16
    Top = 136
    Width = 857
    Height = 41
    DataField = 'OBS'
    DataSource = dsVendas
    ScrollBars = ssVertical
    TabOrder = 8
  end
  object pnlTotal: TPanel [18]
    Left = 0
    Top = 516
    Width = 890
    Height = 35
    Align = alBottom
    TabOrder = 19
    object lbTotalDesc: TLabel
      Left = 503
      Top = 11
      Width = 82
      Height = 13
      Caption = 'Total desconto'
    end
    object lbTotal: TLabel
      Left = 724
      Top = 11
      Width = 27
      Height = 13
      Caption = 'Total'
      FocusControl = dbeTotal
    end
    object dbeTotalDesc: TDBEdit
      Left = 592
      Top = 7
      Width = 121
      Height = 21
      DataField = 'TOTALDESCTO'
      DataSource = dsVendas
      TabOrder = 0
    end
    object dbeTotal: TDBEdit
      Left = 756
      Top = 7
      Width = 127
      Height = 21
      Color = clInfoBk
      DataField = 'TOTAL'
      DataSource = dsVendas
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  object dbeIdVendedor: TDBEdit [19]
    Left = 240
    Top = 56
    Width = 91
    Height = 21
    Hint = 'Pesquisar < F2 >'
    Color = clBtnFace
    DataField = 'IDVENDEDOR'
    DataSource = dsVendas
    ReadOnly = True
    TabOrder = 2
  end
  object dbeVendedor: TDBEdit [20]
    Left = 360
    Top = 56
    Width = 377
    Height = 21
    Color = clBtnFace
    DataField = 'VENDEDOR'
    DataSource = dsVendas
    ReadOnly = True
    TabOrder = 3
  end
  object dbeCliente: TDBEdit [21]
    Left = 136
    Top = 96
    Width = 737
    Height = 21
    Color = clBtnFace
    DataField = 'CLIENTE'
    DataSource = dsVendas
    ReadOnly = True
    TabOrder = 7
  end
  object dbeCancelada: TDBEdit [22]
    Left = 808
    Top = 56
    Width = 65
    Height = 21
    Color = clBtnFace
    DataField = 'CANCELADO'
    DataSource = dsVendas
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
  end
  object dbeComissao: TDBEdit [23]
    Left = 778
    Top = 208
    Width = 85
    Height = 21
    DataField = 'COMISSAO'
    DataSource = dsSelecao
    TabOrder = 16
  end
  inherited sbStatus: TStatusBar
    Top = 551
    Width = 890
    ExplicitTop = 551
    ExplicitWidth = 890
  end
  inherited pnBotoesPadrao: TPanel
    Width = 890
    TabOrder = 20
    ExplicitWidth = 890
  end
  inherited actlNavigateActions: TActionList
    Left = 440
    Top = 292
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsVendas
    Left = 503
    Top = 292
  end
  inherited mmPadrao: TMainMenu
    Left = 472
    Top = 292
  end
  object mnVenda: TMainMenu
    Left = 456
    Top = 327
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
          OnClick = miFiltrarCliClick
        end
        object miVendasNaoConc: TMenuItem
          Caption = 'Vendas n'#227'o conclu'#237'das'
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
      Caption = 'Relat'#243'rios'
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
        Caption = 'Vendas por m'#234's'
      end
      object miRelVendaAno: TMenuItem
        Caption = 'Vendas por ano'
      end
      object miRelVendaPeriodo: TMenuItem
        Caption = 'Vendas por per'#237'odo'
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
        Caption = 'Comiss'#227'o do vendedor'
        OnClick = miRelComissaoVendedorClick
      end
    end
  end
  object sqldClientes: TSQLDataSet
    CommandText = 
      'select'#13#10'  cli.CODCLIENTE,'#13#10'  cli.NOME,'#13#10'  cli.TELEFONE,'#13#10'  cli.R' +
      'G_IE,'#13#10'  cli.CPF_CNPJ,'#13#10'  cli.DATA_NASC,'#13#10'  cid.DESCRICAO'#13#10'from ' +
      'CLIENTES cli'#13#10'left join CIDADES cid on (cli.CODCIDADE = cid.CODC' +
      'IDADE)'#13#10'order by cli.NOME'
    MaxBlobSize = -1
    Params = <>
    Left = 24
    Top = 312
    object sqldClientesCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
      Required = True
    end
    object sqldClientesNOME: TStringField
      FieldName = 'NOME'
      Size = 80
    end
    object sqldClientesTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
    object sqldClientesRG_IE: TStringField
      FieldName = 'RG_IE'
    end
    object sqldClientesCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
    end
    object sqldClientesDATA_NASC: TDateField
      FieldName = 'DATA_NASC'
    end
    object sqldClientesDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
  end
  object dspClientes: TDataSetProvider
    DataSet = sqldClientes
    Left = 56
    Top = 312
  end
  object cdsClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspClientes'
    Left = 88
    Top = 312
    object cdsClientesCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
      Required = True
    end
    object cdsClientesNOME: TStringField
      FieldName = 'NOME'
      Size = 80
    end
    object cdsClientesTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
    object cdsClientesRG_IE: TStringField
      FieldName = 'RG_IE'
    end
    object cdsClientesCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
    end
    object cdsClientesDATA_NASC: TDateField
      FieldName = 'DATA_NASC'
    end
    object cdsClientesDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
  end
  object sqldProdutos: TSQLDataSet
    CommandText = 
      'select'#13#10'  p.IDPRODUTO,'#13#10'  p.CODBARRA, '#13#10'  p.DESCRICAO,'#13#10'  p.ABRE' +
      'VIACAO,'#13#10'  p.PRECO_PROMOCAO, '#13#10'  p.CUSTO, '#13#10'  p.LUCRO, '#13#10'  p.VEN' +
      'DA, '#13#10'  p.ESTOQUE, '#13#10'  p.ESTOQUEMINIMO,'#13#10'  p.PROMOCAO'#13#10'from PROD' +
      'UTOS p'#13#10'order by p.DESCRICAO'
    MaxBlobSize = -1
    Params = <>
    Left = 24
    Top = 344
    object sqldProdutosIDPRODUTO: TIntegerField
      FieldName = 'IDPRODUTO'
      Required = True
    end
    object sqldProdutosCODBARRA: TStringField
      FieldName = 'CODBARRA'
      Size = 13
    end
    object sqldProdutosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
    object sqldProdutosABREVIACAO: TStringField
      FieldName = 'ABREVIACAO'
      Size = 80
    end
    object sqldProdutosPRECO_PROMOCAO: TFMTBCDField
      FieldName = 'PRECO_PROMOCAO'
      Precision = 15
    end
    object sqldProdutosCUSTO: TFMTBCDField
      FieldName = 'CUSTO'
      Precision = 15
    end
    object sqldProdutosLUCRO: TFMTBCDField
      FieldName = 'LUCRO'
      Precision = 15
    end
    object sqldProdutosVENDA: TFMTBCDField
      FieldName = 'VENDA'
      Precision = 15
    end
    object sqldProdutosESTOQUE: TIntegerField
      FieldName = 'ESTOQUE'
    end
    object sqldProdutosESTOQUEMINIMO: TIntegerField
      FieldName = 'ESTOQUEMINIMO'
    end
    object sqldProdutosPROMOCAO: TStringField
      FieldName = 'PROMOCAO'
      FixedChar = True
      Size = 1
    end
  end
  object dspProdutos: TDataSetProvider
    DataSet = sqldProdutos
    Left = 56
    Top = 344
  end
  object cdsProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProdutos'
    Left = 88
    Top = 344
    object cdsProdutosIDPRODUTO: TIntegerField
      FieldName = 'IDPRODUTO'
      Required = True
    end
    object cdsProdutosCODBARRA: TStringField
      FieldName = 'CODBARRA'
      Size = 13
    end
    object cdsProdutosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
    object cdsProdutosABREVIACAO: TStringField
      FieldName = 'ABREVIACAO'
      Size = 80
    end
    object cdsProdutosPRECO_PROMOCAO: TFMTBCDField
      FieldName = 'PRECO_PROMOCAO'
      Precision = 15
    end
    object cdsProdutosCUSTO: TFMTBCDField
      FieldName = 'CUSTO'
      Precision = 15
    end
    object cdsProdutosLUCRO: TFMTBCDField
      FieldName = 'LUCRO'
      Precision = 15
    end
    object cdsProdutosVENDA: TFMTBCDField
      FieldName = 'VENDA'
      Precision = 15
    end
    object cdsProdutosESTOQUE: TIntegerField
      FieldName = 'ESTOQUE'
    end
    object cdsProdutosESTOQUEMINIMO: TIntegerField
      FieldName = 'ESTOQUEMINIMO'
    end
    object cdsProdutosPROMOCAO: TStringField
      FieldName = 'PROMOCAO'
      FixedChar = True
      Size = 1
    end
  end
  object sqldSelecao: TSQLDataSet
    CommandText = 
      'SELECT'#13#10'  cast(NULL as INTEGER) PRODUTO,'#13#10'  cast(NULL as VARCHAR' +
      '(80)) NOMEPRODUTO,'#13#10'  cast(NULL as FLOAT) QTDE,'#13#10'  cast(NULL  as' +
      ' FLOAT) CUSTO,'#13#10'  cast(NULL as FLOAT) VENDA,'#13#10'  cast(NULL as FLO' +
      'AT) DESCTO,'#13#10'  cast(NULL as FLOAT) VALORDESCTO,'#13#10'  cast(NULL as ' +
      'FLOAT) TOTAL,'#13#10'  cast(NULL as FLOAT) COMISSAO'#13#10'from RDB$DATABASE'
    MaxBlobSize = -1
    Params = <>
    Left = 264
    Top = 288
    object sqldSelecaoPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
    end
    object sqldSelecaoNOMEPRODUTO: TStringField
      FieldName = 'NOMEPRODUTO'
      Size = 80
    end
    object sqldSelecaoQTDE: TSingleField
      FieldName = 'QTDE'
    end
    object sqldSelecaoCUSTO: TSingleField
      FieldName = 'CUSTO'
    end
    object sqldSelecaoVENDA: TSingleField
      FieldName = 'VENDA'
    end
    object sqldSelecaoDESCTO: TSingleField
      FieldName = 'DESCTO'
    end
    object sqldSelecaoVALORDESCTO: TSingleField
      FieldName = 'VALORDESCTO'
    end
    object sqldSelecaoTOTAL: TSingleField
      FieldName = 'TOTAL'
    end
    object sqldSelecaoCOMISSAO: TSingleField
      FieldName = 'COMISSAO'
    end
  end
  object dspSelecao: TDataSetProvider
    DataSet = sqldSelecao
    Left = 296
    Top = 288
  end
  object cdsSelecao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSelecao'
    AfterPost = cdsSelecaoAfterPost
    Left = 328
    Top = 288
    object cdsSelecaoPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
    end
    object cdsSelecaoNOMEPRODUTO: TStringField
      FieldName = 'NOMEPRODUTO'
      Size = 80
    end
    object cdsSelecaoQTDE: TSingleField
      FieldName = 'QTDE'
    end
    object cdsSelecaoCUSTO: TSingleField
      FieldName = 'CUSTO'
    end
    object cdsSelecaoVENDA: TSingleField
      FieldName = 'VENDA'
    end
    object cdsSelecaoDESCTO: TSingleField
      FieldName = 'DESCTO'
    end
    object cdsSelecaoVALORDESCTO: TSingleField
      FieldName = 'VALORDESCTO'
    end
    object cdsSelecaoTOTAL: TSingleField
      FieldName = 'TOTAL'
    end
    object cdsSelecaoCOMISSAO: TSingleField
      FieldName = 'COMISSAO'
    end
  end
  object dsSelecao: TDataSource
    DataSet = cdsSelecao
    Left = 360
    Top = 288
  end
  object sqlVendas: TSQLQuery
    MaxBlobSize = -1
    Params = <>
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
      'where ven.CANCELADO = '#39'N'#39)
    Left = 263
    Top = 339
    object sqlVendasCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sqlVendasCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
    end
    object sqlVendasCLIENTE: TStringField
      FieldName = 'CLIENTE'
      ProviderFlags = []
      Size = 80
    end
    object sqlVendasIDVENDEDOR: TIntegerField
      FieldName = 'IDVENDEDOR'
    end
    object sqlVendasVENDEDOR: TStringField
      FieldName = 'VENDEDOR'
      ProviderFlags = []
      Size = 80
    end
    object sqlVendasDATA: TDateField
      FieldName = 'DATA'
    end
    object sqlVendasOBS: TStringField
      FieldName = 'OBS'
      Size = 250
    end
    object sqlVendasTOTALDESCTO: TFMTBCDField
      FieldName = 'TOTALDESCTO'
      Precision = 15
    end
    object sqlVendasTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 15
    end
    object sqlVendasCONCLUIDA: TStringField
      FieldName = 'CONCLUIDA'
      FixedChar = True
      Size = 1
    end
    object sqlVendasBAIXADO: TStringField
      FieldName = 'BAIXADO'
      FixedChar = True
      Size = 1
    end
    object sqlVendasCANCELADO: TStringField
      FieldName = 'CANCELADO'
      FixedChar = True
      Size = 1
    end
  end
  object sqlItens: TSQLQuery
    DataSource = dsLigaVenda
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
        Size = 4
      end>
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
      'WHERE ITV.CODIGO = :CODIGO')
    Left = 263
    Top = 370
    object sqlItensCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sqlItensCODPRODUTO: TIntegerField
      FieldName = 'CODPRODUTO'
    end
    object sqlItensPRODUTO: TStringField
      FieldName = 'PRODUTO'
      ProviderFlags = []
      Size = 80
    end
    object sqlItensQTD: TIntegerField
      FieldName = 'QTD'
    end
    object sqlItensCUSTO: TFMTBCDField
      FieldName = 'CUSTO'
      Precision = 15
    end
    object sqlItensVENDA: TFMTBCDField
      FieldName = 'VENDA'
      Precision = 15
    end
    object sqlItensDESCTO: TFMTBCDField
      FieldName = 'DESCTO'
      Precision = 15
    end
    object sqlItensVALORDESCTO: TFMTBCDField
      FieldName = 'VALORDESCTO'
      Precision = 15
    end
    object sqlItensTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 15
    end
    object sqlItensCOMISSAO: TFMTBCDField
      FieldName = 'COMISSAO'
      Precision = 15
    end
    object sqlItensVALORCOMISSAO: TFMTBCDField
      FieldName = 'VALORCOMISSAO'
      Precision = 15
    end
  end
  object dsLigaVenda: TDataSource
    DataSet = sqlVendas
    Left = 294
    Top = 370
  end
  object dtVendas: TDataSetProvider
    DataSet = sqlVendas
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowCommandText]
    Left = 294
    Top = 339
  end
  object cdsVendas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dtVendas'
    AfterInsert = cdsVendasAfterInsert
    Left = 324
    Top = 339
    object cdsVendasCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsVendasCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
      OnValidate = cdsVendasCODCLIENTEValidate
    end
    object cdsVendasCLIENTE: TStringField
      FieldName = 'CLIENTE'
      ProviderFlags = []
      Size = 80
    end
    object cdsVendasIDVENDEDOR: TIntegerField
      FieldName = 'IDVENDEDOR'
      OnValidate = cdsVendasIDVENDEDORValidate
    end
    object cdsVendasVENDEDOR: TStringField
      FieldName = 'VENDEDOR'
      ProviderFlags = []
      Size = 80
    end
    object cdsVendasDATA: TDateField
      FieldName = 'DATA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsVendasOBS: TStringField
      FieldName = 'OBS'
      Size = 250
    end
    object cdsVendasTOTALDESCTO: TFMTBCDField
      FieldName = 'TOTALDESCTO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 15
    end
    object cdsVendasTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 15
    end
    object cdsVendasCONCLUIDA: TStringField
      Alignment = taCenter
      FieldName = 'CONCLUIDA'
      FixedChar = True
      Size = 1
    end
    object cdsVendasBAIXADO: TStringField
      Alignment = taCenter
      FieldName = 'BAIXADO'
      FixedChar = True
      Size = 1
    end
    object cdsVendasCANCELADO: TStringField
      Alignment = taCenter
      FieldName = 'CANCELADO'
      FixedChar = True
      Size = 1
    end
    object cdsVendassqlItens: TDataSetField
      FieldName = 'sqlItens'
    end
  end
  object cdsItens: TClientDataSet
    Aggregates = <>
    DataSetField = cdsVendassqlItens
    Params = <>
    BeforePost = cdsItensBeforePost
    BeforeDelete = cdsItensBeforeDelete
    Left = 324
    Top = 370
    object cdsItensCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsItensCODPRODUTO: TIntegerField
      FieldName = 'CODPRODUTO'
      OnValidate = cdsItensCODPRODUTOValidate
    end
    object cdsItensPRODUTO: TStringField
      FieldName = 'PRODUTO'
      ProviderFlags = []
      Size = 80
    end
    object cdsItensQTD: TIntegerField
      FieldName = 'QTD'
    end
    object cdsItensCUSTO: TFMTBCDField
      FieldName = 'CUSTO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 15
    end
    object cdsItensVENDA: TFMTBCDField
      FieldName = 'VENDA'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 15
    end
    object cdsItensDESCTO: TFMTBCDField
      FieldName = 'DESCTO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 15
    end
    object cdsItensVALORDESCTO: TFMTBCDField
      FieldName = 'VALORDESCTO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 15
    end
    object cdsItensTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 15
    end
    object cdsItensCOMISSAO: TFMTBCDField
      FieldName = 'COMISSAO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 15
    end
    object cdsItensVALORCOMISSAO: TFMTBCDField
      FieldName = 'VALORCOMISSAO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 15
    end
  end
  object dsVendas: TDataSource
    AutoEdit = False
    DataSet = cdsVendas
    Left = 357
    Top = 339
  end
  object dsItens: TDataSource
    AutoEdit = False
    DataSet = cdsItens
    Left = 357
    Top = 370
  end
  object sqldVendedor: TSQLDataSet
    CommandText = 'select '#13#10'  IDVENDEDOR, '#13#10'  VENDEDOR, '#13#10'  ATIVO'#13#10'from VENDEDOR'
    MaxBlobSize = -1
    Params = <>
    Left = 24
    Top = 376
    object sqldVendedorIDVENDEDOR: TIntegerField
      FieldName = 'IDVENDEDOR'
      Required = True
    end
    object sqldVendedorVENDEDOR: TStringField
      FieldName = 'VENDEDOR'
      Size = 80
    end
    object sqldVendedorATIVO: TStringField
      FieldName = 'ATIVO'
      FixedChar = True
      Size = 1
    end
  end
  object dspVendedor: TDataSetProvider
    DataSet = sqldVendedor
    Left = 56
    Top = 376
  end
  object cdsVendedor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVendedor'
    Left = 88
    Top = 376
    object cdsVendedorIDVENDEDOR: TIntegerField
      FieldName = 'IDVENDEDOR'
      Required = True
    end
    object cdsVendedorVENDEDOR: TStringField
      FieldName = 'VENDEDOR'
      Size = 80
    end
    object cdsVendedorATIVO: TStringField
      FieldName = 'ATIVO'
      FixedChar = True
      Size = 1
    end
  end
  object spDeleta: TSQLDataSet
    CommandText = 'STPDELVENDA'
    CommandType = ctStoredProc
    DbxCommandType = 'Dbx.StoredProcedure'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    Left = 168
    Top = 344
  end
  object spEstorna: TSQLDataSet
    CommandText = 'STPESTORNAVENDA'
    CommandType = ctStoredProc
    DbxCommandType = 'Dbx.StoredProcedure'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    Left = 168
    Top = 376
  end
  object spBaixa: TSQLDataSet
    CommandText = 'STPBAIXAVENDA'
    CommandType = ctStoredProc
    DbxCommandType = 'Dbx.StoredProcedure'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    Left = 168
    Top = 408
  end
end
