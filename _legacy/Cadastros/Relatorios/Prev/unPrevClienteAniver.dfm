inherited frmPrevClientesAniver: TfrmPrevClientesAniver
  Left = 310
  Width = 812
  Caption = 'frmPrevClientesAniver'
  ClientWidth = 812
  inherited rrPadrao: TRLReport
    inherited rbTitulo: TRLBand
      inherited lbTitulo: TRLLabel
        Height = 26
        Top = 81
      end
      inherited rlmCabecalho: TRLMemo
        Height = 80
      end
      inherited imgLogo: TRLImage
        Height = 80
      end
    end
    inherited rbRodape: TRLBand
      Top = 120
    end
    object rlbColunas: TRLBand[2]
      Left = 38
      Height = 16
      Top = 86
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
      object lbNome: TRLLabel
        Left = 5
        Height = 16
        Top = 0
        Width = 39
        Caption = 'Nome'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object lbDataNasc: TRLLabel
        Left = 200
        Height = 16
        Top = 0
        Width = 73
        Caption = 'Data Nasc.'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object lbEndereco: TRLLabel
        Left = 304
        Height = 16
        Top = 0
        Width = 64
        Caption = 'Endereço'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object lbCidade: TRLLabel
        Left = 488
        Height = 16
        Top = 0
        Width = 47
        Caption = 'Cidade'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object lbFone: TRLLabel
        Left = 624
        Height = 16
        Top = 0
        Width = 34
        Caption = 'Fone'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
    end
    object rlbDetalhe: TRLBand[3]
      Left = 38
      Height = 18
      Top = 102
      Width = 718
      BeforePrint = rlbDetalheBeforePrint
      object rldbNome: TRLDBText
        Left = 5
        Height = 16
        Top = 1
        Width = 192
        AutoSize = False
        DataField = 'NOME'
        DataSource = dsPadrao
      end
      object rldbDataNasc: TRLDBText
        Left = 200
        Height = 15
        Top = 1
        Width = 72
        DataField = 'DATANASC'
        DataSource = dsPadrao
      end
      object rldbEndereco: TRLDBText
        Left = 304
        Height = 16
        Top = 1
        Width = 183
        AutoSize = False
        DataField = 'ENDERECO'
        DataSource = dsPadrao
      end
      object rldbCidade: TRLDBText
        Left = 488
        Height = 16
        Top = 1
        Width = 134
        AutoSize = False
        DataField = 'CIDADE'
        DataSource = dsPadrao
      end
      object rldbFone: TRLDBText
        Left = 624
        Height = 16
        Top = 1
        Width = 89
        AutoSize = False
        DataField = 'FONE'
        DataSource = dsPadrao
      end
    end
  end
  inherited dsPadrao: TDataSource
    Left = 264
    Top = 184
  end
end
