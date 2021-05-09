inherited frmCadastroUnidade: TfrmCadastroUnidade
  Height = 278
  Width = 664
  Caption = 'frmCadastroUnidade'
  ClientHeight = 278
  ClientWidth = 664
  inherited sbStatus: TStatusBar
    Top = 260
    Width = 664
  end
  inherited pnBotoesPadrao: TPanel
    Width = 664
    ClientWidth = 664
    TabOrder = 2
  end
  object dbeNomeUnidade: TDBEdit[2]
    Left = 70
    Height = 33
    Top = 95
    Width = 297
    DataField = 'DESCRICAO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object dbeCodUnidade: TDBEdit[3]
    Left = 70
    Height = 33
    Top = 56
    Width = 105
    DataField = 'CODUNIDADE'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  inherited actlNavigateActions: TActionList[4]
    Left = 144
    Top = 192
  end
  inherited dsPadrao: TDataSource[5]
    DataSet = ZQuery1
    Left = 440
    Top = 176
  end
  object ZQuery1: TZQuery[6]
    Connection = DmPrincipal.ZConnection1
    UpdateObject = ZUpdateSQL1
    SQL.Strings = (
      'select * from UNIDADES'
    )
    Params = <>
    Left = 234
    Top = 156
  end
  object ZUpdateSQL1: TZUpdateSQL[7]
    DeleteSQL.Strings = (
      'DELETE FROM UNIDADES'
      'WHERE'
      '  UNIDADES.CODUNIDADE = :OLD_CODUNIDADE'
    )
    InsertSQL.Strings = (
      'INSERT INTO UNIDADES'
      '  (DESCRICAO)'
      'VALUES'
      '  (:DESCRICAO)'
    )
    ModifySQL.Strings = (
      'UPDATE UNIDADES SET'
      '  DESCRICAO = :DESCRICAO'
      'WHERE'
      '  UNIDADES.CODUNIDADE = :OLD_CODUNIDADE'
    )
    UseSequenceFieldForRefreshSQL = False
    Left = 328
    Top = 168
    ParamData = <    
      item
        DataType = ftUnknown
        Name = 'DESCRICAO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'OLD_CODUNIDADE'
        ParamType = ptUnknown
      end>
  end
end
