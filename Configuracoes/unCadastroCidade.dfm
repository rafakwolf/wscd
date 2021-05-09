inherited frmCadastroCidade: TfrmCadastroCidade
  Left = 268
  Height = 308
  Top = 147
  Width = 599
  Caption = 'frmCadastroCidade'
  ClientHeight = 308
  ClientWidth = 599
  inherited sbStatus: TStatusBar
    Top = 290
    Width = 599
  end
  inherited pnBotoesPadrao: TPanel
    Width = 599
    ClientWidth = 599
    TabOrder = 2
  end
  object dbeNomeCidade: TDBEdit[2]
    Left = 26
    Height = 33
    Top = 94
    Width = 313
    DataField = 'DESCRICAO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object dbeCodCidade: TDBEdit[3]
    Left = 26
    Height = 33
    Top = 56
    Width = 97
    DataField = 'CODCIDADE'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  inherited actlNavigateActions: TActionList[4]
    Left = 56
    Top = 168
  end
  inherited dsPadrao: TDataSource[5]
    DataSet = ZQuery1
    Left = 408
    Top = 168
  end
  object ZQuery1: TZQuery[6]
    Connection = DmPrincipal.ZConnection1
    UpdateObject = ZUpdateSQL1
    SQL.Strings = (
      'select * from CIDADES'
    )
    Params = <>
    Left = 220
    Top = 184
  end
  object ZUpdateSQL1: TZUpdateSQL[7]
    DeleteSQL.Strings = (
      'DELETE FROM CIDADES'
      'WHERE'
      '  CIDADES.CODCIDADE = :OLD_CODCIDADE'
    )
    InsertSQL.Strings = (
      'INSERT INTO CIDADES'
      '  (DESCRICAO)'
      'VALUES'
      '  (:DESCRICAO)'
    )
    ModifySQL.Strings = (
      'UPDATE CIDADES SET'
      '  DESCRICAO = :DESCRICAO'
      'WHERE'
      '  CIDADES.CODCIDADE = :OLD_CODCIDADE'
    )
    UseSequenceFieldForRefreshSQL = False
    Left = 312
    Top = 176
    ParamData = <    
      item
        DataType = ftUnknown
        Name = 'DESCRICAO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'OLD_CODCIDADE'
        ParamType = ptUnknown
      end>
  end
end
