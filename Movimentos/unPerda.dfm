inherited frmPerda: TfrmPerda
  Caption = 'frmPerda'
  ClientHeight = 396
  ClientWidth = 473
  OldCreateOrder = True
  ExplicitWidth = 479
  ExplicitHeight = 444
  PixelsPerInch = 96
  TextHeight = 13
  object lbQtde: TLabel [0]
    Left = 36
    Top = 84
    Width = 27
    Height = 13
    Caption = 'Qtde'
    FocusControl = dbQtde
  end
  object lbPreco: TLabel [1]
    Left = 31
    Top = 108
    Width = 32
    Height = 13
    Caption = 'Pre'#231'o'
    FocusControl = dbPreco
  end
  object lbObs: TLabel [2]
    Left = 37
    Top = 267
    Width = 26
    Height = 13
    Caption = 'Obs.'
  end
  object lbPrecoCusto: TLabel [3]
    Left = 183
    Top = 108
    Width = 43
    Height = 13
    Caption = '(Custo)'
  end
  object dbrgrpMOTIVO: TDBRadioGroup [4]
    Left = 66
    Top = 152
    Width = 153
    Height = 105
    Caption = 'Motivo'
    DataField = 'MOTIVO'
    DataSource = dsPadrao
    Items.Strings = (
      '&Danificado'
      '&Vencido'
      '&Furto'
      '&Perda de peso'
      '&Outro')
    TabOrder = 4
    TabStop = True
    Values.Strings = (
      'D'
      'V'
      'F'
      'P'
      'O')
  end
  object dbdData: TPLDBEditDateTimePicker [5]
    Left = 66
    Top = 128
    Width = 153
    Height = 21
    Date = 39376.056222673610000000
    Time = 39376.056222673610000000
    TabOrder = 3
    DataField = 'DATA'
    DataSource = dsPadrao
    ReadOnly = False
    DefaultEditMask = '!99/99/9999;1;_'
    EditLabel.Left = 36
    EditLabel.Top = 132
    EditLabel.Width = 27
    EditLabel.Height = 13
    EditLabel.Alignment = taRightJustify
    EditLabel.Caption = 'Data'
    EditLabel.FocusControl = dbdData
    Required = False
  end
  object dbQtde: TDBEdit [6]
    Left = 66
    Top = 80
    Width = 73
    Height = 21
    DataField = 'QTDE'
    DataSource = dsPadrao
    TabOrder = 1
  end
  object dbProduto: TPLDBEdit [7]
    Left = 66
    Top = 56
    Width = 361
    Height = 21
    Hint = 'Pesquisar < F2 >'
    Color = clBtnFace
    Ctl3D = True
    DataField = 'DESCRICAO'
    DataSource = dsPadrao
    ReadOnly = True
    TabOrder = 0
    EditLabel.Left = 19
    EditLabel.Top = 60
    EditLabel.Width = 44
    EditLabel.Height = 13
    EditLabel.Alignment = taRightJustify
    EditLabel.Caption = 'Produto'
    EditLabel.FocusControl = dbProduto
    Button.Left = 428
    Button.Top = 56
    Button.Width = 21
    Button.Height = 21
    Button.Cursor = crArrow
    Button.Hint = 'Pesquisar <F2>'
    Button.Glyph.Data = {
      3E070000424D3E07000000000000360000002800000021000000120000000100
      18000000000008070000C20E0000C20E00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFCCCCCCCCCCCCCCCCCCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCCCCCCCCCCCCCCCCCCFF00FFFF00
      FF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFCCCCCC4780AB487FAA4881ACB0BDC6FF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCCCCCC868686858585878787BE
      BEBEFF00FF00FF00FFFF00FFFF00FFFF00FFE5E5E5CECECECCCCCCCCCCCCCCCC
      CCCFCFCFCCCCCC3E81B3739DBF1FADFF92CEE94491C6FF00FFFF00FFFF00FFFF
      00FFE5E5E5CECECECCCCCCCCCCCCCCCCCCCFCFCFCCCCCC888888A2A2A2B5B5B5
      CFCFCF989898FF00FF00FF00FFFF00FFFF00FFD1D1D1A4A3A27F7D7C7B7A787B
      79787B797884807D5B7D97A29A92AFA39BA0C2D8B0ECFF3F90C6FF00FFFF00FF
      FF00FFD1D1D1A2A2A27C7C7C7979797878787878787F7F7F808080989898A1A1
      A1C4C4C4EAEAEA969696FF00FF00FF00FFFF00FFD1D1D18786849C9D9DD1D3D5
      E3E5EAE2E4E9E3E4E9D1D1D39C9A9A83807DC6C2BDF4EBE4BFDEEA3F92CAFF00
      FFFF00FFD1D1D18585859C9C9CD3D3D3E6E6E6E5E5E5E5E5E5D1D1D19A9A9A7F
      7F7FC0C0C0E9E9E9DEDEDE999999FF00FF00FF00FFE5E5E5888786B4B3B6E6E4
      DFE9CD9AF1CB7EF5D489F9DB8DF2E1ADE6E5E0B0AEB0908B8AEDE3DB368FCAFF
      00FFFF00FFE5E5E5868686B4B4B4E2E2E2C0C0C0B8B8B8C1C1C1C7C7C7D3D3D3
      E3E3E3AEAEAE8B8B8BE1E1E1969696FF00FFFF00FF00FF00FFA9A8A6A2A1A2EB
      E6E2E9BB75EDC47DF3D28CF9DF98FBE69FFDE89EFBE39BEBE8E3A09C9C5B87A5
      FF00FFFF00FFFF00FFA7A7A7A1A1A1E5E5E5ABABABB3B3B3C0C0C0CCCCCCD3D3
      D3D4D4D4D0D0D0E6E6E69C9C9C8A8A8AFF00FFFF00FFFF00FF00FF00FF868483
      DCDFE1E6C28FEBC58BF0D399F7DA95F3D28CF9DF98FBE69FFDE89EF5E2AEDBDC
      DE8B8683FF00FFFF00FFFF00FF838383DFDFDFB6B6B6B7B7B7C4C4C4C8C8C8C0
      C0C0CCCCCCD3D3D3D4D4D4D4D4D4DCDCDC858585FF00FFFF00FFFF00FF00FF00
      FF858482F4F8FCE1A95EF5DEBAF8E1B5FFE9AFF7DA95F7DA95F9DF98FBE59FF8
      D98CF3F4FA858382FF00FFFF00FFFF00FF838383F8F8F8989898D5D5D5D6D6D6
      DADADAC8C8C8C8C8C8CCCCCCD2D2D2C5C5C5F5F5F5828282FF00FFFF00FFFF00
      FF00FF00FF888584F7FCFFDFA559FAEDD7F8E1B5F8E1B5F7DA95F7DA95F3D28C
      F9DF98F4D287F5F9FF888584FF00FFFF00FFFF00FF858585FCFCFC949494E7E7
      E7D6D6D6D6D6D6C8C8C8C8C8C8C0C0C0CCCCCCBFBFBFFAFAFA858585FF00FFFF
      00FFFF00FF00FF00FF8A8886FDFFFFDC9F53F9EAD7FCEFD6FFEFCBF8E1B4FFE9
      AFF7DA95F2D28BEFC87CFBFDFF8A8786FF00FFFF00FFFF00FF878787FEFEFE8F
      8F8FE6E6E6E9E9E9E6E6E6D6D6D6DADADAC8C8C8C0C0C0B5B5B5FDFDFD878787
      FF00FFFF00FFFF00FF00FF00FF908D8CEAEDF1E6BA88EDCCA3FBF4E7FCEED5F8
      E1B4F8E1B4F1D29AEBC37BF0D3A1E9EBF08F8D8BFF00FFFF00FFFF00FF8D8D8D
      EDEDEDB0B0B0C3C3C3F0F0F0E8E8E8D6D6D6D6D6D6C4C4C4B2B2B2C7C7C7ECEC
      EC8C8C8CFF00FFFF00FFFF00FF00FF00FFC7C5C4B3B2B2FEFAF5DBA058ECCCA3
      FBEFDFFAECD6F4E0BEECCA95E7B972FFFDF9B2B1B2C7C5C4FF00FFFF00FFFF00
      FFC5C5C5B2B2B2F8F8F8919191C3C3C3EBEBEBE7E7E7D8D8D8BEBEBEA9A9A9FC
      FCFCB1B1B1C5C5C5FF00FFFF00FFFF00FF00FF00FFFF00FF9D9B99CDCDCFFFFD
      FAE7BC8ADA9D51DDA357DEA65BECC896FFFFFCCCCCCE9D9A99FF00FFFF00FFFF
      00FFFF00FFFF00FF9A9A9ACDCDCDFCFCFCB1B1B18D8D8D929292959595BDBDBD
      FEFEFECCCCCC9A9A9AFF00FFFF00FFFF00FFFF00FF00FF00FFFF00FFFF00FF9E
      9D9BB8B8B9F5F8FCFFFFFFFFFFFFFFFFFFF5F7FCB8B7B99E9C9BFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FF9C9C9CB8B8B8F8F8F8FFFFFFFFFFFFFFFF
      FFF8F8F8B7B7B79C9C9CFF00FFFF00FFFF00FFFF00FFFF00FF00FF00FFFF00FF
      FF00FFFF00FFCAC9C8999695959391959291959291999695CAC9C8FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC8C8C896969692929292
      9292929292969696C8C8C8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FF00}
    Button.Layout = blGlyphRight
    Button.NumGlyphs = 2
    Button.ParentShowHint = False
    Button.ShowHint = True
    Button.Visible = False
    Button.OnClick = dbProdutoClickButton
    Button.AutoSize = True
    OnClickButton = dbProdutoClickButton
    ReadOnlyChangesColor = False
  end
  object dbmOBS: TDBMemo [8]
    Left = 66
    Top = 264
    Width = 383
    Height = 89
    DataField = 'OBS'
    DataSource = dsPadrao
    ScrollBars = ssVertical
    TabOrder = 5
  end
  object dbPreco: TDBEdit [9]
    Left = 66
    Top = 104
    Width = 113
    Height = 21
    DataField = 'PRECO'
    DataSource = dsPadrao
    TabOrder = 2
  end
  inherited sbStatus: TStatusBar
    Top = 377
    Width = 473
    ExplicitTop = 377
    ExplicitWidth = 473
  end
  inherited pnBotoesPadrao: TPanel
    Width = 473
    TabOrder = 6
    ExplicitWidth = 473
  end
  inherited actlNavigateActions: TActionList
    Left = 272
    Top = 100
    inherited actPrint: TAction
      OnExecute = actPrintExecute
    end
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 367
    Top = 148
  end
  inherited mmPadrao: TMainMenu
    Left = 304
    Top = 100
    inherited miRelatorios: TMenuItem
      inherited mImprimir: TMenuItem
        Caption = 'Listagem de perdas'
      end
      object N5: TMenuItem [1]
        Caption = '-'
      end
    end
  end
  object sqldPadrao: TSQLDataSet
    CommandText = 
      'select '#13#10'  p.CODIGO, '#13#10'  p.CODPRODUTO,'#13#10'  pro.DESCRICAO,'#13#10'  p.QT' +
      'DE, '#13#10'  p.PRECO, '#13#10'  p.DATA, '#13#10'  p.MOTIVO,'#13#10'  p.OBS '#13#10'from PERDA' +
      ' p'#13#10'left join PRODUTOS pro on (p.CODPRODUTO = pro.IDPRODUTO)'#13#10'or' +
      'der by p.DATA'
    MaxBlobSize = -1
    Params = <>
    Left = 272
    Top = 148
    object sqldPadraoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqldPadraoCODPRODUTO: TIntegerField
      FieldName = 'CODPRODUTO'
    end
    object sqldPadraoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = []
      Size = 80
    end
    object sqldPadraoQTDE: TIntegerField
      FieldName = 'QTDE'
    end
    object sqldPadraoPRECO: TFMTBCDField
      FieldName = 'PRECO'
      Precision = 15
    end
    object sqldPadraoDATA: TDateField
      FieldName = 'DATA'
    end
    object sqldPadraoMOTIVO: TStringField
      FieldName = 'MOTIVO'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dspPadrao: TDataSetProvider
    DataSet = sqldPadrao
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 304
    Top = 148
  end
  object cdsPadrao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    AfterInsert = cdsPadraoAfterInsert
    Left = 336
    Top = 148
    object cdsPadraoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPadraoCODPRODUTO: TIntegerField
      FieldName = 'CODPRODUTO'
      OnValidate = cdsPadraoCODPRODUTOValidate
    end
    object cdsPadraoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = []
      Size = 80
    end
    object cdsPadraoQTDE: TIntegerField
      FieldName = 'QTDE'
    end
    object cdsPadraoPRECO: TFMTBCDField
      FieldName = 'PRECO'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
    object cdsPadraoDATA: TDateField
      FieldName = 'DATA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoMOTIVO: TStringField
      FieldName = 'MOTIVO'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object sqldProduto: TSQLDataSet
    CommandText = 
      'select '#13#10'  IDPRODUTO,'#13#10'  CODBARRA,'#13#10'  DESCRICAO,'#13#10'  ABREVIACAO,'#13 +
      #10'  VENDA,'#13#10'  CUSTO'#13#10'from PRODUTOS'
    MaxBlobSize = -1
    Params = <>
    Left = 272
    Top = 180
    object sqldProdutoIDPRODUTO: TIntegerField
      FieldName = 'IDPRODUTO'
      Required = True
    end
    object sqldProdutoCODBARRA: TStringField
      FieldName = 'CODBARRA'
      Size = 13
    end
    object sqldProdutoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
    object sqldProdutoABREVIACAO: TStringField
      FieldName = 'ABREVIACAO'
      Size = 80
    end
    object sqldProdutoVENDA: TFMTBCDField
      FieldName = 'VENDA'
      Precision = 15
    end
    object sqldProdutoCUSTO: TFMTBCDField
      FieldName = 'CUSTO'
      Precision = 15
    end
  end
  object dspProduto: TDataSetProvider
    DataSet = sqldProduto
    Left = 304
    Top = 180
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProduto'
    Left = 336
    Top = 180
    object cdsProdutoIDPRODUTO: TIntegerField
      FieldName = 'IDPRODUTO'
      Required = True
    end
    object cdsProdutoCODBARRA: TStringField
      FieldName = 'CODBARRA'
      Size = 13
    end
    object cdsProdutoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
    object cdsProdutoABREVIACAO: TStringField
      FieldName = 'ABREVIACAO'
      Size = 80
    end
    object cdsProdutoVENDA: TFMTBCDField
      FieldName = 'VENDA'
      Precision = 15
    end
    object cdsProdutoCUSTO: TFMTBCDField
      FieldName = 'CUSTO'
      Precision = 15
    end
  end
end
