inherited frmRecibo: TfrmRecibo
  Left = 291
  Height = 381
  Top = 181
  Width = 789
  Caption = 'frmRecibo'
  ClientHeight = 381
  ClientWidth = 789
  Font.Name = 'Verdana'
  inherited sbStatus: TStatusBar
    Top = 363
    Width = 789
  end
  inherited pnBotoesPadrao: TPanel
    Width = 789
    ClientWidth = 789
    TabOrder = 5
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
  object lbRecebedor: TLabel[2]
    Left = 31
    Height = 16
    Top = 93
    Width = 68
    Caption = 'Recebedor'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbRefente: TLabel[3]
    Left = 36
    Height = 16
    Top = 177
    Width = 63
    Caption = 'Referente'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbValor: TLabel[4]
    Left = 66
    Height = 16
    Top = 221
    Width = 33
    Caption = 'Valor'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbValorExtenso: TLabel[5]
    Left = 10
    Height = 16
    Top = 297
    Width = 89
    Caption = 'Valor extenso'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object dbData: TDBEdit[6]
    Left = 108
    Height = 21
    Top = 46
    Width = 186
    DataField = 'DATA'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object dbRecebedor: TDBEdit[7]
    Left = 108
    Height = 21
    Top = 89
    Width = 500
    DataField = 'RECEBEDOR'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object dbValor: TDBEdit[8]
    Left = 108
    Height = 21
    Top = 217
    Width = 134
    DataField = 'VALOR'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnExit = dbValorExit
  end
  object dbReferente: TDBMemo[9]
    Left = 108
    Height = 65
    Top = 128
    Width = 500
    DataField = 'REFERENTE'
    DataSource = dsPadrao
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object dbValorExtenso: TDBMemo[10]
    Left = 108
    Height = 65
    Top = 255
    Width = 500
    DataField = 'VALOREXTENSO'
    DataSource = dsPadrao
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
  object lbData: TLabel[11]
    Left = 68
    Height = 16
    Top = 51
    Width = 31
    Caption = 'Data'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  inherited actlNavigateActions: TActionList[12]
    Left = 696
    Top = 40
    inherited actPrint: TAction
      ShortCut = 0
      OnExecute = actPrintExecute
    end
  end
  inherited dsPadrao: TDataSource[13]
    DataSet = sqldPadrao
    Left = 696
    Top = 104
  end
  object sqldPadrao: TZQuery[14]
    Connection = DmPrincipal.ZConnection1
    SQL.Strings = (
      'select * from RECIBO'
    )
    Params = <>
    Left = 696
    Top = 184
  end
end
