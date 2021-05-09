inherited frmDadosEmpresa: TfrmDadosEmpresa
  Left = 287
  Height = 442
  Top = 147
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
    TabOrder = 14
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
    Top = 117
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
    Top = 149
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
    Top = 182
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
    Top = 250
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
    Top = 283
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
    Top = 351
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
    Left = 312
    Height = 15
    Top = 283
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
    Left = 449
    Height = 15
    Top = 216
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
    Left = 397
    Height = 15
    Top = 182
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
    Left = 284
    Height = 15
    Top = 149
    Width = 77
    Caption = 'Insc. Munic.'
    Font.CharSet = ANSI_CHARSET
    Font.Name = 'Verdana'
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object dbeInscMunicipal: TDBEdit[14]
    Left = 356
    Height = 33
    Top = 145
    Width = 157
    DataField = 'IM'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
  object dbeFax: TDBEdit[15]
    Left = 336
    Height = 33
    Top = 279
    Width = 177
    DataField = 'FAX'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
  end
  object dbeRazaoSocial: TDBEdit[16]
    Left = 104
    Height = 33
    Top = 47
    Width = 409
    DataField = 'RAZASOCIAL'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object dbeResponsavel: TDBEdit[17]
    Left = 104
    Height = 33
    Top = 347
    Width = 409
    DataField = 'RESPONSAVEL'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
  end
  object dbeTelefone: TDBEdit[18]
    Left = 104
    Height = 33
    Top = 279
    Width = 196
    DataField = 'TELEFONE'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
  end
  object dbeEndereco: TDBEdit[19]
    Left = 104
    Height = 33
    Top = 178
    Width = 284
    DataField = 'ENDERECO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
  end
  object dbeBairro: TDBEdit[20]
    Left = 104
    Height = 33
    Top = 246
    Width = 409
    DataField = 'BAIRRO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
  end
  object dbeCep: TDBEdit[21]
    Left = 424
    Height = 33
    Top = 178
    Width = 89
    DataField = 'CEP'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
  end
  object dbeInscEstadual: TDBEdit[22]
    Left = 104
    Height = 33
    Top = 145
    Width = 172
    DataField = 'IE'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object dbeFantazia: TDBEdit[23]
    Left = 104
    Height = 33
    Top = 81
    Width = 409
    DataField = 'FANTAZIA'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object dbeCnpj: TDBEdit[24]
    Left = 104
    Height = 33
    Top = 113
    Width = 172
    DataField = 'CNPJ'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object dbeUF: TDBEdit[25]
    Left = 467
    Height = 33
    Top = 212
    Width = 46
    DataField = 'UF'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
  end
  object dbeEmail: TDBEdit[26]
    Left = 104
    Height = 33
    Top = 312
    Width = 409
    DataField = 'EMAIL'
    DataSource = dsPadrao
    CharCase = ecLowerCase
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
  end
  object gbLogoMarca: TGroupBox[27]
    Left = 520
    Height = 191
    Top = 48
    Width = 146
    Caption = ' Logo '
    ClientHeight = 173
    ClientWidth = 144
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
    object btnBuscaImg: TBitBtn
      Left = 8
      Height = 25
      Top = 136
      Width = 65
      Caption = '&Buscar'
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
  inherited actlNavigateActions: TActionList[28]
    Left = 624
    Top = 360
  end
  inherited dsPadrao: TDataSource[29]
    DataSet = ZQuery1
    Left = 685
    Top = 280
  end
  object opdLogo: TOpenPictureDialog[30]
    DefaultExt = '.*.bmp'
    Left = 685
    Top = 72
  end
  object dsSistema: TDataSource[31]
    AutoEdit = False
    Left = 568
    Top = 304
  end
  object ZUpdateSQL1: TZUpdateSQL[32]
    DeleteSQL.Strings = (
      'DELETE FROM EMPRESA'
      'WHERE'
      '  EMPRESA.id = :OLD_id'
    )
    InsertSQL.Strings = (
      'INSERT INTO EMPRESA'
      '  (FANTAZIA, RAZASOCIAL, CNPJ, IE, IM, ENDERECO, IDCIDADE, BAIRRO, CEP, '
      '   TELEFONE, FAX, UF, RESPONSAVEL, LOGOEMPRESA, EMAIL)'
      'VALUES'
      '  (:FANTAZIA, :RAZASOCIAL, :CNPJ, :IE, :IM, :ENDERECO, :IDCIDADE, :BAIRRO, '
      '   :CEP, :TELEFONE, :FAX, :UF, :RESPONSAVEL, :LOGOEMPRESA, :EMAIL)'
    )
    ModifySQL.Strings = (
      'UPDATE EMPRESA SET'
      '  FANTAZIA = :FANTAZIA,'
      '  RAZASOCIAL = :RAZASOCIAL,'
      '  CNPJ = :CNPJ,'
      '  IE = :IE,'
      '  IM = :IM,'
      '  ENDERECO = :ENDERECO,'
      '  IDCIDADE = :IDCIDADE,'
      '  BAIRRO = :BAIRRO,'
      '  CEP = :CEP,'
      '  TELEFONE = :TELEFONE,'
      '  FAX = :FAX,'
      '  UF = :UF,'
      '  RESPONSAVEL = :RESPONSAVEL,'
      '  LOGOEMPRESA = :LOGOEMPRESA,'
      '  EMAIL = :EMAIL'
      'WHERE'
      '  EMPRESA.id = :OLD_id'
    )
    UseSequenceFieldForRefreshSQL = False
    Left = 686
    Top = 211
    ParamData = <    
      item
        DataType = ftUnknown
        Name = 'FANTAZIA'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'RAZASOCIAL'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'CNPJ'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'IE'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'IM'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'ENDERECO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'IDCIDADE'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'BAIRRO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'CEP'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'TELEFONE'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'FAX'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'UF'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'RESPONSAVEL'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'LOGOEMPRESA'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'EMAIL'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'OLD_id'
        ParamType = ptUnknown
      end>
  end
  object ZQuery1: TZQuery[33]
    Connection = DmPrincipal.ZConnection1
    UpdateObject = ZUpdateSQL1
    SQL.Strings = (
      'select * from EMPRESA'
    )
    Params = <>
    Left = 688
    Top = 136
  end
end
