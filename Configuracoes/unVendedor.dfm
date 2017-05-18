inherited frmVendedor: TfrmVendedor
  Left = 229
  Top = 165
  Caption = 'frmVendedor'
  ClientHeight = 229
  ClientWidth = 522
  OldCreateOrder = True
  ExplicitWidth = 528
  ExplicitHeight = 258
  PixelsPerInch = 96
  TextHeight = 13
  object dbcbAtivo: TDBCheckBox [0]
    Left = 80
    Top = 108
    Width = 57
    Height = 17
    Caption = 'Ativo'
    DataField = 'ATIVO'
    DataSource = dsPadrao
    TabOrder = 4
    ValueChecked = 'S'
    ValueUnchecked = 'N'
  end
  object dbeIdVendedor: TDBEdit [1]
    Left = 80
    Top = 56
    Width = 97
    Height = 21
    DataField = 'IDVENDEDOR'
    DataSource = dsPadrao
    TabOrder = 2
  end
  object dbeVendedor: TDBEdit [2]
    Left = 80
    Top = 82
    Width = 305
    Height = 21
    DataField = 'VENDEDOR'
    DataSource = dsPadrao
    TabOrder = 3
  end
  inherited sbStatus: TStatusBar
    Top = 210
    Width = 522
    ExplicitTop = 145
    ExplicitWidth = 409
  end
  inherited pnBotoesPadrao: TPanel
    Width = 522
    ExplicitWidth = 409
  end
  inherited actlNavigateActions: TActionList
    Left = 176
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
    Left = 280
    Top = 140
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
    Left = 368
    Top = 140
  end
  object cdsPadrao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    AfterInsert = cdsPadraoAfterInsert
    AfterScroll = cdsPadraoAfterScroll
    Left = 440
    Top = 132
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
