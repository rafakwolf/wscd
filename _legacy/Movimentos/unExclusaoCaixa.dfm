inherited frmExclusaoCaixa: TfrmExclusaoCaixa
  Left = 409
  Height = 469
  Top = 225
  Width = 819
  BorderStyle = bsSingle
  Caption = 'frmExclusaoCaixa'
  ClientHeight = 469
  ClientWidth = 819
  Font.Height = -12
  object stbCaixa: TStatusBar[0]
    Left = 0
    Height = 18
    Top = 451
    Width = 819
    Color = clBtnFace
    Panels = <>
    ParentColor = False
    ParentShowHint = False
    SimpleText = ' Para ajuda pressione F1'
    ShowHint = True
  end
  object btnExcluir: TBitBtn[1]
    Left = 600
    Height = 33
    Top = 408
    Width = 81
    Caption = 'Excluir'
    OnClick = btnExcluirClick
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object btnSair: TBitBtn[2]
    Left = 688
    Height = 33
    Top = 408
    Width = 81
    Caption = 'Sair'
    OnClick = btnSairClick
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object grpBusca: TGroupBox[3]
    Left = 8
    Height = 78
    Top = 2
    Width = 753
    Caption = ' Pesquisa '
    ClientHeight = 50
    ClientWidth = 743
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    object edDescricao: TEdit
      Left = 184
      Height = 20
      Top = 17
      Width = 558
      Font.CharSet = ANSI_CHARSET
      Font.Height = -12
      Font.Name = 'Verdana'
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Text = 'Descrição...'
      OnChange = edDescricaoChange
      OnEnter = edDescricaoEnter
      OnExit = edDescricaoExit
    end
    object edtDocumento: TEdit
      Left = 8
      Height = 20
      Top = 17
      Width = 169
      Font.CharSet = ANSI_CHARSET
      Font.Height = -12
      Font.Name = 'Verdana'
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Text = 'Documento...'
      OnChange = edtDocumentoChange
      OnEnter = edtDocumentoEnter
      OnExit = edtDocumentoExit
    end
  end
  object bvlLinha: TPanel[4]
    Left = 8
    Height = 26
    Top = 376
    Width = 753
    Caption = 'bvlLinha'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
  end
  object dbgrdCaixa: TDBGrid[5]
    Left = 8
    Height = 288
    Hint = 'Duplo clique para marcar/desmarcar '#13#10'o lançamento que deseja excluir...'
    Top = 89
    Width = 753
    Color = clWindow
    Columns = <>
    DataSource = dsPadrao
    Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    ShowHint = True
    TabOrder = 1
    OnDblClick = dbgrdCaixaDblClick
  end
  object dsPadrao: TDataSource[6]
    AutoEdit = False
    DataSet = sqldPadrao
    Left = 424
    Top = 144
  end
  object sqldPadrao: TZQuery[7]
    Connection = DmPrincipal.ZConnection1
    Params = <>
    Left = 304
    Top = 136
  end
end
