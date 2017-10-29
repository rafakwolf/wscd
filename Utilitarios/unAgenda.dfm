inherited frmAgenda: TfrmAgenda
  ClientHeight = 278
  ClientWidth = 475
  Caption = 'frmAgenda'
  OldCreateOrder = True
  Menu = mmPadrao
  ExplicitWidth = 481
  ExplicitHeight = 327
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbStatus: TUniStatusBar
    Top = 259
    Width = 475
    ExplicitTop = 259
    ExplicitWidth = 475
  end
  inherited pnBotoesPadrao: TUniContainerPanel
    Width = 475
    TabOrder = 4
    ExplicitWidth = 475
  end
  object btnObs: TUniBitBtn [2]
    Left = 56
    Top = 232
    Width = 97
    Height = 25
    Hint = ''
    ShowHint = True
    Caption = '&Observa'#231#227'o'
    TabOrder = 3
    OnClick = btnObsClick
  end
  object dbeNome: TUniDBEdit [3]
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
  object dbeFax: TUniDBEdit [4]
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
  object grpTelefone: TUniGroupBox [5]
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
  inherited actlNavigateActions: TActionList
    Left = 320
    Top = 108
    inherited actPrint: TAction
      Hint = 'Listagem de telefones'
      ShortCut = 0
      OnExecute = actPrintExecute
    end
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 399
    Top = 172
  end
  object sqldPadrao: TSQLDataSet
    CommandText = 
      'select '#13#10'  IDAGENDA,'#13#10'  NOME, '#13#10'  TELEFONE, '#13#10'  TELEFONE2, '#13#10'  T' +
      'ELEFONE3, '#13#10'  FAX, '#13#10'  OBS '#13#10'from AGENDA'
    MaxBlobSize = -1
    Params = <>
    Left = 304
    Top = 172
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
    Left = 336
    Top = 172
  end
  object cdsPadrao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    AfterInsert = cdsPadraoAfterInsert
    Left = 368
    Top = 172
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
  object mmPadrao: TUniMainMenu
    Left = 400
    Top = 92
    object miRelatorios: TUniMenuItem
      Caption = ''
      ImageIndex = 10
      ShortCut = 16464
      object mImprimir: TUniMenuItem
        Caption = 'Listagem de telefones'
      end
      object N5: TUniMenuItem
        Caption = '-'
      end
    end
  end
end
