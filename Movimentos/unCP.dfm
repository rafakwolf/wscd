inherited frmCP: TfrmCP
  Left = 218
  Caption = 'frmCP'
  ClientHeight = 380
  ClientWidth = 521
  OldCreateOrder = True
  ExplicitWidth = 527
  ExplicitHeight = 429
  PixelsPerInch = 96
  TextHeight = 13
  object lbStatus: TLabel [0]
    Left = 8
    Top = 336
    Width = 53
    Height = 13
    Caption = 'lbStatus'
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object btnPagar: TBitBtn [1]
    Left = 424
    Top = 328
    Width = 89
    Height = 25
    Caption = 'Pagar'
    TabOrder = 14
    OnClick = btnPagarClick
  end
  object dbdVencimento: TDBEdit [2]
    Left = 168
    Top = 160
    Width = 153
    Height = 21
    DataField = 'VENCIMENTO'
    DataSource = dsPadrao
    TabOrder = 4
  end
  object btnContas: TBitBtn [3]
    Left = 320
    Top = 328
    Width = 97
    Height = 25
    Caption = 'Contas [F7]'
    TabOrder = 15
    OnClick = miContasFornecCorrenteClick
  end
  object dbdData: TDBEdit [4]
    Left = 8
    Top = 160
    Width = 153
    Height = 21
    DataField = 'DATA'
    DataSource = dsPadrao
    TabOrder = 3
  end
  object dbeOrigem: TDBEdit [5]
    Left = 360
    Top = 208
    Width = 65
    Height = 21
    Color = clBtnFace
    DataField = 'ORIGEM'
    DataSource = dsPadrao
    ReadOnly = True
    TabOrder = 9
  end
  object dbeJuros: TDBEdit [6]
    Left = 264
    Top = 208
    Width = 89
    Height = 21
    DataField = 'JURO'
    DataSource = dsPadrao
    TabOrder = 8
  end
  object grpPagamento: TGroupBox [7]
    Left = 8
    Top = 240
    Width = 505
    Height = 81
    Caption = ' Informa'#231#245'es de pagamento '
    TabOrder = 11
    object dbeDataPagto: TDBEdit
      Left = 8
      Top = 40
      Width = 89
      Height = 21
      Color = clBtnFace
      DataField = 'DATAPAGTO'
      DataSource = dsPadrao
      ReadOnly = True
      TabOrder = 0
    end
    object dbeDesconto: TDBEdit
      Left = 104
      Top = 40
      Width = 89
      Height = 21
      Color = clBtnFace
      DataField = 'DESCTO'
      DataSource = dsPadrao
      ReadOnly = True
      TabOrder = 1
    end
    object dbeCapitalPago: TDBEdit
      Left = 200
      Top = 40
      Width = 89
      Height = 21
      Color = clBtnFace
      DataField = 'CAPITALPAGO'
      DataSource = dsPadrao
      ReadOnly = True
      TabOrder = 2
    end
    object dbeJuroPago: TDBEdit
      Left = 296
      Top = 40
      Width = 89
      Height = 21
      Color = clBtnFace
      DataField = 'JUROPAGO'
      DataSource = dsPadrao
      ReadOnly = True
      TabOrder = 3
    end
    object dbeTotalPago: TDBEdit
      Left = 392
      Top = 40
      Width = 105
      Height = 21
      Color = clBtnFace
      DataField = 'TOTALPAGO'
      DataSource = dsPadrao
      ReadOnly = True
      TabOrder = 4
    end
  end
  object dbeDocumento: TDBEdit [8]
    Left = 328
    Top = 160
    Width = 185
    Height = 21
    DataField = 'DOCUMENTO'
    DataSource = dsPadrao
    TabOrder = 5
  end
  object dbeValor: TDBEdit [9]
    Left = 8
    Top = 208
    Width = 121
    Height = 21
    DataField = 'VALOR'
    DataSource = dsPadrao
    TabOrder = 6
  end
  object dbeDescricao: TDBEdit [10]
    Left = 8
    Top = 112
    Width = 505
    Height = 21
    DataField = 'DESCRICAO'
    DataSource = dsPadrao
    TabOrder = 2
    OnEnter = dbeDescricaoEnter
  end
  object dbeFornecedor: TDBEdit [11]
    Left = 8
    Top = 64
    Width = 267
    Height = 21
    Hint = 'Pesquisar < F2 >'
    Color = clBtnFace
    DataField = 'FANTAZIA'
    DataSource = dsPadrao
    ReadOnly = True
    TabOrder = 0
  end
  object dbeCompra: TDBEdit [12]
    Left = 432
    Top = 208
    Width = 81
    Height = 21
    Color = clBtnFace
    DataField = 'COMPRA'
    DataSource = dsPadrao
    ReadOnly = True
    TabOrder = 10
  end
  object dbeValorAtual: TDBEdit [13]
    Left = 136
    Top = 208
    Width = 121
    Height = 21
    Color = clBtnFace
    DataField = 'TOTAL'
    DataSource = dsPadrao
    ReadOnly = True
    TabOrder = 7
  end
  object dbeConta: TDBEdit [14]
    Left = 304
    Top = 64
    Width = 187
    Height = 21
    Hint = 'Pesquisar < F2 >'
    Color = clBtnFace
    DataField = 'NOME'
    DataSource = dsPadrao
    ReadOnly = True
    TabOrder = 1
  end
  inherited sbStatus: TStatusBar
    Top = 361
    Width = 521
    ExplicitTop = 361
    ExplicitWidth = 521
  end
  inherited pnBotoesPadrao: TPanel
    Width = 521
    TabOrder = 12
    ExplicitWidth = 521
  end
  inherited actlNavigateActions: TActionList
    Left = 375
    Top = 68
    inherited actPrint: TAction
      ShortCut = 0
      OnExecute = actPrintExecute
    end
    object actContas: TAction
      Category = 'Navigate'
      Caption = 'Contas a pagar por fornecedor'
      OnExecute = actContasExecute
    end
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 206
    Top = 308
  end
  inherited mmPadrao: TMainMenu
    Left = 463
    Top = 68
    inherited miOpcoes: TMenuItem
      object N5: TMenuItem
        Caption = '-'
      end
      object miConsulta: TMenuItem
        Caption = 'Consultas'
        object miContasFornecedor: TMenuItem
          Action = actContas
        end
        object miContasFornecCorrente: TMenuItem
          Caption = 'Contas deste fornecedor'
          ShortCut = 118
          OnClick = miContasFornecCorrenteClick
        end
      end
      object N10: TMenuItem
        Caption = '-'
      end
      object miParcelamento: TMenuItem
        Caption = 'Parcelamento'
        OnClick = miParcelamentoClick
      end
    end
    inherited miRelatorios: TMenuItem
      inherited mImprimir: TMenuItem
        Caption = 'Todas as contas'
        Hint = 'Todas as contas'
      end
      object N7: TMenuItem [1]
        Caption = '-'
      end
      object miContasPorForn: TMenuItem [2]
        Caption = 'Contas por fornecedor'
        OnClick = miContasPorFornClick
      end
      object miContasIntervaloData: TMenuItem [3]
        Caption = 'Contas por data de emiss'#227'o'
        OnClick = miContasIntervaloDataClick
      end
      object N9: TMenuItem [4]
        Caption = '-'
      end
      object miContasVencidas: TMenuItem [5]
        Caption = 'Contas vencidas'
        OnClick = miContasVencidasClick
      end
      object miContasVencPorForn: TMenuItem [6]
        Caption = 'Contas vencidas por fornecedor'
        OnClick = miContasVencPorFornClick
      end
      object N6: TMenuItem [7]
        Caption = '-'
      end
    end
  end
  object sqldPadrao: TSQLDataSet
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'    CP.CODIGO,'#13#10'    CP.DATA,'#13#10'    CP.VENCIMENTO,'#13#10'    CP' +
      '.FORNECEDOR,'#13#10'    FO.FANTAZIA,'#13#10'    CP.IDCONTA,'#13#10'    CC.CAIXANOM' +
      'E AS NOME,'#13#10'    CP.DESCRICAO,'#13#10'    CP.DOCUMENTO,'#13#10'    CP.VALOR,'#13 +
      #10'    CP.JURO,'#13#10'    CP.PAGAR,'#13#10'    CP.PAGA,'#13#10'    CP.DATAPAGTO,'#13#10' ' +
      '   CP.ORIGEM,'#13#10'    CP.COMPRA,'#13#10'    CP.CAPITALPAGO,'#13#10'    CP.JUROP' +
      'AGO,'#13#10'    CP.DESCTO,'#13#10'    CP.OBS,'#13#10'    CP.ATRASO,'#13#10'    CP.VALORJ' +
      'URO,'#13#10'    CP.TOTAL,'#13#10'    CP.TOTALPAGO'#13#10'FROM CONTASPAGAR CP'#13#10'LEFT' +
      ' JOIN FORNECEDORES FO ON (CP.FORNECEDOR = FO.CODFORNECEDOR)'#13#10'LEF' +
      'T JOIN VIEWCAIXAS CC ON (CC.IDCAIXAS = CP.IDCONTA)'#13#10'ORDER BY CP.' +
      'CODIGO, CP.DATA'
    MaxBlobSize = 1
    Params = <>
    Left = 111
    Top = 308
    object sqldPadraoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqldPadraoDATA: TDateField
      FieldName = 'DATA'
    end
    object sqldPadraoVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
    end
    object sqldPadraoFORNECEDOR: TIntegerField
      FieldName = 'FORNECEDOR'
    end
    object sqldPadraoFANTAZIA: TStringField
      FieldName = 'FANTAZIA'
      ProviderFlags = []
      Size = 80
    end
    object sqldPadraoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
    object sqldPadraoDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
    end
    object sqldPadraoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 15
    end
    object sqldPadraoJURO: TFMTBCDField
      FieldName = 'JURO'
      Precision = 15
    end
    object sqldPadraoPAGAR: TStringField
      FieldName = 'PAGAR'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoPAGA: TStringField
      FieldName = 'PAGA'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoDATAPAGTO: TDateField
      FieldName = 'DATAPAGTO'
    end
    object sqldPadraoORIGEM: TIntegerField
      FieldName = 'ORIGEM'
    end
    object sqldPadraoCOMPRA: TIntegerField
      FieldName = 'COMPRA'
    end
    object sqldPadraoCAPITALPAGO: TFMTBCDField
      FieldName = 'CAPITALPAGO'
      Precision = 15
    end
    object sqldPadraoJUROPAGO: TFMTBCDField
      FieldName = 'JUROPAGO'
      Precision = 15
    end
    object sqldPadraoDESCTO: TFMTBCDField
      FieldName = 'DESCTO'
      Precision = 15
    end
    object sqldPadraoOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sqldPadraoATRASO: TIntegerField
      FieldName = 'ATRASO'
    end
    object sqldPadraoIDCONTA: TIntegerField
      FieldName = 'IDCONTA'
    end
    object sqldPadraoNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 80
    end
    object sqldPadraoVALORJURO: TSingleField
      FieldName = 'VALORJURO'
    end
    object sqldPadraoTOTAL: TSingleField
      FieldName = 'TOTAL'
    end
    object sqldPadraoTOTALPAGO: TSingleField
      FieldName = 'TOTALPAGO'
    end
  end
  object dspPadrao: TDataSetProvider
    DataSet = sqldPadrao
    UpdateMode = upWhereKeyOnly
    Left = 143
    Top = 308
  end
  object cdsPadrao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    AfterInsert = cdsPadraoAfterInsert
    AfterScroll = cdsPadraoAfterScroll
    Left = 175
    Top = 308
    object cdsPadraoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPadraoDATA: TDateField
      FieldName = 'DATA'
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoFORNECEDOR: TIntegerField
      FieldName = 'FORNECEDOR'
      Required = True
      OnValidate = cdsPadraoFORNECEDORValidate
    end
    object cdsPadraoFANTAZIA: TStringField
      FieldName = 'FANTAZIA'
      ProviderFlags = []
      Size = 80
    end
    object cdsPadraoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
    object cdsPadraoDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
    end
    object cdsPadraoPAGAR: TStringField
      FieldName = 'PAGAR'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoPAGA: TStringField
      FieldName = 'PAGA'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoDATAPAGTO: TDateField
      FieldName = 'DATAPAGTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoORIGEM: TIntegerField
      FieldName = 'ORIGEM'
    end
    object cdsPadraoCOMPRA: TIntegerField
      FieldName = 'COMPRA'
    end
    object cdsPadraoOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsPadraoATRASO: TIntegerField
      FieldName = 'ATRASO'
    end
    object cdsPadraoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 15
    end
    object cdsPadraoJURO: TFMTBCDField
      FieldName = 'JURO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 15
    end
    object cdsPadraoCAPITALPAGO: TFMTBCDField
      FieldName = 'CAPITALPAGO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 15
    end
    object cdsPadraoJUROPAGO: TFMTBCDField
      FieldName = 'JUROPAGO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 15
    end
    object cdsPadraoDESCTO: TFMTBCDField
      FieldName = 'DESCTO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 15
    end
    object cdsPadraoIDCONTA: TIntegerField
      FieldName = 'IDCONTA'
      OnValidate = cdsPadraoIDCONTAValidate
    end
    object cdsPadraoNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 80
    end
    object cdsPadraoVALORJURO: TSingleField
      FieldName = 'VALORJURO'
    end
    object cdsPadraoTOTAL: TSingleField
      FieldName = 'TOTAL'
    end
    object cdsPadraoTOTALPAGO: TSingleField
      FieldName = 'TOTALPAGO'
    end
  end
  object sqldDeleta: TSQLDataSet
    CommandText = 'STPDELCP'
    CommandType = ctStoredProc
    DbxCommandType = 'Dbx.StoredProcedure'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    Left = 424
    Top = 12
  end
end
