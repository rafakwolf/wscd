inherited frmUsuarioItemMenu: TfrmUsuarioItemMenu
  Left = 235
  Top = 150
  ClientHeight = 512
  ClientWidth = 475
  Caption = 'frmUsuarioItemMenu'
  OldCreateOrder = True
  Font.Name = 'Verdana'
  ExplicitWidth = 481
  ExplicitHeight = 541
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbStatus: TUniStatusBar
    Top = 493
    Width = 475
    ExplicitTop = 493
    ExplicitWidth = 475
  end
  inherited pnBotoesPadrao: TUniContainerPanel
    Width = 475
    ExplicitWidth = 475
    inherited btnNovo: TUniSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnAlterar: TUniSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnExcluir: TUniSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnSalvar: TUniSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnCancelar: TUniSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnConsultar: TUniSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnSair: TUniSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnPrint: TUniSpeedButton
      Font.Name = 'Verdana'
    end
  end
  object dbeSenha: TUniDBEdit [2]
    Left = 64
    Top = 96
    Width = 121
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'SENHA'
    DataSource = dsPadrao
    PasswordChar = '*'
    TabOrder = 4
  end
  object dbeLogin: TUniDBEdit [3]
    Left = 64
    Top = 71
    Width = 209
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'LOGIN'
    DataSource = dsPadrao
    TabOrder = 3
  end
  object dbeNomeUsuario: TUniDBEdit [4]
    Left = 64
    Top = 46
    Width = 361
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'NOME'
    DataSource = dsPadrao
    TabOrder = 2
  end
  object grpItemPermissao: TUniGroupBox [5]
    Left = 0
    Top = 122
    Width = 475
    Height = 371
    Hint = ''
    ShowHint = True
    Caption = 'Menu Principal'
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 5
    TabStop = False
    ExplicitTop = -249
    object tvAcesso: TTreeView
      Left = 2
      Top = 15
      Width = 471
      Height = 354
      Align = alClient
      AutoExpand = True
      Images = ilStatusMenu
      Indent = 19
      PopupMenu = pmStatusMenu
      ReadOnly = True
      ShowButtons = False
      TabOrder = 0
      ToolTips = False
      OnCollapsing = tvAcessoCollapsing
      OnDblClick = tvAcessoDblClick
      OnGetSelectedIndex = tvAcessoGetSelectedIndex
      OnMouseDown = tvAcessoMouseDown
    end
  end
  inherited actlNavigateActions: TActionList
    Left = 140
    Top = 364
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 327
    Top = 148
  end
  object sqldMenu: TSQLDataSet
    SchemaName = 'SYSDBA'
    CommandText = 
      'select '#13#10'  m.idmenu,'#13#10'  m.menupai,'#13#10'  m.ordem,'#13#10'  m.menuitem'#13#10'fr' +
      'om MENU m'#13#10'order by COALESCE(m.menupai,0), ORDEM'
    MaxBlobSize = -1
    Params = <>
    Left = 205
    Top = 328
    object sqldMenuIDMENU: TIntegerField
      FieldName = 'IDMENU'
      Required = True
    end
    object sqldMenuMENUPAI: TIntegerField
      FieldName = 'MENUPAI'
    end
    object sqldMenuORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
    object sqldMenuMENUITEM: TStringField
      FieldName = 'MENUITEM'
      Size = 80
    end
  end
  object ilStatusMenu: TImageList
    Left = 237
    Top = 364
    Bitmap = {
      494C010102000500200010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000D6C00000D
      6800000C5D00000A5300000A4F00000A4F00000A4F00000A4F00000A4F00000A
      4F00000A4F00000840000000000000000000000000000000000004620900035F
      090003560600014F0400014C0400014C0400014C0400014C0400014C0400014C
      0400014C0400013D030000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000001397000017BB000016
      B4000015AA000013A00000139900001397000013970000139900001399000013
      970000139E00000F7B00000840000000000000000000078216000C9C2300099A
      1D000796150005920F0003900B00038F0A00038F0A0003900A0003900A00038F
      0A0003960B0002740700013D0300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000017B800001CE300001A
      D4000019CC000018C5000017BB000016B1000016AF000016AF000016AF000016
      AF000016B60000139E00000A4F0000000000000000000D98250013B53A000FAF
      2D000CAC230009AB1C0006A7150004A50E0003A50C0003A50C0003A50C0003A4
      0C0003AC0D0003960A00014C0400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000018C700001EF000001C
      E100001AD100FFFFFF00FFFFFF000016B6000016AF00BEC4E900FFFFFF00BEC3
      E8000016AF0000139900000A5100000000000000000010A02D001CB4490016AD
      390011A92F000DA72600DFF3E200FFFFFF004BBA5300039E0C00039D0B00039C
      0B0003A40C0003900A00014D0400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000018CA000224FF00001F
      F600001CE3009BA6EE00FFFFFF009BA5E7004858CE00FFFFFF00DEE1F4000015
      A7000016AF0000139900000A4F00000000000000000011A12F0028B85B001FB2
      4C0018AD3D0055C26E00FFFFFF00FFFFFF00C0E8C50005A01300039F0D00039D
      0B0003A50C0003900A00014C0400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000018CA00163BFF000629
      FF00001FF600001CE300DEE2FA00FFFFFF009BA5E900FFFFFF004858C9000015
      AC000016AF0000139900000A4F00000000000000000011A12F003EC270002DBA
      5F001FB54E00A5DFB500FFFFFF00A1DDAD00FFFFFF000AA41E0006A01600049E
      0F0003A40C0003900A00014C0400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000018CA003559FF000F35
      FF000121FF00001FF600485CED00FFFFFF00FFFFFF009BA5EA000018C2000017
      B8000016B60000139C00000A5100000000000000000011A12F005CCC880038BD
      670024B75700E2F5E800C4EBCF007ED29300FFFFFF007BD08A000BA5210008A1
      190005A7120003910B00014D0400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000018CA004E6EFF00193F
      FF000427FF00001FFB00001DEE00FFFFFF00FFFFFF009BA6EE000019CC000018
      C2000018C0000014A300000B5900000000000000000011A12F0070D4970042C2
      70008BD8A500FFFFFF00A6E1B90018B04700FFFFFF00C3EACC000FA92C000BA6
      230009A91C000593110002540500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000018CA005A79FF002146
      FF00082CFF000121FF00BEC6FB00FFFFFF009BA7F700FFFFFF00001BD9000019
      CF000019CC000016B100000D6A00000000000000000011A12F007DD79F004AC5
      7600CAEED600FFFFFF005DC881001CB24E00C5EBD100FFFFFF0013AC37000FA9
      2D000DAC270009991B00035F0900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000018CA006783FF002D51
      FF001338FF007B8EFF00FFFFFF00BEC6FF00001FF800FFFFFF00BEC5F900001C
      DE00001BD9000017BD00000F7900000000000000000011A12F0086DAA60054C9
      7F00FFFFFF00E5F6EB0028B8590023B55500A8E2BB00FFFFFF0081D4990015AD
      3B0012AF35000D9E2500056B0C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000018CA007690FF004163
      FF001B40FF00FFFFFF00FFFFFF004B64FF000427FF00BEC6FF00FFFFFF009BA6
      F600001CE6000018C70000118700000000000000000011A12F0093DEB10066CF
      8C00FFFFFF00CEEFDA0034BD64002CBA5D0067CC8A00FFFFFF00E2F5E80019B0
      480017B1420010A12F0006760F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000018CA007F98FF00728C
      FF005676FF004668FF003559FF002449FF00163BFF000528FF00001FF800001E
      F000001EF000001BD90000139900000000000000000011A1300099E1B50090DD
      AD0078D59A006CD091005DCB86004CC678003FC16D002CBA5D0020B553001DB2
      51001CB54F0015A93D0008841400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000018CA005877FF007F98
      FF00839CFF007690FF006582FF004A6BFF00284CFF000E33FF000121FF00001F
      F800001FFB00001CE3000014A500000000000000000011A12F0079D79F0099E1
      B6009DE2B80093DEB10083DAA5006DD395004FC97E0035BF680024B7590020B5
      55001FB8580018AD4300098E1600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000001DEE000A2E
      FF000C30FF000A2EFF000629FF000121FF00001DEE00001CDE00001AD1000019
      CC000019CF000017B8000000000000000000000000000000000022A9400037B5
      550039B5560037B5540033B250002AAF490021AA40001AA6390013A4310012A1
      320012A431000C9A230000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000C003C00300000000
      8001800100000000800180010000000080018001000000008001800100000000
      8001800100000000800180010000000080018001000000008001800100000000
      8001800100000000800180010000000080018001000000008001800100000000
      C003C00300000000FFFFFFFF0000000000000000000000000000000000000000
      000000000000}
  end
  object sqldLimpaAcessoUsuario: TSQLDataSet
    SchemaName = 'USUARIOS'
    CommandText = 'delete from USUARIOSMENU'#13#10'where IDUSUARIOS = :IDUSUARIOS'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'IDUSUARIOS'
        ParamType = ptInput
      end>
    Left = 140
    Top = 328
  end
  object sqldInsereAcesso: TSQLDataSet
    SchemaName = 'USUARIOS'
    CommandText = 
      'insert into usuariosmenu'#13#10'(IDUSUARIOS, IDMENU)'#13#10'values'#13#10'(:IDUSUA' +
      'RIOS, :IDMENU)'
    MaxBlobSize = -1
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
  object dsAcesso: TDataSource
    DataSet = cdsAcesso
    Left = 311
    Top = 208
  end
  object sqldPadrao: TSQLDataSet
    CommandText = 
      'SELECT U.IDUSUARIOS, '#13#10'       U.NOME, '#13#10'       U.LOGIN, '#13#10'      ' +
      ' U.SENHA'#13#10'FROM USUARIOS U'
    MaxBlobSize = -1
    Params = <>
    Left = 128
    Top = 156
  end
  object dspPadrao: TDataSetProvider
    DataSet = sqldPadrao
    Options = [poPropogateChanges, poUseQuoteChar]
    Left = 160
    Top = 156
  end
  object cdsPadrao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    AfterInsert = cdsPadraoAfterInsert
    AfterCancel = cdsPadraoAfterCancel
    AfterScroll = cdsPadraoAfterScroll
    Left = 288
    Top = 148
    object cdsPadraoIDUSUARIOS: TIntegerField
      FieldName = 'IDUSUARIOS'
      Required = True
    end
    object cdsPadraoNOME: TStringField
      FieldName = 'NOME'
      Size = 80
    end
    object cdsPadraoLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 10
    end
    object cdsPadraoSENHA: TStringField
      FieldName = 'SENHA'
      OnGetText = cdsPadraoSENHAGetText
      OnSetText = cdsPadraoSENHASetText
      Size = 10
    end
  end
  object sqldAcesso: TSQLDataSet
    CommandText = 
      'select'#13#10'  distinct'#13#10'  um.IDMENU'#13#10'from usuariosmenu um'#13#10'where um.' +
      'idusuarios = :IDUSUARIOS'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'IDUSUARIOS'
        ParamType = ptInput
      end>
    Left = 120
    Top = 208
  end
  object dspAcesso: TDataSetProvider
    DataSet = sqldAcesso
    Options = [poPropogateChanges, poUseQuoteChar]
    Left = 152
    Top = 216
  end
  object cdsAcesso: TClientDataSet
    Tag = 1
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'IDUSUARIOS'
        ParamType = ptInput
      end>
    ProviderName = 'dspAcesso'
    Left = 280
    Top = 208
    object cdsAcessoIDMENU: TIntegerField
      FieldName = 'IDMENU'
      Required = True
    end
  end
  object pmStatusMenu: TUniPopupMenu
    Left = 205
    Top = 364
    object mniLiberado: TUniMenuItem
      Caption = 'Liberado'
      ImageIndex = 1
      OnClick = mniLiberadoClick
    end
    object mniBloqueado: TUniMenuItem
      Caption = 'Bloqueado'
      ImageIndex = 0
      OnClick = mniBloqueadoClick
    end
  end
end
