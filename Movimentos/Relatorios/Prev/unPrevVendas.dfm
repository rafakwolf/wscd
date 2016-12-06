inherited frmPrevVendas: TfrmPrevVendas
  Caption = 'frmPrevVendas'
  ClientHeight = 500
  ClientWidth = 804
  OldCreateOrder = True
  ExplicitWidth = 820
  ExplicitHeight = 538
  PixelsPerInch = 96
  TextHeight = 13
  inherited rrPadrao: TRLReport
    inherited rbTitulo: TRLBand
      inherited lbTitulo: TRLLabel
        Height = 30
        ExplicitHeight = 30
      end
      inherited rlmCabecalho: TRLMemo
        Height = 76
        ExplicitHeight = 76
      end
      inherited imgLogo: TRLImage
        Height = 76
        ExplicitHeight = 76
      end
    end
    inherited rbRodape: TRLBand
      Top = 234
      Height = 39
      ExplicitTop = 234
      ExplicitHeight = 39
      inherited sysPage: TRLSystemInfo
        Top = 23
        ExplicitTop = 23
      end
    end
    object rlgGrupo: TRLGroup
      Left = 38
      Top = 139
      Width = 718
      Height = 95
      DataFields = 'CODCLIENTE'
      object rlbTitulo: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 18
        BandType = btColumnHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        Color = clBtnFace
        ParentColor = False
        Transparent = False
        object lbCodigo: TRLLabel
          Left = 8
          Top = 0
          Width = 47
          Height = 16
          Caption = 'C'#243'digo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object lbCliente: TRLLabel
          Left = 192
          Top = 0
          Width = 48
          Height = 16
          Caption = 'Cliente'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object rldbCodigo: TRLDBText
          Left = 58
          Top = 0
          Width = 77
          Height = 16
          DataField = 'CODCLIENTE'
          DataSource = dsPadrao
          Text = ''
          Transparent = False
        end
        object rldbNome: TRLDBText
          Left = 244
          Top = 0
          Width = 52
          Height = 16
          DataField = 'CLIENTE'
          DataSource = dsPadrao
          Text = ''
          Transparent = False
        end
      end
      object rlsbDetalhes: TRLSubDetail
        Left = 0
        Top = 18
        Width = 718
        Height = 67
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        DataSource = dsPadrao
        object rlbColunasDetalhe: TRLBand
          Left = 0
          Top = 0
          Width = 718
          Height = 19
          BandType = btTitle
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = True
          object lbCodVenda: TRLLabel
            Left = 72
            Top = 1
            Width = 77
            Height = 16
            Caption = 'C'#243'd. Venda'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbDataVenda: TRLLabel
            Left = 200
            Top = 1
            Width = 80
            Height = 16
            Caption = 'Data Venda'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbTotal: TRLLabel
            Left = 552
            Top = 1
            Width = 36
            Height = 16
            Caption = 'Total'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbDesconto: TRLLabel
            Left = 648
            Top = 1
            Width = 65
            Height = 16
            Caption = 'Desconto'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object rlbDetalhe: TRLBand
          Left = 0
          Top = 19
          Width = 718
          Height = 19
          BeforePrint = rlbDetalheBeforePrint
          object rldbCodVenda: TRLDBText
            Left = 99
            Top = 1
            Width = 50
            Height = 16
            Alignment = taRightJustify
            DataField = 'CODIGO'
            DataSource = dsPadrao
            Text = ''
          end
          object rldbdataVenda: TRLDBText
            Left = 200
            Top = 1
            Width = 36
            Height = 16
            DataField = 'DATA'
            DataSource = dsPadrao
            Text = ''
          end
          object rldbTotal: TRLDBText
            Left = 545
            Top = 1
            Width = 43
            Height = 16
            Alignment = taRightJustify
            DataField = 'TOTAL'
            DataSource = dsPadrao
            Text = ''
          end
          object rldbDesconto: TRLDBText
            Left = 622
            Top = 1
            Width = 91
            Height = 16
            Alignment = taRightJustify
            DataField = 'TOTALDESCTO'
            DataSource = dsPadrao
            Text = ''
          end
        end
        object rlbRodape: TRLBand
          Left = 0
          Top = 38
          Width = 718
          Height = 20
          BandType = btSummary
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = True
          Borders.DrawRight = False
          Borders.DrawBottom = False
          object rlblTotalVenda: TRLLabel
            Left = 551
            Top = 2
            Width = 58
            Height = 16
            Alignment = taRightJustify
            Caption = '<Total>'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
      end
    end
  end
  inherited sqldPadrao: TSQLDataSet
    CommandText = 
      'select '#13#10'  v.CODIGO, '#13#10'  v.CODCLIENTE,'#13#10'  cli.NOME CLIENTE, '#13#10'  ' +
      'v.DATA, '#13#10'  v.OBS, '#13#10'  v.TOTALDESCTO, '#13#10'  v.TOTAL, '#13#10'  v.CONCLUI' +
      'DA, '#13#10'  v.BAIXADO '#13#10'from VENDA v'#13#10'inner join CLIENTES cli on (v.' +
      'CODCLIENTE = cli.CODCLIENTE)'
    object sqldPadraoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sqldPadraoCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
    end
    object sqldPadraoCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Size = 80
    end
    object sqldPadraoDATA: TDateField
      FieldName = 'DATA'
    end
    object sqldPadraoOBS: TStringField
      FieldName = 'OBS'
      Size = 250
    end
    object sqldPadraoTOTALDESCTO: TFMTBCDField
      FieldName = 'TOTALDESCTO'
      Precision = 15
    end
    object sqldPadraoTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 15
    end
    object sqldPadraoCONCLUIDA: TStringField
      FieldName = 'CONCLUIDA'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoBAIXADO: TStringField
      FieldName = 'BAIXADO'
      FixedChar = True
      Size = 1
    end
  end
  inherited cdsPadrao: TClientDataSet
    object cdsPadraoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsPadraoCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
    end
    object cdsPadraoCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Size = 80
    end
    object cdsPadraoDATA: TDateField
      FieldName = 'DATA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoOBS: TStringField
      FieldName = 'OBS'
      Size = 250
    end
    object cdsPadraoTOTALDESCTO: TFMTBCDField
      FieldName = 'TOTALDESCTO'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
    object cdsPadraoTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
    object cdsPadraoCONCLUIDA: TStringField
      FieldName = 'CONCLUIDA'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoBAIXADO: TStringField
      FieldName = 'BAIXADO'
      FixedChar = True
      Size = 1
    end
  end
  inherited rlepCalculos: TRLExpressionParser
    Left = 147
  end
end
