inherited frmEnvelopes: TfrmEnvelopes
  Caption = 'frmEnvelopes'
  ClientHeight = 246
  ClientWidth = 649
  OldCreateOrder = True
  ExplicitWidth = 655
  ExplicitHeight = 295
  PixelsPerInch = 96
  TextHeight = 13
  object lbNome: TLabel [0]
    Left = 49
    Top = 62
    Width = 33
    Height = 13
    Caption = 'Nome'
    FocusControl = dbNome
  end
  object lbEndereco: TLabel [1]
    Left = 29
    Top = 86
    Width = 53
    Height = 13
    Caption = 'Endere'#231'o'
    FocusControl = dbEndereco
  end
  object lbBairro: TLabel [2]
    Left = 47
    Top = 134
    Width = 35
    Height = 13
    Caption = 'Bairro'
    FocusControl = dbBairro
  end
  object lbCep: TLabel [3]
    Left = 59
    Top = 158
    Width = 23
    Height = 13
    Caption = 'Cep'
    FocusControl = dbCep
  end
  object lbMsg: TLabel [4]
    Left = 21
    Top = 182
    Width = 61
    Height = 13
    Caption = 'Mensagem'
    FocusControl = dbMsg
  end
  object dbNome: TDBEdit [5]
    Left = 88
    Top = 54
    Width = 531
    Height = 21
    DataField = 'NOME'
    DataSource = dsPadrao
    TabOrder = 0
  end
  object dbeCidade: TDBEdit [6]
    Left = 88
    Top = 102
    Width = 329
    Height = 21
    Hint = 'Pesquisar < F2 >'
    Color = clBtnFace
    DataField = 'NOMECIDADE'
    DataSource = dsPadrao
    ReadOnly = True
    TabOrder = 2
  end
  object dbCep: TDBEdit [7]
    Left = 88
    Top = 150
    Width = 153
    Height = 21
    DataField = 'CEP'
    DataSource = dsPadrao
    TabOrder = 4
  end
  object dbMsg: TDBEdit [8]
    Left = 88
    Top = 174
    Width = 529
    Height = 21
    DataField = 'MENSAGEM'
    DataSource = dsPadrao
    TabOrder = 5
  end
  object dbEndereco: TDBEdit [9]
    Left = 88
    Top = 78
    Width = 531
    Height = 21
    DataField = 'ENDERECO'
    DataSource = dsPadrao
    TabOrder = 1
  end
  object dbBairro: TDBEdit [10]
    Left = 88
    Top = 126
    Width = 321
    Height = 21
    DataField = 'BAIRRO'
    DataSource = dsPadrao
    TabOrder = 3
  end
  inherited sbStatus: TStatusBar
    Top = 227
    Width = 649
    ExplicitTop = 227
    ExplicitWidth = 649
  end
  inherited pnBotoesPadrao: TPanel
    Width = 649
    TabOrder = 6
    ExplicitWidth = 649
  end
  inherited actlNavigateActions: TActionList
    Left = 416
    Top = 4
    inherited actPrint: TAction
      OnExecute = actPrintExecute
    end
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 575
    Top = 4
  end
  inherited mmPadrao: TMainMenu
    Left = 448
    Top = 4
  end
  object sqldPadrao: TSQLDataSet
    CommandText = 
      'select '#13#10'  env.IDENVELOPE, '#13#10'  env.NOME, '#13#10'  env.ENDERECO, '#13#10'  e' +
      'nv.IDCIDADE, '#13#10'  cid.DESCRICAO NOMECIDADE,'#13#10'  env.BAIRRO, '#13#10'  en' +
      'v.CEP, '#13#10'  env.MENSAGEM '#13#10'from ENVELOPE env'#13#10'left join CIDADES c' +
      'id on (env.IDCIDADE = cid.CODCIDADE)'
    MaxBlobSize = -1
    Params = <>
    Left = 480
    Top = 4
    object sqldPadraoIDENVELOPE: TIntegerField
      FieldName = 'IDENVELOPE'
      Required = True
    end
    object sqldPadraoNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object sqldPadraoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object sqldPadraoIDCIDADE: TIntegerField
      FieldName = 'IDCIDADE'
    end
    object sqldPadraoBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 50
    end
    object sqldPadraoCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object sqldPadraoMENSAGEM: TStringField
      FieldName = 'MENSAGEM'
      Size = 150
    end
    object sqldPadraoNOMECIDADE: TStringField
      FieldName = 'NOMECIDADE'
      ProviderFlags = []
      Size = 80
    end
  end
  object dspPadrao: TDataSetProvider
    DataSet = sqldPadrao
    Left = 512
    Top = 4
  end
  object cdsPadrao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    AfterInsert = cdsPadraoAfterInsert
    Left = 544
    Top = 4
    object cdsPadraoIDENVELOPE: TIntegerField
      FieldName = 'IDENVELOPE'
      Required = True
    end
    object cdsPadraoNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object cdsPadraoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object cdsPadraoIDCIDADE: TIntegerField
      FieldName = 'IDCIDADE'
      OnValidate = cdsPadraoIDCIDADEValidate
    end
    object cdsPadraoBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 50
    end
    object cdsPadraoCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object cdsPadraoMENSAGEM: TStringField
      FieldName = 'MENSAGEM'
      Size = 150
    end
    object cdsPadraoNOMECIDADE: TStringField
      FieldName = 'NOMECIDADE'
      ProviderFlags = []
      Size = 80
    end
  end
  object sqldCidade: TSQLDataSet
    CommandText = 
      'select '#13#10'  CODCIDADE, '#13#10'  DESCRICAO '#13#10'from CIDADES'#13#10'order by DES' +
      'CRICAO'
    MaxBlobSize = -1
    Params = <>
    Left = 432
    Top = 112
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
    Left = 512
    Top = 112
  end
  object cdsCidade: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCidade'
    Left = 584
    Top = 112
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
