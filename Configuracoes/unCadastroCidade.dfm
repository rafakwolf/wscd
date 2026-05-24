inherited frmCadastroCidade: TfrmCadastroCidade
  Left = 536
  Height = 308
  Top = 356
  Width = 599
  Caption = 'frmCadastroCidade'
  ClientHeight = 308
  ClientWidth = 599
  inherited sbStatus: TStatusBar
    Top = 290
    Width = 599
  end
  inherited pnBotoesPadrao: TPanel
    Width = 599
    ClientWidth = 599
    TabOrder = 2
  end
  object dbeNomeCidade: TDBEdit[2]
    Left = 32
    Height = 21
    Top = 120
    Width = 313
    DataField = 'DESCRICAO'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object dbeCodCidade: TDBEdit[3]
    Left = 32
    Height = 21
    Top = 72
    Width = 97
    DataField = 'CODCIDADE'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object Label1: TLabel[4]
    Left = 32
    Height = 16
    Top = 56
    Width = 43
    Caption = 'Código'
  end
  object Label2: TLabel[5]
    Left = 32
    Height = 16
    Top = 104
    Width = 36
    Caption = 'Nome'
  end
  inherited actlNavigateActions: TActionList[6]
    Left = 72
    Top = 176
  end
  inherited dsPadrao: TDataSource[7]
    DataSet = sqldPadrao
    Left = 320
    Top = 168
  end
  object sqldPadrao: TZQuery[8]
    Connection = DmPrincipal.ZConnection1
    SQL.Strings = (
      'select * from CIDADES'
    )
    Params = <>
    Left = 220
    Top = 168
  end
end
