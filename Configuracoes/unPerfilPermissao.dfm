inherited frmPerfilPermissao: TfrmPerfilPermissao
  Left = 256
  Height = 265
  Top = 188
  Width = 606
  Caption = 'frmPerfilPermissao'
  ClientHeight = 265
  ClientWidth = 606
  inherited sbStatus: TStatusBar
    Top = 247
    Width = 606
  end
  inherited pnBotoesPadrao: TPanel
    Width = 606
    ClientWidth = 606
  end
  object dbePerfil: TDBEdit[2]
    Left = 48
    Height = 33
    Top = 51
    Width = 409
    DataField = 'PERFIL'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  inherited actlNavigateActions: TActionList[3]
    Left = 64
    Top = 128
  end
  inherited dsPadrao: TDataSource[4]
    DataSet = ZQuery1
    Left = 400
    Top = 136
  end
  object ZUpdateSQL1: TZUpdateSQL[5]
    DeleteSQL.Strings = (
      'DELETE FROM PERFIL'
      'WHERE'
      '  PERFIL.IDPERFIL = :OLD_IDPERFIL'
    )
    InsertSQL.Strings = (
      'INSERT INTO PERFIL'
      '  (PERFIL)'
      'VALUES'
      '  (:PERFIL)'
    )
    ModifySQL.Strings = (
      'UPDATE PERFIL SET'
      '  PERFIL = :PERFIL'
      'WHERE'
      '  PERFIL.IDPERFIL = :OLD_IDPERFIL'
    )
    UseSequenceFieldForRefreshSQL = False
    Left = 212
    Top = 120
    ParamData = <    
      item
        DataType = ftUnknown
        Name = 'PERFIL'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'OLD_IDPERFIL'
        ParamType = ptUnknown
      end>
  end
  object ZQuery1: TZQuery[6]
    Connection = DmPrincipal.ZConnection1
    UpdateObject = ZUpdateSQL1
    SQL.Strings = (
      'select * from PERFIL'
    )
    Params = <>
    Left = 314
    Top = 117
  end
end
