object frmModeloConsulta: TfrmModeloConsulta
  Left = 334
  Height = 341
  Top = 169
  Width = 683
  Caption = 'Consulta'
  ClientHeight = 341
  ClientWidth = 683
  Font.CharSet = ANSI_CHARSET
  KeyPreview = True
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  LCLVersion = '3.6.0.0'
  object lbCampo: TLabel
    Left = 8
    Height = 16
    Top = 8
    Width = 43
    Caption = 'Campo'
    ParentColor = False
  end
  object lbCondicao: TLabel
    Left = 144
    Height = 16
    Top = 8
    Width = 57
    Caption = 'Condição'
    ParentColor = False
  end
  object lbDados: TLabel
    Left = 280
    Height = 16
    Top = 4
    Width = 168
    Caption = 'Digite os dados à pesquisar'
    ParentColor = False
  end
  object lbNumRegs: TLabel
    Left = 8
    Height = 16
    Hint = 'Número de registros da pesquisa atual'
    Top = 304
    Width = 70
    Caption = 'lbNumRegs'
    Font.CharSet = ANSI_CHARSET
    ParentColor = False
    ParentFont = False
  end
  object btnBuscar: TBitBtn
    Left = 576
    Height = 41
    Hint = 'Executar a pesquisa'
    Top = 8
    Width = 97
    Caption = '&Pesquisar'
    OnClick = btnBuscarClick
    TabOrder = 3
  end
  object btnOk: TBitBtn
    Left = 488
    Height = 33
    Hint = 'Confirmar o registro selecionado'
    Top = 296
    Width = 89
    Caption = '&OK'
    Default = True
    ModalResult = 1
    OnClick = btnOkClick
    TabOrder = 5
  end
  object btnCancelar: TBitBtn
    Left = 584
    Height = 33
    Hint = 'Cancelar a pesquisa'
    Top = 296
    Width = 89
    Caption = '&Cancelar'
    ModalResult = 2
    OnClick = btnCancelarClick
    TabOrder = 6
  end
  object cmbCondicao: TComboBox
    Left = 144
    Height = 20
    Hint = 'Condição da pesquisa'
    Top = 24
    Width = 129
    ItemHeight = 26
    Items.Strings = (
      'Igual a'
      'Contendo'
      'Começando com'
      'Terminando com'
    )
    Style = csDropDownList
    TabOrder = 1
  end
  object cmbCampo: TComboBox
    Left = 8
    Height = 20
    Hint = 'Campo a ser pesquisado'
    Top = 24
    Width = 129
    ItemHeight = 26
    Items.Strings = (
      'Por código'
      'Por razão social'
      'Por telefone'
      'Por cidade'
      'Por vendedor'
    )
    Style = csDropDownList
    TabOrder = 0
  end
  object edtPesquisa: TEdit
    Left = 280
    Height = 21
    Hint = 'Valor a ser pesquisado'
    Top = 20
    Width = 289
    TabOrder = 2
  end
  object Grade: TDBGrid
    Left = 8
    Height = 235
    Top = 56
    Width = 665
    Color = clWindow
    Columns = <>
    DataSource = dsPadrao
    Font.CharSet = ANSI_CHARSET
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines]
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
    OnDblClick = GradeDblClick
  end
  object dsPadrao: TDataSource
    AutoEdit = False
    DataSet = sqldPesquisa
    Left = 328
    Top = 160
  end
  object sqldPesquisa: TZReadOnlyQuery
    Connection = DmPrincipal.ZConnection1
    Params = <>
    Left = 224
    Top = 160
  end
end
