inherited frmConfiguraDuplicata: TfrmConfiguraDuplicata
  Left = 307
  Top = 123
  Caption = 'frmConfiguraDuplicata'
  ClientHeight = 407
  ClientWidth = 465
  OldCreateOrder = True
  ExplicitWidth = 471
  ExplicitHeight = 436
  PixelsPerInch = 96
  TextHeight = 13
  object dbeFontSize: TDBEdit [0]
    Left = 392
    Top = 356
    Width = 57
    Height = 21
    DataField = 'FONTE'
    DataSource = dsPadrao
    TabOrder = 2
  end
  object dbgrdCampos: TDBGrid [1]
    Left = 8
    Top = 40
    Width = 449
    Height = 289
    DataSource = dsPadrao
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Verdana'
    TitleFont.Style = []
    OnKeyDown = dbgrdCamposKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'CAMPO'
        Title.Caption = 'Campo'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Verdana'
        Title.Font.Style = [fsBold]
        Width = 273
        Visible = True
      end
      item
        Color = 15790320
        Expanded = False
        FieldName = 'VERTICAL'
        Title.Caption = 'Coluna'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Verdana'
        Title.Font.Style = [fsBold]
        Width = 69
        Visible = True
      end
      item
        Color = 15790320
        Expanded = False
        FieldName = 'HORIZONTAL'
        Title.Caption = 'Linha'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Verdana'
        Title.Font.Style = [fsBold]
        Width = 63
        Visible = True
      end>
  end
  inherited sbStatus: TStatusBar
    Top = 388
    Width = 465
    ExplicitTop = 388
    ExplicitWidth = 465
  end
  inherited pnBotoesPadrao: TPanel
    Width = 465
    ExplicitWidth = 465
  end
  inherited actlNavigateActions: TActionList
    Left = 72
    Top = 172
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 311
    Top = 104
  end
  object sqldPadrao: TSQLDataSet
    CommandText = 
      'select '#13#10'       cd.idconfigduplicata, '#13#10'       cd.campo, '#13#10'     ' +
      '  cd.vertical, '#13#10'       cd.horizontal, '#13#10'       cd.fonte, '#13#10'    ' +
      '   cd.nomecampo, '#13#10'       cd.tipofonte, '#13#10'       cd.estilofonte'#13 +
      #10'from configduplicata cd'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 72
    Top = 80
    object sqldPadraoCAMPO: TStringField
      FieldName = 'CAMPO'
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
    object sqldPadraoIDCONFIGDUPLICATA: TIntegerField
      FieldName = 'IDCONFIGDUPLICATA'
      Required = True
    end
    object sqldPadraoNOMECAMPO: TStringField
      FieldName = 'NOMECAMPO'
      Size = 80
    end
  end
  object dspPadrao: TDataSetProvider
    DataSet = sqldPadrao
    Left = 152
    Top = 96
  end
  object cdsPadrao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    BeforeInsert = cdsPadraoBeforeInsert
    Left = 224
    Top = 104
    object cdsPadraoCAMPO: TStringField
      FieldName = 'CAMPO'
      ReadOnly = True
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
    object cdsPadraoIDCONFIGDUPLICATA: TIntegerField
      FieldName = 'IDCONFIGDUPLICATA'
      Required = True
    end
    object cdsPadraoNOMECAMPO: TStringField
      FieldName = 'NOMECAMPO'
      Size = 80
    end
  end
end
