inherited frmCadastroGrupo: TfrmCadastroGrupo
  ClientHeight = 156
  ClientWidth = 529
  Caption = 'frmCadastroGrupo'
  OldCreateOrder = True
  ExplicitWidth = 535
  ExplicitHeight = 185
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbStatus: TStatusBar
    Top = 137
    Width = 529
    ExplicitTop = 137
    ExplicitWidth = 606
  end
  inherited pnBotoesPadrao: TContainerPanel
    Width = 529
    TabOrder = 2
    ExplicitWidth = 606
  end
  object dbeNomeGrupo: TDBEdit [2]
    Left = 62
    Top = 82
    Width = 305
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'DESCRICAO'
    DataSource = dsPadrao
    TabOrder = 1
  end
  object dbeCodGrupo: TDBEdit [3]
    Left = 62
    Top = 56
    Width = 105
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'CODGRUPO'
    DataSource = dsPadrao
    TabOrder = 0
  end
  inherited actlNavigateActions: TActionList
    Left = 392
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 407
    Top = 100
  end
  object sqldPadrao: TSQLDataSet
    CommandText = 'select '#13#10'  CODGRUPO, '#13#10'  DESCRICAO '#13#10'from GRUPOS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 176
    Top = 84
    object sqldPadraoCODGRUPO: TIntegerField
      FieldName = 'CODGRUPO'
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
    Top = 84
  end
  object cdsPadrao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 304
    Top = 44
    object cdsPadraoCODGRUPO: TIntegerField
      FieldName = 'CODGRUPO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPadraoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
  end
end
