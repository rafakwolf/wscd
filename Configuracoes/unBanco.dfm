inherited frmBanco: TfrmBanco
  Left = 397
  Height = 282
  Top = 185
  Width = 640
  Caption = 'frmBanco'
  ClientHeight = 282
  ClientWidth = 640
  OnShow = FormShow
  inherited sbStatus: TStatusBar
    Top = 264
    Width = 640
  end
  inherited pnBotoesPadrao: TPanel
    Width = 640
    ClientWidth = 640
    TabOrder = 2
  end
  object dbeCodCompensacao: TDBEdit[2]
    Left = 96
    Height = 21
    Hint = 'Código de compensação'
    Top = 72
    Width = 105
    DataField = 'IDBANCO'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object dbeBanco: TDBEdit[3]
    Left = 96
    Height = 21
    Hint = 'Nome do banco'
    Top = 128
    Width = 321
    DataField = 'BANCO'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object Label1: TLabel[4]
    Left = 98
    Height = 16
    Top = 49
    Width = 43
    Caption = 'Código'
  end
  object Label2: TLabel[5]
    Left = 98
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
    Left = 304
    Top = 168
  end
  object sqldPadrao: TZQuery[8]
    Connection = DmPrincipal.ZConnection1
    SQL.Strings = (
      'select * from BANCO'
    )
    Params = <>
    Left = 216
    Top = 160
  end
end
