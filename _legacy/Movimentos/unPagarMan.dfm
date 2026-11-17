inherited frmPagarMan: TfrmPagarMan
  Left = 219
  Height = 348
  Top = 139
  Width = 500
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Pagamento'
  ClientHeight = 348
  ClientWidth = 500
  OnShow = FormShow
  object edtTotal: TLabeledEdit[0]
    Left = 8
    Height = 21
    Top = 288
    Width = 129
    EditLabel.Height = 16
    EditLabel.Width = 129
    EditLabel.Caption = 'Valor a pagar'
    TabOrder = 2
  end
  object btnOk: TBitBtn[1]
    Left = 296
    Height = 33
    Hint = 'Efetuar recebimento'
    Top = 276
    Width = 81
    Caption = '&Ok'
    NumGlyphs = 2
    TabOrder = 3
    OnClick = btnOkClick
  end
  object btnCancel: TBitBtn[2]
    Left = 392
    Height = 33
    Hint = 'Cancelar recebimento'
    Top = 276
    Width = 81
    Caption = '&Cancelar'
    NumGlyphs = 2
    TabOrder = 4
    OnClick = btnCancelClick
  end
  object rgTipoPagamento: TRadioGroup[3]
    Left = 8
    Height = 49
    Top = 208
    Width = 465
    AutoFill = True
    Caption = 'Pagamento'
    ChildSizing.LeftRightSpacing = 6
    ChildSizing.EnlargeHorizontal = crsHomogenousChildResize
    ChildSizing.EnlargeVertical = crsHomogenousChildResize
    ChildSizing.ShrinkHorizontal = crsScaleChilds
    ChildSizing.ShrinkVertical = crsScaleChilds
    ChildSizing.Layout = cclLeftToRightThenTopToBottom
    ChildSizing.ControlsPerLine = 2
    ClientHeight = 23
    ClientWidth = 455
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Dinheiro'
      'Cartão'
    )
    TabOrder = 1
    OnClick = rgTipoPagamentoClick
  end
  object dbgrdContasCP: TDBGrid[4]
    Left = 8
    Height = 185
    Top = 8
    Width = 465
    Color = clBtnFace
    Columns = <    
      item
        Title.Caption = 'Valor'
        Width = 100
        FieldName = 'VALOR'
      end    
      item
        Title.Caption = 'Juro (%)'
        Width = 60
        FieldName = 'JURO'
      end    
      item
        Title.Caption = 'Atraso (dias)'
        Width = 80
        FieldName = 'ATRASO'
      end    
      item
        Title.Caption = 'Valor juros'
        Width = 80
        FieldName = 'VALORJURO'
      end    
      item
        Title.Caption = 'Valor atual'
        Width = 100
        FieldName = 'TOTAL'
      end>
    DataSource = dsContasPagar
    Font.CharSet = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
  end
  object dsContasPagar: TDataSource[5]
    AutoEdit = False
    DataSet = sqldContasPagar
    Left = 167
    Top = 96
  end
  object sqldContasPagar: TZQuery[6]
    Connection = DmPrincipal.ZConnection1
    SQL.Strings = (
      'SELECT CP.CODIGO,'
      '       CP.DATA,'
      '       CP.VENCIMENTO,'
      '       CP.FORNECEDOR,'
      '       FO.FANTASIA AS NOMEFORN,'
      '       CP.IDCONTA,'
      '       CC.NOME AS CONTA,'
      '       CP.DESCRICAO,'
      '       CP.DOCUMENTO,'
      '       CP.VALOR,'
      '       CP.JURO,'
      '       CP.PAGAR,'
      '       CP.PAGA,'
      '       CP.DATAPAGTO,'
      '       CP.ORIGEM,'
      '       CP.COMPRA,'
      '       CP.CAPITALPAGO,'
      '       CP.JUROPAGO,'
      '       CP.DESCTO,'
      '       CP.OBS,'
      '       CP.ATRASO,'
      '       CP.VALORJURO,'
      '       CP.TOTAL,'
      '       CP.TOTALPAGO'
      'FROM CONTASPAGAR CP'
      'LEFT JOIN FORNECEDORES FO ON (CP.FORNECEDOR = FO.CODFORNECEDOR)'
      'LEFT JOIN CAIXAS CC ON (CC.CODIGO = CP.IDCONTA)'
      'WHERE (CP.PAGAR = ''S'')'
    )
    Params = <>
    Left = 56
    Top = 92
    object sqldContasPagarCODIGO: TZIntegerField
      FieldKind = fkData
      FieldName = 'CODIGO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object sqldContasPagarDATA: TZDateField
      FieldKind = fkData
      FieldName = 'DATA'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldContasPagarVENCIMENTO: TZDateField
      FieldKind = fkData
      FieldName = 'VENCIMENTO'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldContasPagarFORNECEDOR: TZIntegerField
      FieldKind = fkData
      FieldName = 'FORNECEDOR'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldContasPagarNOMEFORN: TZRawStringField
      FieldKind = fkData
      FieldName = 'NOMEFORN'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      Required = False
      Size = 100
    end
    object sqldContasPagarIDCONTA: TZIntegerField
      FieldKind = fkData
      FieldName = 'IDCONTA'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldContasPagarCONTA: TZRawStringField
      FieldKind = fkData
      FieldName = 'CONTA'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object sqldContasPagarDESCRICAO: TZRawStringField
      FieldKind = fkData
      FieldName = 'DESCRICAO'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object sqldContasPagarDOCUMENTO: TZRawStringField
      FieldKind = fkData
      FieldName = 'DOCUMENTO'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 50
    end
    object sqldContasPagarVALOR: TZBCDField
      FieldKind = fkData
      FieldName = 'VALOR'
      Index = 9
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
    object sqldContasPagarJURO: TZBCDField
      FieldKind = fkData
      FieldName = 'JURO'
      Index = 10
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
    object sqldContasPagarPAGAR: TZRawStringField
      FieldKind = fkData
      FieldName = 'PAGAR'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object sqldContasPagarPAGA: TZRawStringField
      FieldKind = fkData
      FieldName = 'PAGA'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object sqldContasPagarDATAPAGTO: TZDateField
      FieldKind = fkData
      FieldName = 'DATAPAGTO'
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldContasPagarORIGEM: TZIntegerField
      FieldKind = fkData
      FieldName = 'ORIGEM'
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldContasPagarCOMPRA: TZIntegerField
      FieldKind = fkData
      FieldName = 'COMPRA'
      Index = 15
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldContasPagarCAPITALPAGO: TZBCDField
      FieldKind = fkData
      FieldName = 'CAPITALPAGO'
      Index = 16
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
    object sqldContasPagarJUROPAGO: TZBCDField
      FieldKind = fkData
      FieldName = 'JUROPAGO'
      Index = 17
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
    object sqldContasPagarDESCTO: TZBCDField
      FieldKind = fkData
      FieldName = 'DESCTO'
      Index = 18
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
    object sqldContasPagarOBS: TZRawStringField
      FieldKind = fkData
      FieldName = 'OBS'
      Index = 19
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 255
    end
    object sqldContasPagarATRASO: TZIntegerField
      FieldKind = fkData
      FieldName = 'ATRASO'
      Index = 20
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldContasPagarVALORJURO: TZBCDField
      FieldKind = fkData
      FieldName = 'VALORJURO'
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
    object sqldContasPagarTOTAL: TZBCDField
      FieldKind = fkData
      FieldName = 'TOTAL'
      Index = 22
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
    object sqldContasPagarTOTALPAGO: TZBCDField
      FieldKind = fkData
      FieldName = 'TOTALPAGO'
      Index = 23
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
end
