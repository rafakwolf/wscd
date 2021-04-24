inherited frmPrevContasPagar: TfrmPrevContasPagar
  Caption = 'frmPrevContasPagar'
  ClientHeight = 465
  ClientWidth = 805
  OldCreateOrder = True
  ExplicitWidth = 821
  ExplicitHeight = 503
  PixelsPerInch = 96
  TextHeight = 13
  inherited rrPadrao: TRLReport
    inherited rbRodape: TRLBand
      Top = 190
      ExplicitTop = 190
    end
    object rlbTitulo: TRLBand
      Left = 38
      Top = 139
      Width = 718
      Height = 16
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object lbData: TRLLabel
        Left = 8
        Top = 0
        Width = 35
        Height = 16
        Caption = 'Data'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbvenc: TRLLabel
        Left = 112
        Top = 0
        Width = 80
        Height = 16
        Caption = 'Vencimento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbFornecedor: TRLLabel
        Left = 232
        Top = 0
        Width = 77
        Height = 16
        Caption = 'Fornecedor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbDocumento: TRLLabel
        Left = 528
        Top = 0
        Width = 77
        Height = 16
        Caption = 'Documento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbvalor: TRLLabel
        Left = 664
        Top = 0
        Width = 38
        Height = 16
        Caption = 'Valor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object rlbDetalhe: TRLBand
      Left = 38
      Top = 155
      Width = 718
      Height = 16
      BeforePrint = rlbDetalheBeforePrint
      object rldbData: TRLDBText
        Left = 8
        Top = 0
        Width = 36
        Height = 16
        DataField = 'DATA'
        DataSource = dsPadrao
        Text = ''
      end
      object rldbvenc: TRLDBText
        Left = 112
        Top = 0
        Width = 81
        Height = 16
        DataField = 'VENCIMENTO'
        DataSource = dsPadrao
        Text = ''
      end
      object rldbForn: TRLDBText
        Left = 232
        Top = 0
        Width = 83
        Height = 16
        DataField = 'FORNECEDOR'
        DataSource = dsPadrao
        Text = ''
      end
      object rldbDoc: TRLDBText
        Left = 526
        Top = 0
        Width = 79
        Height = 16
        Alignment = taRightJustify
        DataField = 'DOCUMENTO'
        DataSource = dsPadrao
        Text = ''
      end
      object rldbValor: TRLDBText
        Left = 659
        Top = 0
        Width = 43
        Height = 16
        Alignment = taRightJustify
        DataField = 'VALOR'
        DataSource = dsPadrao
        Text = ''
      end
    end
    object rlbSumario: TRLBand
      Left = 38
      Top = 171
      Width = 718
      Height = 19
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object rllbTotal: TRLLabel
        Left = 644
        Top = 2
        Width = 58
        Height = 16
        Alignment = taRightJustify
        Caption = '<Total>'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  inherited sqldPadrao: TSQLQuery
    CommandText = 
      'select * from VIEWRELCP'#13#10'where CODFORN = :PFORNECEDOR'#13#10'order by ' +
      'DATA'
    Params = <
      item
        DataType = ftInteger
        Name = 'PFORNECEDOR'
        ParamType = ptInput
      end>
    object sqldPadraoCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object sqldPadraoDATA: TDateField
      FieldName = 'DATA'
    end
    object sqldPadraoVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
    end
    object sqldPadraoCODFORN: TIntegerField
      FieldName = 'CODFORN'
    end
    object sqldPadraoFORNECEDOR: TStringField
      FieldName = 'FORNECEDOR'
      Size = 80
    end
    object sqldPadraoDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
    end
    object sqldPadraoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 15
    end
  end
  inherited cdsPadrao: TMemDataset
    Params = <
      item
        DataType = ftInteger
        Name = 'PFORNECEDOR'
        ParamType = ptInput
      end>
    object cdsPadraoCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsPadraoDATA: TDateField
      FieldName = 'DATA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoCODFORN: TIntegerField
      FieldName = 'CODFORN'
    end
    object cdsPadraoFORNECEDOR: TStringField
      FieldName = 'FORNECEDOR'
      Size = 80
    end
    object cdsPadraoDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
    end
    object cdsPadraoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
  end
  inherited rlepCalculos: TRLExpressionParser
    Left = 148
  end
end
