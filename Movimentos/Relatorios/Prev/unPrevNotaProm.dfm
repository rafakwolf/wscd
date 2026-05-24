object frmPrevNotaProm: TfrmPrevNotaProm
  Left = 224
  Height = 250
  Top = 159
  Width = 521
  BorderStyle = bsSingle
  Caption = 'Promissória'
  ClientHeight = 250
  ClientWidth = 521
  Color = clBtnFace
  Font.CharSet = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  KeyPreview = True
  Position = poScreenCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  object pnlBotoes: TPanel
    Left = 0
    Height = 34
    Top = 216
    Width = 521
    Align = alBottom
    BevelInner = bvLowered
    ClientHeight = 34
    ClientWidth = 521
    ParentBackground = False
    TabOrder = 0
    object btnImp: TBitBtn
      Left = 97
      Height = 30
      Hint = 'Visualizar'
      Top = 2
      Width = 90
      Caption = '&Visualizar'
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btnImpClick
    end
    object btnCancel: TBitBtn
      Left = 188
      Height = 30
      Hint = 'Sair'
      Top = 2
      Width = 90
      Caption = '&Sair'
      NumGlyphs = 2
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnImprimir: TBitBtn
      Left = 3
      Height = 30
      Hint = 'Imprimir'
      Top = 2
      Width = 90
      Caption = '&Imprimir'
      NumGlyphs = 2
      TabOrder = 2
      OnClick = btnImprimirClick
    end
  end
  object ComboBox1: TComboBox
    Left = 32
    Height = 20
    Top = 40
    Width = 448
    ItemHeight = 15
    ReadOnly = True
    TabOrder = 1
    Text = 'ComboBox1'
  end
  object dsPadrao: TDataSource
    DataSet = ZQuery1
    Left = 352
    Top = 104
  end
  object ZQuery1: TZQuery
    Connection = DmPrincipal.ZConnection1
    SQL.Strings = (
      'select CODCLIENTE, NOME from CLIENTES'
    )
    Params = <>
    Left = 248
    Top = 104
    object ZQuery1CODCLIENTE: TZIntegerField
      FieldKind = fkData
      FieldName = 'CODCLIENTE'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object ZQuery1NOME: TZRawStringField
      FieldKind = fkData
      FieldName = 'NOME'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
  end
end
