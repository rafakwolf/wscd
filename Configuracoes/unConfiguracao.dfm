inherited frmConfiguracao: TfrmConfiguracao
  Left = 221
  Height = 446
  Top = 141
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
    ActivePage = tsEmail
    ParentShowHint = False
    ShowHint = True
    TabIndex = 9
    TabOrder = 1
    OnChange = PgConfigChange
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
        Width = 259
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
        Top = 187
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
        Top = 148
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
        Top = 127
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
        Top = 107
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
        Height = 97
        Top = 6
        Width = 369
        Caption = ' Valores Padrão '
        ClientHeight = 79
        ClientWidth = 367
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object dbeAliqPadrao: TDBEdit
          Left = 204
          Height = 33
          Hint = 'Pesquisar < F2 >'
          Top = 15
          Width = 130
          DataField = 'ALIQUOTA'
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
          Top = 40
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
          Left = 204
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
        Top = 213
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
          DataField = 'CAIXA'
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
    Left = 286
    Top = 318
  end
  inherited dsPadrao: TDataSource[4]
    DataSet = cdsPadrao
    Left = 111
    Top = 318
  end
  object sqldPadrao: TSQLQuery[5]
    FieldDefs = <>
    Params = <    
      item
        DataType = ftString
        Name = 'PCOMP'
        ParamType = ptInput
      end>
    Left = 14
    Top = 318
    object sqldPadraoIDCONFIGURACAO: TIntegerField
      FieldKind = fkData
      FieldName = 'IDCONFIGURACAO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object sqldPadraoNOMECOMPUTADOR: TStringField
      FieldKind = fkData
      FieldName = 'NOMECOMPUTADOR'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoBARRAFERRAMENTA: TStringField
      FieldKind = fkData
      FieldName = 'BARRAFERRAMENTA'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object sqldPadraoHINTBALAO: TStringField
      FieldKind = fkData
      FieldName = 'HINTBALAO'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object sqldPadraoGRAVAERRO: TStringField
      FieldKind = fkData
      FieldName = 'GRAVAERRO'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object sqldPadraoBACKUP: TStringField
      FieldKind = fkData
      FieldName = 'BACKUP'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object sqldPadraoLOG: TStringField
      FieldKind = fkData
      FieldName = 'LOG'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object sqldPadraoIMPRESSORA: TStringField
      FieldKind = fkData
      FieldName = 'IMPRESSORA'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object sqldPadraoRESOLUCAO: TStringField
      FieldKind = fkData
      FieldName = 'RESOLUCAO'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object sqldPadraoLETRACODIGOBARRA: TStringField
      FieldKind = fkData
      FieldName = 'LETRACODIGOBARRA'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object sqldPadraoEXIBEDICADIA: TStringField
      FieldKind = fkData
      FieldName = 'EXIBEDICADIA'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object sqldPadraoAVISACLIENTEATRASO: TStringField
      FieldKind = fkData
      FieldName = 'AVISACLIENTEATRASO'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object sqldPadraoDIREXPORTPADRAO: TStringField
      FieldKind = fkData
      FieldName = 'DIREXPORTPADRAO'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 250
    end
    object sqldPadraoSENHAESTOQUE: TStringField
      FieldKind = fkData
      FieldName = 'SENHAESTOQUE'
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
    object sqldPadraoUSARSENHAESTOQUE: TStringField
      FieldKind = fkData
      FieldName = 'USARSENHAESTOQUE'
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object sqldPadraoESTOQUEPADRAO: TIntegerField
      FieldKind = fkData
      FieldName = 'ESTOQUEPADRAO'
      Index = 15
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoBORDAETQPROD: TStringField
      FieldKind = fkData
      FieldName = 'BORDAETQPROD'
      Index = 16
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object sqldPadraoALIQUOTAPADRAO: TIntegerField
      FieldKind = fkData
      FieldName = 'ALIQUOTAPADRAO'
      Index = 17
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object sqldPadraoALIQUOTA: TStringField
      FieldKind = fkData
      FieldName = 'ALIQUOTA'
      Index = 18
      LookupCache = False
      ProviderFlags = []
      ReadOnly = False
      Required = False
    end
    object sqldPadraoDESCPADRAOPROD: TFMTBCDField
      FieldKind = fkData
      FieldName = 'DESCPADRAOPROD'
      Index = 19
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object sqldPadraoCAIXAPADRAO: TIntegerField
      FieldKind = fkData
      FieldName = 'CAIXAPADRAO'
      Index = 20
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object sqldPadraoCAIXA: TStringField
      FieldKind = fkData
      FieldName = 'CAIXA'
      Index = 21
      LookupCache = False
      ProviderFlags = []
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoSENHACAIXA: TStringField
      FieldKind = fkData
      FieldName = 'SENHACAIXA'
      Index = 22
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
    object sqldPadraoPRODSEMESTOQORCAM: TStringField
      FieldKind = fkData
      FieldName = 'PRODSEMESTOQORCAM'
      Index = 23
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object sqldPadraoORCAMNAOCONC: TStringField
      FieldKind = fkData
      FieldName = 'ORCAMNAOCONC'
      Index = 24
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object sqldPadraoEDITORCAMCONC: TStringField
      FieldKind = fkData
      FieldName = 'EDITORCAMCONC'
      Index = 25
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object sqldPadraoCOMPRANAOCONC: TStringField
      FieldKind = fkData
      FieldName = 'COMPRANAOCONC'
      Index = 26
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object sqldPadraoEDITCOMPRACONC: TStringField
      FieldKind = fkData
      FieldName = 'EDITCOMPRACONC'
      Index = 27
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object sqldPadraoPRODSEMESTOQVENDA: TStringField
      FieldKind = fkData
      FieldName = 'PRODSEMESTOQVENDA'
      Index = 28
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object sqldPadraoVENDANAOCONC: TStringField
      FieldKind = fkData
      FieldName = 'VENDANAOCONC'
      Index = 29
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object sqldPadraoEDITVENDACONC: TStringField
      FieldKind = fkData
      FieldName = 'EDITVENDACONC'
      Index = 30
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object sqldPadraoBORDAETQCLIENTE: TStringField
      FieldKind = fkData
      FieldName = 'BORDAETQCLIENTE'
      Index = 31
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object sqldPadraoMOSTRARSALDOCAIXA: TStringField
      FieldKind = fkData
      FieldName = 'MOSTRARSALDOCAIXA'
      Index = 32
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object sqldPadraoCAIXA90DIAS: TStringField
      FieldKind = fkData
      FieldName = 'CAIXA90DIAS'
      Index = 33
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object sqldPadraoRELZEBRADO: TStringField
      FieldKind = fkData
      FieldName = 'RELZEBRADO'
      Index = 34
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object sqldPadraoVERIFICA_UPD: TStringField
      FieldKind = fkData
      FieldName = 'VERIFICA_UPD'
      Index = 35
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object sqldPadraoCONTACHEQUE: TIntegerField
      FieldKind = fkData
      FieldName = 'CONTACHEQUE'
      Index = 36
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoNCONTACHEQUE: TStringField
      FieldKind = fkData
      FieldName = 'NCONTACHEQUE'
      Index = 37
      LookupCache = False
      ProviderFlags = []
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoINFOAVISOS: TStringField
      FieldKind = fkData
      FieldName = 'INFOAVISOS'
      Index = 38
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
  end
  object dspPadrao: TTimer[6]
    Left = 48
    Top = 318
  end
  object cdsPadrao: TMemDataset[7]
    FieldDefs = <>
    Left = 80
    Top = 318
    object cdsPadraoIDCONFIGURACAO: TIntegerField
      FieldKind = fkData
      FieldName = 'IDCONFIGURACAO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object cdsPadraoNOMECOMPUTADOR: TStringField
      FieldKind = fkData
      FieldName = 'NOMECOMPUTADOR'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoBARRAFERRAMENTA: TStringField
      FieldKind = fkData
      FieldName = 'BARRAFERRAMENTA'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object cdsPadraoHINTBALAO: TStringField
      FieldKind = fkData
      FieldName = 'HINTBALAO'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object cdsPadraoGRAVAERRO: TStringField
      FieldKind = fkData
      FieldName = 'GRAVAERRO'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object cdsPadraoBACKUP: TStringField
      FieldKind = fkData
      FieldName = 'BACKUP'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object cdsPadraoLOG: TStringField
      FieldKind = fkData
      FieldName = 'LOG'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object cdsPadraoIMPRESSORA: TStringField
      FieldKind = fkData
      FieldName = 'IMPRESSORA'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object cdsPadraoRESOLUCAO: TStringField
      FieldKind = fkData
      FieldName = 'RESOLUCAO'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object cdsPadraoLETRACODIGOBARRA: TStringField
      FieldKind = fkData
      FieldName = 'LETRACODIGOBARRA'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object cdsPadraoEXIBEDICADIA: TStringField
      FieldKind = fkData
      FieldName = 'EXIBEDICADIA'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object cdsPadraoAVISACLIENTEATRASO: TStringField
      FieldKind = fkData
      FieldName = 'AVISACLIENTEATRASO'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object cdsPadraoDIREXPORTPADRAO: TStringField
      FieldKind = fkData
      FieldName = 'DIREXPORTPADRAO'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 250
    end
    object cdsPadraoSENHAESTOQUE: TStringField
      FieldKind = fkData
      FieldName = 'SENHAESTOQUE'
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
    object cdsPadraoUSARSENHAESTOQUE: TStringField
      FieldKind = fkData
      FieldName = 'USARSENHAESTOQUE'
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object cdsPadraoESTOQUEPADRAO: TIntegerField
      FieldKind = fkData
      FieldName = 'ESTOQUEPADRAO'
      Index = 15
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoBORDAETQPROD: TStringField
      FieldKind = fkData
      FieldName = 'BORDAETQPROD'
      Index = 16
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object cdsPadraoALIQUOTAPADRAO: TIntegerField
      FieldKind = fkData
      FieldName = 'ALIQUOTAPADRAO'
      Index = 17
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object cdsPadraoALIQUOTA: TStringField
      FieldKind = fkData
      FieldName = 'ALIQUOTA'
      Index = 18
      LookupCache = False
      ProviderFlags = []
      ReadOnly = False
      Required = False
    end
    object cdsPadraoDESCPADRAOPROD: TFMTBCDField
      FieldKind = fkData
      FieldName = 'DESCPADRAOPROD'
      Index = 19
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object cdsPadraoCAIXAPADRAO: TIntegerField
      FieldKind = fkData
      FieldName = 'CAIXAPADRAO'
      Index = 20
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object cdsPadraoCAIXA: TStringField
      FieldKind = fkData
      FieldName = 'CAIXA'
      Index = 21
      LookupCache = False
      ProviderFlags = []
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoSENHACAIXA: TStringField
      FieldKind = fkData
      FieldName = 'SENHACAIXA'
      Index = 22
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
    object cdsPadraoPRODSEMESTOQORCAM: TStringField
      FieldKind = fkData
      FieldName = 'PRODSEMESTOQORCAM'
      Index = 23
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object cdsPadraoORCAMNAOCONC: TStringField
      FieldKind = fkData
      FieldName = 'ORCAMNAOCONC'
      Index = 24
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object cdsPadraoEDITORCAMCONC: TStringField
      FieldKind = fkData
      FieldName = 'EDITORCAMCONC'
      Index = 25
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object cdsPadraoCOMPRANAOCONC: TStringField
      FieldKind = fkData
      FieldName = 'COMPRANAOCONC'
      Index = 26
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object cdsPadraoEDITCOMPRACONC: TStringField
      FieldKind = fkData
      FieldName = 'EDITCOMPRACONC'
      Index = 27
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object cdsPadraoPRODSEMESTOQVENDA: TStringField
      FieldKind = fkData
      FieldName = 'PRODSEMESTOQVENDA'
      Index = 28
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object cdsPadraoVENDANAOCONC: TStringField
      FieldKind = fkData
      FieldName = 'VENDANAOCONC'
      Index = 29
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object cdsPadraoEDITVENDACONC: TStringField
      FieldKind = fkData
      FieldName = 'EDITVENDACONC'
      Index = 30
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object cdsPadraoBORDAETQCLIENTE: TStringField
      FieldKind = fkData
      FieldName = 'BORDAETQCLIENTE'
      Index = 31
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object cdsPadraoMOSTRARSALDOCAIXA: TStringField
      FieldKind = fkData
      FieldName = 'MOSTRARSALDOCAIXA'
      Index = 32
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object cdsPadraoCAIXA90DIAS: TStringField
      FieldKind = fkData
      FieldName = 'CAIXA90DIAS'
      Index = 33
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object cdsPadraoRELZEBRADO: TStringField
      FieldKind = fkData
      FieldName = 'RELZEBRADO'
      Index = 34
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object cdsPadraoVERIFICA_UPD: TStringField
      FieldKind = fkData
      FieldName = 'VERIFICA_UPD'
      Index = 35
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object cdsPadraoCONTACHEQUE: TIntegerField
      FieldKind = fkData
      FieldName = 'CONTACHEQUE'
      Index = 36
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoNCONTACHEQUE: TStringField
      FieldKind = fkData
      FieldName = 'NCONTACHEQUE'
      Index = 37
      LookupCache = False
      ProviderFlags = []
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoINFOAVISOS: TStringField
      FieldKind = fkData
      FieldName = 'INFOAVISOS'
      Index = 38
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
  end
  object opImagem: TOpenPictureDialog[8]
    Filter = 'JPEG Image File (*.jpg)|*.jpg|JPEG Image File (*.jpeg)|*.jpeg|Bitmaps (*.bmp)|*.bmp'
    Left = 254
    Top = 318
  end
end
