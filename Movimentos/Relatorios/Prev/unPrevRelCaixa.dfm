inherited frmPrevRelCaixa: TfrmPrevRelCaixa
  Caption = 'frmPrevRelCaixa'
  ClientHeight = 483
  ClientWidth = 810
  OldCreateOrder = True
  ExplicitWidth = 826
  ExplicitHeight = 521
  PixelsPerInch = 96
  TextHeight = 13
  inherited rrPadrao: TRLReport
    inherited rbTitulo: TRLBand
      inherited lbTitulo: TRLLabel
        Height = 30
        Caption = 'Caixa por Tipo de Conta'
        ExplicitHeight = 30
      end
      inherited rlmCabecalho: TRLMemo
        Height = 76
        ExplicitHeight = 76
      end
      inherited imgLogo: TRLImage
        Height = 76
        ExplicitHeight = 76
      end
    end
    inherited rbRodape: TRLBand
      Top = 198
      ExplicitTop = 198
    end
    object rbColunas: TRLBand
      Left = 38
      Top = 139
      Width = 718
      Height = 17
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object lbData: TRLLabel
        Left = 16
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
      object lbDescricao: TRLLabel
        Left = 102
        Top = 0
        Width = 67
        Height = 16
        Caption = 'Descri'#231#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbDocumento: TRLLabel
        Left = 412
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
      object lbTipo: TRLLabel
        Left = 562
        Top = 0
        Width = 42
        Height = 16
        Caption = 'Conta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbValor: TRLLabel
        Left = 675
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
    object rbDetalhe: TRLBand
      Left = 38
      Top = 156
      Width = 718
      Height = 19
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      BeforePrint = rbDetalheBeforePrint
      object dbData: TRLDBText
        Left = 16
        Top = 1
        Width = 36
        Height = 16
        DataField = 'DATA'
        DataSource = dsPadrao
        Text = ''
      end
      object dbDescricao: TRLDBText
        Left = 102
        Top = 1
        Width = 307
        Height = 16
        AutoSize = False
        DataField = 'DESCRICAO'
        DataSource = dsPadrao
        Text = ''
      end
      object dbDocumento: TRLDBText
        Left = 412
        Top = 1
        Width = 79
        Height = 16
        Alignment = taRightJustify
        DataField = 'DOCUMENTO'
        DataSource = dsPadrao
        Text = ''
      end
      object dbTipo: TRLDBText
        Left = 562
        Top = 1
        Width = 32
        Height = 16
        DataField = 'TIPO'
        DataSource = dsPadrao
        Text = ''
        BeforePrint = dbTipoBeforePrint
      end
      object dbValor: TRLDBText
        Left = 670
        Top = 1
        Width = 43
        Height = 16
        Alignment = taRightJustify
        DataField = 'VALOR'
        DataSource = dsPadrao
        DisplayMask = '#,##0.00'
        Text = ''
      end
    end
    object rbSumario: TRLBand
      Left = 38
      Top = 175
      Width = 718
      Height = 23
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = False
      Borders.Width = 2
      object rllbTotalC: TRLLabel
        Left = 265
        Top = 5
        Width = 64
        Height = 16
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rllbTotalD: TRLLabel
        Left = 8
        Top = 5
        Width = 65
        Height = 16
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rlbSaldo: TRLLabel
        Left = 536
        Top = 5
        Width = 56
        Height = 16
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
      'select * from '#13#10'STPRELCAIXATIPOCONTA'#13#10'(:PDATAINI, :PDATAFIM, :PT' +
      'IPOCONTA, :PORDEM)'
    Params = <
      item
        DataType = ftDate
        Name = 'PDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PTIPOCONTA'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PORDEM'
        ParamType = ptInput
      end>
    object sqldPadraoCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object sqldPadraoTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 15
      Size = 2
    end
    object sqldPadraoDATA: TDateField
      FieldName = 'DATA'
    end
    object sqldPadraoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object sqldPadraoDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
    end
    object sqldPadraoTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 15
      Size = 2
    end
  end
  inherited cdsPadrao: TMemDataset
    Params = <
      item
        DataType = ftDate
        Name = 'PDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PTIPOCONTA'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PORDEM'
        ParamType = ptInput
      end>
    object cdsPadraoCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsPadraoTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 15
      Size = 2
    end
    object cdsPadraoDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsPadraoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object cdsPadraoDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
    end
    object cdsPadraoTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
      Precision = 15
      Size = 2
    end
  end
  inherited rlepCalculos: TRLExpressionParser
    Expression = 'sum(VALOR)'
    Left = 148
  end
end
