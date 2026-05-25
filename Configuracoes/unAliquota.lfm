inherited frmAliquota: TfrmAliquota
  Caption = 'frmAliquota'
  ClientHeight = 172
  ClientWidth = 393
  OldCreateOrder = True
  ExplicitWidth = 399
  ExplicitHeight = 221
  PixelsPerInch = 96
  TextHeight = 13
  object dbeAliquota: TDBEdit [0]
    Left = 80
    Top = 82
    Width = 273
    Height = 21
    DataField = 'DESCRICAO'
    DataSource = dsPadrao
    TabOrder = 1
  end
  object dbeCodAliquota: TDBEdit [1]
    Left = 80
    Top = 56
    Width = 121
    Height = 21
    DataField = 'CODALIQUOTA'
    DataSource = dsPadrao
    TabOrder = 0
  end
  inherited sbStatus: TStatusBar
    Top = 153
    Width = 393
    ExplicitTop = 153
    ExplicitWidth = 393
  end
  inherited pnBotoesPadrao: TPanel
    Width = 393
    TabOrder = 2
    ExplicitWidth = 393
  end
  inherited actlNavigateActions: TActionList
    Left = 112
    Top = 108
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 271
    Top = 108
  end
  inherited mmPadrao: TMainMenu
    Left = 144
    Top = 108
  end
  object sqldPadrao: TSQLDataSet
    CommandText = 'select '#13#10'  CODALIQUOTA, '#13#10'  DESCRICAO '#13#10'from ALIQUOTAS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 176
    Top = 108
  end
  object dspPadrao: TDataSetProvider
    DataSet = sqldPadrao
    Left = 208
    Top = 108
  end
  object cdsPadrao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    AfterInsert = cdsPadraoAfterInsert
    Left = 240
    Top = 108
    object cdsPadraoCODALIQUOTA: TIntegerField
      FieldName = 'CODALIQUOTA'
      Required = True
    end
    object cdsPadraoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
    end
  end
end
