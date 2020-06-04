inherited frmCadastroUnidade: TfrmCadastroUnidade
  ClientHeight = 156
  ClientWidth = 480
  Caption = 'frmCadastroUnidade'
  OldCreateOrder = True
  ExplicitWidth = 486
  ExplicitHeight = 185
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbStatus: TStatusBar
    Top = 137
    Width = 480
    ExplicitTop = 137
    ExplicitWidth = 393
  end
  inherited pnBotoesPadrao: TContainerPanel
    Width = 480
    TabOrder = 2
    ExplicitWidth = 393
  end
  object dbeNomeUnidade: TDBEdit [2]
    Left = 70
    Top = 82
    Width = 297
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'DESCRICAO'
    DataSource = dsPadrao
    TabOrder = 1
  end
  object dbeCodUnidade: TDBEdit [3]
    Left = 70
    Top = 56
    Width = 105
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'CODUNIDADE'
    DataSource = dsPadrao
    TabOrder = 0
  end
  inherited actlNavigateActions: TActionList
    Left = 48
    Top = 68
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 423
    Top = 52
  end
  object sqldPadrao: TSQLDataSet
    CommandText = 'select '#13#10'  CODUNIDADE, '#13#10'  DESCRICAO '#13#10'from UNIDADES'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 176
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
    Left = 264
    Top = 44
  end
  object cdsPadrao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 344
    Top = 44
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
