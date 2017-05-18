inherited frmRelatorioClienteCidade: TfrmRelatorioClienteCidade
  Caption = 'frmRelatorioClienteCidade'
  ClientHeight = 144
  ClientWidth = 377
  OldCreateOrder = True
  ExplicitWidth = 393
  ExplicitHeight = 183
  PixelsPerInch = 96
  TextHeight = 13
  object dbeCidade: TDBEdit [0]
    Left = 16
    Top = 48
    Width = 339
    Height = 21
    Hint = 'Pesquisar < F2 >'
    Color = clBtnFace
    DataField = 'DESCRICAO'
    DataSource = dsPadrao
    ReadOnly = True
    TabOrder = 1
  end
  inherited pnButtons: TPanel
    Top = 110
    Width = 377
    ExplicitTop = 110
    ExplicitWidth = 377
    inherited btnVisualizar: TBitBtn
      OnClick = btnVisualizarClick
    end
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsCidade
    Left = 224
  end
  object sqldCidade: TSQLDataSet
    CommandText = 
      'select '#13#10'  CODCIDADE, '#13#10'  DESCRICAO '#13#10'from CIDADES'#13#10'order by DES' +
      'CRICAO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 128
    Top = 8
    object sqldCidadeCODCIDADE: TIntegerField
      FieldName = 'CODCIDADE'
      Required = True
    end
    object sqldCidadeDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 30
    end
  end
  object dspCidade: TDataSetProvider
    DataSet = sqldCidade
    Options = [poAllowCommandText]
    Left = 160
    Top = 8
  end
  object cdsCidade: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCidade'
    Left = 192
    Top = 8
    object cdsCidadeCODCIDADE: TIntegerField
      FieldName = 'CODCIDADE'
      Required = True
    end
    object cdsCidadeDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 30
    end
  end
end
