inherited frmRelatorioAniversarioCliente: TfrmRelatorioAniversarioCliente
  Caption = 'frmRelatorioAniversarioCliente'
  ClientHeight = 207
  ClientWidth = 521
  OldCreateOrder = True
  ExplicitWidth = 537
  ExplicitHeight = 246
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnButtons: TPanel
    Top = 173
    Width = 521
    ExplicitTop = 173
    ExplicitWidth = 521
    inherited btnVisualizar: TBitBtn
      OnClick = btnVisualizarClick
    end
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
  object pnDiaMesAno: TPanel [3]
    Left = 8
    Top = 72
    Width = 249
    Height = 97
    Enabled = False
    TabOrder = 3
    object LabelMes: TLabel
      Left = 8
      Top = 5
      Width = 22
      Height = 13
      Caption = 'M'#234's'
    end
    object LabelDo: TLabel
      Left = 8
      Top = 47
      Width = 37
      Height = 13
      Caption = 'Do dia'
    end
    object LabelAte: TLabel
      Left = 88
      Top = 47
      Width = 19
      Height = 13
      Caption = 'At'#233
    end
    object cmbMes: TComboBox
      Left = 8
      Top = 20
      Width = 233
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 0
      Text = 'Janeiro'
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
    end
    object edDo: TSpinEdit
      Left = 8
      Top = 62
      Width = 65
      Height = 22
      MaxValue = 31
      MinValue = 1
      TabOrder = 1
      Value = 1
    end
    object edAte: TSpinEdit
      Left = 88
      Top = 62
      Width = 65
      Height = 22
      MaxValue = 31
      MinValue = 1
      TabOrder = 2
      Value = 31
    end
    object edAno: TLabeledEdit
      Left = 167
      Top = 63
      Width = 74
      Height = 21
      EditLabel.Width = 22
      EditLabel.Height = 13
      EditLabel.Caption = 'Ano'
      TabOrder = 3
      Text = '2007'
      OnKeyPress = edAnoKeyPress
    end
  end
  object pnDatas: TPanel [4]
    Left = 264
    Top = 72
    Width = 257
    Height = 97
    Enabled = False
    TabOrder = 4
    object dbeDataIni: TDBEdit
      Left = 8
      Top = 20
      Width = 241
      Height = 21
      DataField = 'DATAINI'
      DataSource = dsPadrao
      TabOrder = 0
    end
    object dbeDataFim: TDBEdit
      Left = 8
      Top = 63
      Width = 241
      Height = 21
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
