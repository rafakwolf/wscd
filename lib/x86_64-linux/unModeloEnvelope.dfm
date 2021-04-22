object frmModeloEnvelope: TfrmModeloEnvelope
  Left = 0
  Top = 107
  ClientHeight = 443
  ClientWidth = 784
  Caption = 'frmModeloEnvelope'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Name = 'MS Sans Serif'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object rrEnvelope: TRLReport
    Left = 0
    Top = 0
    Width = 831
    Height = 416
    DataSource = dsPadrao
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    PageSetup.PaperSize = fpEnv_DL
    PageSetup.Orientation = poLandscape
    PreviewOptions.ShowModal = True
    BeforePrint = rrEnvelopeBeforePrint
    object rbFundo: TRLBand
      Left = 38
      Top = 38
      Width = 755
      Height = 339
      object lbEmpresa: TRLLabel
        Left = 32
        Top = 26
        Width = 425
        Height = 22
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbEndereco: TRLLabel
        Left = 32
        Top = 49
        Width = 425
        Height = 16
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
      object lbTelefone: TRLLabel
        Left = 32
        Top = 66
        Width = 425
        Height = 16
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
      object lbCNPJ_IE: TRLLabel
        Left = 32
        Top = 83
        Width = 425
        Height = 16
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
      object dbNome: TRLDBText
        Left = 328
        Top = 192
        Width = 420
        Height = 15
        AutoSize = False
        DataField = 'NOME'
        DataSource = dsPadrao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
      object dbEndereco: TRLDBText
        Left = 328
        Top = 214
        Width = 420
        Height = 15
        AutoSize = False
        DataField = 'ENDERECO'
        DataSource = dsPadrao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object dbCidade: TRLDBText
        Left = 328
        Top = 236
        Width = 420
        Height = 15
        AutoSize = False
        DataField = 'CIDADE'
        DataSource = dsPadrao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object dbBairro: TRLDBText
        Left = 328
        Top = 258
        Width = 420
        Height = 15
        AutoSize = False
        DataField = 'BAIRRO'
        DataSource = dsPadrao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object dbCep: TRLDBText
        Left = 328
        Top = 280
        Width = 420
        Height = 15
        AutoSize = False
        DataField = 'CEP'
        DataSource = dsPadrao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object lbPara: TRLLabel
        Left = 280
        Top = 168
        Width = 45
        Height = 19
        Caption = 'Para:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object sqldPadrao: TSQLDataSet
    CommandText = 
      'select'#13#10'  cast(NULL as Varchar(100)) NOME,'#13#10'  cast(NULL as Varch' +
      'ar(100)) ENDERECO,'#13#10'  cast(NULL as Varchar(100)) CIDADE,'#13#10'  cast' +
      '(NULL as Varchar(100)) BAIRRO,'#13#10'  cast(NULL as Varchar(10)) CEP'#13 +
      #10'from RDB$DATABASE'
    MaxBlobSize = -1
    Params = <>
    Left = 40
    Top = 8
    object sqldPadraoNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object sqldPadraoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 100
    end
    object sqldPadraoCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 100
    end
    object sqldPadraoBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 100
    end
    object sqldPadraoCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
  end
  object dspPadrao: TDataSetProvider
    DataSet = sqldPadrao
    Options = [poPropogateChanges, poAllowCommandText]
    Left = 128
    Top = 8
  end
  object cdsPadrao: TMemDataset
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 216
    Top = 8
    object cdsPadraoNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object cdsPadraoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 100
    end
    object cdsPadraoCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 100
    end
    object cdsPadraoBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 100
    end
    object cdsPadraoCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
  end
  object dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 304
    Top = 8
  end
end
