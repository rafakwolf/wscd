object frmPrevPromissoria: TfrmPrevPromissoria
  Left = 2
  Top = 1
  Caption = 'frmPrevPromissoria'
  ClientHeight = 530
  ClientWidth = 813
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object rptPromissoria: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    PreviewOptions.ShowModal = True
    object rlbndProm: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 379
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      object albAvalista: TRLAngleLabel
        Left = 8
        Top = 303
        Width = 14
        Height = 68
        Angle = 90.000000000000000000
        Caption = 'Avalista(s)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object albCPF_CNPJ_1: TRLAngleLabel
        Left = 62
        Top = 320
        Width = 13
        Height = 51
        Angle = 90.000000000000000000
        Caption = 'CPF/CNPJ'
      end
      object albCPF_CNPJ_2: TRLAngleLabel
        Left = 35
        Top = 320
        Width = 13
        Height = 51
        Angle = 90.000000000000000000
        Caption = 'CPF/CNPJ'
      end
      object rldwLinha_aval_1: TRLDraw
        Left = 34
        Top = 9
        Width = 1
        Height = 363
        Angle = 90.000000000000000000
        DrawKind = dkLine
      end
      object rldwLinha_aval_2: TRLDraw
        Left = 61
        Top = 9
        Width = 1
        Height = 363
        Angle = 90.000000000000000000
        DrawKind = dkLine
      end
      object rldwNro: TRLDraw
        Left = 120
        Top = 13
        Width = 81
        Height = 25
      end
      object rldwEmissao: TRLDraw
        Left = 265
        Top = 13
        Width = 100
        Height = 25
      end
      object rldwVenc: TRLDraw
        Left = 442
        Top = 13
        Width = 100
        Height = 25
      end
      object rldwValor: TRLDraw
        Left = 597
        Top = 13
        Width = 108
        Height = 25
      end
      object lbNro: TRLLabel
        Left = 97
        Top = 22
        Width = 20
        Height = 13
        Caption = 'Nro'
      end
      object lbEmissao: TRLLabel
        Left = 221
        Top = 22
        Width = 41
        Height = 13
        Caption = 'Emiss'#227'o'
      end
      object lbvenc: TRLLabel
        Left = 381
        Top = 22
        Width = 58
        Height = 13
        Caption = 'Vencimento'
      end
      object lbValor: TRLLabel
        Left = 567
        Top = 22
        Width = 27
        Height = 13
        Caption = 'Valor'
      end
      object lbDescricaoData: TRLLabel
        Left = 95
        Top = 64
        Width = 90
        Height = 13
        Caption = 'Descri'#231#227'o da Data'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsUnderline]
        ParentFont = False
      end
      object lbCredor: TRLLabel
        Left = 95
        Top = 96
        Width = 378
        Height = 13
        AutoSize = False
        Caption = 'Credor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object lbCPF_Credor: TRLLabel
        Left = 480
        Top = 96
        Width = 225
        Height = 13
        AutoSize = False
        Caption = 'CPF_Credor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object rlmValorExt: TRLMemo
        Left = 96
        Top = 136
        Width = 609
        Height = 49
        AutoSize = False
        Behavior = [beSiteExpander]
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = True
        Borders.DrawRight = True
        Borders.DrawBottom = True
      end
      object lbQuantiaDe: TRLLabel
        Left = 97
        Top = 120
        Width = 140
        Height = 13
        Caption = 'ou '#224' sua ordem a quantia de'
      end
      object lbMoedaPais: TRLLabel
        Left = 551
        Top = 189
        Width = 152
        Height = 13
        Caption = 'em moeda corrente deste pa'#237's.'
      end
      object lbPracaPag: TRLLabel
        Left = 96
        Top = 237
        Width = 120
        Height = 13
        Caption = 'Pra'#231'a de pagamento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rldwLinha_pca_pag: TRLDraw
        Left = 96
        Top = 236
        Width = 450
        Height = 2
        DrawKind = dkLine
      end
      object lbPcaPag: TRLLabel
        Left = 96
        Top = 221
        Width = 136
        Height = 13
        Caption = 'Descricao Praca pagamento'
      end
      object lbEmitente: TRLLabel
        Left = 96
        Top = 277
        Width = 54
        Height = 13
        Caption = 'Emitente'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rldwLinha_emit: TRLDraw
        Left = 96
        Top = 277
        Width = 450
        Height = 1
        DrawKind = dkLine
      end
      object lbDescEmitente: TRLLabel
        Left = 96
        Top = 262
        Width = 449
        Height = 13
        AutoSize = False
        Caption = 'Desc Emitente'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbCPF_Emitente: TRLLabel
        Left = 96
        Top = 317
        Width = 56
        Height = 13
        Caption = 'CPF/CNPJ'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rldwLinha_cpf_emit: TRLDraw
        Left = 96
        Top = 317
        Width = 450
        Height = 1
        DrawKind = dkLine
      end
      object lbDesc_cpf_emit: TRLLabel
        Left = 96
        Top = 301
        Width = 73
        Height = 13
        Caption = 'Desc_cpf_emit'
      end
      object lbEndereco_emit: TRLLabel
        Left = 96
        Top = 352
        Width = 55
        Height = 13
        Caption = 'Endere'#231'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rldwLinha_endereco_emit: TRLDraw
        Left = 96
        Top = 352
        Width = 450
        Height = 1
        DrawKind = dkLine
      end
      object lbDesc_endereco_emit: TRLLabel
        Left = 96
        Top = 336
        Width = 103
        Height = 13
        Caption = 'Desc_endereco_emit'
      end
      object lbNumero: TRLLabel
        Left = 125
        Top = 19
        Width = 48
        Height = 13
      end
      object lbdataEmissao: TRLLabel
        Left = 270
        Top = 19
        Width = 71
        Height = 13
      end
      object lbVencimento: TRLLabel
        Left = 447
        Top = 19
        Width = 80
        Height = 13
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbDescValor: TRLLabel
        Left = 602
        Top = 19
        Width = 58
        Height = 13
      end
      object rldwAss_1: TRLDraw
        Left = 552
        Top = 272
        Width = 153
        Height = 9
        DrawKind = dkLine
        Pen.Style = psDot
      end
      object rldwAss_2: TRLDraw
        Left = 552
        Top = 312
        Width = 153
        Height = 9
        DrawKind = dkLine
        Pen.Style = psDot
      end
      object rldwCaixaLateral: TRLDraw
        Left = 83
        Top = 2
        Width = 9
        Height = 375
        Angle = 90.000000000000000000
        DrawKind = dkLine
        Pen.Style = psDot
      end
    end
  end
end
