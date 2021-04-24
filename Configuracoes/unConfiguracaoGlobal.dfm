inherited frmConfigGlobal: TfrmConfigGlobal
  Left = 232
  Top = 148
  Width = 621
  Caption = 'frmConfigGlobal'
  ClientWidth = 621
  inherited sbStatus: TStatusBar
    Width = 621
  end
  inherited pnBotoesPadrao: TPanel
    Width = 621
    ClientWidth = 621
  end
  object pgcConfigGlobal: TPageControl[2]
    Left = 8
    Height = 273
    Top = 39
    Width = 385
    ActivePage = tsCrediario
    ParentShowHint = False
    ShowHint = True
    TabIndex = 0
    TabOrder = 2
    object tsCrediario: TTabSheet
      Caption = 'Crediário'
      ClientHeight = 242
      ClientWidth = 375
      ParentShowHint = False
      ShowHint = True
      object dbeJuro: TDBEdit
        Left = 8
        Height = 33
        Top = 32
        Width = 83
        DataField = 'TAXAJURO'
        DataSource = dsPadrao
        CharCase = ecNormal
        MaxLength = 0
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnKeyPress = dbeJuroKeyPress
      end
      object dbeIntervalo: TDBEdit
        Left = 272
        Height = 33
        Top = 32
        Width = 97
        DataField = 'INTERVALO'
        DataSource = dsPadrao
        CharCase = ecNormal
        MaxLength = 0
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object dbePrazoInicial: TDBEdit
        Left = 184
        Height = 33
        Top = 32
        Width = 83
        DataField = 'PRAZOINICIAL'
        DataSource = dsPadrao
        CharCase = ecNormal
        MaxLength = 0
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
      end
      object dbeParcelas: TDBEdit
        Left = 96
        Height = 33
        Top = 32
        Width = 83
        DataField = 'PARCELAS'
        DataSource = dsPadrao
        CharCase = ecNormal
        MaxLength = 0
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
      end
    end
    object tsCliente: TTabSheet
      Caption = 'Cliente'
      ClientHeight = 242
      ClientWidth = 375
      ImageIndex = 1
      ParentShowHint = False
      ShowHint = True
      object dbeLimiteCliente: TDBEdit
        Left = 8
        Height = 21
        Top = 32
        Width = 105
        DataField = 'LIMITECLIENTE'
        DataSource = dsPadrao
        CharCase = ecNormal
        MaxLength = 0
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object dbeIdadeCliente: TDBEdit
        Left = 120
        Height = 21
        Top = 32
        Width = 89
        DataField = 'IDADECADASTROCLIENTE'
        DataSource = dsPadrao
        CharCase = ecNormal
        MaxLength = 0
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
    end
    object tsOrcamento: TTabSheet
      Caption = 'Orçamento'
      ClientHeight = 242
      ClientWidth = 375
      ImageIndex = 2
      ParentShowHint = False
      ShowHint = True
      object lbMsgOrcamRodape: TLabel
        Left = 8
        Height = 13
        Top = 64
        Width = 190
        Caption = 'Rodapé do orçamento em bobina'
        ParentColor = False
        ParentShowHint = False
        ShowHint = True
      end
      object dbeTituloOrcam: TDBEdit
        Left = 8
        Height = 21
        Top = 32
        Width = 249
        DataField = 'TITULOORCAM'
        DataSource = dsPadrao
        CharCase = ecNormal
        MaxLength = 0
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object dbeColunaBobina: TDBEdit
        Left = 263
        Height = 21
        Top = 32
        Width = 106
        DataField = 'COLUNAORCAMBOBINA'
        DataSource = dsPadrao
        CharCase = ecNormal
        MaxLength = 0
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object dbeLinhaPularOrcam: TDBEdit
        Left = 8
        Height = 21
        Top = 176
        Width = 105
        DataField = 'LINHAPULARBOBINAORCAM'
        DataSource = dsPadrao
        CharCase = ecNormal
        MaxLength = 0
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
      end
      object dbmmMsgRodape: TDBMemo
        Left = 8
        Height = 73
        Top = 80
        Width = 361
        DataField = 'MSGRODAPEORCAM'
        DataSource = dsPadrao
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
      end
    end
    object tsVenda: TTabSheet
      Caption = 'Venda'
      ClientHeight = 242
      ClientWidth = 375
      ImageIndex = 3
      ParentShowHint = False
      ShowHint = True
      object lbMsgRodapeVenda: TLabel
        Left = 8
        Height = 13
        Top = 64
        Width = 164
        Caption = 'Rodapé da venda em bobina'
        ParentColor = False
        ParentShowHint = False
        ShowHint = True
      end
      object dbeTituloVenda: TDBEdit
        Left = 8
        Height = 21
        Top = 32
        Width = 249
        DataField = 'TITULOVENDA'
        DataSource = dsPadrao
        CharCase = ecNormal
        MaxLength = 0
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object dbeColunaBobinaVenda: TDBEdit
        Left = 263
        Height = 21
        Top = 32
        Width = 106
        DataField = 'COLUNAVENDABOBINA'
        DataSource = dsPadrao
        CharCase = ecNormal
        MaxLength = 0
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object dbeLinhaPularVenda: TDBEdit
        Left = 8
        Height = 21
        Top = 176
        Width = 105
        DataField = 'LINHAPULARBOBINAVENDA'
        DataSource = dsPadrao
        CharCase = ecNormal
        MaxLength = 0
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
      end
      object dbePortaImpVenda: TDBEdit
        Left = 119
        Height = 21
        Top = 176
        Width = 104
        DataField = 'PORTAIMPVENDA'
        DataSource = dsPadrao
        CharCase = ecNormal
        MaxLength = 0
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
      end
      object dbmmMsgRodapeVenda: TDBMemo
        Left = 8
        Height = 73
        Top = 80
        Width = 361
        DataField = 'MSGRODAPEVENDA'
        DataSource = dsPadrao
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
      end
    end
    object tsFTP: TTabSheet
      Caption = 'FTP (Atualização)'
      ClientHeight = 242
      ClientWidth = 375
      ImageIndex = 4
      ParentShowHint = False
      ShowHint = True
      object dbeHost: TDBEdit
        Left = 16
        Height = 21
        Top = 24
        Width = 337
        DataField = 'FTP_HOST'
        DataSource = dsPadrao
        CharCase = ecNormal
        MaxLength = 0
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object dbeUserName: TDBEdit
        Left = 16
        Height = 21
        Top = 64
        Width = 169
        DataField = 'FTP_USER_NAME'
        DataSource = dsPadrao
        CharCase = ecNormal
        MaxLength = 0
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object dbePassWord: TDBEdit
        Left = 192
        Height = 21
        Top = 64
        Width = 161
        DataField = 'FTP_PASSWORD'
        DataSource = dsPadrao
        CharCase = ecNormal
        MaxLength = 0
        ParentShowHint = False
        PasswordChar = '*'
        ShowHint = True
        TabOrder = 2
      end
      object dbeDiretorio: TDBEdit
        Left = 16
        Height = 21
        Top = 104
        Width = 265
        DataField = 'FTP_DIR'
        DataSource = dsPadrao
        CharCase = ecNormal
        MaxLength = 0
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
      end
      object dbeTimeOut: TDBEdit
        Left = 288
        Height = 21
        Top = 104
        Width = 65
        DataField = 'FTP_TIMEOUT'
        DataSource = dsPadrao
        CharCase = ecNormal
        MaxLength = 0
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
      end
      object dbckbPassive: TDBCheckBox
        Left = 16
        Height = 17
        Top = 136
        Width = 65
        Caption = 'Passive'
        DataField = 'FTP_PASSIVE'
        DataSource = dsPadrao
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
    end
  end
  inherited actlNavigateActions: TActionList[3]
    Left = 72
    Top = 252
  end
  inherited dsPadrao: TDataSource[4]
    DataSet = cdsPadrao
    Left = 399
    Top = 228
  end
  object sqldPadrao: TSQLQuery[5]
    FieldDefs = <>
    Params = <>
    Left = 168
    Top = 244
    object sqldPadraoTAXAJURO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'TAXAJURO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object sqldPadraoINTERVALO: TIntegerField
      FieldKind = fkData
      FieldName = 'INTERVALO'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoPRAZOINICIAL: TIntegerField
      FieldKind = fkData
      FieldName = 'PRAZOINICIAL'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoPARCELAS: TIntegerField
      FieldKind = fkData
      FieldName = 'PARCELAS'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoLIMITECLIENTE: TFMTBCDField
      FieldKind = fkData
      FieldName = 'LIMITECLIENTE'
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
    object sqldPadraoTITULOORCAM: TStringField
      FieldKind = fkData
      FieldName = 'TITULOORCAM'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoCOLUNAORCAMBOBINA: TIntegerField
      FieldKind = fkData
      FieldName = 'COLUNAORCAMBOBINA'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoMSGRODAPEORCAM: TStringField
      FieldKind = fkData
      FieldName = 'MSGRODAPEORCAM'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 250
    end
    object sqldPadraoTITULOVENDA: TStringField
      FieldKind = fkData
      FieldName = 'TITULOVENDA'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoCOLUNAVENDABOBINA: TIntegerField
      FieldKind = fkData
      FieldName = 'COLUNAVENDABOBINA'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoMSGRODAPEVENDA: TStringField
      FieldKind = fkData
      FieldName = 'MSGRODAPEVENDA'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 250
    end
    object sqldPadraoLINHAPULARBOBINAVENDA: TIntegerField
      FieldKind = fkData
      FieldName = 'LINHAPULARBOBINAVENDA'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoLINHAPULARBOBINAORCAM: TIntegerField
      FieldKind = fkData
      FieldName = 'LINHAPULARBOBINAORCAM'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoPORTAIMPVENDA: TStringField
      FieldKind = fkData
      FieldName = 'PORTAIMPVENDA'
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoFTP_HOST: TStringField
      FieldKind = fkData
      FieldName = 'FTP_HOST'
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoFTP_USER_NAME: TStringField
      FieldKind = fkData
      FieldName = 'FTP_USER_NAME'
      Index = 15
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoFTP_PASSWORD: TStringField
      FieldKind = fkData
      FieldName = 'FTP_PASSWORD'
      Index = 16
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoFTP_TIMEOUT: TIntegerField
      FieldKind = fkData
      FieldName = 'FTP_TIMEOUT'
      Index = 17
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoFTP_PASSIVE: TStringField
      FieldKind = fkData
      FieldName = 'FTP_PASSIVE'
      Index = 18
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object sqldPadraoFTP_DIR: TStringField
      FieldKind = fkData
      FieldName = 'FTP_DIR'
      Index = 19
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoIDADECADASTROCLIENTE: TIntegerField
      FieldKind = fkData
      FieldName = 'IDADECADASTROCLIENTE'
      Index = 20
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoIDCONFIGGLOBAL: TIntegerField
      FieldKind = fkData
      FieldName = 'IDCONFIGGLOBAL'
      Index = 21
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
  end
  object dspPadrao: TTimer[6]
    Left = 248
    Top = 244
  end
  object cdsPadrao: TMemDataset[7]
    FieldDefs = <>
    Left = 312
    Top = 228
    object cdsPadraoTAXAJURO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'TAXAJURO'
      Index = 0
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
    object cdsPadraoINTERVALO: TIntegerField
      FieldKind = fkData
      FieldName = 'INTERVALO'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoPRAZOINICIAL: TIntegerField
      FieldKind = fkData
      FieldName = 'PRAZOINICIAL'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoPARCELAS: TIntegerField
      FieldKind = fkData
      FieldName = 'PARCELAS'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoLIMITECLIENTE: TFMTBCDField
      FieldKind = fkData
      FieldName = 'LIMITECLIENTE'
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
    object cdsPadraoTITULOORCAM: TStringField
      FieldKind = fkData
      FieldName = 'TITULOORCAM'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoCOLUNAORCAMBOBINA: TIntegerField
      FieldKind = fkData
      FieldName = 'COLUNAORCAMBOBINA'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoMSGRODAPEORCAM: TStringField
      FieldKind = fkData
      FieldName = 'MSGRODAPEORCAM'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 250
    end
    object cdsPadraoTITULOVENDA: TStringField
      FieldKind = fkData
      FieldName = 'TITULOVENDA'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoCOLUNAVENDABOBINA: TIntegerField
      FieldKind = fkData
      FieldName = 'COLUNAVENDABOBINA'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoMSGRODAPEVENDA: TStringField
      FieldKind = fkData
      FieldName = 'MSGRODAPEVENDA'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 250
    end
    object cdsPadraoLINHAPULARBOBINAVENDA: TIntegerField
      FieldKind = fkData
      FieldName = 'LINHAPULARBOBINAVENDA'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoLINHAPULARBOBINAORCAM: TIntegerField
      FieldKind = fkData
      FieldName = 'LINHAPULARBOBINAORCAM'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoPORTAIMPVENDA: TStringField
      FieldKind = fkData
      FieldName = 'PORTAIMPVENDA'
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoFTP_HOST: TStringField
      FieldKind = fkData
      FieldName = 'FTP_HOST'
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoFTP_USER_NAME: TStringField
      FieldKind = fkData
      FieldName = 'FTP_USER_NAME'
      Index = 15
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoFTP_PASSWORD: TStringField
      FieldKind = fkData
      FieldName = 'FTP_PASSWORD'
      Index = 16
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoFTP_TIMEOUT: TIntegerField
      FieldKind = fkData
      FieldName = 'FTP_TIMEOUT'
      Index = 17
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoFTP_PASSIVE: TStringField
      FieldKind = fkData
      FieldName = 'FTP_PASSIVE'
      Index = 18
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object cdsPadraoFTP_DIR: TStringField
      FieldKind = fkData
      FieldName = 'FTP_DIR'
      Index = 19
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoIDADECADASTROCLIENTE: TIntegerField
      FieldKind = fkData
      FieldName = 'IDADECADASTROCLIENTE'
      Index = 20
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoIDCONFIGGLOBAL: TIntegerField
      FieldKind = fkData
      FieldName = 'IDCONFIGGLOBAL'
      Index = 21
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
  end
end
