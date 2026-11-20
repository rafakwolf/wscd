inherited frmRelatorioCPAtrasados: TfrmRelatorioCPAtrasados
  Left = 219
  Height = 269
  Top = 164
  Width = 400
  Caption = 'frmRelatorioCPAtrasados'
  ClientHeight = 269
  ClientWidth = 400
  inherited pnButtons: TPanel
    Top = 235
    Width = 400
    ClientWidth = 400
  end
  object dbeFornecedor: TDBEdit[1]
    Left = 16
    Height = 21
    Hint = 'Pesquisar < F2 >'
    Top = 48
    Width = 321
    DataField = 'FANTAZIA'
    DataSource = dsPadrao
    ReadOnly = True
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  inherited dsPadrao: TDataSource[2]
    DataSet = sqldForn
    Left = 240
  end
  object sqldForn: TSQLQuery[3]
    FieldDefs = <>
    Params = <>
    Macros = <>
    Left = 96
    Top = 96
  end
end
