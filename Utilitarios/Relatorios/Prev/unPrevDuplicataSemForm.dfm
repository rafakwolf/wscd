object frmPrevDuplicataSemForm: TfrmPrevDuplicataSemForm
  Left = 2
  Top = 1
  Caption = 'frmPrevDuplicataSemForm'
  ClientHeight = 530
  ClientWidth = 782
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object rrDuplicata: TRLReport
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
    ShowProgress = False
    AfterPrint = rrDuplicataAfterPrint
    BeforePrint = rrDuplicataBeforePrint
    object rbDetalhe: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 1043
      BandType = btTitle
      RealBounds.UsedUnit = buMilimeters
      object lbSacado: TRLLabel
        Left = 48
        Top = 168
        Width = 58
        Height = 16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lbEndereco: TRLLabel
        Left = 48
        Top = 200
        Width = 69
        Height = 16
      end
      object lbMunicipio: TRLLabel
        Left = 48
        Top = 232
        Width = 69
        Height = 16
      end
      object lbData_Emissao: TRLLabel
        Left = 8
        Top = 272
        Width = 99
        Height = 16
      end
      object lbNumero_Fatura: TRLLabel
        Left = 112
        Top = 272
        Width = 103
        Height = 16
      end
      object lbValor: TRLLabel
        Left = 256
        Top = 272
        Width = 44
        Height = 16
      end
      object lbNumero_Duplicata: TRLLabel
        Left = 376
        Top = 272
        Width = 120
        Height = 16
      end
      object lbVencimento: TRLLabel
        Left = 480
        Top = 272
        Width = 83
        Height = 16
      end
      object lbTelefone_Fax: TRLLabel
        Left = 256
        Top = 232
        Width = 91
        Height = 16
      end
      object lbDesconto: TRLLabel
        Left = 88
        Top = 312
        Width = 69
        Height = 16
      end
      object lbPagar_Ate: TRLLabel
        Left = 472
        Top = 312
        Width = 75
        Height = 16
      end
      object lbValor_Extenso: TRLLabel
        Left = 24
        Top = 376
        Width = 99
        Height = 16
      end
      object lbPraca_Pagamento: TRLLabel
        Left = 232
        Top = 344
        Width = 121
        Height = 16
      end
      object lbCnpjCpf: TRLLabel
        Left = 464
        Top = 168
        Width = 59
        Height = 16
      end
      object lbCep: TRLLabel
        Left = 520
        Top = 200
        Width = 37
        Height = 16
      end
      object lbBairro: TRLLabel
        Left = 392
        Top = 200
        Width = 48
        Height = 16
      end
      object lbInscricao_Estadual: TRLLabel
        Left = 488
        Top = 232
        Width = 124
        Height = 16
        Caption = 'lbIsncricao_Estadual'
      end
      object lbEstado: TRLLabel
        Left = 448
        Top = 232
        Width = 55
        Height = 16
      end
    end
  end
  object sqldPadrao: TSQLDataSet
    CommandText = 
      'select '#13#10'  CAMPO,'#13#10'  NOMECAMPO, '#13#10'  VERTICAL, '#13#10'  HORIZONTAL, '#13#10 +
      '  FONTE, '#13#10'  TIPOFONTE, '#13#10'  ESTILOFONTE'#13#10'from CONFIGDUPLICATA'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 16
    Top = 16
    object sqldPadraoCAMPO: TStringField
      FieldName = 'CAMPO'
      Size = 50
    end
    object sqldPadraoNOMECAMPO: TStringField
      FieldName = 'NOMECAMPO'
      Size = 50
    end
    object sqldPadraoVERTICAL: TIntegerField
      FieldName = 'VERTICAL'
    end
    object sqldPadraoHORIZONTAL: TIntegerField
      FieldName = 'HORIZONTAL'
    end
    object sqldPadraoFONTE: TIntegerField
      FieldName = 'FONTE'
    end
    object sqldPadraoTIPOFONTE: TStringField
      FieldName = 'TIPOFONTE'
      Size = 30
    end
    object sqldPadraoESTILOFONTE: TStringField
      FieldName = 'ESTILOFONTE'
    end
  end
  object dspPadrao: TDataSetProvider
    DataSet = sqldPadrao
    Left = 48
    Top = 16
  end
  object cdsPadrao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 80
    Top = 16
    object cdsPadraoCAMPO: TStringField
      FieldName = 'CAMPO'
      Size = 50
    end
    object cdsPadraoNOMECAMPO: TStringField
      FieldName = 'NOMECAMPO'
      Size = 50
    end
    object cdsPadraoVERTICAL: TIntegerField
      FieldName = 'VERTICAL'
    end
    object cdsPadraoHORIZONTAL: TIntegerField
      FieldName = 'HORIZONTAL'
    end
    object cdsPadraoFONTE: TIntegerField
      FieldName = 'FONTE'
    end
    object cdsPadraoTIPOFONTE: TStringField
      FieldName = 'TIPOFONTE'
      Size = 30
    end
    object cdsPadraoESTILOFONTE: TStringField
      FieldName = 'ESTILOFONTE'
    end
  end
end
