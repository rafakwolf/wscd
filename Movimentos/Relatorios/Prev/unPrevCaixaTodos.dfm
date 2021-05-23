inherited frmPrevCaixaTodos: TfrmPrevCaixaTodos
  Top = 1
  Caption = 'frmPrevCaixaTodos'
  ClientHeight = 530
  ClientWidth = 809
  OldCreateOrder = True
  ExplicitWidth = 825
  ExplicitHeight = 569
  PixelsPerInch = 96
  TextHeight = 13
  inherited rrPadrao: TRLReport
    inherited rbTitulo: TRLBand
      inherited lbTitulo: TRLLabel
        Left = 91
        Top = 58
        Height = 30
        ExplicitLeft = 91
        ExplicitTop = 58
        ExplicitHeight = 30
      end
    end
    inherited rbRodape: TRLBand
      Top = 210
      ExplicitTop = 210
    end
    object rlbSumario: TRLBand
      Left = 38
      Top = 194
      Width = 718
      Height = 16
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object lbDebitos: TRLLabel
        Left = 6
        Top = 0
        Width = 64
        Height = 16
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbCreditos: TRLLabel
        Left = 304
        Top = 0
        Width = 69
        Height = 16
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbSaldo: TRLLabel
        Left = 663
        Top = 0
        Width = 50
        Height = 16
        Alignment = taRightJustify
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object rlgrpCaixa: TRLGroup
      Left = 38
      Top = 139
      Width = 718
      Height = 55
      DataFields = 'CAIXA'
      BeforePrint = rlgrpCaixaBeforePrint
      object rlbColunas: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 16
        BandType = btColumnHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        Color = clBtnFace
        ParentColor = False
        Transparent = False
        object lbLanc: TRLLabel
          Left = 142
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
          Left = 232
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
        object lbDoc: TRLLabel
          Left = 512
          Top = 0
          Width = 77
          Height = 16
          Alignment = taRightJustify
          Caption = 'Documento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbTipoConta: TRLLabel
          Left = 592
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
          Left = 678
          Top = -1
          Width = 38
          Height = 16
          Alignment = taRightJustify
          Caption = 'Valor'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel1: TRLLabel
          Left = 8
          Top = 0
          Width = 79
          Height = 16
          Caption = 'Conta caixa'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object rlbDetalhe: TRLBand
        Left = 0
        Top = 16
        Width = 718
        Height = 16
        BeforePrint = rlbDetalheBeforePrint
        object rldbLanc: TRLDBText
          Left = 142
          Top = 0
          Width = 88
          Height = 16
          AutoSize = False
          DataField = 'DATA'
          DataSource = dsPadrao
          Text = ''
        end
        object rldbDescricao: TRLDBText
          Left = 232
          Top = 0
          Width = 273
          Height = 16
          AutoSize = False
          DataField = 'DESCRICAO'
          DataSource = dsPadrao
          Text = ''
        end
        object rldbDoc: TRLDBText
          Left = 510
          Top = 0
          Width = 79
          Height = 16
          Alignment = taRightJustify
          DataField = 'DOCUMENTO'
          DataSource = dsPadrao
          Text = ''
        end
        object rldbConta: TRLDBText
          Left = 592
          Top = 0
          Width = 32
          Height = 16
          DataField = 'TIPO'
          DataSource = dsPadrao
          Text = ''
          BeforePrint = rldbContaBeforePrint
        end
        object rldbValor: TRLDBText
          Left = 673
          Top = 0
          Width = 43
          Height = 16
          Alignment = taRightJustify
          DataField = 'VALOR'
          DataSource = dsPadrao
          Text = ''
        end
        object rldbCaixa: TRLDBText
          Left = 8
          Top = 0
          Width = 132
          Height = 16
          AutoSize = False
          DataField = 'CAIXA'
          DataSource = dsPadrao
          Text = ''
          BeforePrint = rldbCaixaBeforePrint
        end
      end
      object rlbndSomaPorCaixa: TRLBand
        Left = 0
        Top = 32
        Width = 718
        Height = 22
        BandType = btFooter
        object rllbSomaC: TRLLabel
          Left = 649
          Top = 3
          Width = 67
          Height = 16
          Alignment = taRightJustify
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rllbSomaD: TRLLabel
          Left = 304
          Top = 3
          Width = 68
          Height = 16
          Alignment = taRightJustify
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
  end
  inherited sqldPadrao: TSQLDataSet
    CommandText = 
      'select'#13#10'  CAIXA,'#13#10'  DATA, '#13#10'  DESCRICAO,'#13#10'  DOCUMENTO,'#13#10'  TIPO,'#13 +
      #10'  VALOR '#13#10'from VIEWRELCAIXATODOS'#13#10'order by CAIXA, DATA, TIPO, D' +
      'ESCRICAO'
    object sqldPadraoCAIXA: TStringField
      FieldName = 'CAIXA'
      Size = 80
    end
    object sqldPadraoDATA: TDateField
      FieldName = 'DATA'
    end
    object sqldPadraoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
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
    end
  end
  inherited cdsPadrao: TClientDataSet
    object cdsPadraoCAIXA: TStringField
      FieldName = 'CAIXA'
      Size = 80
    end
    object cdsPadraoDATA: TDateField
      FieldName = 'DATA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
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
      EditFormat = '#,##0.00'
      Precision = 15
    end
  end
end
