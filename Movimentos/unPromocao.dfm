inherited frmPromocao: TfrmPromocao
  Left = 217
  Top = 118
  Caption = 'frmPromocao'
  ClientHeight = 514
  ClientWidth = 790
  OldCreateOrder = True
  ExplicitWidth = 796
  ExplicitHeight = 563
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbStatus: TStatusBar
    Top = 495
    Width = 790
    ExplicitTop = 495
    ExplicitWidth = 790
  end
  inherited pnBotoesPadrao: TPanel
    Width = 790
    ExplicitWidth = 790
  end
  object dbgrdPromocao: TDBGrid [2]
    Left = 0
    Top = 40
    Width = 790
    Height = 455
    Align = alBottom
    DataSource = dsPadrao
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Verdana'
    TitleFont.Style = []
    OnEditButtonClick = dbgrdPromocaoEditButtonClick
    Columns = <
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'PRODUTO'
        Title.Caption = 'Produto'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Arial'
        Title.Font.Style = []
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABREVIACAO'
        Title.Caption = 'Descri'#231#227'o'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Arial'
        Title.Font.Style = []
        Width = 354
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VENDA'
        Title.Caption = 'Pre'#231'o'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Arial'
        Title.Font.Style = []
        Width = 95
        Visible = True
      end
      item
        Color = 8454143
        Expanded = False
        FieldName = 'DESCONTO'
        Title.Caption = 'Desconto (%)'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Arial'
        Title.Font.Style = []
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Title.Caption = 'Promo'#231#227'o'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Arial'
        Title.Font.Style = []
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INICIO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Title.Caption = 'In'#237'cio'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Arial'
        Title.Font.Style = []
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FIM'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Title.Caption = 'Fim'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Arial'
        Title.Font.Style = []
        Width = 80
        Visible = True
      end>
  end
  inherited actlNavigateActions: TActionList
    Left = 104
    Top = 180
    inherited actPrint: TAction
      ShortCut = 0
      OnExecute = actPrintExecute
    end
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 263
    Top = 180
  end
  inherited mmPadrao: TMainMenu
    Left = 136
    Top = 180
    inherited miOpcoes: TMenuItem
      object N6: TMenuItem
        Caption = '-'
      end
      object miInserirProdutos: TMenuItem
        Caption = 'Inserir'
        object miProdutosGrupo: TMenuItem
          Caption = 'Produtos de um grupo'
          OnClick = miProdutosGrupoClick
        end
        object miProdutosFornecedor: TMenuItem
          Caption = 'Produtos de um fornecedor'
          OnClick = miProdutosFornecedorClick
        end
      end
      object miExcluirtodas: TMenuItem
        Caption = 'Excluir todas as promo'#231#245'es'
        OnClick = miExcluirtodasClick
      end
    end
    inherited miRelatorios: TMenuItem
      inherited mImprimir: TMenuItem
        Caption = 'Listagem de promo'#231'oes'
      end
      object N5: TMenuItem [1]
        Caption = '-'
      end
    end
  end
  object sqldPadrao: TSQLDataSet
    CommandText = 
      'select '#13#10'  p.CODIGO, '#13#10'  p.PRODUTO, '#13#10'  pro.ABREVIACAO,'#13#10'  pro.V' +
      'ENDA,'#13#10'  p.DESCONTO,'#13#10'  p.PRECO, '#13#10'  p.INICIO, '#13#10'  p.FIM '#13#10'from ' +
      'PROMOCAO p'#13#10'left join PRODUTOS pro on (pro.IDPRODUTO = p.PRODUTO' +
      ')'#13#10'order by FIM desc'
    MaxBlobSize = -1
    Params = <>
    Left = 170
    Top = 180
    object sqldPadraoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sqldPadraoPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Required = True
    end
    object sqldPadraoABREVIACAO: TStringField
      FieldName = 'ABREVIACAO'
      ProviderFlags = []
      Size = 80
    end
    object sqldPadraoVENDA: TFMTBCDField
      FieldName = 'VENDA'
      ProviderFlags = []
      Precision = 15
    end
    object sqldPadraoDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Precision = 15
    end
    object sqldPadraoPRECO: TFMTBCDField
      FieldName = 'PRECO'
      Precision = 15
    end
    object sqldPadraoINICIO: TDateField
      FieldName = 'INICIO'
    end
    object sqldPadraoFIM: TDateField
      FieldName = 'FIM'
    end
  end
  object dspPadrao: TDataSetProvider
    DataSet = sqldPadrao
    Options = [poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 200
    Top = 180
  end
  object cdsPadrao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    AfterInsert = cdsPadraoAfterInsert
    Left = 232
    Top = 180
    object cdsPadraoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsPadraoPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Required = True
      OnValidate = cdsPadraoPRODUTOValidate
    end
    object cdsPadraoABREVIACAO: TStringField
      FieldName = 'ABREVIACAO'
      ProviderFlags = []
      Size = 80
    end
    object cdsPadraoVENDA: TFMTBCDField
      FieldName = 'VENDA'
      ProviderFlags = []
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
    object cdsPadraoDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      OnChange = cdsPadraoDESCONTOChange
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 15
    end
    object cdsPadraoPRECO: TFMTBCDField
      FieldName = 'PRECO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 15
    end
    object cdsPadraoINICIO: TDateField
      FieldName = 'INICIO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPadraoFIM: TDateField
      FieldName = 'FIM'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/0000;1;_'
    end
  end
  object sqldProduto: TSQLDataSet
    CommandText = 
      'select'#13#10'  IDPRODUTO,'#13#10'  CODBARRA,'#13#10'  ABREVIACAO,'#13#10'  VENDA,'#13#10'  CO' +
      'DGRUPO,'#13#10'  CODFORNECEDOR'#13#10'from PRODUTOS'#13#10'order by ABREVIACAO'
    MaxBlobSize = -1
    Params = <>
    Left = 432
    Top = 172
    object sqldProdutoIDPRODUTO: TIntegerField
      FieldName = 'IDPRODUTO'
      Required = True
    end
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
    object sqldProdutoCODGRUPO: TIntegerField
      FieldName = 'CODGRUPO'
    end
    object sqldProdutoCODFORNECEDOR: TIntegerField
      FieldName = 'CODFORNECEDOR'
    end
  end
  object dspProduto: TDataSetProvider
    DataSet = sqldProduto
    Options = [poPropogateChanges, poUseQuoteChar]
    Left = 464
    Top = 172
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProduto'
    Left = 496
    Top = 172
    object cdsProdutoIDPRODUTO: TIntegerField
      FieldName = 'IDPRODUTO'
      Required = True
    end
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
      Precision = 15
    end
    object cdsProdutoCODGRUPO: TIntegerField
      FieldName = 'CODGRUPO'
    end
    object cdsProdutoCODFORNECEDOR: TIntegerField
      FieldName = 'CODFORNECEDOR'
    end
  end
  object sqldSpDesmarcaPromocao: TSQLDataSet
    CommandText = 'STPDESMARCAPROMOCAO'
    CommandType = ctStoredProc
    DbxCommandType = 'Dbx.StoredProcedure'
    MaxBlobSize = -1
    Params = <>
    Left = 176
    Top = 136
  end
  object sqldGrupo: TSQLDataSet
    CommandText = 
      'select'#13#10'  CODGRUPO, '#13#10'  DESCRICAO'#13#10'from GRUPOS'#13#10'order by DESCRIC' +
      'AO'
    MaxBlobSize = -1
    Params = <>
    Left = 432
    Top = 136
    object sqldGrupoCODGRUPO: TIntegerField
      FieldName = 'CODGRUPO'
      Required = True
    end
    object sqldGrupoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
  end
  object dspGrupo: TDataSetProvider
    DataSet = sqldGrupo
    Options = [poPropogateChanges, poUseQuoteChar]
    Left = 464
    Top = 136
  end
  object cdsGrupo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGrupo'
    Left = 496
    Top = 136
    object cdsGrupoCODGRUPO: TIntegerField
      FieldName = 'CODGRUPO'
      Required = True
    end
    object cdsGrupoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
  end
  object sqldForn: TSQLDataSet
    CommandText = 
      'select '#13#10'  CODFORNECEDOR,'#13#10'  FANTAZIA,'#13#10'  CNPJ,'#13#10'  TELEFONE'#13#10'fro' +
      'm FORNECEDORES'#13#10'order by FANTAZIA'
    MaxBlobSize = -1
    Params = <>
    Left = 432
    Top = 208
    object sqldFornCODFORNECEDOR: TIntegerField
      FieldName = 'CODFORNECEDOR'
      Required = True
    end
    object sqldFornFANTAZIA: TStringField
      FieldName = 'FANTAZIA'
      Size = 80
    end
    object sqldFornCNPJ: TStringField
      FieldName = 'CNPJ'
    end
    object sqldFornTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
  end
  object dspForn: TDataSetProvider
    DataSet = sqldForn
    Options = [poPropogateChanges, poUseQuoteChar]
    Left = 464
    Top = 208
  end
  object cdsForn: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspForn'
    Left = 496
    Top = 208
    object cdsFornCODFORNECEDOR: TIntegerField
      FieldName = 'CODFORNECEDOR'
      Required = True
    end
    object cdsFornFANTAZIA: TStringField
      FieldName = 'FANTAZIA'
      Size = 80
    end
    object cdsFornCNPJ: TStringField
      FieldName = 'CNPJ'
    end
    object cdsFornTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
  end
end
