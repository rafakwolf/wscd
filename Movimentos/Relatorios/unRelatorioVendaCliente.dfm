inherited frmRelatorioVendaCliente: TfrmRelatorioVendaCliente
  Width = 404
  Caption = 'frmRelatorioVendaCliente'
  ClientWidth = 404
  inherited pnButtons: TPanel
    Width = 404
    ClientWidth = 404
  end
  object dbeCliente: TDBEdit[1]
    Left = 16
    Height = 33
    Hint = 'Pesquisar < F2 >'
    Top = 32
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
    Left = 120
    Top = 2
  end
end
