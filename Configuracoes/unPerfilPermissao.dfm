inherited frmPerfilPermissao: TfrmPerfilPermissao
  Left = 220
  ClientHeight = 452
  ClientWidth = 484
  Caption = 'frmPerfilPermissao'
  OldCreateOrder = True
  ExplicitWidth = 490
  ExplicitHeight = 481
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbStatus: TUniStatusBar
    Top = 433
    Width = 484
    ExplicitTop = 433
    ExplicitWidth = 484
  end
  inherited pnBotoesPadrao: TUniContainerPanel
    Width = 484
    ExplicitWidth = 484
  end
  object dbePerfil: TUniDBEdit [2]
    Left = 48
    Top = 51
    Width = 409
    Height = 22
    Hint = ''
    ShowHint = True
    DataField = 'PERFIL'
    DataSource = dsPadrao
    TabOrder = 2
  end
  object grpItemMenu: TUniGroupBox [3]
    Left = 8
    Top = 88
    Width = 468
    Height = 337
    Hint = ''
    ShowHint = True
    Caption = 'Itens do menu'
    TabOrder = 3
    TabStop = False
    object edtBuscaItemMenu: TUniEdit
      Left = 208
      Top = 13
      Width = 257
      Hint = ''
      ShowHint = True
      Text = 'Busca item do menu...'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      TabOrder = 1
      ClearButton = True
      OnChange = edtBuscaItemMenuChange
      OnExit = edtBuscaItemMenuExit
      OnEnter = edtBuscaItemMenuEnter
    end
    object dbgPerm: TUniDBGrid
      Left = 2
      Top = 46
      Width = 464
      Height = 289
      Hint = ''
      ShowHint = True
      DataSource = dsPerfisConf
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgConfirmDelete, dgTabs, dgCancelOnExit, dgAutoRefreshRow]
      LoadMask.Message = 'Loading data...'
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 0
      ParentColor = False
      Color = clWindow
      OnCellContextClick = dbgPermCellContextClick
      Columns = <
        item
          FieldName = 'ACAO_NOME'
          Title.Caption = 'ACAO_NOME'
          Width = 180
          Font.Charset = ANSI_CHARSET
        end
        item
          FieldName = 'ACAO_CAPTION'
          Title.Caption = 'ACAO_CAPTION'
          Width = 150
          Font.Charset = ANSI_CHARSET
        end
        item
          FieldName = 'LIBERADO'
          Title.Caption = 'LIBERADO'
          Width = 80
          Font.Charset = ANSI_CHARSET
          Alignment = taLeftJustify
          CheckBoxField.BooleanFieldOnly = False
          CheckBoxField.FieldValues = 'S;N'
        end>
    end
  end
  inherited actlNavigateActions: TActionList
    Left = 72
    Top = 148
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 343
    Top = 212
  end
  object sqldPadrao: TSQLDataSet
    CommandText = 'select * from PERFIL'
    MaxBlobSize = -1
    Params = <>
    Left = 72
    Top = 220
    object sqldPadraoIDPERFIL: TIntegerField
      FieldName = 'IDPERFIL'
      Required = True
    end
    object sqldPadraoPERFIL: TStringField
      FieldName = 'PERFIL'
      Size = 30
    end
  end
  object dspPadrao: TDataSetProvider
    DataSet = sqldPadrao
    Left = 168
    Top = 220
  end
  object cdsPadrao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 264
    Top = 212
    object cdsPadraoIDPERFIL: TIntegerField
      FieldName = 'IDPERFIL'
      Required = True
    end
    object cdsPadraoPERFIL: TStringField
      FieldName = 'PERFIL'
      Size = 30
    end
    object cdsPadraosqldPerfisConf: TDataSetField
      FieldName = 'sqldPerfisConf'
    end
  end
  object sqldPerfisConf: TSQLDataSet
    CommandText = 
      'select * from ITEMPERFIL'#13#10'where IDPERFIL = :IDPERFIL'#13#10'order by A' +
      'CAO_CAPTION'
    DataSource = dsLigaPerfis
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'IDPERFIL'
        ParamType = ptInput
        Size = 4
      end>
    Left = 56
    Top = 293
    object sqldPerfisConfIDITEMPERFIL: TIntegerField
      FieldName = 'IDITEMPERFIL'
      Required = True
    end
    object sqldPerfisConfIDPERFIL: TIntegerField
      FieldName = 'IDPERFIL'
      Required = True
    end
    object sqldPerfisConfACAO_NOME: TStringField
      FieldName = 'ACAO_NOME'
      Size = 80
    end
    object sqldPerfisConfACAO_CAPTION: TStringField
      FieldName = 'ACAO_CAPTION'
      Size = 80
    end
    object sqldPerfisConfLIBERADO: TStringField
      FieldName = 'LIBERADO'
      FixedChar = True
      Size = 1
    end
  end
  object cdsPerfisConf: TClientDataSet
    Aggregates = <>
    DataSetField = cdsPadraosqldPerfisConf
    Params = <>
    Left = 240
    Top = 293
    object cdsPerfisConfIDITEMPERFIL: TIntegerField
      FieldName = 'IDITEMPERFIL'
      Required = True
    end
    object cdsPerfisConfIDPERFIL: TIntegerField
      FieldName = 'IDPERFIL'
      Required = True
    end
    object cdsPerfisConfACAO_NOME: TStringField
      FieldName = 'ACAO_NOME'
      Size = 80
    end
    object cdsPerfisConfACAO_CAPTION: TStringField
      FieldName = 'ACAO_CAPTION'
      Size = 80
    end
    object cdsPerfisConfLIBERADO: TStringField
      FieldName = 'LIBERADO'
      FixedChar = True
      Size = 1
    end
  end
  object dsLigaPerfis: TDataSource
    DataSet = sqldPadrao
    Left = 144
    Top = 293
  end
  object dsPerfisConf: TDataSource
    DataSet = cdsPerfisConf
    Left = 327
    Top = 269
  end
  object Imagens: TImageList
    Left = 280
    Top = 148
    Bitmap = {
      494C010102000500040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000E9EDFC00BEBF
      EE00000000000000000000000000000000000000000000000000000000000000
      0000BEBFEE00E9EDFC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EDEEFA00424DD4000113
      CC009697E3000000000000000000000000000000000000000000000000009494
      E0000000C5004242CE00EDEEFA00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E5E5F7004352D8001447EE00164F
      F900071CD2009697E300000000000000000000000000000000009494E0000000
      CC000000F9000000EC004242CE00E5E5F7000000000000000000C9D8C9002E67
      2E00BECFBE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BFC3F0000322D2002263FC002263
      FC00164DF900071CD2009697E30000000000000000009697E300000BCE000000
      F9000000F9000000F9000000C500BEBFEE00000000000000000083A683000077
      0000156B1500B7C9B70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000969CE700092FD8002362
      F9002362F900164DF9000218D0009A9BE4009A9BE200000BCE000013F9000006
      FE000000F9000000CC009494E000000000000000000000000000417C410000AD
      000000AD0000116A11009EB79E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000969CE700072A
      D7002362F9002662FE00164DF9000218D0000218D000062AF8000421FE000013
      F9000000CC009494E000000000000000000000000000D7E3D7001678160000CC
      000000CC000000BD0000087208009EB79E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000969C
      E700072AD7002362F9002362F900164FF9001143FB000E3BFE00062AF800000B
      CE009697E300000000000000000000000000000000009DBD9D00039C030000DD
      000000DD000000DD000000CC0000008200008BAF8B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000969CE700072AD7002263FC002263FC001B53FE001143FB000218D0009A9B
      E200000000000000000000000000000000000000000068A0680000CC000000F3
      000000D5000000D5000000EE000000EE00000494040075A77500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000969CE700092FD8002E6BFE002E6BFE002662FE00164FF9000218D0009A9B
      E20000000000000000000000000000000000E5F2E5003399330000F3000000DD
      0000238D23003690360000AD000000E9000000FF000000AD000075A77500EFF6
      EF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000949E
      ED000B38DB003D81F9004583FE002E6BFE002662FE002662FE00164DF9000218
      D0009697E300000000000000000000000000BEDDBE000CB20C0008ED08002196
      2100CDE1CD00F7FAF70097C1970038A1380000BD00000AF50A000BBD0B0055A2
      5500EFF6EF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000949EED001043
      E0005092FB005C97FE003D81F900092FD800072AD7002362F9002362F900164D
      F9000218D0009697E30000000000000000008CC38C0017B8170023A32300C6DE
      C600000000000000000000000000E5F2E50097C697002AA12A001ACE1A001EBC
      1E004BA54B00E5F2E50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000096A4F000174EE40062A2
      FC0073AAFE005092FB000B38DB00969CE700969CE700072AD7002263FC002263
      FC00164DF900071CD2009697E3000000000038A1380018961800BEDDBE000000
      00000000000000000000000000000000000000000000EFF6EF008CC38C0035AE
      350018A618003BA03B00E5F2E500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BEC8F7000C49E70076B5FC008EBD
      FE0062A2FC001043E000949EED000000000000000000969CE700092FD8002362
      F9002662FE00164FF9000113CC00BEBFEE0031A13100B6DCB600000000000000
      000000000000000000000000000000000000000000000000000000000000E5F2
      E50083C6830021962100259D2500D0EBD0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E5E9FC004870ED00589AF70076B5
      FC00174EE400949EED0000000000000000000000000000000000969CE700072A
      D7002263FC001447EE004352D800E5E5F700E5F2E50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DCF0DC0079C87C004CB852000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EDF0FD00456EEC000D4A
      E60096A4F000000000000000000000000000000000000000000000000000969C
      E7000322D2004352D800EDEEFA00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E9EDFC00BEC8
      F700000000000000000000000000000000000000000000000000000000000000
      0000BFC3F000E9EDFC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00CFF3FFFF0000000087E1FFFF00000000
      03C0C7FF000000000180C3FF000000008001C1FF00000000C00380FF00000000
      E007807F00000000F00F803F00000000F00F000F00000000E007000700000000
      C0030E030000000080011F810000000001803FE00000000003C07FF800000000
      87E1FFFF00000000CFF3FFFF0000000000000000000000000000000000000000
      000000000000}
  end
  object pmLiberaBloqueia: TUniPopupMenu
    Left = 168
    Top = 140
    object miLiberar: TUniMenuItem
      Caption = 'Liberar todos'
      OnClick = miLiberarClick
    end
    object miBloquear: TUniMenuItem
      Caption = 'Bloquear todos'
      OnClick = miBloquearClick
    end
    object N5: TUniMenuItem
      Caption = '-'
    end
    object miCarregarAcoes: TUniMenuItem
      Caption = 'Carregar a'#231#245'es'
      OnClick = miCarregarAcoesClick
    end
  end
end
