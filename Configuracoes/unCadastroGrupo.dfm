inherited frmCadastroGrupo: TfrmCadastroGrupo
  ClientHeight = 156
  ClientWidth = 606
  Caption = 'frmCadastroGrupo'
  OldCreateOrder = True
  ExplicitWidth = 612
  ExplicitHeight = 185
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbStatus: TUniStatusBar
    Top = 137
    Width = 606
    ExplicitTop = 137
    ExplicitWidth = 393
  end
  inherited pnBotoesPadrao: TUniContainerPanel
    Width = 606
    TabOrder = 2
    ExplicitWidth = 393
  end
  object dbeNomeGrupo: TUniDBEdit [2]
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
  object dbeCodGrupo: TUniDBEdit [3]
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
    Left = 432
    Top = 92
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 535
  end
  object sqldPadrao: TSQLDataSet
    CommandText = 'select '#13#10'  CODGRUPO, '#13#10'  DESCRICAO '#13#10'from GRUPOS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 272
    Top = 28
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
    Left = 344
    Top = 28
  end
  object cdsPadrao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    AfterInsert = cdsPadraoAfterInsert
    Left = 432
    Top = 36
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
