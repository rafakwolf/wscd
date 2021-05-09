inherited frmProduto: TfrmProduto
  Left = 273
  Height = 457
  Top = 136
  Width = 674
  Caption = 'frmProduto'
  ClientHeight = 457
  ClientWidth = 674
  inherited sbStatus: TStatusBar
    Top = 439
    Width = 674
  end
  inherited pnBotoesPadrao: TPanel
    Width = 674
    ClientWidth = 674
    TabOrder = 15
  end
  object dbeQtdeRecebida: TDBEdit[2]
    Left = 200
    Height = 33
    Top = 252
    Width = 81
    DataField = 'QTDERECEBIDA'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
  end
  object dbeEstoqueMinimo: TDBEdit[3]
    Left = 96
    Height = 33
    Hint = 'Para alterar o estoque, tecle F10'#13#10'e digite a senha de administrador...'
    Top = 252
    Width = 97
    DataField = 'ESTOQUEMINIMO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
  end
  object dbeEstoque: TDBEdit[4]
    Left = 16
    Height = 33
    Hint = 'Para alterar o estoque, tecle F10'#13#10'e digite a senha de administrador...'
    Top = 252
    Width = 73
    DataField = 'ESTOQUE'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
  object dbePrecoVenda: TDBEdit[5]
    Left = 208
    Height = 33
    Top = 308
    Width = 105
    DataField = 'VENDA'
    DataSource = dsPadrao
    CharCase = ecNormal
    Color = 8454143
    Font.CharSet = ANSI_CHARSET
    Font.Name = 'Verdana'
    MaxLength = 0
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
  end
  object dbeLucro: TDBEdit[6]
    Left = 120
    Height = 33
    Top = 308
    Width = 81
    DataField = 'LUCRO'
    DataSource = dsPadrao
    CharCase = ecNormal
    Color = 8454143
    Font.CharSet = ANSI_CHARSET
    Font.Name = 'Verdana'
    MaxLength = 0
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    OnExit = dbeLucroExit
  end
  object dbePrecoCusto: TDBEdit[7]
    Left = 16
    Height = 33
    Top = 308
    Width = 97
    DataField = 'CUSTO'
    DataSource = dsPadrao
    CharCase = ecNormal
    Color = 8454143
    Font.CharSet = ANSI_CHARSET
    Font.Name = 'Verdana'
    MaxLength = 0
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
  end
  object dbePrecoPromocao: TDBEdit[8]
    Left = 320
    Height = 33
    Top = 308
    Width = 89
    DataField = 'PRECO_PROMOCAO'
    DataSource = dsPadrao
    CharCase = ecNormal
    Color = 8454143
    Font.CharSet = ANSI_CHARSET
    Font.Name = 'Verdana'
    MaxLength = 0
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
  end
  object dbdValidade: TDBEdit[9]
    Left = 120
    Height = 33
    Top = 364
    Width = 97
    DataField = 'DATAVALIDADE'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 14
  end
  object dbePeso: TDBEdit[10]
    Left = 16
    Height = 33
    Top = 364
    Width = 97
    DataField = 'PESO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
  end
  object dbeNomeProduto: TDBEdit[11]
    Left = 16
    Height = 33
    Hint = 'Para efetuar uma busca rápida'#13#10'tecle F2...'
    Top = 108
    Width = 482
    DataField = 'DESCRICAO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object dbeCodigoBarra: TDBEdit[12]
    Left = 88
    Height = 33
    Top = 64
    Width = 145
    DataField = 'CODBARRA'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object dbeCodigoInterno: TDBEdit[13]
    Left = 16
    Height = 33
    Top = 64
    Width = 65
    DataField = 'IDPRODUTO'
    DataSource = dsPadrao
    ReadOnly = True
    CharCase = ecNormal
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object dbeReferencia: TDBEdit[14]
    Left = 240
    Height = 33
    Top = 64
    Width = 121
    DataField = 'REFERENCIA'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object dbeDataReceb: TDBEdit[15]
    Left = 288
    Height = 33
    Top = 252
    Width = 105
    DataField = 'DATARECEBIDA'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
  end
  object dbckbPromocao: TDBCheckBox[16]
    Left = 421
    Height = 17
    Top = 310
    Width = 93
    Caption = 'Promoção'
    Color = clBtnFace
    DataField = 'PROMOCAO'
    DataSource = dsPadrao
    ParentColor = False
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 12
    ValueChecked = 'S'
    ValueUnchecked = 'N'
  end
  object dbeObs: TDBEdit[17]
    Left = 223
    Height = 33
    Top = 363
    Width = 275
    DataField = 'OBS'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 17
  end
  inherited actlNavigateActions: TActionList[18]
    Left = 560
    Top = 48
    inherited actPrint: TAction
      Hint = 'Listagem de produtos'
      OnExecute = actPrintExecute
      ShortCut = 0
    end
    object actEstoqueMinimo: TAction[8]
      Category = 'Navigate'
      Caption = 'Estoque mínimo'
      OnExecute = actEstoqueMinimoExecute
    end
  end
  inherited dsPadrao: TDataSource[19]
    DataSet = ZQuery1
    Left = 560
    Top = 120
  end
  object ZQuery1: TZQuery[20]
    Connection = DmPrincipal.ZConnection1
    UpdateObject = ZUpdateSQL1
    SQL.Strings = (
      'select * from PRODUTOS'
    )
    Params = <>
    Left = 556
    Top = 195
  end
  object ZUpdateSQL1: TZUpdateSQL[21]
    DeleteSQL.Strings = (
      'DELETE FROM PRODUTOS'
      'WHERE'
      '  PRODUTOS.IDPRODUTO = :OLD_IDPRODUTO'
    )
    InsertSQL.Strings = (
      'INSERT INTO PRODUTOS'
      '  (CODBARRA, REFERENCIA, CODFORNECEDOR, CODGRUPO, DESCRICAO, ABREVIACAO, '
      '   DATAVALIDADE, CODUNIDADE, PESO, PRECO_PROMOCAO, CUSTO, LUCRO, VENDA, '
      '   ESTOQUE, ESTOQUEMINIMO, IDALIQUOTA, NOVO, ALTERADO, QTDERECEBIDA, DATARECEBIDA, '
      '   EXCLUIR, PROMOCAO, OBS)'
      'VALUES'
      '  (:CODBARRA, :REFERENCIA, :CODFORNECEDOR, :CODGRUPO, :DESCRICAO, :ABREVIACAO, '
      '   :DATAVALIDADE, :CODUNIDADE, :PESO, :PRECO_PROMOCAO, :CUSTO, :LUCRO, '
      '   :VENDA, :ESTOQUE, :ESTOQUEMINIMO, :IDALIQUOTA, :NOVO, :ALTERADO, :QTDERECEBIDA, '
      '   :DATARECEBIDA, :EXCLUIR, :PROMOCAO, :OBS)'
    )
    ModifySQL.Strings = (
      'UPDATE PRODUTOS SET'
      '  CODBARRA = :CODBARRA,'
      '  REFERENCIA = :REFERENCIA,'
      '  CODFORNECEDOR = :CODFORNECEDOR,'
      '  CODGRUPO = :CODGRUPO,'
      '  DESCRICAO = :DESCRICAO,'
      '  ABREVIACAO = :ABREVIACAO,'
      '  DATAVALIDADE = :DATAVALIDADE,'
      '  CODUNIDADE = :CODUNIDADE,'
      '  PESO = :PESO,'
      '  PRECO_PROMOCAO = :PRECO_PROMOCAO,'
      '  CUSTO = :CUSTO,'
      '  LUCRO = :LUCRO,'
      '  VENDA = :VENDA,'
      '  ESTOQUE = :ESTOQUE,'
      '  ESTOQUEMINIMO = :ESTOQUEMINIMO,'
      '  IDALIQUOTA = :IDALIQUOTA,'
      '  NOVO = :NOVO,'
      '  ALTERADO = :ALTERADO,'
      '  QTDERECEBIDA = :QTDERECEBIDA,'
      '  DATARECEBIDA = :DATARECEBIDA,'
      '  EXCLUIR = :EXCLUIR,'
      '  PROMOCAO = :PROMOCAO,'
      '  OBS = :OBS'
      'WHERE'
      '  PRODUTOS.IDPRODUTO = :OLD_IDPRODUTO'
    )
    UseSequenceFieldForRefreshSQL = False
    Left = 553
    Top = 260
    ParamData = <    
      item
        DataType = ftUnknown
        Name = 'CODBARRA'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'REFERENCIA'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'CODFORNECEDOR'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'CODGRUPO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'DESCRICAO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'ABREVIACAO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'DATAVALIDADE'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'CODUNIDADE'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'PESO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'PRECO_PROMOCAO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'CUSTO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'LUCRO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'VENDA'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'ESTOQUE'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'ESTOQUEMINIMO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'IDALIQUOTA'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'NOVO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'ALTERADO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'QTDERECEBIDA'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'DATARECEBIDA'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'EXCLUIR'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'PROMOCAO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'OBS'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'OLD_IDPRODUTO'
        ParamType = ptUnknown
      end>
  end
end
