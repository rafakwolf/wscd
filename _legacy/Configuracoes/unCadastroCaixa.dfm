inherited frmCadastroCaixa: TfrmCadastroCaixa
  Left = 331
  Height = 326
  Top = 179
  Width = 624
  Caption = 'frmCadastroCaixa'
  ClientHeight = 326
  ClientWidth = 624
  Font.Name = 'Verdana'
  inherited sbStatus: TStatusBar
    Top = 308
    Width = 624
  end
  inherited pnBotoesPadrao: TPanel
    Width = 624
    ClientWidth = 624
    TabOrder = 3
    inherited btnConsultar: TSpeedButton
      Left = 287
      Width = 65
    end
    inherited btnSair: TSpeedButton
      Left = 412
      Width = 53
    end
    inherited btnPrint: TSpeedButton
      Left = 353
      Width = 59
    end
  end
  object dbeNomeCaixa: TDBEdit[2]
    Left = 64
    Height = 21
    Top = 128
    Width = 305
    DataField = 'NOME'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object dbeCodCaixa: TDBEdit[3]
    Left = 64
    Height = 21
    Top = 72
    Width = 121
    DataField = 'CODIGO'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object dbchkInativo: TDBCheckBox[4]
    Left = 64
    Height = 17
    Top = 160
    Width = 87
    Caption = 'Inativo'
    DataField = 'INATIVO'
    DataSource = dsPadrao
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    ValueChecked = 'S'
    ValueUnchecked = 'N'
  end
  object Label1: TLabel[5]
    Left = 64
    Height = 16
    Top = 51
    Width = 45
    Caption = 'Código'
  end
  object Label2: TLabel[6]
    Left = 64
    Height = 16
    Top = 104
    Width = 101
    Caption = 'Nome da Conta'
  end
  inherited actlNavigateActions: TActionList[7]
    Left = 104
    Top = 200
  end
  inherited dsPadrao: TDataSource[8]
    DataSet = sqldPadrao
    Left = 336
    Top = 200
  end
  object sqldPadrao: TZQuery[9]
    Connection = DmPrincipal.ZConnection1
    SQL.Strings = (
      'select * from CAIXAS'
    )
    Params = <>
    Left = 248
    Top = 192
  end
end
