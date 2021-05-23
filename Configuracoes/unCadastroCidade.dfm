inherited frmCadastroCidade: TfrmCadastroCidade
  Left = 200
  Top = 115
  Caption = 'frmCadastroCidade'
  ClientHeight = 156
  ClientWidth = 393
  OldCreateOrder = True
  ExplicitWidth = 399
  ExplicitHeight = 205
  PixelsPerInch = 96
  TextHeight = 13
  object dbeNomeCidade: TDBEdit [0]
    Left = 61
    Top = 82
    Width = 313
    Height = 21
    DataField = 'DESCRICAO'
    DataSource = dsPadrao
    TabOrder = 1
  end
  object dbeCodCidade: TDBEdit [1]
    Left = 61
    Top = 56
    Width = 97
    Height = 21
    DataField = 'CODCIDADE'
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
    Left = 184
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 343
  end
  inherited mmPadrao: TMainMenu
    Left = 216
  end
  object sqldPadrao: TSQLDataSet
    CommandText = 'select '#13#10'  CODCIDADE, '#13#10'  DESCRICAO '#13#10'from CIDADES'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 248
    Top = 44
    object sqldPadraoCODCIDADE: TIntegerField
      FieldName = 'CODCIDADE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqldPadraoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
  end
  object dspPadrao: TDataSetProvider
    DataSet = sqldPadrao
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 280
    Top = 44
  end
  object cdsPadrao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    AfterInsert = cdsPadraoAfterInsert
    Left = 312
    Top = 44
    object cdsPadraoCODCIDADE: TIntegerField
      FieldName = 'CODCIDADE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPadraoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
  end
end
