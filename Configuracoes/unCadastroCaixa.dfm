inherited frmCadastroCaixa: TfrmCadastroCaixa
  Left = 331
  Top = 179
  Width = 624
  Caption = 'frmCadastroCaixa'
  ClientWidth = 624
  Font.Name = 'Verdana'
  inherited sbStatus: TStatusBar
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
    Height = 33
    Top = 96
    Width = 305
    DataField = 'NOME'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object dbeCodCaixa: TDBEdit[3]
    Left = 64
    Height = 33
    Top = 57
    Width = 121
    DataField = 'CODIGO'
    DataSource = dsPadrao
    CharCase = ecNormal
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
    Left = 144
    Top = 224
  end
  inherited dsPadrao: TDataSource[6]
    DataSet = ZQuery1
    Left = 456
    Top = 192
  end
  object ZQuery1: TZQuery[7]
    Connection = DmPrincipal.ZConnection1
    UpdateObject = ZUpdateSQL1
    SQL.Strings = (
      'select * from CAIXAS'
    )
    Params = <>
    Left = 210
    Top = 184
  end
  object ZUpdateSQL1: TZUpdateSQL[8]
    DeleteSQL.Strings = (
      'DELETE FROM CAIXAS'
      'WHERE'
      '  CAIXAS.CODIGO = :OLD_CODIGO'
    )
    InsertSQL.Strings = (
      'INSERT INTO CAIXAS'
      '  (NOME, INATIVO)'
      'VALUES'
      '  (:NOME, :INATIVO)'
    )
    ModifySQL.Strings = (
      'UPDATE CAIXAS SET'
      '  NOME = :NOME,'
      '  INATIVO = :INATIVO'
      'WHERE'
      '  CAIXAS.CODIGO = :OLD_CODIGO'
    )
    UseSequenceFieldForRefreshSQL = False
    Left = 304
    Top = 176
    ParamData = <    
      item
        DataType = ftUnknown
        Name = 'NOME'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'INATIVO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'OLD_CODIGO'
        ParamType = ptUnknown
      end>
  end
end
