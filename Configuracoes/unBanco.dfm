inherited frmBanco: TfrmBanco
  ClientHeight = 156
  ClientWidth = 472
  Caption = 'frmBanco'
  OldCreateOrder = True
  ExplicitWidth = 478
  ExplicitHeight = 185
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbStatus: TUniStatusBar
    Top = 137
    Width = 472
    ExplicitTop = 137
    ExplicitWidth = 433
  end
  inherited pnBotoesPadrao: TUniContainerPanel
    Width = 472
    TabOrder = 2
    ExplicitWidth = 433
  end
  object dbeCodCompensacao: TUniDBEdit [2]
    Left = 96
    Top = 54
    Width = 105
    Height = 21
    Hint = 'C'#243'digo de compensa'#231#227'o'
    ShowHint = True
    DataField = 'IDBANCO'
    DataSource = dsPadrao
    TabOrder = 0
  end
  object dbeBanco: TUniDBEdit [3]
    Left = 96
    Top = 80
    Width = 321
    Height = 21
    Hint = 'Nome do banco'
    ShowHint = True
    DataField = 'BANCO'
    DataSource = dsPadrao
    TabOrder = 1
  end
  inherited actlNavigateActions: TActionList
    Left = 32
    Top = 76
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 311
  end
  object sqldPadrao: TSQLDataSet
    CommandText = 'select * from BANCO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 112
    Top = 84
    object sqldPadraoIDBANCO: TIntegerField
      FieldName = 'IDBANCO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqldPadraoBANCO: TStringField
      FieldName = 'BANCO'
      Size = 80
    end
  end
  object dspPadrao: TDataSetProvider
    DataSet = sqldPadrao
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 184
    Top = 84
  end
  object cdsPadrao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 256
    Top = 84
    object cdsPadraoIDBANCO: TIntegerField
      FieldName = 'IDBANCO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '000'
    end
    object cdsPadraoBANCO: TStringField
      FieldName = 'BANCO'
      Size = 80
    end
  end
end
