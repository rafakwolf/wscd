inherited frmAliquota: TfrmAliquota
  Left = 410
  Height = 303
  Top = 188
  Width = 597
  Caption = 'frmAliquota'
  ClientHeight = 303
  ClientWidth = 597
  inherited sbStatus: TStatusBar
    Top = 285
    Width = 597
  end
  inherited pnBotoesPadrao: TPanel
    Width = 597
    ClientWidth = 597
    TabOrder = 2
  end
  object dbeAliquota: TDBEdit[2]
    Left = 80
    Height = 33
    Top = 92
    Width = 273
    DataField = 'DESCRICAO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object dbeCodAliquota: TDBEdit[3]
    Left = 80
    Height = 33
    Top = 56
    Width = 121
    DataField = 'CODALIQUOTA'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  inherited actlNavigateActions: TActionList[4]
    Top = 168
  end
  inherited dsPadrao: TDataSource[5]
    DataSet = ZQuery1
    Left = 320
    Top = 168
  end
  object ZQuery1: TZQuery[6]
    Connection = DmPrincipal.ZConnection1
    UpdateObject = ZUpdateSQL1
    SQL.Strings = (
      'select * from ALIQUOTAS'
    )
    Params = <>
    Left = 176
    Top = 152
  end
  object ZUpdateSQL1: TZUpdateSQL[7]
    DeleteSQL.Strings = (
      'DELETE FROM ALIQUOTAS'
      'WHERE'
      '  ALIQUOTAS.CODALIQUOTA = :OLD_CODALIQUOTA'
    )
    InsertSQL.Strings = (
      'INSERT INTO ALIQUOTAS'
      '  (DESCRICAO)'
      'VALUES'
      '  (:DESCRICAO)'
    )
    ModifySQL.Strings = (
      'UPDATE ALIQUOTAS SET'
      '  DESCRICAO = :DESCRICAO'
      'WHERE'
      '  ALIQUOTAS.CODALIQUOTA = :OLD_CODALIQUOTA'
    )
    UseSequenceFieldForRefreshSQL = False
    Left = 227
    Top = 180
    ParamData = <    
      item
        DataType = ftUnknown
        Name = 'DESCRICAO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'OLD_CODALIQUOTA'
        ParamType = ptUnknown
      end>
  end
end
