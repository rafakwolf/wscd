inherited frmCP: TfrmCP
  Left = 437
  Height = 460
  Top = 213
  Width = 739
  Caption = 'frmCP'
  ClientHeight = 460
  ClientWidth = 739
  inherited sbStatus: TStatusBar
    Top = 442
    Width = 739
  end
  inherited pnBotoesPadrao: TPanel
    Width = 739
    ClientWidth = 739
    TabOrder = 10
  end
  object lbFornecedor: TLabel[2]
    Left = 8
    Height = 16
    Top = 40
    Width = 70
    Caption = 'Fornecedor'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbConta: TLabel[3]
    Left = 8
    Height = 16
    Top = 80
    Width = 36
    Caption = 'Conta'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbDescricao: TLabel[4]
    Left = 8
    Height = 16
    Top = 120
    Width = 61
    Caption = 'Descrição'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbData: TLabel[5]
    Left = 8
    Height = 16
    Top = 168
    Width = 28
    Caption = 'Data'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbVencimento: TLabel[6]
    Left = 168
    Height = 16
    Top = 168
    Width = 71
    Caption = 'Vencimento'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbDocumento: TLabel[7]
    Left = 328
    Height = 16
    Top = 168
    Width = 70
    Caption = 'Documento'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbValor: TLabel[8]
    Left = 8
    Height = 16
    Top = 216
    Width = 31
    Caption = 'Valor'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbValorAtual: TLabel[9]
    Left = 136
    Height = 16
    Top = 216
    Width = 65
    Caption = 'Valor Atual'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbJuros: TLabel[10]
    Left = 264
    Height = 16
    Top = 216
    Width = 33
    Caption = 'Juros'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbOrigem: TLabel[11]
    Left = 360
    Height = 16
    Top = 216
    Width = 44
    Caption = 'Origem'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbCompra: TLabel[12]
    Left = 432
    Height = 16
    Top = 216
    Width = 48
    Caption = 'Compra'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbStatus: TLabel[13]
    Left = 8
    Height = 16
    Top = 388
    Width = 54
    Caption = 'lbStatus'
    Color = clBtnFace
    Font.CharSet = ANSI_CHARSET
    Font.Name = 'Verdana'
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object btnPagar: TBitBtn[14]
    Left = 424
    Height = 32
    Top = 372
    Width = 89
    Caption = 'Pagar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
    OnClick = btnPagarClick
  end
  object btnContas: TBitBtn[15]
    Left = 320
    Height = 32
    Top = 372
    Width = 97
    Caption = 'Contas [F7]'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
    OnClick = miContasFornecCorrenteClick
  end
  object dbdVencimento: TDBEdit[16]
    Left = 168
    Height = 21
    Top = 184
    Width = 153
    DataField = 'VENCIMENTO'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object dbdData: TDBEdit[17]
    Left = 8
    Height = 21
    Top = 184
    Width = 153
    DataField = 'DATA'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object dbeOrigem: TDBEdit[18]
    Left = 360
    Height = 21
    Top = 232
    Width = 65
    DataField = 'ORIGEM'
    DataSource = dsPadrao
    ReadOnly = True
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
  end
  object dbeJuros: TDBEdit[19]
    Left = 264
    Height = 21
    Top = 232
    Width = 89
    DataField = 'JURO'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
  end
  object dbeDocumento: TDBEdit[20]
    Left = 328
    Height = 21
    Top = 184
    Width = 185
    DataField = 'DOCUMENTO'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object dbeValor: TDBEdit[21]
    Left = 8
    Height = 21
    Top = 232
    Width = 121
    DataField = 'VALOR'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
  object dbeDescricao: TDBEdit[22]
    Left = 8
    Height = 21
    Top = 136
    Width = 505
    DataField = 'DESCRICAO'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnEnter = dbeDescricaoEnter
  end
  object dbeCompra: TDBEdit[23]
    Left = 432
    Height = 21
    Top = 232
    Width = 81
    DataField = 'COMPRA'
    DataSource = dsPadrao
    ReadOnly = True
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
  end
  object dbeValorAtual: TDBEdit[24]
    Left = 136
    Height = 21
    Top = 232
    Width = 121
    DataField = 'TOTAL'
    DataSource = dsPadrao
    ReadOnly = True
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
  end
  object grpPagamento: TGroupBox[25]
    Left = 8
    Height = 95
    Top = 264
    Width = 505
    Caption = ' Informações de pagamento '
    ClientHeight = 68
    ClientWidth = 495
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    object lbDataPagto: TLabel
      Left = 8
      Height = 16
      Top = 8
      Width = 77
      Caption = 'Data Pagam.'
      ParentColor = False
      ParentShowHint = False
      ShowHint = True
    end
    object lbDesconto: TLabel
      Left = 104
      Height = 16
      Top = 8
      Width = 58
      Caption = 'Desconto'
      ParentColor = False
      ParentShowHint = False
      ShowHint = True
    end
    object lbCapitalPago: TLabel
      Left = 200
      Height = 16
      Top = 8
      Width = 76
      Caption = 'Capital Pago'
      ParentColor = False
      ParentShowHint = False
      ShowHint = True
    end
    object lbJuroPago: TLabel
      Left = 296
      Height = 16
      Top = 8
      Width = 61
      Caption = 'Juro Pago'
      ParentColor = False
      ParentShowHint = False
      ShowHint = True
    end
    object lbTotalPago: TLabel
      Left = 392
      Height = 16
      Top = 8
      Width = 64
      Caption = 'Total Pago'
      ParentColor = False
      ParentShowHint = False
      ShowHint = True
    end
    object dbeDataPagto: TDBEdit
      Left = 8
      Height = 21
      Top = 24
      Width = 89
      DataField = 'DATAPAGTO'
      DataSource = dsPadrao
      ReadOnly = True
      Color = clBtnFace
      MaxLength = 0
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object dbeDesconto: TDBEdit
      Left = 104
      Height = 21
      Top = 24
      Width = 89
      DataField = 'DESCTO'
      DataSource = dsPadrao
      ReadOnly = True
      Color = clBtnFace
      MaxLength = 0
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object dbeCapitalPago: TDBEdit
      Left = 200
      Height = 21
      Top = 24
      Width = 89
      DataField = 'CAPITALPAGO'
      DataSource = dsPadrao
      ReadOnly = True
      Color = clBtnFace
      MaxLength = 0
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
    object dbeJuroPago: TDBEdit
      Left = 296
      Height = 21
      Top = 24
      Width = 89
      DataField = 'JUROPAGO'
      DataSource = dsPadrao
      ReadOnly = True
      Color = clBtnFace
      MaxLength = 0
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
    object dbeTotalPago: TDBEdit
      Left = 392
      Height = 21
      Top = 24
      Width = 105
      DataField = 'TOTALPAGO'
      DataSource = dsPadrao
      ReadOnly = True
      Color = clBtnFace
      MaxLength = 0
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
    end
  end
  object dbcmbFornecedor: TDBLookupComboBox[26]
    Left = 8
    Height = 20
    Top = 56
    Width = 505
    DataField = 'FORNECEDOR'
    DataSource = dsPadrao
    KeyField = 'CODFORNECEDOR'
    ListField = 'RAZAOSOCIAL'
    ListFieldIndex = 0
    ListSource = dsForn
    LookupCache = False
    DisplayEmpty = 'Selecione um Fornecedor'
    TabOrder = 14
  end
  object dbcmbConta: TDBLookupComboBox[27]
    Left = 8
    Height = 20
    Top = 96
    Width = 504
    DataField = 'IDCONTA'
    DataSource = dsPadrao
    KeyField = 'CODIGO'
    ListField = 'NOME'
    ListFieldIndex = 0
    ListSource = dsCaixas
    LookupCache = False
    TabOrder = 15
  end
  inherited actlNavigateActions: TActionList[28]
    Left = 592
    Top = 152
    inherited actPrint: TAction
      ShortCut = 0
      OnExecute = actPrintExecute
    end
    object actContas: TAction[8]
      Category = 'Navigate'
      Caption = 'Contas a pagar por fornecedor'
      OnExecute = actContasExecute
    end
  end
  inherited dsPadrao: TDataSource[29]
    DataSet = sqldPadrao
    Left = 664
    Top = 88
  end
  object sqldPadrao: TZQuery[30]
    AfterScroll = sqldPadraoAfterScroll
    Connection = DmPrincipal.ZConnection1
    AfterInsert = sqldPadraoAfterInsert
    SQL.Strings = (
      'select * from CONTASPAGAR'
    )
    Params = <>
    Left = 584
    Top = 88
  end
  object sqldDeleta: TZQuery[31]
    Connection = DmPrincipal.ZConnection1
    Params = <>
    Left = 592
    Top = 224
  end
  object zForn: TZQuery[32]
    Connection = DmPrincipal.ZConnection1
    SQL.Strings = (
      'select * from FORNECEDORES'
    )
    Params = <>
    Left = 539
    Top = 47
  end
  object dsForn: TDataSource[33]
    DataSet = zForn
    Left = 624
    Top = 40
  end
  object sqldCaixas: TZReadOnlyQuery[34]
    Connection = DmPrincipal.ZConnection1
    SQL.Strings = (
      'select * from CAIXAS'
    )
    Params = <>
    Left = 576
    Top = 312
  end
  object dsCaixas: TDataSource[35]
    DataSet = sqldCaixas
    Left = 672
    Top = 312
  end
end
