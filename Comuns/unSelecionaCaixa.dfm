object frmSelecionaCaixa: TfrmSelecionaCaixa
  Left = 444
  Height = 189
  Top = 264
  Width = 328
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Selecione a conta caixa'
  ClientHeight = 189
  ClientWidth = 328
  Font.CharSet = ANSI_CHARSET
  OnClose = FormClose
  OnCreate = FormCreate
  object lbCaixa: TLabel
    Left = 9
    Height = 16
    Top = 8
    Width = 71
    Caption = 'Conta caixa'
    ParentColor = False
  end
  object btnOk: TBitBtn
    Left = 56
    Height = 25
    Top = 144
    Width = 73
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object btnCancel: TBitBtn
    Left = 136
    Height = 25
    Top = 144
    Width = 73
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 2
  end
  object dblcbCaixa: TDBLookupComboBox
    Left = 8
    Height = 20
    Top = 24
    Width = 288
    Color = clWindow
    KeyField = 'CODIGO'
    ListField = 'NOME'
    ListFieldIndex = 0
    ListSource = dsCaixa
    LookupCache = False
    TabOrder = 0
  end
  object dsCaixa: TDataSource
    DataSet = ZQuery1
    Left = 184
    Top = 80
  end
  object ZQuery1: TZQuery
    Connection = DmPrincipal.ZConnection1
    SQL.Strings = (
      'select * from CAIXAS'
    )
    Params = <>
    Left = 104
    Top = 72
  end
end
