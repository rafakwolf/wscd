inherited frmCR: TfrmCR
  Left = 396
  Height = 444
  Top = 219
  Width = 754
  Caption = 'frmCR'
  ClientHeight = 444
  ClientWidth = 754
  Menu = MainMenu1
  inherited sbStatus: TStatusBar
    Top = 426
    Width = 754
  end
  inherited pnBotoesPadrao: TPanel
    Width = 754
    ClientWidth = 754
    TabOrder = 10
  end
  object lbStatus: TLabel[2]
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
  object btnReceber: TBitBtn[3]
    Left = 432
    Height = 32
    Top = 376
    Width = 89
    Caption = 'Receber'
    OnClick = btnReceberClick
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
  end
  object btnContas: TBitBtn[4]
    Left = 328
    Height = 32
    Top = 376
    Width = 97
    Caption = 'Contas [F7]'
    OnClick = miContasClienteCorrenteClick
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
  end
  object dbeValorAtual: TDBEdit[5]
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
  object dbeDescricao: TDBEdit[6]
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
  object dbeValor: TDBEdit[7]
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
  object dbeDocumento: TDBEdit[8]
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
  object dbeJuros: TDBEdit[9]
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
  object dbeOrigem: TDBEdit[10]
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
  object dbdData: TDBEdit[11]
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
  object dbdVencimento: TDBEdit[12]
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
  object dbeVenda: TDBEdit[13]
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
  object grpRecebimento: TGroupBox[14]
    Left = 16
    Height = 81
    Top = 288
    Width = 505
    Caption = ' Informações de recebimento '
    ClientHeight = 54
    ClientWidth = 495
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    object dbeDataRecdo: TDBEdit
      Left = 8
      Height = 21
      Top = 14
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
      Top = 14
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
      Top = 14
      Width = 89
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
      Left = 296
      Height = 21
      Top = 14
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
      Left = 392
      Height = 21
      Top = 14
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
  object DBLookupComboBox1: TDBLookupComboBox[15]
    Left = 16
    Height = 20
    Top = 64
    Width = 504
    DataField = 'CLIENTE'
    DataSource = dsPadrao
    KeyField = 'CODCLIENTE'
    ListField = 'NOME'
    ListFieldIndex = 0
    ListSource = DataSource1
    LookupCache = False
    TabOrder = 14
  end
  object DBLookupComboBox2: TDBLookupComboBox[16]
    Left = 16
    Height = 20
    Top = 112
    Width = 504
    DataField = 'IDCONTA'
    DataSource = dsPadrao
    KeyField = 'CODIGO'
    ListField = 'NOME'
    ListFieldIndex = 0
    ListSource = DataSource2
    LookupCache = False
    TabOrder = 15
  end
  inherited actlNavigateActions: TActionList[17]
    Left = 664
    Top = 344
    inherited actPrint: TAction
      Hint = 'Relatório para cliente'
      OnExecute = actPrintExecute
      ShortCut = 0
    end
    object actContasReceber: TAction[8]
      Category = 'Navigate'
      Caption = 'Contas a receber por cliente'
      OnExecute = actContasReceberExecute
    end
  end
  inherited dsPadrao: TDataSource[18]
    DataSet = sqldPadrao
    Left = 680
    Top = 48
  end
  object DataSource1: TDataSource[19]
    DataSet = ZReadOnlyQuery1
    Left = 692
    Top = 136
  end
  object DataSource2: TDataSource[20]
    DataSet = ZReadOnlyQuery2
    Left = 688
    Top = 208
  end
  object ZReadOnlyQuery1: TZReadOnlyQuery[21]
    Connection = DmPrincipal.ZConnection1
    SQL.Strings = (
      'select * from CLIENTES'
    )
    Params = <>
    Left = 576
    Top = 128
  end
  object ZReadOnlyQuery2: TZReadOnlyQuery[22]
    Connection = DmPrincipal.ZConnection1
    SQL.Strings = (
      'select * from CAIXAS'
    )
    Params = <>
    Left = 576
    Top = 192
  end
  object sqldPadrao: TZQuery[23]
    Connection = DmPrincipal.ZConnection1
    SQL.Strings = (
      'select * from CONTASRECEBER'
    )
    Params = <>
    Left = 576
    Top = 40
  end
  object sqldLimite: TZQuery[24]
    Connection = DmPrincipal.ZConnection1
    Params = <>
    Left = 576
    Top = 280
  end
  object sqldDeleta: TZQuery[25]
    Connection = DmPrincipal.ZConnection1
    Params = <>
    Left = 568
    Top = 352
  end
  object MainMenu1: TMainMenu[26]
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
