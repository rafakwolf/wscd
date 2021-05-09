inherited frmFornecedor: TfrmFornecedor
  Left = 262
  Height = 480
  Top = 156
  Width = 796
  Caption = 'frmFornecedor'
  ClientHeight = 480
  ClientWidth = 796
  OnClose = FormClose
  OnCreate = FormCreate
  inherited sbStatus: TStatusBar
    Top = 462
    Width = 796
  end
  inherited pnBotoesPadrao: TPanel
    Width = 796
    ClientWidth = 796
    TabOrder = 15
  end
  object btnContas: TBitBtn[2]
    Left = 576
    Height = 34
    Top = 351
    Width = 81
    Caption = '&Contas'
    OnClick = btnContasClick
    ParentShowHint = False
    ShowHint = True
    TabOrder = 17
  end
  object dbdDataCadastro: TDBEdit[3]
    Left = 280
    Height = 33
    Top = 196
    Width = 129
    DataField = 'DATACAD'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
  end
  object dbeTelefoneVendedor: TDBEdit[4]
    Left = 544
    Height = 33
    Top = 264
    Width = 153
    DataField = 'TELEFONEVENDEDOR'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
  end
  object dbeEmailVendedor: TDBEdit[5]
    Left = 8
    Height = 33
    Top = 301
    Width = 361
    DataField = 'EMAILVENDEDOR'
    DataSource = dsPadrao
    CharCase = ecLowerCase
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 14
  end
  object dbeNomeVendedor: TDBEdit[6]
    Left = 8
    Height = 33
    Top = 264
    Width = 529
    DataField = 'VENDEDOR'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
  end
  object dbeFax: TDBEdit[7]
    Left = 144
    Height = 33
    Top = 196
    Width = 129
    DataField = 'FAX'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
  end
  object dbeTelefone: TDBEdit[8]
    Left = 8
    Height = 33
    Top = 196
    Width = 129
    DataField = 'TELEFONE'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
  end
  object dbeInscEstadual: TDBEdit[9]
    Left = 176
    Height = 33
    Top = 108
    Width = 129
    DataField = 'IE'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object dbeCnpj: TDBEdit[10]
    Left = 8
    Height = 33
    Top = 108
    Width = 161
    DataField = 'CNPJ'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object dbeCep: TDBEdit[11]
    Left = 216
    Height = 33
    Top = 152
    Width = 97
    DataField = 'CEP'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
  end
  object dbeBairro: TDBEdit[12]
    Left = 8
    Height = 33
    Top = 152
    Width = 201
    DataField = 'BAIRRO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
  end
  object dbeEstado: TDBEdit[13]
    Left = 648
    Height = 33
    Top = 152
    Width = 49
    DataField = 'UF'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
  end
  object dbeEndereco: TDBEdit[14]
    Left = 312
    Height = 33
    Top = 108
    Width = 385
    DataField = 'ENDERECO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
  object dbeNomeRzSocial: TDBEdit[15]
    Left = 8
    Height = 33
    Top = 64
    Width = 305
    DataField = 'RAZAOSOCIAL'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object dbeNomeFantazia: TDBEdit[16]
    Left = 320
    Height = 33
    Top = 64
    Width = 377
    DataField = 'FANTAZIA'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object dbeEmail: TDBEdit[17]
    Left = 416
    Height = 33
    Top = 196
    Width = 281
    DataField = 'EMAIL'
    DataSource = dsPadrao
    CharCase = ecLowerCase
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
  end
  object dbmObs: TDBMemo[18]
    Left = 8
    Height = 47
    Top = 338
    Width = 449
    DataField = 'OBS'
    DataSource = dsPadrao
    ParentShowHint = False
    ShowHint = True
    TabOrder = 18
  end
  object DBLookupComboBox1: TDBLookupComboBox[19]
    Left = 320
    Height = 33
    Top = 152
    Width = 320
    DataField = 'CIDADE'
    DataSource = dsPadrao
    KeyField = 'CODCIDADE'
    ListField = 'DESCRICAO'
    ListFieldIndex = 0
    ListSource = dsPadrao1
    LookupCache = False
    TabOrder = 19
  end
  inherited actlNavigateActions: TActionList[20]
    Left = 496
    Top = 392
    inherited actPrint: TAction
      Hint = 'Listagem de fornecedores'
      OnExecute = actPrintExecute
      ShortCut = 0
    end
  end
  inherited dsPadrao: TDataSource[21]
    DataSet = ZQuery1
    Left = 704
    Top = 24
  end
  object ZUpdateSQL1: TZUpdateSQL[22]
    DeleteSQL.Strings = (
      'DELETE FROM FORNECEDORES'
      'WHERE'
      '  FORNECEDORES.CODFORNECEDOR = :OLD_CODFORNECEDOR'
    )
    InsertSQL.Strings = (
      'INSERT INTO FORNECEDORES'
      '  (FANTAZIA, RAZAOSOCIAL, DATACAD, ENDERECO, CIDADE, BAIRRO, CNPJ, IE, '
      '   CEP, TELEFONE, FAX, EMAIL, UF, OBS, VENDEDOR, TELEFONEVENDEDOR, EMAILVENDEDOR, '
      '   TIPO)'
      'VALUES'
      '  (:FANTAZIA, :RAZAOSOCIAL, :DATACAD, :ENDERECO, :CIDADE, :BAIRRO, :CNPJ, '
      '   :IE, :CEP, :TELEFONE, :FAX, :EMAIL, :UF, :OBS, :VENDEDOR, :TELEFONEVENDEDOR, '
      '   :EMAILVENDEDOR, :TIPO)'
    )
    ModifySQL.Strings = (
      'UPDATE FORNECEDORES SET'
      '  FANTAZIA = :FANTAZIA,'
      '  RAZAOSOCIAL = :RAZAOSOCIAL,'
      '  DATACAD = :DATACAD,'
      '  ENDERECO = :ENDERECO,'
      '  CIDADE = :CIDADE,'
      '  BAIRRO = :BAIRRO,'
      '  CNPJ = :CNPJ,'
      '  IE = :IE,'
      '  CEP = :CEP,'
      '  TELEFONE = :TELEFONE,'
      '  FAX = :FAX,'
      '  EMAIL = :EMAIL,'
      '  UF = :UF,'
      '  OBS = :OBS,'
      '  VENDEDOR = :VENDEDOR,'
      '  TELEFONEVENDEDOR = :TELEFONEVENDEDOR,'
      '  EMAILVENDEDOR = :EMAILVENDEDOR,'
      '  TIPO = :TIPO'
      'WHERE'
      '  FORNECEDORES.CODFORNECEDOR = :OLD_CODFORNECEDOR'
    )
    UseSequenceFieldForRefreshSQL = False
    Left = 581
    Top = 29
    ParamData = <    
      item
        DataType = ftUnknown
        Name = 'FANTAZIA'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'RAZAOSOCIAL'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'DATACAD'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'ENDERECO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'CIDADE'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'BAIRRO'
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
        Name = 'EMAIL'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'UF'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'OBS'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'VENDEDOR'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'TELEFONEVENDEDOR'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'EMAILVENDEDOR'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'TIPO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'OLD_CODFORNECEDOR'
        ParamType = ptUnknown
      end>
  end
  object ZQuery1: TZQuery[23]
    Connection = DmPrincipal.ZConnection1
    UpdateObject = ZUpdateSQL1
    SQL.Strings = (
      'select * from FORNECEDORES'
    )
    Params = <>
    Left = 485
    Top = 48
  end
  object ZReadOnlyQuery1: TZReadOnlyQuery[24]
    Connection = DmPrincipal.ZConnection1
    SQL.Strings = (
      'SELECT * FROM CIDADES'
    )
    Params = <>
    Left = 632
    Top = 80
  end
  object dsPadrao1: TDataSource[25]
    AutoEdit = False
    DataSet = ZReadOnlyQuery1
    Left = 720
    Top = 96
  end
end
