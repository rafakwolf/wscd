inherited frmFornecedor: TfrmFornecedor
  Left = 379
  Height = 480
  Top = 201
  Width = 796
  Caption = 'frmFornecedor'
  ClientHeight = 480
  ClientWidth = 796
  Menu = menu
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  inherited sbStatus: TStatusBar
    Top = 462
    Width = 796
  end
  inherited pnBotoesPadrao: TPanel
    Width = 796
    ClientWidth = 796
    TabOrder = 15
  end
  object lbNomeRzSocial: TLabel[2]
    Left = 8
    Height = 16
    Top = 48
    Width = 77
    Caption = 'Razão Social'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbNomeFantazia: TLabel[3]
    Left = 320
    Height = 16
    Top = 48
    Width = 90
    Caption = 'Nome Fantasia'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbCnpj: TLabel[4]
    Left = 8
    Height = 16
    Top = 92
    Width = 33
    Caption = 'CNPJ'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbInscEstadual: TLabel[5]
    Left = 176
    Height = 16
    Top = 92
    Width = 110
    Caption = 'Inscrição Estadual'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbEndereco: TLabel[6]
    Left = 312
    Height = 16
    Top = 92
    Width = 57
    Caption = 'Endereço'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbBairro: TLabel[7]
    Left = 8
    Height = 16
    Top = 136
    Width = 36
    Caption = 'Bairro'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbCep: TLabel[8]
    Left = 216
    Height = 16
    Top = 136
    Width = 25
    Caption = 'CEP'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbEstado: TLabel[9]
    Left = 648
    Height = 16
    Top = 136
    Width = 42
    Caption = 'Estado'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbCidade: TLabel[10]
    Left = 320
    Height = 16
    Top = 136
    Width = 43
    Caption = 'Cidade'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbTelefone: TLabel[11]
    Left = 8
    Height = 16
    Top = 180
    Width = 52
    Caption = 'Telefone'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbFax: TLabel[12]
    Left = 144
    Height = 16
    Top = 180
    Width = 21
    Caption = 'Fax'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbDataCadastro: TLabel[13]
    Left = 280
    Height = 16
    Top = 180
    Width = 87
    Caption = 'Data Cadastro'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbEmail: TLabel[14]
    Left = 416
    Height = 16
    Top = 180
    Width = 38
    Caption = 'E-mail'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbNomeVendedor: TLabel[15]
    Left = 8
    Height = 16
    Top = 232
    Width = 98
    Caption = 'Nome Vendedor'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbTelefoneVendedor: TLabel[16]
    Left = 544
    Height = 16
    Top = 232
    Width = 114
    Caption = 'Telefone Vendedor'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbEmailVendedor: TLabel[17]
    Left = 8
    Height = 16
    Top = 280
    Width = 101
    Caption = 'E-mail Vendedor'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbObs: TLabel[18]
    Left = 8
    Height = 16
    Top = 322
    Width = 25
    Caption = 'Obs'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object btnContas: TBitBtn[19]
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
  object dbdDataCadastro: TDBEdit[20]
    Left = 280
    Height = 21
    Top = 196
    Width = 129
    DataField = 'DATACAD'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
  end
  object dbeTelefoneVendedor: TDBEdit[21]
    Left = 544
    Height = 21
    Top = 248
    Width = 153
    DataField = 'TELEFONEVENDEDOR'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
  end
  object dbeEmailVendedor: TDBEdit[22]
    Left = 8
    Height = 21
    Top = 296
    Width = 361
    DataField = 'EMAILVENDEDOR'
    DataSource = dsPadrao
    CharCase = ecLowerCase
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 14
  end
  object dbeNomeVendedor: TDBEdit[23]
    Left = 8
    Height = 21
    Top = 248
    Width = 529
    DataField = 'VENDEDOR'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
  end
  object dbeFax: TDBEdit[24]
    Left = 144
    Height = 21
    Top = 196
    Width = 129
    DataField = 'FAX'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
  end
  object dbeTelefone: TDBEdit[25]
    Left = 8
    Height = 21
    Top = 196
    Width = 129
    DataField = 'TELEFONE'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
  end
  object dbeInscEstadual: TDBEdit[26]
    Left = 176
    Height = 21
    Top = 108
    Width = 129
    DataField = 'IE'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object dbeCnpj: TDBEdit[27]
    Left = 8
    Height = 21
    Top = 108
    Width = 161
    DataField = 'CNPJ'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object dbeCep: TDBEdit[28]
    Left = 216
    Height = 21
    Top = 152
    Width = 97
    DataField = 'CEP'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
  end
  object dbeBairro: TDBEdit[29]
    Left = 8
    Height = 21
    Top = 152
    Width = 201
    DataField = 'BAIRRO'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
  end
  object dbeEstado: TDBEdit[30]
    Left = 648
    Height = 21
    Top = 152
    Width = 49
    DataField = 'UF'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
  end
  object dbeEndereco: TDBEdit[31]
    Left = 312
    Height = 21
    Top = 108
    Width = 385
    DataField = 'ENDERECO'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
  object dbeNomeRzSocial: TDBEdit[32]
    Left = 8
    Height = 21
    Top = 64
    Width = 305
    DataField = 'RAZAOSOCIAL'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object dbeNomeFantazia: TDBEdit[33]
    Left = 320
    Height = 21
    Top = 64
    Width = 377
    DataField = 'FANTASIA'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object dbeEmail: TDBEdit[34]
    Left = 416
    Height = 21
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
  object dbmObs: TDBMemo[35]
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
  object dbcmbCidade: TDBLookupComboBox[36]
    Left = 320
    Height = 20
    Top = 152
    Width = 320
    DataField = 'CIDADE'
    DataSource = dsPadrao
    KeyField = 'CODCIDADE'
    ListField = 'DESCRICAO'
    ListFieldIndex = 0
    ListSource = dsCidades
    LookupCache = False
    TabOrder = 19
  end
  inherited actlNavigateActions: TActionList[37]
    Left = 504
    Top = 376
    inherited actPrint: TAction
      Hint = 'Listagem de fornecedores'
      OnExecute = actPrintExecute
      ShortCut = 0
    end
  end
  inherited dsPadrao: TDataSource[38]
    DataSet = sqldPadrao
    Left = 744
    Top = 240
  end
  object sqldPadrao: TZQuery[39]
    Connection = DmPrincipal.ZConnection1
    SQL.Strings = (
      'select * from FORNECEDORES'
    )
    Params = <>
    Left = 736
    Top = 296
  end
  object sqldCidades: TZReadOnlyQuery[40]
    Connection = DmPrincipal.ZConnection1
    SQL.Strings = (
      'SELECT * FROM CIDADES'
    )
    Params = <>
    Left = 584
    Top = 296
  end
  object dsCidades: TDataSource[41]
    AutoEdit = False
    DataSet = sqldCidades
    Left = 656
    Top = 296
  end
  object menu: TMainMenu[42]
    Left = 504
    Top = 296
    object MenuItem1: TMenuItem
      Caption = 'Relatórios'
      OnClick = MenuItem1Click
      object MenuItem2: TMenuItem
        Caption = 'Por Cidade'
        OnClick = miRelPorCidadeClick
      end
      object MenuItem3: TMenuItem
        Caption = 'Por Data'
        OnClick = miRelFornDataClick
      end
    end
  end
end
