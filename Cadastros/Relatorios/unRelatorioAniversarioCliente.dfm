inherited frmRelatorioAniversarioCliente: TfrmRelatorioAniversarioCliente
  ClientHeight = 207
  ClientWidth = 521
  Caption = 'frmRelatorioAniversarioCliente'
  OldCreateOrder = True
  ExplicitWidth = 537
  ExplicitHeight = 246
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnButtons: TUniContainerPanel
    Top = 173
    Width = 521
    ExplicitTop = 173
    ExplicitWidth = 521
  end
  object rgTipo: TRadioGroup [1]
    Left = 8
    Top = 8
    Width = 249
    Height = 57
    Caption = ' Tipo '
    ItemIndex = 0
    Items.Strings = (
      'Envelopes'
      'Elenco')
    TabOrder = 1
  end
  object rgDatas: TRadioGroup [2]
    Left = 264
    Top = 8
    Width = 257
    Height = 57
    Caption = ' Filtro '
    ItemIndex = 0
    Items.Strings = (
      'Por Dia M'#234's e Ano'
      'Por Data')
    TabOrder = 2
    OnClick = rgDatasClick
  end
  object pnDiaMesAno: TUniContainerPanel [3]
    Left = 8
    Top = 72
    Width = 249
    Height = 97
    Hint = ''
    Enabled = False
    ShowHint = True
    ParentColor = False
    TabOrder = 3
    TabStop = False
    object LabelMes: TUniLabel
      Left = 8
      Top = 5
      Width = 19
      Height = 13
      Hint = ''
      ShowHint = True
      Caption = 'M'#234's'
      TabOrder = 5
    end
    object LabelDo: TUniLabel
      Left = 8
      Top = 47
      Width = 30
      Height = 13
      Hint = ''
      ShowHint = True
      Caption = 'Do dia'
      TabOrder = 6
    end
    object LabelAte: TUniLabel
      Left = 88
      Top = 47
      Width = 17
      Height = 13
      Hint = ''
      ShowHint = True
      Caption = 'At'#233
      TabOrder = 7
    end
    object edAno: TUniEdit
      Left = 167
      Top = 63
      Width = 74
      Height = 21
      Hint = ''
      ShowHint = True
      Text = '2007'
      TabOrder = 3
      OnKeyPress = edAnoKeyPress
    end
    object cmbMes: TUniComboBox
      Left = 8
      Top = 20
      Width = 233
      Height = 21
      Hint = ''
      ShowHint = True
      Style = csDropDownList
      Text = ''
      Items.Strings = (
        'Janeiro'
        'Fevereiro'
        'Mar'#231'o'
        'Abril'
        'Maio'
        'Junho'
        'Julho'
        'Agosto'
        'Setembro'
        'Outubro'
        'Novembro'
        'Dezembro')
      TabOrder = 0
    end
    object edDo: TUniSpinEdit
      Left = 8
      Top = 62
      Width = 65
      Height = 21
      Hint = ''
      ShowHint = True
      Value = 1
      MaxValue = 31
      MinValue = 1
      TabOrder = 1
    end
    object edAte: TUniSpinEdit
      Left = 88
      Top = 62
      Width = 65
      Height = 21
      Hint = ''
      ShowHint = True
      Value = 31
      MaxValue = 31
      MinValue = 1
      TabOrder = 2
    end
  end
  object pnDatas: TUniContainerPanel [4]
    Left = 264
    Top = 72
    Width = 257
    Height = 97
    Hint = ''
    Enabled = False
    ShowHint = True
    ParentColor = False
    TabOrder = 4
    TabStop = False
    object dbeDataIni: TUniDBEdit
      Left = 8
      Top = 20
      Width = 241
      Height = 21
      Hint = ''
      ShowHint = True
      DataField = 'DATAINI'
      DataSource = dsPadrao
      TabOrder = 0
    end
    object dbeDataFim: TUniDBEdit
      Left = 8
      Top = 63
      Width = 241
      Height = 21
      Hint = ''
      ShowHint = True
      DataField = 'DATAFIM'
      DataSource = dsPadrao
      TabOrder = 1
    end
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsSelecao
    Left = 214
    Top = 27
  end
  object sqldSelecao: TSQLDataSet
    CommandText = 
      'select'#13#10'  cast(NULL as Timestamp) DATAINI,'#13#10'  cast(NULL as Times' +
      'tamp) DATAFIM'#13#10'from RDB$DATABASE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 120
    Top = 26
    object sqldSelecaoDATAINI: TSQLTimeStampField
      FieldName = 'DATAINI'
    end
    object sqldSelecaoDATAFIM: TSQLTimeStampField
      FieldName = 'DATAFIM'
    end
  end
  object dspSelecao: TDataSetProvider
    DataSet = sqldSelecao
    Left = 152
    Top = 26
  end
  object cdsSelecao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSelecao'
    Left = 184
    Top = 26
    object cdsSelecaoDATAINI: TSQLTimeStampField
      FieldName = 'DATAINI'
    end
    object cdsSelecaoDATAFIM: TSQLTimeStampField
      FieldName = 'DATAFIM'
    end
  end
end
