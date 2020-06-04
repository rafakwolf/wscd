inherited frmRelatorioVendaCliente: TfrmRelatorioVendaCliente
  ClientHeight = 111
  ClientWidth = 377
  Caption = 'frmRelatorioVendaCliente'
  OldCreateOrder = True
  ExplicitWidth = 393
  ExplicitHeight = 150
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnButtons: TContainerPanel
    Top = 77
    Width = 377
    ExplicitTop = 81
    ExplicitWidth = 385
  end
  object dbeCliente: TDBEdit [1]
    Left = 16
    Top = 32
    Width = 339
    Height = 21
    Hint = 'Pesquisar < F2 >'
    ShowHint = True
    DataField = 'NOME'
    DataSource = dsPadrao
    TabOrder = 1
    Color = clBtnFace
    ReadOnly = True
  end
  inherited dsPadrao: TDataSource
    Left = 120
    Top = 2
  end
end
