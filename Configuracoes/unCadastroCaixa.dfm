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
  inherited sbStatus: TUniStatusBar
    Top = 145
    Width = 535
    ExplicitTop = 145
    ExplicitWidth = 535
  end
  inherited pnBotoesPadrao: TUniContainerPanel
    Width = 535
    TabOrder = 3
    ExplicitWidth = 535
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
  object dbeNomeCaixa: TUniDBEdit [2]
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
  object dbeCodCaixa: TUniDBEdit [3]
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
  object dbchkInativo: TUniDBCheckBox [4]
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
