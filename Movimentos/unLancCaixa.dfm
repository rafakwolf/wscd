object frmLancCaixa: TfrmLancCaixa
  Left = 232
  Height = 344
  Top = 164
  Width = 604
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Lançamentos do caixa'
  ClientHeight = 344
  ClientWidth = 604
  Font.CharSet = ANSI_CHARSET
  Font.Name = 'Verdana'
  KeyPreview = True
  OnClose = FormClose
  OnCreate = FormCreate
  ShowHint = True
  object btnOk: TBitBtn
    Left = 416
    Height = 32
    Hint = 'Gravar lançamento'
    Top = 248
    Width = 89
    Caption = '&OK'
    OnClick = btnOkClick
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object btnCancel: TBitBtn
    Left = 320
    Height = 32
    Hint = 'Cancelar lançamento'
    Top = 248
    Width = 89
    Caption = '&Cancelar'
    OnClick = btnCancelClick
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object btnNovo: TBitBtn
    Left = 8
    Height = 32
    Hint = 'Novo lançamento'
    Top = 248
    Width = 89
    Caption = '+ &Novo'
    OnClick = btnNovoClick
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object DBEdit1: TDBEdit
    Left = 33
    Height = 21
    Top = 183
    Width = 208
    DataField = 'VALOR'
    DataSource = dsPadrao
    MaxLength = 0
    TabOrder = 3
  end
  object DBComboBox1: TDBComboBox
    Left = 32
    Height = 20
    Top = 24
    Width = 262
    DataField = 'TIPO'
    DataSource = dsPadrao
    ItemHeight = 18
    Items.Strings = (
      'C'
      'D'
    )
    MaxLength = 0
    TabOrder = 4
  end
  object DBEdit2: TDBEdit
    Left = 32
    Height = 21
    Top = 128
    Width = 208
    DataField = 'DESCRICAO'
    DataSource = dsPadrao
    MaxLength = 0
    TabOrder = 5
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 33
    Height = 20
    Top = 72
    Width = 261
    DataField = 'CODCAIXAS'
    DataSource = dsPadrao
    KeyField = 'CODIGO'
    ListField = 'NOME'
    ListFieldIndex = 0
    ListSource = DataSource1
    LookupCache = False
    TabOrder = 6
  end
  object dsPadrao: TDataSource
    DataSet = zPadrao
    OnStateChange = dsPadraoStateChange
    Left = 432
    Top = 168
  end
  object zPadrao: TZQuery
    Connection = DmPrincipal.ZConnection1
    AfterInsert = zPadraoAfterInsert
    SQL.Strings = (
      'select * from CAIXA'
    )
    Params = <>
    Left = 368
    Top = 168
  end
  object zCaixas: TZQuery
    Connection = DmPrincipal.ZConnection1
    SQL.Strings = (
      'select * from CAIXAS'
    )
    Params = <>
    Left = 416
    Top = 80
  end
  object DataSource1: TDataSource
    DataSet = zCaixas
    Left = 504
    Top = 80
  end
end
