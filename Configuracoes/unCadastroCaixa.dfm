inherited frmCadastroCaixa: TfrmCadastroCaixa
  Left = 213
  Caption = 'frmCadastroCaixa'
  ClientHeight = 164
  ClientWidth = 535
  OldCreateOrder = True
  ExplicitWidth = 541
  ExplicitHeight = 193
  PixelsPerInch = 96
  TextHeight = 13
  object dbeNomeCaixa: TDBEdit [0]
    Left = 64
    Top = 83
    Width = 305
    Height = 21
    DataField = 'NOME'
    DataSource = dsPadrao
    TabOrder = 1
  end
  object dbeCodCaixa: TDBEdit [1]
    Left = 64
    Top = 57
    Width = 121
    Height = 21
    DataField = 'CODIGO'
    DataSource = dsPadrao
    TabOrder = 0
  end
  object dbchkInativo: TDBCheckBox [2]
    Left = 64
    Top = 109
    Width = 63
    Height = 17
    Caption = 'Inativo'
    DataField = 'INATIVO'
    DataSource = dsPadrao
    TabOrder = 2
    ValueChecked = 'S'
    ValueUnchecked = 'N'
  end
  inherited sbStatus: TStatusBar
    Top = 145
    Width = 535
    ExplicitTop = 145
    ExplicitWidth = 393
  end
  inherited pnBotoesPadrao: TPanel
    Width = 535
    TabOrder = 3
    ExplicitWidth = 393
  end
  inherited actlNavigateActions: TActionList
    Left = 208
    Top = 36
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 471
    Top = 36
  end
  object sqldPadrao: TSQLDataSet
    CommandText = 'select '#13#10'  CODIGO, '#13#10'  NOME,'#13#10'  INATIVO'#13#10'from CAIXAS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 280
    Top = 20
    object sqldPadraoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqldPadraoNOME: TStringField
      FieldName = 'NOME'
      Size = 80
    end
    object sqldPadraoINATIVO: TStringField
      FieldName = 'INATIVO'
      FixedChar = True
      Size = 1
    end
  end
  object dspPadrao: TDataSetProvider
    DataSet = sqldPadrao
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 344
    Top = 44
  end
  object cdsPadrao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    AfterInsert = cdsPadraoAfterInsert
    AfterScroll = cdsPadraoAfterScroll
    Left = 408
    Top = 92
    object cdsPadraoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPadraoNOME: TStringField
      FieldName = 'NOME'
      Size = 80
    end
    object cdsPadraoINATIVO: TStringField
      FieldName = 'INATIVO'
      FixedChar = True
      Size = 1
    end
  end
end