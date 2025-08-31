inherited frmContasRecebidas: TfrmContasRecebidas
  Left = 217
  Height = 392
  Top = 135
  Width = 930
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'frmContasRecebidas'
  ClientHeight = 392
  ClientWidth = 930
  Menu = mmContasRecebidas
  OnResize = FormResize
  OnShow = FormShow
  object Stb: TStatusBar[0]
    Left = 0
    Height = 18
    Top = 374
    Width = 930
    Color = clBtnFace
    Panels = <>
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object pnBotoes: TPanel[1]
    Left = 0
    Height = 36
    Top = 0
    Width = 930
    Align = alTop
    ClientHeight = 36
    ClientWidth = 930
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
      OnClick = btnAtualizarClick
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
      OnClick = btnFecharClick
      ShowHint = True
      ParentShowHint = False
    end
  end
  object grpCliente: TGroupBox[2]
    Left = 8
    Height = 48
    Top = 42
    Width = 433
    Caption = ' Cliente '
    ClientHeight = 22
    ClientWidth = 423
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    object dbeCliente: TDBEdit
      Left = 8
      Height = 21
      Top = 0
      Width = 417
      DataField = 'NOMECLIENTE'
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
    Height = 50
    Top = 40
    Width = 473
    Caption = ' Filtro '
    ClientHeight = 24
    ClientWidth = 463
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    object lbFiltroUsado: TLabel
      Left = 8
      Height = 13
      Top = 2
      Width = 55
      AutoSize = False
      Caption = 'lbFiltroUsado'
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
    Width = 930
    Align = alBottom
    Color = clWindow
    Columns = <>
    DataSource = dsPadrao
    FixedCols = 0
    Font.CharSet = ANSI_CHARSET
    Font.Name = 'Verdana'
    Options = [dgEditing, dgTitles, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ShowHint = True
    TabOrder = 0
    OnDblClick = GradeDblClick
  end
  object dsPadrao: TDataSource[5]
    DataSet = sqldPadrao
    Left = 512
    Top = 136
  end
  object mmContasRecebidas: TMainMenu[6]
    Left = 112
    Top = 144
    object miOpcoes: TMenuItem
      Caption = 'Opções'
      object miEstornar: TMenuItem
        Caption = 'Estornar'
        OnClick = btnEstornarClick
      end
      object miAtualizar: TMenuItem
        Caption = 'Atualizar'
        OnClick = btnAtualizarClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object miFechar: TMenuItem
        Caption = 'Fechar'
        OnClick = btnFecharClick
      end
    end
  end
  object sqldPadrao: TZQuery[7]
    Connection = DmPrincipal.ZConnection1
    SQL.Strings = (
      'select * from CONTASRECEBER'
      'where CLIENTE = :PCLIENTE'
    )
    Params = <    
      item
        Name = 'PCLIENTE'
      end>
    Left = 400
    Top = 136
    ParamData = <    
      item
        Name = 'PCLIENTE'
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
    object sqldPadraoCLIENTE: TZIntegerField
      FieldKind = fkData
      FieldName = 'CLIENTE'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoDESCRICAO: TZRawStringField
      FieldKind = fkData
      FieldName = 'DESCRICAO'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object sqldPadraoDOCUMENTO: TZRawStringField
      FieldKind = fkData
      FieldName = 'DOCUMENTO'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 50
    end
    object sqldPadraoVALOR: TZBCDField
      FieldKind = fkData
      FieldName = 'VALOR'
      Index = 6
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
    object sqldPadraoJURO: TZBCDField
      FieldKind = fkData
      FieldName = 'JURO'
      Index = 7
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
    object sqldPadraoRECEBER: TZRawStringField
      FieldKind = fkData
      FieldName = 'RECEBER'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object sqldPadraoRECDA: TZRawStringField
      FieldKind = fkData
      FieldName = 'RECDA'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object sqldPadraoDATARECTO: TZDateField
      FieldKind = fkData
      FieldName = 'DATARECTO'
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
    object sqldPadraoVENDA: TZIntegerField
      FieldKind = fkData
      FieldName = 'VENDA'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoCAPITALRECDO: TZBCDField
      FieldKind = fkData
      FieldName = 'CAPITALRECDO'
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
    object sqldPadraoJURORECDO: TZBCDField
      FieldKind = fkData
      FieldName = 'JURORECDO'
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
    object sqldPadraoTOTALRECDO: TZBCDField
      FieldKind = fkData
      FieldName = 'TOTALRECDO'
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
  end
  object sqldConta: TZQuery[8]
    Connection = DmPrincipal.ZConnection1
    SQL.Strings = (
      'select * from CAIXAS'
    )
    Params = <>
    Left = 312
    Top = 224
  end
  object sqldDeletaConta: TZQuery[9]
    Connection = DmPrincipal.ZConnection1
    SQL.Strings = (
      'delete from CONTASRECEBER where CODIGO = :CODIGO'
    )
    Params = <    
      item
        Name = 'CODIGO'
      end>
    Left = 424
    Top = 232
    ParamData = <    
      item
        Name = 'CODIGO'
      end>
  end
end
