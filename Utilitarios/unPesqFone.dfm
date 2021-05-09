inherited frmPesqFone: TfrmPesqFone
  Left = 360
  Height = 499
  Top = 127
  Width = 741
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'frmPesqFone'
  ClientHeight = 499
  ClientWidth = 741
  OnShow = FormShow
  object btnPesquisar: TBitBtn[0]
    Left = 613
    Height = 35
    Hint = 'Pesquisar'
    Top = 24
    Width = 90
    Caption = 'Pesquisar'
    OnClick = btnPesquisarClick
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object btnImprimir: TBitBtn[1]
    Left = 608
    Height = 34
    Hint = 'Relatório dos dados filtrados...'
    Top = 440
    Width = 97
    Caption = 'Imprimir'
    OnClick = btnImprimirClick
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
  end
  object edtNome: TEdit[2]
    Left = 128
    Height = 33
    Top = 28
    Width = 337
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object edtFone: TEdit[3]
    Left = 472
    Height = 33
    Top = 28
    Width = 137
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object dbgrdFones: TDBGrid[4]
    Left = 10
    Height = 369
    Top = 67
    Width = 697
    Color = clWindow
    Columns = <>
    DataSource = dsFone
    Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    ShowHint = True
    TabOrder = 4
  end
  object rgpPesquisa: TRadioGroup[5]
    Left = 8
    Height = 57
    Top = 5
    Width = 113
    AutoFill = True
    Caption = ' Pesquisar por '
    ChildSizing.LeftRightSpacing = 6
    ChildSizing.EnlargeHorizontal = crsHomogenousChildResize
    ChildSizing.EnlargeVertical = crsHomogenousChildResize
    ChildSizing.ShrinkHorizontal = crsScaleChilds
    ChildSizing.ShrinkVertical = crsScaleChilds
    ChildSizing.Layout = cclLeftToRightThenTopToBottom
    ChildSizing.ControlsPerLine = 1
    ClientHeight = 39
    ClientWidth = 111
    ItemIndex = 0
    Items.Strings = (
      'Nome'
      'Telefone'
    )
    OnClick = rgpPesquisaClick
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object dsFone: TDataSource[6]
    DataSet = ZReadOnlyQuery1
    Left = 368
    Top = 144
  end
  object mmPesqFone: TMainMenu[7]
    Left = 168
    Top = 144
    object miRegistros: TMenuItem
      Caption = 'Registros'
      object miCadastrar: TMenuItem
        Caption = 'Cadastrar'
        OnClick = miCadastrarClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object miSair: TMenuItem
        Caption = 'Sair'
        OnClick = miSairClick
      end
    end
    object miOpcoes: TMenuItem
      Caption = 'Opções'
      object miOrdenar: TMenuItem
        Caption = 'Ordenar'
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object miPrint: TMenuItem
        Caption = 'Imprimir'
        OnClick = btnImprimirClick
      end
    end
  end
  object ZReadOnlyQuery1: TZReadOnlyQuery[8]
    Connection = DmPrincipal.ZConnection1
    SQL.Strings = (
      'SELECT'
      '    CLI.NOME,'
      '    CLI.TELEFONE'
      '  FROM CLIENTES CLI'
      '  WHERE (CLI.TELEFONE <> '''')'
      ''
      '  UNION'
      ''
      '  SELECT'
      '    FORN.FANTAZIA NOME,'
      '    FORN.TELEFONE'
      '  FROM FORNECEDORES FORN'
      '  WHERE (FORN.TELEFONE <> '''')'
      ''
      '  UNION'
      ''
      '  SELECT'
      '    AG.NOME,'
      '    AG.TELEFONE'
      '  FROM AGENDA AG'
      '  WHERE (AG.TELEFONE <> '''')'
    )
    Params = <>
    Left = 272
    Top = 208
  end
end
