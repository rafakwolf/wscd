inherited frmEtiquetaProduto: TfrmEtiquetaProduto
  Caption = 'frmEtiquetaProduto'
  ClientHeight = 402
  OldCreateOrder = True
  ExplicitHeight = 451
  PixelsPerInch = 96
  TextHeight = 13
  object dbgrdEtq: TDBGrid [0]
    Left = 0
    Top = 123
    Width = 755
    Height = 260
    Align = alBottom
    DataSource = dsPadrao
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Verdana'
    TitleFont.Style = []
    OnDrawColumnCell = dbgrdEtqDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'CODBARRA'
        Title.Caption = 'C'#243'digo de Barra'
        Width = 121
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 480
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECO'
        Title.Caption = 'Pre'#231'o'
        Width = 101
        Visible = True
      end>
  end
  object dbeCodBarra: TDBEdit [1]
    Left = 112
    Top = 48
    Width = 161
    Height = 21
    DataField = 'CODBARRA'
    DataSource = dsPadrao
    TabOrder = 3
  end
  object dbeProduto: TDBEdit [2]
    Left = 112
    Top = 72
    Width = 497
    Height = 21
    DataField = 'DESCRICAO'
    DataSource = dsPadrao
    TabOrder = 4
  end
  object dbePreco: TDBEdit [3]
    Left = 112
    Top = 96
    Width = 121
    Height = 21
    DataField = 'PRECO'
    DataSource = dsPadrao
    TabOrder = 5
  end
  inherited sbStatus: TStatusBar
    Top = 383
    ExplicitTop = 383
  end
  inherited actlNavigateActions: TActionList
    Left = 520
    Top = 172
    inherited actPrint: TAction
      Hint = 'Gerar etiquetas'
      ShortCut = 0
      OnExecute = actPrintExecute
    end
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 399
    Top = 256
  end
  inherited mmPadrao: TMainMenu
    Left = 656
    Top = 164
    inherited miOpcoes: TMenuItem
      object N5: TMenuItem [5]
        Caption = '-'
      end
      object miBuscaProduto: TMenuItem [6]
        Caption = 'Inserir produto'
        OnClick = miBuscaProdutoClick
      end
      object miInserirTodosProdutos: TMenuItem [7]
        Caption = 'Inserir todos os produtos'
        OnClick = miInserirTodosProdutosClick
      end
      object N7: TMenuItem [8]
        Caption = '-'
      end
      object miExcluirTudo: TMenuItem [9]
        Caption = 'Excluir tudo'
        OnClick = miExcluirTudoClick
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object miAjustaCodigoBarra: TMenuItem
        Caption = 'Ajustar c'#243'digos de barras'
        OnClick = miAjustaCodigoBarraClick
      end
      object miConfigurar: TMenuItem
        Caption = 'Configurar'
        OnClick = miConfigurarClick
      end
    end
    inherited miRelatorios: TMenuItem
      inherited mImprimir: TMenuItem
        Caption = 'Gerar etiquetas'
      end
    end
  end
  object sqldPadrao: TSQLDataSet
    CommandText = 
      'select '#13#10'    IDETIQUETAPROD,'#13#10'    CODBARRA,'#13#10'    DESCRICAO,'#13#10'   ' +
      ' PRECO  '#13#10'from ETIQUETAPROD'#13#10'order by DESCRICAO'
    MaxBlobSize = -1
    Params = <>
    Left = 304
    Top = 256
    object sqldPadraoIDETIQUETAPROD: TIntegerField
      FieldName = 'IDETIQUETAPROD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqldPadraoCODBARRA: TStringField
      FieldName = 'CODBARRA'
      Size = 13
    end
    object sqldPadraoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
    object sqldPadraoPRECO: TFMTBCDField
      FieldName = 'PRECO'
      Precision = 15
    end
  end
  object dspPadrao: TDataSetProvider
    DataSet = sqldPadrao
    UpdateMode = upWhereKeyOnly
    Left = 336
    Top = 256
  end
  object cdsPadrao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    AfterInsert = cdsPadraoAfterInsert
    Left = 368
    Top = 256
    object cdsPadraoIDETIQUETAPROD: TIntegerField
      FieldName = 'IDETIQUETAPROD'
      Required = True
    end
    object cdsPadraoCODBARRA: TStringField
      FieldName = 'CODBARRA'
      Size = 13
    end
    object cdsPadraoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
    object cdsPadraoPRECO: TFMTBCDField
      FieldName = 'PRECO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 15
    end
  end
  object sqldProduto: TSQLDataSet
    CommandText = 
      'select '#13#10'  CODBARRA,'#13#10'  ABREVIACAO,'#13#10'  VENDA'#13#10'from PRODUTOS'#13#10'ord' +
      'er by DESCRICAO'
    MaxBlobSize = -1
    Params = <>
    Left = 304
    Top = 224
    object sqldProdutoCODBARRA: TStringField
      FieldName = 'CODBARRA'
      Size = 13
    end
    object sqldProdutoABREVIACAO: TStringField
      FieldName = 'ABREVIACAO'
      Size = 80
    end
    object sqldProdutoVENDA: TFMTBCDField
      FieldName = 'VENDA'
      Precision = 15
    end
  end
  object dspProduto: TDataSetProvider
    DataSet = sqldProduto
    Left = 336
    Top = 224
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProduto'
    Left = 368
    Top = 224
    object cdsProdutoCODBARRA: TStringField
      FieldName = 'CODBARRA'
      Size = 13
    end
    object cdsProdutoABREVIACAO: TStringField
      FieldName = 'ABREVIACAO'
      Size = 80
    end
    object cdsProdutoVENDA: TFMTBCDField
      FieldName = 'VENDA'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
  end
end
