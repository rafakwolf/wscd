inherited frmRecibo: TfrmRecibo
  Left = 213
  Top = 135
  Caption = 'frmRecibo'
  ClientHeight = 318
  ClientWidth = 617
  OldCreateOrder = True
  ExplicitWidth = 623
  ExplicitHeight = 367
  PixelsPerInch = 96
  TextHeight = 13
  object lbRecebedor: TLabel [0]
    Left = 31
    Top = 84
    Width = 61
    Height = 13
    Caption = 'Recebedor'
    FocusControl = dbRecebedor
  end
  object lbRefente: TLabel [1]
    Left = 36
    Top = 153
    Width = 56
    Height = 13
    Caption = 'Referente'
    FocusControl = dbReferente
  end
  object lbValor: TLabel [2]
    Left = 62
    Top = 176
    Width = 29
    Height = 13
    Caption = 'Valor'
    FocusControl = dbValor
  end
  object lbValorExtenso: TLabel [3]
    Left = 13
    Top = 245
    Width = 78
    Height = 13
    Caption = 'Valor extenso'
    FocusControl = dbValorExtenso
  end
  object dbData: TDBEdit [4]
    Left = 96
    Top = 56
    Width = 186
    Height = 21
    DataField = 'DATA'
    DataSource = dsPadrao
    TabOrder = 0
  end
  object dbRecebedor: TDBEdit [5]
    Left = 96
    Top = 80
    Width = 500
    Height = 21
    DataField = 'RECEBEDOR'
    DataSource = dsPadrao
    TabOrder = 1
  end
  object dbReferente: TDBMemo [6]
    Left = 96
    Top = 104
    Width = 500
    Height = 65
    DataField = 'REFERENTE'
    DataSource = dsPadrao
    TabOrder = 2
  end
  object dbValor: TDBEdit [7]
    Left = 96
    Top = 172
    Width = 134
    Height = 21
    DataField = 'VALOR'
    DataSource = dsPadrao
    TabOrder = 3
    OnKeyPress = dbValorKeyPress
  end
  object dbValorExtenso: TDBMemo [8]
    Left = 96
    Top = 196
    Width = 500
    Height = 65
    DataField = 'VALOREXTENSO'
    DataSource = dsPadrao
    TabOrder = 4
  end
  inherited sbStatus: TStatusBar
    Top = 299
    Width = 617
    ExplicitTop = 299
    ExplicitWidth = 617
  end
  inherited pnBotoesPadrao: TPanel
    Width = 617
    TabOrder = 5
    ExplicitWidth = 617
  end
  inherited actlNavigateActions: TActionList
    Left = 272
    Top = 125
    inherited actPrint: TAction
      ShortCut = 0
      OnExecute = actPrintExecute
    end
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 431
    Top = 124
  end
  inherited mmPadrao: TMainMenu
    Left = 304
    Top = 124
    inherited miRelatorios: TMenuItem
      inherited mImprimir: TMenuItem
        Caption = 'Imprimir recibo'
      end
      object N5: TMenuItem [1]
        Caption = '-'
      end
    end
  end
  object sqldPadrao: TSQLDataSet
    CommandText = 
      'select  '#13#10'  IDRECIBO, '#13#10'  DATA, '#13#10'  RECEBEDOR, '#13#10'  REFERENTE, '#13#10 +
      '  VALOR, '#13#10'  VALOREXTENSO'#13#10'from RECIBO'
    MaxBlobSize = -1
    Params = <>
    Left = 336
    Top = 124
    object sqldPadraoIDRECIBO: TIntegerField
      FieldName = 'IDRECIBO'
      Required = True
    end
    object sqldPadraoDATA: TDateField
      FieldName = 'DATA'
    end
    object sqldPadraoRECEBEDOR: TStringField
      FieldName = 'RECEBEDOR'
      Size = 250
    end
    object sqldPadraoREFERENTE: TMemoField
      FieldName = 'REFERENTE'
      BlobType = ftMemo
      Size = 1
    end
    object sqldPadraoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 15
    end
    object sqldPadraoVALOREXTENSO: TMemoField
      FieldName = 'VALOREXTENSO'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dspPadrao: TDataSetProvider
    DataSet = sqldPadrao
    Options = [poAllowCommandText]
    Left = 368
    Top = 124
  end
  object cdsPadrao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    AfterInsert = cdsPadraoAfterInsert
    Left = 400
    Top = 124
    object cdsPadraoIDRECIBO: TIntegerField
      FieldName = 'IDRECIBO'
      Required = True
    end
    object cdsPadraoDATA: TDateField
      FieldName = 'DATA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoRECEBEDOR: TStringField
      FieldName = 'RECEBEDOR'
      Size = 250
    end
    object cdsPadraoREFERENTE: TMemoField
      FieldName = 'REFERENTE'
      BlobType = ftMemo
      Size = 1
    end
    object cdsPadraoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 15
    end
    object cdsPadraoVALOREXTENSO: TMemoField
      FieldName = 'VALOREXTENSO'
      BlobType = ftMemo
      Size = 1
    end
  end
  object tmrImpressao: TTimer
    Enabled = False
    OnTimer = tmrImpressaoTimer
    Left = 472
    Top = 124
  end
end
