inherited frmPromocao: TfrmPromocao
  Left = 265
  Height = 537
  Top = 141
  Width = 983
  Caption = 'frmPromocao'
  ClientHeight = 537
  ClientWidth = 983
  Font.Name = 'Verdana'
  inherited sbStatus: TStatusBar
    Top = 519
    Width = 983
  end
  inherited pnBotoesPadrao: TPanel
    Width = 983
    ClientWidth = 983
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
  object dbgrdPromocao: TDBGrid[2]
    Left = 0
    Height = 455
    Top = 64
    Width = 983
    Align = alBottom
    Color = clWindow
    Columns = <>
    DataSource = dsPadrao
    Font.CharSet = ANSI_CHARSET
    Font.Name = 'Verdana'
    Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ShowHint = True
    TabOrder = 2
  end
  inherited actlNavigateActions: TActionList[3]
    Left = 128
    Top = 96
    inherited actPrint: TAction
      OnExecute = actPrintExecute
      ShortCut = 0
    end
  end
  inherited dsPadrao: TDataSource[4]
    DataSet = ZQuery1
    Left = 400
    Top = 160
  end
  object ZQuery1: TZQuery[5]
    Connection = DmPrincipal.ZConnection1
    UpdateObject = ZUpdateSQL1
    SQL.Strings = (
      'select * from PROMOCAO'
    )
    Params = <>
    Left = 625
    Top = 168
  end
  object ZUpdateSQL1: TZUpdateSQL[6]
    DeleteSQL.Strings = (
      'DELETE FROM PROMOCAO'
      'WHERE'
      '  PROMOCAO.CODIGO = :OLD_CODIGO'
    )
    InsertSQL.Strings = (
      'INSERT INTO PROMOCAO'
      '  (PRODUTO, DESCONTO, PRECO, INICIO, FIM)'
      'VALUES'
      '  (:PRODUTO, :DESCONTO, :PRECO, :INICIO, :FIM)'
    )
    ModifySQL.Strings = (
      'UPDATE PROMOCAO SET'
      '  PRODUTO = :PRODUTO,'
      '  DESCONTO = :DESCONTO,'
      '  PRECO = :PRECO,'
      '  INICIO = :INICIO,'
      '  FIM = :FIM'
      'WHERE'
      '  PROMOCAO.CODIGO = :OLD_CODIGO'
    )
    UseSequenceFieldForRefreshSQL = False
    Left = 498
    Top = 157
    ParamData = <    
      item
        DataType = ftUnknown
        Name = 'PRODUTO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'DESCONTO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'PRECO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'INICIO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'FIM'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'OLD_CODIGO'
        ParamType = ptUnknown
      end>
  end
end
