inherited frmVendedor: TfrmVendedor
  Left = 264
  Height = 291
  Top = 173
  Width = 691
  Caption = 'frmVendedor'
  ClientHeight = 291
  ClientWidth = 691
  Font.Name = 'Verdana'
  inherited sbStatus: TStatusBar
    Top = 273
    Width = 691
  end
  inherited pnBotoesPadrao: TPanel
    Width = 691
    ClientWidth = 691
    inherited btnNovo: TSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnAlterar: TSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnExcluir: TSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnSalvar: TSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnCancelar: TSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnConsultar: TSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnSair: TSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnPrint: TSpeedButton
      Font.Name = 'Verdana'
    end
  end
  object dbeIdVendedor: TDBEdit[2]
    Left = 80
    Height = 33
    Top = 56
    Width = 97
    DataField = 'IDVENDEDOR'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object dbeVendedor: TDBEdit[3]
    Left = 80
    Height = 33
    Top = 90
    Width = 305
    DataField = 'VENDEDOR'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object dbcbAtivo: TDBCheckBox[4]
    Left = 88
    Height = 25
    Top = 128
    Width = 80
    Caption = 'Ativo'
    DataField = 'ATIVO'
    DataSource = dsPadrao
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    ValueChecked = 'S'
    ValueUnchecked = 'N'
  end
  inherited actlNavigateActions: TActionList[5]
    Left = 280
    Top = 152
  end
  inherited dsPadrao: TDataSource[6]
    DataSet = ZQuery1
    Left = 439
    Top = 60
  end
  object ZUpdateSQL1: TZUpdateSQL[7]
    UseSequenceFieldForRefreshSQL = False
    Left = 453
    Top = 160
  end
  object ZQuery1: TZQuery[8]
    Connection = DmPrincipal.ZConnection1
    UpdateObject = ZUpdateSQL1
    SQL.Strings = (
      'select * from VENDEDOR'
    )
    Params = <>
    Left = 567
    Top = 138
  end
end
