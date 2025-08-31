inherited frmRecibo: TfrmRecibo
  Left = 291
  Top = 181
  Caption = 'frmRecibo'
  Font.Name = 'Verdana'
  inherited pnBotoesPadrao: TPanel
    TabOrder = 5
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
  object lbRecebedor: TLabel[2]
    Left = 31
    Height = 16
    Top = 93
    Width = 68
    Caption = 'Recebedor'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbRefente: TLabel[3]
    Left = 36
    Height = 16
    Top = 192
    Width = 63
    Caption = 'Referente'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbValor: TLabel[4]
    Left = 62
    Height = 16
    Top = 221
    Width = 33
    Caption = 'Valor'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbValorExtenso: TLabel[5]
    Left = 12
    Height = 16
    Top = 257
    Width = 89
    Caption = 'Valor extenso'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object dbData: TDBEdit[6]
    Left = 108
    Height = 21
    Top = 46
    Width = 186
    DataField = 'DATA'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object dbRecebedor: TDBEdit[7]
    Left = 108
    Height = 21
    Top = 89
    Width = 500
    DataField = 'RECEBEDOR'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object dbValor: TDBEdit[8]
    Left = 108
    Height = 21
    Top = 217
    Width = 134
    DataField = 'VALOR'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnExit = dbValorExit
  end
  object dbReferente: TDBMemo[9]
    Left = 108
    Height = 65
    Top = 143
    Width = 500
    DataField = 'REFERENTE'
    DataSource = dsPadrao
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object dbValorExtenso: TDBMemo[10]
    Left = 108
    Height = 65
    Top = 255
    Width = 500
    DataField = 'VALOREXTENSO'
    DataSource = dsPadrao
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
  inherited actlNavigateActions: TActionList[11]
    Left = 696
    Top = 40
    inherited actPrint: TAction
      OnExecute = actPrintExecute
      ShortCut = 0
    end
  end
  inherited dsPadrao: TDataSource[12]
    DataSet = ZQuery1
    Left = 608
    Top = 46
  end
  object ZQuery1: TZQuery[13]
    Connection = DmPrincipal.ZConnection1
    UpdateObject = ZUpdateSQL1
    SQL.Strings = (
      'select * from RECIBO'
    )
    Params = <>
    Left = 448
    Top = 48
  end
  object ZUpdateSQL1: TZUpdateSQL[14]
    DeleteSQL.Strings = (
      'DELETE FROM RECIBO'
      'WHERE'
      '  RECIBO.IDRECIBO = :OLD_IDRECIBO'
    )
    InsertSQL.Strings = (
      'INSERT INTO RECIBO'
      '  (DATA, RECEBEDOR, REFERENTE, VALOR, VALOREXTENSO)'
      'VALUES'
      '  (:DATA, :RECEBEDOR, :REFERENTE, :VALOR, :VALOREXTENSO)'
    )
    ModifySQL.Strings = (
      'UPDATE RECIBO SET'
      '  DATA = :DATA,'
      '  RECEBEDOR = :RECEBEDOR,'
      '  REFERENTE = :REFERENTE,'
      '  VALOR = :VALOR,'
      '  VALOREXTENSO = :VALOREXTENSO'
      'WHERE'
      '  RECIBO.IDRECIBO = :OLD_IDRECIBO'
    )
    UseSequenceFieldForRefreshSQL = False
    Left = 528
    Top = 40
    ParamData = <    
      item
        Name = 'DATA'
      end    
      item
        Name = 'RECEBEDOR'
      end    
      item
        Name = 'REFERENTE'
      end    
      item
        Name = 'VALOR'
      end    
      item
        Name = 'VALOREXTENSO'
      end    
      item
        Name = 'OLD_IDRECIBO'
      end>
  end
end
