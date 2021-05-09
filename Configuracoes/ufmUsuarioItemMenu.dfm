inherited frmUsuarioItemMenu: TfrmUsuarioItemMenu
  Left = 241
  Height = 260
  Top = 108
  Width = 779
  Caption = 'frmUsuarioItemMenu'
  ClientHeight = 260
  ClientWidth = 779
  OnClose = FormClose
  inherited sbStatus: TStatusBar
    Top = 242
    Width = 779
  end
  inherited pnBotoesPadrao: TPanel
    Width = 779
    ClientWidth = 779
  end
  object dbeSenha: TDBEdit[2]
    Left = 96
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
    Left = 96
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
    Left = 96
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
  object DBLookupComboBox1: TDBLookupComboBox[5]
    Left = 96
    Height = 33
    Top = 160
    Width = 352
    DataField = 'IDPERFIL'
    DataSource = dsPadrao
    KeyField = 'IDPERFIL'
    ListField = 'PERFIL'
    ListFieldIndex = 0
    ListSource = DataSource1
    LookupCache = False
    TabOrder = 5
  end
  object Label1: TLabel[6]
    Left = 49
    Height = 15
    Top = 52
    Width = 35
    Caption = 'Nome'
    ParentColor = False
  end
  object Label2: TLabel[7]
    Left = 48
    Height = 15
    Top = 91
    Width = 33
    Caption = 'Login'
    ParentColor = False
  end
  object Label3: TLabel[8]
    Left = 48
    Height = 15
    Top = 128
    Width = 37
    Caption = 'Senha'
    ParentColor = False
  end
  object Label4: TLabel[9]
    Left = 48
    Height = 15
    Top = 168
    Width = 31
    Caption = 'Perfil'
    ParentColor = False
  end
  inherited actlNavigateActions: TActionList[10]
    Left = 400
    Top = 104
  end
  inherited dsPadrao: TDataSource[11]
    DataSet = ZQuery1
    Left = 496
    Top = 144
  end
  object ZQuery1: TZQuery[12]
    Connection = DmPrincipal.ZConnection1
    UpdateObject = ZUpdateSQL1
    SQL.Strings = (
      'select * from USUARIOS'
    )
    Params = <>
    Left = 556
    Top = 79
  end
  object ZUpdateSQL1: TZUpdateSQL[13]
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
  object ZReadOnlyQuery1: TZReadOnlyQuery[14]
    Connection = DmPrincipal.ZConnection1
    SQL.Strings = (
      'select * from PERFIL'
    )
    Params = <>
    Left = 648
    Top = 63
  end
  object DataSource1: TDataSource[15]
    DataSet = ZReadOnlyQuery1
    Left = 670
    Top = 129
  end
end
