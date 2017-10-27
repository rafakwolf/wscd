object frmPadrao: TfrmPadrao
  Left = 222
  Top = 137
  HelpContext = 3
  HorzScrollBar.Increment = 72
  ClientHeight = 300
  ClientWidth = 755
  Caption = 'frmPadrao'
  BorderStyle = bsSingle
  OldCreateOrder = False
  ShowHint = True
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  BorderIcons = [biSystemMenu, biMinimize]
  KeyPreview = True
  MonitoredKeys.Keys = <>
  Font.Charset = ANSI_CHARSET
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object sbStatus: TUniStatusBar
    Left = 0
    Top = 281
    Width = 755
    Height = 19
    Hint = ''
    ShowHint = True
    Panels = <>
    SizeGrip = False
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    ParentColor = False
    Color = clBtnFace
  end
  object pnBotoesPadrao: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 755
    Height = 35
    Hint = ''
    ShowHint = True
    ParentColor = False
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    TabStop = False
    object btnNovo: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 48
      Height = 32
      ShowHint = True
      Action = actInsert
      Caption = 'Novo'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      ParentColor = False
      Color = clWindow
      TabOrder = 0
    end
    object btnAlterar: TUniSpeedButton
      Left = 48
      Top = 1
      Width = 49
      Height = 32
      ShowHint = True
      Action = actEdit
      Caption = 'Alterar'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      ParentColor = False
      Color = clWindow
      TabOrder = 1
    end
    object btnExcluir: TUniSpeedButton
      Left = 98
      Top = 0
      Width = 41
      Height = 32
      ShowHint = True
      Action = actDelete
      Caption = 'Excluir'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      ParentColor = False
      Color = clWindow
      TabOrder = 2
    end
    object btnSalvar: TUniSpeedButton
      Left = 139
      Top = 0
      Width = 54
      Height = 32
      ShowHint = True
      Action = actPost
      Caption = 'Salvar'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      ParentColor = False
      Color = clWindow
      TabOrder = 3
    end
    object btnCancelar: TUniSpeedButton
      Left = 193
      Top = 0
      Width = 60
      Height = 32
      ShowHint = True
      Action = actCancelUpdates
      Caption = 'Cancelar'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      ParentColor = False
      Color = clWindow
      TabOrder = 4
    end
    object btnConsultar: TUniSpeedButton
      Left = 251
      Top = 0
      Width = 72
      Height = 32
      ShowHint = True
      Action = actSearch
      Caption = 'Pesquisar'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      ParentColor = False
      Color = clWindow
      TabOrder = 5
    end
    object btnSair: TUniSpeedButton
      Left = 401
      Top = 0
      Width = 56
      Height = 32
      ShowHint = True
      Action = actClose
      Caption = 'Sair'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      ParentColor = False
      Color = clWindow
      TabOrder = 6
    end
    object btnPrint: TUniSpeedButton
      Left = 329
      Top = 0
      Width = 66
      Height = 32
      ShowHint = True
      Action = actPrint
      Caption = 'Imprimir'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      ParentColor = False
      Color = clWindow
      TabOrder = 7
    end
  end
  object actlNavigateActions: TActionList
    Left = 56
    Top = 44
    object actInsert: TAction
      Category = 'Navigate'
      Hint = 'Novo registro'
      OnExecute = actInsertExecute
    end
    object actEdit: TAction
      Category = 'Navigate'
      Hint = 'Alterar registro'
      ShortCut = 116
      OnExecute = actEditExecute
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
      ShortCut = 119
      OnExecute = actSearchExecute
    end
    object actCancelUpdates: TAction
      Category = 'Navigate'
      Hint = 'Cancelar registro'
      OnExecute = actCancelUpdatesExecute
    end
    object actClose: TAction
      Category = 'Navigate'
      Hint = 'Fechar'
      SecondaryShortCuts.Strings = (
        'Esc')
      ShortCut = 27
      OnExecute = actCloseExecute
    end
  end
  object dsPadrao: TDataSource
    AutoEdit = False
    OnStateChange = dsPadraoStateChange
    Left = 159
    Top = 44
  end
end
