inherited frmConfiguracao: TfrmConfiguracao
  Left = 282
  Height = 446
  Top = 163
  Width = 779
  Caption = 'frmConfiguracao'
  ClientHeight = 446
  ClientWidth = 779
  inherited sbStatus: TStatusBar
    Top = 428
    Width = 779
  end
  inherited pnBotoesPadrao: TPanel
    Width = 779
    ClientWidth = 779
  end
  object PgConfig: TPageControl[2]
    Left = 8
    Height = 317
    Top = 36
    Width = 729
    ActivePage = TabProdutos
    ParentShowHint = False
    ShowHint = True
    TabIndex = 4
    TabOrder = 1
    object Tabgeral: TTabSheet
      Caption = '    &Geral    '
      ClientHeight = 286
      ClientWidth = 719
      ParentShowHint = False
      ShowHint = True
      object chAtalhos: TDBCheckBox
        Left = 23
        Height = 17
        Hint = 'Ativar barra de atalhos na tela principal'
        Top = 26
        Width = 297
        Caption = 'Mostrar barra de atalhos na tela principal'
        DataField = 'BARRAFERRAMENTA'
        DataSource = dsPadrao
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object chHint: TDBCheckBox
        Left = 23
        Height = 17
        Hint = 'Mensagem de informação na forma de balão'
        Top = 44
        Width = 166
        Caption = 'Mostrar hints estilo balão'
        DataField = 'HINTBALAO'
        DataSource = dsPadrao
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object chErro: TDBCheckBox
        Left = 23
        Height = 17
        Hint = 'Grava todos os erros que o sistema gerar'
        Top = 63
        Width = 162
        Caption = 'Gravar erros do sistema'
        DataField = 'GRAVAERRO'
        DataSource = dsPadrao
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object chBackup: TDBCheckBox
        Left = 23
        Height = 17
        Hint = 'Sugere copia de segurança ao finalizar o sistema'
        Top = 81
        Width = 224
        Caption = 'Sugerir cópia de segurança ao sair'
        DataField = 'BACKUP'
        DataSource = dsPadrao
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object chResolucao: TDBCheckBox
        Left = 23
        Height = 17
        Top = 100
        Width = 186
        Caption = 'Verificar resolução ao iniciar'
        DataField = 'RESOLUCAO'
        DataSource = dsPadrao
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object chLog: TDBCheckBox
        Left = 23
        Height = 17
        Hint = 'Grava as transações do banco de dados'
        Top = 118
        Width = 258
        Caption = 'Gerar log de registro do banco de dados'
        DataField = 'LOG'
        DataSource = dsPadrao
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object chImpressora: TDBCheckBox
        Left = 23
        Height = 17
        Top = 137
        Width = 137
        Caption = 'Verificar impressora'
        DataField = 'IMPRESSORA'
        DataSource = dsPadrao
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object chDica: TDBCheckBox
        Left = 23
        Height = 17
        Top = 155
        Width = 188
        Caption = 'Mostrar dica do dia ao iniciar'
        DataField = 'EXIBEDICADIA'
        DataSource = dsPadrao
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dbckbVerificaUpd: TDBCheckBox
        Left = 23
        Height = 17
        Top = 174
        Width = 249
        Caption = 'Verificar atualizações automáticamente'
        DataField = 'VERIFICA_UPD'
        DataSource = dsPadrao
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dbchkInfoAvisos: TDBCheckBox
        Left = 23
        Height = 17
        Top = 192
        Width = 241
        Caption = 'Exibir informações a avisos ao iniciar'
        DataField = 'INFOAVISOS'
        DataSource = dsPadrao
        ParentShowHint = False
        ShowHint = True
        TabOrder = 9
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
    end
    object TabImg: TTabSheet
      Caption = 'Papel &Parede'
      ClientHeight = 286
      ClientWidth = 719
      ImageIndex = 1
      ParentShowHint = False
      ShowHint = True
      object imgPapelParede: TImage
        Left = 8
        Height = 184
        Hint = 'Imagem do papel de parede'
        Top = 10
        Width = 367
        ParentShowHint = False
        ShowHint = True
      end
      object btnBuscar: TBitBtn
        Left = 12
        Height = 25
        Hint = 'Procurar'
        Top = 212
        Width = 80
        Caption = '&Procurar'
        OnClick = btnBuscarClick
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object btnExImg: TBitBtn
        Left = 100
        Height = 25
        Top = 212
        Width = 80
        Caption = '&Limpar'
        OnClick = btnExImgClick
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object rgOrientationImg: TRadioGroup
        Left = 194
        Height = 49
        Top = 198
        Width = 184
        AutoFill = True
        Caption = ' Orientação '
        ChildSizing.LeftRightSpacing = 6
        ChildSizing.EnlargeHorizontal = crsHomogenousChildResize
        ChildSizing.EnlargeVertical = crsHomogenousChildResize
        ChildSizing.ShrinkHorizontal = crsScaleChilds
        ChildSizing.ShrinkVertical = crsScaleChilds
        ChildSizing.Layout = cclLeftToRightThenTopToBottom
        ChildSizing.ControlsPerLine = 1
        ClientHeight = 31
        ClientWidth = 182
        ItemIndex = 1
        Items.Strings = (
          'Lado a lado'
          'Estender'
        )
        OnClick = rgOrientationImgClick
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
      end
    end
    object TabOrcam: TTabSheet
      Caption = '&Orçamentos'
      ClientHeight = 286
      ClientWidth = 719
      ImageIndex = 2
      ParentShowHint = False
      ShowHint = True
      object cbVerificaEstoqueOrcam: TDBCheckBox
        Left = 23
        Height = 17
        Top = 26
        Width = 244
        Caption = 'Permitir produtos com estoque mínimo'
        DataField = 'PRODSEMESTOQORCAM'
        DataSource = dsPadrao
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object cbEditOrcamConc: TDBCheckBox
        Left = 23
        Height = 17
        Top = 44
        Width = 242
        Caption = 'Permitir editar orçamentos concluídos'
        DataField = 'EDITORCAMCONC'
        DataSource = dsPadrao
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object cbOrcamNaoConc: TDBCheckBox
        Left = 23
        Height = 17
        Top = 62
        Width = 230
        Caption = 'Verificar orçamentos não concluídos'
        DataField = 'ORCAMNAOCONC'
        DataSource = dsPadrao
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
    end
    object TabCompras: TTabSheet
      Caption = ' &Compras '
      ClientHeight = 286
      ClientWidth = 719
      ImageIndex = 3
      ParentShowHint = False
      ShowHint = True
      object cbCompraNaoConc: TDBCheckBox
        Left = 23
        Height = 17
        Top = 26
        Width = 213
        Caption = 'Verificar compras não concluídas'
        DataField = 'COMPRANAOCONC'
        DataSource = dsPadrao
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object cbEditCompraConc: TDBCheckBox
        Left = 23
        Height = 17
        Top = 44
        Width = 219
        Caption = 'Permitir editar compras concluídas'
        DataField = 'EDITCOMPRACONC'
        DataSource = dsPadrao
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
    end
    object TabProdutos: TTabSheet
      Caption = ' &Produtos '
      ClientHeight = 286
      ClientWidth = 719
      ImageIndex = 4
      ParentShowHint = False
      ShowHint = True
      object dbeSenhaProduto: TDBEdit
        Left = 8
        Height = 33
        Top = 208
        Width = 121
        DataField = 'SENHAESTOQUE'
        DataSource = dsPadrao
        CharCase = ecNormal
        MaxLength = 0
        ParentShowHint = False
        PasswordChar = '*'
        ShowHint = True
        TabOrder = 4
      end
      object dbcbEstoqueSenhaProd: TDBCheckBox
        Left = 8
        Height = 17
        Top = 181
        Width = 243
        Caption = 'Pedir senha para alteração de estoque'
        DataField = 'USARSENHAESTOQUE'
        DataSource = dsPadrao
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dbcbBordaEtqProd: TDBCheckBox
        Left = 8
        Height = 17
        Top = 160
        Width = 224
        Caption = 'Exibir borda na etiqueta de produto '
        DataField = 'BORDAETQPROD'
        DataSource = dsPadrao
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dbcbLetraNumCodBarra: TDBCheckBox
        Left = 8
        Height = 17
        Top = 140
        Width = 220
        Caption = 'Permitir letras no código de barras'
        DataField = 'LETRACODIGOBARRA'
        DataSource = dsPadrao
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object grpValorProdutoPadrao: TGroupBox
        Left = 8
        Height = 130
        Top = 6
        Width = 369
        Caption = ' Valores Padrão '
        ClientHeight = 112
        ClientWidth = 367
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object dbeAliqPadrao: TDBEdit
          Left = 32
          Height = 33
          Hint = 'Pesquisar < F2 >'
          Top = 15
          Width = 130
          DataField = 'ALIQUOTAPADRAO'
          DataSource = dsPadrao
          ReadOnly = True
          CharCase = ecNormal
          Color = clBtnFace
          MaxLength = 0
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
        object dbeEstoquePadrao: TDBEdit
          Left = 204
          Height = 33
          Top = 15
          Width = 130
          DataField = 'ESTOQUEPADRAO'
          DataSource = dsPadrao
          CharCase = ecNormal
          MaxLength = 0
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnKeyPress = dbeEstoquePadraoKeyPress
        end
        object dbeDescontoPadrao: TDBEdit
          Left = 160
          Height = 33
          Top = 66
          Width = 130
          DataField = 'DESCPADRAOPROD'
          DataSource = dsPadrao
          CharCase = ecNormal
          MaxLength = 0
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnKeyPress = dbeDescontoPadraoKeyPress
        end
      end
      object btnAlterarSenhaProduto: TBitBtn
        Left = 8
        Height = 25
        Top = 248
        Width = 121
        Caption = '&Alterar Senha'
        OnClick = btnAlterarSenhaProdutoClick
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
      end
    end
    object TabCaixa: TTabSheet
      Caption = '    &Caixa    '
      ClientHeight = 286
      ClientWidth = 719
      ImageIndex = 5
      ParentShowHint = False
      ShowHint = True
      object dbeSenhaCaixa: TDBEdit
        Left = 8
        Height = 33
        Top = 135
        Width = 129
        DataField = 'SENHACAIXA'
        DataSource = dsPadrao
        CharCase = ecNormal
        MaxLength = 0
        ParentShowHint = False
        PasswordChar = '*'
        ShowHint = True
        TabOrder = 1
      end
      object dbcbMostrarSaldo: TDBCheckBox
        Left = 8
        Height = 17
        Top = 192
        Width = 152
        Caption = 'Mostrar saldo do caixa'
        DataField = 'MOSTRARSALDOCAIXA'
        DataSource = dsPadrao
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dbcbLanc90Dias: TDBCheckBox
        Left = 8
        Height = 17
        Top = 212
        Width = 257
        Caption = 'Mostrar lançamentos dos últimos 90 dias'
        DataField = 'CAIXA90DIAS'
        DataSource = dsPadrao
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object grpCaixaPadrao: TGroupBox
        Left = 8
        Height = 52
        Top = 5
        Width = 365
        Caption = ' Conta caixa padrão '
        ClientHeight = 34
        ClientWidth = 363
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object dbeCaixaPadrao: TDBEdit
          Left = 90
          Height = 33
          Hint = 'Pesquisar < F2 >'
          Top = 20
          Width = 239
          DataField = 'CAIXAPADRAO'
          DataSource = dsPadrao
          ReadOnly = True
          CharCase = ecNormal
          Color = clBtnFace
          MaxLength = 0
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
      end
      object grpContaCheque: TGroupBox
        Left = 8
        Height = 49
        Top = 64
        Width = 365
        Caption = 'Conta padrão para cheques'
        ClientHeight = 31
        ClientWidth = 363
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        object dbeContaCheque: TDBEdit
          Left = 90
          Height = 33
          Hint = 'Pesquisar < F2 >'
          Top = 18
          Width = 239
          DataField = 'NCONTACHEQUE'
          DataSource = dsPadrao
          ReadOnly = True
          CharCase = ecNormal
          Color = clBtnFace
          MaxLength = 0
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
      end
      object btnAlterarSenhaCaixa: TBitBtn
        Left = 8
        Height = 25
        Top = 160
        Width = 129
        Caption = 'Alterar senha'
        OnClick = btnAlterarSenhaCaixaClick
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
      end
    end
    object TabVenda: TTabSheet
      Caption = '&Vendas'
      ClientHeight = 286
      ClientWidth = 719
      ImageIndex = 6
      ParentShowHint = False
      ShowHint = True
      object chVendaEstoque: TDBCheckBox
        Left = 23
        Height = 17
        Top = 24
        Width = 244
        Caption = 'Permitir produtos com estoque mínimo'
        DataField = 'PRODSEMESTOQVENDA'
        DataSource = dsPadrao
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object chVendaConc: TDBCheckBox
        Left = 23
        Height = 17
        Top = 42
        Width = 202
        Caption = 'Verificar vendas não concluídas'
        DataField = 'VENDANAOCONC'
        DataSource = dsPadrao
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object chEditvenda: TDBCheckBox
        Left = 23
        Height = 17
        Top = 60
        Width = 211
        Caption = 'Permitir editar vendas concluídas'
        DataField = 'EDITVENDACONC'
        DataSource = dsPadrao
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
    end
    object TabClientes: TTabSheet
      Caption = '&Clientes'
      ClientHeight = 286
      ClientWidth = 719
      ImageIndex = 8
      ParentShowHint = False
      ShowHint = True
      object chBloqCli: TDBCheckBox
        Left = 23
        Height = 17
        Top = 24
        Width = 190
        Caption = 'Avisar quando exceder limite '
        DataField = 'AVISACLIENTEATRASO'
        DataSource = dsPadrao
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dbcbBordaEtq: TDBCheckBox
        Left = 23
        Height = 17
        Top = 44
        Width = 172
        Caption = 'Exibir borda nas etiquetas'
        DataField = 'BORDAETQCLIENTE'
        DataSource = dsPadrao
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
    end
    object TabExportacao: TTabSheet
      Caption = '&Exportação de dados'
      ClientHeight = 286
      ClientWidth = 719
      ImageIndex = 9
      ParentShowHint = False
      ShowHint = True
      object dbeDirExportacao: TDBEdit
        Left = 16
        Height = 33
        Top = 40
        Width = 321
        DataField = 'DIREXPORTPADRAO'
        DataSource = dsPadrao
        CharCase = ecNormal
        MaxLength = 0
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object btnLocalizar: TBitBtn
        Left = 339
        Height = 25
        Top = 38
        Width = 25
        Caption = '...'
        Font.CharSet = ANSI_CHARSET
        OnClick = btnLocalizarClick
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
    end
    object tsEmail: TTabSheet
      Caption = 'E-mail'
      ClientHeight = 286
      ClientWidth = 719
      ImageIndex = 10
      ParentShowHint = False
      ShowHint = True
      object grpEmail: TGroupBox
        Left = 16
        Height = 193
        Top = 8
        Width = 353
        Caption = ' Configurações '
        ClientHeight = 175
        ClientWidth = 351
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object btnTeste: TBitBtn
          Left = 261
          Height = 25
          Top = 152
          Width = 75
          Caption = 'Testar'
          OnClick = btnTesteClick
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
        end
        object edServidor: TEdit
          Left = 16
          Height = 33
          Top = 32
          Width = 249
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
        object edPorta: TEdit
          Left = 272
          Height = 33
          Top = 32
          Width = 65
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Text = '25'
        end
        object edUsuario: TEdit
          Left = 16
          Height = 33
          Top = 112
          Width = 193
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
        end
        object edSenha: TEdit
          Left = 216
          Height = 33
          Top = 112
          Width = 121
          EchoMode = emPassword
          ParentShowHint = False
          PasswordChar = '*'
          ShowHint = True
          TabOrder = 4
        end
        object chkAutenticacao: TCheckBox
          Left = 16
          Height = 23
          Top = 72
          Width = 230
          Caption = 'Meu servidor requer autenticação'
          OnClick = chkAutenticacaoClick
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
        end
      end
    end
    object tsRelatorio: TTabSheet
      Caption = 'Relatórios'
      ClientHeight = 286
      ClientWidth = 719
      ImageIndex = 12
      ParentShowHint = False
      ShowHint = True
      object dbckbRelZebrado: TDBCheckBox
        Left = 24
        Height = 17
        Top = 24
        Width = 129
        Caption = 'Visualizar zebrado'
        DataField = 'RELZEBRADO'
        DataSource = dsPadrao
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
    end
  end
  inherited actlNavigateActions: TActionList[3]
    Left = 416
    Top = 376
  end
  inherited dsPadrao: TDataSource[4]
    AutoEdit = True
    DataSet = ZQuery1
    Left = 192
    Top = 368
  end
  object opImagem: TOpenPictureDialog[5]
    Filter = 'JPEG Image File (*.jpg)|*.jpg|JPEG Image File (*.jpeg)|*.jpeg|Bitmaps (*.bmp)|*.bmp'
    Left = 280
    Top = 376
  end
  object ZUpdateSQL1: TZUpdateSQL[6]
    DeleteSQL.Strings = (
      'DELETE FROM CONFIGURACAO'
      'WHERE'
      '  CONFIGURACAO.IDCONFIGURACAO = :OLD_IDCONFIGURACAO'
    )
    InsertSQL.Strings = (
      'INSERT INTO CONFIGURACAO'
      '  (NOMECOMPUTADOR, BARRAFERRAMENTA, HINTBALAO, GRAVAERRO, BACKUP, LOG, '
      '   IMPRESSORA, RESOLUCAO, LETRACODIGOBARRA, EXIBEDICADIA, AVISACLIENTEATRASO, '
      '   DIREXPORTPADRAO, SENHAESTOQUE, USARSENHAESTOQUE, ESTOQUEPADRAO, BORDAETQPROD, '
      '   ALIQUOTAPADRAO, DESCPADRAOPROD, CAIXAPADRAO, SENHACAIXA, PRODSEMESTOQORCAM, '
      '   ORCAMNAOCONC, EDITORCAMCONC, COMPRANAOCONC, EDITCOMPRACONC, PRODSEMESTOQVENDA, '
      '   VENDANAOCONC, EDITVENDACONC, BORDAETQCLIENTE, MOSTRARSALDOCAIXA, CAIXA90DIAS, '
      '   RELZEBRADO, VERIFICA_UPD, CONTACHEQUE, INFOAVISOS, NCONTACHEQUE)'
      'VALUES'
      '  (:NOMECOMPUTADOR, :BARRAFERRAMENTA, :HINTBALAO, :GRAVAERRO, :BACKUP, '
      '   :LOG, :IMPRESSORA, :RESOLUCAO, :LETRACODIGOBARRA, :EXIBEDICADIA, :AVISACLIENTEATRASO, '
      '   :DIREXPORTPADRAO, :SENHAESTOQUE, :USARSENHAESTOQUE, :ESTOQUEPADRAO, '
      '   :BORDAETQPROD, :ALIQUOTAPADRAO, :DESCPADRAOPROD, :CAIXAPADRAO, :SENHACAIXA, '
      '   :PRODSEMESTOQORCAM, :ORCAMNAOCONC, :EDITORCAMCONC, :COMPRANAOCONC, :EDITCOMPRACONC, '
      '   :PRODSEMESTOQVENDA, :VENDANAOCONC, :EDITVENDACONC, :BORDAETQCLIENTE, '
      '   :MOSTRARSALDOCAIXA, :CAIXA90DIAS, :RELZEBRADO, :VERIFICA_UPD, :CONTACHEQUE, '
      '   :INFOAVISOS, :NCONTACHEQUE)'
    )
    ModifySQL.Strings = (
      'UPDATE CONFIGURACAO SET'
      '  NOMECOMPUTADOR = :NOMECOMPUTADOR,'
      '  BARRAFERRAMENTA = :BARRAFERRAMENTA,'
      '  HINTBALAO = :HINTBALAO,'
      '  GRAVAERRO = :GRAVAERRO,'
      '  BACKUP = :BACKUP,'
      '  LOG = :LOG,'
      '  IMPRESSORA = :IMPRESSORA,'
      '  RESOLUCAO = :RESOLUCAO,'
      '  LETRACODIGOBARRA = :LETRACODIGOBARRA,'
      '  EXIBEDICADIA = :EXIBEDICADIA,'
      '  AVISACLIENTEATRASO = :AVISACLIENTEATRASO,'
      '  DIREXPORTPADRAO = :DIREXPORTPADRAO,'
      '  SENHAESTOQUE = :SENHAESTOQUE,'
      '  USARSENHAESTOQUE = :USARSENHAESTOQUE,'
      '  ESTOQUEPADRAO = :ESTOQUEPADRAO,'
      '  BORDAETQPROD = :BORDAETQPROD,'
      '  ALIQUOTAPADRAO = :ALIQUOTAPADRAO,'
      '  DESCPADRAOPROD = :DESCPADRAOPROD,'
      '  CAIXAPADRAO = :CAIXAPADRAO,'
      '  SENHACAIXA = :SENHACAIXA,'
      '  PRODSEMESTOQORCAM = :PRODSEMESTOQORCAM,'
      '  ORCAMNAOCONC = :ORCAMNAOCONC,'
      '  EDITORCAMCONC = :EDITORCAMCONC,'
      '  COMPRANAOCONC = :COMPRANAOCONC,'
      '  EDITCOMPRACONC = :EDITCOMPRACONC,'
      '  PRODSEMESTOQVENDA = :PRODSEMESTOQVENDA,'
      '  VENDANAOCONC = :VENDANAOCONC,'
      '  EDITVENDACONC = :EDITVENDACONC,'
      '  BORDAETQCLIENTE = :BORDAETQCLIENTE,'
      '  MOSTRARSALDOCAIXA = :MOSTRARSALDOCAIXA,'
      '  CAIXA90DIAS = :CAIXA90DIAS,'
      '  RELZEBRADO = :RELZEBRADO,'
      '  VERIFICA_UPD = :VERIFICA_UPD,'
      '  CONTACHEQUE = :CONTACHEQUE,'
      '  INFOAVISOS = :INFOAVISOS,'
      '  NCONTACHEQUE = :NCONTACHEQUE'
      'WHERE'
      '  CONFIGURACAO.IDCONFIGURACAO = :OLD_IDCONFIGURACAO'
    )
    UseSequenceFieldForRefreshSQL = False
    Left = 112
    Top = 368
    ParamData = <    
      item
        DataType = ftUnknown
        Name = 'NOMECOMPUTADOR'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'BARRAFERRAMENTA'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'HINTBALAO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'GRAVAERRO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'BACKUP'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'LOG'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'IMPRESSORA'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'RESOLUCAO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'LETRACODIGOBARRA'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'EXIBEDICADIA'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'AVISACLIENTEATRASO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'DIREXPORTPADRAO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'SENHAESTOQUE'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'USARSENHAESTOQUE'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'ESTOQUEPADRAO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'BORDAETQPROD'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'ALIQUOTAPADRAO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'DESCPADRAOPROD'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'CAIXAPADRAO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'SENHACAIXA'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'PRODSEMESTOQORCAM'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'ORCAMNAOCONC'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'EDITORCAMCONC'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'COMPRANAOCONC'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'EDITCOMPRACONC'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'PRODSEMESTOQVENDA'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'VENDANAOCONC'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'EDITVENDACONC'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'BORDAETQCLIENTE'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'MOSTRARSALDOCAIXA'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'CAIXA90DIAS'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'RELZEBRADO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'VERIFICA_UPD'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'CONTACHEQUE'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'INFOAVISOS'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'NCONTACHEQUE'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'OLD_IDCONFIGURACAO'
        ParamType = ptUnknown
      end>
  end
  object ZQuery1: TZQuery[7]
    Connection = DmPrincipal.ZConnection1
    UpdateObject = ZUpdateSQL1
    SQL.Strings = (
      'select * from CONFIGURACAO'
    )
    Params = <>
    Left = 30
    Top = 368
  end
end
