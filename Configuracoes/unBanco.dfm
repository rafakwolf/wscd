inherited frmBanco: TfrmBanco
  Height = 282
  Width = 640
  Caption = 'frmBanco'
  ClientHeight = 282
  ClientWidth = 640
  inherited sbStatus: TStatusBar
    Height = 17
    Top = 265
    Width = 640
  end
  inherited pnBotoesPadrao: TPanel
    Width = 640
    ClientWidth = 640
    TabOrder = 2
  end
  object dbeCodCompensacao: TDBEdit[2]
    Left = 96
    Height = 27
    Hint = 'Código de compensação'
    Top = 54
    Width = 105
    DataField = 'IDBANCO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object dbeBanco: TDBEdit[3]
    Left = 96
    Height = 27
    Hint = 'Nome do banco'
    Top = 88
    Width = 321
    DataField = 'BANCO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  inherited actlNavigateActions: TActionList[4]
    Left = 72
    Top = 176
  end
  inherited dsPadrao: TDataSource[5]
    DataSet = ZQuery1
    Left = 480
    Top = 160
  end
  object ZQuery1: TZQuery[6]
    Connection = DmPrincipal.ZConnection1
    UpdateObject = ZUpdateSQL1
    SQL.Strings = (
      'select * from BANCO'
    )
    Params = <>
    Left = 216
    Top = 160
  end
  object ZUpdateSQL1: TZUpdateSQL[7]
    DeleteSQL.Strings = (
      'DELETE FROM BANCO'
      'WHERE'
      '  BANCO.IDBANCO = :OLD_IDBANCO'
    )
    InsertSQL.Strings = (
      'INSERT INTO BANCO'
      '  (BANCO)'
      'VALUES'
      '  (:BANCO)'
    )
    ModifySQL.Strings = (
      'UPDATE BANCO SET'
      '  BANCO = :BANCO'
      'WHERE'
      '  BANCO.IDBANCO = :OLD_IDBANCO'
    )
    UseSequenceFieldForRefreshSQL = False
    Left = 306
    Top = 165
    ParamData = <    
      item
        DataType = ftUnknown
        Name = 'BANCO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'OLD_IDBANCO'
        ParamType = ptUnknown
      end>
  end
end
