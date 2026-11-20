object frmPrevEtiquetaCliente: TfrmPrevEtiquetaCliente
  Left = 0
  Height = 523
  Top = 12
  Width = 784
  Caption = 'frmPrevEtiquetaCliente'
  ClientHeight = 523
  ClientWidth = 784
  Font.Name = 'MS Sans Serif'
  OnCreate = FormCreate
  object rpEtiqueta: TRLReport
    Left = 1
    Height = 1123
    Top = 0
    Width = 794
    DataSource = dsEtq
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    ForceMinBands = True
    PreviewOptions.ShowModal = True
    RealBounds.Height = 800
    ShowProgress = False
    OnDataRecord = rpEtiquetaDataRecord
    object Detail: TRLDetailGrid
      Left = 38
      Height = 97
      Top = 38
      Width = 718
      AutoExpand = False
      ColCount = 3
      object dbDescricao: TRLDBMemo
        Left = 0
        Height = 16
        Top = 0
        Width = 230
        Align = faLeftTop
        Behavior = [beSiteExpander]
        DataField = 'TITULO'
        DataSource = dsEtq
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        BeforePrint = dbDescricaoBeforePrint
      end
      object dbmTexto: TRLDBMemo
        Left = 1
        Height = 72
        Top = 24
        Width = 230
        AutoSize = False
        Behavior = [beSiteExpander]
        DataField = 'TEXTO'
        DataSource = dsEtq
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Courier New'
        ParentFont = False
        BeforePrint = dbmTextoBeforePrint
      end
    end
  end
  object dsEtq: TDataSource
    DataSet = sqldEtiq
    Left = 176
    Top = 216
  end
  object sqldEtiq: TZQuery
    Connection = DmPrincipal.ZConnection1
    Params = <>
    Left = 96
    Top = 216
    object sqldEtiqTITULO: TStringField
      FieldKind = fkData
      FieldName = 'TITULO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 150
    end
    object sqldEtiqTEXTO: TStringField
      FieldKind = fkData
      FieldName = 'TEXTO'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 500
    end
  end
end
