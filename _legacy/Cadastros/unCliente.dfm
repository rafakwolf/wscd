inherited frmCliente: TfrmCliente
  Left = 412
  Height = 517
  Top = 215
  Width = 966
  Caption = 'frmCliente'
  ClientHeight = 517
  ClientWidth = 966
  Font.Height = -13
  Font.Name = '.SF NS'
  Menu = MainMenu1
  OnShow = FormShow
  inherited sbStatus: TStatusBar
    Top = 499
    Width = 966
  end
  inherited pnBotoesPadrao: TPanel
    Width = 966
    ClientWidth = 966
    TabOrder = 28
    inherited btnAlterar: TSpeedButton
      Left = 49
    end
    inherited btnConsultar: TSpeedButton
      Left = 353
    end
    inherited btnSair: TSpeedButton
      Left = 428
    end
    inherited btnPrint: TSpeedButton
      Left = 286
      Hint = ''
      Action = nil
    end
  end
  object lbNome: TLabel[2]
    Left = 8
    Height = 16
    Top = 48
    Width = 36
    Caption = 'Nome'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbCpf: TLabel[3]
    Left = 376
    Height = 16
    Top = 48
    Width = 25
    Caption = 'CPF'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbRg: TLabel[4]
    Left = 520
    Height = 16
    Top = 48
    Width = 18
    Caption = 'RG'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbEndereco: TLabel[5]
    Left = 8
    Height = 16
    Top = 92
    Width = 57
    Caption = 'Endereço'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbBairro: TLabel[6]
    Left = 232
    Height = 16
    Top = 92
    Width = 36
    Caption = 'Bairro'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbCep: TLabel[7]
    Left = 416
    Height = 16
    Top = 92
    Width = 25
    Caption = 'CEP'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbTelefone: TLabel[8]
    Left = 8
    Height = 16
    Top = 140
    Width = 52
    Caption = 'Telefone'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbFax: TLabel[9]
    Left = 120
    Height = 16
    Top = 140
    Width = 21
    Caption = 'Fax'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbEmail: TLabel[10]
    Left = 232
    Height = 16
    Top = 140
    Width = 38
    Caption = 'E-mail'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbDataNasc: TLabel[11]
    Left = 528
    Height = 16
    Top = 140
    Width = 104
    Caption = 'Data Nascimento'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbDataCadastro: TLabel[12]
    Left = 656
    Height = 16
    Top = 140
    Width = 87
    Caption = 'Data Cadastro'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbPai: TLabel[13]
    Left = 8
    Height = 16
    Top = 188
    Width = 18
    Caption = 'Pai'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbMae: TLabel[14]
    Left = 312
    Height = 16
    Top = 188
    Width = 26
    Caption = 'Mãe'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbNaturalidade: TLabel[15]
    Left = 616
    Height = 16
    Top = 188
    Width = 77
    Caption = 'Naturalidade'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbTempoMoradia: TLabel[16]
    Left = 8
    Height = 16
    Top = 236
    Width = 94
    Caption = 'Tempo Moradia'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbEnderecoAnterior: TLabel[17]
    Left = 247
    Height = 16
    Top = 236
    Width = 109
    Caption = 'Endereço Anterior'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbConjuge: TLabel[18]
    Left = 584
    Height = 16
    Top = 236
    Width = 50
    Caption = 'Cônjuge'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbTrabalho: TLabel[19]
    Left = 8
    Height = 16
    Top = 284
    Width = 53
    Caption = 'Trabalho'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbCargo: TLabel[20]
    Left = 264
    Height = 16
    Top = 284
    Width = 36
    Caption = 'Cargo'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbInicioTrabalho: TLabel[21]
    Left = 520
    Height = 16
    Top = 284
    Width = 88
    Caption = 'Início Trabalho'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbTelefoneComercial: TLabel[22]
    Left = 639
    Height = 16
    Top = 284
    Width = 116
    Caption = 'Telefone Comercial'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbLocalTrabalho: TLabel[23]
    Left = 8
    Height = 16
    Top = 332
    Width = 88
    Caption = 'Local Trabalho'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbRefPessoal: TLabel[24]
    Left = 280
    Height = 16
    Top = 332
    Width = 73
    Caption = 'Ref. Pessoal'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbRefComercial: TLabel[25]
    Left = 528
    Height = 16
    Top = 332
    Width = 88
    Caption = 'Ref. Comercial'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbSalario: TLabel[26]
    Left = 8
    Height = 16
    Top = 380
    Width = 41
    Caption = 'Salário'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbLimite: TLabel[27]
    Left = 144
    Height = 16
    Top = 380
    Width = 37
    Caption = 'Limite'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbObs: TLabel[28]
    Left = 280
    Height = 16
    Top = 380
    Width = 25
    Caption = 'Obs'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object btnContas: TBitBtn[29]
    Left = 677
    Height = 35
    Top = 392
    Width = 100
    Caption = '&Contas'
    OnClick = btnContasClick
    ParentShowHint = False
    ShowHint = True
    TabOrder = 26
  end
  object dbeFax: TDBEdit[30]
    Left = 120
    Height = 21
    Top = 156
    Width = 105
    DataField = 'FAX'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
  end
  object dbeTelefoneComercial: TDBEdit[31]
    Left = 639
    Height = 21
    Top = 300
    Width = 138
    DataField = 'FONE_COM'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 20
  end
  object dbeRefComercial: TDBEdit[32]
    Left = 528
    Height = 21
    Top = 348
    Width = 249
    DataField = 'REFER_COM'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 23
  end
  object dbeRefPessoal: TDBEdit[33]
    Left = 280
    Height = 21
    Top = 348
    Width = 241
    DataField = 'REFER_PES'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 22
  end
  object dbeLocalTrabalho: TDBEdit[34]
    Left = 8
    Height = 21
    Top = 348
    Width = 265
    DataField = 'LOCAL_TRAB'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 21
  end
  object dbeSalario: TDBEdit[35]
    Left = 8
    Height = 21
    Top = 396
    Width = 129
    DataField = 'SALARIO'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 24
    OnKeyPress = dbeSalarioKeyPress
  end
  object dbeInicioTrabalho: TDBEdit[36]
    Left = 520
    Height = 21
    Top = 300
    Width = 113
    DataField = 'DATA_INICIO'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 19
  end
  object dbeCargo: TDBEdit[37]
    Left = 264
    Height = 21
    Top = 300
    Width = 249
    DataField = 'CARGO'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 18
  end
  object dbeTrabalho: TDBEdit[38]
    Left = 8
    Height = 21
    Top = 300
    Width = 249
    DataField = 'TRABALHO'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 17
  end
  object dbeEmail: TDBEdit[39]
    Left = 232
    Height = 21
    Top = 156
    Width = 289
    DataField = 'E_MAIL'
    DataSource = dsPadrao
    CharCase = ecLowerCase
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
  end
  object dbeNaturalidade: TDBEdit[40]
    Left = 616
    Height = 21
    Top = 204
    Width = 161
    DataField = 'NATURALIDADE'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
  end
  object dbeDataCadastro: TDBEdit[41]
    Left = 656
    Height = 21
    Top = 156
    Width = 121
    DataField = 'CADASTRO'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
  end
  object dbeMae: TDBEdit[42]
    Left = 312
    Height = 21
    Top = 204
    Width = 297
    DataField = 'MAE'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
  end
  object dbePai: TDBEdit[43]
    Left = 8
    Height = 21
    Top = 204
    Width = 297
    DataField = 'PAI'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
  end
  object dbeConjuge: TDBEdit[44]
    Left = 584
    Height = 21
    Top = 252
    Width = 193
    DataField = 'CONJUGUE'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 16
  end
  object dbeEnderecoAnterior: TDBEdit[45]
    Left = 247
    Height = 21
    Top = 252
    Width = 322
    DataField = 'END_ANTERIOR'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 15
  end
  object dbeTempoMoradia: TDBEdit[46]
    Left = 8
    Height = 21
    Top = 252
    Width = 233
    DataField = 'TEMPO_MORADIA'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 14
  end
  object dbeLimite: TDBEdit[47]
    Left = 144
    Height = 21
    Top = 396
    Width = 121
    DataField = 'LIMITE'
    DataSource = dsPadrao
    Font.CharSet = ANSI_CHARSET
    MaxLength = 0
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 25
    OnKeyPress = dbeLimiteKeyPress
  end
  object dbeDataNasc: TDBEdit[48]
    Left = 528
    Height = 21
    Top = 156
    Width = 121
    DataField = 'DATA_NASC'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
  end
  object dbeCpf: TDBEdit[49]
    Left = 376
    Height = 21
    Top = 64
    Width = 137
    DataField = 'CPF_CNPJ'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object dbeRg: TDBEdit[50]
    Left = 520
    Height = 21
    Top = 64
    Width = 129
    DataField = 'RG_IE'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object dbeTelefone: TDBEdit[51]
    Left = 8
    Height = 21
    Top = 156
    Width = 105
    DataField = 'TELEFONE'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
  end
  object dbeCep: TDBEdit[52]
    Left = 416
    Height = 21
    Top = 108
    Width = 97
    DataField = 'CEP'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
  end
  object dbeBairro: TDBEdit[53]
    Left = 232
    Height = 21
    Top = 108
    Width = 177
    DataField = 'BAIRRO'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
  object dbeEndereco: TDBEdit[54]
    Left = 8
    Height = 21
    Top = 108
    Width = 217
    DataField = 'ENDERECO'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object dbeNome: TDBEdit[55]
    Left = 8
    Height = 21
    Top = 64
    Width = 361
    DataField = 'NOME'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object dbmObs: TDBEdit[56]
    Left = 280
    Height = 21
    Top = 396
    Width = 377
    DataField = 'OBS'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 29
  end
  inherited actlNavigateActions: TActionList[57]
    Left = 872
    Top = 280
    inherited actPrint: TAction
      Hint = 'Listagem de clientes'
      OnExecute = actPrintExecute
      ShortCut = 0
    end
  end
  inherited dsPadrao: TDataSource[58]
    DataSet = sqldClientes
    Left = 840
    Top = 184
  end
  object MainMenu1: TMainMenu[59]
    Left = 840
    Top = 72
    object MenuItem1: TMenuItem
      Caption = 'Relatórios'
      OnClick = MenuItem1Click
      object MenuItem2: TMenuItem
        Caption = 'Clientes por Cidade'
        OnClick = miRelClientesCidadeClick
      end
      object MenuItem3: TMenuItem
        Caption = 'Aniversariantes'
        OnClick = miRelAniversariantesClick
      end
      object MenuItem4: TMenuItem
        Caption = 'Clientes por Nascimento'
        OnClick = miRelClientesDataNascClick
      end
      object MenuItem5: TMenuItem
        Caption = 'Etiquetas'
        OnClick = miEtiquetaClienteClick
      end
    end
  end
  object sqldClientes: TZQuery[60]
    Connection = DmPrincipal.ZConnection1
    SQL.Strings = (
      'select * from CLIENTES'
    )
    Params = <>
    Left = 888
    Top = 368
  end
end
