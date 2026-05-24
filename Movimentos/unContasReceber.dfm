inherited frmContasReceber: TfrmContasReceber
  Left = 358
  Height = 447
  Width = 773
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'frmContasReceber'
  ClientHeight = 447
  ClientWidth = 773
  Menu = mnuCP
  OnShow = FormShow
  object Stb: TStatusBar[0]
    Left = 0
    Height = 18
    Hint = 'Valores gerais'
    Top = 429
    Width = 773
    Color = clBtnFace
    Panels = <    
      item
        Width = 200
      end    
      item
        Width = 200
      end    
      item
        Width = 50
      end>
    ParentColor = False
    ParentShowHint = False
    SimplePanel = False
    ShowHint = True
  end
  object pnBotoes: TPanel[1]
    Left = 0
    Height = 36
    Top = 0
    Width = 773
    Align = alTop
    ClientHeight = 36
    ClientWidth = 773
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    object btnExcluir: TSpeedButton
      Left = 100
      Height = 32
      Hint = 'Excluir lançamento marcado'
      Top = 1
      Width = 95
      Caption = 'Excluir'
      Color = clWindow
      Font.CharSet = ANSI_CHARSET
      Font.Name = 'Verdana'
      OnClick = btnExcluirClick
      ShowHint = True
      ParentFont = False
      ParentShowHint = False
    end
    object btnRecebidas: TSpeedButton
      Left = 196
      Height = 32
      Hint = 'Visualisar relatório'
      Top = 1
      Width = 95
      Caption = 'Recebidas'
      Color = clWindow
      OnClick = btnRecebidasClick
      ShowHint = True
      ParentShowHint = False
    end
    object btnReceber: TSpeedButton
      Left = 4
      Height = 32
      Top = 1
      Width = 95
      Caption = 'Receber'
      Color = clWindow
      Font.CharSet = ANSI_CHARSET
      Font.Name = 'Verdana'
      OnClick = btnReceberClick
      ShowHint = True
      ParentFont = False
      ParentShowHint = False
    end
    object btnFechar: TSpeedButton
      Left = 296
      Height = 32
      Top = 1
      Width = 95
      Caption = 'Fechar'
      Color = clWindow
      OnClick = btnFecharClick
      ShowHint = True
      ParentShowHint = False
    end
  end
  object grpCliente: TGroupBox[2]
    Left = 7
    Height = 53
    Top = 41
    Width = 448
    Caption = ' Cliente '
    ClientHeight = 27
    ClientWidth = 438
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    object dbeCliente: TDBEdit
      Left = 8
      Height = 21
      Top = -2
      Width = 433
      DataField = 'NOMECLIENTE'
      DataSource = dsPadrao
      ReadOnly = True
      Color = clBtnFace
      MaxLength = 0
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
  end
  object Grade: TDBGrid[3]
    Left = 0
    Height = 317
    Hint = 'Dois cliques para marcar '#13#10'ou desmarcar este ítem...'
    Top = 112
    Width = 773
    Align = alBottom
    Color = clWindow
    Columns = <>
    DataSource = dsPadrao
    Font.CharSet = ANSI_CHARSET
    Font.Name = 'Verdana'
    Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 0
    OnDblClick = GradeDblClick
  end
  object dsPadrao: TDataSource[4]
    DataSet = sqldPadrao
    OnStateChange = dsPadraoStateChange
    Left = 640
    Top = 160
  end
  object mnuCP: TMainMenu[5]
    Left = 256
    Top = 192
    object miOpcoes: TMenuItem
      Caption = 'Opções'
      object miReceber: TMenuItem
        Caption = 'Receber'
        OnClick = btnReceberClick
      end
      object miExcluir: TMenuItem
        Caption = 'Excluir'
        OnClick = btnExcluirClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object miVencendoHoje: TMenuItem
        Caption = 'Vencendo hoje'
        OnClick = miVencendoHojeClick
      end
      object miRecebidas: TMenuItem
        Caption = 'Contas recebidas'
        OnClick = btnRecebidasClick
      end
      object miContasVencidas: TMenuItem
        Caption = 'Contas vencidas'
        OnClick = miContasVencidasClick
      end
      object miTodasContas: TMenuItem
        Caption = 'Todas as contas'
        OnClick = miTodasContasClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object miBuscarCliente: TMenuItem
        Caption = 'Buscar por cliente'
        OnClick = miBuscarClienteClick
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object miFechar: TMenuItem
        Caption = 'Fechar'
        ShortCut = 16467
      end
    end
    object miRelatorios: TMenuItem
      Caption = 'Relatórios'
      object miRecibo: TMenuItem
        Caption = 'Recibo'
        OnClick = miReciboClick
      end
    end
  end
  object sqldPadrao: TZQuery[6]
    Connection = DmPrincipal.ZConnection1
    SQL.Strings = (
      'select'
      '   cr.*,'
      '    cli.NOME NOMECLIENTE'
      'from CONTASRECEBER cr'
      'left join CLIENTES cli on (cr.CLIENTE = cli.CODCLIENTE)'
      'where (RECDA = ''N''  or RECDA is null) and CLIENTE = :PCLIENTE'
      'order by cr.VENCIMENTO desc'
    )
    Params = <    
      item
        Name = 'PCLIENTE'
      end>
    Left = 544
    Top = 152
    ParamData = <    
      item
        Name = 'PCLIENTE'
      end>
  end
  object sqldDeleta: TZQuery[7]
    Connection = DmPrincipal.ZConnection1
    SQL.Strings = (
      'delete from CONTASRECEBER where CODIGO = :ID'
    )
    Params = <    
      item
        Name = 'ID'
      end>
    Left = 384
    Top = 272
    ParamData = <    
      item
        Name = 'ID'
      end>
  end
  object sqldCliente: TZQuery[8]
    Connection = DmPrincipal.ZConnection1
    SQL.Strings = (
      'select * from CLIENTES'
    )
    Params = <>
    Left = 392
    Top = 208
  end
end
