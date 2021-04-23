inherited frmCadastroCFOP: TfrmCadastroCFOP
  ClientHeight = 308
  ClientWidth = 553
  Caption = 'frmCadastroCFOP'
  OldCreateOrder = True
  Font.Name = 'Verdana'
  ExplicitWidth = 559
  ExplicitHeight = 337
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbStatus: TStatusBar
    Top = 289
    Width = 553
    ExplicitTop = 289
    ExplicitWidth = 553
  end
  inherited pnBotoesPadrao: TPanel
    Width = 553
    TabOrder = 3
    ExplicitWidth = 553
  end
  object dbeNomeCfop: TDBEdit [2]
    Left = 79
    Top = 82
    Width = 449
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'OPERACAO'
    DataSource = dsPadrao
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    TabOrder = 1
    FieldLabel = 'Nome'
  end
  object dbeCodCfop: TDBEdit [3]
    Left = 79
    Top = 56
    Width = 218
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'NUMERO'
    DataSource = dsPadrao
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    TabOrder = 0
    FieldLabel = 'Cfop'
  end
  object dbmCfNota: TDBMemo [4]
    Left = 79
    Top = 108
    Width = 449
    Height = 161
    Hint = ''
    ShowHint = True
    DataField = 'CFNOTA'
    DataSource = dsPadrao
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    TabOrder = 2
    FieldLabel = 'Descri'#231#227'o'
  end
  inherited actlNavigateActions: TActionList
    Left = 128
    Top = 180
    inherited actPrint: TAction
      Hint = 'Listagem'
      ShortCut = 0
      OnExecute = actPrintExecute
    end
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 447
    Top = 188
  end
  object sqldPadrao: TSQLDataSet
    CommandText = 'select '#13#10'  NUMERO, '#13#10'  OPERACAO,'#13#10'  CFNOTA '#13#10'from CFOP'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 240
    Top = 172
    object sqldPadraoNUMERO: TStringField
      FieldName = 'NUMERO'
      Required = True
    end
    object sqldPadraoOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Required = True
      Size = 250
    end
    object sqldPadraoCFNOTA: TStringField
      FieldName = 'CFNOTA'
      Size = 1000
    end
  end
  object dspPadrao: TDataSetProvider
    DataSet = sqldPadrao
    Options = [poAllowCommandText]
    Left = 312
    Top = 180
  end
  object cdsPadrao: TMemDataset
    Aggregates = <>
    PacketRecords = 10
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 376
    Top = 180
    object cdsPadraoNUMERO: TStringField
      FieldName = 'NUMERO'
      Required = True
    end
    object cdsPadraoOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Required = True
      Size = 250
    end
    object cdsPadraoCFNOTA: TStringField
      FieldName = 'CFNOTA'
      Size = 1000
    end
  end
end
