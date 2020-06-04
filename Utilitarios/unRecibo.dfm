inherited frmRecibo: TfrmRecibo
  Left = 213
  Top = 135
  ClientHeight = 278
  ClientWidth = 617
  Caption = 'frmRecibo'
  OldCreateOrder = True
  Menu = mmPadrao
  Font.Name = 'Verdana'
  ExplicitWidth = 623
  ExplicitHeight = 327
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbStatus: TStatusBar
    Top = 259
    Width = 617
    ExplicitTop = 259
    ExplicitWidth = 617
  end
  inherited pnBotoesPadrao: TContainerPanel
    Width = 617
    TabOrder = 5
    ExplicitWidth = 617
    inherited btnNovo: TSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnAlterar: TSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnExcluir: TSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnSalvar: TSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnCancelar: TSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnConsultar: TSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnSair: TSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnPrint: TSpeedButton
      Font.Name = 'Verdana'
    end
  end
  object lbRecebedor: TLabel [2]
    Left = 31
    Top = 84
    Width = 61
    Height = 13
    Hint = ''
    ShowHint = True
    Caption = 'Recebedor'
    TabOrder = 7
  end
  object lbRefente: TLabel [3]
    Left = 36
    Top = 153
    Width = 56
    Height = 13
    Hint = ''
    ShowHint = True
    Caption = 'Referente'
    TabOrder = 8
  end
  object lbValor: TLabel [4]
    Left = 62
    Top = 176
    Width = 29
    Height = 13
    Hint = ''
    ShowHint = True
    Caption = 'Valor'
    TabOrder = 9
  end
  object lbValorExtenso: TLabel [5]
    Left = 12
    Top = 221
    Width = 78
    Height = 13
    Hint = ''
    ShowHint = True
    Caption = 'Valor extenso'
    TabOrder = 10
  end
  object dbData: TDBEdit [6]
    Left = 96
    Top = 56
    Width = 186
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'DATA'
    DataSource = dsPadrao
    TabOrder = 0
  end
  object dbRecebedor: TDBEdit [7]
    Left = 96
    Top = 80
    Width = 500
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'RECEBEDOR'
    DataSource = dsPadrao
    TabOrder = 1
  end
  object dbValor: TDBEdit [8]
    Left = 96
    Top = 172
    Width = 134
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'VALOR'
    DataSource = dsPadrao
    TabOrder = 3
  end
  object dbReferente: TDBMemo [9]
    Left = 96
    Top = 104
    Width = 500
    Height = 65
    Hint = ''
    ShowHint = True
    DataField = 'REFERENTE'
    DataSource = dsPadrao
    TabOrder = 2
  end
  object dbValorExtenso: TDBMemo [10]
    Left = 96
    Top = 196
    Width = 500
    Height = 65
    Hint = ''
    ShowHint = True
    DataField = 'VALOREXTENSO'
    DataSource = dsPadrao
    TabOrder = 4
  end
  inherited actlNavigateActions: TActionList
    Left = 224
    Top = 117
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
  object sqldPadrao: TSQLDataSet
    CommandText = 
      'select  '#13#10'  IDRECIBO, '#13#10'  DATA, '#13#10'  RECEBEDOR, '#13#10'  REFERENTE, '#13#10 +
      '  VALOR, '#13#10'  VALOREXTENSO'#13#10'from RECIBO'
    MaxBlobSize = -1
    Params = <>
    Left = 336
    Top = 68
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
    Left = 424
    Top = 68
  end
  object cdsPadrao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 352
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
  object mmPadrao: TMainMenu
    Left = 272
    Top = 84
    object miRelatorios: TMenuItem
      Caption = ''
      object mImprimir: TMenuItem
        Caption = 'Imprimir recibo'
      end
      object N5: TMenuItem
        Caption = '-'
      end
    end
  end
end
