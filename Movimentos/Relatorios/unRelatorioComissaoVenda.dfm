inherited frmRelatorioComissaoVenda: TfrmRelatorioComissaoVenda
  ClientHeight = 167
  ClientWidth = 345
  Caption = 'frmRelatorioComissaoVenda'
  OldCreateOrder = True
  ExplicitWidth = 361
  ExplicitHeight = 206
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnButtons: TPanel
    Top = 133
    Width = 345
    TabOrder = 3
    ExplicitTop = 133
    ExplicitWidth = 345
  end
  object dbdtpDataFim: TDBEdit [1]
    Left = 16
    Top = 104
    Width = 137
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'DATAFIM'
    DataSource = dsData
    TabOrder = 2
  end
  object dbdtpDataIni: TDBEdit [2]
    Left = 16
    Top = 64
    Width = 137
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'DATAINI'
    DataSource = dsData
    TabOrder = 1
  end
  object dbeVendedor: TDBEdit [3]
    Left = 16
    Top = 24
    Width = 299
    Height = 21
    Hint = 'Pesquisar < F2 >'
    ShowHint = True
    DataField = 'VENDEDOR'
    DataSource = dsPadrao
    TabOrder = 0
    Color = clBtnFace
    ReadOnly = True
  end
  inherited dsPadrao: TDataSource
    Left = 168
    Top = 56
  end
  object dsData: TDataSource
    Left = 168
    Top = 88
  end
end
