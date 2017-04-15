inherited frmCadastroGrupo: TfrmCadastroGrupo
  Caption = 'frmCadastroGrupo'
  ClientHeight = 156
  ClientWidth = 393
  OldCreateOrder = True
  ExplicitWidth = 399
  ExplicitHeight = 205
  PixelsPerInch = 96
  TextHeight = 13
  object dbeNomeGrupo: TDBEdit [0]
    Left = 62
    Top = 82
    Width = 305
    Height = 21
    DataField = 'DESCRICAO'
    DataSource = dsPadrao
    TabOrder = 1
  end
  object dbeCodGrupo: TDBEdit [1]
    Left = 62
    Top = 56
    Width = 105
    Height = 21
    DataField = 'CODGRUPO'
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
    CommandText = 'select '#13#10'  CODGRUPO, '#13#10'  DESCRICAO '#13#10'from GRUPOS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 248
    Top = 44
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
