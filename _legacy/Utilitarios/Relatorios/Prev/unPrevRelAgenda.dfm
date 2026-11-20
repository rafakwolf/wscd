inherited frmPrevRelAgenda: TfrmPrevRelAgenda
  Left = 403
  Top = 116
  Width = 811
  Caption = 'frmPrevRelAgenda'
  ClientWidth = 811
  inherited rrPadrao: TRLReport
    inherited rbTitulo: TRLBand
      inherited lbTitulo: TRLLabel
        Height = 28
        Top = 79
        Caption = 'Listagem de Telefones'
      end
      inherited rlmCabecalho: TRLMemo
        Height = 78
      end
      inherited imgLogo: TRLImage
        Height = 78
      end
    end
    inherited rbRodape: TRLBand
      Top = 150
    end
    object rbDetalhe: TRLBand[2]
      Left = 38
      Height = 64
      Top = 86
      Width = 718
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      BeforePrint = rbDetalheBeforePrint
      object lbNome: TRLLabel
        Left = 3
        Height = 15
        Top = 2
        Width = 38
        Caption = 'Nome'
      end
      object lbFone: TRLLabel
        Left = 3
        Height = 15
        Top = 22
        Width = 33
        Caption = 'Fone'
      end
      object lbFax: TRLLabel
        Left = 3
        Height = 15
        Top = 43
        Width = 25
        Caption = 'Fax'
      end
      object dbNome: TRLDBText
        Left = 55
        Height = 15
        Top = 4
        Width = 43
        DataField = 'NOME'
        DataSource = dsPadrao
      end
      object dbFone: TRLDBText
        Left = 55
        Height = 15
        Top = 24
        Width = 72
        DataField = 'TELEFONE'
        DataSource = dsPadrao
      end
      object dbFax: TRLDBText
        Left = 55
        Height = 15
        Top = 45
        Width = 28
        DataField = 'FAX'
        DataSource = dsPadrao
      end
    end
  end
  inherited dsPadrao: TDataSource
    Left = 256
    Top = 216
  end
  inherited rlepCalculos: TRLExpressionParser
    Left = 176
    Top = 248
  end
  inherited sqldPadrao: TZQuery
    Left = 88
    Top = 224
  end
end
