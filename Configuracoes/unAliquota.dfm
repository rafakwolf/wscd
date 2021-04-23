inherited frmAliquota: TfrmAliquota
  ClientHeight = 172
  ClientWidth = 393
  Caption = 'frmAliquota'
  OldCreateOrder = True
  ExplicitWidth = 399
  ExplicitHeight = 201
  PixelsPerInch = 96
  TextHeight = 13
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
  object dbeAliquota: TDBEdit [2]
    Left = 80
    Top = 82
    Width = 273
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'DESCRICAO'
    DataSource = dsPadrao
    TabOrder = 1
  end
  object dbeCodAliquota: TDBEdit [3]
    Left = 80
    Top = 56
    Width = 121
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'CODALIQUOTA'
    DataSource = dsPadrao
    TabOrder = 0
  end
  inherited actlNavigateActions: TActionList
    Left = 40
    Top = 100
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 327
    Top = 108
  end
  object sqldPadrao: TSQLDataSet
    CommandText = 'select '#13#10'  CODALIQUOTA, '#13#10'  DESCRICAO '#13#10'from ALIQUOTAS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 136
    Top = 100
  end
  object dspPadrao: TDataSetProvider
    DataSet = sqldPadrao
    Left = 208
    Top = 108
  end
  object cdsPadrao: TMemDataset
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    AfterInsert = cdsPadraoAfterInsert
    Left = 264
    Top = 116
    object cdsPadraoCODALIQUOTA: TIntegerField
      FieldName = 'CODALIQUOTA'
      Required = True
    end
    object cdsPadraoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
    end
  end
end
