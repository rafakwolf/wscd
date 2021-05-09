inherited frmCadastroGrupo: TfrmCadastroGrupo
  Height = 285
  Width = 664
  Caption = 'frmCadastroGrupo'
  ClientHeight = 285
  ClientWidth = 664
  inherited sbStatus: TStatusBar
    Top = 267
    Width = 664
  end
  inherited pnBotoesPadrao: TPanel
    Width = 664
    ClientWidth = 664
    TabOrder = 2
  end
  object dbeNomeGrupo: TDBEdit[2]
    Left = 62
    Height = 33
    Top = 94
    Width = 305
    DataField = 'DESCRICAO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object dbeCodGrupo: TDBEdit[3]
    Left = 62
    Height = 33
    Top = 56
    Width = 105
    DataField = 'CODGRUPO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  inherited actlNavigateActions: TActionList[4]
    Left = 424
    Top = 64
  end
  inherited dsPadrao: TDataSource[5]
    DataSet = ZQuery1
    Left = 408
    Top = 160
  end
  object ZUpdateSQL1: TZUpdateSQL[6]
    DeleteSQL.Strings = (
      'DELETE FROM GRUPOS'
      'WHERE'
      '  GRUPOS.CODGRUPO = :OLD_CODGRUPO'
    )
    InsertSQL.Strings = (
      'INSERT INTO GRUPOS'
      '  (DESCRICAO)'
      'VALUES'
      '  (:DESCRICAO)'
    )
    ModifySQL.Strings = (
      'UPDATE GRUPOS SET'
      '  DESCRICAO = :DESCRICAO'
      'WHERE'
      '  GRUPOS.CODGRUPO = :OLD_CODGRUPO'
    )
    UseSequenceFieldForRefreshSQL = False
    Left = 260
    Top = 156
    ParamData = <    
      item
        DataType = ftUnknown
        Name = 'DESCRICAO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'OLD_CODGRUPO'
        ParamType = ptUnknown
      end>
  end
  object ZQuery1: TZQuery[7]
    Connection = DmPrincipal.ZConnection1
    UpdateObject = ZUpdateSQL1
    SQL.Strings = (
      'select * from GRUPOS'
    )
    Params = <>
    Left = 170
    Top = 150
  end
end
