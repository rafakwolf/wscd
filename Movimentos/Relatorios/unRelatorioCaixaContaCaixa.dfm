inherited frmRelatorioCaixaContaCaixa: TfrmRelatorioCaixaContaCaixa
  Left = 240
  Height = 261
  Top = 195
  Width = 508
  Caption = 'frmRelatorioCaixaContaCaixa'
  ClientHeight = 261
  ClientWidth = 508
  inherited pnButtons: TPanel
    Top = 227
    Width = 508
    ClientWidth = 508
  end
  object dbeCaixa: TDBEdit[1]
    Left = 24
    Height = 33
    Hint = 'Pesquisar < F2 >'
    Top = 40
    Width = 283
    DataField = 'NOME'
    DataSource = dsPadrao
    ReadOnly = True
    CharCase = ecNormal
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object dtpDataIni: TDBEdit[2]
    Left = 24
    Height = 33
    Top = 88
    Width = 145
    DataField = 'DATAINI'
    DataSource = dsData
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object dtpDataFim: TDBEdit[3]
    Left = 184
    Height = 33
    Top = 88
    Width = 145
    DataField = 'DATAFIM'
    DataSource = dsData
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  inherited dsPadrao: TDataSource[4]
    DataSet = cdsCaixa
    Left = 296
    Top = 8
  end
  object sqldCaixa: TSQLQuery[5]
    FieldDefs = <>
    Params = <>
    Left = 200
    Top = 8
  end
  object dspCaixa: TTimer[6]
    Left = 232
    Top = 8
  end
  object cdsCaixa: TMemDataset[7]
    FieldDefs = <>
    Left = 264
    Top = 8
    object cdsCaixaCODIGO: TIntegerField
      FieldKind = fkData
      FieldName = 'CODIGO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object cdsCaixaNOME: TStringField
      FieldKind = fkData
      FieldName = 'NOME'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
  end
  object dsData: TDataSource[8]
    Left = 144
    Top = 8
  end
end
