inherited frmRelatorioFluxoCaixa: TfrmRelatorioFluxoCaixa
  ClientHeight = 208
  ClientWidth = 385
  Caption = 'frmRelatorioFluxoCaixa'
  OldCreateOrder = True
  ExplicitWidth = 401
  ExplicitHeight = 247
  PixelsPerInch = 96
  TextHeight = 13
  object rgOrdem: TRadioGroup [0]
    Left = 8
    Top = 56
    Width = 377
    Height = 41
    Caption = ' Ordem '
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Lan'#231'amento'
      'Data')
    TabOrder = 1
  end
  object rgRelatorio: TRadioGroup [1]
    Left = 8
    Top = 8
    Width = 377
    Height = 41
    Caption = ' Sele'#231#227'o '
    Columns = 3
    ItemIndex = 2
    Items.Strings = (
      'Entradas'
      'Sa'#237'das'
      'Todos')
    TabOrder = 0
  end
  inherited pnButtons: TUniContainerPanel
    Top = 174
    Width = 385
    TabOrder = 4
    ExplicitTop = 178
    ExplicitWidth = 393
  end
  object dbDataI: TUniDBEdit [3]
    Left = 80
    Top = 112
    Width = 137
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'DATAINI'
    DataSource = dsPadrao
    TabOrder = 2
  end
  object dbDataF: TUniDBEdit [4]
    Left = 80
    Top = 136
    Width = 137
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'DATAFIM'
    DataSource = dsPadrao
    TabOrder = 3
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsSelecao
    Left = 352
    Top = 136
  end
  object sqldSelecao: TSQLDataSet
    CommandText = 
      'select'#13#10'  cast(null as timestamp) as dataini,'#13#10'  cast(null as ti' +
      'mestamp) as datafim'#13#10'from rdb$database'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 256
    Top = 136
    object sqldSelecaoDATAINI: TSQLTimeStampField
      FieldName = 'DATAINI'
    end
    object sqldSelecaoDATAFIM: TSQLTimeStampField
      FieldName = 'DATAFIM'
    end
  end
  object dspSelecao: TDataSetProvider
    DataSet = sqldSelecao
    Left = 288
    Top = 136
  end
  object cdsSelecao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSelecao'
    Left = 320
    Top = 136
    object cdsSelecaoDATAINI: TSQLTimeStampField
      FieldName = 'DATAINI'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsSelecaoDATAFIM: TSQLTimeStampField
      FieldName = 'DATAFIM'
      DisplayFormat = 'dd/mm/yyyy'
    end
  end
end
