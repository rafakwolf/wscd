inherited frmRelatorioCRCliente: TfrmRelatorioCRCliente
  Width = 501
  Caption = 'frmRelatorioCRCliente'
  ClientWidth = 501
  inherited pnButtons: TPanel
    Width = 501
    ClientWidth = 501
  end
  object dbeCliente: TDBEdit[1]
    Left = 16
    Height = 33
    Hint = 'Pesquisar < F2 >'
    Top = 40
    Width = 339
    DataField = 'NOME'
    DataSource = dsPadrao
    ReadOnly = True
    CharCase = ecNormal
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  inherited dsPadrao: TDataSource[2]
    Left = 128
  end
end
