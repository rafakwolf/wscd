inherited frmConfigGlobal: TfrmConfigGlobal
  Left = 232
  Top = 148
  ClientHeight = 340
  ClientWidth = 470
  Caption = 'frmConfigGlobal'
  OldCreateOrder = True
  ExplicitWidth = 476
  ExplicitHeight = 369
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbStatus: TStatusBar
    Top = 321
    Width = 470
    ExplicitTop = 321
    ExplicitWidth = 470
  end
  inherited pnBotoesPadrao: TContainerPanel
    Width = 470
    ExplicitWidth = 470
  end
  object pgcConfigGlobal: TPageControl [2]
    Left = 8
    Top = 39
    Width = 385
    Height = 273
    Hint = ''
    ShowHint = True
    ActivePage = tsCrediario
    TabOrder = 2
    object tsCrediario: TTabSheet
      Hint = ''
      ShowHint = True
      Caption = 'Credi'#225'rio'
      object dbeJuro: TDBEdit
        Left = 8
        Top = 32
        Width = 83
        Height = 21
        Hint = ''
        ShowHint = True
        DataField = 'TAXAJURO'
        DataSource = dsPadrao
        TabOrder = 0
        OnKeyPress = dbeJuroKeyPress
      end
      object dbeIntervalo: TDBEdit
        Left = 272
        Top = 32
        Width = 97
        Height = 21
        Hint = ''
        ShowHint = True
        DataField = 'INTERVALO'
        DataSource = dsPadrao
        TabOrder = 1
      end
      object dbePrazoInicial: TDBEdit
        Left = 184
        Top = 32
        Width = 83
        Height = 21
        Hint = ''
        ShowHint = True
        DataField = 'PRAZOINICIAL'
        DataSource = dsPadrao
        TabOrder = 2
      end
      object dbeParcelas: TDBEdit
        Left = 96
        Top = 32
        Width = 83
        Height = 21
        Hint = ''
        ShowHint = True
        DataField = 'PARCELAS'
        DataSource = dsPadrao
        TabOrder = 3
      end
    end
    object tsCliente: TTabSheet
      Hint = ''
      ShowHint = True
      ImageIndex = 1
      Caption = 'Cliente'
      object dbeLimiteCliente: TDBEdit
        Left = 8
        Top = 32
        Width = 105
        Height = 21
        Hint = ''
        ShowHint = True
        DataField = 'LIMITECLIENTE'
        DataSource = dsPadrao
        TabOrder = 0
      end
      object dbeIdadeCliente: TDBEdit
        Left = 120
        Top = 32
        Width = 89
        Height = 21
        Hint = ''
        ShowHint = True
        DataField = 'IDADECADASTROCLIENTE'
        DataSource = dsPadrao
        TabOrder = 1
      end
    end
    object tsOrcamento: TTabSheet
      Hint = ''
      ShowHint = True
      ImageIndex = 2
      Caption = 'Or'#231'amento'
      object lbMsgOrcamRodape: TLabel
        Left = 8
        Top = 64
        Width = 190
        Height = 13
        Hint = ''
        ShowHint = True
        Caption = 'Rodap'#233' do or'#231'amento em bobina'
        TabOrder = 4
      end
      object dbeTituloOrcam: TDBEdit
        Left = 8
        Top = 32
        Width = 249
        Height = 21
        Hint = ''
        ShowHint = True
        DataField = 'TITULOORCAM'
        DataSource = dsPadrao
        TabOrder = 0
      end
      object dbeColunaBobina: TDBEdit
        Left = 263
        Top = 32
        Width = 106
        Height = 21
        Hint = ''
        ShowHint = True
        DataField = 'COLUNAORCAMBOBINA'
        DataSource = dsPadrao
        TabOrder = 1
      end
      object dbeLinhaPularOrcam: TDBEdit
        Left = 8
        Top = 176
        Width = 105
        Height = 21
        Hint = ''
        ShowHint = True
        DataField = 'LINHAPULARBOBINAORCAM'
        DataSource = dsPadrao
        TabOrder = 3
      end
      object dbmmMsgRodape: TDBMemo
        Left = 8
        Top = 80
        Width = 361
        Height = 73
        Hint = ''
        ShowHint = True
        DataField = 'MSGRODAPEORCAM'
        DataSource = dsPadrao
        TabOrder = 2
      end
    end
    object tsVenda: TTabSheet
      Hint = ''
      ShowHint = True
      ImageIndex = 3
      Caption = 'Venda'
      object lbMsgRodapeVenda: TLabel
        Left = 8
        Top = 64
        Width = 164
        Height = 13
        Hint = ''
        ShowHint = True
        Caption = 'Rodap'#233' da venda em bobina'
        TabOrder = 5
      end
      object dbeTituloVenda: TDBEdit
        Left = 8
        Top = 32
        Width = 249
        Height = 21
        Hint = ''
        ShowHint = True
        DataField = 'TITULOVENDA'
        DataSource = dsPadrao
        TabOrder = 0
      end
      object dbeColunaBobinaVenda: TDBEdit
        Left = 263
        Top = 32
        Width = 106
        Height = 21
        Hint = ''
        ShowHint = True
        DataField = 'COLUNAVENDABOBINA'
        DataSource = dsPadrao
        TabOrder = 1
      end
      object dbeLinhaPularVenda: TDBEdit
        Left = 8
        Top = 176
        Width = 105
        Height = 21
        Hint = ''
        ShowHint = True
        DataField = 'LINHAPULARBOBINAVENDA'
        DataSource = dsPadrao
        TabOrder = 3
      end
      object dbePortaImpVenda: TDBEdit
        Left = 119
        Top = 176
        Width = 104
        Height = 21
        Hint = ''
        ShowHint = True
        DataField = 'PORTAIMPVENDA'
        DataSource = dsPadrao
        TabOrder = 4
      end
      object dbmmMsgRodapeVenda: TDBMemo
        Left = 8
        Top = 80
        Width = 361
        Height = 73
        Hint = ''
        ShowHint = True
        DataField = 'MSGRODAPEVENDA'
        DataSource = dsPadrao
        TabOrder = 2
      end
    end
    object tsFTP: TTabSheet
      Hint = ''
      ShowHint = True
      ImageIndex = 4
      Caption = 'FTP (Atualiza'#231#227'o)'
      object dbeHost: TDBEdit
        Left = 16
        Top = 24
        Width = 337
        Height = 21
        Hint = ''
        ShowHint = True
        DataField = 'FTP_HOST'
        DataSource = dsPadrao
        TabOrder = 0
      end
      object dbeUserName: TDBEdit
        Left = 16
        Top = 64
        Width = 169
        Height = 21
        Hint = ''
        ShowHint = True
        DataField = 'FTP_USER_NAME'
        DataSource = dsPadrao
        TabOrder = 1
      end
      object dbePassWord: TDBEdit
        Left = 192
        Top = 64
        Width = 161
        Height = 21
        Hint = ''
        ShowHint = True
        DataField = 'FTP_PASSWORD'
        DataSource = dsPadrao
        PasswordChar = '*'
        TabOrder = 2
      end
      object dbeDiretorio: TDBEdit
        Left = 16
        Top = 104
        Width = 265
        Height = 21
        Hint = ''
        ShowHint = True
        DataField = 'FTP_DIR'
        DataSource = dsPadrao
        TabOrder = 3
      end
      object dbeTimeOut: TDBEdit
        Left = 288
        Top = 104
        Width = 65
        Height = 21
        Hint = ''
        ShowHint = True
        DataField = 'FTP_TIMEOUT'
        DataSource = dsPadrao
        TabOrder = 4
      end
      object dbckbPassive: TDBCheckBox
        Left = 16
        Top = 136
        Width = 65
        Height = 17
        Hint = ''
        ShowHint = True
        DataField = 'FTP_PASSIVE'
        DataSource = dsPadrao
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        Caption = 'Passive'
        TabOrder = 5
      end
    end
  end
  inherited actlNavigateActions: TActionList
    Left = 72
    Top = 252
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 399
    Top = 228
  end
  object sqldPadrao: TSQLDataSet
    CommandText = 'select * from CONFIGURACAOGLOBAL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 168
    Top = 244
    object sqldPadraoTAXAJURO: TFMTBCDField
      FieldName = 'TAXAJURO'
      Precision = 15
    end
    object sqldPadraoINTERVALO: TIntegerField
      FieldName = 'INTERVALO'
    end
    object sqldPadraoPRAZOINICIAL: TIntegerField
      FieldName = 'PRAZOINICIAL'
    end
    object sqldPadraoPARCELAS: TIntegerField
      FieldName = 'PARCELAS'
    end
    object sqldPadraoLIMITECLIENTE: TFMTBCDField
      FieldName = 'LIMITECLIENTE'
      Precision = 15
    end
    object sqldPadraoTITULOORCAM: TStringField
      FieldName = 'TITULOORCAM'
      Size = 80
    end
    object sqldPadraoCOLUNAORCAMBOBINA: TIntegerField
      FieldName = 'COLUNAORCAMBOBINA'
    end
    object sqldPadraoMSGRODAPEORCAM: TStringField
      FieldName = 'MSGRODAPEORCAM'
      Size = 250
    end
    object sqldPadraoTITULOVENDA: TStringField
      FieldName = 'TITULOVENDA'
      Size = 80
    end
    object sqldPadraoCOLUNAVENDABOBINA: TIntegerField
      FieldName = 'COLUNAVENDABOBINA'
    end
    object sqldPadraoMSGRODAPEVENDA: TStringField
      FieldName = 'MSGRODAPEVENDA'
      Size = 250
    end
    object sqldPadraoLINHAPULARBOBINAVENDA: TIntegerField
      FieldName = 'LINHAPULARBOBINAVENDA'
    end
    object sqldPadraoLINHAPULARBOBINAORCAM: TIntegerField
      FieldName = 'LINHAPULARBOBINAORCAM'
    end
    object sqldPadraoPORTAIMPVENDA: TStringField
      FieldName = 'PORTAIMPVENDA'
    end
    object sqldPadraoFTP_HOST: TStringField
      FieldName = 'FTP_HOST'
      Size = 80
    end
    object sqldPadraoFTP_USER_NAME: TStringField
      FieldName = 'FTP_USER_NAME'
      Size = 80
    end
    object sqldPadraoFTP_PASSWORD: TStringField
      FieldName = 'FTP_PASSWORD'
      Size = 80
    end
    object sqldPadraoFTP_TIMEOUT: TIntegerField
      FieldName = 'FTP_TIMEOUT'
    end
    object sqldPadraoFTP_PASSIVE: TStringField
      FieldName = 'FTP_PASSIVE'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoFTP_DIR: TStringField
      FieldName = 'FTP_DIR'
      Size = 80
    end
    object sqldPadraoIDADECADASTROCLIENTE: TIntegerField
      FieldName = 'IDADECADASTROCLIENTE'
    end
    object sqldPadraoIDCONFIGGLOBAL: TIntegerField
      FieldName = 'IDCONFIGGLOBAL'
      Required = True
    end
  end
  object dspPadrao: TDataSetProvider
    DataSet = sqldPadrao
    Options = [poAllowCommandText]
    Left = 248
    Top = 244
  end
  object cdsPadrao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    AfterApplyUpdates = cdsPadraoAfterApplyUpdates
    Left = 312
    Top = 228
    object cdsPadraoTAXAJURO: TFMTBCDField
      FieldName = 'TAXAJURO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 15
    end
    object cdsPadraoINTERVALO: TIntegerField
      FieldName = 'INTERVALO'
    end
    object cdsPadraoPRAZOINICIAL: TIntegerField
      FieldName = 'PRAZOINICIAL'
    end
    object cdsPadraoPARCELAS: TIntegerField
      FieldName = 'PARCELAS'
    end
    object cdsPadraoLIMITECLIENTE: TFMTBCDField
      FieldName = 'LIMITECLIENTE'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 15
    end
    object cdsPadraoTITULOORCAM: TStringField
      FieldName = 'TITULOORCAM'
      Size = 80
    end
    object cdsPadraoCOLUNAORCAMBOBINA: TIntegerField
      FieldName = 'COLUNAORCAMBOBINA'
    end
    object cdsPadraoMSGRODAPEORCAM: TStringField
      FieldName = 'MSGRODAPEORCAM'
      Size = 250
    end
    object cdsPadraoTITULOVENDA: TStringField
      FieldName = 'TITULOVENDA'
      Size = 80
    end
    object cdsPadraoCOLUNAVENDABOBINA: TIntegerField
      FieldName = 'COLUNAVENDABOBINA'
    end
    object cdsPadraoMSGRODAPEVENDA: TStringField
      FieldName = 'MSGRODAPEVENDA'
      Size = 250
    end
    object cdsPadraoLINHAPULARBOBINAVENDA: TIntegerField
      FieldName = 'LINHAPULARBOBINAVENDA'
    end
    object cdsPadraoLINHAPULARBOBINAORCAM: TIntegerField
      FieldName = 'LINHAPULARBOBINAORCAM'
    end
    object cdsPadraoPORTAIMPVENDA: TStringField
      FieldName = 'PORTAIMPVENDA'
    end
    object cdsPadraoFTP_HOST: TStringField
      FieldName = 'FTP_HOST'
      Size = 80
    end
    object cdsPadraoFTP_USER_NAME: TStringField
      FieldName = 'FTP_USER_NAME'
      Size = 80
    end
    object cdsPadraoFTP_PASSWORD: TStringField
      FieldName = 'FTP_PASSWORD'
      Size = 80
    end
    object cdsPadraoFTP_TIMEOUT: TIntegerField
      FieldName = 'FTP_TIMEOUT'
    end
    object cdsPadraoFTP_PASSIVE: TStringField
      FieldName = 'FTP_PASSIVE'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoFTP_DIR: TStringField
      FieldName = 'FTP_DIR'
      Size = 80
    end
    object cdsPadraoIDADECADASTROCLIENTE: TIntegerField
      FieldName = 'IDADECADASTROCLIENTE'
    end
    object cdsPadraoIDCONFIGGLOBAL: TIntegerField
      FieldName = 'IDCONFIGGLOBAL'
      Required = True
    end
  end
end
