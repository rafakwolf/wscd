object frmTrocaSenha: TfrmTrocaSenha
  Left = 221
  Top = 135
  ClientHeight = 193
  ClientWidth = 233
  Caption = 'frmTrocaSenha'
  OnShow = FormShow
  BorderStyle = bsSingle
  OldCreateOrder = False
  ShowHint = True
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  BorderIcons = [biSystemMenu]
  KeyPreview = True
  MonitoredKeys.Keys = <>
  Font.Charset = ANSI_CHARSET
  Font.Height = -12
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object btGrava: TUniSpeedButton
    Left = 56
    Top = 160
    Width = 81
    Height = 25
    Hint = ''
    ShowHint = True
    Caption = '&OK'
    ParentColor = False
    Color = clWindow
    TabOrder = 3
    OnClick = btGravaClick
  end
  object btCancel: TUniSpeedButton
    Left = 144
    Top = 160
    Width = 81
    Height = 25
    Hint = ''
    ShowHint = True
    Caption = '&Cancelar'
    ParentColor = False
    Color = clWindow
    TabOrder = 4
    OnClick = btCancelClick
  end
  object lbSenhaAtu: TUniLabel
    Left = 13
    Top = 51
    Width = 64
    Height = 14
    Hint = ''
    ShowHint = True
    Caption = 'Senha atual'
    TabOrder = 5
  end
  object lbNovaSenha: TUniLabel
    Left = 14
    Top = 84
    Width = 63
    Height = 14
    Hint = ''
    ShowHint = True
    Caption = 'Nova senha'
    TabOrder = 6
  end
  object lbConfirma: TUniLabel
    Left = 11
    Top = 116
    Width = 66
    Height = 14
    Hint = ''
    ShowHint = True
    Caption = 'Confirma'#231#227'o'
    TabOrder = 7
  end
  object edAtual: TUniEdit
    Left = 80
    Top = 48
    Width = 121
    Hint = ''
    ShowHint = True
    PasswordChar = '*'
    MaxLength = 10
    Text = ''
    TabOrder = 0
  end
  object edNova: TUniEdit
    Left = 80
    Top = 80
    Width = 121
    Hint = ''
    ShowHint = True
    PasswordChar = '*'
    MaxLength = 10
    Text = ''
    TabOrder = 1
  end
  object edConfirma: TUniEdit
    Left = 80
    Top = 112
    Width = 121
    Hint = ''
    ShowHint = True
    PasswordChar = '*'
    MaxLength = 10
    Text = ''
    TabOrder = 2
  end
  object sqldUsuarios: TSQLDataSet
    CommandText = 'update USUARIOS set '#13#10'SENHA = :SENHA'#13#10'where LOGIN = :LOGIN'
    MaxBlobSize = -1
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
  object sqldSenhaAtual: TSQLDataSet
    CommandText = 
      'select count(1) as USERS from USUARIOS u '#13#10'where u.LOGIN = :pLOG' +
      'IN'#13#10'and u.SENHA = :pSENHA'
    MaxBlobSize = -1
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
      FieldName = 'USERS'
      Required = True
    end
  end
end
