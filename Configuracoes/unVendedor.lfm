inherited frmVendedor: TfrmVendedor
  Left = 229
  Top = 165
  Caption = 'frmVendedor'
  ClientHeight = 164
  ClientWidth = 409
  OldCreateOrder = True
  ExplicitWidth = 415
  ExplicitHeight = 213
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
    Top = 145
    Width = 409
    ExplicitTop = 145
    ExplicitWidth = 409
  end
  inherited pnBotoesPadrao: TPanel
    Width = 409
    ExplicitWidth = 409
  end
  inherited actlNavigateActions: TActionList
    Left = 184
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 367
  end
  inherited mmPadrao: TMainMenu
    Left = 216
  end
  object sqldPadrao: TSQLDataSet
    CommandText = 'select '#13#10'  IDVENDEDOR, '#13#10'  VENDEDOR, '#13#10'  ATIVO '#13#10'from VENDEDOR'
    MaxBlobSize = -1
    Params = <>
    Left = 248
    Top = 44
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
    Left = 280
    Top = 44
  end
  object cdsPadrao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    AfterInsert = cdsPadraoAfterInsert
    AfterScroll = cdsPadraoAfterScroll
    Left = 312
    Top = 44
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
