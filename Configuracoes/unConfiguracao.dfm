inherited frmConfiguracao: TfrmConfiguracao
  Left = 221
  Top = 141
  ClientHeight = 380
  ClientWidth = 754
  Caption = 'frmConfiguracao'
  OldCreateOrder = True
  ExplicitWidth = 760
  ExplicitHeight = 409
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbStatus: TStatusBar
    Top = 361
    Width = 754
    ExplicitTop = 361
    ExplicitWidth = 754
  end
  inherited pnBotoesPadrao: TPanel
    Width = 754
    ExplicitWidth = 754
  end
  object PgConfig: TPageControl [2]
    Left = 8
    Top = 36
    Width = 729
    Height = 317
    Hint = ''
    ShowHint = True
    ActivePage = TabImg
    TabOrder = 1
    object Tabgeral: TTabSheet
      Hint = ''
      ShowHint = True
      Caption = '    &Geral    '
      object chAtalhos: TDBCheckBox
        Left = 23
        Top = 26
        Width = 259
        Height = 17
        Hint = 'Ativar barra de atalhos na tela principal'
        ShowHint = True
        DataField = 'BARRAFERRAMENTA'
        DataSource = dsPadrao
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        Caption = 'Mostrar barra de atalhos na tela principal'
        TabOrder = 0
      end
      object chHint: TDBCheckBox
        Left = 23
        Top = 44
        Width = 166
        Height = 17
        Hint = 'Mensagem de informa'#231#227'o na forma de bal'#227'o'
        ShowHint = True
        DataField = 'HINTBALAO'
        DataSource = dsPadrao
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        Caption = 'Mostrar hints estilo bal'#227'o'
        TabOrder = 1
      end
      object chErro: TDBCheckBox
        Left = 23
        Top = 63
        Width = 162
        Height = 17
        Hint = 'Grava todos os erros que o sistema gerar'
        ShowHint = True
        DataField = 'GRAVAERRO'
        DataSource = dsPadrao
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        Caption = 'Gravar erros do sistema'
        TabOrder = 2
      end
      object chBackup: TDBCheckBox
        Left = 23
        Top = 81
        Width = 224
        Height = 17
        Hint = 'Sugere copia de seguran'#231'a ao finalizar o sistema'
        ShowHint = True
        DataField = 'BACKUP'
        DataSource = dsPadrao
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        Caption = 'Sugerir c'#243'pia de seguran'#231'a ao sair'
        TabOrder = 3
      end
      object chResolucao: TDBCheckBox
        Left = 23
        Top = 100
        Width = 186
        Height = 17
        Hint = ''
        ShowHint = True
        DataField = 'RESOLUCAO'
        DataSource = dsPadrao
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        Caption = 'Verificar resolu'#231#227'o ao iniciar'
        TabOrder = 4
      end
      object chLog: TDBCheckBox
        Left = 23
        Top = 118
        Width = 258
        Height = 17
        Hint = 'Grava as transa'#231#245'es do banco de dados'
        ShowHint = True
        DataField = 'LOG'
        DataSource = dsPadrao
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        Caption = 'Gerar log de registro do banco de dados'
        TabOrder = 5
      end
      object chImpressora: TDBCheckBox
        Left = 23
        Top = 137
        Width = 137
        Height = 17
        Hint = ''
        ShowHint = True
        DataField = 'IMPRESSORA'
        DataSource = dsPadrao
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        Caption = 'Verificar impressora'
        TabOrder = 6
      end
      object chDica: TDBCheckBox
        Left = 23
        Top = 155
        Width = 188
        Height = 17
        Hint = ''
        ShowHint = True
        DataField = 'EXIBEDICADIA'
        DataSource = dsPadrao
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        Caption = 'Mostrar dica do dia ao iniciar'
        TabOrder = 7
      end
      object dbckbVerificaUpd: TDBCheckBox
        Left = 23
        Top = 174
        Width = 249
        Height = 17
        Hint = ''
        ShowHint = True
        DataField = 'VERIFICA_UPD'
        DataSource = dsPadrao
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        Caption = 'Verificar atualiza'#231#245'es autom'#225'ticamente'
        TabOrder = 8
      end
      object dbchkInfoAvisos: TDBCheckBox
        Left = 23
        Top = 192
        Width = 241
        Height = 17
        Hint = ''
        ShowHint = True
        DataField = 'INFOAVISOS'
        DataSource = dsPadrao
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        Caption = 'Exibir informa'#231#245'es a avisos ao iniciar'
        TabOrder = 9
      end
    end
    object TabImg: TTabSheet
      Hint = ''
      ShowHint = True
      ImageIndex = 1
      Caption = 'Papel &Parede'
      object imgPapelParede: TImage
        Left = 8
        Top = 10
        Width = 367
        Height = 184
        Hint = 'Imagem do papel de parede'
        ShowHint = True
      end
      object btnBuscar: TBitBtn
        Left = 12
        Top = 212
        Width = 80
        Height = 25
        Hint = 'Procurar'
        ShowHint = True
        Caption = '&Procurar'
        TabOrder = 0
        OnClick = btnBuscarClick
      end
      object btnExImg: TBitBtn
        Left = 100
        Top = 212
        Width = 80
        Height = 25
        Hint = ''
        ShowHint = True
        Caption = '&Limpar'
        TabOrder = 1
        OnClick = btnExImgClick
      end
      object rgOrientationImg: TRadioGroup
        Left = 194
        Top = 198
        Width = 184
        Height = 49
        Hint = ''
        ShowHint = True
        Items.Strings = (
          'Lado a lado'
          'Estender')
        ItemIndex = 1
        Caption = ' Orienta'#231#227'o '
        TabOrder = 2
        TabStop = False
        OnClick = rgOrientationImgClick
      end
    end
    object TabOrcam: TTabSheet
      Hint = ''
      ShowHint = True
      ImageIndex = 2
      Caption = '&Or'#231'amentos'
      object cbVerificaEstoqueOrcam: TDBCheckBox
        Left = 23
        Top = 26
        Width = 244
        Height = 17
        Hint = ''
        ShowHint = True
        DataField = 'PRODSEMESTOQORCAM'
        DataSource = dsPadrao
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        Caption = 'Permitir produtos com estoque m'#237'nimo'
        TabOrder = 0
      end
      object cbEditOrcamConc: TDBCheckBox
        Left = 23
        Top = 44
        Width = 242
        Height = 17
        Hint = ''
        ShowHint = True
        DataField = 'EDITORCAMCONC'
        DataSource = dsPadrao
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        Caption = 'Permitir editar or'#231'amentos conclu'#237'dos'
        TabOrder = 1
      end
      object cbOrcamNaoConc: TDBCheckBox
        Left = 23
        Top = 62
        Width = 230
        Height = 17
        Hint = ''
        ShowHint = True
        DataField = 'ORCAMNAOCONC'
        DataSource = dsPadrao
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        Caption = 'Verificar or'#231'amentos n'#227'o conclu'#237'dos'
        TabOrder = 2
      end
    end
    object TabCompras: TTabSheet
      Hint = ''
      ShowHint = True
      ImageIndex = 3
      Caption = ' &Compras '
      object cbCompraNaoConc: TDBCheckBox
        Left = 23
        Top = 26
        Width = 213
        Height = 17
        Hint = ''
        ShowHint = True
        DataField = 'COMPRANAOCONC'
        DataSource = dsPadrao
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        Caption = 'Verificar compras n'#227'o conclu'#237'das'
        TabOrder = 0
      end
      object cbEditCompraConc: TDBCheckBox
        Left = 23
        Top = 44
        Width = 219
        Height = 17
        Hint = ''
        ShowHint = True
        DataField = 'EDITCOMPRACONC'
        DataSource = dsPadrao
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        Caption = 'Permitir editar compras conclu'#237'das'
        TabOrder = 1
      end
    end
    object TabProdutos: TTabSheet
      Hint = ''
      ShowHint = True
      ImageIndex = 4
      Caption = ' &Produtos '
      object dbeSenhaProduto: TDBEdit
        Left = 8
        Top = 187
        Width = 121
        Height = 21
        Hint = ''
        ShowHint = True
        DataField = 'SENHAESTOQUE'
        DataSource = dsPadrao
        PasswordChar = '*'
        TabOrder = 4
      end
      object dbcbEstoqueSenhaProd: TDBCheckBox
        Left = 8
        Top = 148
        Width = 243
        Height = 17
        Hint = ''
        ShowHint = True
        DataField = 'USARSENHAESTOQUE'
        DataSource = dsPadrao
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        Caption = 'Pedir senha para altera'#231#227'o de estoque'
        TabOrder = 3
      end
      object dbcbBordaEtqProd: TDBCheckBox
        Left = 8
        Top = 127
        Width = 224
        Height = 17
        Hint = ''
        ShowHint = True
        DataField = 'BORDAETQPROD'
        DataSource = dsPadrao
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        Caption = 'Exibir borda na etiqueta de produto '
        TabOrder = 2
      end
      object dbcbLetraNumCodBarra: TDBCheckBox
        Left = 8
        Top = 107
        Width = 220
        Height = 17
        Hint = ''
        ShowHint = True
        DataField = 'LETRACODIGOBARRA'
        DataSource = dsPadrao
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        Caption = 'Permitir letras no c'#243'digo de barras'
        TabOrder = 1
      end
      object grpValorProdutoPadrao: TGroupBox
        Left = 8
        Top = 6
        Width = 369
        Height = 97
        Hint = ''
        ShowHint = True
        Caption = ' Valores Padr'#227'o '
        TabOrder = 0
        TabStop = False
        object dbeAliqPadrao: TDBEdit
          Left = 204
          Top = 15
          Width = 130
          Height = 21
          Hint = 'Pesquisar < F2 >'
          ShowHint = True
          DataField = 'ALIQUOTA'
          DataSource = dsPadrao
          ParentFont = False
          TabOrder = 0
          Color = clBtnFace
          ReadOnly = True
        end
        object dbeEstoquePadrao: TDBEdit
          Left = 204
          Top = 40
          Width = 130
          Height = 21
          Hint = ''
          ShowHint = True
          DataField = 'ESTOQUEPADRAO'
          DataSource = dsPadrao
          ParentFont = False
          TabOrder = 1
          OnKeyPress = dbeEstoquePadraoKeyPress
        end
        object dbeDescontoPadrao: TDBEdit
          Left = 204
          Top = 66
          Width = 130
          Height = 21
          Hint = ''
          ShowHint = True
          DataField = 'DESCPADRAOPROD'
          DataSource = dsPadrao
          ParentFont = False
          TabOrder = 2
          OnKeyPress = dbeDescontoPadraoKeyPress
        end
      end
      object btnAlterarSenhaProduto: TBitBtn
        Left = 8
        Top = 213
        Width = 121
        Height = 25
        Hint = ''
        ShowHint = True
        Caption = '&Alterar Senha'
        TabOrder = 5
        OnClick = btnAlterarSenhaProdutoClick
      end
    end
    object TabCaixa: TTabSheet
      Hint = ''
      ShowHint = True
      ImageIndex = 5
      Caption = '    &Caixa    '
      object dbeSenhaCaixa: TDBEdit
        Left = 8
        Top = 135
        Width = 129
        Height = 21
        Hint = ''
        ShowHint = True
        DataField = 'SENHACAIXA'
        DataSource = dsPadrao
        PasswordChar = '*'
        TabOrder = 1
      end
      object dbcbMostrarSaldo: TDBCheckBox
        Left = 8
        Top = 192
        Width = 152
        Height = 17
        Hint = ''
        ShowHint = True
        DataField = 'MOSTRARSALDOCAIXA'
        DataSource = dsPadrao
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        Caption = 'Mostrar saldo do caixa'
        TabOrder = 3
      end
      object dbcbLanc90Dias: TDBCheckBox
        Left = 8
        Top = 212
        Width = 257
        Height = 17
        Hint = ''
        ShowHint = True
        DataField = 'CAIXA90DIAS'
        DataSource = dsPadrao
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        Caption = 'Mostrar lan'#231'amentos dos '#250'ltimos 90 dias'
        TabOrder = 2
      end
      object grpCaixaPadrao: TGroupBox
        Left = 8
        Top = 5
        Width = 365
        Height = 52
        Hint = ''
        ShowHint = True
        Caption = ' Conta caixa padr'#227'o '
        TabOrder = 0
        TabStop = False
        object dbeCaixaPadrao: TDBEdit
          Left = 90
          Top = 20
          Width = 239
          Height = 21
          Hint = 'Pesquisar < F2 >'
          ShowHint = True
          DataField = 'CAIXA'
          DataSource = dsPadrao
          ParentFont = False
          TabOrder = 0
          Color = clBtnFace
          ReadOnly = True
        end
      end
      object grpContaCheque: TGroupBox
        Left = 8
        Top = 64
        Width = 365
        Height = 49
        Hint = ''
        ShowHint = True
        Caption = 'Conta padr'#227'o para cheques'
        TabOrder = 5
        TabStop = False
        object dbeContaCheque: TDBEdit
          Left = 90
          Top = 18
          Width = 239
          Height = 21
          Hint = 'Pesquisar < F2 >'
          ShowHint = True
          DataField = 'NCONTACHEQUE'
          DataSource = dsPadrao
          ParentFont = False
          TabOrder = 0
          Color = clBtnFace
          ReadOnly = True
        end
      end
      object btnAlterarSenhaCaixa: TBitBtn
        Left = 8
        Top = 160
        Width = 129
        Height = 25
        Hint = ''
        ShowHint = True
        Caption = 'Alterar senha'
        TabOrder = 4
        OnClick = btnAlterarSenhaCaixaClick
      end
    end
    object TabVenda: TTabSheet
      Hint = ''
      ShowHint = True
      ImageIndex = 6
      Caption = '&Vendas'
      object chVendaEstoque: TDBCheckBox
        Left = 23
        Top = 24
        Width = 244
        Height = 17
        Hint = ''
        ShowHint = True
        DataField = 'PRODSEMESTOQVENDA'
        DataSource = dsPadrao
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        Caption = 'Permitir produtos com estoque m'#237'nimo'
        TabOrder = 0
      end
      object chVendaConc: TDBCheckBox
        Left = 23
        Top = 42
        Width = 202
        Height = 17
        Hint = ''
        ShowHint = True
        DataField = 'VENDANAOCONC'
        DataSource = dsPadrao
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        Caption = 'Verificar vendas n'#227'o conclu'#237'das'
        TabOrder = 1
      end
      object chEditvenda: TDBCheckBox
        Left = 23
        Top = 60
        Width = 211
        Height = 17
        Hint = ''
        ShowHint = True
        DataField = 'EDITVENDACONC'
        DataSource = dsPadrao
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        Caption = 'Permitir editar vendas conclu'#237'das'
        TabOrder = 2
      end
    end
    object TabClientes: TTabSheet
      Hint = ''
      ShowHint = True
      ImageIndex = 8
      Caption = '&Clientes'
      object chBloqCli: TDBCheckBox
        Left = 23
        Top = 24
        Width = 190
        Height = 17
        Hint = ''
        ShowHint = True
        DataField = 'AVISACLIENTEATRASO'
        DataSource = dsPadrao
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        Caption = 'Avisar quando exceder limite '
        TabOrder = 0
      end
      object dbcbBordaEtq: TDBCheckBox
        Left = 23
        Top = 44
        Width = 172
        Height = 17
        Hint = ''
        ShowHint = True
        DataField = 'BORDAETQCLIENTE'
        DataSource = dsPadrao
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        Caption = 'Exibir borda nas etiquetas'
        TabOrder = 1
      end
    end
    object TabExportacao: TTabSheet
      Hint = ''
      ShowHint = True
      ImageIndex = 9
      Caption = '&Exporta'#231#227'o de dados'
      object dbeDirExportacao: TDBEdit
        Left = 16
        Top = 40
        Width = 321
        Height = 21
        Hint = ''
        ShowHint = True
        DataField = 'DIREXPORTPADRAO'
        DataSource = dsPadrao
        TabOrder = 1
      end
      object btnLocalizar: TBitBtn
        Left = 339
        Top = 38
        Width = 25
        Height = 25
        Hint = ''
        ShowHint = True
        Caption = '...'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        TabOrder = 0
        OnClick = btnLocalizarClick
      end
    end
    object tsEmail: TTabSheet
      Hint = ''
      ShowHint = True
      ImageIndex = 10
      Caption = 'E-mail'
      object grpEmail: TGroupBox
        Left = 16
        Top = 8
        Width = 353
        Height = 193
        Hint = ''
        ShowHint = True
        Caption = ' Configura'#231#245'es '
        TabOrder = 0
        TabStop = False
        object btnTeste: TBitBtn
          Left = 261
          Top = 152
          Width = 75
          Height = 25
          Hint = ''
          ShowHint = True
          Caption = 'Testar'
          TabOrder = 5
          OnClick = btnTesteClick
        end
        object edServidor: TEdit
          Left = 16
          Top = 32
          Width = 249
          Height = 21
          Hint = ''
          ShowHint = True
          Text = ''
          TabOrder = 0
        end
        object edPorta: TEdit
          Left = 272
          Top = 32
          Width = 65
          Height = 21
          Hint = ''
          ShowHint = True
          Text = '25'
          TabOrder = 1
        end
        object edUsuario: TEdit
          Left = 16
          Top = 112
          Width = 193
          Height = 21
          Hint = ''
          ShowHint = True
          Text = ''
          TabOrder = 3
        end
        object edSenha: TEdit
          Left = 216
          Top = 112
          Width = 121
          Height = 21
          Hint = ''
          ShowHint = True
          PasswordChar = '*'
          Text = ''
          TabOrder = 4
        end
        object chkAutenticacao: TCheckBox
          Left = 16
          Top = 72
          Width = 217
          Height = 17
          Hint = ''
          ShowHint = True
          Caption = 'Meu servidor requer autentica'#231#227'o'
          TabOrder = 2
          OnClick = chkAutenticacaoClick
        end
      end
    end
    object tsRelatorio: TTabSheet
      Hint = ''
      ShowHint = True
      ImageIndex = 12
      Caption = 'Relat'#243'rios'
      object dbckbRelZebrado: TDBCheckBox
        Left = 24
        Top = 24
        Width = 129
        Height = 17
        Hint = ''
        ShowHint = True
        DataField = 'RELZEBRADO'
        DataSource = dsPadrao
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        Caption = 'Visualizar zebrado'
        TabOrder = 0
      end
    end
  end
  inherited actlNavigateActions: TActionList
    Left = 286
    Top = 318
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 111
    Top = 318
  end
  object sqldPadrao: TSQLDataSet
    CommandText = 
      'select'#13#10' c.IDCONFIGURACAO,'#13#10' c.NOMECOMPUTADOR,'#13#10' c.BARRAFERRAMEN' +
      'TA,'#13#10' c.HINTBALAO,'#13#10' c.GRAVAERRO,'#13#10' c.BACKUP,'#13#10' c.LOG,'#13#10' c.IMPRE' +
      'SSORA,'#13#10' c.RESOLUCAO,'#13#10' c.LETRACODIGOBARRA,'#13#10' c.EXIBEDICADIA,'#13#10' ' +
      'c.AVISACLIENTEATRASO,'#13#10' c.DIREXPORTPADRAO,'#13#10' c.SENHAESTOQUE,'#13#10' c' +
      '.USARSENHAESTOQUE,'#13#10' c.ESTOQUEPADRAO,'#13#10' c.BORDAETQPROD,'#13#10' c.ALIQ' +
      'UOTAPADRAO,'#13#10' a.DESCRICAO as ALIQUOTA,'#13#10' c.DESCPADRAOPROD,'#13#10' c.C' +
      'AIXAPADRAO,'#13#10' cx.NOME as CAIXA, '#13#10' c.SENHACAIXA,'#13#10' c.PRODSEMESTO' +
      'QORCAM,'#13#10' c.ORCAMNAOCONC,'#13#10' c.EDITORCAMCONC,'#13#10' c.COMPRANAOCONC,'#13 +
      #10' c.EDITCOMPRACONC,'#13#10' c.PRODSEMESTOQVENDA,'#13#10' c.VENDANAOCONC,'#13#10' c' +
      '.EDITVENDACONC,'#13#10' c.BORDAETQCLIENTE,'#13#10' c.MOSTRARSALDOCAIXA,'#13#10' c.' +
      'CAIXA90DIAS,'#13#10' c.INFOAVISOS,'#13#10' c.RELZEBRADO,'#13#10' c.VERIFICA_UPD,'#13#10 +
      ' c.CONTACHEQUE,'#13#10' cx2.NOME as NCONTACHEQUE'#13#10'from CONFIGURACAO c'#13 +
      #10'left join ALIQUOTAS a on (a.CODALIQUOTA = c.ALIQUOTAPADRAO)'#13#10'le' +
      'ft join CAIXAS cx on (cx.CODIGO = c.CAIXAPADRAO)'#13#10'left join CAIX' +
      'AS cx2 on (cx2.CODIGO = c.CONTACHEQUE)'#13#10'where c.NOMECOMPUTADOR =' +
      ' :PCOMP'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'PCOMP'
        ParamType = ptInput
      end>
    Left = 14
    Top = 318
    object sqldPadraoIDCONFIGURACAO: TIntegerField
      FieldName = 'IDCONFIGURACAO'
      Required = True
    end
    object sqldPadraoNOMECOMPUTADOR: TStringField
      FieldName = 'NOMECOMPUTADOR'
      Size = 80
    end
    object sqldPadraoBARRAFERRAMENTA: TStringField
      FieldName = 'BARRAFERRAMENTA'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoHINTBALAO: TStringField
      FieldName = 'HINTBALAO'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoGRAVAERRO: TStringField
      FieldName = 'GRAVAERRO'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoBACKUP: TStringField
      FieldName = 'BACKUP'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoLOG: TStringField
      FieldName = 'LOG'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoIMPRESSORA: TStringField
      FieldName = 'IMPRESSORA'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoRESOLUCAO: TStringField
      FieldName = 'RESOLUCAO'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoLETRACODIGOBARRA: TStringField
      FieldName = 'LETRACODIGOBARRA'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoEXIBEDICADIA: TStringField
      FieldName = 'EXIBEDICADIA'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoAVISACLIENTEATRASO: TStringField
      FieldName = 'AVISACLIENTEATRASO'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoDIREXPORTPADRAO: TStringField
      FieldName = 'DIREXPORTPADRAO'
      Size = 250
    end
    object sqldPadraoSENHAESTOQUE: TStringField
      FieldName = 'SENHAESTOQUE'
      Size = 10
    end
    object sqldPadraoUSARSENHAESTOQUE: TStringField
      FieldName = 'USARSENHAESTOQUE'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoESTOQUEPADRAO: TIntegerField
      FieldName = 'ESTOQUEPADRAO'
    end
    object sqldPadraoBORDAETQPROD: TStringField
      FieldName = 'BORDAETQPROD'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoALIQUOTAPADRAO: TIntegerField
      FieldName = 'ALIQUOTAPADRAO'
      Required = True
    end
    object sqldPadraoALIQUOTA: TStringField
      FieldName = 'ALIQUOTA'
      ProviderFlags = []
    end
    object sqldPadraoDESCPADRAOPROD: TFMTBCDField
      FieldName = 'DESCPADRAOPROD'
      Precision = 15
    end
    object sqldPadraoCAIXAPADRAO: TIntegerField
      FieldName = 'CAIXAPADRAO'
      Required = True
    end
    object sqldPadraoCAIXA: TStringField
      FieldName = 'CAIXA'
      ProviderFlags = []
      Size = 80
    end
    object sqldPadraoSENHACAIXA: TStringField
      FieldName = 'SENHACAIXA'
      Size = 10
    end
    object sqldPadraoPRODSEMESTOQORCAM: TStringField
      FieldName = 'PRODSEMESTOQORCAM'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoORCAMNAOCONC: TStringField
      FieldName = 'ORCAMNAOCONC'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoEDITORCAMCONC: TStringField
      FieldName = 'EDITORCAMCONC'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoCOMPRANAOCONC: TStringField
      FieldName = 'COMPRANAOCONC'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoEDITCOMPRACONC: TStringField
      FieldName = 'EDITCOMPRACONC'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoPRODSEMESTOQVENDA: TStringField
      FieldName = 'PRODSEMESTOQVENDA'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoVENDANAOCONC: TStringField
      FieldName = 'VENDANAOCONC'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoEDITVENDACONC: TStringField
      FieldName = 'EDITVENDACONC'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoBORDAETQCLIENTE: TStringField
      FieldName = 'BORDAETQCLIENTE'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoMOSTRARSALDOCAIXA: TStringField
      FieldName = 'MOSTRARSALDOCAIXA'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoCAIXA90DIAS: TStringField
      FieldName = 'CAIXA90DIAS'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoRELZEBRADO: TStringField
      FieldName = 'RELZEBRADO'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoVERIFICA_UPD: TStringField
      FieldName = 'VERIFICA_UPD'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoCONTACHEQUE: TIntegerField
      FieldName = 'CONTACHEQUE'
    end
    object sqldPadraoNCONTACHEQUE: TStringField
      FieldName = 'NCONTACHEQUE'
      ProviderFlags = []
      Size = 80
    end
    object sqldPadraoINFOAVISOS: TStringField
      FieldName = 'INFOAVISOS'
      FixedChar = True
      Size = 1
    end
  end
  object dspPadrao: TDataSetProvider
    DataSet = sqldPadrao
    Options = [poAllowCommandText]
    Left = 48
    Top = 318
  end
  object cdsPadrao: TMemDataset
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'PCOMP'
        ParamType = ptInput
      end>
    ProviderName = 'dspPadrao'
    Left = 80
    Top = 318
    object cdsPadraoIDCONFIGURACAO: TIntegerField
      FieldName = 'IDCONFIGURACAO'
      Required = True
    end
    object cdsPadraoNOMECOMPUTADOR: TStringField
      FieldName = 'NOMECOMPUTADOR'
      Size = 80
    end
    object cdsPadraoBARRAFERRAMENTA: TStringField
      FieldName = 'BARRAFERRAMENTA'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoHINTBALAO: TStringField
      FieldName = 'HINTBALAO'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoGRAVAERRO: TStringField
      FieldName = 'GRAVAERRO'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoBACKUP: TStringField
      FieldName = 'BACKUP'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoLOG: TStringField
      FieldName = 'LOG'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoIMPRESSORA: TStringField
      FieldName = 'IMPRESSORA'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoRESOLUCAO: TStringField
      FieldName = 'RESOLUCAO'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoLETRACODIGOBARRA: TStringField
      FieldName = 'LETRACODIGOBARRA'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoEXIBEDICADIA: TStringField
      FieldName = 'EXIBEDICADIA'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoAVISACLIENTEATRASO: TStringField
      FieldName = 'AVISACLIENTEATRASO'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoDIREXPORTPADRAO: TStringField
      FieldName = 'DIREXPORTPADRAO'
      Size = 250
    end
    object cdsPadraoSENHAESTOQUE: TStringField
      FieldName = 'SENHAESTOQUE'
      Size = 10
    end
    object cdsPadraoUSARSENHAESTOQUE: TStringField
      FieldName = 'USARSENHAESTOQUE'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoESTOQUEPADRAO: TIntegerField
      FieldName = 'ESTOQUEPADRAO'
    end
    object cdsPadraoBORDAETQPROD: TStringField
      FieldName = 'BORDAETQPROD'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoALIQUOTAPADRAO: TIntegerField
      FieldName = 'ALIQUOTAPADRAO'
      Required = True
    end
    object cdsPadraoALIQUOTA: TStringField
      FieldName = 'ALIQUOTA'
      ProviderFlags = []
    end
    object cdsPadraoDESCPADRAOPROD: TFMTBCDField
      FieldName = 'DESCPADRAOPROD'
      Precision = 15
    end
    object cdsPadraoCAIXAPADRAO: TIntegerField
      FieldName = 'CAIXAPADRAO'
      Required = True
    end
    object cdsPadraoCAIXA: TStringField
      FieldName = 'CAIXA'
      ProviderFlags = []
      Size = 80
    end
    object cdsPadraoSENHACAIXA: TStringField
      FieldName = 'SENHACAIXA'
      Size = 10
    end
    object cdsPadraoPRODSEMESTOQORCAM: TStringField
      FieldName = 'PRODSEMESTOQORCAM'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoORCAMNAOCONC: TStringField
      FieldName = 'ORCAMNAOCONC'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoEDITORCAMCONC: TStringField
      FieldName = 'EDITORCAMCONC'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoCOMPRANAOCONC: TStringField
      FieldName = 'COMPRANAOCONC'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoEDITCOMPRACONC: TStringField
      FieldName = 'EDITCOMPRACONC'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoPRODSEMESTOQVENDA: TStringField
      FieldName = 'PRODSEMESTOQVENDA'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoVENDANAOCONC: TStringField
      FieldName = 'VENDANAOCONC'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoEDITVENDACONC: TStringField
      FieldName = 'EDITVENDACONC'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoBORDAETQCLIENTE: TStringField
      FieldName = 'BORDAETQCLIENTE'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoMOSTRARSALDOCAIXA: TStringField
      FieldName = 'MOSTRARSALDOCAIXA'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoCAIXA90DIAS: TStringField
      FieldName = 'CAIXA90DIAS'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoRELZEBRADO: TStringField
      FieldName = 'RELZEBRADO'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoVERIFICA_UPD: TStringField
      FieldName = 'VERIFICA_UPD'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoCONTACHEQUE: TIntegerField
      FieldName = 'CONTACHEQUE'
    end
    object cdsPadraoNCONTACHEQUE: TStringField
      FieldName = 'NCONTACHEQUE'
      ProviderFlags = []
      Size = 80
    end
    object cdsPadraoINFOAVISOS: TStringField
      FieldName = 'INFOAVISOS'
      FixedChar = True
      Size = 1
    end
  end
  object opImagem: TOpenPictureDialog
    Filter = 
      'JPEG Image File (*.jpg)|*.jpg|JPEG Image File (*.jpeg)|*.jpeg|Bi' +
      'tmaps (*.bmp)|*.bmp'
    Left = 254
    Top = 318
  end
  object IdSMTP: TIdSMTP
    SASLMechanisms = <>
    Left = 149
    Top = 318
  end
  object IdMsg: TIdMessage
    AttachmentEncoding = 'MIME'
    BccList = <>
    CCList = <>
    Encoding = meMIME
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 180
    Top = 318
  end
end
