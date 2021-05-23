inherited frmImprimeEtiq: TfrmImprimeEtiq
  Left = 216
  Top = 155
  Caption = 'Impress'#227'o de etiquetas'
  ClientHeight = 250
  ClientWidth = 523
  OldCreateOrder = True
  ExplicitWidth = 539
  ExplicitHeight = 289
  PixelsPerInch = 96
  TextHeight = 13
  object lbModeloEtq: TLabel [0]
    Left = 16
    Top = 24
    Width = 113
    Height = 13
    Alignment = taRightJustify
    Caption = 'Modelo de Etiqueta:'
  end
  object lbLinhaIni: TLabel [1]
    Left = 39
    Top = 53
    Width = 90
    Height = 13
    Alignment = taRightJustify
    Caption = 'Iniciar na linha:'
  end
  object lbColIni: TLabel [2]
    Left = 29
    Top = 79
    Width = 100
    Height = 13
    Alignment = taRightJustify
    Caption = 'Iniciar na coluna:'
  end
  inherited pnButtons: TPanel
    Top = 216
    Width = 523
    ExplicitTop = 122
    ExplicitWidth = 417
    inherited btnVisualizar: TBitBtn
      OnClick = btnVisualizarClick
    end
  end
  object cbListaEtiq: TComboBox [4]
    Left = 132
    Top = 20
    Width = 272
    Height = 21
    Style = csDropDownList
    TabOrder = 1
  end
  object seColunaIni: TSpinEdit [5]
    Left = 132
    Top = 74
    Width = 45
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 2
    Value = 1
    OnExit = seColunaIniExit
  end
  object seLinhaIni: TSpinEdit [6]
    Left = 132
    Top = 48
    Width = 45
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 3
    Value = 1
    OnExit = seLinhaIniExit
  end
  object rgTraversal: TRadioGroup [7]
    Left = 190
    Top = 48
    Width = 214
    Height = 55
    Caption = 'Imprimir etiquetas na ordem'
    ItemIndex = 0
    Items.Strings = (
      'Horizontal'
      'Vertical')
    TabOrder = 4
  end
  inherited dsPadrao: TDataSource
    Left = 376
    Top = 120
  end
  object sqldEtiqueta: TSQLDataSet
    CommandText = 'select * from ETIQUETA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 104
    Top = 128
    object sqldEtiquetaIDETIQUETA: TIntegerField
      FieldName = 'IDETIQUETA'
      Required = True
    end
    object sqldEtiquetaETIQUETA: TStringField
      FieldName = 'ETIQUETA'
      Size = 80
    end
    object sqldEtiquetaALTURAFOLHA: TFloatField
      FieldName = 'ALTURAFOLHA'
    end
    object sqldEtiquetaLARGURAFOLHA: TFloatField
      FieldName = 'LARGURAFOLHA'
    end
    object sqldEtiquetaMARGEMSUPERIOR: TFloatField
      FieldName = 'MARGEMSUPERIOR'
    end
    object sqldEtiquetaMARGEMESQUERDA: TFloatField
      FieldName = 'MARGEMESQUERDA'
    end
    object sqldEtiquetaNUMEROLINHAS: TIntegerField
      FieldName = 'NUMEROLINHAS'
    end
    object sqldEtiquetaNUMEROCOLUNAS: TIntegerField
      FieldName = 'NUMEROCOLUNAS'
    end
    object sqldEtiquetaALTURAETIQUETA: TFloatField
      FieldName = 'ALTURAETIQUETA'
    end
    object sqldEtiquetaLARGURAETIQUETA: TFloatField
      FieldName = 'LARGURAETIQUETA'
    end
    object sqldEtiquetaDISTANCIAVERTICAL: TFloatField
      FieldName = 'DISTANCIAVERTICAL'
    end
    object sqldEtiquetaDISTANCIAHORIZONTAL: TFloatField
      FieldName = 'DISTANCIAHORIZONTAL'
    end
    object sqldEtiquetaDISTACOLVERTICAL: TFloatField
      FieldName = 'DISTACOLVERTICAL'
    end
    object sqldEtiquetaDISTCOLHORIZ: TFloatField
      FieldName = 'DISTCOLHORIZ'
    end
  end
  object dspEtiqueta: TDataSetProvider
    DataSet = sqldEtiqueta
    Left = 200
    Top = 128
  end
  object cdsEtiqueta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEtiqueta'
    Left = 280
    Top = 120
    object cdsEtiquetaIDETIQUETA: TIntegerField
      FieldName = 'IDETIQUETA'
      Required = True
    end
    object cdsEtiquetaETIQUETA: TStringField
      FieldName = 'ETIQUETA'
      Size = 80
    end
    object cdsEtiquetaALTURAFOLHA: TFloatField
      FieldName = 'ALTURAFOLHA'
    end
    object cdsEtiquetaLARGURAFOLHA: TFloatField
      FieldName = 'LARGURAFOLHA'
    end
    object cdsEtiquetaMARGEMSUPERIOR: TFloatField
      FieldName = 'MARGEMSUPERIOR'
    end
    object cdsEtiquetaMARGEMESQUERDA: TFloatField
      FieldName = 'MARGEMESQUERDA'
    end
    object cdsEtiquetaNUMEROLINHAS: TIntegerField
      FieldName = 'NUMEROLINHAS'
    end
    object cdsEtiquetaNUMEROCOLUNAS: TIntegerField
      FieldName = 'NUMEROCOLUNAS'
    end
    object cdsEtiquetaALTURAETIQUETA: TFloatField
      FieldName = 'ALTURAETIQUETA'
    end
    object cdsEtiquetaLARGURAETIQUETA: TFloatField
      FieldName = 'LARGURAETIQUETA'
    end
    object cdsEtiquetaDISTANCIAVERTICAL: TFloatField
      FieldName = 'DISTANCIAVERTICAL'
    end
    object cdsEtiquetaDISTANCIAHORIZONTAL: TFloatField
      FieldName = 'DISTANCIAHORIZONTAL'
    end
    object cdsEtiquetaDISTACOLVERTICAL: TFloatField
      FieldName = 'DISTACOLVERTICAL'
    end
    object cdsEtiquetaDISTCOLHORIZ: TFloatField
      FieldName = 'DISTCOLHORIZ'
    end
  end
end
