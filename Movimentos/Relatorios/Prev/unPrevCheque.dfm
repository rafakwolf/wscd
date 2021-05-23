inherited frmPrevCheque: TfrmPrevCheque
  Left = 2
  Top = 1
  Caption = 'frmPrevCheque'
  ClientHeight = 530
  ClientWidth = 782
  OldCreateOrder = True
  ExplicitWidth = 798
  ExplicitHeight = 568
  PixelsPerInch = 96
  TextHeight = 13
  inherited rrPadrao: TRLReport
    Width = 1123
    Height = 794
    PageSetup.Orientation = poLandscape
    inherited rbTitulo: TRLBand
      Width = 1047
      ExplicitWidth = 1047
      inherited lbTitulo: TRLLabel
        Width = 1045
        ExplicitWidth = 1045
      end
      inherited rlmCabecalho: TRLMemo
        Width = 947
        ExplicitWidth = 947
      end
    end
    inherited rbRodape: TRLBand
      Top = 205
      Width = 1047
      ExplicitTop = 205
      ExplicitWidth = 1047
      inherited sysPage: TRLSystemInfo
        Left = 871
        ExplicitLeft = 871
      end
      inherited sysData: TRLSystemInfo
        Left = 935
        ExplicitLeft = 935
      end
    end
    object rlbColuna: TRLBand
      Left = 38
      Top = 146
      Width = 1047
      Height = 20
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object rlblBanco: TRLLabel
        Left = 8
        Top = 2
        Width = 43
        Height = 16
        Caption = 'Banco'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rlblAgencia: TRLLabel
        Left = 176
        Top = 2
        Width = 56
        Height = 16
        Caption = 'Ag'#234'ncia'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rlblConta: TRLLabel
        Left = 256
        Top = 2
        Width = 42
        Height = 16
        Caption = 'Conta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rlblNumero: TRLLabel
        Left = 328
        Top = 2
        Width = 70
        Height = 16
        Caption = 'N'#186' cheque'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rlblDatareceb: TRLLabel
        Left = 416
        Top = 2
        Width = 63
        Height = 16
        Caption = 'Recebido'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rlblVencimento: TRLLabel
        Left = 496
        Top = 2
        Width = 65
        Height = 16
        Caption = 'Bom para'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rlblCliente: TRLLabel
        Left = 648
        Top = 2
        Width = 39
        Height = 16
        Caption = 'Nome'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rlblValor: TRLLabel
        Left = 955
        Top = 2
        Width = 38
        Height = 16
        Caption = 'Valor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rlblBaixado: TRLLabel
        Left = 575
        Top = 2
        Width = 54
        Height = 16
        Caption = 'Baixado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object rlbDetalhe: TRLBand
      Left = 38
      Top = 166
      Width = 1047
      Height = 20
      BeforePrint = rlbDetalheBeforePrint
      object rldbtBanco: TRLDBText
        Left = 8
        Top = 2
        Width = 165
        Height = 16
        AutoSize = False
        DataField = 'BANCO'
        DataSource = dsPadrao
      end
      object rldbtAgencia: TRLDBText
        Left = 176
        Top = 2
        Width = 55
        Height = 16
        DataField = 'AGENCIA'
        DataSource = dsPadrao
      end
      object rldbtConta: TRLDBText
        Left = 256
        Top = 2
        Width = 45
        Height = 16
        DataField = 'CONTA'
        DataSource = dsPadrao
      end
      object rldbtNumero: TRLDBText
        Left = 328
        Top = 2
        Width = 54
        Height = 16
        DataField = 'NUMERO'
        DataSource = dsPadrao
      end
      object rldbtDataReceb: TRLDBText
        Left = 416
        Top = 2
        Width = 90
        Height = 16
        DataField = 'DATAEMISSAO'
        DataSource = dsPadrao
      end
      object rldbtVenc: TRLDBText
        Left = 496
        Top = 2
        Width = 61
        Height = 16
        DataField = 'BOMPARA'
        DataSource = dsPadrao
      end
      object rldbtCliente: TRLDBText
        Left = 648
        Top = 2
        Width = 304
        Height = 16
        AutoSize = False
        DataField = 'CLIENTE'
        DataSource = dsPadrao
      end
      object rldbtValor: TRLDBText
        Left = 955
        Top = 2
        Width = 90
        Height = 16
        AutoSize = False
        DataField = 'VALOR'
        DataSource = dsPadrao
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object rldbtBaixado: TRLDBText
        Left = 575
        Top = 2
        Width = 88
        Height = 16
        DataField = 'DATABAIXADO'
        DataSource = dsPadrao
      end
    end
    object rlbndSumario: TRLBand
      Left = 38
      Top = 186
      Width = 1047
      Height = 19
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object rllbTotalizacao: TRLLabel
        Left = 948
        Top = 2
        Width = 97
        Height = 16
        Alignment = taRightJustify
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  inherited sqldPadrao: TSQLDataSet
    CommandText = 
      'SELECT'#13#10'  CH.IDCHEQUE,'#13#10'  CH.IDBANCO,'#13#10'  BC.BANCO,'#13#10'  CH.AGENCIA' +
      ','#13#10'  CH.CONTA,'#13#10'  CH.NUMERO,'#13#10'  CH.DATAEMISSAO,'#13#10'  CH.BOMPARA,'#13#10 +
      '  CH.IDCLIENTE,'#13#10'  CLI.NOME AS CLIENTE,'#13#10'  CH.IDFORN,'#13#10'  F.RAZAO' +
      'SOCIAL AS FORN,'#13#10'  CH.VALOR,'#13#10'  CH.VENDA,'#13#10'  CH.COMPRA,'#13#10'  CH.RE' +
      'PASSADO,'#13#10'  CH.BANDAMAGNETICA,'#13#10'  CH.DATABAIXADO'#13#10'FROM CHEQUE CH' +
      #13#10'LEFT JOIN BANCO BC ON (CH.IDBANCO = BC.IDBANCO)'#13#10'LEFT JOIN CLI' +
      'ENTES CLI ON (CLI.CODCLIENTE = CH.IDCLIENTE)'#13#10'LEFT JOIN FORNECED' +
      'ORES F ON (F.CODFORNECEDOR = CH.IDFORN)'#13#10'ORDER BY CH.DATAEMISSAO'
    object sqldPadraoIDCHEQUE: TIntegerField
      FieldName = 'IDCHEQUE'
      Required = True
    end
    object sqldPadraoIDBANCO: TIntegerField
      FieldName = 'IDBANCO'
    end
    object sqldPadraoBANCO: TStringField
      FieldName = 'BANCO'
      Size = 80
    end
    object sqldPadraoAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Size = 80
    end
    object sqldPadraoCONTA: TStringField
      FieldName = 'CONTA'
    end
    object sqldPadraoNUMERO: TStringField
      FieldName = 'NUMERO'
    end
    object sqldPadraoDATAEMISSAO: TDateField
      FieldName = 'DATAEMISSAO'
    end
    object sqldPadraoBOMPARA: TDateField
      FieldName = 'BOMPARA'
    end
    object sqldPadraoIDCLIENTE: TIntegerField
      FieldName = 'IDCLIENTE'
    end
    object sqldPadraoCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Size = 80
    end
    object sqldPadraoIDFORN: TIntegerField
      FieldName = 'IDFORN'
    end
    object sqldPadraoFORN: TStringField
      FieldName = 'FORN'
      Size = 80
    end
    object sqldPadraoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 15
    end
    object sqldPadraoVENDA: TIntegerField
      FieldName = 'VENDA'
    end
    object sqldPadraoCOMPRA: TIntegerField
      FieldName = 'COMPRA'
    end
    object sqldPadraoREPASSADO: TStringField
      FieldName = 'REPASSADO'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoBANDAMAGNETICA: TStringField
      FieldName = 'BANDAMAGNETICA'
      Size = 35
    end
    object sqldPadraoDATABAIXADO: TDateField
      FieldName = 'DATABAIXADO'
    end
  end
  inherited cdsPadrao: TClientDataSet
    object cdsPadraoIDCHEQUE: TIntegerField
      FieldName = 'IDCHEQUE'
      Required = True
    end
    object cdsPadraoIDBANCO: TIntegerField
      FieldName = 'IDBANCO'
    end
    object cdsPadraoBANCO: TStringField
      FieldName = 'BANCO'
      Size = 80
    end
    object cdsPadraoAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Size = 80
    end
    object cdsPadraoCONTA: TStringField
      FieldName = 'CONTA'
    end
    object cdsPadraoNUMERO: TStringField
      FieldName = 'NUMERO'
    end
    object cdsPadraoDATAEMISSAO: TDateField
      FieldName = 'DATAEMISSAO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoBOMPARA: TDateField
      FieldName = 'BOMPARA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoIDCLIENTE: TIntegerField
      FieldName = 'IDCLIENTE'
    end
    object cdsPadraoCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Size = 80
    end
    object cdsPadraoIDFORN: TIntegerField
      FieldName = 'IDFORN'
    end
    object cdsPadraoFORN: TStringField
      FieldName = 'FORN'
      Size = 80
    end
    object cdsPadraoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
    object cdsPadraoVENDA: TIntegerField
      FieldName = 'VENDA'
    end
    object cdsPadraoCOMPRA: TIntegerField
      FieldName = 'COMPRA'
    end
    object cdsPadraoREPASSADO: TStringField
      FieldName = 'REPASSADO'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoBANDAMAGNETICA: TStringField
      FieldName = 'BANDAMAGNETICA'
      Size = 35
    end
    object cdsPadraoDATABAIXADO: TDateField
      FieldName = 'DATABAIXADO'
      DisplayFormat = 'dd/mm/yyyy'
    end
  end
end
