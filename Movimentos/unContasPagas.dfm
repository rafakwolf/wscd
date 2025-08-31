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
  OnResize = FormResize
  OnShow = FormShow
  object Stb: TStatusBar[0]
    Left = 0
    Height = 18
    Top = 374
    Width = 937
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
  object sqldPadrao: TSQLQuery[5]
    FieldDefs = <>
    Params = <    
      item
        DataType = ftInteger
        Name = 'PFORN'
        ParamType = ptInput
      end>
    Macros = <>
    Left = 288
    Top = 160
    object sqldPadraoCODIGO: TIntegerField
      FieldKind = fkData
      FieldName = 'CODIGO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
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
    object sqldPadraoVENCIMENTO: TDateField
      FieldKind = fkData
      FieldName = 'VENCIMENTO'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoFORNECEDOR: TIntegerField
      FieldKind = fkData
      FieldName = 'FORNECEDOR'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoNOMEFORN: TStringField
      FieldKind = fkData
      FieldName = 'NOMEFORN'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoDESCRICAO: TStringField
      FieldKind = fkData
      FieldName = 'DESCRICAO'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoDOCUMENTO: TStringField
      FieldKind = fkData
      FieldName = 'DOCUMENTO'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoVALOR: TFMTBCDField
      FieldKind = fkData
      FieldName = 'VALOR'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object sqldPadraoJURO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'JURO'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object sqldPadraoPAGAR: TStringField
      FieldKind = fkData
      FieldName = 'PAGAR'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object sqldPadraoPAGA: TStringField
      FieldKind = fkData
      FieldName = 'PAGA'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object sqldPadraoDATAPAGTO: TDateField
      FieldKind = fkData
      FieldName = 'DATAPAGTO'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoORIGEM: TIntegerField
      FieldKind = fkData
      FieldName = 'ORIGEM'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoCOMPRA: TIntegerField
      FieldKind = fkData
      FieldName = 'COMPRA'
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoCAPITALPAGO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'CAPITALPAGO'
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object sqldPadraoJUROPAGO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'JUROPAGO'
      Index = 15
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object sqldPadraoDESCTO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'DESCTO'
      Index = 16
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object sqldPadraoOBS: TMemoField
      FieldKind = fkData
      FieldName = 'OBS'
      Index = 17
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      BlobType = ftMemo
      Size = 1
      Transliterate = False
    end
    object sqldPadraoATRASO: TIntegerField
      FieldKind = fkData
      FieldName = 'ATRASO'
      Index = 18
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoVALORJURO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'VALORJURO'
      Index = 19
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object sqldPadraoTOTAL: TFMTBCDField
      FieldKind = fkData
      FieldName = 'TOTAL'
      Index = 20
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object sqldPadraoTOTALPAGO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'TOTALPAGO'
      Index = 21
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
  end
  object dspPadrao: TTimer[6]
    Left = 400
    Top = 240
  end
  object cdsPadrao: TMemDataset[7]
    FieldDefs = <>
    Left = 456
    Top = 152
    object cdsPadraoCODIGO: TIntegerField
      FieldKind = fkData
      FieldName = 'CODIGO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
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
    object cdsPadraoVENCIMENTO: TDateField
      FieldKind = fkData
      FieldName = 'VENCIMENTO'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoFORNECEDOR: TIntegerField
      FieldKind = fkData
      FieldName = 'FORNECEDOR'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoNOMEFORN: TStringField
      FieldKind = fkData
      FieldName = 'NOMEFORN'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoDESCRICAO: TStringField
      FieldKind = fkData
      FieldName = 'DESCRICAO'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoDOCUMENTO: TStringField
      FieldKind = fkData
      FieldName = 'DOCUMENTO'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoVALOR: TFMTBCDField
      FieldKind = fkData
      FieldName = 'VALOR'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '#,##0.00'
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object cdsPadraoJURO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'JURO'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '#,##0.00'
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object cdsPadraoPAGAR: TStringField
      FieldKind = fkData
      FieldName = 'PAGAR'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object cdsPadraoPAGA: TStringField
      FieldKind = fkData
      FieldName = 'PAGA'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object cdsPadraoDATAPAGTO: TDateField
      FieldKind = fkData
      FieldName = 'DATAPAGTO'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoORIGEM: TIntegerField
      FieldKind = fkData
      FieldName = 'ORIGEM'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoCOMPRA: TIntegerField
      FieldKind = fkData
      FieldName = 'COMPRA'
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoCAPITALPAGO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'CAPITALPAGO'
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '#,##0.00'
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object cdsPadraoJUROPAGO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'JUROPAGO'
      Index = 15
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '#,##0.00'
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object cdsPadraoDESCTO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'DESCTO'
      Index = 16
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '#,##0.00'
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object cdsPadraoOBS: TMemoField
      FieldKind = fkData
      FieldName = 'OBS'
      Index = 17
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      BlobType = ftMemo
      Size = 1
      Transliterate = False
    end
    object cdsPadraoATRASO: TIntegerField
      FieldKind = fkData
      FieldName = 'ATRASO'
      Index = 18
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoVALORJURO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'VALORJURO'
      Index = 19
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object cdsPadraoTOTAL: TFMTBCDField
      FieldKind = fkData
      FieldName = 'TOTAL'
      Index = 20
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object cdsPadraoTOTALPAGO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'TOTALPAGO'
      Index = 21
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
  end
  object dsPadrao: TDataSource[8]
    DataSet = cdsPadrao
    Left = 552
    Top = 160
  end
  object sqldEstorno: TSQLQuery[9]
    FieldDefs = <>
    Params = <>
    Macros = <>
    Left = 120
    Top = 272
    object sqldEstornoCODIGO: TIntegerField
      FieldKind = fkData
      FieldName = 'CODIGO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object sqldEstornoORIGEM: TIntegerField
      FieldKind = fkData
      FieldName = 'ORIGEM'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
  end
  object cdsEstorno: TMemDataset[10]
    FieldDefs = <>
    Left = 288
    Top = 264
    object cdsEstornoCODIGO: TIntegerField
      FieldKind = fkData
      FieldName = 'CODIGO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object cdsEstornoORIGEM: TIntegerField
      FieldKind = fkData
      FieldName = 'ORIGEM'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
  end
  object sqldContaEstorno: TSQLQuery[11]
    FieldDefs = <>
    Params = <    
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    Macros = <>
    Left = 152
    Top = 200
  end
  object mmContasPagas: TMainMenu[12]
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
end
