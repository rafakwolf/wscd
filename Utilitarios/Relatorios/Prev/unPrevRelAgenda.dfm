inherited frmPrevRelAgenda: TfrmPrevRelAgenda
  Left = 403
  Top = 116
  Width = 811
  Caption = 'frmPrevRelAgenda'
  ClientHeight = 488
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
        Height = 18
        Top = 2
        Width = 47
        Caption = 'Nome'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbFone: TRLLabel
        Left = 3
        Height = 18
        Top = 22
        Width = 40
        Caption = 'Fone'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbFax: TRLLabel
        Left = 3
        Height = 18
        Top = 43
        Width = 31
        Caption = 'Fax'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
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
        Width = 73
        DataField = 'TELEFONE'
        DataSource = dsPadrao
      end
      object dbFax: TRLDBText
        Left = 55
        Height = 15
        Top = 45
        Width = 29
        DataField = 'FAX'
        DataSource = dsPadrao
      end
    end
  end
  inherited sqldPadrao: TSQLQuery
    object sqldPadraoNOME: TStringField[0]
      FieldKind = fkData
      FieldName = 'NOME'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoTELEFONE: TStringField[1]
      FieldKind = fkData
      FieldName = 'TELEFONE'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoFAX: TStringField[2]
      FieldKind = fkData
      FieldName = 'FAX'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
  end
  inherited cdsPadrao: TMemDataset
    object cdsPadraoNOME: TStringField[0]
      FieldKind = fkData
      FieldName = 'NOME'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoTELEFONE: TStringField[1]
      FieldKind = fkData
      FieldName = 'TELEFONE'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoFAX: TStringField[2]
      FieldKind = fkData
      FieldName = 'FAX'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
  end
  inherited rlepCalculos: TRLExpressionParser
    Left = 148
  end
end
