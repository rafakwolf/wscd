inherited frmConfiguracao: TfrmConfiguracao
  Left = 221
  Top = 141
  Caption = 'frmConfiguracao'
  ClientHeight = 380
  ClientWidth = 409
  OldCreateOrder = True
  ExplicitWidth = 415
  ExplicitHeight = 429
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbStatus: TStatusBar
    Top = 361
    Width = 409
    ExplicitTop = 361
    ExplicitWidth = 409
  end
  inherited pnBotoesPadrao: TPanel
    Width = 409
    ExplicitWidth = 409
  end
  object PgConfig: TPageControl [2]
    Left = 8
    Top = 36
    Width = 394
    Height = 317
    ActivePage = tsEmail
    MultiLine = True
    TabOrder = 1
    object Tabgeral: TTabSheet
      Caption = '    &Geral    '
      object chAtalhos: TDBCheckBox
        Left = 23
        Top = 26
        Width = 259
        Height = 17
        Hint = 'Ativar barra de atalhos na tela principal'
        Caption = 'Mostrar barra de atalhos na tela principal'
        DataField = 'BARRAFERRAMENTA'
        DataSource = dsPadrao
        TabOrder = 0
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object chHint: TDBCheckBox
        Left = 23
        Top = 44
        Width = 166
        Height = 17
        Hint = 'Mensagem de informa'#231#227'o na forma de bal'#227'o'
        Caption = 'Mostrar hints estilo bal'#227'o'
        DataField = 'HINTBALAO'
        DataSource = dsPadrao
        TabOrder = 1
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object chErro: TDBCheckBox
        Left = 23
        Top = 63
        Width = 162
        Height = 17
        Hint = 'Grava todos os erros que o sistema gerar'
        Caption = 'Gravar erros do sistema'
        DataField = 'GRAVAERRO'
        DataSource = dsPadrao
        TabOrder = 2
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object chBackup: TDBCheckBox
        Left = 23
        Top = 81
        Width = 224
        Height = 17
        Hint = 'Sugere copia de seguran'#231'a ao finalizar o sistema'
        Caption = 'Sugerir c'#243'pia de seguran'#231'a ao sair'
        DataField = 'BACKUP'
        DataSource = dsPadrao
        TabOrder = 3
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object chResolucao: TDBCheckBox
        Left = 23
        Top = 100
        Width = 186
        Height = 17
        Caption = 'Verificar resolu'#231#227'o ao iniciar'
        DataField = 'RESOLUCAO'
        DataSource = dsPadrao
        TabOrder = 4
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object chLog: TDBCheckBox
        Left = 23
        Top = 118
        Width = 258
        Height = 17
        Hint = 'Grava as transa'#231#245'es do banco de dados'
        Caption = 'Gerar log de registro do banco de dados'
        DataField = 'LOG'
        DataSource = dsPadrao
        TabOrder = 5
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object chImpressora: TDBCheckBox
        Left = 23
        Top = 137
        Width = 137
        Height = 17
        Caption = 'Verificar impressora'
        DataField = 'IMPRESSORA'
        DataSource = dsPadrao
        TabOrder = 6
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object chDica: TDBCheckBox
        Left = 23
        Top = 155
        Width = 188
        Height = 17
        Caption = 'Mostrar dica do dia ao iniciar'
        DataField = 'EXIBEDICADIA'
        DataSource = dsPadrao
        TabOrder = 7
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dbckbVerificaUpd: TDBCheckBox
        Left = 23
        Top = 174
        Width = 249
        Height = 17
        Caption = 'Verificar atualiza'#231#245'es autom'#225'ticamente'
        DataField = 'VERIFICA_UPD'
        DataSource = dsPadrao
        TabOrder = 8
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dbchkInfoAvisos: TDBCheckBox
        Left = 23
        Top = 192
        Width = 241
        Height = 17
        Caption = 'Exibir informa'#231#245'es a avisos ao iniciar'
        DataField = 'INFOAVISOS'
        DataSource = dsPadrao
        TabOrder = 9
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
    end
    object TabImg: TTabSheet
      Caption = 'Papel &Parede'
      ImageIndex = 1
      object bvImagem: TBevel
        Left = 5
        Top = 7
        Width = 374
        Height = 190
      end
      object imgPapelParede: TImage
        Left = 8
        Top = 10
        Width = 367
        Height = 184
        Hint = 'Imagem do papel de parede'
      end
      object btnBuscar: TBitBtn
        Left = 12
        Top = 212
        Width = 80
        Height = 25
        Hint = 'Procurar'
        Caption = '&Procurar'
        TabOrder = 0
        OnClick = btnBuscarClick
      end
      object btnExImg: TBitBtn
        Left = 100
        Top = 212
        Width = 80
        Height = 25
        Caption = '&Limpar'
        TabOrder = 1
        OnClick = btnExImgClick
      end
      object rgOrientationImg: TRadioGroup
        Left = 194
        Top = 198
        Width = 184
        Height = 49
        Caption = ' Orienta'#231#227'o '
        ItemIndex = 1
        Items.Strings = (
          'Lado a lado'
          'Estender')
        TabOrder = 2
        OnClick = rgOrientationImgClick
      end
    end
    object TabOrcam: TTabSheet
      Caption = '&Or'#231'amentos'
      ImageIndex = 2
      object cbVerificaEstoqueOrcam: TDBCheckBox
        Left = 23
        Top = 26
        Width = 244
        Height = 17
        Caption = 'Permitir produtos com estoque m'#237'nimo'
        DataField = 'PRODSEMESTOQORCAM'
        DataSource = dsPadrao
        TabOrder = 0
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object cbEditOrcamConc: TDBCheckBox
        Left = 23
        Top = 44
        Width = 242
        Height = 17
        Caption = 'Permitir editar or'#231'amentos conclu'#237'dos'
        DataField = 'EDITORCAMCONC'
        DataSource = dsPadrao
        TabOrder = 1
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object cbOrcamNaoConc: TDBCheckBox
        Left = 23
        Top = 62
        Width = 230
        Height = 17
        Caption = 'Verificar or'#231'amentos n'#227'o conclu'#237'dos'
        DataField = 'ORCAMNAOCONC'
        DataSource = dsPadrao
        TabOrder = 2
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
    end
    object TabCompras: TTabSheet
      Caption = ' &Compras '
      ImageIndex = 3
      object cbCompraNaoConc: TDBCheckBox
        Left = 23
        Top = 26
        Width = 213
        Height = 17
        Caption = 'Verificar compras n'#227'o conclu'#237'das'
        DataField = 'COMPRANAOCONC'
        DataSource = dsPadrao
        TabOrder = 0
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object cbEditCompraConc: TDBCheckBox
        Left = 23
        Top = 44
        Width = 219
        Height = 17
        Caption = 'Permitir editar compras conclu'#237'das'
        DataField = 'EDITCOMPRACONC'
        DataSource = dsPadrao
        TabOrder = 1
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
    end
    object TabProdutos: TTabSheet
      Caption = ' &Produtos '
      ImageIndex = 4
      object grpValorProdutoPadrao: TGroupBox
        Left = 8
        Top = 6
        Width = 369
        Height = 97
        Caption = ' Valores Padr'#227'o '
        TabOrder = 0
        object dbeAliqPadrao: TDBEdit
          Left = 204
          Top = 15
          Width = 130
          Height = 21
          Hint = 'Pesquisar < F2 >'
          Color = clBtnFace
          DataField = 'ALIQUOTA'
          DataSource = dsPadrao
          ReadOnly = True
          TabOrder = 0
        end
        object dbeEstoquePadrao: TDBEdit
          Left = 204
          Top = 40
          Width = 130
          Height = 21
          DataField = 'ESTOQUEPADRAO'
          DataSource = dsPadrao
          TabOrder = 1
          OnKeyPress = dbeEstoquePadraoKeyPress
        end
        object dbeDescontoPadrao: TDBEdit
          Left = 204
          Top = 66
          Width = 130
          Height = 21
          DataField = 'DESCPADRAOPROD'
          DataSource = dsPadrao
          TabOrder = 2
          OnKeyPress = dbeDescontoPadraoKeyPress
        end
      end
      object dbcbEstoqueSenhaProd: TDBCheckBox
        Left = 8
        Top = 148
        Width = 243
        Height = 17
        Caption = 'Pedir senha para altera'#231#227'o de estoque'
        DataField = 'USARSENHAESTOQUE'
        DataSource = dsPadrao
        TabOrder = 3
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dbcbBordaEtqProd: TDBCheckBox
        Left = 8
        Top = 127
        Width = 224
        Height = 17
        Caption = 'Exibir borda na etiqueta de produto '
        DataField = 'BORDAETQPROD'
        DataSource = dsPadrao
        TabOrder = 2
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object btnAlterarSenhaProduto: TBitBtn
        Left = 8
        Top = 213
        Width = 121
        Height = 25
        Caption = '&Alterar Senha'
        TabOrder = 5
        OnClick = btnAlterarSenhaProdutoClick
      end
      object dbcbLetraNumCodBarra: TDBCheckBox
        Left = 8
        Top = 107
        Width = 220
        Height = 17
        Caption = 'Permitir letras no c'#243'digo de barras'
        DataField = 'LETRACODIGOBARRA'
        DataSource = dsPadrao
        TabOrder = 1
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dbeSenhaProduto: TDBEdit
        Left = 8
        Top = 187
        Width = 121
        Height = 21
        DataField = 'SENHAESTOQUE'
        DataSource = dsPadrao
        PasswordChar = '*'
        TabOrder = 4
      end
    end
    object TabCaixa: TTabSheet
      Caption = '    &Caixa    '
      ImageIndex = 5
      object grpCaixaPadrao: TGroupBox
        Left = 8
        Top = 5
        Width = 365
        Height = 52
        Caption = ' Conta caixa padr'#227'o '
        TabOrder = 0
        object dbeCaixaPadrao: TDBEdit
          Left = 90
          Top = 20
          Width = 239
          Height = 21
          Hint = 'Pesquisar < F2 >'
          Color = clBtnFace
          DataField = 'CAIXA'
          DataSource = dsPadrao
          ReadOnly = True
          TabOrder = 0
        end
      end
      object dbeSenhaCaixa: TDBEdit
        Left = 8
        Top = 135
        Width = 129
        Height = 21
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
        Caption = 'Mostrar saldo do caixa'
        DataField = 'MOSTRARSALDOCAIXA'
        DataSource = dsPadrao
        TabOrder = 3
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dbcbLanc90Dias: TDBCheckBox
        Left = 8
        Top = 212
        Width = 257
        Height = 17
        Caption = 'Mostrar lan'#231'amentos dos '#250'ltimos 90 dias'
        DataField = 'CAIXA90DIAS'
        DataSource = dsPadrao
        TabOrder = 2
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object btnAlterarSenhaCaixa: TBitBtn
        Left = 8
        Top = 160
        Width = 129
        Height = 25
        Caption = 'Alterar senha'
        TabOrder = 4
        OnClick = btnAlterarSenhaCaixaClick
      end
      object grpContaCheque: TGroupBox
        Left = 8
        Top = 64
        Width = 365
        Height = 49
        Caption = 'Conta padr'#227'o para cheques'
        TabOrder = 5
        object dbeContaCheque: TDBEdit
          Left = 90
          Top = 18
          Width = 239
          Height = 21
          Hint = 'Pesquisar < F2 >'
          Color = clBtnFace
          DataField = 'NCONTACHEQUE'
          DataSource = dsPadrao
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
    object TabVenda: TTabSheet
      Caption = '&Vendas'
      ImageIndex = 6
      object chVendaEstoque: TDBCheckBox
        Left = 23
        Top = 24
        Width = 244
        Height = 17
        Caption = 'Permitir produtos com estoque m'#237'nimo'
        DataField = 'PRODSEMESTOQVENDA'
        DataSource = dsPadrao
        TabOrder = 0
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object chVendaConc: TDBCheckBox
        Left = 23
        Top = 42
        Width = 202
        Height = 17
        Caption = 'Verificar vendas n'#227'o conclu'#237'das'
        DataField = 'VENDANAOCONC'
        DataSource = dsPadrao
        TabOrder = 1
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object chEditvenda: TDBCheckBox
        Left = 23
        Top = 60
        Width = 211
        Height = 17
        Caption = 'Permitir editar vendas conclu'#237'das'
        DataField = 'EDITVENDACONC'
        DataSource = dsPadrao
        TabOrder = 2
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
    end
    object TabClientes: TTabSheet
      Caption = '&Clientes'
      ImageIndex = 8
      object chBloqCli: TDBCheckBox
        Left = 23
        Top = 24
        Width = 190
        Height = 17
        Caption = 'Avisar quando exceder limite '
        DataField = 'AVISACLIENTEATRASO'
        DataSource = dsPadrao
        TabOrder = 0
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dbcbBordaEtq: TDBCheckBox
        Left = 23
        Top = 44
        Width = 172
        Height = 17
        Caption = 'Exibir borda nas etiquetas'
        DataField = 'BORDAETQCLIENTE'
        DataSource = dsPadrao
        TabOrder = 1
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
    end
    object TabExportacao: TTabSheet
      Caption = '&Exporta'#231#227'o de dados'
      ImageIndex = 9
      object btnLocalizar: TBitBtn
        Left = 339
        Top = 38
        Width = 25
        Height = 25
        Caption = '...'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = btnLocalizarClick
      end
      object dbeDirExportacao: TDBEdit
        Left = 16
        Top = 40
        Width = 321
        Height = 21
        DataField = 'DIREXPORTPADRAO'
        DataSource = dsPadrao
        TabOrder = 1
      end
    end
    object tsEmail: TTabSheet
      Caption = 'E-mail'
      ImageIndex = 10
      object grpEmail: TGroupBox
        Left = 16
        Top = 8
        Width = 353
        Height = 193
        Caption = ' Configura'#231#245'es '
        TabOrder = 0
        object edServidor: TLabeledEdit
          Left = 16
          Top = 32
          Width = 249
          Height = 21
          EditLabel.Width = 49
          EditLabel.Height = 13
          EditLabel.Caption = 'Servidor'
          TabOrder = 0
        end
        object edPorta: TLabeledEdit
          Left = 272
          Top = 32
          Width = 65
          Height = 21
          EditLabel.Width = 30
          EditLabel.Height = 13
          EditLabel.Caption = 'Porta'
          TabOrder = 1
          Text = '25'
        end
        object chkAutenticacao: TCheckBox
          Left = 16
          Top = 72
          Width = 217
          Height = 17
          Caption = 'Meu servidor requer autentica'#231#227'o'
          TabOrder = 2
          OnClick = chkAutenticacaoClick
        end
        object edUsuario: TLabeledEdit
          Left = 16
          Top = 112
          Width = 193
          Height = 21
          EditLabel.Width = 43
          EditLabel.Height = 13
          EditLabel.Caption = 'Usu'#225'rio'
          TabOrder = 3
        end
        object edSenha: TLabeledEdit
          Left = 216
          Top = 112
          Width = 121
          Height = 21
          EditLabel.Width = 36
          EditLabel.Height = 13
          EditLabel.Caption = 'Senha'
          PasswordChar = '*'
          TabOrder = 4
        end
        object btnTeste: TBitBtn
          Left = 261
          Top = 152
          Width = 75
          Height = 25
          Caption = 'Testar'
          TabOrder = 5
          OnClick = btnTesteClick
        end
      end
    end
    object tsRelatorio: TTabSheet
      Caption = 'Relat'#243'rios'
      ImageIndex = 12
      object dbckbRelZebrado: TDBCheckBox
        Left = 24
        Top = 24
        Width = 129
        Height = 17
        Caption = 'Visualizar zebrado'
        DataField = 'RELZEBRADO'
        DataSource = dsPadrao
        TabOrder = 0
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
    end
  end
  inherited actlNavigateActions: TActionList
    Left = 318
    Top = 302
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 111
    Top = 318
  end
  inherited mmPadrao: TMainMenu
    Left = 192
    Top = 310
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
  object cdsPadrao: TClientDataSet
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
    Top = 286
  end
  object IdSMTP: TIdSMTP
    SASLMechanisms = <>
    Left = 141
    Top = 262
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
    Left = 204
    Top = 262
  end
end
