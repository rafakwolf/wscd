inherited frmConfigGlobal: TfrmConfigGlobal
  Left = 365
  Top = 152
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
    ActivePage = tsVenda
    ParentShowHint = False
    ShowHint = True
    TabIndex = 3
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
        Height = 33
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
        Height = 33
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
        Height = 15
        Top = 64
        Width = 204
        Caption = 'Rodapé do orçamento em bobina'
        ParentColor = False
        ParentShowHint = False
        ShowHint = True
      end
      object dbeTituloOrcam: TDBEdit
        Left = 8
        Height = 33
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
        Height = 33
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
        Height = 33
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
        Height = 15
        Top = 64
        Width = 174
        Caption = 'Rodapé da venda em bobina'
        ParentColor = False
        ParentShowHint = False
        ShowHint = True
      end
      object dbeTituloVenda: TDBEdit
        Left = 8
        Height = 33
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
        Height = 33
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
        Height = 33
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
        Height = 33
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
  end
  inherited actlNavigateActions: TActionList[3]
    Left = 464
    Top = 304
  end
  inherited dsPadrao: TDataSource[4]
    AutoEdit = True
    DataSet = ZQuery1
    Left = 488
    Top = 56
  end
  object ZQuery1: TZQuery[5]
    Connection = DmPrincipal.ZConnection1
    UpdateObject = ZUpdateSQL1
    SQL.Strings = (
      'select * from CONFIGURACAOGLOBAL'
    )
    Params = <>
    Left = 496
    Top = 192
  end
  object ZUpdateSQL1: TZUpdateSQL[6]
    DeleteSQL.Strings = (
      'DELETE FROM CONFIGURACAOGLOBAL'
      'WHERE'
      '  CONFIGURACAOGLOBAL.IDCONFIGGLOBAL = :OLD_IDCONFIGGLOBAL'
    )
    InsertSQL.Strings = (
      'INSERT INTO CONFIGURACAOGLOBAL'
      '  (TAXAJURO, INTERVALO, PRAZOINICIAL, PARCELAS, LIMITECLIENTE, TITULOORCAM, '
      '   COLUNAORCAMBOBINA, MSGRODAPEORCAM, TITULOVENDA, COLUNAVENDABOBINA, MSGRODAPEVENDA, '
      '   LINHAPULARBOBINAVENDA, LINHAPULARBOBINAORCAM, PORTAIMPVENDA, FTP_HOST, '
      '   FTP_USER_NAME, FTP_PASSWORD, FTP_TIMEOUT, FTP_PASSIVE, FTP_DIR, IDADECADASTROCLIENTE)'
      'VALUES'
      '  (:TAXAJURO, :INTERVALO, :PRAZOINICIAL, :PARCELAS, :LIMITECLIENTE, :TITULOORCAM, '
      '   :COLUNAORCAMBOBINA, :MSGRODAPEORCAM, :TITULOVENDA, :COLUNAVENDABOBINA, '
      '   :MSGRODAPEVENDA, :LINHAPULARBOBINAVENDA, :LINHAPULARBOBINAORCAM, :PORTAIMPVENDA, '
      '   :FTP_HOST, :FTP_USER_NAME, :FTP_PASSWORD, :FTP_TIMEOUT, :FTP_PASSIVE, '
      '   :FTP_DIR, :IDADECADASTROCLIENTE)'
    )
    ModifySQL.Strings = (
      'UPDATE CONFIGURACAOGLOBAL SET'
      '  TAXAJURO = :TAXAJURO,'
      '  INTERVALO = :INTERVALO,'
      '  PRAZOINICIAL = :PRAZOINICIAL,'
      '  PARCELAS = :PARCELAS,'
      '  LIMITECLIENTE = :LIMITECLIENTE,'
      '  TITULOORCAM = :TITULOORCAM,'
      '  COLUNAORCAMBOBINA = :COLUNAORCAMBOBINA,'
      '  MSGRODAPEORCAM = :MSGRODAPEORCAM,'
      '  TITULOVENDA = :TITULOVENDA,'
      '  COLUNAVENDABOBINA = :COLUNAVENDABOBINA,'
      '  MSGRODAPEVENDA = :MSGRODAPEVENDA,'
      '  LINHAPULARBOBINAVENDA = :LINHAPULARBOBINAVENDA,'
      '  LINHAPULARBOBINAORCAM = :LINHAPULARBOBINAORCAM,'
      '  PORTAIMPVENDA = :PORTAIMPVENDA,'
      '  FTP_HOST = :FTP_HOST,'
      '  FTP_USER_NAME = :FTP_USER_NAME,'
      '  FTP_PASSWORD = :FTP_PASSWORD,'
      '  FTP_TIMEOUT = :FTP_TIMEOUT,'
      '  FTP_PASSIVE = :FTP_PASSIVE,'
      '  FTP_DIR = :FTP_DIR,'
      '  IDADECADASTROCLIENTE = :IDADECADASTROCLIENTE'
      'WHERE'
      '  CONFIGURACAOGLOBAL.IDCONFIGGLOBAL = :OLD_IDCONFIGGLOBAL'
    )
    UseSequenceFieldForRefreshSQL = False
    Left = 440
    Top = 120
    ParamData = <    
      item
        DataType = ftUnknown
        Name = 'TAXAJURO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'INTERVALO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'PRAZOINICIAL'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'PARCELAS'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'LIMITECLIENTE'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'TITULOORCAM'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'COLUNAORCAMBOBINA'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'MSGRODAPEORCAM'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'TITULOVENDA'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'COLUNAVENDABOBINA'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'MSGRODAPEVENDA'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'LINHAPULARBOBINAVENDA'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'LINHAPULARBOBINAORCAM'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'PORTAIMPVENDA'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'FTP_HOST'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'FTP_USER_NAME'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'FTP_PASSWORD'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'FTP_TIMEOUT'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'FTP_PASSIVE'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'FTP_DIR'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'IDADECADASTROCLIENTE'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'OLD_IDCONFIGGLOBAL'
        ParamType = ptUnknown
      end>
  end
end
