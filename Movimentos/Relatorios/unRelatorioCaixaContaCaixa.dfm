inherited frmRelatorioCaixaContaCaixa: TfrmRelatorioCaixaContaCaixa
  Left = 240
  Top = 195
  ClientHeight = 168
  ClientWidth = 345
  Caption = 'frmRelatorioCaixaContaCaixa'
  OldCreateOrder = True
  ExplicitWidth = 361
  ExplicitHeight = 207
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnButtons: TContainerPanel
    Top = 134
    Width = 345
    ExplicitTop = 134
    ExplicitWidth = 345
  end
  object dbeCaixa: TDBEdit [1]
    Left = 24
    Top = 40
    Width = 283
    Height = 21
    Hint = 'Pesquisar < F2 >'
    ShowHint = True
    DataField = 'NOME'
    DataSource = dsPadrao
    TabOrder = 1
    Color = clBtnFace
    ReadOnly = True
  end
  object dtpDataIni: TDBEdit [2]
    Left = 24
    Top = 88
    Width = 145
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'DATAINI'
    DataSource = dsData
    TabOrder = 2
  end
  object dtpDataFim: TDBEdit [3]
    Left = 184
    Top = 88
    Width = 145
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'DATAFIM'
    DataSource = dsData
    TabOrder = 3
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsCaixa
    Left = 296
    Top = 8
  end
  object sqldCaixa: TSQLDataSet
    CommandText = 'select CODIGO, NOME from CAIXAS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 200
    Top = 8
  end
  object dspCaixa: TDataSetProvider
    DataSet = sqldCaixa
    Options = [poAllowCommandText]
    Left = 232
    Top = 8
  end
  object cdsCaixa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCaixa'
    Left = 264
    Top = 8
    object cdsCaixaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsCaixaNOME: TStringField
      FieldName = 'NOME'
      Required = True
    end
  end
  object dsData: TDataSource
    Left = 144
    Top = 8
  end
end
