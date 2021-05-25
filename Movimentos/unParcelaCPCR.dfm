inherited frmParcelaCPCR: TfrmParcelaCPCR
  Left = 322
  Height = 452
  Top = 107
  Width = 587
  Caption = 'frmParcelaCPCR'
  ClientHeight = 452
  ClientWidth = 587
  OnShow = FormShow
  object lbParcelas: TLabel[0]
    Left = 232
    Height = 15
    Top = 48
    Width = 54
    Caption = 'Parcelas'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbPrazoInicio: TLabel[1]
    Left = 312
    Height = 15
    Top = 48
    Width = 79
    Caption = 'Prazo Inicial'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbIntervalo: TLabel[2]
    Left = 392
    Height = 15
    Top = 48
    Width = 58
    Caption = 'Intervalo'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object btnOk: TBitBtn[3]
    Left = 280
    Height = 25
    Top = 408
    Width = 89
    Caption = '&OK'
    OnClick = btnOkClick
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
  end
  object btnCancelar: TBitBtn[4]
    Left = 376
    Height = 25
    Top = 408
    Width = 89
    Caption = '&Cancelar'
    ModalResult = 2
    OnClick = btnCancelarClick
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
  end
  object btnCalcular: TBitBtn[5]
    Left = 8
    Height = 25
    Top = 408
    Width = 89
    Caption = '&Calcular'
    OnClick = btnCalcularClick
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
  end
  object dbeCodigo: TDBEdit[6]
    Left = 8
    Height = 28
    Top = 17
    Width = 81
    DataField = 'CODIGO'
    DataSource = dsPadrao
    ReadOnly = True
    CharCase = ecNormal
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object dbeNome: TDBEdit[7]
    Left = 96
    Height = 28
    Hint = 'Pesquisar < F2 >'
    Top = 17
    Width = 347
    DataField = 'NOME'
    DataSource = dsPadrao
    ReadOnly = True
    CharCase = ecNormal
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnEnter = dbeNomeEnter
  end
  object dbdtpData: TDBEdit[8]
    Left = 8
    Height = 28
    Top = 64
    Width = 113
    DataField = 'DATA'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object dbeValor: TDBEdit[9]
    Left = 128
    Height = 28
    Top = 64
    Width = 97
    DataField = 'VALOR'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object seParcelas: TSpinEdit[10]
    Left = 232
    Height = 28
    Top = 64
    Width = 73
    OnExit = seParcelasExit
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    Value = 1
  end
  object sePrazoInicio: TSpinEdit[11]
    Left = 312
    Height = 28
    Top = 64
    Width = 73
    OnExit = seParcelasExit
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    Value = 1
  end
  object seIntervalo: TSpinEdit[12]
    Left = 392
    Height = 28
    Top = 64
    Width = 73
    OnExit = seParcelasExit
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    Value = 1
  end
  object dbgrdParcelas: TDBGrid[13]
    Left = 8
    Height = 305
    Top = 96
    Width = 457
    Color = clWindow
    Columns = <>
    DataSource = dsParcela
    Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ShowHint = True
    TabOrder = 7
  end
  object edtJuro: TLabeledEdit[14]
    Left = 482
    Height = 28
    Top = 56
    Width = 80
    EditLabel.Height = 15
    EditLabel.Width = 80
    EditLabel.Caption = 'Juros'
    EditLabel.ParentColor = False
    TabOrder = 11
    Text = 'edtJuro'
  end
  object sqldParcela: TSQLQuery[15]
    FieldDefs = <>
    Params = <>
    Left = 40
    Top = 248
    object sqldParcelaNUMERO: TIntegerField
      FieldKind = fkData
      FieldName = 'NUMERO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldParcelaVENC: TDateField
      FieldKind = fkData
      FieldName = 'VENC'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldParcelaDIA: TStringField
      FieldKind = fkData
      FieldName = 'DIA'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldParcelaVALOR: TFloatField
      FieldKind = fkData
      FieldName = 'VALOR'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
  end
  object dspParcela: TTimer[16]
    Left = 120
    Top = 248
  end
  object cdsParcela: TMemDataset[17]
    FieldDefs = <>
    Left = 208
    Top = 240
    object cdsParcelaNUMERO: TIntegerField
      DisplayLabel = 'Número'
      FieldKind = fkData
      FieldName = 'NUMERO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsParcelaVENC: TDateField
      DisplayLabel = 'Vencimento'
      FieldKind = fkData
      FieldName = 'VENC'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      OnChange = cdsParcelaVENCChange
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsParcelaDIA: TStringField
      DisplayLabel = 'Dia'
      FieldKind = fkData
      FieldName = 'DIA'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsParcelaVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldKind = fkData
      FieldName = 'VALOR'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
  end
  object dsParcela: TDataSource[18]
    DataSet = cdsParcela
    Left = 288
    Top = 240
  end
  object sqldContasPagar: TSQLQuery[19]
    FieldDefs = <>
    Params = <    
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end    
      item
        DataType = ftDate
        Name = 'DATA'
        ParamType = ptInput
      end    
      item
        DataType = ftDate
        Name = 'VENCIMENTO'
        ParamType = ptInput
      end    
      item
        DataType = ftInteger
        Name = 'IDFORN'
        ParamType = ptInput
      end    
      item
        DataType = ftString
        Name = 'DESCRICAO'
        ParamType = ptInput
      end    
      item
        DataType = ftString
        Name = 'DOCUMENTO'
        ParamType = ptInput
      end    
      item
        DataType = ftFloat
        Name = 'VALOR'
        ParamType = ptInput
      end    
      item
        DataType = ftFloat
        Name = 'JURO'
        ParamType = ptInput
      end    
      item
        DataType = ftInteger
        Name = 'COMPRA'
        ParamType = ptInput
      end>
    Left = 152
    Top = 128
  end
  object sqldReceber: TSQLQuery[20]
    FieldDefs = <>
    Params = <    
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end    
      item
        DataType = ftDate
        Name = 'DATA'
        ParamType = ptInput
      end    
      item
        DataType = ftDate
        Name = 'VENCIMENTO'
        ParamType = ptInput
      end    
      item
        DataType = ftInteger
        Name = 'IDCLIENTE'
        ParamType = ptInput
      end    
      item
        DataType = ftString
        Name = 'DESCRICAO'
        ParamType = ptInput
      end    
      item
        DataType = ftString
        Name = 'DOCUMENTO'
        ParamType = ptInput
      end    
      item
        DataType = ftFloat
        Name = 'VALOR'
        ParamType = ptInput
      end    
      item
        DataType = ftFloat
        Name = 'JURO'
        ParamType = ptInput
      end    
      item
        DataType = ftInteger
        Name = 'VENDA'
        ParamType = ptInput
      end>
    Left = 312
    Top = 144
  end
  object sqldPadrao: TSQLQuery[21]
    FieldDefs = <>
    Params = <>
    Left = 32
    Top = 312
    object sqldPadraoCODIGO: TIntegerField
      FieldKind = fkData
      FieldName = 'CODIGO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoNOME: TStringField
      FieldKind = fkData
      FieldName = 'NOME'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object sqldPadraoDATA: TDateField
      FieldKind = fkData
      FieldName = 'DATA'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoVALOR: TFloatField
      FieldKind = fkData
      FieldName = 'VALOR'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
  end
  object dspPadrao: TTimer[22]
    Left = 120
    Top = 312
  end
  object cdsPadrao: TMemDataset[23]
    FieldDefs = <>
    Left = 200
    Top = 320
    object cdsPadraoCODIGO: TIntegerField
      FieldKind = fkData
      FieldName = 'CODIGO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoNOME: TStringField
      FieldKind = fkData
      FieldName = 'NOME'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object cdsPadraoDATA: TDateField
      FieldKind = fkData
      FieldName = 'DATA'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoVALOR: TFloatField
      FieldKind = fkData
      FieldName = 'VALOR'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
  end
  object dsPadrao: TDataSource[24]
    DataSet = cdsPadrao
    Left = 288
    Top = 320
  end
end
