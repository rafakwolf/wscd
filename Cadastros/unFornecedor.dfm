inherited frmFornecedor: TfrmFornecedor
  Left = 139
  Top = 147
  ClientHeight = 364
  ClientWidth = 705
  Caption = 'frmFornecedor'
  OldCreateOrder = True
  ExplicitWidth = 711
  ExplicitHeight = 393
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbStatus: TUniStatusBar
    Top = 345
    Width = 705
    ExplicitTop = 345
    ExplicitWidth = 705
  end
  inherited pnBotoesPadrao: TUniContainerPanel
    Width = 705
    TabOrder = 17
    ExplicitWidth = 705
  end
  object btnObservacoes: TUniBitBtn [2]
    Left = 592
    Top = 304
    Width = 105
    Height = 25
    Hint = ''
    ShowHint = True
    Caption = 'Observa'#231#245'es'
    TabOrder = 16
    OnClick = btnObservacoesClick
  end
  object btnContas: TUniBitBtn [3]
    Left = 504
    Top = 304
    Width = 81
    Height = 25
    Hint = ''
    ShowHint = True
    Caption = '&Contas'
    TabOrder = 19
    OnClick = btnContasClick
  end
  object dbdDataCadastro: TUniDBEdit [4]
    Left = 280
    Top = 196
    Width = 129
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'DATACAD'
    DataSource = dsPadrao
    TabOrder = 11
  end
  object dbeCidade: TUniDBEdit [5]
    Left = 320
    Top = 152
    Width = 299
    Height = 21
    Hint = 'Pesquisar < F2 >'
    ShowHint = True
    DataField = 'NOMECIDADE'
    DataSource = dsPadrao
    TabOrder = 7
    Color = clBtnFace
    ReadOnly = True
  end
  object dbeTelefoneVendedor: TUniDBEdit [6]
    Left = 544
    Top = 264
    Width = 153
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'TELEFONEVENDEDOR'
    DataSource = dsPadrao
    TabOrder = 14
  end
  object dbeEmailVendedor: TUniDBEdit [7]
    Left = 8
    Top = 308
    Width = 361
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'EMAILVENDEDOR'
    DataSource = dsPadrao
    CharCase = ecLowerCase
    TabOrder = 15
  end
  object dbeNomeVendedor: TUniDBEdit [8]
    Left = 8
    Top = 264
    Width = 529
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'VENDEDOR'
    DataSource = dsPadrao
    TabOrder = 13
  end
  object dbeFax: TUniDBEdit [9]
    Left = 144
    Top = 196
    Width = 129
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'FAX'
    DataSource = dsPadrao
    TabOrder = 10
  end
  object dbeTelefone: TUniDBEdit [10]
    Left = 8
    Top = 196
    Width = 129
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'TELEFONE'
    DataSource = dsPadrao
    TabOrder = 9
  end
  object dbeInscEstadual: TUniDBEdit [11]
    Left = 176
    Top = 108
    Width = 129
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'IE'
    DataSource = dsPadrao
    TabOrder = 3
  end
  object dbeCnpj: TUniDBEdit [12]
    Left = 8
    Top = 108
    Width = 161
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'CNPJ'
    DataSource = dsPadrao
    TabOrder = 2
  end
  object dbeCep: TUniDBEdit [13]
    Left = 216
    Top = 152
    Width = 97
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'CEP'
    DataSource = dsPadrao
    TabOrder = 6
  end
  object dbeBairro: TUniDBEdit [14]
    Left = 8
    Top = 152
    Width = 201
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'BAIRRO'
    DataSource = dsPadrao
    TabOrder = 5
  end
  object dbeEstado: TUniDBEdit [15]
    Left = 648
    Top = 152
    Width = 49
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'UF'
    DataSource = dsPadrao
    TabOrder = 8
  end
  object dbeEndereco: TUniDBEdit [16]
    Left = 312
    Top = 108
    Width = 385
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'ENDERECO'
    DataSource = dsPadrao
    TabOrder = 4
  end
  object dbeNomeRzSocial: TUniDBEdit [17]
    Left = 8
    Top = 64
    Width = 305
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'RAZAOSOCIAL'
    DataSource = dsPadrao
    TabOrder = 0
  end
  object dbeNomeFantazia: TUniDBEdit [18]
    Left = 320
    Top = 64
    Width = 377
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'FANTAZIA'
    DataSource = dsPadrao
    TabOrder = 1
  end
  object dbeEmail: TUniDBEdit [19]
    Left = 416
    Top = 196
    Width = 281
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'EMAIL'
    DataSource = dsPadrao
    CharCase = ecLowerCase
    TabOrder = 12
  end
  object bvlLinha: TUniPanel [20]
    Left = 8
    Top = 232
    Width = 689
    Height = 2
    Hint = ''
    ShowHint = True
    TabOrder = 20
    Caption = 'bvlLinha'
  end
  inherited actlNavigateActions: TActionList
    Left = 408
    Top = 4
    inherited actPrint: TAction
      Hint = 'Listagem de fornecedores'
      ShortCut = 0
      OnExecute = actPrintExecute
    end
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 604
    Top = 6
  end
  object sqldPadrao: TSQLDataSet
    CommandText = 
      'select'#13#10'    forn.CODFORNECEDOR,'#13#10'    forn.FANTAZIA,'#13#10'    forn.RA' +
      'ZAOSOCIAL,'#13#10'    forn.DATACAD,'#13#10'    forn.ENDERECO,'#13#10'    forn.CIDA' +
      'DE,'#13#10'    cid.Descricao NOMECIDADE,'#13#10'    forn.BAIRRO,'#13#10'    forn.C' +
      'NPJ,'#13#10'    forn.IE,'#13#10'    forn.CEP,'#13#10'    forn.TELEFONE,'#13#10'    forn.' +
      'FAX,'#13#10'    forn.EMAIL,'#13#10'    forn.UF,'#13#10'    forn.OBS,'#13#10'    forn.VEN' +
      'DEDOR,'#13#10'    forn.TELEFONEVENDEDOR,'#13#10'    forn.EMAILVENDEDOR,'#13#10'   ' +
      ' forn.TIPO'#13#10'from FORNECEDORES forn'#13#10'left join CIDADES cid on (fo' +
      'rn.Cidade = cid.Codcidade)'#13#10'order by forn.RAZAOSOCIAL, cid.DESCR' +
      'ICAO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 508
    Top = 6
    object sqldPadraoCODFORNECEDOR: TIntegerField
      FieldName = 'CODFORNECEDOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqldPadraoFANTAZIA: TStringField
      FieldName = 'FANTAZIA'
      Size = 80
    end
    object sqldPadraoDATACAD: TDateField
      FieldName = 'DATACAD'
    end
    object sqldPadraoRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 80
    end
    object sqldPadraoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 80
    end
    object sqldPadraoCIDADE: TIntegerField
      FieldName = 'CIDADE'
    end
    object sqldPadraoNOMECIDADE: TStringField
      FieldName = 'NOMECIDADE'
      ProviderFlags = []
      Size = 80
    end
    object sqldPadraoBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 80
    end
    object sqldPadraoCNPJ: TStringField
      FieldName = 'CNPJ'
    end
    object sqldPadraoIE: TStringField
      FieldName = 'IE'
    end
    object sqldPadraoCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object sqldPadraoTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
    object sqldPadraoFAX: TStringField
      FieldName = 'FAX'
    end
    object sqldPadraoEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 80
    end
    object sqldPadraoUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object sqldPadraoOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sqldPadraoVENDEDOR: TStringField
      FieldName = 'VENDEDOR'
      Size = 80
    end
    object sqldPadraoTELEFONEVENDEDOR: TStringField
      FieldName = 'TELEFONEVENDEDOR'
    end
    object sqldPadraoEMAILVENDEDOR: TStringField
      FieldName = 'EMAILVENDEDOR'
      Size = 80
    end
    object sqldPadraoTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
  end
  object dspPadrao: TDataSetProvider
    DataSet = sqldPadrao
    UpdateMode = upWhereKeyOnly
    Left = 540
    Top = 6
  end
  object cdsPadrao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    AfterInsert = cdsPadraoAfterInsert
    Left = 572
    Top = 6
    object cdsPadraoCODFORNECEDOR: TIntegerField
      FieldName = 'CODFORNECEDOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPadraoFANTAZIA: TStringField
      DisplayLabel = 'Fantasia'
      FieldName = 'FANTAZIA'
      Size = 80
    end
    object cdsPadraoRAZAOSOCIAL: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'RAZAOSOCIAL'
      Required = True
      Size = 80
    end
    object cdsPadraoDATACAD: TDateField
      FieldName = 'DATACAD'
    end
    object cdsPadraoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 80
    end
    object cdsPadraoCIDADE: TIntegerField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      Required = True
      OnValidate = cdsPadraoCIDADEValidate
    end
    object cdsPadraoNOMECIDADE: TStringField
      FieldName = 'NOMECIDADE'
      ProviderFlags = []
      Size = 80
    end
    object cdsPadraoBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 80
    end
    object cdsPadraoCNPJ: TStringField
      FieldName = 'CNPJ'
      Required = True
      OnSetText = cdsPadraoCNPJSetText
    end
    object cdsPadraoIE: TStringField
      FieldName = 'IE'
    end
    object cdsPadraoCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object cdsPadraoTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Required = True
    end
    object cdsPadraoFAX: TStringField
      FieldName = 'FAX'
    end
    object cdsPadraoEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 80
    end
    object cdsPadraoUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object cdsPadraoOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsPadraoVENDEDOR: TStringField
      FieldName = 'VENDEDOR'
      Required = True
      Size = 80
    end
    object cdsPadraoTELEFONEVENDEDOR: TStringField
      DisplayLabel = 'TELEFONE DO VENDEDOR'
      FieldName = 'TELEFONEVENDEDOR'
      Required = True
    end
    object cdsPadraoEMAILVENDEDOR: TStringField
      FieldName = 'EMAILVENDEDOR'
      Size = 80
    end
    object cdsPadraoTIPO: TStringField
      FieldName = 'TIPO'
      OnGetText = cdsPadraoTIPOGetText
      OnSetText = cdsPadraoTIPOSetText
      FixedChar = True
      Size = 1
    end
  end
  object sqldCidade: TSQLDataSet
    CommandText = 'select * from CIDADES'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 324
    Top = 244
  end
  object dspCidade: TDataSetProvider
    DataSet = sqldCidade
    Left = 404
    Top = 244
  end
  object cdsCidade: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCidade'
    Left = 476
    Top = 244
    object cdsCidadeCODCIDADE: TIntegerField
      FieldName = 'CODCIDADE'
      Required = True
    end
    object cdsCidadeDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
  end
end
