object frmPadrao: TfrmPadrao
  Left = 278
  Height = 372
  Top = 178
  Width = 810
  HelpContext = 3
  HorzScrollBar.Increment = 72
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'frmPadrao'
  ClientHeight = 372
  ClientWidth = 810
  Font.CharSet = ANSI_CHARSET
  KeyPreview = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  ShowHint = True
  LCLVersion = '2.0.12.0'
  object sbStatus: TStatusBar
    Left = 0
    Height = 18
    Top = 354
    Width = 810
    Color = clBtnFace
    Panels = <>
    ParentColor = False
    ParentShowHint = False
    SizeGrip = False
    ShowHint = True
  end
  object pnBotoesPadrao: TPanel
    Left = 0
    Height = 35
    Top = 0
    Width = 810
    Align = alTop
    ClientHeight = 35
    ClientWidth = 810
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    object btnNovo: TSpeedButton
      Left = 1
      Height = 32
      Top = 1
      Width = 48
      Action = actInsert
      Caption = 'Novo'
      Color = clWindow
      Font.CharSet = ANSI_CHARSET
      ShowHint = True
      ParentFont = False
      ParentShowHint = False
    end
    object btnAlterar: TSpeedButton
      Left = 48
      Height = 32
      Top = 1
      Width = 49
      Action = actEdit
      Caption = 'Editar'
      Color = clWindow
      Font.CharSet = ANSI_CHARSET
      ShowHint = True
      ParentFont = False
      ParentShowHint = False
    end
    object btnExcluir: TSpeedButton
      Left = 98
      Height = 32
      Top = 1
      Width = 70
      Action = actDelete
      Caption = 'Remover'
      Color = clWindow
      Font.CharSet = ANSI_CHARSET
      ShowHint = True
      ParentFont = False
      ParentShowHint = False
    end
    object btnSalvar: TSpeedButton
      Left = 170
      Height = 32
      Top = 1
      Width = 54
      Action = actPost
      Caption = 'Salvar'
      Color = clWindow
      Font.CharSet = ANSI_CHARSET
      ShowHint = True
      ParentFont = False
      ParentShowHint = False
    end
    object btnCancelar: TSpeedButton
      Left = 224
      Height = 32
      Top = 1
      Width = 60
      Action = actCancelUpdates
      Caption = 'Cancelar'
      Color = clWindow
      Font.CharSet = ANSI_CHARSET
      ShowHint = True
      ParentFont = False
      ParentShowHint = False
    end
    object btnConsultar: TSpeedButton
      Left = 285
      Height = 32
      Top = 1
      Width = 72
      Action = actSearch
      Caption = 'Buscar'
      Color = clWindow
      Font.CharSet = ANSI_CHARSET
      ShowHint = True
      ParentFont = False
      ParentShowHint = False
    end
    object btnSair: TSpeedButton
      Left = 432
      Height = 32
      Top = 1
      Width = 56
      Action = actClose
      Caption = 'Sair'
      Color = clWindow
      Font.CharSet = ANSI_CHARSET
      ShowHint = True
      ParentFont = False
      ParentShowHint = False
    end
    object btnPrint: TSpeedButton
      Left = 360
      Height = 32
      Top = 1
      Width = 66
      Action = actPrint
      Caption = 'Imprimir'
      Color = clWindow
      Font.CharSet = ANSI_CHARSET
      ShowHint = True
      ParentFont = False
      ParentShowHint = False
    end
  end
  object actlNavigateActions: TActionList
    Left = 80
    Top = 72
    object actInsert: TAction
      Category = 'Navigate'
      Hint = 'Novo registro'
      OnExecute = actInsertExecute
    end
    object actEdit: TAction
      Category = 'Navigate'
      Hint = 'Alterar registro'
      OnExecute = actEditExecute
      ShortCut = 116
    end
    object actPost: TAction
      Category = 'Navigate'
      Hint = 'Salvar registro'
      OnExecute = actPostExecute
    end
    object actDelete: TAction
      Category = 'Navigate'
      Hint = 'Excluir registro'
      OnExecute = actDeleteExecute
    end
    object actPrint: TAction
      Category = 'Navigate'
      Hint = 'Imprimir'
      ShortCut = 16464
    end
    object actSearch: TAction
      Category = 'Navigate'
      Hint = 'Pesquisar'
      OnExecute = actSearchExecute
      ShortCut = 119
    end
    object actCancelUpdates: TAction
      Category = 'Navigate'
      Hint = 'Cancelar registro'
      OnExecute = actCancelUpdatesExecute
    end
    object actClose: TAction
      Category = 'Navigate'
      Hint = 'Fechar'
      OnExecute = actCloseExecute
      SecondaryShortCuts.Strings = (
        'Esc'
      )
      ShortCut = 27
    end
  end
  object dsPadrao: TDataSource
    AutoEdit = False
    OnStateChange = dsPadraoStateChange
    Left = 183
    Top = 72
  end
end
