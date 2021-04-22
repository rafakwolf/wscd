object frmAcesso: TfrmAcesso
  Left = 234
  Top = 126
  HelpContext = 1
  ClientHeight = 221
  ClientWidth = 299
  Caption = 'Acesso'
  BorderStyle = bsNone
  OldCreateOrder = False
  ShowHint = True
  KeyPreview = True
  MonitoredKeys.Keys = <>
  Movable = False
  AlignmentControl = uniAlignmentClient
  PixelsPerInch = 96
  TextHeight = 13
  object btnOK: TBitBtn
    Left = 8
    Top = 117
    Width = 271
    Height = 32
    Hint = 'Efetuar login'
    ShowHint = True
    Caption = '<i class="fa fa-check-circle" aria-hidden="true"></i> Entrar'
    ParentFont = False
    Font.Height = -16
    TabOrder = 1
    ClientEvents.ExtEvents.Strings = (
      
        'added=function added(sender, container, pos, eOpts)'#13#10'{'#13#10'  debugg' +
        'er; '#13#10'  sender.addCls('#39'btn btn-primary'#39');'#13#10'}')
    OnClick = btnOkClick
  end
  object edtUsuario: TEdit
    Left = 8
    Top = 21
    Width = 271
    Height = 33
    Hint = 'Usu'#225'rio'
    ShowHint = True
    MaxLength = 10
    Text = ''
    TabOrder = 0
  end
  object edtSenha: TEdit
    Left = 8
    Top = 67
    Width = 271
    Height = 35
    Hint = ''
    ShowHint = True
    PasswordChar = '*'
    Text = ''
    TabOrder = 2
  end
  object ckbLembrarLogin: TCheckBox
    Left = 112
    Top = 173
    Width = 73
    Height = 17
    Hint = ''
    ShowHint = True
    Caption = 'Lembrar'
    ParentFont = False
    Font.Height = -13
    TabOrder = 3
    ClientEvents.ExtEvents.Strings = (
      
        'activate=function activate(sender, eOpts)'#13#10'{'#13#10'  sender.addCls('#39'c' +
        'heckbox'#39');'#13#10'}')
  end
end
