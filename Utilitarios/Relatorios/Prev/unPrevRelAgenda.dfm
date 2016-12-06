inherited frmPrevRelAgenda: TfrmPrevRelAgenda
  Caption = 'frmPrevRelAgenda'
  ClientHeight = 472
  ClientWidth = 826
  OldCreateOrder = True
  ExplicitWidth = 842
  ExplicitHeight = 510
  PixelsPerInch = 96
  TextHeight = 13
  inherited rrPadrao: TRLReport
    inherited rbTitulo: TRLBand
      inherited lbTitulo: TRLLabel
        Top = 79
        Height = 28
        Caption = 'Listagem de Telefones'
        ExplicitTop = 79
        ExplicitHeight = 28
      end
      inherited rlmCabecalho: TRLMemo
        Height = 78
        ExplicitHeight = 78
      end
      inherited imgLogo: TRLImage
        Height = 78
        ExplicitHeight = 78
      end
    end
    inherited rbRodape: TRLBand
      Top = 203
      ExplicitTop = 203
    end
    object rbDetalhe: TRLBand
      Left = 38
      Top = 139
      Width = 718
      Height = 64
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      BeforePrint = rbDetalheBeforePrint
      object lbNome: TRLLabel
        Left = 3
        Top = 2
        Width = 47
        Height = 18
        Caption = 'Nome'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbFone: TRLLabel
        Left = 3
        Top = 22
        Width = 40
        Height = 18
        Caption = 'Fone'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbFax: TRLLabel
        Left = 3
        Top = 43
        Width = 31
        Height = 18
        Caption = 'Fax'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbNome: TRLDBText
        Left = 55
        Top = 4
        Width = 38
        Height = 16
        DataField = 'NOME'
        DataSource = dsPadrao
        Text = ''
      end
      object dbFone: TRLDBText
        Left = 55
        Top = 24
        Width = 63
        Height = 16
        DataField = 'TELEFONE'
        DataSource = dsPadrao
        Text = ''
      end
      object dbFax: TRLDBText
        Left = 55
        Top = 45
        Width = 27
        Height = 16
        DataField = 'FAX'
        DataSource = dsPadrao
        Text = ''
      end
    end
  end
  inherited sqldPadrao: TSQLDataSet
    CommandText = 
      'select '#13#10'  va.NOME, '#13#10'  va.TELEFONE, '#13#10'  va.FAX '#13#10'from VIEWAGEND' +
      'A va'#13#10'order by va.NOME'
    object sqldPadraoNOME: TStringField
      FieldName = 'NOME'
      Size = 80
    end
    object sqldPadraoTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
    object sqldPadraoFAX: TStringField
      FieldName = 'FAX'
    end
  end
  inherited cdsPadrao: TClientDataSet
    object cdsPadraoNOME: TStringField
      FieldName = 'NOME'
      Size = 80
    end
    object cdsPadraoTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
    object cdsPadraoFAX: TStringField
      FieldName = 'FAX'
    end
  end
  inherited rlepCalculos: TRLExpressionParser
    Left = 148
  end
end
