object frmPrevNotaProm: TfrmPrevNotaProm
  Left = 224
  Top = 159
  ClientHeight = 131
  ClientWidth = 465
  Caption = 'frmPrevNotaProm'
  BorderStyle = bsSingle
  OldCreateOrder = False
  ShowHint = True
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  KeyPreview = True
  MonitoredKeys.Keys = <>
  Font.Charset = ANSI_CHARSET
  Font.Name = 'Verdana'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBotoes: TPanel
    Left = 0
    Top = 97
    Width = 465
    Height = 34
    Hint = ''
    ShowHint = True
    ParentColor = False
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    TabStop = False
    ExplicitTop = 63
    object btnImp: TBitBtn
      Left = 97
      Top = 2
      Width = 90
      Height = 30
      Hint = 'Visualizar'
      ShowHint = True
      Glyph.Data = {
        1A0D0000424D1A0D00000000000036000000280000002C000000190000000100
        180000000000E40C0000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FF92635DA46769A46769A46769A46769A46769A46769A46769A46769A4
        6769A46769A46769A46769A46769A46769A46769A46769A46769A46769FF00FF
        FF00FFFF00FF9090909C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C
        9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9CFF
        00FFFF00FF646365314B62AC7D7EF6DAB6F3D5ADF2D1A5F0CE9EEFCB97EFC791
        EEC589EBC182EBC080EBC080EBC080EBC080EBC080EBC080EDC180EABF7F9F6F
        60FF00FFFF00FF7E7E7E636363A9A9A9DFDFDFDADADAD6D6D6D3D3D3CFCFCFCD
        CDCDC9C9C9C5C5C5C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C3C3C3
        979797FF00FFFF00FF5084B20F6FE1325F8CB87E7AF2D5B1F0D1AAEFCFA3EECB
        9DEDC796EDC58FEBC188EABF82E9BD7FE9BD7FE9BD7FE9BD7FE9BD7FEABF7FE7
        BC7E9F6F60FF00FFFF00FF979797838383777777ADADADDBDBDBD8D8D8D4D4D4
        D1D1D1CECECECBCBCBC7C7C7C4C4C4C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C3C3
        C3C1C1C1979797FF00FFFF00FF32A0FE37A1FF106FE2325F8BB67D79F2D4B1F0
        D1AAEFCFA4EECB9DEDC796EDC58FEBC189EABF82E9BD7FE9BD7FE9BD7FE9BD7F
        EABF7FE7BC7E9F6F60FF00FFFF00FFA4A4A4A8A8A8848484767676ACACACDBDB
        DBD8D8D8D5D5D5D1D1D1CECECECBCBCBC8C8C8C4C4C4C2C2C2C2C2C2C2C2C2C2
        C2C2C3C3C3C1C1C1979797FF00FFFF00FFFF00FF37A4FE379FFF0E6DDE355F89
        BB7F79F2D4B0F0D1AAEFCEA3EECB9CEDC795EDC58FEBC189E9BD81E9BD7FE9BD
        7FE9BD7FEABF7FE7BC7E9F6F60FF00FFFF00FFFF00FFA7A7A7A8A8A881818177
        7777AEAEAEDBDBDBD8D8D8D4D4D4D1D1D1CDCDCDCBCBCBC8C8C8C3C3C3C2C2C2
        C2C2C2C2C2C2C3C3C3C1C1C1979797FF00FFFF00FFFF00FF93656037A4FE359E
        FF0F6FDE35608BA67B7FF2D5B1F0D1AAEFCEA3EECB9CEDC796EDC590EBC189E9
        BF82E9BD7FE9BD7FEABF7FE7BC7E9F6F60FF00FFFF00FFFF00FF929292A7A7A7
        A6A6A6828282787878A6A6A6DBDBDBD8D8D8D4D4D4D1D1D1CECECECBCBCBC8C8
        C8C4C4C4C2C2C2C2C2C2C3C3C3C1C1C1979797FF00FFFF00FFFF00FF956660F2
        E2D338A5FE329DFF156DCE444F5BDAB8A0925D5A986660935E5B9A6663B88A74
        D7AB82EBC189E9BD81E9BD7FEABF7FE7BC7E9F6F60FF00FFFF00FFFF00FF9292
        92E9E9E9A8A8A8A5A5A58080806A6A6ACBCBCB8E8E8E9494948F8F8F969696AA
        AAAABDBDBDC8C8C8C3C3C3C2C2C2C3C3C3C1C1C1979797FF00FFFF00FFFF00FF
        986963F2E6DAFAEEDE3BABFFA1CAE78F6D6B96665FC2A38CE9DCB7FBF8CBE7DC
        B6BF9A899D6B66CB9E7BEBC189E9BD81EABF7FE7BC7E9F6F60FF00FFFF00FFFF
        00FF959595ECECECF0F0F0AAAAAAD1D1D1959595929292B9B9B9DADADAE9E9E9
        D9D9D9B6B6B6989898B5B5B5C8C8C8C3C3C3C3C3C3C1C1C1979797FF00FFFF00
        FFFF00FF9E6E64F4EAE1FBF2E6F8EADCB49291A06D66EDD4A4FFFCCAFFFFCFFF
        FFCFFFFFD5FFFFEAE3D3CC96635FD5AB82EBC188EABF82E7BB7E9F6F60FF00FF
        FF00FFFF00FF989898EFEFEFF4F4F4EFEFEFB5B5B59A9A9AD4D4D4EAEAEAECEC
        ECECECECEFEFEFF7F7F7E1E1E1929292BCBCBCC7C7C7C4C4C4C1C1C1979797FF
        00FFFF00FFFF00FFA37266F6EEE9FCF6EDF8EFE3A16C67C79F81F6D095FCF4C2
        FFFFCFFFFFD8FFFFEEFFFFFAFFFFFFB79387B88A73EBC48EEBC288E7BC809F6F
        60FF00FFFF00FFFF00FF9B9B9BF3F3F3F7F7F7F2F2F29B9B9BB6B6B6D1D1D1E6
        E6E6ECECECF0F0F0F8F8F8FDFDFDFFFFFFB2B2B2AAAAAACACACAC7C7C7C2C2C2
        979797FF00FFFF00FFFF00FFA77568F8F3F0FEFBF6FBF3EB9D6A64E7C28EEEB8
        7FFBF0BDFFFFD0FFFFDCFFFFF7FFFFFAFFFFE6DCCEAD996560EDC795EDC58FE9
        BF879F6F62FF00FFFF00FFFF00FF9E9E9EF7F7F7FBFBFBF6F6F6979797C8C8C8
        C4C4C4E4E4E4EDEDEDF1F1F1FCFCFCFDFDFDF5F5F5D1D1D1949494CDCDCDCBCB
        CBC6C6C6979797FF00FFFF00FFFF00FFAC7969FAF6F4FFFFFEFEF8F3935F5BF7
        D495EAA76CF7DAA3FFFFCEFFFFD4FFFFE1FFFFE3FFFFD7F6F2C9935E5BEECB9C
        EEC996EAC18EA07063FF00FFFF00FFFF00FFA0A0A0F9F9F9FEFEFEFAFAFA8F8F
        8FD1D1D1BABABAD7D7D7ECECECEEEEEEF3F3F3F4F4F4EFEFEFE6E6E68F8F8FD1
        D1D1CECECEC9C9C9989898FF00FFFF00FFFF00FFB17E6BFAF6F4FFFFFFFFFEFB
        9E6B65E9C793EAA96AEFBD80FAE9B4FFFFD0FFFFD3FFFFD1FFFFD1E1D1B09966
        60EFCEA1EECB9CEBC592A07264FF00FFFF00FFFF00FFA3A3A3F9F9F9FFFFFFFD
        FDFD989898CBCBCBB9B9B9C5C5C5DFDFDFEDEDEDEEEEEEEDEDEDEDEDEDD4D4D4
        949494D4D4D4D1D1D1CCCCCC999999FF00FFFF00FFFF00FFB6816CFAF6F4FFFF
        FFFFFFFFA4706BCBA989F8E2B5F0C690F0C286F7DCA5FEF3C1FEF8C6FFFFCFBB
        9984BB8F7EF0D1A9F0CFA3EDC9999D7065FF00FFFF00FFFF00FFA6A6A6F9F9F9
        FFFFFFFFFFFF9E9E9EBBBBBBDFDFDFCDCDCDC8C8C8D8D8D8E6E6E6E8E8E8ECEC
        ECB3B3B3B0B0B0D7D7D7D5D5D5CFCFCF989898FF00FFFF00FFFF00FFBB846EFA
        F6F4FFFFFFFFFFFFE5D5D5A07068EDE3E2FFF4E2EFBD80EBAB6FF0C086FBDEA3
        EBD9A9986760DAB89FF0D4AFEFD0A7CEB491896A63FF00FFFF00FFFF00FFA9A9
        A9F9F9F9FFFFFFFFFFFFE5E5E59B9B9BEDEDEDF4F4F4C5C5C5BCBCBCC8C8C8D9
        D9D9D5D5D5949494CBCBCBDADADAD6D6D6C0C0C08E8E8EFF00FFFF00FFFF00FF
        C0896FFBF7F4FFFFFFFFFFFFFFFFFFD7C0BF9E6F6BC6A999EAD19EFADA9CE9C7
        93C59D829D6A64D0AC9CF3DCBDE5CEAFC4B096A1927F806762FF00FFFF00FFFF
        00FFABABABF9F9F9FFFFFFFFFFFFFFFFFFD6D6D69B9B9BC0C0C0D0D0D0D5D5D5
        CBCBCBB6B6B6979797C5C5C5E1E1E1D5D5D5BEBEBEA6A6A68A8A8AFF00FFFF00
        FFFF00FFC58C70FBF7F4FFFFFFFFFFFFFFFFFFFFFFFFE5D5D5A4766A9A686293
        5F5B9E6A64BD988FE0C4B5FAE9D0E0D0BAB8AB9AA79C8BA49786846964FF00FF
        FF00FFFF00FFAEAEAEF9F9F9FFFFFFFFFFFFFFFFFFFFFFFFE5E5E59D9D9D9595
        958F8F8F989898B8B8B8D6D6D6EBEBEBD8D8D8BBBBBBAEAEAEAAAAAA8D8D8DFF
        00FFFF00FFFF00FFCB9173FBF7F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFEFBFCF7F0FBF2E9FBF2E5E9D3C49E675B98665B95655B96655B96655B9868
        59FF00FFFF00FFFF00FFB1B1B1F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFDFDFDF8F8F8F5F5F5F3F3F3DFDFDF949494919191909090909090909090
        909090FF00FFFF00FFFF00FFCF9674FBF7F6FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFCFAFCF7F0FFFAEFDAC0B69F675BDAA16BDD984FE2903AEA
        8923A5686BFF00FFFF00FFFF00FFB3B3B3FAFAFAFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFDFDFDF8F8F8F9F9F9D4D4D4949494B4B4B4A7A7A79E9E
        9E9494949D9D9DFF00FFFF00FFFF00FFD49875FCF8F6FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFFFEF7DDC4BC9F675BEAB474EFA952
        F6A036A5686BFF00FFFF00FFFF00FFFF00FFB6B6B6FAFAFAFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFCFCFCD8D8D8949494BEBEBEB0
        B0B0A4A4A49D9D9DFF00FFFF00FFFF00FFFF00FFD49875FCF8F6FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDC7C29F675BEAB2
        73EFA751A5686BFF00FFFF00FFFF00FFFF00FFFF00FFB6B6B6FAFAFAFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDADADA949494
        BDBDBDAFAFAF9D9D9DFF00FFFF00FFFF00FFFF00FFFF00FFD49875FFFEFEFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D0CE9F
        675BEDB572A5686BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB6B6B6FEFEFE
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1E1
        E1949494BEBEBE9D9D9DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCF8E68CF
        8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68
        CF8E689F675BA5686BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAEAE
        AEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAE
        AEAEAEAEAE9494949D9D9DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = '&Visualizar'
      TabOrder = 0
      OnClick = btnImpClick
    end
    object btnCancel: TBitBtn
      Left = 188
      Top = 2
      Width = 90
      Height = 30
      Hint = 'Sair'
      ShowHint = True
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
      Caption = '&Sair'
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnImprimir: TBitBtn
      Left = 3
      Top = 2
      Width = 90
      Height = 30
      Hint = 'Imprimir'
      ShowHint = True
      Glyph.Data = {
        36120000424D3612000000000000360000002800000030000000180000000100
        2000000000000012000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF006C6A6A006C6A6A006C6A6A00FF00
        FF00FF00FF00FF00FF00FF00FF006C6A6A006C6A6A00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF006B6B6B006B6B6B006B6B6B00FF00
        FF00FF00FF00FF00FF00FF00FF006B6B6B006B6B6B00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF006C6A6A00AFAEAE00969293008E8A8A006C6A
        6A006C6A6A00827E7F006C6A6A00DDDCDC00D0CFCF006C6A6A006C6A6A006C6A
        6A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF006B6B6B00AEAEAE00949494008C8C8C006B6B
        6B006B6B6B00808080006B6B6B00DCDCDC00CFCFCF006B6B6B006B6B6B006B6B
        6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF006C6A6A00D4D3D300C4C4C400A29F9F00A29F9F00A29F
        9F00858182005E595A00BCBBBB00CFCECE00CFCFCF00D2D1D100D4D3D300C9C9
        C9006C6A6A006C6A6A006C6A6A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF006B6B6B00D3D3D300C4C4C400A0A0A000A0A0A000A0A0
        A000838383005B5B5B00BBBBBB00CECECE00CFCFCF00D1D1D100D3D3D300C9C9
        C9006B6B6B006B6B6B006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF006C6A6A00D7D6D600E1E0E000BFBEBE00A29F9F00A29F9F00A29F
        9F00666061000A0A0A000A0A0A0017171700635D5E00AAA9A900CACACA00CACA
        CA00CACACA00CACACA00C1C1C1006C6A6A006C6A6A006C6A6A00FF00FF00FF00
        FF00FF00FF006B6B6B00D6D6D600E0E0E000BEBEBE00A0A0A000A0A0A000A0A0
        A000636363000A0A0A000A0A0A001717170060606000A9A9A900CACACA00CACA
        CA00CACACA00CACACA00C1C1C1006B6B6B006B6B6B006B6B6B00FF00FF00FF00
        FF006C6A6A00D4D3D300D4D3D300CFCFCF008E8A8A00827E7F00827E7F00827E
        7F006C6A6A00141414000A0A0A000A0A0A000A0A0A000A0A0A0017171700635D
        5E00AAA9A900CACACA00CACACA00B7B6B600B7B6B6006C6A6A00FF00FF00FF00
        FF006B6B6B00D3D3D300D3D3D300CFCFCF008C8C8C0080808000808080008080
        80006B6B6B00141414000A0A0A000A0A0A000A0A0A000A0A0A00171717006060
        6000A9A9A900CACACA00CACACA00B6B6B600B6B6B6006B6B6B00FF00FF006C6A
        6A00CACACA00CACACA00C7C6C6008F8B8C00B7B6B600B5B4B400A29F9F00A29F
        9F009F9C9D009A969700938F9000837F8000565051002A2A2A000A0A0A000A0A
        0A000A0A0A001717170069646500827E7F006C6A6A00FF00FF00FF00FF006B6B
        6B00CACACA00CACACA00C6C6C6008D8D8D00B6B6B600B4B4B400A0A0A000A0A0
        A0009D9D9D00989898009191910081818100535353002A2A2A000A0A0A000A0A
        0A000A0A0A001717170066666600808080006B6B6B00FF00FF00FF00FF006C6A
        6A00CACACA00C4C4C4008F8B8C00D7D6D600F6F3F200F6F3F200F3F1F000E1E0
        E000C8C7C700B5B4B400A6A3A400A29F9F00A29F9F009F9C9D00938F90006A65
        6600232323000A0A0A001B1B1B009A9697006C6A6A00FF00FF00FF00FF006B6B
        6B00CACACA00C4C4C4008D8D8D00D6D6D600F4F4F400F4F4F400F1F1F100E0E0
        E000C7C7C700B4B4B400A4A4A400A0A0A000A0A0A0009D9D9D00919191006767
        6700232323000A0A0A001B1B1B00989898006B6B6B00FF00FF00FF00FF006C6A
        6A00C4C4C4008F8B8C00E7E6E500F6F3F200F6F3F200F6F3F200F3F1F000EEEC
        EB00EBEAE900E7E6E500E5E4E400D4D3D300C1C1C100AFAEAE00A29F9F00A29F
        9F009A969700837F80006C6A6A009F9C9D006C6A6A00FF00FF00FF00FF006B6B
        6B00C4C4C4008D8D8D00E6E6E600F4F4F400F4F4F400F4F4F400F1F1F100ECEC
        EC00EAEAEA00E6E6E600E4E4E400D3D3D300C1C1C100AEAEAE00A0A0A000A0A0
        A00098989800818181006B6B6B009D9D9D006B6B6B00FF00FF00FF00FF006C6A
        6A008F8B8C00F0EEED00F6F3F200F6F3F200F6F3F200F6F3F200D4D3D300817C
        7D00918D8D00BFBEBE00DDDCDC00E1E0E000DDDCDC00DAD9D900D2D1D100C1C1
        C100B1B0B000A29F9F009D999A006C6A6A006C6A6A00FF00FF00FF00FF006B6B
        6B008D8D8D00EEEEEE00F4F4F400F4F4F400F4F4F400F4F4F400D3D3D3007E7E
        7E008F8F8F00BEBEBE00DCDCDC00E0E0E000DCDCDC00D9D9D900D1D1D100C1C1
        C100B0B0B000A0A0A0009B9B9B006B6B6B006B6B6B00FF00FF00FF00FF006C6A
        6A00CCCBCB00F6F3F200F6F3F200F6F3F200F6F3F200CCCBCB00AFAEAE00ADAB
        AB009D999A007F7A7B006E6A6B0085818200A8A6A600C7C6C600D7D6D600D2D1
        D100CFCECE00C8C7C700BCBBBB00A6A3A4006C6A6A00FF00FF00FF00FF006B6B
        6B00CBCBCB00F4F4F400F4F4F400F4F4F400F4F4F400CBCBCB00AEAEAE00ACAC
        AC009B9B9B007C7C7C006C6C6C0083838300A7A7A700C6C6C600D6D6D600D1D1
        D100CECECE00C7C7C700BBBBBB00A4A4A4006B6B6B00FF00FF00FF00FF00FF00
        FF006C6A6A006C6A6A00CCCBCB00EDEBEA00A7A5A500695D5D006E6A6B007D78
        79009A969700ABAAAA00B1B0B000AAA8A800969293007D787900817C7D00918D
        8D00BFBEBE00CCCBCB00CACACA00C1C1C1006C6A6A00FF00FF00FF00FF00FF00
        FF006B6B6B006B6B6B00CBCBCB00EBEBEB00A6A6A600636363006C6C6C007A7A
        7A0098989800AAAAAA00B0B0B000A9A9A900949494007A7A7A007E7E7E008F8F
        8F00BEBEBE00CBCBCB00CACACA00C1C1C1006B6B6B00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF006C6A6A006C6A6A00BC828000B3817A006A5E5D005E55
        5600605657006A5E5D006A5E5D00858182009F9C9D00AFAEAE00B1B0B000A29F
        9F00CACACA00CCCBCB00B7B6B6006C6A6A00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF006B6B6B006B6B6B009E9E9E0096969600636363005959
        59005B5B5B006363630063636300838383009D9D9D00AEAEAE00B0B0B000A0A0
        A000CACACA00CBCBCB00B6B6B6006B6B6B00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00BC828000FDD4AD00FDCEA200FDCA
        9900D49D8300B3817A006B6767005B52530064595900696465008B878800CDCC
        CD00CFCFCF00A6A3A4006C6A6A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF009E9E9E00D5D5D500CFCFCF00CBCB
        CB00ABABAB009696960069696900565656005E5E5E006666660089898900CCCC
        CC00CFCFCF00A4A4A4006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00BC828000FED9B400FDD2AA00FDCE
        A200FDCA9900FBC59300F7BF8D00F7BF8D00F7BF8D00BC8280006C6A6A006C6A
        6A006C6A6A006C6A6A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF009E9E9E00D9D9D900D3D3D300CFCF
        CF00CBCBCB00C7C7C700C2C2C200C2C2C200C2C2C2009E9E9E006B6B6B006B6B
        6B006B6B6B006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00BC8280000A0A0A00FDD7B2000A0A
        0A00FDCD9F00FDC89600FBC59300F7BF8D00F7BF8D00BC828000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF009E9E9E000A0A0A00D7D7D7000A0A
        0A00CECECE00C9C9C900C7C7C700C2C2C200C2C2C2009E9E9E00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00BC828000FEE6CE000A0A0A00FEDBB8000A0A
        0A00FDD0A5000A0A0A00FDC89600F9C29000BC828000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF009E9E9E00E6E6E6000A0A0A00DBDBDB000A0A
        0A00D1D1D1000A0A0A00C9C9C900C4C4C4009E9E9E00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00BC828000FEEAD5000A0A0A000A0A0A000A0A
        0A000A0A0A000A0A0A000A0A0A00FDC89600BC828000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF009E9E9E00E9E9E9000A0A0A000A0A0A000A0A
        0A000A0A0A000A0A0A000A0A0A00C9C9C9009E9E9E00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00BC828000FDEDDC000A0A0A00FEE3C900FEDF
        C0000A0A0A00FDD4AD000A0A0A000A0A0A00BC828000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF009E9E9E00ECECEC000A0A0A00E3E3E300DFDF
        DF000A0A0A00D5D5D5000A0A0A000A0A0A009E9E9E00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00BC828000F8F3EE00FDEFE200FDEDDC00FEE6CE000A0A
        0A000A0A0A00FED9B400FDD4AD00BC828000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF009E9E9E00F3F3F300EFEFEF00ECECEC00E6E6E6000A0A
        0A000A0A0A00D9D9D900D5D5D5009E9E9E00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00BC828000F6F3F200F6F3F200F9F3EC00FDEFE200FEEBD800FEE6
        CE00FEE1C400FEDCBB00FCD0A700BC828000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF009E9E9E00F4F4F400F4F4F400F2F2F200EFEFEF00EBEBEB00E6E6
        E600E1E1E100DCDCDC00D1D1D1009E9E9E00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00BC828000BC828000BC828000BC828000F9F3EC00FDEFE200FEEB
        D800FEE6CE00FEDFC000BC828000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF009E9E9E009E9E9E009E9E9E009E9E9E00F2F2F200EFEFEF00EBEB
        EB00E6E6E600DFDFDF009E9E9E00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00BC828000BC828000BC82
        8000BC828000BC828000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF009E9E9E009E9E9E009E9E
        9E009E9E9E009E9E9E00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      Caption = '&Imprimir'
      TabOrder = 2
      OnClick = btnImprimirClick
    end
  end
  object dbeCliente: TDBEdit
    Left = 16
    Top = 40
    Width = 411
    Height = 21
    Hint = 'Pesquisar < F2 >'
    ShowHint = True
    DataField = 'NOME'
    DataSource = dsPadrao
    TabOrder = 0
    Color = clBtnFace
    ReadOnly = True
  end
  object sqldPadrao: TSQLDataSet
    CommandText = 
      'select'#13#10'  cli.CODCLIENTE,'#13#10'  cli.NOME,'#13#10'  cli.TELEFONE,'#13#10'  cli.R' +
      'G_IE,'#13#10'  cli.CPF_CNPJ,'#13#10'  cli.DATA_NASC,'#13#10'  cli.LIMITE,'#13#10'  cid.D' +
      'ESCRICAO'#13#10'from CLIENTES cli'#13#10'left join CIDADES cid on (cli.CODCI' +
      'DADE = cid.CODCIDADE)'#13#10'order by cli.NOME'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 128
    Top = 6
    object sqldPadraoCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
      Required = True
    end
    object sqldPadraoNOME: TStringField
      FieldName = 'NOME'
      Size = 80
    end
    object sqldPadraoTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
    object sqldPadraoRG_IE: TStringField
      FieldName = 'RG_IE'
    end
    object sqldPadraoCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
    end
    object sqldPadraoDATA_NASC: TDateField
      FieldName = 'DATA_NASC'
    end
    object sqldPadraoLIMITE: TFMTBCDField
      FieldName = 'LIMITE'
      Precision = 15
    end
    object sqldPadraoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
  end
  object dspPadrao: TDataSetProvider
    DataSet = sqldPadrao
    Options = [poAllowCommandText]
    Left = 160
    Top = 6
  end
  object cdsPadrao: TMemDataset
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 192
    Top = 6
    object cdsPadraoCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
      Required = True
    end
    object cdsPadraoNOME: TStringField
      FieldName = 'NOME'
      Size = 80
    end
    object cdsPadraoTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
    object cdsPadraoRG_IE: TStringField
      FieldName = 'RG_IE'
    end
    object cdsPadraoCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
    end
    object cdsPadraoDATA_NASC: TDateField
      FieldName = 'DATA_NASC'
    end
    object cdsPadraoLIMITE: TFMTBCDField
      FieldName = 'LIMITE'
      Precision = 15
    end
    object cdsPadraoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
  end
  object dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 224
    Top = 6
  end
end
