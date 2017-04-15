inherited frmRelatorioVendaCliente: TfrmRelatorioVendaCliente
  Caption = 'frmRelatorioVendaCliente'
  ClientHeight = 111
  ClientWidth = 377
  OldCreateOrder = True
  ExplicitWidth = 393
  ExplicitHeight = 150
  PixelsPerInch = 96
  TextHeight = 13
  object dbeCliente: TDBEdit [0]
    Left = 16
    Top = 32
    Width = 339
    Height = 21
    Hint = 'Pesquisar < F2 >'
    Color = clBtnFace
    DataField = 'NOME'
    DataSource = dsPadrao
    ReadOnly = True
    TabOrder = 1
  end
  inherited pnButtons: TPanel
    Top = 77
    Width = 377
    ExplicitTop = 81
    ExplicitWidth = 385
    inherited btnVisualizar: TBitBtn
      OnClick = btnVisualizarClick
    end
  end
  inherited dsPadrao: TDataSource
    Left = 120
    Top = 2
  end
end
