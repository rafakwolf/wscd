inherited frmRelatorioCRCliente: TfrmRelatorioCRCliente
  Caption = 'frmRelatorioCRCliente'
  ClientHeight = 136
  ClientWidth = 385
  OldCreateOrder = True
  ExplicitWidth = 401
  ExplicitHeight = 175
  PixelsPerInch = 96
  TextHeight = 13
  object dbeCliente: TDBEdit [0]
    Left = 16
    Top = 40
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
    Top = 102
    Width = 385
    ExplicitTop = 106
    ExplicitWidth = 393
    inherited btnVisualizar: TBitBtn
      OnClick = btnVisualizarClick
    end
  end
  inherited dsPadrao: TDataSource
    Left = 128
  end
end
