inherited frmBackup: TfrmBackup
  Left = 248
  Top = 151
  HelpContext = 114
  Caption = 'frmBackup'
  ClientHeight = 286
  ClientWidth = 425
  Font.Color = clBlack
  Font.Height = -12
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 441
  ExplicitHeight = 325
  PixelsPerInch = 96
  TextHeight = 14
  object Memo: TMemo
    Left = 8
    Top = 53
    Width = 417
    Height = 148
    Ctl3D = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object cbDiretorioPadrao: TCheckBox
    Left = 8
    Top = 208
    Width = 197
    Height = 17
    Hint = 'Fazer a c'#243'pia em um diretorio designado pelo sistema'
    Caption = 'Usar diret'#243'rio padr'#227'o do sistema'
    TabOrder = 1
    OnClick = cbDiretorioPadraoClick
  end
  object BtnOk: TBitBtn
    Left = 224
    Top = 232
    Width = 97
    Height = 33
    Hint = 'Processar c'#243'pia'
    Caption = '&Copiar'
    Glyph.Data = {
      760E0000424D760E000000000000360000002800000032000000180000000100
      180000000000400E0000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF00000E80AA0E80AA0E80AAFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0E80AA0E80AA0E80AA0E80AA0E
      80AA0E80AA0E80AA0E80AA0E80AA0E80AAFF00FFFF00FFFF00FFFF00FFFF00FF
      848484848484848484FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FF848484848484848484848484848484848484848484848484848484848484FF
      00FFFF00FFFF00FF00000E80AA3B9EC72894BE0E80AAFF00FFFF00FF25414DFF
      00FF204B5BFF00FF225B710E80AA5FADCF64AECF59ABCF0E80AA0E80AA4CA2C6
      5CA4C346A0C50E80AAFF00FFFF00FFFF00FFFF00FFFF00FF848484A8A8A89B9B
      9B848484FF00FFFF00FF606060FF00FF656565FF00FF717171848484BBBBBBBC
      BCBCB8B8B8848484848484AFAFAFB4B4B4ABABAB848484FF00FFFF00FFFF00FF
      00000E80AA53B5E053B5E01283AD0E80AA0E80AA46565D0E80AA607F8B0E80AA
      33525E0E80AAB4DDF1B4DDF1B4DDF10E80AA0E80AAA4D6EEA4D6EEA4D6EE0E80
      AAFF00FFFF00FFFF00FFFF00FFFF00FF848484BCBCBCBCBCBC87878784848484
      84847979798484849D9D9D848484707070848484D2D2D2D2D2D2D2D2D2848484
      848484C9C9C9C9C9C9C9C9C9848484FF00FFFF00FFFF00FF00000E80AA62BBE2
      62BBE2238FB89DCFE0777F82A5ACAF4B4D4E52879F3B3E4188C5DF0E80AAE3F2
      FAE3F2FAE3F2FA0E80AA0E80AAE6F3FAE6F3FAE6F3FA0E80AAFF00FFFF00FFFF
      00FFFF00FFFF00FF848484C4C4C4C4C4C4959595DCDCDCA4A4A4CBCBCB747474
      A0A0A0666666D2D2D2848484EEEEEEEEEEEEEEEEEE848484848484F0F0F0F0F0
      F0F0F0F0848484FF00FFFF00FFFF00FF00000E80AAA5D6EEA5D6EE51A6C8288E
      B43D40420E80AA202E340E80AA30505E0E80AA0E80AAAAD9EFAAD9EFAAD9EF0E
      80AA0E80AAB2DDF0B2DDF0B2DDF00E80AAFF00FFFF00FFFF00FFFF00FFFF00FF
      848484C9C9C9C9C9C9B1B1B19696966767678484844F4F4F8484846F6F6F8484
      84848484CCCCCCCCCCCCCCCCCC848484848484D1D1D1D1D1D1D1D1D1848484FF
      00FFFF00FFFF00FF00000E80AADEF0F8C2E1EE3294B80E80AA283F49FF00FF22
      4857FF00FF1F5F77FF00FF0E80AA78C4E678C4E65BB0D40E80AA0E80AA79C3E4
      7FC7E87FC7E80E80AAFF00FFFF00FFFF00FFFF00FFFF00FF848484EBEBEBD8D8
      D89D9D9D8484845F5F5FFF00FF646464FF00FF737373FF00FF848484CFCFCFAF
      AFAFBBBBBB848484848484CECECEB3B3B3D2D2D2848484FF00FFFF00FFFF00FF
      00000E80AA0E80AA0E80AA0E80AAFF00FFFF00FFFF00FFFF00FFFF00FF0E80AA
      0E80AA4CAAD15EB7DF3098C20E80AAFF00FFFF00FF1384AD44A7D060BAE2339A
      C30E80AAFF00FFFF00FFFF00FFFF00FF848484848484848484848484FF00FFFF
      00FFFF00FFFF00FFFF00FF848484848484B3B3B3C1C1C1A1A1A1848484FF00FF
      FF00FF888888B2B2B2C3C3C3A3A3A3848484FF00FFFF00FF0000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0E80AA2A90B785C6E378BFDE1C89
      B2FF00FFFF00FFFF00FFFF00FFFF00FF0E80AA3A9BC183C7E55AADCF0E80AAFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      848484989898DADADAD2D2D28F8F8FFF00FFFF00FFFF00FFFF00FFFF00FF8484
      84A5A5A5DCDCDCBCBCBC848484FF00FF0000FF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF0E80AAC9E6F4A3D2E60E80AAFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FF0E80AA2C91B7B4DCEEA2D1E60E80AAFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF848484F2F2F2E9E9
      E9848484FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF848484999999F9
      F9F9ECECEC8484840000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FF0E80AAF7FCFE82BED40E80AAFF00FFB78183B78183B78183B78183B78183
      B78183FF00FF0E80AABADBE8F3FAFD0E80AAFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF848484FDFDFDCBCBCB848484FF00FF9C
      9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9CFF00FF848484F9F9F9FEFEFE848484
      0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0E80AAEEF9FC
      7EBCD30E80AAFF00FFB78183FEECC6F5D9ABF3D29AF8DA9AB78183FF00FF0E80
      AAB7DBE8F0F9FC0E80AAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FF848484FAFAFAC9C9C9848484FF00FF9C9C9CE2E2E2D0D0D0
      C6C6C6C9C9C99C9C9CFF00FF848484F7F7F7FEFEFE8484840000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0E80AAE2F5FA78BAD20E80AAFF00
      FFB78183FBEACDF2D7B4EECEA0F5D599B78183FF00FF0E80AAAFD8E6E4F5FA0E
      80AAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      848484F7F7F7C6C6C6848484FF00FF9C9C9CE4E4E4D3D3D3C7C7C7C7C7C79C9C
      9CFF00FF848484F2F2F2FEFEFE8484840000FF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF0E80AAD7F1F873B8D10E80AAFF00FFB78183FCF0D7F4
      DDBDF0D4AAF5D69AB78183FF00FF0E80AAA6D5E5D9F1F80E80AAFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF848484F5F5F5C4C4
      C4848484FF00FF9C9C9CE9E9E9D8D8D8CDCDCDC7C7C79C9C9CFF00FF848484ED
      EDEDFFFFFF8484840000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FF0E80AAD2EFF770B8D10E80AAFF00FFBA8E85FEF3E0F5E1C7F2D8B4F6D9A3
      B78183FF00FF0E80AAA1D3E4D2EFF70E80AAFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF848484F4F4F4C2C2C2848484FF00FF9F
      9F9FEFEFEFDEDEDED3D3D3CCCCCC9C9C9CFF00FF848484EAEAEAFFFFFF848484
      0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0E80AAD2EFF7
      70B8D10E80AAFF00FFBA8E85FFF7EBF7E6D0F4DCBDF8DDADB78183FF00FF0E80
      AAA1D3E4D2EFF70E80AAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FF848484F4F4F4C2C2C2848484FF00FF9F9F9FF5F5F5E3E3E3
      D8D8D8D2D2D29C9C9CFF00FF848484EAEAEAFFFFFF8484840000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0E80AAD2EFF770B8D10E80AAFF00
      FFCB9A82FFFCF6F8EAD9F5E0C6FAE2B7B78183FF00FF0E80AAA1D3E4D2EFF70E
      80AAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      848484F4F4F4C7C7C7848484FF00FFA6A6A6FAFAFAE8E8E8DDDDDDD8D8D89C9C
      9CFF00FF848484EAEAEAFFFFFF8484840000FF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF0E80AA0E80AA70B8D10E80AAFF00FFDCA887FFFFFFFB
      EFE3F7E4D0FEE7C2B78183FF00FF0E80AAA1D3E40E80AA0E80AAFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF848484848484C7C7
      C7848484FF00FFB1B1B1FFFFFFEFEFEFE3E3E3E0E0E09C9C9CFF00FF848484EA
      EAEA8484848484840000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FF0E80AA0E80AAFF00FFDCA887FFFFFFFDF4EDFCEEDBF1E2C7
      B78183FF00FF0E80AA0E80AAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF848484848484FF00FFB1
      B1B1FFFFFFF5F5F5EBEBEBDCDCDC9C9C9CFF00FF848484848484FF00FFFF00FF
      0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFE3B18EFFFFFFFFFEFBF7E9DDCFB1A0B78183FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB8B8B8FFFFFFFDFDFD
      EAEAEAB7B7B79C9C9CFF00FFFF00FFFF00FFFF00FFFF00FF0000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFE3B18EFFFFFFFFFFFFB8857AB8857ABF8472FF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFB8B8B8FFFFFFFFFFFF9999999999999898
      98FF00FFFF00FFFF00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFEDBD92FFFFFFFF
      FFFFB8857ACE8E5DDE9F63FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFBFBFBFFFFFFFFFFFFF999999959595A0A0A0FF00FFFF00FFFF
      00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFEDBD92FCFCFCFFFFFFB8857AC28568
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBF
      BFBFFCFCFCFFFFFF999999959595FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFEDBD92DCA887DCA887B8857AFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBFB1B1B1B1B1B1
      999999FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = BtnOkClick
  end
  object BtnCancela: TBitBtn
    Left = 328
    Top = 232
    Width = 97
    Height = 33
    Hint = 'Cancela opera'#231#227'o'
    Caption = '&Fechar'
    Glyph.Data = {
      760B0000424D760B000000000000360000002800000028000000180000000100
      180000000000400B0000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B4E1E1FFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080767676FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FF824B4B824B4B8C4B4B914B4B4E1E1FFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      949494949494848484868686767676FF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B824B4B894B4B9C4B4CB64B4CBD
      4B4C9F4B4C4E1E1FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FF9494949494949797978B8B8B9696969999
      998C8C8C767676FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FF824B4B824B4B9A4D4EAF4E4FC14E4FC04D4EBF4C4DBF4C4D9F4B4C4E1E1F
      994B4B824B4B824B4B824B4B824B4B824B4B824B4B824B4B824B4BFF00FFFF00
      FF9494949494948B8B8B9494949C9C9C9B9B9B9A9A9A9A9A9A8C8C8C7676769D
      9D9D949494949494949494949494949494949494949494949494824B4BC55455
      C95455C75354C65253C55152C45051C24F50A04C4D4E1E1FFE8B8CFC9293FB9A
      9CFAA3A4F8AAABF7B1B1F7B5B6F7B5B6824B4BFF00FFFF00FF949494A0A0A0A2
      A2A2A1A1A1A0A0A09F9F9F9E9E9E9D9D9D8D8D8D767676D0D0D0D2D2D2D5D5D5
      D8D8D8DBDBDBDDDDDDDFDFDFDFDFDF949494824B4BCE5859CC5758CB5657CA55
      56C95455C75354C65253A34E4F4E1E1F3F9E4C1EBC4C1EBC4C1EBC4C1EBC4C1E
      BC4C1EBC4CF7B5B6824B4BFF00FFFF00FF949494A6A6A6A5A5A5A4A4A4A3A3A3
      A2A2A2A1A1A1A0A0A08F8F8F7676769999999393939393939393939393939393
      93939393DFDFDF949494824B4BD15B5CD05A5BCF595ACE5859CC5758CB5657CA
      5556A550504E1E1F3F9E4C1EBC4C1EBC4C1EBC4C1EBC4C1EBC4C1EBC4CF7B5B6
      824B4BFF00FFFF00FF949494A9A9A9A8A8A8A7A7A7A6A6A6A5A5A5A4A4A4A3A3
      A3919191767676999999939393939393939393939393939393939393DFDFDF94
      9494824B4BD55E5FD55E5FD45D5ED35C5DD15B5CD05A5BCF595AA651524E1E1F
      3F9E4C1EBC4C1EBC4C1EBC4C1EBC4C1EBC4C1EBC4CF7B5B6824B4BFF00FFFF00
      FF949494ACACACACACACABABABAAAAAAA9A9A9A8A8A8A7A7A792929276767698
      9898939393939393939393939393939393939393DFDFDF949494824B4BDA6364
      D96263D86062D75F60D55E5FD45D5ED35C5DA953544E1E1F3F9E4C1EBC4C1EBC
      4C1EBC4C1EBC4C1EBC4C1EBC4CF7B5B6824B4BFF00FFFF00FF949494B0B0B0AF
      AFAFAEAEAEADADADACACACABABABAAAAAA949494767676989898939393939393
      939393939393939393939393DFDFDF949494824B4BDE6667DD6566DC6465DA63
      64D96263D86062D75F60AB55554E1E1F3F9E4C1EBC4C1EBC4C1EBC4C1EBC4C1E
      BC4C1EBC4CF7B5B6824B4BFF00FFFF00FF949494B3B3B3B2B2B2B1B1B1B0B0B0
      AFAFAFAEAEAEADADAD9696967676769898989393939393939393939393939393
      93939393DFDFDF949494824B4BE2696AE16869E06768DE6667E06D6EE69091DC
      6465AC56574E1E1F58A55B1EBC4C1EBC4C1EBC4C1EBC4C1EBC4C1EBC4CF7B5B6
      824B4BFF00FFFF00FF949494B6B6B6B5B5B5B4B4B4B3B3B3B7B7B7C9C9C9B1B1
      B1979797767676A6A6A6939393939393939393939393939393939393DFDFDF94
      9494824B4BE76D6EE66C6DE56B6CE36A6BEEA6A7FFFFFFEB9C9CAF58594E1E1F
      EECEAFB7EBAA5ED3775ED37745CA6745CA6745CA67F7B5B6824B4BFF00FFFF00
      FF949494BABABAB9B9B9B8B8B8B7B7B7D5D5D5FFFFFFD0D0D0999999767676DF
      DFDFDDDDDDB8B8B8B8B8B8ABABABABABABABABABDFDFDF949494824B4BEB7072
      EA6F70E96E6FE76D6EF2A9AAFFFFFFEB9596B15A5A4E1E1FEECEAFFFFFD3FFFF
      D3FFFFD3FFFFD3D9F6BDD9F6BDF7B5B6824B4BFF00FFFF00FF949494BDBDBDBC
      BCBCBBBBBBBABABAD8D8D8FFFFFFCDCDCD9B9B9B767676D9D9D9EEEEEEEEEEEE
      EEEEEEEEEEEEE2E2E2E2E2E2DFDFDF949494824B4BEF7475EE7374ED7273EB70
      72EA6F70EF9091E76D6EB25B5C4E1E1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3FF
      FFD3FFFFD3F7B5B6824B4BFF00FFFF00FF949494C0C0C0BFBFBFBEBEBEBDBDBD
      BCBCBCCCCCCCBABABA9C9C9C767676D9D9D9EEEEEEEEEEEEEEEEEEEEEEEEEEEE
      EEEEEEEEDFDFDF949494824B4BF37778F37778F27677F07576EF7475EE7374ED
      7273B55D5D4E1E1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3FFFFD3FFFFD3F7B5B6
      824B4BFF00FFFF00FF949494C3C3C3C3C3C3C2C2C2C1C1C1C0C0C0BFBFBFBEBE
      BE9E9E9E767676D9D9D9EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEDFDFDF94
      9494824B4BF87B7DF77A7BF6797AF47879F37778F27677F07576B75F5F4E1E1F
      EECEAFFFFFD3FFFFD3FFFFD3FFFFD3FFFFD3FFFFD3F7B5B6824B4BFF00FFFF00
      FF949494C7C7C7C6C6C6C5C5C5C4C4C4C3C3C3C2C2C2C1C1C1A0A0A0767676D9
      D9D9EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEDFDFDF949494824B4BFC7F80
      FB7E7FFA7D7EF87B7DF77A7BF6797AF47879B860624E1E1FEECEAFFFFFD3FFFF
      D3FFFFD3FFFFD3FFFFD3FFFFD3F7B5B6824B4BFF00FFFF00FF949494CACACAC9
      C9C9C8C8C8C7C7C7C6C6C6C5C5C5C4C4C4A1A1A1767676D9D9D9EEEEEEEEEEEE
      EEEEEEEEEEEEEEEEEEEEEEEEDFDFDF949494824B4BFF8182FF8182FE8081FC7F
      80FC7F80FB7E7FFA7D7EBB63634E1E1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3FF
      FFD3FFFFD3F7B5B6824B4BFF00FFFF00FF949494CCCCCCCCCCCCCBCBCBCACACA
      CACACAC9C9C9C8C8C8A3A3A3767676D9D9D9EEEEEEEEEEEEEEEEEEEEEEEEEEEE
      EEEEEEEEDFDFDF949494824B4BFF8182FF8182FF8182FF8182FF8182FE8081FE
      8081BD65654E1E1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3FFFFD3FFFFD3F7B5B6
      824B4BFF00FFFF00FF949494CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCBCBCBCBCB
      CBA5A5A5767676D9D9D9EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEDFDFDF94
      9494824B4BF77E7FFF8182FF8182FF8182FF8182FF8182FF8182BF66664E1E1F
      EECEAFFFFFD3FFFFD3FFFFD3FFFFD3FFFFD3FFFFD3F7B5B6824B4BFF00FFFF00
      FF949494C7C7C7CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCA6A6A6767676D9
      D9D9EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEDFDFDF949494824B4B824B4B
      AF5E5FD56F70FF8182FF8182FF8182FF8182BF66664E1E1FEECEAFFFFFD3FFFF
      D3FFFFD3FFFFD3FFFFD3FFFFD3F7B5B6824B4BFF00FFFF00FF9494949494949C
      9C9CB4B4B4CCCCCCCCCCCCCCCCCCCCCCCCA6A6A6767676D9D9D9EEEEEEEEEEEE
      EEEEEEEEEEEEEEEEEEEEEEEEDFDFDF949494FF00FFFF00FF824B4B824B4B9151
      52B66263EE7A7BFF8182BF66664E1E1F914B4B824B4B824B4B824B4B824B4B82
      4B4B824B4B824B4B824B4BFF00FFFF00FFFF00FFFF00FF9494949494949D9D9D
      A1A1A1C2C2C2CCCCCCA6A6A67676769A9A9A9494949494949494949494949494
      94949494949494949494FF00FFFF00FFFF00FFFF00FFFF00FF824B4B824B4B98
      55559F58584E1E1FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9494949494948E8E
      8E939393767676FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B4E1E1F
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF949494767676FF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = BtnCancelaClick
  end
  object edDestino: TLabeledEdit
    Left = 8
    Top = 24
    Width = 390
    Height = 22
    EditLabel.Width = 200
    EditLabel.Height = 14
    EditLabel.Caption = 'Destino da c'#243'pia de seguran'#231'a:'
    ReadOnly = True
    TabOrder = 4
  end
  object btnBuscaDestinoCopia: TBitBtn
    Left = 400
    Top = 22
    Width = 25
    Height = 25
    Hint = 'Buscar um diret'#243'rio para gravar a c'#243'pia dos dados'
    Glyph.Data = {
      36050000424D3605000000000000360400002800000010000000100000000100
      0800000000000001000000000000000000000001000000010000000000000101
      01000202020003090300040F0400041A060005270700053B0800054909000557
      0A0004600A0004640B0005600B0005580B00074B0C00093E0D000C2D0E000E23
      0F00101C11001218120014141400151515001616160017171700181818001919
      19001A1A1A001B1B1B001C1C1C001D1D1D001E1E1E001F1F1F00202020002121
      2100222222002323230024242400252525002626260027272700282828002929
      29002A2A2A002B2B2B002C2C2C002D2D2D002E2E2E002F2F2F00303030003131
      3100323232003333330034343400353535003636360037373700383838003939
      39003A3A3A003B3B3B003C3C3C003D3D3D003E3E3E003F3F3F00404040004141
      4100424242004343430044444400454545004646460047474700484848004949
      49004A4A4A004B4B4B004C4C4C004D4D4D004E4E4E004F4F4F00505050005151
      5100525252005353530054545400555555005656560057575700625262007F44
      7F0097389700B926B900E011E000F405F400FB02FB00FE00FE00FE00FE00FE00
      FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
      FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
      FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
      FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
      FE00FE01FE00FD01FD00FC03FC00FA05FA00F708F700F20EF200EB16EB00E023
      E000D135D100C347C300B25DB200A86BA800A274A2009C7D9C00968796009191
      9100929292009393930094949400959595009696960097979700989898009999
      99009A9A9A009B9B9B009C9C9C009D9D9D009E9E9E009F9F9F00A0A0A000A1A1
      A100A2A2A200A3A3A300A4A4A400A5A5A500A6A6A600A7A7A700A8A8A800A9A9
      A900AAAAAA00ABABAB00AEB0B000B1B6B600B5C0C200B8CACD00BBD4D800BCDC
      E200C2E6EC00C6ECF200C8EFF500CAF2F800CDF3F900CAF4FA00C7F4FB00C5F5
      FC00C2F5FC00BDF5FC00B4F5FC00ACF5FC00A2F5FC0098F4FC0094F5FC0092F4
      FC008EF4FC008AF3FC0087F3FC0086F1FC0084EFFC0081EDFB007EEBFB007BE8
      FB0078E5FA0077E1FA0075DFF90071DDF9006DDAF90069D7F80065D3F80062D1
      F8005FD0F8005DCEF8005ACCF80058CAF70056C9F70054C7F60051C5F4004EC2
      F10048BDEA0041B6E2003BB1DC0035ACD70031A8D4002DA4D10029A0CE00279D
      CB002399C8002197C6001F94C4001B90C1001489BB000C7FB4000578AF000477
      AE000375AD000275AC000274AC000274AC000274AC000274AC000274AB000375
      A9000579A300087F9800108C89001A9D790021A96F0024AF680022AB610022AB
      590023AD4F0021AB490021AA420020A83C001EA638001BA2330070EEEEEEEEEE
      EEEEEEEEEEEEEEEE7070EEE6DBD0D9D9D9D9D9D9D9D9E2EE7070EEDDE4CBD7D7
      D7D7D7D7D7D7E1D0EE70EED5EEBFD2D2D2D2D2D2D2D2E0BFEE70EED2E7CCCBCE
      CECECECECECEDFBEEE70EECEDFDCBFCACACACACACA0BDEBEDAEEEECDD2E7B6BC
      BBBBBBBC0BFC0BB6B5EEEEC8C8E7EEEEEEEEEE0BF7F7FA0BEEEEEEC5C4C4C5C4
      C4C50BFAF7F7F7FA0B70EEB6C3C3C3C3C30B0B0B0BF7FA0B0B0B70EEB6C2C2C2
      F0DFDFDF0BF8FD0B70707070EEEEEEEE707070700BFA0B707070707070707070
      7070700BFFFF0B7070707070707070707070700BFF0B70707070707070707070
      700B0B0B0B707070707070707070700B0B0B0B70707070707070}
    TabOrder = 5
    OnClick = btnBuscaDestinoCopiaClick
  end
  object pbProgresso: TProgressBar
    Left = 0
    Top = 269
    Width = 425
    Height = 17
    Align = alBottom
    TabOrder = 6
  end
  object btnChamaRestore: TBitBtn
    Left = 96
    Top = 232
    Width = 121
    Height = 33
    Hint = 'Chamar a tela de restaura'#231#227'o de c'#243'pias'
    Caption = 'Restaura'#231#227'o'
    Glyph.Data = {
      760E0000424D760E000000000000360000002800000032000000180000000100
      180000000000400E0000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF0000056695056695056695FF00FFFF00
      FF056695056695056695056695056695FF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FF056695056695056695056695056695FF00FFFF00FFFF00FFFF00FFFF00FF
      848484848484848484FF00FFFF00FF848484848484848484848484848484FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF848484848484848484848484848484FF
      00FFFF00FFFF00FF00000566952487B7167BAC0566950566950F709F4498C149
      99C13F96C1056695FF00FF132934FF00FF172228FF00FF1141560B6D9C338BB6
      418EB22D89B5056695FF00FFFF00FFFF00FFFF00FFFF00FF848484A9A9A99B9B
      9B848484848484909090BFBFBFC1C1C1BCBCBC848484FF00FF616161FF00FF5C
      5C5CFF00FF7171718C8C8CB1B1B1B7B7B7ADADAD848484FF00FFFF00FFFF00FF
      000005669539A1D739A1D70769982A86AC227FAAA0D3EDA0D3EDA0D3ED056695
      056695171F2405669519323E0566951A3D4D1F7EA98ECAE98ECAE98ECAE90566
      95FF00FFFF00FFFF00FFFF00FFFF00FF848484C1C1C1C1C1C1878787A8A8A8A2
      A2A2D2D2D2D2D2D2D2D2D28484848484845A5A5A8484846A6A6A848484737373
      9F9F9FC9C9C9C9C9C9C9C9C9848484FF00FFFF00FFFF00FF000005669547A9D9
      47A9D91276A54D9EBF2B86ACDAEEF8DAEEF8DAEEF80566957092A32C43512D4D
      5E386D88263A454F8BA72C86ACDEEFF8DEEFF8DEEFF8056695FF00FFFF00FFFF
      00FFFF00FFFF00FF848484CACACACACACA959595C2C2C2A8A8A8EEEEEEEEEEEE
      EEEEEE848484C8C8C8808080878787A0A0A0767676BABABAA9A9A9F0F0F0F0F0
      F0F0F0F0848484FF00FFFF00FFFF00FF00000566958FCAE98FCAE93790B81675
      A01F7EA995CEEA95CEEA95CEEA0566952B414B056695182025056695121C2205
      6695217FAA9ED3EB9ED3EB9ED3EB056695FF00FFFF00FFFF00FFFF00FFFF00FF
      848484C9C9C9C9C9C9B4B4B4969696A0A0A0CCCCCCCCCCCCCCCCCC8484847C7C
      7C8484845C5C5C848484555555848484A1A1A1D1D1D1D1D1D1D1D1D1848484FF
      00FFFF00FFFF00FF0000056695D4EBF6B1D8E91D7BA50566951678A65DB4DE5D
      B4DE419CC7056695162830FF00FF182126FF00FF132D3AFF00FF0F709E5EB2DC
      65B7E165B7E1056695FF00FFFF00FFFF00FFFF00FFFF00FF848484EBEBEBD8D8
      D89D9D9D848484989898D7D7D7CECECEBFBFBF848484606060FF00FF5C5C5CFF
      00FF646464FF00FF909090D6D6D6DBDBDBDBDBDB848484FF00FFFF00FFFF00FF
      0000056695056695056695056695096A993395C443A4D51C80B1056695FF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF086A982C91C245A7D91E82
      B2056695FF00FFFF00FFFF00FFFF00FF848484848484848484848484898989B6
      B6B6C6C6C6A1A1A1848484FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF888888AFAFAFC9C9C9A3A3A3848484FF00FFFF00FF0000FF00FFFF00FF
      0566951777A46BB6DA5DADD40D6F9EFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF0566952383B069B7DD4098C10A6B99FF
      00FFFF00FFFF00FFFF00FFFF00FF848484989898DCDCDCD3D3D38F8F8FFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8484
      84A5A5A5DCDCDCBCBCBC8A8A8AFF00FF0000FF00FFFF00FF056695BADEF08CC5
      DE0B6C99FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FF0566951878A4A0D1E98BC4DE056695FF00FFFF00FF
      FF00FFFF00FF848484DEDEDEC4C4C48B8B8BFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF848484999999D1
      D1D1C4C4C48484840000FF00FFFF00FF056695F4FBFE68ACC7056695FF00FFA4
      6769A46769A46769A46769A46769A46769A46769A46769A46769A46769A46769
      A46769FF00FF056695A7D0E1EFF8FC056695FF00FFFF00FFFF00FFFF00FF8484
      84FAFAFAABABAB848484FF00FF9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C
      9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9CFF00FF848484D1D1D1F8F8F8848484
      0000FF00FFFF00FF056695E9F7FB64AAC6056695FF00FFA46769FEE9C7F4DAB5
      F6D9ABF4D4A0F2CE95F0C788EFC581EEC580F4CC83EFC480A46769FF00FF0566
      95A4D0E1EBF7FB056695FF00FFFF00FFFF00FFFF00FF848484F5F5F5A8A8A884
      8484FF00FF9C9C9CE9E9E9DEDEDEDADADAD5D5D5CFCFCFC9C9C9C6C6C6C5C5C5
      C9C9C9C5C5C59C9C9CFF00FF848484CFCFCFF6F6F68484840000FF00FFFF00FF
      056695D9F2F85DA7C5056695FF00FFA46769FCEACEF3DABCF0D5B4F0D0A9EECB
      9EEDC693EAC088E9BC7FEFC581EFC480A46769FF00FF0566959ACCDEDCF2F805
      6695FF00FFFF00FFFF00FFFF00FF848484EEEEEEA5A5A5848484FF00FF9C9C9C
      EBEBEBE0E0E0DCDCDCD7D7D7D2D2D2CDCDCDC7C7C7C2C2C2C6C6C6C5C5C59C9C
      9CFF00FF848484CACACAEFEFEF8484840000FF00FFFF00FF056695CBEDF658A5
      C4056695FF00FFA46769FEEFDAF6E0C6F2DDBFF2D8B4F0D1A9EECC9EEBC793E9
      C186EFC580EFC480A46769FF00FF05669590C9DDCEEDF6056695FF00FFFF00FF
      FF00FFFF00FF848484E7E7E7A2A2A2848484FF00FF9C9C9CF0F0F0E5E5E5E1E1
      E1DCDCDCD7D7D7D2D2D2CCCCCCC5C5C5C5C5C5C5C5C59C9C9CFF00FF848484C5
      C5C5E8E8E88484840000FF00FFFF00FF056695C5EAF455A5C4056695FF00FFA7
      756BFFF4E5F7E5CFF4E2CAF3DDC0F2D7B5F0D1AAEDCC9EEBC692F0C989EFC583
      A46769FF00FF0566958AC6DCC5EAF4056695FF00FFFF00FFFF00FFFF00FF8484
      84E4E4E4A0A0A0848484FF00FF9F9F9FF5F5F5E9E9E9E6E6E6E2E2E2DDDDDDD8
      D8D8D1D1D1CCCCCCCACACAC7C7C79C9C9CFF00FF848484C2C2C2E4E4E4848484
      0000FF00FFFF00FF056695C5EAF455A5C4056695FF00FFA7756BFFFFFCF8EADC
      F7E6D7F6E2CBF4DDC0F2D8B5F0D1AAEECB9DF0CE93F2C98CA46769FF00FF0566
      958AC6DCC5EAF4056695FF00FFFF00FFFF00FFFF00FF848484E4E4E4A0A0A084
      8484FF00FF9F9F9FFEFEFEEFEFEFECECECE7E7E7E2E2E2DDDDDDD8D8D8D1D1D1
      CECECECCCCCC9C9C9CFF00FF848484C2C2C2E4E4E48484840000FF00FFFF00FF
      056695C5EAF455A5C4056695FF00FFBC8268FFFFFCFAF0E6FBEFE5F8E9D8F7E2
      CBF3DDC0F2D7B5F2D0A7F3D3A0F3CE97A46769FF00FF0566958AC6DCC5EAF405
      6695FF00FFFF00FFFF00FFFF00FF848484E4E4E4A0A0A0848484FF00FFA6A6A6
      FEFEFEF3F3F3F3F3F3EDEDEDE8E8E8E2E2E2DDDDDDD7D7D7D5D5D5D1D1D19C9C
      9CFF00FF848484C2C2C2E4E4E48484840000FF00FFFF00FF05669505669555A5
      C4056695FF00FFD1926DFFFFFCFEF7F2FEF7F2FBEFE5F7E9D8F7E2CBF4DCC0F4
      D7B5FBDCADF6D3A0A46769FF00FF0566958AC6DC056695056695FF00FFFF00FF
      FF00FFFF00FF848484848484A0A0A0848484FF00FFB1B1B1FEFEFEF9F9F9F9F9
      F9F3F3F3EDEDEDE8E8E8E2E2E2DEDEDEDDDDDDD6D6D69C9C9CFF00FF848484C2
      C2C28484848484840000FF00FFFF00FFFF00FFFF00FF056695056695FF00FFD1
      926DFFFFFCFFFFFFFFFEFEFFF7F3FBEFE5FAE9D5F8E5CCF8E3C5EBD9B7C5A48F
      A46769FF00FF056695056695FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FF848484848484FF00FFB1B1B1FEFEFEFFFFFFFEFEFEFAFAFAF3F3F3ED
      EDEDE9E9E9E6E6E6DBDBDBBBBBBB9C9C9CFF00FF848484848484FF00FFFF00FF
      0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDA9D75FFFFFCFFFFFF
      FFFFFFFFFEFEFEF8F3FCF2E6F4E3D1D5B19FB79280A77D70A46769FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFB8B8B8FEFEFEFFFFFFFFFFFFFEFEFEFAFAFAF4F4F4E9E9E9C9C9C9
      AFAFAFA2A2A29C9C9CFF00FFFF00FFFF00FFFF00FFFF00FF0000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFDA9D75FFFFFCFFFFFFFFFFFFFFFFFFFFFF
      FEFFFEF8E6D5CCA56B5FA56B5FA56B5FAF6A56FF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB8B8B8
      FEFEFEFFFFFFFFFFFFFFFFFFFEFEFEFCFCFCE2E2E29999999999999999999898
      98FF00FFFF00FFFF00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFE7AB79FFFFFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D9DCA5
      6B5FE1974ED38749FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBFFEFEFEFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFE5E5E5999999A8A8A8A0A0A0FF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE7
      AB79FAF3EFFAF3EFFAF3EFFAF3EFFAF3EFFAF3EFDCC2B8A56B5FBF7D60FF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFBFBFBFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7
      F7F7D6D6D6999999A4A4A4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE7AB79D1926DD1926D
      D1926DD1926DD1926DD1926DD1926DA56B5FFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFBFBFBFB1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1999999
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000}
    NumGlyphs = 2
    TabOrder = 7
    OnClick = btnChamaRestoreClick
  end
end
