inherited frmPrevListagemClientes: TfrmPrevListagemClientes
  Width = 813
  Caption = 'frmPrevListagemClientes'
  ClientWidth = 813
  inherited rrPadrao: TRLReport
    inherited rbTitulo: TRLBand
      inherited lbTitulo: TRLLabel
        Height = 32
        Top = 75
        Caption = 'Listagem de Clientes'
      end
      inherited rlmCabecalho: TRLMemo
        Height = 74
      end
      inherited imgLogo: TRLImage
        Height = 74
      end
    end
    inherited rbRodape: TRLBand
      Top = 122
    end
    object rbColuna: TRLBand[2]
      Left = 38
      Height = 19
      Top = 86
      Width = 718
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object lbCodigo: TRLLabel
        Left = 3
        Height = 16
        Top = 1
        Width = 47
        Caption = 'Código'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbNome: TRLLabel
        Left = 64
        Height = 16
        Top = 1
        Width = 39
        Caption = 'Nome'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbCPJ_CNPJ: TRLLabel
        Left = 352
        Height = 16
        Top = 1
        Width = 62
        Caption = 'CPJ-CNPJ'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbDataNasc: TRLLabel
        Left = 488
        Height = 16
        Top = 1
        Width = 101
        Caption = 'Dt. Nascimento'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbFone: TRLLabel
        Left = 608
        Height = 16
        Top = 1
        Width = 59
        Caption = 'Telefone'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object rbDetalhe: TRLBand[3]
      Left = 38
      Height = 17
      Top = 105
      Width = 718
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = False
      BeforePrint = rbDetalheBeforePrint
      object dbCodigo: TRLDBText
        Left = 3
        Height = 15
        Top = 0
        Width = 56
        DataField = 'CODIGO'
        DataSource = dsPadrao
      end
      object dbNome: TRLDBText
        Left = 64
        Height = 16
        Top = 0
        Width = 285
        AutoSize = False
        DataField = 'NOME'
        DataSource = dsPadrao
      end
      object dbCPJ_CNPJ: TRLDBText
        Left = 352
        Height = 15
        Top = 0
        Width = 71
        DataField = 'CPF_CNPJ'
        DataSource = dsPadrao
      end
      object dbDataNasc: TRLDBText
        Left = 488
        Height = 15
        Top = 0
        Width = 123
        DataField = 'DATANASCIMENTO'
        DataSource = dsPadrao
      end
      object dbFone: TRLDBText
        Left = 608
        Height = 15
        Top = 0
        Width = 72
        DataField = 'TELEFONE'
        DataSource = dsPadrao
      end
    end
  end
end
