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
    Top = 96
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
    Top = 57
    Width = 121
    DataField = 'CODIGO'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object dbchkInativo: TDBCheckBox[4]
    Left = 56
    Height = 17
    Top = 152
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
  inherited actlNavigateActions: TActionList[5]
    Left = 104
    Top = 200
  end
  inherited dsPadrao: TDataSource[6]
    DataSet = ZQuery1
    Left = 408
    Top = 168
  end
  object ZQuery1: TZQuery[7]
    Connection = DmPrincipal.ZConnection1
    SQL.Strings = (
      'select * from CAIXAS'
    )
    Params = <>
    Left = 210
    Top = 184
  end
end
