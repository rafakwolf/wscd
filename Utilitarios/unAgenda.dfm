inherited frmAgenda: TfrmAgenda
  ClientHeight = 389
  ClientWidth = 545
  Caption = 'frmAgenda'
  OldCreateOrder = True
  ExplicitWidth = 551
  ExplicitHeight = 418
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbStatus: TUniStatusBar
    Top = 370
    Width = 545
    ExplicitTop = 370
    ExplicitWidth = 545
  end
  inherited pnBotoesPadrao: TUniContainerPanel
    Width = 545
    TabOrder = 3
    ExplicitWidth = 545
  end
  object dbeNome: TUniDBEdit [2]
    Left = 56
    Top = 56
    Width = 329
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'NOME'
    DataSource = dsPadrao
    TabOrder = 0
  end
  object dbeFax: TUniDBEdit [3]
    Left = 56
    Top = 200
    Width = 161
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'FAX'
    DataSource = dsPadrao
    TabOrder = 2
  end
  object grpTelefone: TUniGroupBox [4]
    Left = 56
    Top = 88
    Width = 201
    Height = 105
    Hint = ''
    ShowHint = True
    Caption = ' Telefones '
    TabOrder = 1
    TabStop = False
    object dbeFone1: TUniDBEdit
      Left = 8
      Top = 18
      Width = 183
      Height = 21
      Hint = ''
      ShowHint = True
      DataField = 'TELEFONE'
      DataSource = dsPadrao
      TabOrder = 0
    end
    object dbeFone2: TUniDBEdit
      Left = 8
      Top = 46
      Width = 183
      Height = 21
      Hint = ''
      ShowHint = True
      DataField = 'TELEFONE2'
      DataSource = dsPadrao
      TabOrder = 1
    end
    object dbeFone3: TUniDBEdit
      Left = 8
      Top = 75
      Width = 183
      Height = 21
      Hint = ''
      ShowHint = True
      DataField = 'TELEFONE3'
      DataSource = dsPadrao
      TabOrder = 2
    end
  end
  object dbmObs: TUniDBMemo [5]
    Left = 56
    Top = 227
    Width = 345
    Height = 89
    Hint = ''
    ShowHint = True
    DataField = 'OBS'
    DataSource = dsPadrao
    TabOrder = 5
  end
  inherited actlNavigateActions: TActionList
    Left = 328
    Top = 100
    inherited actPrint: TAction
      Hint = 'Listagem de telefones'
      ShortCut = 0
    end
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 487
    Top = 172
  end
  object sqldPadrao: TSQLDataSet
    CommandText = 
      'select '#13#10'  IDAGENDA,'#13#10'  NOME, '#13#10'  TELEFONE, '#13#10'  TELEFONE2, '#13#10'  T' +
      'ELEFONE3, '#13#10'  FAX, '#13#10'  OBS '#13#10'from AGENDA'
    MaxBlobSize = -1
    Params = <>
    Left = 296
    Top = 164
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
    Left = 360
    Top = 172
  end
  object cdsPadrao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 432
    Top = 164
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
