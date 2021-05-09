inherited frmBaixaCheque: TfrmBaixaCheque
  Left = 247
  Height = 235
  Top = 186
  Width = 480
  Caption = 'Baixar cheque'
  ClientHeight = 235
  ClientWidth = 480
  OnShow = FormShow
  object lbContaCaixa: TLabel[0]
    Left = 17
    Height = 15
    Top = 47
    Width = 77
    Caption = 'Conta caixa'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbDataBaixa: TLabel[1]
    Left = 272
    Height = 15
    Top = 48
    Width = 91
    Caption = 'Data da baixa'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object btnOk: TBitBtn[2]
    Left = 200
    Height = 29
    Top = 103
    Width = 81
    Caption = 'Ok'
    ModalResult = 1
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object btnCancelar: TBitBtn[3]
    Left = 288
    Height = 29
    Top = 103
    Width = 81
    Caption = 'Cancelar'
    ModalResult = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
  object medtDataBaixa: TEdit[4]
    Left = 272
    Height = 33
    Top = 64
    Width = 97
    MaxLength = 10
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    Text = '  /  /    '
  end
  object cedHistorico: TEdit[5]
    Left = 17
    Height = 33
    Top = 12
    Width = 352
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object dblcbContaCaixa: TDBLookupComboBox[6]
    Left = 16
    Height = 33
    Top = 64
    Width = 257
    Color = clWindow
    KeyField = 'CODIGO'
    ListField = 'NOME'
    ListFieldIndex = 0
    ListSource = dsCaixa
    LookupCache = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object dsCaixa: TDataSource[7]
    DataSet = ZQuery1
    Left = 104
    Top = 128
  end
  object ZQuery1: TZQuery[8]
    Connection = DmPrincipal.ZConnection1
    SQL.Strings = (
      'select * from CAIXAS'
    )
    Params = <>
    Left = 32
    Top = 128
  end
end
