inherited frmCliente: TfrmCliente
  Left = 231
  Top = 131
  Caption = 'frmCliente'
  ClientHeight = 452
  ClientWidth = 785
  OldCreateOrder = True
  ExplicitWidth = 791
  ExplicitHeight = 501
  PixelsPerInch = 96
  TextHeight = 13
  object btnFoto: TBitBtn [0]
    Left = 464
    Top = 392
    Width = 100
    Height = 25
    Hint = 'Exibir/Ocultar foto do cliente'
    Caption = '&Foto'
    TabOrder = 30
    OnClick = btnFotoClick
  end
  object dbeFax: TDBEdit [1]
    Left = 120
    Top = 156
    Width = 105
    Height = 21
    DataField = 'FAX'
    DataSource = dsPadrao
    TabOrder = 8
  end
  object btnContas: TBitBtn [2]
    Left = 571
    Top = 392
    Width = 100
    Height = 25
    Caption = '&Contas'
    TabOrder = 28
    OnClick = btnContasClick
  end
  object dbeEstadoCivil: TDBEdit [3]
    Left = 488
    Top = 252
    Width = 67
    Height = 21
    Hint = 'Pesquisar < F2 >'
    Color = clBtnFace
    DataField = 'ESTADO_CIVIL'
    DataSource = dsPadrao
    ReadOnly = True
    TabOrder = 17
  end
  object dbeTelefoneComercial: TDBEdit [4]
    Left = 639
    Top = 300
    Width = 138
    Height = 21
    DataField = 'FONE_COM'
    DataSource = dsPadrao
    TabOrder = 22
  end
  object dbeRefComercial: TDBEdit [5]
    Left = 528
    Top = 348
    Width = 249
    Height = 21
    DataField = 'REFER_COM'
    DataSource = dsPadrao
    TabOrder = 25
  end
  object dbeRefPessoal: TDBEdit [6]
    Left = 280
    Top = 348
    Width = 241
    Height = 21
    DataField = 'REFER_PES'
    DataSource = dsPadrao
    TabOrder = 24
  end
  object dbeLocalTrabalho: TDBEdit [7]
    Left = 8
    Top = 348
    Width = 265
    Height = 21
    DataField = 'LOCAL_TRAB'
    DataSource = dsPadrao
    TabOrder = 23
  end
  object dbeSalario: TDBEdit [8]
    Left = 8
    Top = 396
    Width = 129
    Height = 21
    DataField = 'SALARIO'
    DataSource = dsPadrao
    TabOrder = 26
    OnKeyPress = dbeSalarioKeyPress
  end
  object dbeInicioTrabalho: TDBEdit [9]
    Left = 520
    Top = 300
    Width = 113
    Height = 21
    DataField = 'DATA_INICIO'
    DataSource = dsPadrao
    TabOrder = 21
  end
  object dbeCargo: TDBEdit [10]
    Left = 264
    Top = 300
    Width = 249
    Height = 21
    DataField = 'CARGO'
    DataSource = dsPadrao
    TabOrder = 20
  end
  object dbeTrabalho: TDBEdit [11]
    Left = 8
    Top = 300
    Width = 249
    Height = 21
    DataField = 'TRABALHO'
    DataSource = dsPadrao
    TabOrder = 19
  end
  object dbeEmail: TDBEdit [12]
    Left = 232
    Top = 156
    Width = 289
    Height = 21
    CharCase = ecLowerCase
    DataField = 'E_MAIL'
    DataSource = dsPadrao
    TabOrder = 9
  end
  object dbeNaturalidade: TDBEdit [13]
    Left = 616
    Top = 204
    Width = 161
    Height = 21
    DataField = 'NATURALIDADE'
    DataSource = dsPadrao
    TabOrder = 14
  end
  object dbeDataCadastro: TDBEdit [14]
    Left = 656
    Top = 156
    Width = 121
    Height = 21
    DataField = 'CADASTRO'
    DataSource = dsPadrao
    TabOrder = 11
  end
  object dbeMae: TDBEdit [15]
    Left = 312
    Top = 204
    Width = 297
    Height = 21
    DataField = 'MAE'
    DataSource = dsPadrao
    TabOrder = 13
  end
  object dbePai: TDBEdit [16]
    Left = 8
    Top = 204
    Width = 297
    Height = 21
    DataField = 'PAI'
    DataSource = dsPadrao
    TabOrder = 12
  end
  object dbeConjuge: TDBEdit [17]
    Left = 584
    Top = 252
    Width = 193
    Height = 21
    DataField = 'CONJUGUE'
    DataSource = dsPadrao
    TabOrder = 18
  end
  object dbeEnderecoAnterior: TDBEdit [18]
    Left = 247
    Top = 252
    Width = 234
    Height = 21
    DataField = 'END_ANTERIOR'
    DataSource = dsPadrao
    TabOrder = 16
  end
  object dbeTempoMoradia: TDBEdit [19]
    Left = 8
    Top = 252
    Width = 233
    Height = 21
    DataField = 'TEMPO_MORADIA'
    DataSource = dsPadrao
    TabOrder = 15
  end
  object btnObservacao: TBitBtn [20]
    Left = 677
    Top = 392
    Width = 100
    Height = 25
    Caption = '&Observa'#231#227'o'
    TabOrder = 29
    OnClick = btnObservacaoClick
  end
  object dbeLimite: TDBEdit [21]
    Left = 144
    Top = 396
    Width = 121
    Height = 21
    DataField = 'LIMITE'
    DataSource = dsPadrao
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 27
    OnKeyPress = dbeLimiteKeyPress
  end
  object dbeDataNasc: TDBEdit [22]
    Left = 528
    Top = 156
    Width = 121
    Height = 21
    DataField = 'DATA_NASC'
    DataSource = dsPadrao
    TabOrder = 10
  end
  object dbeCpf: TDBEdit [23]
    Left = 504
    Top = 64
    Width = 137
    Height = 21
    DataField = 'CPF_CNPJ'
    DataSource = dsPadrao
    TabOrder = 1
  end
  object dbeRg: TDBEdit [24]
    Left = 648
    Top = 64
    Width = 129
    Height = 21
    DataField = 'RG_IE'
    DataSource = dsPadrao
    TabOrder = 2
  end
  object dbeTelefone: TDBEdit [25]
    Left = 8
    Top = 156
    Width = 105
    Height = 21
    DataField = 'TELEFONE'
    DataSource = dsPadrao
    TabOrder = 7
  end
  object dbeCep: TDBEdit [26]
    Left = 416
    Top = 108
    Width = 97
    Height = 21
    DataField = 'CEP'
    DataSource = dsPadrao
    TabOrder = 5
  end
  object dbeBairro: TDBEdit [27]
    Left = 232
    Top = 108
    Width = 177
    Height = 21
    DataField = 'BAIRRO'
    DataSource = dsPadrao
    TabOrder = 4
  end
  object dbeCidade: TDBEdit [28]
    Left = 520
    Top = 108
    Width = 179
    Height = 21
    Hint = 'Pesquisar < F2 >'
    Color = clBtnFace
    DataField = 'DESCRICAO'
    DataSource = dsPadrao
    ReadOnly = True
    TabOrder = 6
  end
  object dbeEndereco: TDBEdit [29]
    Left = 8
    Top = 108
    Width = 217
    Height = 21
    DataField = 'ENDERECO'
    DataSource = dsPadrao
    TabOrder = 3
  end
  object dbeNome: TDBEdit [30]
    Left = 136
    Top = 64
    Width = 361
    Height = 21
    DataField = 'NOME'
    DataSource = dsPadrao
    TabOrder = 0
  end
  object pnFoto: TPanel [31]
    Left = 266
    Top = 184
    Width = 247
    Height = 204
    ParentBackground = False
    TabOrder = 31
    Visible = False
    object btnBuscar: TSpeedButton
      Left = 4
      Top = 178
      Width = 75
      Height = 22
      Caption = 'Buscar'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FF0274AC
        0274AC0274AC0274AC0274AC0274AC0274AC0274AC0274AC0274AC0274AC0274
        AC0274ACFF00FFFF00FF0274AC138AC457B7E06BCBF84BBFF74ABFF74ABFF74A
        BFF74ABFF64ABFF74ABFF64BC0F72398CC0274ACFF00FFFF00FF0274AC33AAE0
        2392C489D9FA54C7F854C7F753C7F854C7F754C7F854C7F854C7F853C7F7279D
        CE6ACBE50274ACFF00FF0274AC57CAF80274AC99E3FB5ED1FA5ED1FA5ED1FA5E
        D1FA5ED1FA5FD1FA5ED1F85ED1F82CA1CE99EDF70274ACFF00FF0274AC5ED3FA
        0B81B782D5EF79E0FA6ADCFA69DCFB69DCFB6ADCFB69DCFB69DCFA6ADDFB2FA6
        CF9FF0F70274ACFF00FF0274AC68DAFB2BA4D14AB2D797EBFC74E5FB74E5FB74
        E5FC74E5FC74E5FB74E5FC046B0B33A9CFA3F4F752BBD70274AC0274AC70E3FB
        5CD1EF1184B6FCFFFFB8F4FEBAF4FEBAF4FEBAF4FEB8F4FE046B0B25AA42046B
        0BD4F7FACAF3F70274AC0274AC7AEBFE7AEBFC0A7FB50274AC0274AC0274AC02
        74AC0274AC046B0B38CE6547E77F29B44A046B0B0274AC0274AC0274AC83F2FE
        82F3FE82F3FE83F2FC83F3FE82F3FE83F2FE046B0B2DC0513FDC6E3ED86E46E5
        7B28B04A046B0BFF00FF0274ACFEFEFE89FAFF89FAFE89FAFE8AF8FE8AFAFE04
        6B0B046B0B046B0B046B0B3CD86A2EBF53046B0B046B0B046B0BFF00FF0274AC
        FEFEFE8FFEFF8FFEFF8FFEFF0273A32BA4D12BA4D12BA4D1046B0B35D35E20A7
        3A046B0BFF00FFFF00FFFF00FFFF00FF0274AC0274AC0274AC0274ACFF00FFFF
        00FFFF00FFFF00FF046B0B28C24A046B0BFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF046B0B17A42B19A730046B
        0BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF046B0B11A122046B0BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF046B0B046B0B046B0B046B0BFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF046B0B046B0B04
        6B0B046B0BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      OnClick = btnBuscarClick
    end
    object btnLimpar: TSpeedButton
      Left = 83
      Top = 178
      Width = 74
      Height = 22
      Caption = 'Limpar'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FF000288010893010B99010C99010893000389FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000186010D9D021CAF021FB402
        1FB5021FB5021FB2021CB0010F9F000287FF00FFFF00FFFF00FFFF00FFFF00FF
        00038A0118B2021FB7021EB1021DB1021DB1021DB1021DB1021EB2021FB40219
        AC00048EFF00FFFF00FFFF00FF0001830118BB0220CC011CBF0015B4011AB002
        1DB1021DB1011CB00015AD011BB0021FB4021AAC000287FF00FFFF00FF010CA7
        0121E0011CD30726CC4966D70B28BC0018B00019AF0622B44A66CE0D2BB7011B
        B0021FB5010F9FFF00FF000187011CDC0120ED0017DC3655E2FFFFFFA4B4ED05
        20BB0119B28B9EE1FFFFFF4E6ACF0014AC021EB2021CB000038900069A0120F8
        011FF6001DE9031FE1738BEEFFFFFFA0B1ED93A5E7FFFFFF91A4E20823B4011B
        B0021DB1021FB4010895020CAA0A2EFE0323FB011FF6001CEB0018E1788FF0FF
        FFFFFFFFFF96A7EA021BB50019AF021DB1021DB10220B5010C99040EAC294DFE
        0D30FB011FFA001CF7011CEE8EA1F4FFFFFFFFFFFFA6B6EE0520C20018B6021D
        B1021DB10220B5010B980208A04162FB2F51FC001EFA0725FA8AA0FEFFFFFF8E
        A3F67991F2FFFFFFA3B4EE0C29C6011BB8021DB4021FB2000793000189314FEF
        7690FF0F2DFA3354FBFFFFFF91A5FE021EF30017E7738BF3FFFFFF4765E00016
        C2021FBD021CB2000288FF00FF0C1BBC819AFF728BFE1134FA3456FB0526FA00
        1CFA001CF40220ED3353ED0625DA011DD00220CB010DA1FF00FFFF00FF000189
        2943E6A5B7FF849AFC2341FB0323FA011FFA011FFA001EF7011BEE021FE50121
        E20118BF000184FF00FFFF00FFFF00FF01038F2A45E693A9FFABBBFF758FFE49
        69FC3658FB3153FC2346FC092CF70118CB00038BFF00FFFF00FFFF00FFFF00FF
        FF00FF0001890F1DBF3E5BF36B87FE728CFF5E7BFE395BFB1231EB010FB50001
        84FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000189030AA306
        11B2050FB10107A0000188FF00FFFF00FFFF00FFFF00FFFF00FF}
      OnClick = btnLimparClick
    end
    object btnWebCam: TSpeedButton
      Left = 161
      Top = 178
      Width = 82
      Height = 22
      Caption = 'Web-cam'
      Glyph.Data = {
        D6030000424DD603000000000000D60200002800000010000000100000000100
        08000000000000010000120B0000120B0000A8000000A800000000000000FFFF
        FF00CFCED000D3D1D400FF00FF0049484900F0EFF000D5D4D500C7C6C700C6C5
        C600ACABAC00A6A5A6009D9A9C004F4D4E00605E5F00EBE7E900635E5F00ABA5
        A600C9C1C20046414100736B6B00867F7F00C4BBBB00C1B8B800C0B7B7002C2A
        2A008F8989007A75750032303000383636007975750078747400868282006562
        6200464444002423230021202000201F1F00D4CFCF00C6C1C1007E7B7B005351
        510027262600C6C2C200C0BCBC008784840083808000F6F2F200EDE9E900A09D
        9D007F7D7D007B7979006F6D6D0036353500F7F4F400F2EFEF00C2BFBF008C8A
        8A0054535300464545004544440041404000EFEDED00E5E3E300D3D1D100706F
        6F0056555500F0EFEF00DEDDDD00ABAAAA0081767500ADA1A000C4B7B6007D74
        7300A5979500938C8B009D8C89004C4645005D575600B6ABA900B2A7A500645E
        5D008E888700998B880082787600474241004A4544009C929000C4BAB800DDD8
        D7009A8A86009F8F8B009C8C880084787500635A580039353400B5A9A600837A
        7800413D3C0045414000494544009F9795005E5A59007E7A7900998E8B006059
        570095847F008174700083797600655A5600504A480057514F008B827F009F96
        93009E9592009E969300787270008F8C8B008E8B8A00423D3B0048434100504B
        490090807900776E6A006E645F006C6460006B635F004F4B4900595756008A88
        8700F2F0EF0070605700777472008C8987008B868200C1916000937456007A67
        5400B0998300A38E7900908E8C0053525100BBA08200EEEDEB00FFEBB8002121
        20004E4E4C00323231005E5E5D001B1C1C0037383800BABCBC00939396008080
        8200FEFEFF00B5B5B600F7F7F700B5B5B5008E8E8E0058585800575757004B4B
        4B00444444002929290028282800232323001F1F1F001E1E1E00040404040404
        040404040404040404040404A33AA3A3A3040404040404040404251D763FA139
        280D35A3A30404040404624F598FA10B2F0F2B1F808D93A4A3046F60383EA10A
        9C07324294298584799163742D82A19D9A1E2202311B92575BA555658C43A197
        0310988B87834E685C2313717537A19B0833998A90887E614C2363728C37A145
        40412E7B8E897D465A234D738136A10C3039A05E6D7C69536A2378142C44A111
        2612673D647F546B7A235648279F1A1618175850474A4B0686A52A663B3C9E34
        205215496C5D700909A5040404A5A7A296A2A00E21516E5F77A6040404040404
        04A6A705A41C1995240404040404040404040404040404040404}
      OnClick = btnWebCamClick
    end
    object grpFoto: TGroupBox
      Left = 1
      Top = 1
      Width = 245
      Height = 174
      Align = alTop
      Caption = 'Foto'
      TabOrder = 0
      object imgFoto: TDBImage
        Left = 16
        Top = 16
        Width = 209
        Height = 141
        TabOrder = 0
      end
    end
  end
  inherited sbStatus: TStatusBar
    Top = 433
    Width = 785
    ExplicitTop = 433
    ExplicitWidth = 785
  end
  inherited pnBotoesPadrao: TPanel
    Width = 785
    TabOrder = 33
    ExplicitWidth = 785
  end
  inherited actlNavigateActions: TActionList
    Left = 336
    Top = 20
    inherited actPrint: TAction
      Hint = 'Listagem de clientes'
      ShortCut = 0
      OnExecute = actPrintExecute
    end
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 577
    Top = 4
  end
  inherited mmPadrao: TMainMenu
    Left = 200
    Top = 28
    inherited miOpcoes: TMenuItem
      object N9: TMenuItem [5]
        Caption = '-'
      end
      object miFiltros: TMenuItem [6]
        Caption = 'Outros filtros'
        object miFiltroCidade: TMenuItem
          Caption = 'Clientes por cidade'
          OnClick = miFiltroCidadeClick
        end
      end
      object N10: TMenuItem
        Caption = '-'
      end
      object miAjustaCPF_CNPJ: TMenuItem
        Caption = 'Ajustar CPF/CNPJs'
        OnClick = miAjustaCPF_CNPJClick
      end
    end
    inherited miRelatorios: TMenuItem
      inherited mImprimir: TMenuItem
        Caption = 'Listagem de clientes'
      end
      object miFicha: TMenuItem [1]
        Caption = 'Ficha deste cliente'
        OnClick = miFichaClick
      end
      object N6: TMenuItem [2]
        Caption = '-'
      end
      object miRelClientesDataNasc: TMenuItem [3]
        Caption = 'Por data de nascimento'
        OnClick = miRelClientesDataNascClick
      end
      object miRelClientesCidade: TMenuItem [4]
        Caption = 'Por cidade'
        OnClick = miRelClientesCidadeClick
      end
      object miRelAniversariantes: TMenuItem [5]
        Caption = 'Clientes aniversariantes'
        OnClick = miRelAniversariantesClick
      end
      object N5: TMenuItem [6]
        Caption = '-'
      end
      object miEtiquetaCliente: TMenuItem [7]
        Caption = 'Etiquetas'
        OnClick = miEtiquetaClienteClick
      end
      object N7: TMenuItem [8]
        Caption = '-'
      end
    end
  end
  object sqldPadrao: TSQLDataSet
    CommandText = 
      'select'#13#10'  cli.CODCLIENTE,'#13#10'  cli.TIPO,'#13#10'  cli.NOME,'#13#10'  cli.ENDER' +
      'ECO,'#13#10'  cli.CEP,'#13#10'  cli.BAIRRO,'#13#10'  cli.TELEFONE,'#13#10'  cli.FAX,'#13#10'  ' +
      'cli.CODCIDADE,'#13#10'  cid.DESCRICAO,'#13#10'  cli.UF,'#13#10'  cli.TEMPO_MORADIA' +
      ','#13#10'  cli.END_ANTERIOR,'#13#10'  cli.E_MAIL,'#13#10'  cli.TRABALHO,'#13#10'  cli.CA' +
      'RGO,'#13#10'  cli.DATA_INICIO,'#13#10'  cli.SALARIO,'#13#10'  cli.ESTADO_CIVIL,'#13#10' ' +
      ' cli.CONJUGUE,'#13#10'  cli.LOCAL_TRAB,'#13#10'  cli.DATA_NASC,'#13#10'  cli.PAI,'#13 +
      #10'  cli.MAE,'#13#10'  cli.CPF_CNPJ,'#13#10'  cli.RG_IE,'#13#10'  cli.REFER_PES,'#13#10'  ' +
      'cli.REFER_COM,'#13#10'  cli.FONE_COM,'#13#10'  cli.CADASTRO,'#13#10'  cli.OBS,'#13#10'  ' +
      'cli.NATURALIDADE,'#13#10'  cli.LIMITE,'#13#10'  cli.FOTO'#13#10'from CLIENTES cli'#13 +
      #10'left join CIDADES cid on (cli.CODCIDADE = cid.CODCIDADE)'#13#10'order' +
      ' by cli.NOME'
    MaxBlobSize = -1
    Params = <>
    Left = 484
    Top = 4
    object sqldPadraoCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqldPadraoTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoNOME: TStringField
      FieldName = 'NOME'
      Size = 80
    end
    object sqldPadraoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 80
    end
    object sqldPadraoCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object sqldPadraoBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 80
    end
    object sqldPadraoTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
    object sqldPadraoFAX: TStringField
      FieldName = 'FAX'
    end
    object sqldPadraoCODCIDADE: TIntegerField
      FieldName = 'CODCIDADE'
    end
    object sqldPadraoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = []
      Size = 80
    end
    object sqldPadraoUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object sqldPadraoTEMPO_MORADIA: TStringField
      FieldName = 'TEMPO_MORADIA'
      Size = 80
    end
    object sqldPadraoEND_ANTERIOR: TStringField
      FieldName = 'END_ANTERIOR'
      Size = 80
    end
    object sqldPadraoE_MAIL: TStringField
      FieldName = 'E_MAIL'
      Size = 80
    end
    object sqldPadraoTRABALHO: TStringField
      FieldName = 'TRABALHO'
      Size = 80
    end
    object sqldPadraoCARGO: TStringField
      FieldName = 'CARGO'
      Size = 80
    end
    object sqldPadraoDATA_INICIO: TDateField
      FieldName = 'DATA_INICIO'
    end
    object sqldPadraoSALARIO: TFMTBCDField
      FieldName = 'SALARIO'
      Precision = 15
    end
    object sqldPadraoESTADO_CIVIL: TStringField
      FieldName = 'ESTADO_CIVIL'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoCONJUGUE: TStringField
      FieldName = 'CONJUGUE'
      Size = 80
    end
    object sqldPadraoLOCAL_TRAB: TStringField
      FieldName = 'LOCAL_TRAB'
      Size = 80
    end
    object sqldPadraoDATA_NASC: TDateField
      FieldName = 'DATA_NASC'
    end
    object sqldPadraoPAI: TStringField
      FieldName = 'PAI'
      Size = 80
    end
    object sqldPadraoMAE: TStringField
      FieldName = 'MAE'
      Size = 80
    end
    object sqldPadraoCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
    end
    object sqldPadraoRG_IE: TStringField
      FieldName = 'RG_IE'
    end
    object sqldPadraoREFER_PES: TStringField
      FieldName = 'REFER_PES'
      Size = 250
    end
    object sqldPadraoREFER_COM: TStringField
      FieldName = 'REFER_COM'
      Size = 250
    end
    object sqldPadraoFONE_COM: TStringField
      FieldName = 'FONE_COM'
    end
    object sqldPadraoCADASTRO: TDateField
      FieldName = 'CADASTRO'
    end
    object sqldPadraoOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sqldPadraoNATURALIDADE: TStringField
      FieldName = 'NATURALIDADE'
      Size = 80
    end
    object sqldPadraoLIMITE: TFMTBCDField
      FieldName = 'LIMITE'
      Precision = 15
    end
    object sqldPadraoFOTO: TBlobField
      FieldName = 'FOTO'
      Size = 1
    end
  end
  object dspPadrao: TDataSetProvider
    DataSet = sqldPadrao
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 516
    Top = 4
  end
  object cdsPadrao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    AfterInsert = cdsPadraoAfterInsert
    Left = 547
    Top = 4
    object cdsPadraoCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPadraoTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      OnGetText = cdsPadraoTIPOGetText
      OnSetText = cdsPadraoTIPOSetText
      Size = 8
    end
    object cdsPadraoNOME: TStringField
      DisplayWidth = 80
      FieldName = 'NOME'
      Required = True
      Size = 80
    end
    object cdsPadraoENDERECO: TStringField
      DisplayWidth = 80
      FieldName = 'ENDERECO'
      Size = 80
    end
    object cdsPadraoCEP: TStringField
      FieldName = 'CEP'
      EditMask = '99999\-999;1;_'
      Size = 10
    end
    object cdsPadraoBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object cdsPadraoTELEFONE: TStringField
      FieldName = 'TELEFONE'
      EditMask = '!\(99\)9999-9999;1;_'
      Size = 15
    end
    object cdsPadraoCODCIDADE: TIntegerField
      DisplayLabel = 'Cidade'
      FieldName = 'CODCIDADE'
      Required = True
      OnValidate = cdsPadraoCODCIDADEValidate
    end
    object cdsPadraoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = []
      Size = 80
    end
    object cdsPadraoUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object cdsPadraoTEMPO_MORADIA: TStringField
      FieldName = 'TEMPO_MORADIA'
      Size = 30
    end
    object cdsPadraoEND_ANTERIOR: TStringField
      FieldName = 'END_ANTERIOR'
      Size = 50
    end
    object cdsPadraoE_MAIL: TStringField
      FieldName = 'E_MAIL'
      Size = 60
    end
    object cdsPadraoDATA_INICIO: TDateField
      FieldName = 'DATA_INICIO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoTRABALHO: TStringField
      FieldName = 'TRABALHO'
      Size = 50
    end
    object cdsPadraoCARGO: TStringField
      FieldName = 'CARGO'
      Size = 50
    end
    object cdsPadraoSALARIO: TFMTBCDField
      FieldName = 'SALARIO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 15
    end
    object cdsPadraoESTADO_CIVIL: TStringField
      FieldName = 'ESTADO_CIVIL'
      Size = 30
    end
    object cdsPadraoCONJUGUE: TStringField
      FieldName = 'CONJUGUE'
      Size = 50
    end
    object cdsPadraoLOCAL_TRAB: TStringField
      FieldName = 'LOCAL_TRAB'
      Size = 60
    end
    object cdsPadraoDATA_NASC: TDateField
      DisplayLabel = 'Data de nascimento'
      FieldName = 'DATA_NASC'
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoPAI: TStringField
      FieldName = 'PAI'
      Size = 60
    end
    object cdsPadraoCADASTRO: TDateField
      FieldName = 'CADASTRO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoMAE: TStringField
      FieldName = 'MAE'
      Size = 60
    end
    object cdsPadraoCPF_CNPJ: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'CPF_CNPJ'
      Required = True
      OnSetText = cdsPadraoCPF_CNPJSetText
      Size = 18
    end
    object cdsPadraoRG_IE: TStringField
      DisplayLabel = 'RG/IE'
      FieldName = 'RG_IE'
      Required = True
      Size = 11
    end
    object cdsPadraoREFER_PES: TStringField
      FieldName = 'REFER_PES'
      Size = 100
    end
    object cdsPadraoREFER_COM: TStringField
      FieldName = 'REFER_COM'
      Size = 100
    end
    object cdsPadraoFONE_COM: TStringField
      FieldName = 'FONE_COM'
      EditMask = '!\(99\)9999-9999;1;_'
      Size = 15
    end
    object cdsPadraoOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsPadraoNATURALIDADE: TStringField
      FieldName = 'NATURALIDADE'
      Size = 50
    end
    object cdsPadraoFAX: TStringField
      FieldName = 'FAX'
      EditMask = '!\(99\)9999-9999;1;_'
      Size = 15
    end
    object cdsPadraoLIMITE: TFMTBCDField
      FieldName = 'LIMITE'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 15
    end
    object cdsPadraoFOTO: TBlobField
      FieldName = 'FOTO'
      Size = 1
    end
  end
  object sqldCidade: TSQLDataSet
    CommandText = 'select * from CIDADES'
    MaxBlobSize = -1
    Params = <>
    Left = 624
    Top = 4
    object sqldCidadeCODCIDADE: TIntegerField
      FieldName = 'CODCIDADE'
      Required = True
    end
    object sqldCidadeDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 30
    end
  end
  object dspCidade: TDataSetProvider
    DataSet = sqldCidade
    Left = 656
    Top = 4
  end
  object cdsCidade: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCidade'
    Left = 696
    Top = 4
    object cdsCidadeCODCIDADE: TIntegerField
      FieldName = 'CODCIDADE'
      Required = True
    end
    object cdsCidadeDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 30
    end
  end
end
