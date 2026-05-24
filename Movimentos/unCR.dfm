inherited frmCR: TfrmCR
  Left = 396
  Height = 444
  Top = 219
  Width = 754
  Caption = 'frmCR'
  ClientHeight = 444
  ClientWidth = 754
  Menu = menu
  inherited sbStatus: TStatusBar
    Top = 426
    Width = 754
  end
  inherited pnBotoesPadrao: TPanel
    Width = 754
    ClientWidth = 754
    TabOrder = 10
  end
  object lbCliente: TLabel[2]
    Left = 16
    Height = 16
    Top = 48
    Width = 42
    Caption = 'Cliente'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbConta: TLabel[3]
    Left = 16
    Height = 16
    Top = 96
    Width = 36
    Caption = 'Conta'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbDescricao: TLabel[4]
    Left = 16
    Height = 16
    Top = 144
    Width = 61
    Caption = 'Descrição'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbData: TLabel[5]
    Left = 16
    Height = 16
    Top = 192
    Width = 28
    Caption = 'Data'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbVencimento: TLabel[6]
    Left = 176
    Height = 16
    Top = 192
    Width = 71
    Caption = 'Vencimento'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbDocumento: TLabel[7]
    Left = 336
    Height = 16
    Top = 192
    Width = 70
    Caption = 'Documento'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbValor: TLabel[8]
    Left = 16
    Height = 16
    Top = 240
    Width = 31
    Caption = 'Valor'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbValorAtual: TLabel[9]
    Left = 144
    Height = 16
    Top = 240
    Width = 65
    Caption = 'Valor Atual'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbJuros: TLabel[10]
    Left = 272
    Height = 16
    Top = 240
    Width = 33
    Caption = 'Juros'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbOrigem: TLabel[11]
    Left = 352
    Height = 16
    Top = 240
    Width = 44
    Caption = 'Origem'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbVenda: TLabel[12]
    Left = 432
    Height = 16
    Top = 240
    Width = 38
    Caption = 'Venda'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbStatus: TLabel[13]
    Left = 16
    Height = 16
    Top = 384
    Width = 54
    Caption = 'lbStatus'
    Font.CharSet = ANSI_CHARSET
    Font.Name = 'Verdana'
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object btnReceber: TBitBtn[14]
    Left = 432
    Height = 32
    Top = 376
    Width = 89
    Caption = 'Receber'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
    OnClick = btnReceberClick
  end
  object btnContas: TBitBtn[15]
    Left = 328
    Height = 32
    Top = 376
    Width = 97
    Caption = 'Contas [F7]'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
    OnClick = miContasClienteCorrenteClick
  end
  object dbeValorAtual: TDBEdit[16]
    Left = 144
    Height = 21
    Top = 256
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
  object dbeDescricao: TDBEdit[17]
    Left = 16
    Height = 21
    Top = 160
    Width = 505
    DataField = 'DESCRICAO'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnEnter = dbeDescricaoEnter
  end
  object dbeValor: TDBEdit[18]
    Left = 16
    Height = 21
    Top = 256
    Width = 121
    DataField = 'VALOR'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
  object dbeDocumento: TDBEdit[19]
    Left = 336
    Height = 21
    Top = 208
    Width = 185
    DataField = 'DOCUMENTO'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object dbeJuros: TDBEdit[20]
    Left = 272
    Height = 21
    Top = 256
    Width = 73
    DataField = 'JURO'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
  end
  object dbeOrigem: TDBEdit[21]
    Left = 352
    Height = 21
    Top = 256
    Width = 73
    DataField = 'ORIGEM'
    DataSource = dsPadrao
    ReadOnly = True
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
  end
  object dbdData: TDBEdit[22]
    Left = 16
    Height = 21
    Top = 208
    Width = 153
    DataField = 'DATA'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object dbdVencimento: TDBEdit[23]
    Left = 176
    Height = 21
    Top = 208
    Width = 153
    DataField = 'VENCIMENTO'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object dbeVenda: TDBEdit[24]
    Left = 432
    Height = 21
    Top = 256
    Width = 89
    DataField = 'VENDA'
    DataSource = dsPadrao
    ReadOnly = True
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
  end
  object grpRecebimento: TGroupBox[25]
    Left = 16
    Height = 81
    Top = 288
    Width = 537
    Caption = ' Informações de recebimento '
    ClientHeight = 54
    ClientWidth = 527
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    object lbDataRecdo: TLabel
      Left = 8
      Height = 16
      Top = 8
      Width = 88
      Caption = 'Data Recebido'
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
    object lbCapitalRecdo: TLabel
      Left = 200
      Height = 16
      Top = 8
      Width = 103
      Caption = 'Capital Recebido'
      ParentColor = False
      ParentShowHint = False
      ShowHint = True
    end
    object lbJuroRecdo: TLabel
      Left = 312
      Height = 16
      Top = 8
      Width = 87
      Caption = 'Juro Recebido'
      ParentColor = False
      ParentShowHint = False
      ShowHint = True
    end
    object lbTotalRecdo: TLabel
      Left = 408
      Height = 16
      Top = 8
      Width = 90
      Caption = 'Total Recebido'
      ParentColor = False
      ParentShowHint = False
      ShowHint = True
    end
    object dbeDataRecdo: TDBEdit
      Left = 8
      Height = 21
      Top = 24
      Width = 89
      DataField = 'DATARECTO'
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
    object dbeCapitalRecdo: TDBEdit
      Left = 200
      Height = 21
      Top = 24
      Width = 103
      DataField = 'CAPITALRECDO'
      DataSource = dsPadrao
      ReadOnly = True
      Color = clBtnFace
      MaxLength = 0
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
    object dbeJuroRecdo: TDBEdit
      Left = 312
      Height = 21
      Top = 24
      Width = 89
      DataField = 'JURORECDO'
      DataSource = dsPadrao
      ReadOnly = True
      Color = clBtnFace
      MaxLength = 0
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
    object dbeTotalRecdo: TDBEdit
      Left = 408
      Height = 21
      Top = 24
      Width = 105
      DataField = 'TOTALRECDO'
      DataSource = dsPadrao
      ReadOnly = True
      Color = clBtnFace
      MaxLength = 0
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
    end
  end
  object dbcmbCliente: TDBLookupComboBox[26]
    Left = 16
    Height = 20
    Top = 64
    Width = 504
    DataField = 'CLIENTE'
    DataSource = dsPadrao
    KeyField = 'CODCLIENTE'
    ListField = 'NOME'
    ListFieldIndex = 0
    ListSource = dsCliente
    LookupCache = False
    TabOrder = 14
  end
  object dbcmbConta: TDBLookupComboBox[27]
    Left = 16
    Height = 20
    Top = 112
    Width = 504
    DataField = 'IDCONTA'
    DataSource = dsPadrao
    KeyField = 'CODIGO'
    ListField = 'NOME'
    ListFieldIndex = 0
    ListSource = dsConta
    LookupCache = False
    TabOrder = 15
  end
  inherited actlNavigateActions: TActionList[28]
    Left = 664
    Top = 344
    inherited actPrint: TAction
      Hint = 'Relatório para cliente'
      ShortCut = 0
      OnExecute = actPrintExecute
    end
    object actContasReceber: TAction[8]
      Category = 'Navigate'
      Caption = 'Contas a receber por cliente'
      OnExecute = actContasReceberExecute
    end
  end
  inherited dsPadrao: TDataSource[29]
    DataSet = sqldPadrao
    Left = 680
    Top = 48
  end
  object dsCliente: TDataSource[30]
    DataSet = sqldCliente
    Left = 692
    Top = 136
  end
  object dsConta: TDataSource[31]
    DataSet = sqldConta
    Left = 688
    Top = 208
  end
  object sqldCliente: TZReadOnlyQuery[32]
    Connection = DmPrincipal.ZConnection1
    SQL.Strings = (
      'select * from CLIENTES'
    )
    Params = <>
    Left = 576
    Top = 128
  end
  object sqldConta: TZReadOnlyQuery[33]
    Connection = DmPrincipal.ZConnection1
    SQL.Strings = (
      'select * from CAIXAS'
    )
    Params = <>
    Left = 576
    Top = 192
  end
  object sqldPadrao: TZQuery[34]
    AfterRefresh = sqldPadraoAfterScroll
    Connection = DmPrincipal.ZConnection1
    AfterInsert = sqldPadraoAfterInsert
    SQL.Strings = (
      'select * from CONTASRECEBER'
    )
    Params = <>
    Left = 576
    Top = 40
  end
  object sqldLimite: TZQuery[35]
    Connection = DmPrincipal.ZConnection1
    Params = <>
    Left = 576
    Top = 280
  end
  object sqldDeleta: TZQuery[36]
    Connection = DmPrincipal.ZConnection1
    Params = <>
    Left = 568
    Top = 352
  end
  object menu: TMainMenu[37]
    Left = 663
    Top = 280
    object MenuItem1: TMenuItem
      Caption = 'Relatórios'
      OnClick = MenuItem1Click
      object MenuItem2: TMenuItem
        Caption = 'Contas por  cliente'
        OnClick = miContasClienteCorrenteClick
      end
      object MenuItem3: TMenuItem
        Caption = 'Todas as Contas'
        OnClick = miTodasContasClick
      end
      object MenuItem4: TMenuItem
        Caption = 'Contas por datas'
        OnClick = miContasIntervaloDatasClick
      end
      object MenuItem5: TMenuItem
        Caption = 'Contas Vencidas'
        OnClick = miContasVencidasClick
      end
      object MenuItem6: TMenuItem
        Caption = 'Contas Vencidas  por Cliente'
        OnClick = miContasVencidasClienteClick
      end
      object MenuItem7: TMenuItem
        Caption = 'Proximos Vencimentos'
        OnClick = miProximosVencClick
      end
    end
  end
end
