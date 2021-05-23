object frmPrevEtiquetaCliente: TfrmPrevEtiquetaCliente
  Left = 0
  Top = 12
  Caption = 'frmPrevEtiquetaCliente'
  ClientHeight = 523
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object rpEtiqueta: TRLReport
    Left = 1
    Top = 0
    Width = 794
    Height = 1123
    DataSource = dsEtq
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ForceMinBands = True
    PreviewOptions.ShowModal = True
    RealBounds.Height = 800.000000000000000000
    ShowProgress = False
    OnDataRecord = rpEtiquetaDataRecord
    object Detail: TRLDetailGrid
      Left = 38
      Top = 38
      Width = 718
      Height = 97
      AutoExpand = False
      ColCount = 3
      object dbDescricao: TRLDBMemo
        Left = 0
        Top = 0
        Width = 230
        Height = 16
        Align = faLeftTop
        DataField = 'TITULO'
        DataSource = dsEtq
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        BeforePrint = dbDescricaoBeforePrint
      end
      object dbmTexto: TRLDBMemo
        Left = 1
        Top = 24
        Width = 230
        Height = 72
        AutoSize = False
        DataField = 'TEXTO'
        DataSource = dsEtq
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        BeforePrint = dbmTextoBeforePrint
      end
    end
  end
  object sqldEtq: TSQLDataSet
    CommandText = 'select'#13#10'  TITULO,'#13#10'  TEXTO'#13#10'from VIEWETIQUETACLIENTE'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 40
    Top = 16
    object sqldEtqTITULO: TStringField
      FieldName = 'TITULO'
      Size = 80
    end
    object sqldEtqTEXTO: TStringField
      FieldName = 'TEXTO'
      Size = 253
    end
  end
  object dspEtq: TDataSetProvider
    DataSet = sqldEtq
    Options = [poAllowCommandText]
    Left = 72
    Top = 16
  end
  object cdsEtq: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEtq'
    Left = 104
    Top = 16
    object cdsEtqTITULO: TStringField
      FieldName = 'TITULO'
      Size = 80
    end
    object cdsEtqTEXTO: TStringField
      FieldName = 'TEXTO'
      Size = 253
    end
  end
  object dsEtq: TDataSource
    DataSet = cdsEtq
    Left = 136
    Top = 16
  end
end
