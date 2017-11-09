object MainForm: TMainForm
  Left = 91
  Top = 50
  ClientHeight = 414
  ClientWidth = 773
  Caption = 'MainForm'
  OnResize = UniFormResize
  WindowState = wsMaximized
  OldCreateOrder = False
  ShowHint = True
  KeyPreview = True
  MonitoredKeys.Keys = <>
  Movable = False
  AlignmentControl = uniAlignmentClient
  Font.Charset = ANSI_CHARSET
  Layout = 'hbox'
  OnCreate = UniFormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object menuFrame: TUniHTMLFrame
    Left = 0
    Top = 0
    Width = 205
    Height = 105
    Hint = ''
    ShowHint = True
    LayoutConfig.Height = '100%'
    LayoutConfig.Width = '18%'
    OnAjaxEvent = menuFrameAjaxEvent
  end
  object UniPanel1: TUniPanel
    Left = 264
    Top = 8
    Width = 449
    Height = 57
    Hint = ''
    ShowHint = True
    TabOrder = 1
    BorderStyle = ubsNone
    Caption = ''
    Color = clSilver
    LayoutConfig.Height = '8%'
    LayoutConfig.Width = '82%'
    object UniSpeedButton1: TUniSpeedButton
      Left = 401
      Top = 0
      Width = 48
      Height = 57
      Hint = ''
      ShowHint = True
      Caption = '<i class="fa fa-sign-out fa-2x"></i>'
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      ParentColor = False
      Color = clWindow
      TabOrder = 1
      OnClick = UniSpeedButton1Click
    end
    object UniSpeedButton2: TUniSpeedButton
      Left = 352
      Top = 0
      Width = 49
      Height = 57
      Hint = ''
      ShowHint = True
      Caption = '<i class="fa fa-bell fa-2x"></i>'
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      ParentColor = False
      Color = clWindow
      TabOrder = 2
    end
  end
  object ListaAcoes: TActionList
    Left = 264
    Top = 160
    object actCidade: TAction
      Category = 'Configuracao'
      Caption = 'Cidades'
      OnExecute = actCidadeExecute
    end
    object actUnidade: TAction
      Category = 'Configuracao'
      Caption = 'Unidades de medida'
      OnExecute = actUnidadeExecute
    end
    object actGrupo: TAction
      Category = 'Configuracao'
      Caption = 'Grupos de produtos'
      OnExecute = actGrupoExecute
    end
    object actAliquotaIcms: TAction
      Category = 'Configuracao'
      Caption = 'Al'#237'quotas de icms'
      OnExecute = actAliquotaIcmsExecute
    end
    object actContaCaixa: TAction
      Category = 'Configuracao'
      Caption = 'Contas caixa'
      OnExecute = actContaCaixaExecute
    end
    object actCfop: TAction
      Category = 'Configuracao'
      Caption = 'Opera'#231#245'es CFOP'
      OnExecute = actCfopExecute
    end
    object actConfiguracaoGlobal: TAction
      Category = 'Configuracao'
      Caption = 'Configura'#231#245'es globais'
      OnExecute = actConfiguracaoGlobalExecute
    end
    object actConfiguracaoLocal: TAction
      Category = 'Configuracao'
      Caption = 'Configura'#231#245'es locais'
      OnExecute = actConfiguracaoLocalExecute
    end
    object actImpressora: TAction
      Category = 'Configuracao'
      Caption = 'Impressora'
    end
    object actDadosEmpresa: TAction
      Category = 'Configuracao'
      Caption = 'Dados da empresa'
      OnExecute = actDadosEmpresaExecute
    end
    object actUsuario: TAction
      Category = 'Configuracao'
      Caption = 'Usu'#225'rios do sistema'
      OnExecute = actUsuarioExecute
    end
    object actPerfis: TAction
      Category = 'Configuracao'
      Caption = 'Perfis'
      OnExecute = actPerfisExecute
    end
    object actTrocaSenha: TAction
      Category = 'Configuracao'
      Caption = 'Trocar minha senha'
      OnExecute = actTrocaSenhaExecute
    end
    object actAgenda: TAction
      Category = 'Util'
      Caption = 'Agenda de telefones'
      ShortCut = 16449
      OnExecute = actAgendaExecute
    end
    object actCalendario: TAction
      Category = 'Util'
      Caption = 'Calend'#225'rio'
      ShortCut = 122
      OnExecute = actCalendarioExecute
    end
    object actCalculadora: TAction
      Category = 'Util'
      Caption = 'Calculadora'
      ShortCut = 123
    end
    object actEditorTexto: TAction
      Category = 'Util'
      Caption = 'Editor de texto'
    end
    object actDuplicata: TAction
      Category = 'Util'
      Caption = 'Duplicatas'
      OnExecute = actDuplicataExecute
    end
    object actNotaPromissoria: TAction
      Category = 'Util'
      Caption = 'Nota promiss'#243'ria'
      OnExecute = actNotaPromissoriaExecute
    end
    object actRecibo: TAction
      Category = 'Util'
      Caption = 'Recibos'
      OnExecute = actReciboExecute
    end
    object actRelatorioAgenda: TAction
      Category = 'Util'
      Caption = 'Relat'#243'rio de agenda'
      OnExecute = actRelatorioAgendaExecute
    end
    object actCliente: TAction
      Category = 'Cadastros'
      Caption = 'Clientes'
      OnExecute = actClienteExecute
    end
    object actProduto: TAction
      Category = 'Cadastros'
      Caption = 'Produtos'
      OnExecute = actProdutoExecute
    end
    object actFornecedor: TAction
      Category = 'Cadastros'
      Caption = 'Fornecedores'
      OnExecute = actFornecedorExecute
    end
    object actContasPagar: TAction
      Category = 'Movimentos'
      Caption = 'Contas a pagar'
      OnExecute = actContasPagarExecute
    end
    object actContasReceber: TAction
      Category = 'Movimentos'
      Caption = 'Contas a receber'
      OnExecute = actContasReceberExecute
    end
    object actOrcamento: TAction
      Category = 'Movimentos'
      Caption = 'Or'#231'amentos'
      OnExecute = actOrcamentoExecute
    end
    object actVenda: TAction
      Category = 'Movimentos'
      Caption = 'Vendas'
      OnExecute = actVendaExecute
    end
    object actCompra: TAction
      Category = 'Movimentos'
      Caption = 'Compras'
      OnExecute = actCompraExecute
    end
    object actPerda: TAction
      Category = 'Movimentos'
      Caption = 'Perdas'
      OnExecute = actPerdaExecute
    end
    object actCaixa: TAction
      Category = 'Movimentos'
      Caption = 'Livro caixa'
      OnExecute = actCaixaExecute
    end
    object actDesmarcaProduto: TAction
      Category = 'Movimentos'
      Caption = 'Desmarcar produtos novos e alterados'
      OnExecute = actDesmarcaProdutoExecute
    end
    object actListaPreco: TAction
      Category = 'Movimentos'
      Caption = 'Lista de pre'#231'os'
      OnExecute = actListaPrecoExecute
    end
    object actExcluirProduto: TAction
      Category = 'Movimentos'
      Caption = 'Exclus'#227'o de v'#225'rios produtos'
      OnExecute = actExcluirProdutoExecute
    end
    object actEtiquetaProduto: TAction
      Category = 'Movimentos'
      Caption = 'Etiquetas de produtos'
      OnExecute = actEtiquetaProdutoExecute
    end
    object actFechar: TAction
      Category = 'Sair'
      Caption = 'Sair do sistema'
      SecondaryShortCuts.Strings = (
        '')
      ShortCut = 32851
      OnExecute = actFecharExecute
    end
    object actOutroUsuario: TAction
      Category = 'Sair'
      Caption = 'Outro usu'#225'rio'
      OnExecute = actOutroUsuarioExecute
    end
    object actSobreSistema: TAction
      Category = 'Ajuda'
      Caption = 'Sobre'
      OnExecute = actSobreSistemaExecute
    end
    object actDicaDia: TAction
      Category = 'Ajuda'
      Caption = 'Dica do dia'
      OnExecute = actDicaDiaExecute
    end
    object actEnvelope: TAction
      Category = 'Util'
      Caption = 'Envelope personalizado'
      OnExecute = actEnvelopeExecute
    end
    object actBackup: TAction
      Category = 'Util'
      Caption = 'C'#243'pia de seguran'#231'a'
      OnExecute = actBackupExecute
    end
    object actRestore: TAction
      Category = 'Util'
      Caption = 'Restaura'#231#227'o'
    end
    object actEtiqueta: TAction
      Category = 'Configuracao'
      Caption = 'Etiquetas'
      OnExecute = actEtiquetaExecute
    end
    object actPesqFone: TAction
      Category = 'Util'
      Caption = 'Pesquisa telefones'
      OnExecute = actPesqFoneExecute
    end
    object actBanco: TAction
      Category = 'Configuracao'
      Caption = 'Bancos'
      OnExecute = actBancoExecute
    end
    object actCheque: TAction
      Category = 'Movimentos'
      Caption = 'Cheques'
      OnExecute = actChequeExecute
    end
    object actRenovaChave: TAction
      Category = 'Configuracao'
      Caption = 'Renovar chave de libera'#231#227'o'
      OnExecute = actRenovaChaveExecute
    end
    object actAtualizacao: TAction
      Category = 'Ajuda'
      Caption = 'Verificar atualiza'#231#227'o'
    end
    object actPostIt: TAction
      Category = 'Util'
      Caption = 'Post it'
    end
    object actAjuda: TAction
      Category = 'Ajuda'
      Caption = 'Ajuda do sistema'
      ShortCut = 112
      OnExecute = actAjudaExecute
    end
    object actConfigServidor: TAction
      Category = 'Configuracao'
      Caption = 'Configura'#231#227'o do banco de dados'
    end
    object actInfoSistema: TAction
      Category = 'Ajuda'
      Caption = 'Informa'#231#245'es sobre o sistema'
      OnExecute = actInfoSistemaExecute
    end
    object actVendedor: TAction
      Category = 'Configuracao'
      Caption = 'Vendedores'
      OnExecute = actVendedorExecute
    end
    object actConfigNota: TAction
      Category = 'Configuracao'
      Caption = 'Configura'#231#227'o da nota'
      OnExecute = actConfigNotaExecute
    end
    object actPromocao: TAction
      Category = 'Movimentos'
      Caption = 'Promo'#231#245'es'
      OnExecute = actPromocaoExecute
    end
    object actInfoAvisos: TAction
      Category = 'Ajuda'
      Caption = 'Informa'#231#245'es e avisos'
    end
    object actAuditoriaUser: TAction
      Category = 'Util'
      Caption = 'Auditoria de registros'
    end
  end
end
