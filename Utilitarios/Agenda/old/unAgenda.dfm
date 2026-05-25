inherited frmAgenda: TfrmAgenda
  Caption = 'frmAgenda'
  ClientHeight = 288
  ClientWidth = 401
  OldCreateOrder = True
  ExplicitWidth = 407
  ExplicitHeight = 337
  PixelsPerInch = 96
  TextHeight = 13
  object dbeNome: TDBEdit [0]
    Left = 56
    Top = 56
    Width = 329
    Height = 21
    DataField = 'NOME'
    DataSource = dsPadrao
    TabOrder = 0
  end
  object dbeFax: TDBEdit [1]
    Left = 56
    Top = 200
    Width = 161
    Height = 21
    DataField = 'FAX'
    DataSource = dsPadrao
    TabOrder = 2
  end
  object btnObs: TBitBtn [2]
    Left = 56
    Top = 232
    Width = 97
    Height = 25
    Caption = '&Observa'#231#227'o'
    TabOrder = 3
    OnClick = btnObsClick
  end
  object grpTelefone: TGroupBox [3]
    Left = 56
    Top = 88
    Width = 201
    Height = 105
    Caption = ' Telefones '
    TabOrder = 1
    object dbeFone1: TDBEdit
      Left = 8
      Top = 18
      Width = 183
      Height = 21
      DataField = 'TELEFONE'
      DataSource = dsPadrao
      TabOrder = 0
    end
    object dbeFone2: TDBEdit
      Left = 8
      Top = 46
      Width = 183
      Height = 21
      DataField = 'TELEFONE2'
      DataSource = dsPadrao
      TabOrder = 1
    end
    object dbeFone3: TDBEdit
      Left = 8
      Top = 75
      Width = 183
      Height = 21
      DataField = 'TELEFONE3'
      DataSource = dsPadrao
      TabOrder = 2
    end
  end
  inherited sbStatus: TStatusBar
    Top = 269
    Width = 401
    ExplicitTop = 269
    ExplicitWidth = 401
  end
  inherited pnBotoesPadrao: TPanel
    Width = 401
    TabOrder = 4
    ExplicitWidth = 401
  end
  inherited actlNavigateActions: TActionList
    Left = 272
    Top = 84
    inherited actPrint: TAction
      Hint = 'Listagem de telefones'
      ShortCut = 0
      OnExecute = actPrintExecute
    end
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 351
    Top = 148
  end
  inherited mmPadrao: TMainMenu
    Left = 312
    Top = 84
    inherited miRelatorios: TMenuItem
      ImageIndex = 10
      ShortCut = 16464
      inherited mImprimir: TMenuItem
        Caption = 'Listagem de telefones'
      end
      object N5: TMenuItem [1]
        Caption = '-'
      end
    end
  end
  object sqldPadrao: TSQLDataSet
    CommandText = 
      'select '#13#10'  IDAGENDA,'#13#10'  NOME, '#13#10'  TELEFONE, '#13#10'  TELEFONE2, '#13#10'  T' +
      'ELEFONE3, '#13#10'  FAX, '#13#10'  OBS '#13#10'from AGENDA'
    MaxBlobSize = -1
    Params = <>
    Left = 256
    Top = 148
    object sqldPadraoIDAGENDA: TIntegerField
      FieldName = 'IDAGENDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqldPadraoNOME: TStringField
      FieldName = 'NOME'
      Required = True
    end
    object sqldPadraoTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Required = True
    end
    object sqldPadraoTELEFONE2: TStringField
      FieldName = 'TELEFONE2'
    end
    object sqldPadraoTELEFONE3: TStringField
      FieldName = 'TELEFONE3'
    end
    object sqldPadraoFAX: TStringField
      FieldName = 'FAX'
    end
    object sqldPadraoOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dspPadrao: TDataSetProvider
    DataSet = sqldPadrao
    UpdateMode = upWhereKeyOnly
    Left = 288
    Top = 148
  end
  object cdsPadrao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    AfterInsert = cdsPadraoAfterInsert
    Left = 320
    Top = 148
    object cdsPadraoIDAGENDA: TIntegerField
      FieldName = 'IDAGENDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPadraoNOME: TStringField
      FieldName = 'NOME'
      Required = True
    end
    object cdsPadraoTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Required = True
    end
    object cdsPadraoTELEFONE2: TStringField
      FieldName = 'TELEFONE2'
    end
    object cdsPadraoTELEFONE3: TStringField
      FieldName = 'TELEFONE3'
    end
    object cdsPadraoFAX: TStringField
      FieldName = 'FAX'
    end
    object cdsPadraoOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
end
