inherited frmBanco: TfrmBanco
  Caption = 'frmBanco'
  ClientHeight = 156
  ClientWidth = 433
  OldCreateOrder = True
  ExplicitWidth = 439
  ExplicitHeight = 204
  PixelsPerInch = 96
  TextHeight = 13
  object dbeCodCompensacao: TPLDBEdit [0]
    Left = 96
    Top = 56
    Width = 105
    Height = 21
    Hint = 'C'#243'digo de compensa'#231#227'o'
    Ctl3D = True
    DataField = 'IDBANCO'
    DataSource = dsPadrao
    TabOrder = 0
    EditLabel.Left = 14
    EditLabel.Top = 60
    EditLabel.Width = 79
    EditLabel.Height = 13
    EditLabel.Alignment = taRightJustify
    EditLabel.Caption = 'C'#243'digo comp.'
    EditLabel.FocusControl = dbeCodCompensacao
    Button.Left = 202
    Button.Top = 55
    Button.Width = 0
    Button.Height = 0
    Button.Cursor = crArrow
    Button.Hint = 'Pesquisar <F2>'
    Button.Glyph.Data = {
      36060000424D3606000000000000360000002800000020000000100000000100
      18000000000000060000130B0000130B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF87CDA7
      10AD570EAD550EAD550EAD550EAD550EAD550EAD550EAD550EAD550EAD550EAD
      5510AD5787CDA7FF00FFFF00FFB9B9B981818180808080808080808080808080
      8080808080808080808080808080808080818181B9B9B9FF00FFFF00FF19B05D
      49D99A4ADFA251E0A555E1A755E1A755E1A755E1A755E1A755E1A751E0A54ADF
      A249D99A19B05DFF00FFFF00FF858585B5B5B5BBBBBBBEBEBEBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBEBEBEBBBBBBB5B5B5858585FF00FFFF00FF0EAD55
      2DCF6E15C95E14C95D14C95D14C95D14C95D14C95D14C75C10A44C12B35315C9
      5E2DCF6E0EAD55FF00FFFF00FF8080809F9F9F94949494949494949494949494
      94949494949292927878788383839494949F9F9F808080FF00FFFF00FF0EAD55
      2ACD6B13C85B13C85B13C65A11B55211AF5012B95418A851C7E9D47FDFA513C8
      5B2ACD6B0EAD55FF00FFFF00FF8080809D9D9D92929292929291919184848480
      80808787877D7D7DDEDEDEC2C2C29292929D9D9D808080FF00FFFF00FF0EAD55
      30D37B19CE6D19CB6B1FA85F72C7998ED4AE5BBC88C2E7D3D9F6E62CD27919CE
      6D30D37B0EAD55FF00FFFF00FF808080A6A6A69C9C9C9A9A9A828282AFAFAFC0
      C0C0A1A1A1DCDCDCEDEDEDA4A4A49C9C9CA6A6A6808080FF00FFFF00FF0EAD55
      35D98C1FD5802BBD78DFF3E9EDFBF4D2F7E6F7FDFAE9F6F033D1871FD5801FD5
      8035D98C0EAD55FF00FFFF00FF808080AFAFAFA6A6A6979797EDEDEDF7F7F7ED
      EDEDFBFBFBF2F2F2A8A8A8A6A6A6A6A6A6AFAFAF808080FF00FFFF00FF0EAD55
      39DD9923D98E9FDEC4DFF6ED30DB9523D98E52E1A6FAFDFC47CF9723D98E23D9
      8E39DD990EAD55FF00FFFF00FF808080B5B5B5ADADADCFCFCFF0F0F0B2B2B2AD
      ADADBFBFBFFCFCFCAEAEAEADADADADADADB5B5B5808080FF00FFFF00FF0EAD55
      3ADFA025DB96D0F0E396DDC225DB9625DB9625D894CCECE078E0B925DB9625DB
      963ADFA00EAD55FF00FFFF00FF808080B9B9B9B1B1B1E8E8E8CCCCCCB1B1B1B1
      B1B1AFAFAFE4E4E4C8C8C8B1B1B1B1B1B1B9B9B9808080FF00FFFF00FF0EAD55
      3CE0A427DD9ABAF0DCB8E3D321BD8423C88C2AB884EAF8F361E5B527DD9A27DD
      9A3CE0A40EAD55FF00FFFF00FF808080BBBBBBB4B4B4E3E3E3D9D9D99A9A9AA3
      A3A3989898F4F4F4C7C7C7B4B4B4B4B4B4BBBBBB808080FF00FFFF00FF0EAD55
      3DE1A828DE9E5DE6B6FFFFFFA9E2CE79D0B2CBEFE3D6F8EC2DDFA028DE9E28DE
      9E3DE1A80EAD55FF00FFFF00FF808080BDBDBDB6B6B6C8C8C8FFFFFFD5D5D5BD
      BDBDE7E7E7F0F0F0B7B7B7B6B6B6B6B6B6BDBDBD808080FF00FFFF00FF0EAD55
      3EE3AB29E0A229E0A265E9BCCDF8E9E1FBF2B1F4DD3BE3AA29E0A229E0A229E0
      A23EE3AB0EAD55FF00FFFF00FF808080BFBFBFB8B8B8B8B8B8CCCCCCEEEEEEF5
      F5F5E5E5E5BEBEBEB8B8B8B8B8B8B8B8B8BFBFBF808080FF00FFFF00FF0EAD55
      57E7B82CE1A62AE1A52AE1A52AE1A52AE1A52AE1A52AE1A52AE1A52AE1A52CE1
      A657E7B80EAD55FF00FFFF00FF808080C8C8C8BABABABABABABABABABABABABA
      BABABABABABABABABABABABABABABABABAC8C8C8808080FF00FFFF00FF1FB261
      A4E5C6D3F9ECD3F9ECD3F9ECD3F9ECD3F9ECD3F9ECD3F9ECD3F9ECD3F9ECD3F9
      ECA4E5C61FB261FF00FFFF00FF888888D4D4D4F0F0F0F0F0F0F0F0F0F0F0F0F0
      F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0D4D4D4888888FF00FFFF00FFAFE3C7
      30B86D0EAD550EAD550EAD550EAD550EAD550EAD550EAD550EAD550EAD550EAD
      5530B86DAFE3C7FF00FFFF00FFD5D5D591919180808080808080808080808080
      8080808080808080808080808080808080919191D5D5D5FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    Button.NumGlyphs = 2
    Button.ParentShowHint = False
    Button.ShowHint = True
    Button.Visible = False
    Button.AutoSize = True
    ReadOnlyChangesColor = False
  end
  object dbeBanco: TPLDBEdit [1]
    Left = 96
    Top = 82
    Width = 321
    Height = 21
    Hint = 'Nome do banco'
    Ctl3D = True
    DataField = 'BANCO'
    DataSource = dsPadrao
    TabOrder = 1
    EditLabel.Left = 58
    EditLabel.Top = 86
    EditLabel.Width = 35
    EditLabel.Height = 13
    EditLabel.Alignment = taRightJustify
    EditLabel.Caption = 'Banco'
    EditLabel.FocusControl = dbeBanco
    Button.Left = 418
    Button.Top = 81
    Button.Width = 0
    Button.Height = 0
    Button.Cursor = crArrow
    Button.Hint = 'Pesquisar <F2>'
    Button.Glyph.Data = {
      36060000424D3606000000000000360000002800000020000000100000000100
      18000000000000060000130B0000130B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF87CDA7
      10AD570EAD550EAD550EAD550EAD550EAD550EAD550EAD550EAD550EAD550EAD
      5510AD5787CDA7FF00FFFF00FFB9B9B981818180808080808080808080808080
      8080808080808080808080808080808080818181B9B9B9FF00FFFF00FF19B05D
      49D99A4ADFA251E0A555E1A755E1A755E1A755E1A755E1A755E1A751E0A54ADF
      A249D99A19B05DFF00FFFF00FF858585B5B5B5BBBBBBBEBEBEBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBEBEBEBBBBBBB5B5B5858585FF00FFFF00FF0EAD55
      2DCF6E15C95E14C95D14C95D14C95D14C95D14C95D14C75C10A44C12B35315C9
      5E2DCF6E0EAD55FF00FFFF00FF8080809F9F9F94949494949494949494949494
      94949494949292927878788383839494949F9F9F808080FF00FFFF00FF0EAD55
      2ACD6B13C85B13C85B13C65A11B55211AF5012B95418A851C7E9D47FDFA513C8
      5B2ACD6B0EAD55FF00FFFF00FF8080809D9D9D92929292929291919184848480
      80808787877D7D7DDEDEDEC2C2C29292929D9D9D808080FF00FFFF00FF0EAD55
      30D37B19CE6D19CB6B1FA85F72C7998ED4AE5BBC88C2E7D3D9F6E62CD27919CE
      6D30D37B0EAD55FF00FFFF00FF808080A6A6A69C9C9C9A9A9A828282AFAFAFC0
      C0C0A1A1A1DCDCDCEDEDEDA4A4A49C9C9CA6A6A6808080FF00FFFF00FF0EAD55
      35D98C1FD5802BBD78DFF3E9EDFBF4D2F7E6F7FDFAE9F6F033D1871FD5801FD5
      8035D98C0EAD55FF00FFFF00FF808080AFAFAFA6A6A6979797EDEDEDF7F7F7ED
      EDEDFBFBFBF2F2F2A8A8A8A6A6A6A6A6A6AFAFAF808080FF00FFFF00FF0EAD55
      39DD9923D98E9FDEC4DFF6ED30DB9523D98E52E1A6FAFDFC47CF9723D98E23D9
      8E39DD990EAD55FF00FFFF00FF808080B5B5B5ADADADCFCFCFF0F0F0B2B2B2AD
      ADADBFBFBFFCFCFCAEAEAEADADADADADADB5B5B5808080FF00FFFF00FF0EAD55
      3ADFA025DB96D0F0E396DDC225DB9625DB9625D894CCECE078E0B925DB9625DB
      963ADFA00EAD55FF00FFFF00FF808080B9B9B9B1B1B1E8E8E8CCCCCCB1B1B1B1
      B1B1AFAFAFE4E4E4C8C8C8B1B1B1B1B1B1B9B9B9808080FF00FFFF00FF0EAD55
      3CE0A427DD9ABAF0DCB8E3D321BD8423C88C2AB884EAF8F361E5B527DD9A27DD
      9A3CE0A40EAD55FF00FFFF00FF808080BBBBBBB4B4B4E3E3E3D9D9D99A9A9AA3
      A3A3989898F4F4F4C7C7C7B4B4B4B4B4B4BBBBBB808080FF00FFFF00FF0EAD55
      3DE1A828DE9E5DE6B6FFFFFFA9E2CE79D0B2CBEFE3D6F8EC2DDFA028DE9E28DE
      9E3DE1A80EAD55FF00FFFF00FF808080BDBDBDB6B6B6C8C8C8FFFFFFD5D5D5BD
      BDBDE7E7E7F0F0F0B7B7B7B6B6B6B6B6B6BDBDBD808080FF00FFFF00FF0EAD55
      3EE3AB29E0A229E0A265E9BCCDF8E9E1FBF2B1F4DD3BE3AA29E0A229E0A229E0
      A23EE3AB0EAD55FF00FFFF00FF808080BFBFBFB8B8B8B8B8B8CCCCCCEEEEEEF5
      F5F5E5E5E5BEBEBEB8B8B8B8B8B8B8B8B8BFBFBF808080FF00FFFF00FF0EAD55
      57E7B82CE1A62AE1A52AE1A52AE1A52AE1A52AE1A52AE1A52AE1A52AE1A52CE1
      A657E7B80EAD55FF00FFFF00FF808080C8C8C8BABABABABABABABABABABABABA
      BABABABABABABABABABABABABABABABABAC8C8C8808080FF00FFFF00FF1FB261
      A4E5C6D3F9ECD3F9ECD3F9ECD3F9ECD3F9ECD3F9ECD3F9ECD3F9ECD3F9ECD3F9
      ECA4E5C61FB261FF00FFFF00FF888888D4D4D4F0F0F0F0F0F0F0F0F0F0F0F0F0
      F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0D4D4D4888888FF00FFFF00FFAFE3C7
      30B86D0EAD550EAD550EAD550EAD550EAD550EAD550EAD550EAD550EAD550EAD
      5530B86DAFE3C7FF00FFFF00FFD5D5D591919180808080808080808080808080
      8080808080808080808080808080808080919191D5D5D5FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    Button.NumGlyphs = 2
    Button.ParentShowHint = False
    Button.ShowHint = True
    Button.Visible = False
    Button.AutoSize = True
    ReadOnlyChangesColor = False
  end
  inherited sbStatus: TStatusBar
    Top = 137
    Width = 433
    ExplicitTop = 137
    ExplicitWidth = 433
  end
  inherited pnBotoesPadrao: TPanel
    Width = 433
    TabOrder = 2
    ExplicitWidth = 433
  end
  inherited actlNavigateActions: TActionList
    Left = 32
    Top = 108
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 199
    Top = 108
  end
  inherited mmPadrao: TMainMenu
    Left = 64
    Top = 108
  end
  object sqldPadrao: TSQLDataSet
    CommandText = 'select * from BANCO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 104
    Top = 108
    object sqldPadraoIDBANCO: TIntegerField
      FieldName = 'IDBANCO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqldPadraoBANCO: TStringField
      FieldName = 'BANCO'
      Size = 80
    end
  end
  object dspPadrao: TDataSetProvider
    DataSet = sqldPadrao
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 136
    Top = 108
  end
  object cdsPadrao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 168
    Top = 108
    object cdsPadraoIDBANCO: TIntegerField
      FieldName = 'IDBANCO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '000'
    end
    object cdsPadraoBANCO: TStringField
      FieldName = 'BANCO'
      Size = 80
    end
  end
end
