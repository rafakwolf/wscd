object frmPrevRecibo: TfrmPrevRecibo
  Left = 281
  Top = 160
  Caption = 'frmPrevRecibo'
  ClientHeight = 444
  ClientWidth = 808
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object rrRecibo: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    PreviewOptions.ShowModal = True
    object rbDetalhe: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 323
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      CarbonCopies = 2
      object lbEmpresa: TRLLabel
        Left = 32
        Top = 16
        Width = 450
        Height = 22
        Alignment = taCenter
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbCidadeEstado: TRLLabel
        Left = 32
        Top = 39
        Width = 449
        Height = 16
        Alignment = taCenter
        AutoSize = False
      end
      object lbCNPJ_IE: TRLLabel
        Left = 32
        Top = 57
        Width = 449
        Height = 16
        Alignment = taCenter
        AutoSize = False
      end
      object lbEnderecoFone: TRLLabel
        Left = 32
        Top = 75
        Width = 449
        Height = 16
        Alignment = taCenter
        AutoSize = False
      end
      object lbRecebedor: TRLLabel
        Left = 46
        Top = 121
        Width = 66
        Height = 16
        Caption = 'Recebedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lbImportancia: TRLLabel
        Left = 12
        Top = 161
        Width = 100
        Height = 16
        Caption = 'a Import'#226'ncia de'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lbRefenrete: TRLLabel
        Left = 42
        Top = 201
        Width = 70
        Height = 16
        Caption = 'Referente a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lbCidade: TRLLabel
        Left = 28
        Top = 257
        Width = 54
        Height = 16
      end
      object lbData: TRLLabel
        Left = 28
        Top = 281
        Width = 41
        Height = 16
      end
      object lbAssinatura: TRLLabel
        Left = 416
        Top = 290
        Width = 281
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Layout = tlCenter
      end
      object lbRecibo: TRLLabel
        Left = 636
        Top = 8
        Width = 69
        Height = 22
        Caption = 'Recibo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object spLinhaAssinatura: TRLDraw
        Left = 416
        Top = 280
        Width = 281
        Height = 9
        DrawKind = dkLine
      end
      object pnValor: TRLPanel
        Left = 568
        Top = 40
        Width = 137
        Height = 32
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = True
        Borders.DrawRight = True
        Borders.DrawBottom = True
        object lbValor: TRLLabel
          Left = 1
          Top = 1
          Width = 135
          Height = 30
          Align = faClient
          Alignment = taCenter
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Layout = tlCenter
          ParentFont = False
        end
      end
      object pnRecebedor: TRLPanel
        Left = 120
        Top = 112
        Width = 545
        Height = 35
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = True
        Borders.DrawRight = True
        Borders.DrawBottom = True
        object lbdRecebedor: TRLMemo
          Left = 1
          Top = 1
          Width = 543
          Height = 33
          Align = faClient
          Behavior = [beSiteExpander]
        end
      end
      object pnImportancia: TRLPanel
        Left = 120
        Top = 152
        Width = 545
        Height = 35
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = True
        Borders.DrawRight = True
        Borders.DrawBottom = True
        object lbdImportancia: TRLMemo
          Left = 1
          Top = 1
          Width = 543
          Height = 33
          Align = faClient
          Behavior = [beSiteExpander]
        end
      end
      object pnReferente: TRLPanel
        Left = 120
        Top = 192
        Width = 545
        Height = 35
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = True
        Borders.DrawRight = True
        Borders.DrawBottom = True
        object lbdReferente: TRLMemo
          Left = 1
          Top = 1
          Width = 543
          Height = 33
          Align = faClient
          Behavior = [beSiteExpander]
        end
      end
    end
  end
end
