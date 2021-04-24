inherited frmRelatorioComissaoVenda: TfrmRelatorioComissaoVenda
  Height = 282
  Width = 463
  Caption = 'frmRelatorioComissaoVenda'
  ClientHeight = 282
  ClientWidth = 463
  inherited pnButtons: TPanel
    Top = 248
    Width = 463
    ClientWidth = 463
    TabOrder = 3
  end
  object dbdtpDataFim: TDBEdit[1]
    Left = 16
    Height = 33
    Top = 104
    Width = 137
    DataField = 'DATAFIM'
    DataSource = dsData
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object dbdtpDataIni: TDBEdit[2]
    Left = 16
    Height = 33
    Top = 64
    Width = 137
    DataField = 'DATAINI'
    DataSource = dsData
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object dbeVendedor: TDBEdit[3]
    Left = 16
    Height = 33
    Hint = 'Pesquisar < F2 >'
    Top = 24
    Width = 299
    DataField = 'VENDEDOR'
    DataSource = dsPadrao
    ReadOnly = True
    CharCase = ecNormal
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  inherited dsPadrao: TDataSource[4]
    Left = 168
    Top = 56
  end
  object dsData: TDataSource[5]
    Left = 168
    Top = 88
  end
end
