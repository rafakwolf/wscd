inherited frmConfigNota: TfrmConfigNota
  Left = 215
  Height = 450
  Top = 110
  Width = 650
  Caption = 'frmConfigNota'
  ClientHeight = 450
  ClientWidth = 650
  Font.Name = 'Verdana'
  inherited sbStatus: TStatusBar
    Top = 432
    Width = 650
  end
  inherited pnBotoesPadrao: TPanel
    Width = 650
    ClientWidth = 650
    inherited btnCancelar: TSpeedButton
      Left = 194
    end
    inherited btnConsultar: TSpeedButton
      Left = 322
      Width = 63
    end
    inherited btnSair: TSpeedButton
      Left = 421
    end
    inherited btnPrint: TSpeedButton
      Left = 255
      Hint = ''
      Action = nil
    end
    object btnGrade: TSpeedButton[8]
      Left = 388
      Height = 32
      Top = 1
      Width = 32
      Color = clWindow
      Font.CharSet = ANSI_CHARSET
      Font.Name = 'FontAwesome'
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000230B0000230B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFC8B3A4694731694731694731694731694731694731694731694731
        6947316947316947316947316947316947316947316947316947316947316947
        31694731694731FF00FFFF00FFC8B3A4F3EEEAB7A293B7A293B7A293B7A293B7
        A293B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7A293
        B7A293B7A293B7A293B7A293694731FF00FFFF00FFC8B3A4F5F0EDF3EEEAF2EB
        E7F0E9E4EEE6E1EDE4DFEBE2DCEADFD9E8DDD6E6DAD3E4D7D0E3D5CDE1D2C9DF
        CFC6DDCDC3DBCAC0DBC9BFDBC9BFDBC9BFB7A293694731FF00FFFF00FFC8B3A4
        F7F3F0CD741ECD741ECD741ECD741ECD741ECD741ECD741ECD741ECD741ECD74
        1ECD741ECD741ECD741ECD741ECD741ECD741ECD741EDBC9BFB7A293694731FF
        00FFFF00FFC8B3A4F8F5F3CD741EFEFEFDFEFEFDFEFEFDCD741EFEFEFDFEFEFD
        FEFEFDCD741EFEFEFDFEFEFDFEFEFDCD741EFEFEFDFEFEFDFEFEFDCD741EDBC9
        BFB7A293694731FF00FFFF00FFC8B3A4FAF8F6CD741EFEFEFDFEFEFDFEFEFDCD
        741EFEFEFDFEFEFDFEFEFDCD741EFEFEFDFEFEFDFEFEFDCD741EFEFEFDFEFEFD
        FEFEFDCD741EDBCAC0B7A293694731FF00FFFF00FFC8B3A4FDFCFBCD741EFEFE
        FDFEFEFDFEFEFDCD741EFEFEFDFEFEFDFEFEFDCD741EFEFEFDFEFEFDFEFEFDCD
        741EFEFEFDFEFEFDFEFEFDCD741EDDCDC3B7A293694731FF00FFFF00FFC8B3A4
        FEFEFDCD741ECD741ECD741ECD741ECD741ECD741ECD741ECD741ECD741ECD74
        1ECD741ECD741ECD741ECD741ECD741ECD741ECD741EDFCFC6B7A293694731FF
        00FFFF00FFC8B3A4FFFFFFCD741EFEFEFDFEFEFDFEFEFDCD741EFEFEFDFEFEFD
        FEFEFDCD741EFEFEFDFEFEFDFEFEFDCD741EFEFEFDFEFEFDFEFEFDCD741EE2D3
        CBB7A293694731FF00FFFF00FFC8B3A4FFFFFFCD741EFEFEFDFEFEFDFEFEFDCD
        741EFEFEFDFEFEFDFEFEFDCD741EFEFEFDFEFEFDFEFEFDCD741EFEFEFDFEFEFD
        FEFEFDCD741EE3D6CEB7A293694731FF00FFFF00FFC8B3A4FFFFFFCD741EFEFE
        FDFEFEFDFEFEFDCD741EFEFEFDFEFEFDFEFEFDCD741EFEFEFDFEFEFDFEFEFDCD
        741EFEFEFDFEFEFDFEFEFDCD741EE5D9D1B7A293694731FF00FFFF00FFC8B3A4
        FFFFFFCD741ECD741ECD741ECD741ECD741ECD741ECD741ECD741ECD741ECD74
        1ECD741ECD741ECD741ECD741ECD741ECD741ECD741EE7DBD4B7A293694731FF
        00FFFF00FFC8B3A4FFFFFFCD741EFEFEFDFEFEFDFEFEFDCD741EFEFEFDFEFEFD
        FEFEFDCD741EFEFEFDFEFEFDFEFEFDCD741EFEFEFDFEFEFDFEFEFDCD741EE9DE
        D7B7A293694731FF00FFFF00FFC8B3A4FFFFFFCD741EFEFEFDFEFEFDFEFEFDCD
        741EFEFEFDFEFEFDFEFEFDCD741EFEFEFDFEFEFDFEFEFDCD741EFEFEFDFEFEFD
        FEFEFDCD741EEBE1DBB7A293694731FF00FFFF00FFC8B3A4FFFFFFCD741EFEFE
        FDFEFEFDFEFEFDCD741EFEFEFDFEFEFDFEFEFDCD741EFEFEFDFEFEFDFEFEFDCD
        741EFEFEFDFEFEFDFEFEFDCD741EEDE4DFB7A293694731FF00FFFF00FFC8B3A4
        FFFFFFCD741ECD741ECD741ECD741ECD741ECD741ECD741ECD741ECD741ECD74
        1ECD741ECD741ECD741ECD741ECD741ECD741ECD741EEEE6E1B7A293694731FF
        00FFFF00FFC8B3A4FFFFFFCD741EFEFEFDFEFEFDFEFEFDCD741EFEFEFDFEFEFD
        FEFEFDCD741EFEFEFDFEFEFDFEFEFDCD741EFEFEFDFEFEFDFEFEFDCD741EF0E9
        E4B7A293694731FF00FFFF00FFC8B3A4FFFFFFCD741EFEFEFDFEFEFDFEFEFDCD
        741EFEFEFDFEFEFDFEFEFDCD741EFEFEFDFEFEFDFEFEFDCD741EFEFEFDFEFEFD
        FEFEFDCD741EF2EBE7B7A293694731FF00FFFF00FFC8B3A4FFFFFFCD741EFEFE
        FDFEFEFDFEFEFDCD741EFEFEFDFEFEFDFEFEFDCD741EFEFEFDFEFEFDFEFEFDCD
        741EFEFEFDFEFEFDFEFEFDCD741EF3EEEAB7A293694731FF00FFFF00FFC8B3A4
        FFFFFFCD741ECD741ECD741ECD741ECD741ECD741ECD741ECD741ECD741ECD74
        1ECD741ECD741ECD741ECD741ECD741ECD741ECD741EF5F0EDB7A293694731FF
        00FFFF00FFC8B3A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDFDFCFBFBF9F8F9F6F5F7F4
        F2F6F1EF694731FF00FFFF00FFC8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8
        B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4
        C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      }
      ShowHint = True
      ParentFont = False
      ParentShowHint = False
    end
  end
  object dbgrdCampos: TDBGrid[2]
    Left = 8
    Height = 337
    Top = 41
    Width = 293
    Color = clWindow
    Columns = <>
    DataSource = dsPadrao
    Enabled = False
    Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ShowHint = True
    TabOrder = 2
    OnDblClick = actEditExecute
  end
  inherited actlNavigateActions: TActionList[3]
    Left = 232
    Top = 236
  end
  inherited dsPadrao: TDataSource[4]
    AutoEdit = True
    DataSet = cdsPadrao
    Left = 338
    Top = 252
  end
  object sqldPadrao: TSQLQuery[5]
    FieldDefs = <>
    Params = <>
    Left = 347
    Top = 69
    object sqldPadraoCODIGO: TIntegerField
      FieldKind = fkData
      FieldName = 'CODIGO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object sqldPadraoCAMPO: TStringField
      FieldKind = fkData
      FieldName = 'CAMPO'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoLAYOUT: TStringField
      FieldKind = fkData
      FieldName = 'LAYOUT'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoREFERENCIA: TStringField
      FieldKind = fkData
      FieldName = 'REFERENCIA'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoTIPO: TStringField
      FieldKind = fkData
      FieldName = 'TIPO'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object sqldPadraoLINHA: TIntegerField
      FieldKind = fkData
      FieldName = 'LINHA'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoCOLUNA: TIntegerField
      FieldKind = fkData
      FieldName = 'COLUNA'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoIMPRIMIR: TStringField
      FieldKind = fkData
      FieldName = 'IMPRIMIR'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
  end
  object dspPadrao: TTimer[6]
    Left = 339
    Top = 141
  end
  object cdsPadrao: TMemDataset[7]
    FieldDefs = <>
    Left = 331
    Top = 197
    object cdsPadraoCODIGO: TIntegerField
      FieldKind = fkData
      FieldName = 'CODIGO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object cdsPadraoCAMPO: TStringField
      FieldKind = fkData
      FieldName = 'CAMPO'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoLAYOUT: TStringField
      FieldKind = fkData
      FieldName = 'LAYOUT'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoREFERENCIA: TStringField
      FieldKind = fkData
      FieldName = 'REFERENCIA'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoTIPO: TStringField
      FieldKind = fkData
      FieldName = 'TIPO'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object cdsPadraoLINHA: TIntegerField
      FieldKind = fkData
      FieldName = 'LINHA'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoCOLUNA: TIntegerField
      FieldKind = fkData
      FieldName = 'COLUNA'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoIMPRIMIR: TStringField
      FieldKind = fkData
      FieldName = 'IMPRIMIR'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
  end
  object pmMenuGrid: TPopupMenu[8]
    Left = 336
    Top = 316
    object miAlterarP: TMenuItem
      Action = actEdit
    end
    object miExcluirP: TMenuItem
      Action = actDelete
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object miSearchP: TMenuItem
      Action = actSearch
    end
  end
end
