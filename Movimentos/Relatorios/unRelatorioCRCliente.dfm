inherited frmRelatorioCRCliente: TfrmRelatorioCRCliente
  ClientHeight = 136
  ClientWidth = 385
  Caption = 'frmRelatorioCRCliente'
  OldCreateOrder = True
  ExplicitWidth = 401
  ExplicitHeight = 175
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnButtons: TUniContainerPanel
    Top = 102
    Width = 385
    ExplicitTop = 102
    ExplicitWidth = 385
  end
  object dbeCliente: TUniDBEdit [1]
    Left = 16
    Top = 40
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
    Left = 128
  end
end
