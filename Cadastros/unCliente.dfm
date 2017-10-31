inherited frmCliente: TfrmCliente
  Left = 231
  Top = 131
  ClientHeight = 472
  ClientWidth = 785
  Caption = 'frmCliente'
  OldCreateOrder = True
  ExplicitWidth = 791
  ExplicitHeight = 501
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbStatus: TUniStatusBar
    Top = 453
    Width = 785
    ExplicitTop = 453
    ExplicitWidth = 785
  end
  inherited pnBotoesPadrao: TUniContainerPanel
    Width = 785
    TabOrder = 28
    ExplicitWidth = 785
    inherited btnAlterar: TUniSpeedButton
      Left = 49
      ExplicitLeft = 49
    end
    inherited btnConsultar: TUniSpeedButton
      Left = 321
      ExplicitLeft = 321
    end
    inherited btnSair: TUniSpeedButton
      Left = 396
      ExplicitLeft = 396
    end
    inherited btnPrint: TUniSpeedButton
      Left = 254
      Hint = ''
      Action = nil
      ExplicitLeft = 254
    end
  end
  object btnContas: TUniBitBtn [2]
    Left = 677
    Top = 392
    Width = 100
    Height = 25
    Hint = ''
    ShowHint = True
    Caption = '&Contas'
    TabOrder = 26
    OnClick = btnContasClick
  end
  object dbeFax: TUniDBEdit [3]
    Left = 120
    Top = 156
    Width = 105
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'FAX'
    DataSource = dsPadrao
    TabOrder = 7
  end
  object dbeTelefoneComercial: TUniDBEdit [4]
    Left = 639
    Top = 300
    Width = 138
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'FONE_COM'
    DataSource = dsPadrao
    TabOrder = 20
  end
  object dbeRefComercial: TUniDBEdit [5]
    Left = 528
    Top = 348
    Width = 249
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'REFER_COM'
    DataSource = dsPadrao
    TabOrder = 23
  end
  object dbeRefPessoal: TUniDBEdit [6]
    Left = 280
    Top = 348
    Width = 241
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'REFER_PES'
    DataSource = dsPadrao
    TabOrder = 22
  end
  object dbeLocalTrabalho: TUniDBEdit [7]
    Left = 8
    Top = 348
    Width = 265
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'LOCAL_TRAB'
    DataSource = dsPadrao
    TabOrder = 21
  end
  object dbeSalario: TUniDBEdit [8]
    Left = 8
    Top = 396
    Width = 129
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'SALARIO'
    DataSource = dsPadrao
    TabOrder = 24
    OnKeyPress = dbeSalarioKeyPress
  end
  object dbeInicioTrabalho: TUniDBEdit [9]
    Left = 520
    Top = 300
    Width = 113
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'DATA_INICIO'
    DataSource = dsPadrao
    TabOrder = 19
  end
  object dbeCargo: TUniDBEdit [10]
    Left = 264
    Top = 300
    Width = 249
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'CARGO'
    DataSource = dsPadrao
    TabOrder = 18
  end
  object dbeTrabalho: TUniDBEdit [11]
    Left = 8
    Top = 300
    Width = 249
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'TRABALHO'
    DataSource = dsPadrao
    TabOrder = 17
  end
  object dbeEmail: TUniDBEdit [12]
    Left = 232
    Top = 156
    Width = 289
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'E_MAIL'
    DataSource = dsPadrao
    CharCase = ecLowerCase
    TabOrder = 8
  end
  object dbeNaturalidade: TUniDBEdit [13]
    Left = 616
    Top = 204
    Width = 161
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'NATURALIDADE'
    DataSource = dsPadrao
    TabOrder = 13
  end
  object dbeDataCadastro: TUniDBEdit [14]
    Left = 656
    Top = 156
    Width = 121
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'CADASTRO'
    DataSource = dsPadrao
    TabOrder = 10
  end
  object dbeMae: TUniDBEdit [15]
    Left = 312
    Top = 204
    Width = 297
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'MAE'
    DataSource = dsPadrao
    TabOrder = 12
  end
  object dbePai: TUniDBEdit [16]
    Left = 8
    Top = 204
    Width = 297
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'PAI'
    DataSource = dsPadrao
    TabOrder = 11
  end
  object dbeConjuge: TUniDBEdit [17]
    Left = 584
    Top = 252
    Width = 193
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'CONJUGUE'
    DataSource = dsPadrao
    TabOrder = 16
  end
  object dbeEnderecoAnterior: TUniDBEdit [18]
    Left = 247
    Top = 252
    Width = 322
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'END_ANTERIOR'
    DataSource = dsPadrao
    TabOrder = 15
  end
  object dbeTempoMoradia: TUniDBEdit [19]
    Left = 8
    Top = 252
    Width = 233
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'TEMPO_MORADIA'
    DataSource = dsPadrao
    TabOrder = 14
  end
  object dbeLimite: TUniDBEdit [20]
    Left = 144
    Top = 396
    Width = 121
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'LIMITE'
    DataSource = dsPadrao
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    TabOrder = 25
    OnKeyPress = dbeLimiteKeyPress
  end
  object dbeDataNasc: TUniDBEdit [21]
    Left = 528
    Top = 156
    Width = 121
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'DATA_NASC'
    DataSource = dsPadrao
    TabOrder = 9
  end
  object dbeCpf: TUniDBEdit [22]
    Left = 376
    Top = 64
    Width = 137
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'CPF_CNPJ'
    DataSource = dsPadrao
    TabOrder = 1
  end
  object dbeRg: TUniDBEdit [23]
    Left = 520
    Top = 64
    Width = 129
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'RG_IE'
    DataSource = dsPadrao
    TabOrder = 2
  end
  object dbeTelefone: TUniDBEdit [24]
    Left = 8
    Top = 156
    Width = 105
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'TELEFONE'
    DataSource = dsPadrao
    TabOrder = 6
  end
  object dbeCep: TUniDBEdit [25]
    Left = 416
    Top = 108
    Width = 97
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'CEP'
    DataSource = dsPadrao
    TabOrder = 5
  end
  object dbeBairro: TUniDBEdit [26]
    Left = 232
    Top = 108
    Width = 177
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'BAIRRO'
    DataSource = dsPadrao
    TabOrder = 4
  end
  object dbeEndereco: TUniDBEdit [27]
    Left = 8
    Top = 108
    Width = 217
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'ENDERECO'
    DataSource = dsPadrao
    TabOrder = 3
  end
  object dbeNome: TUniDBEdit [28]
    Left = 8
    Top = 64
    Width = 361
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'NOME'
    DataSource = dsPadrao
    TabOrder = 0
  end
  object dbmObs: TUniDBEdit [29]
    Left = 280
    Top = 396
    Width = 377
    Height = 22
    Hint = ''
    ShowHint = True
    DataField = 'OBS'
    DataSource = dsPadrao
    TabOrder = 29
  end
  inherited actlNavigateActions: TActionList
    Left = 600
    Top = 12
    inherited actPrint: TAction
      Hint = 'Listagem de clientes'
      ShortCut = 0
      OnExecute = actPrintExecute
    end
  end
  inherited dsPadrao: TDataSource
    DataSet = dmCliente.cdsPadrao
    Left = 713
    Top = 36
  end
  object sqldCidade: TSQLDataSet
    CommandText = 'select * from CIDADES'
    MaxBlobSize = -1
    Params = <>
    Left = 544
    Top = 100
    object sqldCidadeCODCIDADE: TIntegerField
      FieldName = 'CODCIDADE'
      Required = True
    end
    object sqldCidadeDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 30
    end
  end
  object dspCidade: TDataSetProvider
    DataSet = sqldCidade
    Left = 624
    Top = 100
  end
  object cdsCidade: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCidade'
    Left = 712
    Top = 108
    object cdsCidadeCODCIDADE: TIntegerField
      FieldName = 'CODCIDADE'
      Required = True
    end
    object cdsCidadeDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 30
    end
  end
end
