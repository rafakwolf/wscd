inherited frmRelatorioAgenda: TfrmRelatorioAgenda
  Caption = 'frmRelatorioAgenda'
  ClientHeight = 184
  ClientWidth = 385
  OldCreateOrder = True
  ExplicitWidth = 401
  ExplicitHeight = 223
  PixelsPerInch = 96
  TextHeight = 13
  object lbTelefone: TLabel [0]
    Left = 8
    Top = 100
    Width = 48
    Height = 13
    Caption = 'Telefone'
  end
  object edFone: TMaskEdit [1]
    Left = 8
    Top = 116
    Width = 147
    Height = 21
    TabOrder = 2
    Text = ''
  end
  object dbeNome: TDBEdit [2]
    Left = 8
    Top = 68
    Width = 355
    Height = 21
    Hint = 'Pesquisar < F2 >'
    Color = clBtnFace
    DataField = 'NOME'
    DataSource = dsPadrao
    ReadOnly = True
    TabOrder = 1
  end
  object rgTipoRelatorio: TRadioGroup [3]
    Left = 8
    Top = 8
    Width = 377
    Height = 33
    Hint = 'Escolha uma op'#231#227'o'
    Caption = ' Buscar por '
    Columns = 3
    ItemIndex = 2
    Items.Strings = (
      'Nome'
      'Telefone'
      'Todos')
    TabOrder = 0
    OnClick = rgTipoRelatorioClick
  end
  inherited pnButtons: TPanel
    Top = 150
    Width = 385
    TabOrder = 3
    ExplicitTop = 150
    ExplicitWidth = 385
    inherited btnVisualizar: TBitBtn
      OnClick = btnVisualizarClick
    end
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsAgenda
    Left = 312
    Top = 104
  end
  object sqldAgenda: TSQLDataSet
    CommandText = 'select * from VIEWAGENDA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 216
    Top = 104
    object sqldAgendaNOME: TStringField
      FieldName = 'NOME'
      Size = 80
    end
    object sqldAgendaTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
    object sqldAgendaTELEFONE2: TStringField
      FieldName = 'TELEFONE2'
    end
    object sqldAgendaTELEFONE3: TStringField
      FieldName = 'TELEFONE3'
    end
    object sqldAgendaFAX: TStringField
      FieldName = 'FAX'
    end
  end
  object dspAgenda: TDataSetProvider
    DataSet = sqldAgenda
    Options = [poAllowCommandText]
    Left = 248
    Top = 104
  end
  object cdsAgenda: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAgenda'
    Left = 280
    Top = 104
    object cdsAgendaNOME: TStringField
      FieldName = 'NOME'
    end
    object cdsAgendaTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
    object cdsAgendaTELEFONE2: TStringField
      FieldName = 'TELEFONE2'
    end
    object cdsAgendaTELEFONE3: TStringField
      FieldName = 'TELEFONE3'
    end
    object cdsAgendaFAX: TStringField
      FieldName = 'FAX'
    end
  end
end
