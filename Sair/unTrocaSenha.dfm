object frmTrocaSenha: TfrmTrocaSenha
  Left = 221
  Height = 233
  Top = 135
  Width = 332
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmTrocaSenha'
  ClientHeight = 233
  ClientWidth = 332
  Font.CharSet = ANSI_CHARSET
  Font.Height = -12
  KeyPreview = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  ShowHint = True
  LCLVersion = '2.0.12.0'
  object btGrava: TSpeedButton
    Left = 56
    Height = 25
    Top = 160
    Width = 81
    Caption = '&OK'
    Color = clWindow
    OnClick = btGravaClick
    ShowHint = True
    ParentShowHint = False
  end
  object btCancel: TSpeedButton
    Left = 144
    Height = 25
    Top = 160
    Width = 81
    Caption = '&Cancelar'
    Color = clWindow
    OnClick = btCancelClick
    ShowHint = True
    ParentShowHint = False
  end
  object lbSenhaAtu: TLabel
    Left = 13
    Height = 14
    Top = 51
    Width = 66
    Caption = 'Senha atual'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbNovaSenha: TLabel
    Left = 14
    Height = 14
    Top = 84
    Width = 65
    Caption = 'Nova senha'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbConfirma: TLabel
    Left = 11
    Height = 14
    Top = 116
    Width = 69
    Caption = 'Confirmação'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object edAtual: TEdit
    Left = 80
    Height = 31
    Top = 48
    Width = 121
    EchoMode = emPassword
    MaxLength = 10
    ParentShowHint = False
    PasswordChar = '*'
    ShowHint = True
    TabOrder = 0
  end
  object edNova: TEdit
    Left = 80
    Height = 31
    Top = 80
    Width = 121
    EchoMode = emPassword
    MaxLength = 10
    ParentShowHint = False
    PasswordChar = '*'
    ShowHint = True
    TabOrder = 1
  end
  object edConfirma: TEdit
    Left = 80
    Height = 31
    Top = 112
    Width = 121
    EchoMode = emPassword
    MaxLength = 10
    ParentShowHint = False
    PasswordChar = '*'
    ShowHint = True
    TabOrder = 2
  end
  object sqldUsuarios: TSQLQuery
    FieldDefs = <>
    Params = <    
      item
        DataType = ftString
        Name = 'SENHA'
        ParamType = ptInput
      end    
      item
        DataType = ftString
        Name = 'LOGIN'
        ParamType = ptInput
      end>
    Left = 70
  end
  object sqldSenhaAtual: TSQLQuery
    FieldDefs = <>
    Params = <    
      item
        DataType = ftString
        Name = 'pLOGIN'
        ParamType = ptInput
      end    
      item
        DataType = ftString
        Name = 'pSENHA'
        ParamType = ptInput
      end>
    Left = 152
    object sqldSenhaAtualUSERS: TIntegerField
      FieldKind = fkData
      FieldName = 'USERS'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
  end
end
