object frmModeloConsulta: TfrmModeloConsulta
  Left = 225
  Top = 159
  ClientHeight = 341
  ClientWidth = 683
  Caption = 'Consulta'
  OldCreateOrder = False
  ShowHint = False
  OnKeyDown = FormKeyDown
  KeyPreview = True
  MonitoredKeys.Keys = <>
  Font.Charset = ANSI_CHARSET
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbCampo: TUniLabel
    Left = 8
    Top = 8
    Width = 33
    Height = 13
    Hint = ''
    Caption = 'Campo'
    TabOrder = 7
  end
  object lbCondicao: TUniLabel
    Left = 144
    Top = 8
    Width = 44
    Height = 13
    Hint = ''
    Caption = 'Condi'#231#227'o'
    TabOrder = 8
  end
  object lbDados: TUniLabel
    Left = 280
    Top = 8
    Width = 131
    Height = 13
    Hint = ''
    Caption = 'Digite os dados '#224' pesquisar'
    TabOrder = 9
  end
  object lbNumRegs: TUniLabel
    Left = 8
    Top = 304
    Width = 53
    Height = 13
    Hint = 'N'#250'mero de registros da pesquisa atual'
    Caption = 'lbNumRegs'
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    TabOrder = 10
  end
  object btnBuscar: TUniBitBtn
    Left = 576
    Top = 8
    Width = 97
    Height = 41
    Hint = 'Executar a pesquisa'
    Caption = '&Pesquisar'
    TabOrder = 3
    Default = True
    OnClick = btnBuscarClick
  end
  object btnOk: TUniBitBtn
    Left = 488
    Top = 296
    Width = 89
    Height = 33
    Hint = 'Confirmar o registro selecionado'
    Caption = '&OK'
    ModalResult = 1
    TabOrder = 5
    Default = True
    OnClick = btnOkClick
  end
  object btnCancelar: TUniBitBtn
    Left = 584
    Top = 296
    Width = 89
    Height = 33
    Hint = 'Cancelar a pesquisa'
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 6
    OnClick = btnCancelarClick
  end
  object cmbCondicao: TUniComboBox
    Left = 144
    Top = 24
    Width = 129
    Height = 21
    Hint = 'Condi'#231#227'o da pesquisa'
    Style = csDropDownList
    Text = ''
    Items.Strings = (
      'Igual a'
      'Contendo'
      'Come'#231'ando com'
      'Terminando com')
    TabOrder = 1
  end
  object cmbCampo: TUniComboBox
    Left = 8
    Top = 24
    Width = 129
    Height = 21
    Hint = 'Campo a ser pesquisado'
    Style = csDropDownList
    Text = ''
    Items.Strings = (
      'Por c'#243'digo'
      'Por raz'#227'o social'
      'Por telefone'
      'Por cidade'
      'Por vendedor')
    TabOrder = 0
  end
  object edtPesquisa: TUniEdit
    Left = 280
    Top = 24
    Width = 289
    Height = 21
    Hint = 'Valor a ser pesquisado'
    Text = ''
    TabOrder = 2
  end
  object Grade: TUniDBGrid
    Left = 8
    Top = 56
    Width = 665
    Height = 235
    Hint = ''
    DataSource = dsPadrao
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines]
    ReadOnly = True
    LoadMask.Message = 'Loading data...'
    Font.Charset = ANSI_CHARSET
    ParentFont = False
    TabOrder = 4
    ParentColor = False
    Color = clWindow
    OnDblClick = GradeDblClick
  end
  object dsPadrao: TDataSource
    AutoEdit = False
    DataSet = cdsPesquisa
    Left = 488
    Top = 168
  end
  object sqldPesquisa: TSQLDataSet
    Params = <>
    Left = 176
    Top = 168
  end
  object dspPesquisa: TDataSetProvider
    DataSet = sqldPesquisa
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 296
    Top = 168
  end
  object cdsPesquisa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesquisa'
    Left = 408
    Top = 168
  end
end
