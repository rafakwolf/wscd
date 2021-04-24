inherited frmUsuarioItemMenu: TfrmUsuarioItemMenu
  Left = 241
  Height = 527
  Top = 108
  Width = 779
  Caption = 'frmUsuarioItemMenu'
  ClientHeight = 527
  ClientWidth = 779
  inherited sbStatus: TStatusBar
    Top = 509
    Width = 779
  end
  inherited pnBotoesPadrao: TPanel
    Width = 779
    ClientWidth = 779
  end
  object dbeSenha: TDBEdit[2]
    Left = 64
    Height = 33
    Top = 96
    Width = 121
    DataField = 'SENHA'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    PasswordChar = '*'
    ShowHint = True
    TabOrder = 4
  end
  object dbeLogin: TDBEdit[3]
    Left = 64
    Height = 33
    Top = 71
    Width = 209
    DataField = 'LOGIN'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object dbeNomeUsuario: TDBEdit[4]
    Left = 64
    Height = 33
    Top = 46
    Width = 361
    DataField = 'NOME'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object grpItemPermissao: TGroupBox[5]
    Left = 0
    Height = 371
    Top = 138
    Width = 779
    Align = alBottom
    Caption = 'Menu Principal'
    ClientHeight = 353
    ClientWidth = 777
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    object tvAcesso: TTreeView
      Left = 0
      Height = 353
      Top = 0
      Width = 777
      Align = alClient
      AutoExpand = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnDblClick = tvAcessoDblClick
      OnMouseDown = tvAcessoMouseDown
      Options = [tvoAutoExpand, tvoAutoItemHeight, tvoHideSelection, tvoKeepCollapsedNodes, tvoShowButtons, tvoShowLines, tvoShowRoot, tvoToolTips, tvoThemedDraw]
    end
  end
  inherited actlNavigateActions: TActionList[6]
    Left = 140
    Top = 364
  end
  inherited dsPadrao: TDataSource[7]
    DataSet = cdsPadrao
    Left = 327
    Top = 148
  end
  object sqldMenu: TSQLQuery[8]
    FieldDefs = <>
    Params = <>
    Left = 205
    Top = 328
    object sqldMenuIDMENU: TIntegerField
      FieldKind = fkData
      FieldName = 'IDMENU'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object sqldMenuMENUPAI: TIntegerField
      FieldKind = fkData
      FieldName = 'MENUPAI'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldMenuORDEM: TIntegerField
      FieldKind = fkData
      FieldName = 'ORDEM'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldMenuMENUITEM: TStringField
      FieldKind = fkData
      FieldName = 'MENUITEM'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
  end
  object ilStatusMenu: TImageList[9]
    Left = 237
    Top = 364
    Bitmap = {
      4C69020000001000000010000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000001DEEFF0A2EFFFF0C30
      FFFF0A2EFFFF0629FFFF0121FFFF001DEEFF001CDEFF001AD1FF0019CCFF0019
      CFFF0017B8FF0000000000000000000000000018CAFF5877FFFF7F98FFFF839C
      FFFF7690FFFF6582FFFF4A6BFFFF284CFFFF0E33FFFF0121FFFF001FF8FF001F
      FBFF001CE3FF0014A5FF00000000000000000018CAFF7F98FFFF728CFFFF5676
      FFFF4668FFFF3559FFFF2449FFFF163BFFFF0528FFFF001FF8FF001EF0FF001E
      F0FF001BD9FF001399FF00000000000000000018CAFF7690FFFF4163FFFF1B40
      FFFFFFFFFFFFFFFFFFFF4B64FFFF0427FFFFBEC6FFFFFFFFFFFF9BA6F6FF001C
      E6FF0018C7FF001187FF00000000000000000018CAFF6783FFFF2D51FFFF1338
      FFFF7B8EFFFFFFFFFFFFBEC6FFFF001FF8FFFFFFFFFFBEC5F9FF001CDEFF001B
      D9FF0017BDFF000F79FF00000000000000000018CAFF5A79FFFF2146FFFF082C
      FFFF0121FFFFBEC6FBFFFFFFFFFF9BA7F7FFFFFFFFFF001BD9FF0019CFFF0019
      CCFF0016B1FF000D6AFF00000000000000000018CAFF4E6EFFFF193FFFFF0427
      FFFF001FFBFF001DEEFFFFFFFFFFFFFFFFFF9BA6EEFF0019CCFF0018C2FF0018
      C0FF0014A3FF000B59FF00000000000000000018CAFF3559FFFF0F35FFFF0121
      FFFF001FF6FF485CEDFFFFFFFFFFFFFFFFFF9BA5EAFF0018C2FF0017B8FF0016
      B6FF00139CFF000A51FF00000000000000000018CAFF163BFFFF0629FFFF001F
      F6FF001CE3FFDEE2FAFFFFFFFFFF9BA5E9FFFFFFFFFF4858C9FF0015ACFF0016
      AFFF001399FF000A4FFF00000000000000000018CAFF0224FFFF001FF6FF001C
      E3FF9BA6EEFFFFFFFFFF9BA5E7FF4858CEFFFFFFFFFFDEE1F4FF0015A7FF0016
      AFFF001399FF000A4FFF00000000000000000018C7FF001EF0FF001CE1FF001A
      D1FFFFFFFFFFFFFFFFFF0016B6FF0016AFFFBEC4E9FFFFFFFFFFBEC3E8FF0016
      AFFF001399FF000A51FF00000000000000000017B8FF001CE3FF001AD4FF0019
      CCFF0018C5FF0017BBFF0016B1FF0016AFFF0016AFFF0016AFFF0016AFFF0016
      B6FF00139EFF000A4FFF0000000000000000001397FF0017BBFF0016B4FF0015
      AAFF0013A0FF001399FF001397FF001397FF001399FF001399FF001397FF0013
      9EFF000F7BFF000840FF000000000000000000000000000D6CFF000D68FF000C
      5DFF000A53FF000A4FFF000A4FFF000A4FFF000A4FFF000A4FFF000A4FFF000A
      4FFF000840FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000022A940FF37B555FF39B5
      56FF37B554FF33B250FF2AAF49FF21AA40FF1AA639FF13A431FF12A132FF12A4
      31FF0C9A23FF00000000000000000000000011A12FFF79D79FFF99E1B6FF9DE2
      B8FF93DEB1FF83DAA5FF6DD395FF4FC97EFF35BF68FF24B759FF20B555FF1FB8
      58FF18AD43FF098E16FF000000000000000011A130FF99E1B5FF90DDADFF78D5
      9AFF6CD091FF5DCB86FF4CC678FF3FC16DFF2CBA5DFF20B553FF1DB251FF1CB5
      4FFF15A93DFF088414FF000000000000000011A12FFF93DEB1FF66CF8CFFFFFF
      FFFFCEEFDAFF34BD64FF2CBA5DFF67CC8AFFFFFFFFFFE2F5E8FF19B048FF17B1
      42FF10A12FFF06760FFF000000000000000011A12FFF86DAA6FF54C97FFFFFFF
      FFFFE5F6EBFF28B859FF23B555FFA8E2BBFFFFFFFFFF81D499FF15AD3BFF12AF
      35FF0D9E25FF056B0CFF000000000000000011A12FFF7DD79FFF4AC576FFCAEE
      D6FFFFFFFFFF5DC881FF1CB24EFFC5EBD1FFFFFFFFFF13AC37FF0FA92DFF0DAC
      27FF09991BFF035F09FF000000000000000011A12FFF70D497FF42C270FF8BD8
      A5FFFFFFFFFFA6E1B9FF18B047FFFFFFFFFFC3EACCFF0FA92CFF0BA623FF09A9
      1CFF059311FF025405FF000000000000000011A12FFF5CCC88FF38BD67FF24B7
      57FFE2F5E8FFC4EBCFFF7ED293FFFFFFFFFF7BD08AFF0BA521FF08A119FF05A7
      12FF03910BFF014D04FF000000000000000011A12FFF3EC270FF2DBA5FFF1FB5
      4EFFA5DFB5FFFFFFFFFFA1DDADFFFFFFFFFF0AA41EFF06A016FF049E0FFF03A4
      0CFF03900AFF014C04FF000000000000000011A12FFF28B85BFF1FB24CFF18AD
      3DFF55C26EFFFFFFFFFFFFFFFFFFC0E8C5FF05A013FF039F0DFF039D0BFF03A5
      0CFF03900AFF014C04FF000000000000000010A02DFF1CB449FF16AD39FF11A9
      2FFF0DA726FFDFF3E2FFFFFFFFFF4BBA53FF039E0CFF039D0BFF039C0BFF03A4
      0CFF03900AFF014D04FF00000000000000000D9825FF13B53AFF0FAF2DFF0CAC
      23FF09AB1CFF06A715FF04A50EFF03A50CFF03A50CFF03A50CFF03A40CFF03AC
      0DFF03960AFF014C04FF0000000000000000078216FF0C9C23FF099A1DFF0796
      15FF05920FFF03900BFF038F0AFF038F0AFF03900AFF03900AFF038F0AFF0396
      0BFF027407FF013D03FF000000000000000000000000046209FF035F09FF0356
      06FF014F04FF014C04FF014C04FF014C04FF014C04FF014C04FF014C04FF014C
      04FF013D03FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000
    }
  end
  object sqldLimpaAcessoUsuario: TSQLQuery[10]
    FieldDefs = <>
    Params = <    
      item
        DataType = ftInteger
        Name = 'IDUSUARIOS'
        ParamType = ptInput
      end>
    Left = 140
    Top = 328
  end
  object sqldInsereAcesso: TSQLQuery[11]
    FieldDefs = <>
    Params = <    
      item
        DataType = ftInteger
        Name = 'IDUSUARIOS'
        ParamType = ptInput
      end    
      item
        DataType = ftInteger
        Name = 'IDMENU'
        ParamType = ptInput
      end>
    Left = 172
    Top = 328
  end
  object dsAcesso: TDataSource[12]
    DataSet = cdsAcesso
    Left = 311
    Top = 208
  end
  object sqldPadrao: TSQLQuery[13]
    FieldDefs = <>
    Params = <>
    Left = 128
    Top = 156
  end
  object dspPadrao: TTimer[14]
    Left = 160
    Top = 156
  end
  object cdsPadrao: TMemDataset[15]
    FieldDefs = <>
    AfterInsert = cdsPadraoAfterInsert
    AfterCancel = cdsPadraoAfterCancel
    AfterScroll = cdsPadraoAfterScroll
    Left = 288
    Top = 148
    object cdsPadraoIDUSUARIOS: TIntegerField
      FieldKind = fkData
      FieldName = 'IDUSUARIOS'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object cdsPadraoNOME: TStringField
      FieldKind = fkData
      FieldName = 'NOME'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoLOGIN: TStringField
      FieldKind = fkData
      FieldName = 'LOGIN'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
    object cdsPadraoSENHA: TStringField
      FieldKind = fkData
      FieldName = 'SENHA'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      OnGetText = cdsPadraoSENHAGetText
      OnSetText = cdsPadraoSENHASetText
      Size = 10
    end
  end
  object sqldAcesso: TSQLQuery[16]
    FieldDefs = <>
    Params = <    
      item
        DataType = ftInteger
        Name = 'IDUSUARIOS'
        ParamType = ptInput
      end>
    Left = 120
    Top = 208
  end
  object dspAcesso: TTimer[17]
    Left = 152
    Top = 216
  end
  object cdsAcesso: TMemDataset[18]
    Tag = 1
    FieldDefs = <>
    Left = 280
    Top = 208
    object cdsAcessoIDMENU: TIntegerField
      FieldKind = fkData
      FieldName = 'IDMENU'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
  end
  object pmStatusMenu: TPopupMenu[19]
    Left = 205
    Top = 364
    object mniLiberado: TMenuItem
      Caption = 'Liberado'
      ImageIndex = 1
      OnClick = mniLiberadoClick
    end
    object mniBloqueado: TMenuItem
      Caption = 'Bloqueado'
      ImageIndex = 0
      OnClick = mniBloqueadoClick
    end
  end
end
