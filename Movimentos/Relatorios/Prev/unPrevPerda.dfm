inherited frmPrevPerda: TfrmPrevPerda
  Caption = 'frmPrevPerda'
  ClientHeight = 491
  ClientWidth = 804
  OldCreateOrder = True
  ExplicitWidth = 820
  ExplicitHeight = 529
  PixelsPerInch = 96
  TextHeight = 13
  inherited rrPadrao: TRLReport
    inherited rbTitulo: TRLBand
      inherited lbTitulo: TRLLabel
        Top = 76
        Height = 31
        ExplicitTop = 76
        ExplicitHeight = 31
      end
      inherited rlmCabecalho: TRLMemo
        Height = 75
        ExplicitHeight = 75
      end
      inherited imgLogo: TRLImage
        Height = 75
        ExplicitHeight = 75
      end
    end
    inherited rbRodape: TRLBand
      Top = 200
      ExplicitTop = 200
    end
    object rlbndTituloColuna: TRLBand
      Left = 38
      Top = 139
      Width = 718
      Height = 19
      BandType = btColumnHeader
      Color = clBtnFace
      ParentColor = False
      Transparent = False
      object rlbProduto: TRLLabel
        Left = 8
        Top = 1
        Width = 56
        Height = 16
        Caption = 'Produto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object rlbQtde: TRLLabel
        Left = 392
        Top = 1
        Width = 35
        Height = 16
        Caption = 'Qtde'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object rlbPreco: TRLLabel
        Left = 472
        Top = 1
        Width = 41
        Height = 16
        Caption = 'Pre'#231'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object rlbData: TRLLabel
        Left = 520
        Top = 1
        Width = 97
        Height = 16
        Caption = 'Data da perda'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object rlbMotivo: TRLLabel
        Left = 624
        Top = 1
        Width = 48
        Height = 16
        Caption = 'Motivo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
    end
    object rlbndDetalheColuna: TRLBand
      Left = 38
      Top = 158
      Width = 718
      Height = 18
      BeforePrint = rlbndDetalheColunaBeforePrint
      object rldbtProduto: TRLDBText
        Left = 8
        Top = 1
        Width = 377
        Height = 16
        AutoSize = False
        DataField = 'DESCRICAO'
        DataSource = dsPadrao
        Text = ''
      end
      object rldbtQtde: TRLDBText
        Left = 391
        Top = 1
        Width = 36
        Height = 16
        Alignment = taRightJustify
        DataField = 'QTDE'
        DataSource = dsPadrao
        Text = ''
      end
      object rldbtPreco: TRLDBText
        Left = 470
        Top = 1
        Width = 43
        Height = 16
        Alignment = taRightJustify
        DataField = 'PRECO'
        DataSource = dsPadrao
        Text = ''
      end
      object rldbtData: TRLDBText
        Left = 520
        Top = 1
        Width = 36
        Height = 16
        DataField = 'DATA'
        DataSource = dsPadrao
        Text = ''
      end
      object rldbtMotivo: TRLDBText
        Left = 624
        Top = 1
        Width = 52
        Height = 16
        DataField = 'MOTIVO'
        DataSource = dsPadrao
        Text = ''
      end
    end
    object rlbndSumario: TRLBand
      Left = 38
      Top = 176
      Width = 718
      Height = 24
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object rllbTotal: TRLLabel
        Left = 455
        Top = 3
        Width = 58
        Height = 16
        Alignment = taRightJustify
        Caption = '<Total>'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  inherited sqldPadrao: TSQLDataSet
    CommandText = 
      'select '#13#10'  p.CODIGO, '#13#10'  p.CODPRODUTO,'#13#10'  pro.DESCRICAO,'#13#10'  p.QT' +
      'DE, '#13#10'  p.PRECO, '#13#10'  p.DATA, '#13#10'  p.MOTIVO,'#13#10'  p.OBS '#13#10'from PERDA' +
      ' p'#13#10'left join PRODUTOS pro on (p.CODPRODUTO = pro.IDPRODUTO)'#13#10'or' +
      'der by p.DATA'
    object sqldPadraoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sqldPadraoCODPRODUTO: TIntegerField
      FieldName = 'CODPRODUTO'
    end
    object sqldPadraoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
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
  inherited cdsPadrao: TMemDataset
    object cdsPadraoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsPadraoCODPRODUTO: TIntegerField
      FieldName = 'CODPRODUTO'
    end
    object cdsPadraoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
    object cdsPadraoQTDE: TIntegerField
      FieldName = 'QTDE'
      DisplayFormat = '00000'
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
      OnGetText = cdsPadraoMOTIVOGetText
      FixedChar = True
      Size = 1
    end
    object cdsPadraoOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  inherited rlepCalculos: TRLExpressionParser
    Left = 148
  end
end
