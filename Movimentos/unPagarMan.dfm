inherited frmPagarMan: TfrmPagarMan
  Left = 219
  Top = 139
  ClientHeight = 417
  ClientWidth = 481
  Caption = 'Pagamento'
  OnShow = FormShow
  BorderStyle = bsSingle
  OnKeyPress = FormKeyPress
  BorderIcons = [biSystemMenu, biMinimize]
  ExplicitWidth = 487
  ExplicitHeight = 446
  PixelsPerInch = 96
  TextHeight = 13
  object lblVenc: TLabel
    Left = 120
    Top = 372
    Width = 45
    Height = 13
    Hint = ''
    ShowHint = True
    Caption = 'Bom para'
    TabOrder = 13
  end
  object lblBandaMagnetica: TLabel
    Left = 8
    Top = 292
    Width = 82
    Height = 13
    Hint = ''
    ShowHint = True
    Caption = 'Banda magn'#233'tica'
    TabOrder = 14
  end
  object lblEmissao: TLabel
    Left = 8
    Top = 372
    Width = 38
    Height = 13
    Hint = ''
    ShowHint = True
    Caption = 'Emiss'#227'o'
    TabOrder = 15
  end
  object btnOk: TBitBtn
    Left = 304
    Top = 384
    Width = 81
    Height = 25
    Hint = 'Efetuar recebimento'
    ShowHint = True
    Glyph.Data = {
      36060000424D3606000000000000360000002800000020000000100000000100
      18000000000000060000C40E0000C40E00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF006600006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565656565FF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF0066001EB2311FB133006600FF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6565659A9A9A9A9A9A65
      6565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF00660031C24F22B7381AB02D21B437006600FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565ABABAB9E9E9E9797979C
      9C9C656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      00660047D36D3BCB5E25A83B0066001BA92E1DB132006600FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF656565BFBFBFB5B5B598989865656594
      9494999999656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF006600
      4FD67953DE7F31B54D006600FF00FF006600179D271EAE31006600FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FF656565C4C4C4CACACAA5A5A5656565FF00FF65
      65658C8C8C989898656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      00660041C563006600FF00FFFF00FFFF00FFFF00FF00660019AA2B006600FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF656565B5B5B5656565FF00FFFF00FFFF
      00FFFF00FF656565939393656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF006600149D210066
      00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565FF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FF6565658A8A8A656565FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0066
      00006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FF656565656565FF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FF006600006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565656565FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    Caption = '&Ok'
    TabOrder = 11
    OnClick = btnOkClick
  end
  object btnCancel: TBitBtn
    Left = 392
    Top = 384
    Width = 81
    Height = 25
    Hint = 'Cancelar recebimento'
    ShowHint = True
    Glyph.Data = {
      36060000424D3606000000000000360000002800000020000000100000000100
      18000000000000060000C40E0000C40E00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF00009A00009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00009A0000
      9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
      00009A174AFD103BF400009AFF00FFFF00FFFF00FFFF00FF00009A002CF80030
      FC00009AFF00FFFF00FFFF00FFFF00FF6B6B6BA8A8A8A0A0A06B6B6BFF00FFFF
      00FFFF00FFFF00FF6B6B6B9A9A9A9C9C9C6B6B6BFF00FFFF00FFFF00FFFF00FF
      00009A1A47F81A4CFF123BF100009AFF00FFFF00FF00009A012DF60132FF002A
      F300009AFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7AAAAAA9F9F9F6B6B6BFF
      00FFFF00FF6B6B6B9999999E9E9E9797976B6B6BFF00FFFF00FFFF00FFFF00FF
      FF00FF00009A1C47F61B4DFF143EF400009A00009A002DF80134FF032BF20000
      9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7ABABABA2A2A26B
      6B6B6B6B6B9A9A9A9E9E9E9898986B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF00009A1D48F61D50FF103DFB0431FE0132FF002CF600009AFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7ACACACA3
      A3A39F9F9F9E9E9E9999996B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF00009A1A48F91342FF0C3CFF0733F600009AFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7A7
      A7A7A3A3A39C9C9C6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF00009A214EFC1D4BFF1847FF1743F600009AFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BACACACAC
      ACACA9A9A9A4A4A46B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF00009A2E5BF92C5FFF224DF8204BF82355FF1B46F600009AFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BB1B1B1B3B3B3AB
      ABABAAAAAAAFAFAFA6A6A66B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF00009A3664FA386BFF2D59F400009A00009A224CF42558FF1D49F60000
      9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BB6B6B6B9B9B9AEAEAE6B
      6B6B6B6B6BA9A9A9B0B0B0A7A7A76B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
      00009A4071FA4274FF325DF100009AFF00FFFF00FF00009A224DF1275AFF204C
      F800009AFF00FFFF00FFFF00FFFF00FF6B6B6BBBBBBBBEBEBEAFAFAF6B6B6BFF
      00FFFF00FF6B6B6BA7A7A7B1B1B1AAAAAA6B6B6BFF00FFFF00FFFF00FFFF00FF
      00009A497AFC3B66F300009AFF00FFFF00FFFF00FFFF00FF00009A2550F42655
      FA00009AFF00FFFF00FFFF00FFFF00FF6B6B6BC0C0C0B5B5B56B6B6BFF00FFFF
      00FFFF00FFFF00FF6B6B6BAAAAAAAEAEAE6B6B6BFF00FFFF00FFFF00FFFF00FF
      FF00FF00009A00009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00009A0000
      9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    Caption = '&Cancelar'
    TabOrder = 12
    OnClick = btnCancelClick
  end
  object edtTotal: TEdit
    Left = 8
    Top = 260
    Width = 129
    Height = 21
    Hint = ''
    ShowHint = True
    Text = ''
    TabOrder = 2
  end
  object edtAgencia: TEdit
    Left = 8
    Top = 348
    Width = 105
    Height = 21
    Hint = ''
    ShowHint = True
    Text = ''
    TabOrder = 5
  end
  object edtConta: TEdit
    Left = 120
    Top = 348
    Width = 105
    Height = 21
    Hint = ''
    ShowHint = True
    Text = ''
    TabOrder = 6
  end
  object edtNumeroCheque: TEdit
    Left = 232
    Top = 348
    Width = 105
    Height = 21
    Hint = ''
    ShowHint = True
    Text = ''
    TabOrder = 7
  end
  object edtValor: TEdit
    Left = 344
    Top = 348
    Width = 129
    Height = 21
    Hint = ''
    ShowHint = True
    Text = ''
    TabOrder = 8
    OnEnter = edtValorEnter
  end
  object dbeBanco: TDBEdit
    Left = 248
    Top = 308
    Width = 203
    Height = 21
    Hint = 'Pesquisar < F2 >'
    ShowHint = True
    DataField = 'BANCO'
    DataSource = dsSelecao
    TabOrder = 4
    Color = clBtnFace
    ReadOnly = True
  end
  object bvlLinha: TPanel
    Left = 8
    Top = 200
    Width = 465
    Height = 2
    Hint = ''
    ShowHint = True
    TabOrder = 16
    Caption = 'bvlLinha'
  end
  object bvlLinha2: TPanel
    Left = 8
    Top = 288
    Width = 466
    Height = 2
    Hint = ''
    ShowHint = True
    TabOrder = 17
    Caption = 'bvlLinha2'
  end
  object medtEmissao: TEdit
    Left = 8
    Top = 388
    Width = 105
    Height = 21
    Hint = ''
    ShowHint = True
    MaxLength = 10
    Text = '  /  /    '
    TabOrder = 9
  end
  object medtVencimento: TEdit
    Left = 120
    Top = 388
    Width = 105
    Height = 21
    Hint = ''
    ShowHint = True
    MaxLength = 10
    Text = '  /  /    '
    TabOrder = 10
  end
  object medtBandaMagnetica: TEdit
    Left = 8
    Top = 308
    Width = 233
    Height = 21
    Hint = ''
    ShowHint = True
    Text = ''
    TabOrder = 3
    OnExit = medtBandaMagneticaExit
  end
  object dbgrdContasCP: TDBGrid
    Left = 8
    Top = 8
    Width = 465
    Height = 185
    Hint = ''
    ShowHint = True
    DataSource = dsContasPagar
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgConfirmDelete, dgTabs, dgCancelOnExit]
    LoadMask.Message = 'Loading data...'
    Font.Charset = ANSI_CHARSET
    Font.Name = 'Verdana'
    ParentFont = False
    TabOrder = 0
    ParentColor = False
    Color = clBtnFace
  end
  object rgTipoPagamento: TRadioGroup
    Left = 8
    Top = 208
    Width = 465
    Height = 33
    Hint = ''
    ShowHint = True
    Items.Strings = (
      'Dinheiro'
      'Cheque')
    ItemIndex = 0
    Caption = 'Pagamento'
    TabOrder = 1
    TabStop = False
    Columns = 2
    OnClick = rgTipoPagamentoClick
  end
  object dsContasPagar: TDataSource
    AutoEdit = False
    DataSet = cdsContasPagar
    Left = 167
    Top = 96
  end
  object sqldContasPagar: TSQLDataSet
    CommandText = 
      'SELECT'#13#10'  CP.CODIGO,'#13#10'  CP.DATA,'#13#10'  CP.VENCIMENTO,'#13#10'  CP.FORNECE' +
      'DOR,'#13#10'  FO.FANTAZIA AS NOMEFORN,'#13#10'  CP.IDCONTA,'#13#10'  CC.NOME AS CO' +
      'NTA,'#13#10'  CP.DESCRICAO,'#13#10'  CP.DOCUMENTO,'#13#10'  CP.VALOR,'#13#10'  CP.JURO,'#13 +
      #10'  CP.PAGAR,'#13#10'  CP.PAGA,'#13#10'  CP.DATAPAGTO,'#13#10'  CP.ORIGEM,'#13#10'  CP.CO' +
      'MPRA,'#13#10'  CP.CAPITALPAGO,'#13#10'  CP.JUROPAGO,'#13#10'  CP.DESCTO,'#13#10'  CP.OBS' +
      ','#13#10'  CP.ATRASO,'#13#10'  CP.VALORJURO,'#13#10'  CP.TOTAL,'#13#10'  CP.TOTALPAGO'#13#10'F' +
      'ROM CONTASPAGAR CP'#13#10'LEFT JOIN FORNECEDORES FO ON (CP.FORNECEDOR ' +
      '= FO.CODFORNECEDOR)'#13#10'LEFT JOIN CAIXAS CC ON (CC.CODIGO = CP.IDCO' +
      'NTA)'#13#10'WHERE (CP.PAGAR = '#39'S'#39')'
    MaxBlobSize = 1
    Params = <>
    Left = 72
    Top = 96
    object sqldContasPagarCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqldContasPagarDATA: TDateField
      FieldName = 'DATA'
    end
    object sqldContasPagarVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
    end
    object sqldContasPagarFORNECEDOR: TIntegerField
      FieldName = 'FORNECEDOR'
    end
    object sqldContasPagarNOMEFORN: TStringField
      FieldName = 'NOMEFORN'
      ProviderFlags = []
      Size = 80
    end
    object sqldContasPagarDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
    object sqldContasPagarDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
    end
    object sqldContasPagarVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 15
    end
    object sqldContasPagarJURO: TFMTBCDField
      FieldName = 'JURO'
      Precision = 15
    end
    object sqldContasPagarPAGAR: TStringField
      FieldName = 'PAGAR'
      FixedChar = True
      Size = 1
    end
    object sqldContasPagarPAGA: TStringField
      FieldName = 'PAGA'
      FixedChar = True
      Size = 1
    end
    object sqldContasPagarDATAPAGTO: TDateField
      FieldName = 'DATAPAGTO'
    end
    object sqldContasPagarORIGEM: TIntegerField
      FieldName = 'ORIGEM'
    end
    object sqldContasPagarCOMPRA: TIntegerField
      FieldName = 'COMPRA'
    end
    object sqldContasPagarCAPITALPAGO: TFMTBCDField
      FieldName = 'CAPITALPAGO'
      Precision = 15
    end
    object sqldContasPagarJUROPAGO: TFMTBCDField
      FieldName = 'JUROPAGO'
      Precision = 15
    end
    object sqldContasPagarDESCTO: TFMTBCDField
      FieldName = 'DESCTO'
      Precision = 15
    end
    object sqldContasPagarOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sqldContasPagarATRASO: TIntegerField
      FieldName = 'ATRASO'
    end
    object sqldContasPagarIDCONTA: TIntegerField
      FieldName = 'IDCONTA'
    end
    object sqldContasPagarCONTA: TStringField
      FieldName = 'CONTA'
      Size = 80
    end
    object sqldContasPagarVALORJURO: TFMTBCDField
      FieldName = 'VALORJURO'
    end
    object sqldContasPagarTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
    end
    object sqldContasPagarTOTALPAGO: TFMTBCDField
      FieldName = 'TOTALPAGO'
    end
  end
  object dspContasPagar: TDataSetProvider
    DataSet = sqldContasPagar
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 104
    Top = 96
  end
  object cdsContasPagar: TMemDataset
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContasPagar'
    AfterInsert = cdsContasPagarAfterInsert
    Left = 136
    Top = 96
    object cdsContasPagarCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsContasPagarDATA: TDateField
      FieldName = 'DATA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsContasPagarVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsContasPagarFORNECEDOR: TIntegerField
      FieldName = 'FORNECEDOR'
    end
    object cdsContasPagarNOMEFORN: TStringField
      FieldName = 'NOMEFORN'
      ProviderFlags = []
      Size = 80
    end
    object cdsContasPagarDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
    object cdsContasPagarDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
    end
    object cdsContasPagarVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
    object cdsContasPagarJURO: TFMTBCDField
      FieldName = 'JURO'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
    object cdsContasPagarPAGAR: TStringField
      FieldName = 'PAGAR'
      FixedChar = True
      Size = 1
    end
    object cdsContasPagarPAGA: TStringField
      FieldName = 'PAGA'
      FixedChar = True
      Size = 1
    end
    object cdsContasPagarDATAPAGTO: TDateField
      FieldName = 'DATAPAGTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsContasPagarORIGEM: TIntegerField
      FieldName = 'ORIGEM'
    end
    object cdsContasPagarCOMPRA: TIntegerField
      FieldName = 'COMPRA'
    end
    object cdsContasPagarCAPITALPAGO: TFMTBCDField
      FieldName = 'CAPITALPAGO'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
    object cdsContasPagarJUROPAGO: TFMTBCDField
      FieldName = 'JUROPAGO'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
    object cdsContasPagarDESCTO: TFMTBCDField
      FieldName = 'DESCTO'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
    object cdsContasPagarOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsContasPagarATRASO: TIntegerField
      FieldName = 'ATRASO'
    end
    object cdsContasPagarIDCONTA: TIntegerField
      FieldName = 'IDCONTA'
    end
    object cdsContasPagarCONTA: TStringField
      FieldName = 'CONTA'
      Size = 80
    end
    object cdsContasPagarVALORJURO: TFMTBCDField
      FieldName = 'VALORJURO'
    end
    object cdsContasPagarTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
    end
    object cdsContasPagarTOTALPAGO: TFMTBCDField
      FieldName = 'TOTALPAGO'
    end
  end
  object sqldSelecao: TSQLDataSet
    CommandText = 
      'select'#13#10'  cast(null as integer) idbanco,'#13#10'  cast(null as varchar' +
      '(80)) banco'#13#10'from rdb$database'
    DataSource = dsContasPagar
    MaxBlobSize = -1
    Params = <>
    Left = 264
    Top = 72
    object sqldSelecaoIDBANCO: TIntegerField
      FieldName = 'IDBANCO'
    end
    object sqldSelecaoBANCO: TStringField
      FieldName = 'BANCO'
      Size = 80
    end
  end
  object dspSelecao: TDataSetProvider
    DataSet = sqldSelecao
    Left = 336
    Top = 72
  end
  object cdsSelecao: TMemDataset
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSelecao'
    Left = 408
    Top = 72
    object cdsSelecaoIDBANCO: TIntegerField
      FieldName = 'IDBANCO'
      OnValidate = cdsSelecaoIDBANCOValidate
    end
    object cdsSelecaoBANCO: TStringField
      FieldName = 'BANCO'
      Size = 80
    end
  end
  object dsSelecao: TDataSource
    DataSet = cdsSelecao
    Left = 384
    Top = 136
  end
end
