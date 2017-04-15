inherited frmCadastroCFOP: TfrmCadastroCFOP
  Caption = 'frmCadastroCFOP'
  ClientHeight = 308
  ClientWidth = 553
  OldCreateOrder = True
  ExplicitWidth = 559
  ExplicitHeight = 357
  PixelsPerInch = 96
  TextHeight = 13
  object lblDescricao: TLabel [0]
    Left = 20
    Top = 110
    Width = 56
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object dbeNomeCfop: TDBEdit [1]
    Left = 79
    Top = 82
    Width = 449
    Height = 21
    DataField = 'OPERACAO'
    DataSource = dsPadrao
    TabOrder = 1
  end
  object dbeCodCfop: TDBEdit [2]
    Left = 79
    Top = 56
    Width = 121
    Height = 21
    DataField = 'NUMERO'
    DataSource = dsPadrao
    TabOrder = 0
  end
  object dbmCfNota: TDBMemo [3]
    Left = 79
    Top = 108
    Width = 449
    Height = 161
    DataField = 'CFNOTA'
    DataSource = dsPadrao
    TabOrder = 2
  end
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
  inherited actlNavigateActions: TActionList
    Left = 256
    inherited actPrint: TAction
      Hint = 'Listagem'
      ShortCut = 0
      OnExecute = actPrintExecute
    end
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 415
  end
  inherited mmPadrao: TMainMenu
    Left = 288
    inherited miRelatorios: TMenuItem
      inherited mImprimir: TMenuItem
        Caption = 'Listagem de CFOPs'
      end
      object N5: TMenuItem [1]
        Caption = '-'
      end
    end
  end
  object sqldPadrao: TSQLDataSet
    CommandText = 'select '#13#10'  NUMERO, '#13#10'  OPERACAO,'#13#10'  CFNOTA '#13#10'from CFOP'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 320
    Top = 44
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
    Left = 352
    Top = 44
  end
  object cdsPadrao: TClientDataSet
    Aggregates = <>
    PacketRecords = 10
    Params = <>
    ProviderName = 'dspPadrao'
    AfterInsert = cdsPadraoAfterInsert
    Left = 384
    Top = 44
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
