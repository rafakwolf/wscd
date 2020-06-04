inherited frmPerda: TfrmPerda
  ClientHeight = 396
  ClientWidth = 473
  Caption = 'frmPerda'
  OldCreateOrder = True
  Font.Name = 'Verdana'
  ExplicitWidth = 479
  ExplicitHeight = 425
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbStatus: TStatusBar
    Top = 377
    Width = 473
    ExplicitTop = 377
    ExplicitWidth = 473
  end
  inherited pnBotoesPadrao: TContainerPanel
    Width = 473
    TabOrder = 6
    ExplicitWidth = 473
    inherited btnNovo: TSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnAlterar: TSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnExcluir: TSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnSalvar: TSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnCancelar: TSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnConsultar: TSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnSair: TSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnPrint: TSpeedButton
      Font.Name = 'Verdana'
    end
  end
  object lbQtde: TLabel [2]
    Left = 36
    Top = 84
    Width = 27
    Height = 13
    Hint = ''
    ShowHint = True
    Caption = 'Qtde'
    TabOrder = 8
  end
  object lbPreco: TLabel [3]
    Left = 31
    Top = 108
    Width = 32
    Height = 13
    Hint = ''
    ShowHint = True
    Caption = 'Pre'#231'o'
    TabOrder = 9
  end
  object lbObs: TLabel [4]
    Left = 37
    Top = 267
    Width = 26
    Height = 13
    Hint = ''
    ShowHint = True
    Caption = 'Obs.'
    TabOrder = 10
  end
  object lbPrecoCusto: TLabel [5]
    Left = 183
    Top = 108
    Width = 43
    Height = 13
    Hint = ''
    ShowHint = True
    Caption = '(Custo)'
    TabOrder = 11
  end
  object dbdData: TDBEdit [6]
    Left = 66
    Top = 128
    Width = 153
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'DATA'
    DataSource = dsPadrao
    TabOrder = 3
  end
  object dbQtde: TDBEdit [7]
    Left = 66
    Top = 80
    Width = 73
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'QTDE'
    DataSource = dsPadrao
    TabOrder = 1
  end
  object dbProduto: TDBEdit [8]
    Left = 66
    Top = 56
    Width = 361
    Height = 21
    Hint = 'Pesquisar < F2 >'
    ShowHint = True
    DataField = 'DESCRICAO'
    DataSource = dsPadrao
    TabOrder = 0
    Color = clBtnFace
    ReadOnly = True
  end
  object dbPreco: TDBEdit [9]
    Left = 66
    Top = 104
    Width = 113
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'PRECO'
    DataSource = dsPadrao
    TabOrder = 2
  end
  object dbmOBS: TDBMemo [10]
    Left = 66
    Top = 264
    Width = 383
    Height = 89
    Hint = ''
    ShowHint = True
    DataField = 'OBS'
    DataSource = dsPadrao
    ScrollBars = ssVertical
    TabOrder = 5
  end
  object dbrgrpMOTIVO: TDBRadioGroup [11]
    Left = 66
    Top = 152
    Width = 153
    Height = 105
    Hint = ''
    ShowHint = True
    DataField = 'MOTIVO'
    DataSource = dsPadrao
    Caption = 'Motivo'
    TabOrder = 4
    Items.Strings = (
      '&Danificado'
      '&Vencido'
      '&Furto'
      '&Perda de peso'
      '&Outro')
    Values.Strings = (
      'D'
      'V'
      'F'
      'P'
      'O')
  end
  inherited actlNavigateActions: TActionList
    Left = 272
    Top = 100
    inherited actPrint: TAction
      OnExecute = actPrintExecute
    end
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 367
    Top = 148
  end
  object sqldPadrao: TSQLDataSet
    CommandText = 
      'select '#13#10'  p.CODIGO, '#13#10'  p.CODPRODUTO,'#13#10'  pro.DESCRICAO,'#13#10'  p.QT' +
      'DE, '#13#10'  p.PRECO, '#13#10'  p.DATA, '#13#10'  p.MOTIVO,'#13#10'  p.OBS '#13#10'from PERDA' +
      ' p'#13#10'left join PRODUTOS pro on (p.CODPRODUTO = pro.IDPRODUTO)'#13#10'or' +
      'der by p.DATA'
    MaxBlobSize = -1
    Params = <>
    Left = 272
    Top = 148
    object sqldPadraoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqldPadraoCODPRODUTO: TIntegerField
      FieldName = 'CODPRODUTO'
    end
    object sqldPadraoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = []
      Size = 80
    end
    object sqldPadraoQTDE: TIntegerField
      FieldName = 'QTDE'
    end
    object sqldPadraoPRECO: TFMTBCDField
      FieldName = 'PRECO'
      Precision = 15
    end
    object sqldPadraoDATA: TDateField
      FieldName = 'DATA'
    end
    object sqldPadraoMOTIVO: TStringField
      FieldName = 'MOTIVO'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dspPadrao: TDataSetProvider
    DataSet = sqldPadrao
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 304
    Top = 148
  end
  object cdsPadrao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    AfterInsert = cdsPadraoAfterInsert
    Left = 336
    Top = 148
    object cdsPadraoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPadraoCODPRODUTO: TIntegerField
      FieldName = 'CODPRODUTO'
      OnValidate = cdsPadraoCODPRODUTOValidate
    end
    object cdsPadraoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = []
      Size = 80
    end
    object cdsPadraoQTDE: TIntegerField
      FieldName = 'QTDE'
    end
    object cdsPadraoPRECO: TFMTBCDField
      FieldName = 'PRECO'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
    object cdsPadraoDATA: TDateField
      FieldName = 'DATA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoMOTIVO: TStringField
      FieldName = 'MOTIVO'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object sqldProduto: TSQLDataSet
    CommandText = 
      'select '#13#10'  IDPRODUTO,'#13#10'  CODBARRA,'#13#10'  DESCRICAO,'#13#10'  ABREVIACAO,'#13 +
      #10'  VENDA,'#13#10'  CUSTO'#13#10'from PRODUTOS'
    MaxBlobSize = -1
    Params = <>
    Left = 272
    Top = 180
    object sqldProdutoIDPRODUTO: TIntegerField
      FieldName = 'IDPRODUTO'
      Required = True
    end
    object sqldProdutoCODBARRA: TStringField
      FieldName = 'CODBARRA'
      Size = 13
    end
    object sqldProdutoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
    object sqldProdutoABREVIACAO: TStringField
      FieldName = 'ABREVIACAO'
      Size = 80
    end
    object sqldProdutoVENDA: TFMTBCDField
      FieldName = 'VENDA'
      Precision = 15
    end
    object sqldProdutoCUSTO: TFMTBCDField
      FieldName = 'CUSTO'
      Precision = 15
    end
  end
  object dspProduto: TDataSetProvider
    DataSet = sqldProduto
    Left = 304
    Top = 180
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProduto'
    Left = 336
    Top = 180
    object cdsProdutoIDPRODUTO: TIntegerField
      FieldName = 'IDPRODUTO'
      Required = True
    end
    object cdsProdutoCODBARRA: TStringField
      FieldName = 'CODBARRA'
      Size = 13
    end
    object cdsProdutoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
    object cdsProdutoABREVIACAO: TStringField
      FieldName = 'ABREVIACAO'
      Size = 80
    end
    object cdsProdutoVENDA: TFMTBCDField
      FieldName = 'VENDA'
      Precision = 15
    end
    object cdsProdutoCUSTO: TFMTBCDField
      FieldName = 'CUSTO'
      Precision = 15
    end
  end
end
