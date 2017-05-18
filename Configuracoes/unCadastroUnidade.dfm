inherited frmCadastroUnidade: TfrmCadastroUnidade
  Caption = 'frmCadastroUnidade'
  ClientHeight = 156
  ClientWidth = 393
  OldCreateOrder = True
  ExplicitWidth = 399
  ExplicitHeight = 185
  PixelsPerInch = 96
  TextHeight = 13
  object dbeNomeUnidade: TDBEdit [0]
    Left = 70
    Top = 82
    Width = 297
    Height = 21
    DataField = 'DESCRICAO'
    DataSource = dsPadrao
    TabOrder = 1
  end
  object dbeCodUnidade: TDBEdit [1]
    Left = 70
    Top = 56
    Width = 105
    Height = 21
    DataField = 'CODUNIDADE'
    DataSource = dsPadrao
    TabOrder = 0
  end
  inherited sbStatus: TStatusBar
    Top = 137
    Width = 393
    ExplicitTop = 137
    ExplicitWidth = 393
  end
  inherited pnBotoesPadrao: TPanel
    Width = 393
    TabOrder = 2
    ExplicitWidth = 393
  end
  inherited actlNavigateActions: TActionList
    Left = 24
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 351
  end
  object sqldPadrao: TSQLDataSet
    CommandText = 'select '#13#10'  CODUNIDADE, '#13#10'  DESCRICAO '#13#10'from UNIDADES'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 120
    Top = 44
    object sqldPadraoCODUNIDADE: TIntegerField
      FieldName = 'CODUNIDADE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqldPadraoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
    end
  end
  object dspPadrao: TDataSetProvider
    DataSet = sqldPadrao
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 232
    Top = 36
  end
  object cdsPadrao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    AfterInsert = cdsPadraoAfterInsert
    Left = 256
    Top = 92
    object cdsPadraoCODUNIDADE: TIntegerField
      FieldName = 'CODUNIDADE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPadraoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
    end
  end
end
