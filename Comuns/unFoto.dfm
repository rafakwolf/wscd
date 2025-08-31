inherited frmFoto: TfrmFoto
  Left = 481
  Height = 281
  Top = 222
  Width = 385
  BorderStyle = bsToolWindow
  Caption = 'Web-cam'
  ClientHeight = 281
  ClientWidth = 385
  OnDestroy = FormDestroy
  OnShow = FormShow
  object btnOK: TBitBtn[0]
    Left = 120
    Height = 32
    Top = 208
    Width = 81
    Caption = '&OK'
    ModalResult = 1
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object btnCancel: TBitBtn[1]
    Left = 208
    Height = 32
    Top = 208
    Width = 81
    Caption = '&Cancelar'
    ModalResult = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object grpFoto: TGroupBox[2]
    Left = 8
    Height = 193
    Top = 8
    Width = 281
    Caption = ' Imagem '
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
end
