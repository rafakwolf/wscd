inherited frmCliente: TfrmCliente
  Left = 260
  Height = 467
  Top = 138
  Caption = 'frmCliente'
  ClientHeight = 467
  inherited sbStatus: TStatusBar
    Top = 449
  end
  inherited pnBotoesPadrao: TPanel
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
  object btnContas: TBitBtn[2]
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
  object dbeFax: TDBEdit[3]
    Left = 120
    Height = 33
    Top = 156
    Width = 105
    DataField = 'FAX'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
  end
  object dbeTelefoneComercial: TDBEdit[4]
    Left = 639
    Height = 33
    Top = 300
    Width = 138
    DataField = 'FONE_COM'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 20
  end
  object dbeRefComercial: TDBEdit[5]
    Left = 528
    Height = 33
    Top = 348
    Width = 249
    DataField = 'REFER_COM'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 23
  end
  object dbeRefPessoal: TDBEdit[6]
    Left = 280
    Height = 33
    Top = 348
    Width = 241
    DataField = 'REFER_PES'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 22
  end
  object dbeLocalTrabalho: TDBEdit[7]
    Left = 8
    Height = 33
    Top = 348
    Width = 265
    DataField = 'LOCAL_TRAB'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 21
  end
  object dbeSalario: TDBEdit[8]
    Left = 8
    Height = 33
    Top = 396
    Width = 129
    DataField = 'SALARIO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 24
    OnKeyPress = dbeSalarioKeyPress
  end
  object dbeInicioTrabalho: TDBEdit[9]
    Left = 520
    Height = 33
    Top = 300
    Width = 113
    DataField = 'DATA_INICIO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 19
  end
  object dbeCargo: TDBEdit[10]
    Left = 264
    Height = 33
    Top = 300
    Width = 249
    DataField = 'CARGO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 18
  end
  object dbeTrabalho: TDBEdit[11]
    Left = 8
    Height = 33
    Top = 300
    Width = 249
    DataField = 'TRABALHO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 17
  end
  object dbeEmail: TDBEdit[12]
    Left = 232
    Height = 33
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
  object dbeNaturalidade: TDBEdit[13]
    Left = 616
    Height = 33
    Top = 204
    Width = 161
    DataField = 'NATURALIDADE'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
  end
  object dbeDataCadastro: TDBEdit[14]
    Left = 656
    Height = 33
    Top = 156
    Width = 121
    DataField = 'CADASTRO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
  end
  object dbeMae: TDBEdit[15]
    Left = 312
    Height = 33
    Top = 204
    Width = 297
    DataField = 'MAE'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
  end
  object dbePai: TDBEdit[16]
    Left = 8
    Height = 33
    Top = 204
    Width = 297
    DataField = 'PAI'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
  end
  object dbeConjuge: TDBEdit[17]
    Left = 584
    Height = 33
    Top = 252
    Width = 193
    DataField = 'CONJUGUE'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 16
  end
  object dbeEnderecoAnterior: TDBEdit[18]
    Left = 247
    Height = 33
    Top = 252
    Width = 322
    DataField = 'END_ANTERIOR'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 15
  end
  object dbeTempoMoradia: TDBEdit[19]
    Left = 8
    Height = 33
    Top = 252
    Width = 233
    DataField = 'TEMPO_MORADIA'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 14
  end
  object dbeLimite: TDBEdit[20]
    Left = 144
    Height = 33
    Top = 396
    Width = 121
    DataField = 'LIMITE'
    DataSource = dsPadrao
    CharCase = ecNormal
    Font.CharSet = ANSI_CHARSET
    MaxLength = 0
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 25
    OnKeyPress = dbeLimiteKeyPress
  end
  object dbeDataNasc: TDBEdit[21]
    Left = 528
    Height = 33
    Top = 156
    Width = 121
    DataField = 'DATA_NASC'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
  end
  object dbeCpf: TDBEdit[22]
    Left = 376
    Height = 33
    Top = 64
    Width = 137
    DataField = 'CPF_CNPJ'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object dbeRg: TDBEdit[23]
    Left = 520
    Height = 33
    Top = 64
    Width = 129
    DataField = 'RG_IE'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object dbeTelefone: TDBEdit[24]
    Left = 8
    Height = 33
    Top = 156
    Width = 105
    DataField = 'TELEFONE'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
  end
  object dbeCep: TDBEdit[25]
    Left = 416
    Height = 33
    Top = 108
    Width = 97
    DataField = 'CEP'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
  end
  object dbeBairro: TDBEdit[26]
    Left = 232
    Height = 33
    Top = 108
    Width = 177
    DataField = 'BAIRRO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
  object dbeEndereco: TDBEdit[27]
    Left = 8
    Height = 33
    Top = 108
    Width = 217
    DataField = 'ENDERECO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object dbeNome: TDBEdit[28]
    Left = 8
    Height = 33
    Top = 64
    Width = 361
    DataField = 'NOME'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object dbmObs: TDBEdit[29]
    Left = 280
    Height = 33
    Top = 396
    Width = 377
    DataField = 'OBS'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 29
  end
  inherited actlNavigateActions: TActionList[30]
    Left = 600
    Top = 12
    inherited actPrint: TAction
      Hint = 'Listagem de clientes'
      OnExecute = actPrintExecute
      ShortCut = 0
    end
  end
  inherited dsPadrao: TDataSource[31]
    DataSet = dmCliente.ZQuery1
    Left = 713
    Top = 36
  end
end
