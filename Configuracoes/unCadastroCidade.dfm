inherited frmCadastroCidade: TfrmCadastroCidade
  Left = 200
  Top = 115
  ClientHeight = 201
  ClientWidth = 472
  Caption = 'frmCadastroCidade'
  OldCreateOrder = True
  ExplicitWidth = 478
  ExplicitHeight = 230
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbStatus: TUniStatusBar
    Top = 182
    Width = 472
    ExplicitTop = 215
    ExplicitWidth = 472
  end
  inherited pnBotoesPadrao: TUniContainerPanel
    Width = 472
    TabOrder = 2
    ExplicitWidth = 472
    inherited btnConsultar: TUniSpeedButton
      Left = 255
      ExplicitLeft = 255
    end
  end
  object dbeNomeCidade: TUniDBEdit [2]
    Left = 61
    Top = 82
    Width = 313
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'DESCRICAO'
    DataSource = dsPadrao
    TabOrder = 1
  end
  object dbeCodCidade: TUniDBEdit [3]
    Left = 61
    Top = 56
    Width = 97
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'CODCIDADE'
    DataSource = dsPadrao
    TabOrder = 0
  end
  inherited actlNavigateActions: TActionList
    Left = 48
    Top = 124
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 407
    Top = 124
  end
  object sqldPadrao: TSQLDataSet
    CommandText = 'select '#13#10'  CODCIDADE, '#13#10'  DESCRICAO '#13#10'from CIDADES'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 152
    Top = 124
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
    Left = 248
    Top = 124
  end
  object cdsPadrao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 328
    Top = 132
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
