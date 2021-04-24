inherited frmDadosEmpresa: TfrmDadosEmpresa
  Left = 176
  Height = 442
  Top = 143
  Width = 759
  Caption = 'frmDadosEmpresa'
  ClientHeight = 442
  ClientWidth = 759
  inherited sbStatus: TStatusBar
    Top = 424
    Width = 759
  end
  inherited pnBotoesPadrao: TPanel
    Width = 759
    ClientWidth = 759
    TabOrder = 15
  end
  object lbFantazia: TLabel[2]
    Left = 43
    Height = 15
    Top = 78
    Width = 54
    Caption = 'Fantasia'
    Font.CharSet = ANSI_CHARSET
    Font.Name = 'Verdana'
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbRazaoSocial: TLabel[3]
    Left = 17
    Height = 15
    Top = 54
    Width = 83
    Caption = 'Razão Social'
    Font.CharSet = ANSI_CHARSET
    Font.Name = 'Verdana'
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbCnpj: TLabel[4]
    Left = 38
    Height = 15
    Top = 102
    Width = 55
    Caption = 'Cnpj/Cpf'
    Font.CharSet = ANSI_CHARSET
    Font.Name = 'Verdana'
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbInscEstadual: TLabel[5]
    Left = 37
    Height = 15
    Top = 126
    Width = 58
    Caption = 'Insc. Est.'
    Font.CharSet = ANSI_CHARSET
    Font.Name = 'Verdana'
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbEndereco: TLabel[6]
    Left = 37
    Height = 15
    Top = 150
    Width = 60
    Caption = 'Endereço'
    Font.CharSet = ANSI_CHARSET
    Font.Name = 'Verdana'
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbBairro: TLabel[7]
    Left = 55
    Height = 15
    Top = 198
    Width = 39
    Caption = 'Bairro'
    Font.CharSet = ANSI_CHARSET
    Font.Name = 'Verdana'
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbTelefone: TLabel[8]
    Left = 41
    Height = 15
    Top = 222
    Width = 55
    Caption = 'Telefone'
    Font.CharSet = ANSI_CHARSET
    Font.Name = 'Verdana'
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbResponsavel: TLabel[9]
    Left = 18
    Height = 15
    Top = 270
    Width = 83
    Caption = 'Responsável'
    Font.CharSet = ANSI_CHARSET
    Font.Name = 'Verdana'
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object LabelFax: TLabel[10]
    Left = 301
    Height = 15
    Top = 222
    Width = 22
    Caption = 'Fax'
    Font.CharSet = ANSI_CHARSET
    Font.Name = 'Verdana'
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbUF: TLabel[11]
    Left = 438
    Height = 15
    Top = 174
    Width = 18
    Caption = 'UF'
    Font.CharSet = ANSI_CHARSET
    Font.Name = 'Verdana'
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbCep: TLabel[12]
    Left = 386
    Height = 15
    Top = 150
    Width = 25
    Caption = 'Cep'
    Font.CharSet = ANSI_CHARSET
    Font.Name = 'Verdana'
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbInscMunicipal: TLabel[13]
    Left = 273
    Height = 15
    Top = 126
    Width = 77
    Caption = 'Insc. Munic.'
    Font.CharSet = ANSI_CHARSET
    Font.Name = 'Verdana'
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object btnGravaSerial: TBitBtn[14]
    Left = 248
    Height = 22
    Top = 296
    Width = 113
    Caption = 'Gravar serial'
    Glyph.Data = {
      36060000424D3606000000000000360000002800000020000000100000000100
      18000000000000060000C40E0000C40E00000000000000000000008080008080
      0080800080800080800080800080800080800080800080800080800080800080
      8000808000808000808000808000808000808000808000808000808000808000
      8080008080008080008080008080008080008080008080008080008080008080
      0080800080800080800080800080800080800080800080800080800080800080
      8000808000808000808000808000808000808000808000808000808000808000
      8080008080008080008080008080008080008080008080008080008080008080
      0080800080800080800066000066000080800080800080800080800080800080
      8000808000808000808000808000808000808000808000808065656565656500
      8080008080008080008080008080008080008080008080008080008080008080
      0080800080800066001EB2311FB1330066000080800080800080800080800080
      800080800080800080800080800080800080800080806565659A9A9A9A9A9A65
      6565008080008080008080008080008080008080008080008080008080008080
      00808000660031C24F22B7381AB02D21B4370066000080800080800080800080
      80008080008080008080008080008080008080656565ABABAB9E9E9E9797979C
      9C9C656565008080008080008080008080008080008080008080008080008080
      00660047D36D3BCB5E25A83B0066001BA92E1DB1320066000080800080800080
      80008080008080008080008080008080656565BFBFBFB5B5B598989865656594
      9494999999656565008080008080008080008080008080008080008080006600
      4FD67953DE7F31B54D006600008080006600179D271EAE310066000080800080
      80008080008080008080008080656565C4C4C4CACACAA5A5A565656500808065
      65658C8C8C989898656565008080008080008080008080008080008080008080
      00660041C56300660000808000808000808000808000660019AA2B0066000080
      80008080008080008080008080008080656565B5B5B565656500808000808000
      8080008080656565939393656565008080008080008080008080008080008080
      008080006600008080008080008080008080008080008080006600149D210066
      0000808000808000808000808000808000808065656500808000808000808000
      80800080800080806565658A8A8A656565008080008080008080008080008080
      0080800080800080800080800080800080800080800080800080800080800066
      0000660000808000808000808000808000808000808000808000808000808000
      8080008080008080008080008080656565656565008080008080008080008080
      0080800080800080800080800080800080800080800080800080800080800080
      8000660000660000808000808000808000808000808000808000808000808000
      8080008080008080008080008080008080656565656565008080008080008080
      0080800080800080800080800080800080800080800080800080800080800080
      8000808000808000808000808000808000808000808000808000808000808000
      8080008080008080008080008080008080008080008080008080008080008080
      0080800080800080800080800080800080800080800080800080800080800080
      8000808000808000808000808000808000808000808000808000808000808000
      8080008080008080008080008080008080008080008080008080008080008080
      0080800080800080800080800080800080800080800080800080800080800080
      8000808000808000808000808000808000808000808000808000808000808000
      8080008080008080008080008080008080008080008080008080008080008080
      0080800080800080800080800080800080800080800080800080800080800080
      8000808000808000808000808000808000808000808000808000808000808000
      8080008080008080008080008080008080008080008080008080008080008080
      0080800080800080800080800080800080800080800080800080800080800080
      8000808000808000808000808000808000808000808000808000808000808000
      8080008080008080008080008080008080008080008080008080
    }
    OnClick = btnGravaSerialClick
    ParentShowHint = False
    ShowHint = True
    TabOrder = 18
  end
  object dbeCidade: TDBEdit[15]
    Left = 93
    Height = 33
    Hint = 'Pesquisar < F2 >'
    Top = 170
    Width = 318
    DataField = 'DESCRICAO'
    DataSource = dsPadrao
    ReadOnly = True
    CharCase = ecNormal
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
  end
  object dbeInscMunicipal: TDBEdit[16]
    Left = 345
    Height = 33
    Top = 122
    Width = 157
    DataField = 'IM'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
  object dbeFax: TDBEdit[17]
    Left = 325
    Height = 33
    Top = 218
    Width = 177
    DataField = 'FAX'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
  end
  object dbeRazaoSocial: TDBEdit[18]
    Left = 93
    Height = 33
    Top = 50
    Width = 409
    DataField = 'RAZASOCIAL'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object dbeResponsavel: TDBEdit[19]
    Left = 93
    Height = 33
    Top = 266
    Width = 409
    DataField = 'RESPONSAVEL'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
  end
  object dbeTelefone: TDBEdit[20]
    Left = 93
    Height = 33
    Top = 218
    Width = 196
    DataField = 'TELEFONE'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
  end
  object dbeEndereco: TDBEdit[21]
    Left = 93
    Height = 33
    Top = 146
    Width = 284
    DataField = 'ENDERECO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
  end
  object dbeBairro: TDBEdit[22]
    Left = 93
    Height = 33
    Top = 194
    Width = 409
    DataField = 'BAIRRO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
  end
  object dbeCep: TDBEdit[23]
    Left = 413
    Height = 33
    Top = 146
    Width = 89
    DataField = 'CEP'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
  end
  object dbeInscEstadual: TDBEdit[24]
    Left = 93
    Height = 33
    Top = 122
    Width = 172
    DataField = 'IE'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object dbeFantazia: TDBEdit[25]
    Left = 93
    Height = 33
    Top = 74
    Width = 409
    DataField = 'FANTAZIA'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object dbeSerial: TDBEdit[26]
    Left = 93
    Height = 33
    Top = 290
    Width = 148
    DataField = 'SERIAL'
    DataSource = dsSistema
    CharCase = ecNormal
    Color = clSilver
    Font.CharSet = ANSI_CHARSET
    Font.Name = 'Verdana'
    MaxLength = 0
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 17
  end
  object dbeCnpj: TDBEdit[27]
    Left = 93
    Height = 33
    Top = 98
    Width = 172
    DataField = 'CNPJ'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object dbeUF: TDBEdit[28]
    Left = 456
    Height = 33
    Top = 170
    Width = 46
    DataField = 'UF'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
  end
  object dbeEmail: TDBEdit[29]
    Left = 93
    Height = 33
    Top = 242
    Width = 409
    DataField = 'EMAIL'
    DataSource = dsPadrao
    CharCase = ecLowerCase
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
  end
  object gbLogoMarca: TGroupBox[30]
    Left = 520
    Height = 169
    Top = 48
    Width = 146
    Caption = ' Logo '
    ClientHeight = 151
    ClientWidth = 144
    ParentShowHint = False
    ShowHint = True
    TabOrder = 14
    object btnBuscaImg: TBitBtn
      Left = 8
      Height = 25
      Top = 136
      Width = 65
      Caption = '&Buscar'
      OnClick = btnBuscaImgClick
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object btnApagaImg: TBitBtn
      Left = 75
      Height = 25
      Top = 136
      Width = 62
      Caption = '&Limpar'
      OnClick = btnApagaImgClick
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object dbiLogoMarca: TDBImage
      Left = 8
      Height = 113
      Top = 16
      Width = 129
      DataField = 'LOGOEMPRESA'
      DataSource = dsPadrao
      ParentShowHint = False
      ShowHint = True
    end
  end
  inherited actlNavigateActions: TActionList[31]
    Left = 488
    Top = 65532
  end
  inherited dsPadrao: TDataSource[32]
    DataSet = cdsPadrao
    Left = 615
    Top = 268
  end
  object sqldPadrao: TSQLQuery[33]
    FieldDefs = <>
    Params = <>
    Left = 520
    Top = 268
    object sqldPadraoFANTAZIA: TStringField
      FieldKind = fkData
      FieldName = 'FANTAZIA'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoRAZASOCIAL: TStringField
      FieldKind = fkData
      FieldName = 'RAZASOCIAL'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoCNPJ: TStringField
      FieldKind = fkData
      FieldName = 'CNPJ'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 18
    end
    object sqldPadraoIE: TStringField
      FieldKind = fkData
      FieldName = 'IE'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoIM: TStringField
      FieldKind = fkData
      FieldName = 'IM'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoENDERECO: TStringField
      FieldKind = fkData
      FieldName = 'ENDERECO'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoIDCIDADE: TIntegerField
      FieldKind = fkData
      FieldName = 'IDCIDADE'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoDESCRICAO: TStringField
      FieldKind = fkData
      FieldName = 'DESCRICAO'
      Index = 7
      LookupCache = False
      ProviderFlags = []
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoBAIRRO: TStringField
      FieldKind = fkData
      FieldName = 'BAIRRO'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoCEP: TStringField
      FieldKind = fkData
      FieldName = 'CEP'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
    object sqldPadraoTELEFONE: TStringField
      FieldKind = fkData
      FieldName = 'TELEFONE'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoFAX: TStringField
      FieldKind = fkData
      FieldName = 'FAX'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoUF: TStringField
      FieldKind = fkData
      FieldName = 'UF'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 2
    end
    object sqldPadraoRESPONSAVEL: TStringField
      FieldKind = fkData
      FieldName = 'RESPONSAVEL'
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoLOGOEMPRESA: TBlobField
      FieldKind = fkData
      FieldName = 'LOGOEMPRESA'
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object sqldPadraoEMAIL: TStringField
      FieldKind = fkData
      FieldName = 'EMAIL'
      Index = 15
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 250
    end
  end
  object dspPadrao: TTimer[34]
    Left = 552
    Top = 268
  end
  object cdsPadrao: TMemDataset[35]
    FieldDefs = <>
    Left = 584
    Top = 268
    object cdsPadraoFANTAZIA: TStringField
      FieldKind = fkData
      FieldName = 'FANTAZIA'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoRAZASOCIAL: TStringField
      FieldKind = fkData
      FieldName = 'RAZASOCIAL'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoCNPJ: TStringField
      FieldKind = fkData
      FieldName = 'CNPJ'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 18
    end
    object cdsPadraoIE: TStringField
      FieldKind = fkData
      FieldName = 'IE'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoIM: TStringField
      FieldKind = fkData
      FieldName = 'IM'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoENDERECO: TStringField
      FieldKind = fkData
      FieldName = 'ENDERECO'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoIDCIDADE: TIntegerField
      FieldKind = fkData
      FieldName = 'IDCIDADE'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      OnValidate = cdsPadraoIDCIDADEValidate
    end
    object cdsPadraoDESCRICAO: TStringField
      FieldKind = fkData
      FieldName = 'DESCRICAO'
      Index = 7
      LookupCache = False
      ProviderFlags = []
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoBAIRRO: TStringField
      FieldKind = fkData
      FieldName = 'BAIRRO'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoCEP: TStringField
      FieldKind = fkData
      FieldName = 'CEP'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
    object cdsPadraoTELEFONE: TStringField
      FieldKind = fkData
      FieldName = 'TELEFONE'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoFAX: TStringField
      FieldKind = fkData
      FieldName = 'FAX'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoUF: TStringField
      FieldKind = fkData
      FieldName = 'UF'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 2
    end
    object cdsPadraoRESPONSAVEL: TStringField
      FieldKind = fkData
      FieldName = 'RESPONSAVEL'
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoLOGOEMPRESA: TBlobField
      FieldKind = fkData
      FieldName = 'LOGOEMPRESA'
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object cdsPadraoEMAIL: TStringField
      FieldKind = fkData
      FieldName = 'EMAIL'
      Index = 15
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 250
    end
  end
  object opdLogo: TOpenPictureDialog[36]
    DefaultExt = '.*.bmp'
    Left = 615
    Top = 224
  end
  object sqldCidade: TSQLQuery[37]
    FieldDefs = <>
    Params = <>
    Left = 520
    Top = 224
  end
  object dspCidade: TTimer[38]
    Left = 552
    Top = 224
  end
  object cdsCidade: TMemDataset[39]
    FieldDefs = <>
    Left = 584
    Top = 224
    object cdsCidadeCODCIDADE: TIntegerField
      FieldKind = fkData
      FieldName = 'CODCIDADE'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object cdsCidadeDESCRICAO: TStringField
      FieldKind = fkData
      FieldName = 'DESCRICAO'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
  end
  object sqldSistema: TSQLQuery[40]
    FieldDefs = <>
    Params = <>
    Left = 384
    Top = 296
    object sqldSistemaIDSISTEMA: TIntegerField
      FieldKind = fkData
      FieldName = 'IDSISTEMA'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object sqldSistemaVERSAO: TStringField
      FieldKind = fkData
      FieldName = 'VERSAO'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldSistemaDATAVALIDADE: TStringField
      FieldKind = fkData
      FieldName = 'DATAVALIDADE'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
    object sqldSistemaDATA_ACESSO: TStringField
      FieldKind = fkData
      FieldName = 'DATA_ACESSO'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
    object sqldSistemaSERIAL: TStringField
      FieldKind = fkData
      FieldName = 'SERIAL'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldSistemaHD: TStringField
      FieldKind = fkData
      FieldName = 'HD'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
  end
  object dspSistema: TTimer[41]
    Left = 416
    Top = 296
  end
  object cdsSistema: TMemDataset[42]
    FieldDefs = <>
    Left = 448
    Top = 296
    object cdsSistemaIDSISTEMA: TIntegerField
      FieldKind = fkData
      FieldName = 'IDSISTEMA'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object cdsSistemaVERSAO: TStringField
      FieldKind = fkData
      FieldName = 'VERSAO'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsSistemaDATAVALIDADE: TStringField
      FieldKind = fkData
      FieldName = 'DATAVALIDADE'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
    object cdsSistemaDATA_ACESSO: TStringField
      FieldKind = fkData
      FieldName = 'DATA_ACESSO'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
    object cdsSistemaSERIAL: TStringField
      FieldKind = fkData
      FieldName = 'SERIAL'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsSistemaHD: TStringField
      FieldKind = fkData
      FieldName = 'HD'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
  end
  object dsSistema: TDataSource[43]
    AutoEdit = False
    DataSet = cdsSistema
    OnStateChange = dsSistemaStateChange
    Left = 480
    Top = 296
  end
end
