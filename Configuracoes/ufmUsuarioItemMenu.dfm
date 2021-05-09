inherited frmUsuarioItemMenu: TfrmUsuarioItemMenu
  Left = 241
  Height = 260
  Top = 108
  Width = 779
  Caption = 'frmUsuarioItemMenu'
  ClientHeight = 260
  ClientWidth = 779
  inherited sbStatus: TStatusBar
    Top = 242
    Width = 779
  end
  inherited pnBotoesPadrao: TPanel
    Width = 779
    ClientWidth = 779
  end
  object dbeSenha: TDBEdit[2]
    Left = 64
    Height = 33
    Top = 120
    Width = 121
    DataField = 'SENHA'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    PasswordChar = '*'
    ShowHint = True
    TabOrder = 4
  end
  object dbeLogin: TDBEdit[3]
    Left = 64
    Height = 33
    Top = 83
    Width = 280
    DataField = 'LOGIN'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object dbeNomeUsuario: TDBEdit[4]
    Left = 64
    Height = 33
    Top = 46
    Width = 417
    DataField = 'NOME'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  inherited actlNavigateActions: TActionList[5]
    Left = 320
    Top = 128
  end
  inherited dsPadrao: TDataSource[6]
    DataSet = ZQuery1
    Left = 488
    Top = 120
  end
  object ZQuery1: TZQuery[7]
    Connection = DmPrincipal.ZConnection1
    UpdateObject = ZUpdateSQL1
    SQL.Strings = (
      'select * from USUARIOS'
    )
    Params = <>
    Left = 556
    Top = 79
  end
  object ZUpdateSQL1: TZUpdateSQL[8]
    DeleteSQL.Strings = (
      'DELETE FROM USUARIOS'
      'WHERE'
      '  USUARIOS.IDUSUARIOS = :OLD_IDUSUARIOS'
    )
    InsertSQL.Strings = (
      'INSERT INTO USUARIOS'
      '  (NOME, LOGIN, SENHA, IDPERFIL)'
      'VALUES'
      '  (:NOME, :LOGIN, :SENHA, :IDPERFIL)'
    )
    ModifySQL.Strings = (
      'UPDATE USUARIOS SET'
      '  NOME = :NOME,'
      '  LOGIN = :LOGIN,'
      '  SENHA = :SENHA,'
      '  IDPERFIL = :IDPERFIL'
      'WHERE'
      '  USUARIOS.IDUSUARIOS = :OLD_IDUSUARIOS'
    )
    UseSequenceFieldForRefreshSQL = False
    Left = 612
    Top = 147
    ParamData = <    
      item
        DataType = ftUnknown
        Name = 'NOME'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'LOGIN'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'SENHA'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'IDPERFIL'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'OLD_IDUSUARIOS'
        ParamType = ptUnknown
      end>
  end
end
