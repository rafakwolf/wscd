inherited frmRelatorioCRAtraso: TfrmRelatorioCRAtraso
  Left = 381
  Top = 255
  Width = 496
  Caption = 'frmRelatorioCRAtraso'
  ClientWidth = 496
  inherited pnButtons: TPanel
    Width = 496
    ClientWidth = 496
  end
  object dbeCliente: TDBEdit[1]
    Left = 16
    Height = 21
    Hint = 'Pesquisar < F2 >'
    Top = 40
    Width = 355
    DataField = 'NOME'
    DataSource = dsPadrao
    ReadOnly = True
    Color = clBtnFace
    Enabled = False
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object Button1: TButton[2]
    Left = 384
    Height = 25
    Top = 36
    Width = 75
    Caption = 'Cliente'
    TabOrder = 2
    OnClick = dbeClienteClickButton
  end
  inherited dsPadrao: TDataSource[3]
    DataSet = sqldCliente
    Left = 368
    Top = 88
  end
  object sqldCliente: TZQuery[4]
    Connection = DmPrincipal.ZConnection1
    SQL.Strings = (
      'select CODCLIENTE, NOME from CLIENTES'
    )
    Params = <>
    Left = 249
    Top = 89
    object sqldClienteCODCLIENTE: TZIntegerField
      FieldKind = fkData
      FieldName = 'CODCLIENTE'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object sqldClienteNOME: TZRawStringField
      FieldKind = fkData
      FieldName = 'NOME'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
  end
end
