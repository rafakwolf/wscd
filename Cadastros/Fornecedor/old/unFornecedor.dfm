inherited frmFornecedor: TfrmFornecedor
  Left = 139
  Top = 147
  Caption = 'frmFornecedor'
  ClientHeight = 364
  ClientWidth = 705
  OldCreateOrder = True
  ExplicitWidth = 711
  ExplicitHeight = 413
  PixelsPerInch = 96
  TextHeight = 13
  object bvlLinha: TBevel [0]
    Left = 8
    Top = 232
    Width = 689
    Height = 2
  end
  object btnObservacoes: TBitBtn [1]
    Left = 592
    Top = 304
    Width = 105
    Height = 25
    Caption = 'Observa'#231#245'es'
    TabOrder = 16
    OnClick = btnObservacoesClick
  end
  object dbdDataCadastro: TDBEdit [2]
    Left = 280
    Top = 196
    Width = 129
    Height = 21
    DataField = 'DATACAD'
    DataSource = dsPadrao
    TabOrder = 11
  end
  object dbeCidade: TDBEdit [3]
    Left = 320
    Top = 152
    Width = 299
    Height = 21
    Hint = 'Pesquisar < F2 >'
    Color = clBtnFace
    DataField = 'NOMECIDADE'
    DataSource = dsPadrao
    ReadOnly = True
    TabOrder = 7
  end
  object dbeTelefoneVendedor: TDBEdit [4]
    Left = 544
    Top = 264
    Width = 153
    Height = 21
    DataField = 'TELEFONEVENDEDOR'
    DataSource = dsPadrao
    TabOrder = 14
  end
  object dbeEmailVendedor: TDBEdit [5]
    Left = 8
    Top = 308
    Width = 361
    Height = 21
    CharCase = ecLowerCase
    DataField = 'EMAILVENDEDOR'
    DataSource = dsPadrao
    TabOrder = 15
  end
  object dbeNomeVendedor: TDBEdit [6]
    Left = 8
    Top = 264
    Width = 529
    Height = 21
    DataField = 'VENDEDOR'
    DataSource = dsPadrao
    TabOrder = 13
  end
  object dbeFax: TDBEdit [7]
    Left = 144
    Top = 196
    Width = 129
    Height = 21
    DataField = 'FAX'
    DataSource = dsPadrao
    TabOrder = 10
  end
  object dbeTelefone: TDBEdit [8]
    Left = 8
    Top = 196
    Width = 129
    Height = 21
    DataField = 'TELEFONE'
    DataSource = dsPadrao
    TabOrder = 9
  end
  object dbeInscEstadual: TDBEdit [9]
    Left = 176
    Top = 108
    Width = 129
    Height = 21
    DataField = 'IE'
    DataSource = dsPadrao
    TabOrder = 3
  end
  object dbeCnpj: TDBEdit [10]
    Left = 8
    Top = 108
    Width = 161
    Height = 21
    DataField = 'CNPJ'
    DataSource = dsPadrao
    TabOrder = 2
  end
  object dbeCep: TDBEdit [11]
    Left = 216
    Top = 152
    Width = 97
    Height = 21
    DataField = 'CEP'
    DataSource = dsPadrao
    TabOrder = 6
  end
  object dbeBairro: TDBEdit [12]
    Left = 8
    Top = 152
    Width = 201
    Height = 21
    DataField = 'BAIRRO'
    DataSource = dsPadrao
    TabOrder = 5
  end
  object dbeEstado: TDBEdit [13]
    Left = 648
    Top = 152
    Width = 49
    Height = 21
    DataField = 'UF'
    DataSource = dsPadrao
    TabOrder = 8
  end
  object dbeEndereco: TDBEdit [14]
    Left = 312
    Top = 108
    Width = 385
    Height = 21
    DataField = 'ENDERECO'
    DataSource = dsPadrao
    TabOrder = 4
  end
  object dbeNomeRzSocial: TDBEdit [15]
    Left = 8
    Top = 64
    Width = 305
    Height = 21
    DataField = 'RAZAOSOCIAL'
    DataSource = dsPadrao
    TabOrder = 0
  end
  object dbeNomeFantazia: TDBEdit [16]
    Left = 320
    Top = 64
    Width = 377
    Height = 21
    DataField = 'FANTAZIA'
    DataSource = dsPadrao
    TabOrder = 1
  end
  object dbeEmail: TDBEdit [17]
    Left = 416
    Top = 196
    Width = 281
    Height = 21
    CharCase = ecLowerCase
    DataField = 'EMAIL'
    DataSource = dsPadrao
    TabOrder = 12
  end
  object btnContas: TBitBtn [18]
    Left = 504
    Top = 304
    Width = 81
    Height = 25
    Caption = '&Contas'
    TabOrder = 19
    OnClick = btnContasClick
  end
  inherited sbStatus: TStatusBar
    Top = 345
    Width = 705
    ExplicitTop = 345
    ExplicitWidth = 705
  end
  inherited pnBotoesPadrao: TPanel
    Width = 705
    TabOrder = 17
    ExplicitWidth = 705
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
  inherited mmPadrao: TMainMenu
    Left = 440
    Top = 4
    inherited miOpcoes: TMenuItem
      object N7: TMenuItem
        Caption = '-'
      end
      object miAjustarCNPJ: TMenuItem
        Caption = 'Ajustar CNPJs'
        OnClick = miAjustarCNPJClick
      end
    end
    inherited miRelatorios: TMenuItem
      inherited mImprimir: TMenuItem
        Caption = 'Listagem de fornecedores'
      end
      object N6: TMenuItem [1]
        Caption = '-'
      end
      object miRelFornData: TMenuItem [2]
        Caption = 'Relat'#243'rio por data de cadastro'
        OnClick = miRelFornDataClick
      end
      object miRelPorCidade: TMenuItem [3]
        Caption = 'Relat'#243'rio por cidade'
        OnClick = miRelPorCidadeClick
      end
      object N5: TMenuItem [4]
        Caption = '-'
      end
    end
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
