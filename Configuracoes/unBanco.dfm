inherited frmBanco: TfrmBanco
  Caption = 'frmBanco'
  ClientHeight = 210
  ClientWidth = 470
  OldCreateOrder = True
  ExplicitWidth = 476
  ExplicitHeight = 259
  PixelsPerInch = 96
  TextHeight = 13
  object dbeCodCompensacao: TDBEdit [0]
    Left = 96
    Top = 54
    Width = 105
    Height = 21
    Hint = 'C'#243'digo de compensa'#231#227'o'
    DataField = 'IDBANCO'
    DataSource = dsPadrao
    TabOrder = 0
  end
  object dbeBanco: TDBEdit [1]
    Left = 96
    Top = 80
    Width = 321
    Height = 21
    Hint = 'Nome do banco'
    DataField = 'BANCO'
    DataSource = dsPadrao
    TabOrder = 1
  end
  inherited sbStatus: TStatusBar
    Top = 191
    Width = 470
    ExplicitTop = 137
    ExplicitWidth = 433
  end
  inherited pnBotoesPadrao: TPanel
    Width = 470
    TabOrder = 2
    ExplicitWidth = 433
  end
  inherited actlNavigateActions: TActionList
    Left = 32
    Top = 108
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 199
    Top = 108
  end
  inherited mmPadrao: TMainMenu
    Left = 64
    Top = 108
  end
  object sqldPadrao: TSQLDataSet
    CommandText = 'select * from BANCO'
    MaxBlobSize = -1
    Params = <>
    Left = 104
    Top = 108
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
    Left = 136
    Top = 108
  end
  object cdsPadrao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 168
    Top = 108
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
