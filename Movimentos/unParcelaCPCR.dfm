inherited frmParcelaCPCR: TfrmParcelaCPCR
  Left = 446
  Height = 511
  Top = 208
  Width = 608
  Caption = 'frmParcelaCPCR'
  ClientHeight = 511
  ClientWidth = 608
  OnShow = FormShow
  object lbParcelas: TLabel[0]
    Left = 232
    Height = 16
    Top = 48
    Width = 54
    Caption = 'Parcelas'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbPrazoInicio: TLabel[1]
    Left = 312
    Height = 16
    Top = 48
    Width = 79
    Caption = 'Prazo Inicial'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbIntervalo: TLabel[2]
    Left = 392
    Height = 16
    Top = 48
    Width = 59
    Caption = 'Intervalo'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object btnOk: TBitBtn[3]
    Left = 280
    Height = 32
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
    Height = 32
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
    Height = 32
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
    Height = 21
    Top = 17
    Width = 81
    DataField = 'CODIGO'
    DataSource = dsPadrao
    ReadOnly = True
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object dbeNome: TDBEdit[7]
    Left = 96
    Height = 21
    Hint = 'Pesquisar < F2 >'
    Top = 17
    Width = 347
    DataField = 'NOME'
    DataSource = dsPadrao
    ReadOnly = True
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnEnter = dbeNomeEnter
  end
  object dbdtpData: TDBEdit[8]
    Left = 8
    Height = 21
    Top = 64
    Width = 113
    DataField = 'DATA'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object dbeValor: TDBEdit[9]
    Left = 128
    Height = 21
    Top = 64
    Width = 97
    DataField = 'VALOR'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object seParcelas: TSpinEdit[10]
    Left = 232
    Height = 21
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
    Height = 21
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
    Height = 21
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
    Height = 21
    Top = 56
    Width = 80
    EditLabel.Height = 16
    EditLabel.Width = 80
    EditLabel.Caption = 'Juros'
    EditLabel.ParentColor = False
    TabOrder = 11
    Text = 'edtJuro'
  end
  object dsParcela: TDataSource[15]
    DataSet = cdsParcela
    Left = 288
    Top = 240
  end
  object dsPadrao: TDataSource[16]
    DataSet = cdsPadrao
    Left = 288
    Top = 320
  end
  object cdsParcela: TZQuery[17]
    Connection = DmPrincipal.ZConnection1
    SQL.Strings = (
      'SELECT'
      '    CAST(NULL AS SIGNED) AS NUMERO,'
      '    CAST(NULL AS DATE) AS VENC,'
      '    CAST(NULL AS CHAR(20)) AS DIA,'
      '    CAST(NULL AS DECIMAL(15,2)) AS VALOR;'
    )
    Params = <>
    Left = 200
    Top = 232
    object cdsParcelaNUMERO: TZInt64Field
      FieldKind = fkData
      FieldName = 'NUMERO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = True
      Required = False
    end
    object cdsParcelaVENC: TZDateField
      FieldKind = fkData
      FieldName = 'VENC'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = True
      Required = False
    end
    object cdsParcelaDIA: TZRawStringField
      FieldKind = fkData
      FieldName = 'DIA'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = True
      Required = False
    end
    object cdsParcelaVALOR: TZBCDField
      FieldKind = fkData
      FieldName = 'VALOR'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = True
      Required = False
      Precision = 15
      Currency = False
      MaxValue = 0
      MinValue = 0
      Size = 2
    end
  end
  object sqldContasPagar: TZQuery[18]
    Connection = DmPrincipal.ZConnection1
    SQL.Strings = (
      'insert into CONTASPAGAR(CODIGO, DATA, VENCIMENTO, FORNECEDOR, DESCRICAO, DOCUMENTO, VALOR, JURO, PAGAR, COMPRA, PAGA)'
      'values(:CODIGO, :DATA, :VENCIMENTO, :IDFORN, :DESCRICAO, :DOCUMENTO, :VALOR, :JURO, ''N'', :COMPRA, ''N'')'
    )
    Params = <    
      item
        Name = 'CODIGO'
      end    
      item
        Name = 'DATA'
      end    
      item
        Name = 'VENCIMENTO'
      end    
      item
        Name = 'IDFORN'
      end    
      item
        Name = 'DESCRICAO'
      end    
      item
        Name = 'DOCUMENTO'
      end    
      item
        Name = 'VALOR'
      end    
      item
        Name = 'JURO'
      end    
      item
        Name = 'COMPRA'
      end>
    Left = 197
    Top = 138
    ParamData = <    
      item
        Name = 'CODIGO'
      end    
      item
        Name = 'DATA'
      end    
      item
        Name = 'VENCIMENTO'
      end    
      item
        Name = 'IDFORN'
      end    
      item
        Name = 'DESCRICAO'
      end    
      item
        Name = 'DOCUMENTO'
      end    
      item
        Name = 'VALOR'
      end    
      item
        Name = 'JURO'
      end    
      item
        Name = 'COMPRA'
      end>
  end
  object sqldReceber: TZQuery[19]
    Connection = DmPrincipal.ZConnection1
    SQL.Strings = (
      'insert into CONTASRECEBER(CODIGO, DATA, VENCIMENTO, CLIENTE, DESCRICAO, DOCUMENTO, VALOR, JURO, RECEBER, VENDA, RECDA)'
      'values(:CODIGO, :DATA, :VENCIMENTO, :IDCLIENTE, :DESCRICAO, :DOCUMENTO, :VALOR, :JURO, ''N'', :VENDA, ''N'')'
    )
    Params = <    
      item
        Name = 'CODIGO'
      end    
      item
        Name = 'DATA'
      end    
      item
        Name = 'VENCIMENTO'
      end    
      item
        Name = 'IDCLIENTE'
      end    
      item
        Name = 'DESCRICAO'
      end    
      item
        Name = 'DOCUMENTO'
      end    
      item
        Name = 'VALOR'
      end    
      item
        Name = 'JURO'
      end    
      item
        Name = 'VENDA'
      end>
    Left = 334
    Top = 153
    ParamData = <    
      item
        Name = 'CODIGO'
      end    
      item
        Name = 'DATA'
      end    
      item
        Name = 'VENCIMENTO'
      end    
      item
        Name = 'IDCLIENTE'
      end    
      item
        Name = 'DESCRICAO'
      end    
      item
        Name = 'DOCUMENTO'
      end    
      item
        Name = 'VALOR'
      end    
      item
        Name = 'JURO'
      end    
      item
        Name = 'VENDA'
      end>
  end
  object cdsPadrao: TZQuery[20]
    Connection = DmPrincipal.ZConnection1
    SQL.Strings = (
      'SELECT  CAST(NULL AS SIGNED) CODIGO,'
      'CAST(NULL AS CHAR(100)) NOME,'
      'CAST(CURRENT_DATE AS DATE) DATA,'
      'CAST(0 AS FLOAT) VALOR;'
    )
    Params = <>
    Left = 169
    Top = 329
    object cdsPadraoCODIGO: TZInt64Field
      FieldKind = fkData
      FieldName = 'CODIGO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = True
      Required = False
    end
    object cdsPadraoNOME: TZRawStringField
      FieldKind = fkData
      FieldName = 'NOME'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = True
      Required = False
      Size = 100
    end
    object cdsPadraoDATA: TZDateField
      FieldKind = fkData
      FieldName = 'DATA'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = True
      Required = False
    end
    object cdsPadraoVALOR: TZDoubleField
      FieldKind = fkData
      FieldName = 'VALOR'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = True
      Required = False
      Precision = 23
    end
  end
end
