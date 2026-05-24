inherited frmContasPagas: TfrmContasPagas
  Left = 218
  Height = 392
  Top = 124
  Width = 937
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'frmContasPagas'
  ClientHeight = 392
  ClientWidth = 937
  Menu = mmContasPagas
  OnResize = FormResize
  OnShow = FormShow
  object Stb: TStatusBar[0]
    Left = 0
    Height = 18
    Top = 374
    Width = 937
    Color = clBtnFace
    Panels = <    
      item
        Width = 200
      end    
      item
        Width = 200
      end    
      item
        Width = 50
      end>
    ParentColor = False
    ParentShowHint = False
    SimplePanel = False
    ShowHint = True
  end
  object pnBotoes: TPanel[1]
    Left = 0
    Height = 36
    Top = 0
    Width = 937
    Align = alTop
    ClientHeight = 36
    ClientWidth = 937
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    object btnAtualizar: TSpeedButton
      Left = 98
      Height = 32
      Top = 1
      Width = 95
      Caption = 'Atualizar'
      Color = clWindow
      OnClick = miAtualizarClick
      ShowHint = True
      ParentShowHint = False
    end
    object btnEstornar: TSpeedButton
      Left = 3
      Height = 32
      Top = 1
      Width = 95
      Caption = 'Estornar'
      Color = clWindow
      OnClick = btnEstornarClick
      ShowHint = True
      ParentShowHint = False
    end
    object btnFechar: TSpeedButton
      Left = 193
      Height = 32
      Top = 1
      Width = 95
      Caption = 'Fechar'
      Color = clWindow
      OnClick = miFecharClick
      ShowHint = True
      ParentShowHint = False
    end
  end
  object GroupCredor: TGroupBox[2]
    Left = 8
    Height = 48
    Top = 42
    Width = 433
    Caption = ' Fornecedor '
    ClientHeight = 22
    ClientWidth = 423
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    object dbeFornecedor: TDBEdit
      Left = 0
      Height = 21
      Top = 0
      Width = 417
      DataField = 'NOMEFORN'
      DataSource = dsPadrao
      ReadOnly = True
      Color = clBtnFace
      MaxLength = 0
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
  end
  object grpFiltro: TGroupBox[3]
    Left = 448
    Height = 54
    Top = 40
    Width = 473
    Caption = ' Filtro '
    ClientHeight = 28
    ClientWidth = 463
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    object lbFiltrousado: TLabel
      Left = 8
      Height = 19
      Top = 5
      Width = 191
      AutoSize = False
      Caption = 'lbFiltrousado'
      Color = clBtnFace
      ParentColor = False
      ParentShowHint = False
      ShowHint = True
    end
  end
  object Grade: TDBGrid[4]
    Left = 0
    Height = 271
    Hint = 'Dois cliques para marcar '#13#10'ou desmarcar este ítem...'
    Top = 103
    Width = 937
    Align = alBottom
    Color = clWindow
    Columns = <>
    DataSource = dsPadrao
    FixedCols = 0
    Font.CharSet = ANSI_CHARSET
    Font.Name = 'Verdana'
    Options = [dgEditing, dgTitles, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 0
    OnDblClick = GradeDblClick
  end
  object dsPadrao: TDataSource[5]
    DataSet = sqldPadrao
    Left = 552
    Top = 160
  end
  object mmContasPagas: TMainMenu[6]
    Left = 152
    Top = 112
    object miOpcoes: TMenuItem
      Caption = 'Opções'
      object miEstornar: TMenuItem
        Caption = 'Estornar'
        OnClick = btnEstornarClick
      end
      object miAtualizar: TMenuItem
        Caption = 'Atualizar'
        OnClick = miAtualizarClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object miFechar: TMenuItem
        Caption = 'Fechar'
        OnClick = miFecharClick
      end
    end
  end
  object sqldPadrao: TZQuery[7]
    Connection = DmPrincipal.ZConnection1
    SQL.Strings = (
      'select cp.*, f.RAZAOSOCIAL as NOMEFORN'
      'from CONTASPAGAR cp'
      'join FORNECEDORES f on (f.CODFORNECEDOR = cp.FORNECEDOR)'
      'where cp.FORNECEDOR = :PFORN'
    )
    Params = <    
      item
        DataType = ftString
        Name = 'PFORN'
        SQLType = stString
        Value = '0'
      end>
    Left = 368
    Top = 176
    ParamData = <    
      item
        DataType = ftString
        Name = 'PFORN'
        SQLType = stString
        Value = '0'
      end>
    object sqldPadraoCODIGO: TZIntegerField
      FieldKind = fkData
      FieldName = 'CODIGO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object sqldPadraoDATA: TZDateField
      FieldKind = fkData
      FieldName = 'DATA'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoVENCIMENTO: TZDateField
      FieldKind = fkData
      FieldName = 'VENCIMENTO'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoDESCRICAO: TZRawStringField
      FieldKind = fkData
      FieldName = 'DESCRICAO'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object sqldPadraoFORNECEDOR: TZIntegerField
      FieldKind = fkData
      FieldName = 'FORNECEDOR'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoVALOR: TZBCDField
      FieldKind = fkData
      FieldName = 'VALOR'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 13
      Currency = False
      MaxValue = 0
      MinValue = 0
      Size = 2
    end
    object sqldPadraoDOCUMENTO: TZRawStringField
      FieldKind = fkData
      FieldName = 'DOCUMENTO'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 50
    end
    object sqldPadraoPAGAR: TZRawStringField
      FieldKind = fkData
      FieldName = 'PAGAR'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object sqldPadraoJURO: TZBCDField
      FieldKind = fkData
      FieldName = 'JURO'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 13
      Currency = False
      MaxValue = 0
      MinValue = 0
      Size = 2
    end
    object sqldPadraoPAGA: TZRawStringField
      FieldKind = fkData
      FieldName = 'PAGA'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object sqldPadraoDATAPAGTO: TZDateField
      FieldKind = fkData
      FieldName = 'DATAPAGTO'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoORIGEM: TZIntegerField
      FieldKind = fkData
      FieldName = 'ORIGEM'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoCOMPRA: TZIntegerField
      FieldKind = fkData
      FieldName = 'COMPRA'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoCAPITALPAGO: TZBCDField
      FieldKind = fkData
      FieldName = 'CAPITALPAGO'
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 13
      Currency = False
      MaxValue = 0
      MinValue = 0
      Size = 2
    end
    object sqldPadraoJUROPAGO: TZBCDField
      FieldKind = fkData
      FieldName = 'JUROPAGO'
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 13
      Currency = False
      MaxValue = 0
      MinValue = 0
      Size = 2
    end
    object sqldPadraoDESCTO: TZBCDField
      FieldKind = fkData
      FieldName = 'DESCTO'
      Index = 15
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 13
      Currency = False
      MaxValue = 0
      MinValue = 0
      Size = 2
    end
    object sqldPadraoOBS: TZRawStringField
      FieldKind = fkData
      FieldName = 'OBS'
      Index = 16
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 255
    end
    object sqldPadraoIDCONTA: TZIntegerField
      FieldKind = fkData
      FieldName = 'IDCONTA'
      Index = 17
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoATRASO: TZIntegerField
      FieldKind = fkData
      FieldName = 'ATRASO'
      Index = 18
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoVALORJURO: TZBCDField
      FieldKind = fkData
      FieldName = 'VALORJURO'
      Index = 19
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 13
      Currency = False
      MaxValue = 0
      MinValue = 0
      Size = 2
    end
    object sqldPadraoTOTAL: TZBCDField
      FieldKind = fkData
      FieldName = 'TOTAL'
      Index = 20
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 13
      Currency = False
      MaxValue = 0
      MinValue = 0
      Size = 2
    end
    object sqldPadraoTOTALPAGO: TZBCDField
      FieldKind = fkData
      FieldName = 'TOTALPAGO'
      Index = 21
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 13
      Currency = False
      MaxValue = 0
      MinValue = 0
      Size = 2
    end
    object sqldPadraoNOMEFORN: TZRawStringField
      FieldKind = fkData
      FieldName = 'NOMEFORN'
      Index = 22
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
  end
  object sqldEstorno: TZQuery[8]
    Connection = DmPrincipal.ZConnection1
    SQL.Strings = (
      'select CODIGO, ORIGEM from CONTASPAGAR where PAGA = ''N'''
    )
    Params = <>
    Left = 384
    Top = 256
    object sqldEstornoCODIGO: TZIntegerField
      FieldKind = fkData
      FieldName = 'CODIGO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object sqldEstornoORIGEM: TZIntegerField
      FieldKind = fkData
      FieldName = 'ORIGEM'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
  end
end
