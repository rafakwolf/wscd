inherited frmRelatorioEtiquetaCliente: TfrmRelatorioEtiquetaCliente
  Height = 288
  Width = 554
  Caption = 'frmRelatorioEtiquetaCliente'
  ClientHeight = 288
  ClientWidth = 554
  inherited pnButtons: TPanel
    Top = 254
    Width = 554
    ClientWidth = 554
    inherited btnImprimir: TBitBtn
      OnClick = btnVisualizarClick
    end
    inherited btnVisualizar: TBitBtn
      OnClick = btnVisualizarClick
    end
  end
  object dbeCidade: TDBEdit[1]
    Left = 16
    Height = 21
    Hint = 'Pesquisar < F2 >'
    Top = 120
    Width = 355
    DataField = 'DESCRICAO'
    DataSource = dsCidade
    ReadOnly = True
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object dbeCliente: TDBEdit[2]
    Left = 16
    Height = 21
    Hint = 'Pesquisar < F2 >'
    Top = 80
    Width = 355
    DataField = 'NOME'
    DataSource = dsPadrao
    ReadOnly = True
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object rgpFiltro: TRadioGroup[3]
    Left = 8
    Height = 41
    Top = 8
    Width = 393
    AutoFill = True
    Caption = 'Filtros'
    ChildSizing.LeftRightSpacing = 6
    ChildSizing.EnlargeHorizontal = crsHomogenousChildResize
    ChildSizing.EnlargeVertical = crsHomogenousChildResize
    ChildSizing.ShrinkHorizontal = crsScaleChilds
    ChildSizing.ShrinkVertical = crsScaleChilds
    ChildSizing.Layout = cclLeftToRightThenTopToBottom
    ChildSizing.ControlsPerLine = 3
    ClientHeight = 14
    ClientWidth = 383
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      'Cliente'
      'Cidade'
      'Todos'
    )
    OnClick = rgpFiltroClick
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object btnCliente: TButton[4]
    Left = 376
    Height = 25
    Top = 76
    Width = 75
    Caption = 'Cliente'
    TabOrder = 4
    OnClick = dbeClienteClickButton
  end
  object btnCidade: TButton[5]
    Left = 376
    Height = 25
    Top = 116
    Width = 75
    Caption = 'Cidade'
    TabOrder = 5
    OnClick = dbeCidadeClickButton
  end
  inherited dsPadrao: TDataSource[6]
    DataSet = cdsPesqCliente
    Left = 416
    Top = 160
  end
  object dsCidade: TDataSource[7]
    DataSet = cdsPesqCidade
    Left = 416
    Top = 224
  end
  object cdsPesqCliente: TZQuery[8]
    Connection = DmPrincipal.ZConnection1
    SQL.Strings = (
      'select * from CLIENTES'
    )
    Params = <>
    Left = 344
    Top = 152
    object cdsPesqClienteCODCLIENTE: TZIntegerField
      FieldKind = fkData
      FieldName = 'CODCLIENTE'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object cdsPesqClienteNOME: TZRawStringField
      FieldKind = fkData
      FieldName = 'NOME'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
  end
  object cdsPesqCidade: TZQuery[9]
    Connection = DmPrincipal.ZConnection1
    SQL.Strings = (
      'select * from CIDADES'
    )
    Params = <>
    Left = 336
    Top = 208
    object cdsPesqCidadeCODCIDADE: TZIntegerField
      FieldKind = fkData
      FieldName = 'CODCIDADE'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object cdsPesqCidadeDESCRICAO: TZRawStringField
      FieldKind = fkData
      FieldName = 'DESCRICAO'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
  end
end
