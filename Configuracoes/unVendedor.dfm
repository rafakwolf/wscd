inherited frmVendedor: TfrmVendedor
  Left = 229
  Top = 165
  ClientHeight = 200
  ClientWidth = 522
  Caption = 'frmVendedor'
  OldCreateOrder = True
  Font.Name = 'Verdana'
  ExplicitWidth = 528
  ExplicitHeight = 229
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbStatus: TUniStatusBar
    Top = 181
    Width = 522
    ExplicitTop = 210
    ExplicitWidth = 522
  end
  inherited pnBotoesPadrao: TUniContainerPanel
    Width = 522
    ExplicitWidth = 522
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
  object dbeIdVendedor: TUniDBEdit [2]
    Left = 80
    Top = 56
    Width = 97
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'IDVENDEDOR'
    DataSource = dsPadrao
    TabOrder = 2
  end
  object dbeVendedor: TUniDBEdit [3]
    Left = 80
    Top = 82
    Width = 305
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'VENDEDOR'
    DataSource = dsPadrao
    TabOrder = 3
  end
  object dbcbAtivo: TUniDBCheckBox [4]
    Left = 80
    Top = 108
    Width = 57
    Height = 17
    Hint = ''
    ShowHint = True
    DataField = 'ATIVO'
    DataSource = dsPadrao
    ValueChecked = 'S'
    ValueUnchecked = 'N'
    Caption = 'Ativo'
    TabOrder = 4
  end
  inherited actlNavigateActions: TActionList
    Left = 184
    Top = 124
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 439
    Top = 60
  end
  object sqldPadrao: TSQLDataSet
    CommandText = 'select '#13#10'  IDVENDEDOR, '#13#10'  VENDEDOR, '#13#10'  ATIVO '#13#10'from VENDEDOR'
    MaxBlobSize = -1
    Params = <>
    Left = 288
    Top = 124
    object sqldPadraoIDVENDEDOR: TIntegerField
      FieldName = 'IDVENDEDOR'
      Required = True
    end
    object sqldPadraoVENDEDOR: TStringField
      FieldName = 'VENDEDOR'
      Size = 80
    end
    object sqldPadraoATIVO: TStringField
      FieldName = 'ATIVO'
      FixedChar = True
      Size = 1
    end
  end
  object dspPadrao: TDataSetProvider
    DataSet = sqldPadrao
    Options = [poPropogateChanges, poUseQuoteChar]
    Left = 376
    Top = 124
  end
  object cdsPadrao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    AfterInsert = cdsPadraoAfterInsert
    AfterScroll = cdsPadraoAfterScroll
    Left = 448
    Top = 124
    object cdsPadraoIDVENDEDOR: TIntegerField
      FieldName = 'IDVENDEDOR'
      Required = True
    end
    object cdsPadraoVENDEDOR: TStringField
      FieldName = 'VENDEDOR'
      Size = 80
    end
    object cdsPadraoATIVO: TStringField
      FieldName = 'ATIVO'
      FixedChar = True
      Size = 1
    end
  end
end
