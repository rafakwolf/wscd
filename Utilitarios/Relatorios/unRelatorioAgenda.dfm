inherited frmRelatorioAgenda: TfrmRelatorioAgenda
  ClientHeight = 184
  ClientWidth = 385
  Caption = 'frmRelatorioAgenda'
  OldCreateOrder = True
  ExplicitWidth = 401
  ExplicitHeight = 223
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnButtons: TUniContainerPanel
    Top = 150
    Width = 385
    TabOrder = 3
    ExplicitTop = 150
    ExplicitWidth = 385
  end
  object lbTelefone: TUniLabel [1]
    Left = 8
    Top = 100
    Width = 42
    Height = 13
    Hint = ''
    ShowHint = True
    Caption = 'Telefone'
    TabOrder = 4
  end
  object dbeNome: TUniDBEdit [2]
    Left = 8
    Top = 68
    Width = 355
    Height = 21
    Hint = 'Pesquisar < F2 >'
    ShowHint = True
    DataField = 'NOME'
    DataSource = dsPadrao
    TabOrder = 1
    Color = clBtnFace
    ReadOnly = True
  end
  object edFone: TUniEdit [3]
    Left = 8
    Top = 116
    Width = 147
    Height = 21
    Hint = ''
    ShowHint = True
    Text = ''
    TabOrder = 2
  end
  object rgTipoRelatorio: TUniRadioGroup [4]
    Left = 8
    Top = 8
    Width = 377
    Height = 33
    Hint = 'Escolha uma op'#231#227'o'
    ShowHint = True
    Items.Strings = (
      'Nome'
      'Telefone'
      'Todos')
    ItemIndex = 2
    Caption = ' Buscar por '
    TabOrder = 0
    TabStop = False
    Columns = 3
    OnClick = rgTipoRelatorioClick
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
