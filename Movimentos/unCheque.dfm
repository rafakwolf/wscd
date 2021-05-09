inherited frmCheque: TfrmCheque
  Left = 281
  Height = 401
  Top = 155
  Width = 648
  Caption = 'frmCheque'
  ClientHeight = 401
  ClientWidth = 648
  OnClose = FormClose
  inherited sbStatus: TStatusBar
    Top = 383
    Width = 648
  end
  inherited pnBotoesPadrao: TPanel
    Width = 648
    ClientWidth = 648
    TabOrder = 12
  end
  object lbBaixado: TLabel[2]
    Left = 147
    Height = 15
    Top = 231
    Width = 60
    Caption = 'lbBaixado'
    Font.CharSet = ANSI_CHARSET
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object btnBaixar: TBitBtn[3]
    Left = 440
    Height = 31
    Top = 222
    Width = 81
    Action = actBaixar
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
  end
  object dbeDataBaixado: TDBEdit[4]
    Left = 16
    Height = 33
    Top = 224
    Width = 121
    DataField = 'DATABAIXADO'
    DataSource = dsPadrao
    ReadOnly = True
    CharCase = ecNormal
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
  end
  object dbeBandMagnetica: TDBEdit[5]
    Left = 120
    Height = 33
    Top = 60
    Width = 225
    DataField = 'BANDAMAGNETICA'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object dbeVenda: TDBEdit[6]
    Left = 336
    Height = 33
    Top = 142
    Width = 89
    DataField = 'VENDA'
    DataSource = dsPadrao
    ReadOnly = True
    CharCase = ecNormal
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
  end
  object dbeValor: TDBEdit[7]
    Left = 400
    Height = 33
    Top = 101
    Width = 121
    DataField = 'VALOR'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
  object dbdBomPara: TDBEdit[8]
    Left = 176
    Height = 33
    Top = 142
    Width = 153
    DataField = 'BOMPARA'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
  end
  object dbeAgencia: TDBEdit[9]
    Left = 16
    Height = 33
    Top = 101
    Width = 121
    DataField = 'AGENCIA'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object dbeConta: TDBEdit[10]
    Left = 144
    Height = 33
    Top = 101
    Width = 121
    DataField = 'CONTA'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object dbeNumero: TDBEdit[11]
    Left = 272
    Height = 33
    Top = 101
    Width = 121
    DataField = 'NUMERO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object dbdDataEmissao: TDBEdit[12]
    Left = 16
    Height = 33
    Top = 142
    Width = 153
    DataField = 'DATAEMISSAO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
  end
  object dbeCompra: TDBEdit[13]
    Left = 432
    Height = 33
    Top = 142
    Width = 89
    DataField = 'COMPRA'
    DataSource = dsPadrao
    ReadOnly = True
    CharCase = ecNormal
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
  end
  inherited actlNavigateActions: TActionList[14]
    Left = 120
    Top = 280
    inherited actPrint: TAction
      Hint = 'Cheques emitidos'
      OnExecute = actPrintExecute
      ShortCut = 0
    end
    object actBaixar: TAction[8]
      Category = 'Navigate'
      Caption = 'Baixar'
      Hint = 'Baixar cheque'
      OnExecute = actBaixarExecute
    end
    object actEstornarBaixa: TAction[9]
      Category = 'Navigate'
      Caption = 'Estornar baixa'
      Hint = 'Estornar cheque baixado'
      OnExecute = actEstornarBaixaExecute
    end
  end
  inherited dsPadrao: TDataSource[15]
    DataSet = ZQuery1
    Left = 424
    Top = 272
  end
  object ZUpdateSQL1: TZUpdateSQL[16]
    DeleteSQL.Strings = (
      'DELETE FROM CHEQUE'
      'WHERE'
      '  CHEQUE.IDCHEQUE = :OLD_IDCHEQUE'
    )
    InsertSQL.Strings = (
      'INSERT INTO CHEQUE'
      '  (IDBANCO, IDCLIENTE, IDFORN, BANDAMAGNETICA, AGENCIA, CONTA, NUMERO, '
      '   DATAEMISSAO, BOMPARA, VALOR, VENDA, COMPRA, REPASSADO, DATABAIXADO)'
      'VALUES'
      '  (:IDBANCO, :IDCLIENTE, :IDFORN, :BANDAMAGNETICA, :AGENCIA, :CONTA, :NUMERO, '
      '   :DATAEMISSAO, :BOMPARA, :VALOR, :VENDA, :COMPRA, :REPASSADO, :DATABAIXADO)'
    )
    ModifySQL.Strings = (
      'UPDATE CHEQUE SET'
      '  IDBANCO = :IDBANCO,'
      '  IDCLIENTE = :IDCLIENTE,'
      '  IDFORN = :IDFORN,'
      '  BANDAMAGNETICA = :BANDAMAGNETICA,'
      '  AGENCIA = :AGENCIA,'
      '  CONTA = :CONTA,'
      '  NUMERO = :NUMERO,'
      '  DATAEMISSAO = :DATAEMISSAO,'
      '  BOMPARA = :BOMPARA,'
      '  VALOR = :VALOR,'
      '  VENDA = :VENDA,'
      '  COMPRA = :COMPRA,'
      '  REPASSADO = :REPASSADO,'
      '  DATABAIXADO = :DATABAIXADO'
      'WHERE'
      '  CHEQUE.IDCHEQUE = :OLD_IDCHEQUE'
    )
    UseSequenceFieldForRefreshSQL = False
    Left = 312
    Top = 272
    ParamData = <    
      item
        DataType = ftUnknown
        Name = 'IDBANCO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'IDCLIENTE'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'IDFORN'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'BANDAMAGNETICA'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'AGENCIA'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'CONTA'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'NUMERO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'DATAEMISSAO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'BOMPARA'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'VALOR'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'VENDA'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'COMPRA'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'REPASSADO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'DATABAIXADO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'OLD_IDCHEQUE'
        ParamType = ptUnknown
      end>
  end
  object ZQuery1: TZQuery[17]
    Connection = DmPrincipal.ZConnection1
    UpdateObject = ZUpdateSQL1
    SQL.Strings = (
      'select * from CHEQUE'
    )
    Params = <>
    Left = 232
    Top = 272
  end
end
