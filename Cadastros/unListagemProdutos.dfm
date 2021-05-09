object frmListagemProdutos: TfrmListagemProdutos
  Left = 253
  Height = 430
  Top = 139
  Width = 512
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Listagem de produtos'
  ClientHeight = 430
  ClientWidth = 512
  Font.CharSet = ANSI_CHARSET
  Font.Name = 'Verdana'
  KeyPreview = True
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  ShowHint = True
  LCLVersion = '2.0.12.0'
  object lbBuscaProduto: TLabel
    Left = 8
    Height = 15
    Top = 5
    Width = 44
    Caption = 'Buscar'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object btnOK: TBitBtn
    Left = 360
    Height = 30
    Top = 368
    Width = 81
    Caption = 'OK'
    OnClick = btnOKClick
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object Grade: TDBGrid
    Left = 16
    Height = 281
    Top = 64
    Width = 433
    Color = clWindow
    Columns = <>
    DataSource = dsProdutos
    Font.CharSet = ANSI_CHARSET
    Font.Name = 'Verdana'
    Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ShowHint = True
    TabOrder = 0
  end
  object edtBuscaProduto: TEdit
    Left = 8
    Height = 33
    Top = 21
    Width = 433
    OnChange = edtBuscaProdutoChange
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object dsProdutos: TDataSource
    AutoEdit = False
    DataSet = ZReadOnlyQuery1
    Left = 176
    Top = 88
  end
  object PopupCons: TPopupMenu
    Left = 264
    Top = 104
    object miFiltrar: TMenuItem
      Caption = 'Localizar na coluna...'
    end
  end
  object ZReadOnlyQuery1: TZReadOnlyQuery
    Connection = DmPrincipal.ZConnection1
    SQL.Strings = (
      'select * from PRODUTOS'
    )
    Params = <>
    Left = 142
    Top = 174
  end
end
