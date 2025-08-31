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
  object lbStatus: TLabel[2]
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
    Transparent = False
  end
  object btnPagar: TBitBtn[3]
    Left = 424
    Height = 25
    Top = 372
    Width = 89
    Caption = 'Pagar'
    OnClick = btnPagarClick
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
  end
  object btnContas: TBitBtn[4]
    Left = 320
    Height = 25
    Top = 372
    Width = 97
    Caption = 'Contas [F7]'
    OnClick = miContasFornecCorrenteClick
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
  end
  object dbdVencimento: TDBEdit[5]
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
  object dbdData: TDBEdit[6]
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
  object dbeOrigem: TDBEdit[7]
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
  object dbeJuros: TDBEdit[8]
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
  object dbeDocumento: TDBEdit[9]
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
  object dbeValor: TDBEdit[10]
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
  object dbeDescricao: TDBEdit[11]
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
  object dbeCompra: TDBEdit[12]
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
  object dbeValorAtual: TDBEdit[13]
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
  object grpPagamento: TGroupBox[14]
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
    object dbeDataPagto: TDBEdit
      Left = 8
      Height = 21
      Top = 40
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
      Top = 40
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
      Top = 40
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
      Top = 40
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
      Top = 40
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
  object DBLookupComboBox1: TDBLookupComboBox[15]
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
  object DBLookupComboBox2: TDBLookupComboBox[16]
    Left = 8
    Height = 20
    Top = 96
    Width = 504
    DataField = 'IDCONTA'
    DataSource = dsPadrao
    KeyField = 'CODIGO'
    ListField = 'NOME'
    ListFieldIndex = 0
    ListSource = DataSource1
    LookupCache = False
    TabOrder = 15
  end
  inherited actlNavigateActions: TActionList[17]
    Left = 592
    Top = 152
    inherited actPrint: TAction
      OnExecute = actPrintExecute
      ShortCut = 0
    end
    object actContas: TAction[8]
      Category = 'Navigate'
      Caption = 'Contas a pagar por fornecedor'
      OnExecute = actContasExecute
    end
  end
  inherited dsPadrao: TDataSource[18]
    DataSet = sqldPadrao
    Left = 664
    Top = 88
  end
  object sqldPadrao: TZQuery[19]
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
  object sqldDeleta: TZQuery[20]
    Connection = DmPrincipal.ZConnection1
    Params = <>
    Left = 592
    Top = 224
  end
  object zForn: TZQuery[21]
    Connection = DmPrincipal.ZConnection1
    SQL.Strings = (
      'select * from FORNECEDORES'
    )
    Params = <>
    Left = 539
    Top = 47
  end
  object dsForn: TDataSource[22]
    DataSet = zForn
    Left = 624
    Top = 40
  end
  object ZReadOnlyQuery1: TZReadOnlyQuery[23]
    Connection = DmPrincipal.ZConnection1
    SQL.Strings = (
      'select * from CAIXAS'
    )
    Params = <>
    Left = 576
    Top = 312
  end
  object DataSource1: TDataSource[24]
    DataSet = ZReadOnlyQuery1
    Left = 672
    Top = 312
  end
end
