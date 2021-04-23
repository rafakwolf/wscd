inherited frmCadastroCaixa: TfrmCadastroCaixa
  Left = 213
  ClientHeight = 164
  ClientWidth = 535
  Caption = 'frmCadastroCaixa'
  OldCreateOrder = True
  Font.Name = 'Verdana'
  ExplicitWidth = 541
  ExplicitHeight = 193
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbStatus: TStatusBar
    Top = 145
    Width = 535
    ExplicitTop = 145
    ExplicitWidth = 535
  end
  inherited pnBotoesPadrao: TPanel
    Width = 535
    TabOrder = 3
    ExplicitWidth = 535
    inherited btnConsultar: TSpeedButton
      Left = 253
      Width = 65
      ExplicitLeft = 253
      ExplicitWidth = 65
    end
    inherited btnSair: TSpeedButton
      Left = 378
      Width = 53
      ExplicitLeft = 378
      ExplicitWidth = 53
    end
    inherited btnPrint: TSpeedButton
      Left = 319
      Width = 59
      ExplicitLeft = 319
      ExplicitWidth = 59
    end
  end
  object dbeNomeCaixa: TDBEdit [2]
    Left = 64
    Top = 83
    Width = 305
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'NOME'
    DataSource = dsPadrao
    TabOrder = 1
  end
  object dbeCodCaixa: TDBEdit [3]
    Left = 64
    Top = 57
    Width = 121
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'CODIGO'
    DataSource = dsPadrao
    TabOrder = 0
  end
  object dbchkInativo: TDBCheckBox [4]
    Left = 64
    Top = 109
    Width = 63
    Height = 17
    Hint = ''
    ShowHint = True
    DataField = 'INATIVO'
    DataSource = dsPadrao
    ValueChecked = 'S'
    ValueUnchecked = 'N'
    Caption = 'Inativo'
    TabOrder = 2
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
  object cdsPadrao: TMemDataset
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
