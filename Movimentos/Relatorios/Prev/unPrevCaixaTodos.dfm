inherited frmPrevCaixaTodos: TfrmPrevCaixaTodos
  Left = 342
  Height = 714
  Top = 150
  Width = 858
  Caption = 'frmPrevCaixaTodos'
  ClientHeight = 714
  ClientWidth = 858
  inherited rrPadrao: TRLReport
    inherited rbTitulo: TRLBand
      inherited lbTitulo: TRLLabel
        Left = 91
        Height = 30
        Top = 58
      end
    end
    inherited rbRodape: TRLBand
      Top = 157
    end
    object rlbSumario: TRLBand[2]
      Left = 38
      Height = 16
      Top = 141
      Width = 718
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object lbDebitos: TRLLabel
        Left = 6
        Height = 16
        Top = 0
        Width = 64
        Font.CharSet = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbCreditos: TRLLabel
        Left = 304
        Height = 16
        Top = 0
        Width = 69
        Font.CharSet = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbSaldo: TRLLabel
        Left = 663
        Height = 16
        Top = 0
        Width = 50
        Alignment = taRightJustify
        Font.CharSet = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object rlgrpCaixa: TRLGroup[3]
      Left = 38
      Height = 55
      Top = 86
      Width = 718
      DataFields = 'CAIXA'
      BeforePrint = rlgrpCaixaBeforePrint
      object rlbColunas: TRLBand
        Left = 0
        Height = 16
        Top = 0
        Width = 718
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
          Height = 16
          Top = 0
          Width = 35
          Caption = 'Data'
          Font.CharSet = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object lbDescricao: TRLLabel
          Left = 232
          Height = 16
          Top = 0
          Width = 67
          Caption = 'Descrição'
          Font.CharSet = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object lbDoc: TRLLabel
          Left = 512
          Height = 16
          Top = 0
          Width = 77
          Alignment = taRightJustify
          Caption = 'Documento'
          Font.CharSet = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object lbTipoConta: TRLLabel
          Left = 592
          Height = 16
          Top = 0
          Width = 42
          Caption = 'Conta'
          Font.CharSet = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object lbValor: TRLLabel
          Left = 678
          Height = 16
          Top = -1
          Width = 38
          Alignment = taRightJustify
          Caption = 'Valor'
          Font.CharSet = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLLabel1: TRLLabel
          Left = 8
          Height = 16
          Top = 0
          Width = 79
          Caption = 'Conta caixa'
          Font.CharSet = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
      end
      object rlbDetalhe: TRLBand
        Left = 0
        Height = 16
        Top = 16
        Width = 718
        BeforePrint = rlbDetalheBeforePrint
        object rldbLanc: TRLDBText
          Left = 142
          Height = 16
          Top = 0
          Width = 88
          AutoSize = False
          DataField = 'DATA'
          DataSource = dsPadrao
        end
        object rldbDescricao: TRLDBText
          Left = 232
          Height = 16
          Top = 0
          Width = 273
          AutoSize = False
          DataField = 'DESCRICAO'
          DataSource = dsPadrao
        end
        object rldbDoc: TRLDBText
          Left = 500
          Height = 15
          Top = 0
          Width = 89
          Alignment = taRightJustify
          DataField = 'DOCUMENTO'
          DataSource = dsPadrao
        end
        object rldbConta: TRLDBText
          Left = 592
          Height = 15
          Top = 0
          Width = 34
          DataField = 'TIPO'
          DataSource = dsPadrao
          BeforePrint = rldbContaBeforePrint
        end
        object rldbValor: TRLDBText
          Left = 669
          Height = 15
          Top = 0
          Width = 47
          Alignment = taRightJustify
          DataField = 'VALOR'
          DataSource = dsPadrao
        end
        object rldbCaixa: TRLDBText
          Left = 8
          Height = 16
          Top = 0
          Width = 132
          AutoSize = False
          DataField = 'CAIXA'
          DataSource = dsPadrao
          BeforePrint = rldbCaixaBeforePrint
        end
      end
      object rlbndSomaPorCaixa: TRLBand
        Left = 0
        Height = 22
        Top = 32
        Width = 718
        BandType = btFooter
        object rllbSomaC: TRLLabel
          Left = 649
          Height = 16
          Top = 3
          Width = 67
          Alignment = taRightJustify
          Font.CharSet = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rllbSomaD: TRLLabel
          Left = 304
          Height = 16
          Top = 3
          Width = 68
          Alignment = taRightJustify
          Font.CharSet = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
  end
  inherited dsPadrao: TDataSource
    Left = 296
    Top = 240
  end
  inherited rlepCalculos: TRLExpressionParser
    Left = 400
    Top = 16
  end
  inherited sqldPadrao: TZQuery
    Left = 136
    Top = 232
  end
end
