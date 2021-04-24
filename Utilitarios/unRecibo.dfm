inherited frmRecibo: TfrmRecibo
  Left = 328
  Top = 181
  Caption = 'frmRecibo'
  ClientHeight = 348
  Font.Name = 'Verdana'
  Menu = mmPadrao
  inherited sbStatus: TStatusBar
    Top = 330
  end
  inherited pnBotoesPadrao: TPanel
    TabOrder = 5
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
  object lbRecebedor: TLabel[2]
    Left = 31
    Height = 15
    Top = 84
    Width = 69
    Caption = 'Recebedor'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbRefente: TLabel[3]
    Left = 36
    Height = 15
    Top = 153
    Width = 64
    Caption = 'Referente'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbValor: TLabel[4]
    Left = 62
    Height = 15
    Top = 176
    Width = 33
    Caption = 'Valor'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbValorExtenso: TLabel[5]
    Left = 12
    Height = 15
    Top = 221
    Width = 89
    Caption = 'Valor extenso'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object dbData: TDBEdit[6]
    Left = 108
    Height = 33
    Top = 56
    Width = 186
    DataField = 'DATA'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object dbRecebedor: TDBEdit[7]
    Left = 108
    Height = 33
    Top = 80
    Width = 500
    DataField = 'RECEBEDOR'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object dbValor: TDBEdit[8]
    Left = 108
    Height = 33
    Top = 172
    Width = 134
    DataField = 'VALOR'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object dbReferente: TDBMemo[9]
    Left = 108
    Height = 65
    Top = 104
    Width = 500
    DataField = 'REFERENTE'
    DataSource = dsPadrao
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object dbValorExtenso: TDBMemo[10]
    Left = 108
    Height = 65
    Top = 196
    Width = 500
    DataField = 'VALOREXTENSO'
    DataSource = dsPadrao
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
  inherited actlNavigateActions: TActionList[11]
    Left = 236
    Top = 117
    inherited actPrint: TAction
      OnExecute = actPrintExecute
      ShortCut = 0
    end
  end
  inherited dsPadrao: TDataSource[12]
    DataSet = cdsPadrao
    Left = 443
    Top = 124
  end
  object sqldPadrao: TSQLQuery[13]
    FieldDefs = <>
    Params = <>
    Left = 348
    Top = 68
    object sqldPadraoIDRECIBO: TIntegerField
      FieldKind = fkData
      FieldName = 'IDRECIBO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object sqldPadraoDATA: TDateField
      FieldKind = fkData
      FieldName = 'DATA'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoRECEBEDOR: TStringField
      FieldKind = fkData
      FieldName = 'RECEBEDOR'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 250
    end
    object sqldPadraoREFERENTE: TMemoField
      FieldKind = fkData
      FieldName = 'REFERENTE'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      BlobType = ftMemo
      Size = 1
      Transliterate = False
    end
    object sqldPadraoVALOR: TFMTBCDField
      FieldKind = fkData
      FieldName = 'VALOR'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object sqldPadraoVALOREXTENSO: TMemoField
      FieldKind = fkData
      FieldName = 'VALOREXTENSO'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      BlobType = ftMemo
      Size = 1
      Transliterate = False
    end
  end
  object dspPadrao: TTimer[14]
    Left = 436
    Top = 68
  end
  object cdsPadrao: TMemDataset[15]
    FieldDefs = <>
    Left = 364
    Top = 124
    object cdsPadraoIDRECIBO: TIntegerField
      FieldKind = fkData
      FieldName = 'IDRECIBO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object cdsPadraoDATA: TDateField
      FieldKind = fkData
      FieldName = 'DATA'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoRECEBEDOR: TStringField
      FieldKind = fkData
      FieldName = 'RECEBEDOR'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 250
    end
    object cdsPadraoREFERENTE: TMemoField
      FieldKind = fkData
      FieldName = 'REFERENTE'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      BlobType = ftMemo
      Size = 1
      Transliterate = False
    end
    object cdsPadraoVALOR: TFMTBCDField
      FieldKind = fkData
      FieldName = 'VALOR'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object cdsPadraoVALOREXTENSO: TMemoField
      FieldKind = fkData
      FieldName = 'VALOREXTENSO'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      BlobType = ftMemo
      Size = 1
      Transliterate = False
    end
  end
  object mmPadrao: TMainMenu[16]
    Left = 284
    Top = 84
    object miRelatorios: TMenuItem
      object mImprimir: TMenuItem
        Caption = 'Imprimir recibo'
      end
      object N5: TMenuItem
        Caption = '-'
      end
    end
  end
end
