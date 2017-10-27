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
  inherited sbStatus: TUniStatusBar
    Top = 289
    Width = 553
    ExplicitTop = 289
    ExplicitWidth = 553
  end
  inherited pnBotoesPadrao: TUniContainerPanel
    Width = 553
    TabOrder = 3
    ExplicitWidth = 553
    inherited btnNovo: TUniSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnAlterar: TUniSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnExcluir: TUniSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnSalvar: TUniSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnCancelar: TUniSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnConsultar: TUniSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnSair: TUniSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnPrint: TUniSpeedButton
      Font.Name = 'Verdana'
    end
  end
  object lblDescricao: TUniLabel [2]
    Left = 20
    Top = 110
    Width = 56
    Height = 13
    Hint = ''
    ShowHint = True
    Caption = 'Descri'#231#227'o'
    TabOrder = 5
  end
  object dbeNomeCfop: TUniDBEdit [3]
    Left = 79
    Top = 82
    Width = 449
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'OPERACAO'
    DataSource = dsPadrao
    TabOrder = 1
  end
  object dbeCodCfop: TUniDBEdit [4]
    Left = 79
    Top = 56
    Width = 121
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'NUMERO'
    DataSource = dsPadrao
    TabOrder = 0
  end
  object dbmCfNota: TUniDBMemo [5]
    Left = 79
    Top = 108
    Width = 449
    Height = 161
    Hint = ''
    ShowHint = True
    DataField = 'CFNOTA'
    DataSource = dsPadrao
    TabOrder = 2
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
    Left = 455
    Top = 20
  end
  object sqldPadrao: TSQLDataSet
    CommandText = 'select '#13#10'  NUMERO, '#13#10'  OPERACAO,'#13#10'  CFNOTA '#13#10'from CFOP'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 352
    Top = 36
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
    Left = 400
    Top = 84
  end
  object cdsPadrao: TClientDataSet
    Aggregates = <>
    PacketRecords = 10
    Params = <>
    ProviderName = 'dspPadrao'
    AfterInsert = cdsPadraoAfterInsert
    Left = 464
    Top = 116
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
