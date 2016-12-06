inherited frmPrevRelCFOPs: TfrmPrevRelCFOPs
  Left = 2
  Top = 1
  Caption = 'frmPrevRelCFOPs'
  ClientHeight = 530
  ClientWidth = 971
  OldCreateOrder = True
  ExplicitWidth = 987
  ExplicitHeight = 568
  PixelsPerInch = 96
  TextHeight = 13
  inherited rrPadrao: TRLReport
    Width = 1123
    Height = 794
    PageSetup.Orientation = poLandscape
    ExplicitWidth = 1123
    ExplicitHeight = 794
    inherited rbTitulo: TRLBand
      Width = 1047
      ExplicitWidth = 1047
      inherited lbTitulo: TRLLabel
        Top = 76
        Width = 1045
        Height = 31
        ExplicitTop = 76
        ExplicitWidth = 1045
        ExplicitHeight = 31
      end
      inherited rlmCabecalho: TRLMemo
        Width = 947
        Height = 75
        ExplicitWidth = 947
        ExplicitHeight = 75
      end
      inherited imgLogo: TRLImage
        Height = 75
        ExplicitHeight = 75
      end
    end
    inherited rbRodape: TRLBand
      Top = 259
      Width = 1047
      ExplicitTop = 259
      ExplicitWidth = 1047
      inherited sysData: TRLSystemInfo
        Left = 935
        ExplicitLeft = 935
      end
      inherited sysPage: TRLSystemInfo
        Left = 871
        ExplicitLeft = 871
      end
    end
    object rlbndCabecColunas: TRLBand
      Left = 38
      Top = 139
      Width = 1047
      Height = 20
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object rllbNumero: TRLLabel
        Left = 8
        Top = 2
        Width = 35
        Height = 16
        Caption = 'CFOP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rllbOperacao: TRLLabel
        Left = 120
        Top = 2
        Width = 66
        Height = 16
        Caption = 'Opera'#231#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rllbDescricao: TRLLabel
        Left = 552
        Top = 2
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
    end
    object rlbndColunaDados: TRLBand
      Left = 38
      Top = 159
      Width = 1047
      Height = 100
      BeforePrint = rlbndColunaDadosBeforePrint
      object rlbdtNumero: TRLDBText
        Left = 8
        Top = 2
        Width = 105
        Height = 16
        AutoSize = False
        DataField = 'NUMERO'
        DataSource = dsPadrao
        Text = ''
      end
      object rldbmOperacao: TRLDBMemo
        Left = 120
        Top = 2
        Width = 429
        Height = 95
        AutoSize = False
        Behavior = [beSiteExpander]
        DataField = 'OPERACAO'
        DataSource = dsPadrao
      end
      object rldbmDescricao: TRLDBMemo
        Left = 552
        Top = 2
        Width = 489
        Height = 95
        AutoSize = False
        Behavior = [beSiteExpander]
        DataField = 'CFNOTA'
        DataSource = dsPadrao
      end
    end
  end
  inherited sqldPadrao: TSQLDataSet
    CommandText = 
      'select'#13#10'  NUMERO, '#13#10'  OPERACAO, '#13#10'  CFNOTA'#13#10'from CFOP'#13#10'order by ' +
      'NUMERO'
    object sqldPadraoNUMERO: TStringField
      FieldName = 'NUMERO'
      Required = True
    end
    object sqldPadraoOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Required = True
      Size = 250
    end
    object sqldPadraoCFNOTA: TStringField
      FieldName = 'CFNOTA'
      Size = 1000
    end
  end
  inherited cdsPadrao: TClientDataSet
    object cdsPadraoNUMERO: TStringField
      FieldName = 'NUMERO'
      Required = True
    end
    object cdsPadraoOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Required = True
      Size = 250
    end
    object cdsPadraoCFNOTA: TStringField
      FieldName = 'CFNOTA'
      Size = 1000
    end
  end
end
