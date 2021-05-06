inherited frmCadastroCFOP: TfrmCadastroCFOP
  Width = 664
  Caption = 'frmCadastroCFOP'
  ClientWidth = 664
  Font.Name = 'Verdana'
  inherited sbStatus: TStatusBar
    Width = 664
  end
  inherited pnBotoesPadrao: TPanel
    Width = 664
    ClientWidth = 664
    TabOrder = 3
  end
  object dbeNomeCfop: TDBEdit[2]
    Left = 79
    Height = 33
    Top = 96
    Width = 449
    DataField = 'OPERACAO'
    DataSource = dsPadrao
    CharCase = ecNormal
    Font.CharSet = ANSI_CHARSET
    MaxLength = 0
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object dbeCodCfop: TDBEdit[3]
    Left = 79
    Height = 33
    Top = 56
    Width = 218
    DataField = 'NUMERO'
    DataSource = dsPadrao
    CharCase = ecNormal
    Font.CharSet = ANSI_CHARSET
    MaxLength = 0
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object dbmCfNota: TDBMemo[4]
    Left = 79
    Height = 161
    Top = 136
    Width = 449
    DataField = 'CFNOTA'
    DataSource = dsPadrao
    Font.CharSet = ANSI_CHARSET
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  inherited actlNavigateActions: TActionList[5]
    Left = 128
    Top = 180
    inherited actPrint: TAction
      Hint = 'Listagem'
      OnExecute = actPrintExecute
      ShortCut = 0
    end
  end
  inherited dsPadrao: TDataSource[6]
    DataSet = ZQuery1
    Left = 392
    Top = 168
  end
  object ZQuery1: TZQuery[7]
    Connection = DmPrincipal.ZConnection1
    UpdateObject = ZUpdateSQL1
    SQL.Strings = (
      'select * from CFOP'
    )
    Params = <>
    Left = 250
    Top = 186
  end
  object ZUpdateSQL1: TZUpdateSQL[8]
    DeleteSQL.Strings = (
      'DELETE FROM CFOP'
      'WHERE'
      '  CFOP.id = :OLD_id'
    )
    InsertSQL.Strings = (
      'INSERT INTO CFOP'
      '  (NUMERO, OPERACAO, CFNOTA)'
      'VALUES'
      '  (:NUMERO, :OPERACAO, :CFNOTA)'
    )
    ModifySQL.Strings = (
      'UPDATE CFOP SET'
      '  NUMERO = :NUMERO,'
      '  OPERACAO = :OPERACAO,'
      '  CFNOTA = :CFNOTA'
      'WHERE'
      '  CFOP.id = :OLD_id'
    )
    UseSequenceFieldForRefreshSQL = False
    Left = 314
    Top = 191
    ParamData = <    
      item
        DataType = ftUnknown
        Name = 'NUMERO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'OPERACAO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'CFNOTA'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'OLD_id'
        ParamType = ptUnknown
      end>
  end
end
