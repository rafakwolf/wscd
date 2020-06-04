inherited frmRelatorioFluxoCaixa: TfrmRelatorioFluxoCaixa
  ClientHeight = 208
  ClientWidth = 385
  Caption = 'frmRelatorioFluxoCaixa'
  OldCreateOrder = True
  ExplicitWidth = 401
  ExplicitHeight = 247
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnButtons: TContainerPanel
    Top = 174
    Width = 385
    TabOrder = 4
    ExplicitTop = 178
    ExplicitWidth = 393
  end
  object dbDataI: TDBEdit [1]
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
  object dbDataF: TDBEdit [2]
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
  object rgOrdem: TRadioGroup [3]
    Left = 8
    Top = 56
    Width = 377
    Height = 41
    Hint = ''
    ShowHint = True
    Items.Strings = (
      'Lan'#231'amento'
      'Data')
    ItemIndex = 0
    Caption = ' Ordem '
    TabOrder = 1
    TabStop = False
    Columns = 2
  end
  object rgRelatorio: TRadioGroup [4]
    Left = 8
    Top = 8
    Width = 377
    Height = 41
    Hint = ''
    ShowHint = True
    Items.Strings = (
      'Entradas'
      'Sa'#237'das'
      'Todos')
    ItemIndex = 2
    Caption = ' Sele'#231#227'o '
    TabOrder = 0
    TabStop = False
    Columns = 3
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
