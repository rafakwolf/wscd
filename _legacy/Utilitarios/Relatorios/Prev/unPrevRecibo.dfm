object frmPrevRecibo: TfrmPrevRecibo
  Left = 281
  Height = 495
  Top = 160
  Width = 912
  Caption = 'frmPrevRecibo'
  ClientHeight = 495
  ClientWidth = 912
  Font.Name = 'MS Sans Serif'
  LCLVersion = '2.0.12.0'
  object rrRecibo: TRLReport
    Left = 0
    Height = 1123
    Top = 0
    Width = 794
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    PreviewOptions.ShowModal = True
    object rbDetalhe: TRLBand
      Left = 38
      Height = 323
      Top = 38
      Width = 718
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      CarbonCopies = 2
      object lbEmpresa: TRLLabel
        Left = 32
        Height = 22
        Top = 16
        Width = 450
        Alignment = taCenter
        AutoSize = False
        Font.Color = clNavy
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbCidadeEstado: TRLLabel
        Left = 32
        Height = 16
        Top = 39
        Width = 450
        Alignment = taCenter
        AutoSize = False
      end
      object lbCNPJ_IE: TRLLabel
        Left = 32
        Height = 16
        Top = 57
        Width = 450
        Alignment = taCenter
        AutoSize = False
      end
      object lbEnderecoFone: TRLLabel
        Left = 32
        Height = 16
        Top = 75
        Width = 450
        Alignment = taCenter
        AutoSize = False
      end
      object lbRecebedor: TRLLabel
        Left = 46
        Height = 16
        Top = 121
        Width = 66
        Caption = 'Recebedor'
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        ParentFont = False
      end
      object lbImportancia: TRLLabel
        Left = 12
        Height = 16
        Top = 161
        Width = 100
        Caption = 'a Importância de'
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        ParentFont = False
      end
      object lbRefenrete: TRLLabel
        Left = 42
        Height = 16
        Top = 201
        Width = 70
        Caption = 'Referente a'
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        ParentFont = False
      end
      object lbCidade: TRLLabel
        Left = 28
        Height = 15
        Top = 257
        Width = 54
      end
      object lbData: TRLLabel
        Left = 28
        Height = 15
        Top = 281
        Width = 41
      end
      object lbAssinatura: TRLLabel
        Left = 416
        Height = 16
        Top = 290
        Width = 282
        Alignment = taCenter
        AutoSize = False
        Layout = tlCenter
      end
      object lbRecibo: TRLLabel
        Left = 636
        Height = 22
        Top = 8
        Width = 69
        Caption = 'Recibo'
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object spLinhaAssinatura: TRLDraw
        Left = 416
        Height = 9
        Top = 280
        Width = 281
        DrawKind = dkLine
      end
      object pnValor: TRLPanel
        Left = 568
        Height = 32
        Top = 40
        Width = 137
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = True
        Borders.DrawRight = True
        Borders.DrawBottom = True
        object lbValor: TRLLabel
          Left = 1
          Height = 30
          Top = 1
          Width = 135
          Align = faClient
          Alignment = taCenter
          AutoSize = False
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
        Height = 35
        Top = 112
        Width = 545
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = True
        Borders.DrawRight = True
        Borders.DrawBottom = True
        object lbdRecebedor: TRLMemo
          Left = 1
          Height = 33
          Top = 1
          Width = 543
          Align = faClient
          Behavior = [beSiteExpander]
        end
      end
      object pnImportancia: TRLPanel
        Left = 120
        Height = 35
        Top = 152
        Width = 545
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = True
        Borders.DrawRight = True
        Borders.DrawBottom = True
        object lbdImportancia: TRLMemo
          Left = 1
          Height = 33
          Top = 1
          Width = 543
          Align = faClient
          Behavior = [beSiteExpander]
        end
      end
      object pnReferente: TRLPanel
        Left = 120
        Height = 35
        Top = 192
        Width = 545
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = True
        Borders.DrawRight = True
        Borders.DrawBottom = True
        object lbdReferente: TRLMemo
          Left = 1
          Height = 33
          Top = 1
          Width = 543
          Align = faClient
          Behavior = [beSiteExpander]
        end
      end
    end
  end
end
