inherited frmUsuarioItemMenu: TfrmUsuarioItemMenu
  Left = 374
  Height = 347
  Top = 210
  Width = 898
  Caption = 'frmUsuarioItemMenu'
  ClientHeight = 347
  ClientWidth = 898
  OnClose = FormClose
  inherited sbStatus: TStatusBar
    Top = 329
    Width = 898
  end
  inherited pnBotoesPadrao: TPanel
    Width = 898
    ClientWidth = 898
  end
  object dbeSenha: TDBEdit[2]
    Left = 96
    Height = 21
    Top = 120
    Width = 121
    DataField = 'SENHA'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    PasswordChar = '*'
    ShowHint = True
    TabOrder = 4
  end
  object dbeLogin: TDBEdit[3]
    Left = 96
    Height = 21
    Top = 83
    Width = 280
    DataField = 'LOGIN'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object dbeNomeUsuario: TDBEdit[4]
    Left = 96
    Height = 21
    Top = 46
    Width = 417
    DataField = 'NOME'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object DBLookupComboBox1: TDBLookupComboBox[5]
    Left = 96
    Height = 20
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
    Height = 16
    Top = 52
    Width = 36
    Caption = 'Nome'
    ParentColor = False
  end
  object Label2: TLabel[7]
    Left = 48
    Height = 16
    Top = 91
    Width = 33
    Caption = 'Login'
    ParentColor = False
  end
  object Label3: TLabel[8]
    Left = 48
    Height = 16
    Top = 128
    Width = 38
    Caption = 'Senha'
    ParentColor = False
  end
  object Label4: TLabel[9]
    Left = 48
    Height = 16
    Top = 168
    Width = 32
    Caption = 'Perfil'
    ParentColor = False
  end
  inherited actlNavigateActions: TActionList[10]
    Left = 416
    Top = 104
  end
  inherited dsPadrao: TDataSource[11]
    DataSet = ZQuery1
    Left = 504
    Top = 168
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
        Name = 'NOME'
      end    
      item
        Name = 'LOGIN'
      end    
      item
        Name = 'SENHA'
      end    
      item
        Name = 'IDPERFIL'
      end    
      item
        Name = 'OLD_IDUSUARIOS'
      end>
  end
  object ZReadOnlyQuery1: TZReadOnlyQuery[14]
    Connection = DmPrincipal.ZConnection1
    SQL.Strings = (
      'select * from PERFIL'
    )
    Params = <>
    Left = 680
    Top = 79
  end
  object DataSource1: TDataSource[15]
    DataSet = ZReadOnlyQuery1
    Left = 712
    Top = 168
  end
end
