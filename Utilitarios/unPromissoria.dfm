inherited frmPromissoria: TfrmPromissoria
  Left = 221
  Top = 140
  Caption = 'frmPromissoria'
  ClientHeight = 269
  ClientWidth = 513
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 529
  ExplicitHeight = 308
  PixelsPerInch = 96
  TextHeight = 13
  object bvlLinha: TBevel
    Left = 8
    Top = 135
    Width = 505
    Height = 2
  end
  object edtNumero: TLabeledEdit
    Left = 8
    Top = 24
    Width = 121
    Height = 21
    EditLabel.Width = 45
    EditLabel.Height = 13
    EditLabel.Caption = 'N'#250'mero'
    TabOrder = 0
  end
  object edtEmissao: TLabeledEdit
    Left = 136
    Top = 24
    Width = 121
    Height = 21
    EditLabel.Width = 47
    EditLabel.Height = 13
    EditLabel.Caption = 'Emiss'#227'o'
    TabOrder = 1
  end
  object edtVencimento: TLabeledEdit
    Left = 264
    Top = 24
    Width = 121
    Height = 21
    EditLabel.Width = 66
    EditLabel.Height = 13
    EditLabel.Caption = 'Vencimento'
    TabOrder = 2
  end
  object edtValor: TLabeledEdit
    Left = 392
    Top = 24
    Width = 121
    Height = 21
    EditLabel.Width = 29
    EditLabel.Height = 13
    EditLabel.Caption = 'Valor'
    TabOrder = 3
  end
  object edtCredor: TLabeledEdit
    Left = 8
    Top = 64
    Width = 353
    Height = 21
    EditLabel.Width = 40
    EditLabel.Height = 13
    EditLabel.Caption = 'Credor'
    TabOrder = 4
  end
  object edtCpfCnpj: TLabeledEdit
    Left = 368
    Top = 64
    Width = 145
    Height = 21
    EditLabel.Width = 52
    EditLabel.Height = 13
    EditLabel.Caption = 'Cpf/Cnpj'
    TabOrder = 5
  end
  object edtPracaPag: TLabeledEdit
    Left = 8
    Top = 104
    Width = 505
    Height = 21
    EditLabel.Width = 118
    EditLabel.Height = 13
    EditLabel.Caption = 'Praca de pagamento'
    TabOrder = 6
  end
  object edtEmitente: TLabeledEdit
    Left = 8
    Top = 160
    Width = 353
    Height = 21
    EditLabel.Width = 50
    EditLabel.Height = 13
    EditLabel.Caption = 'Emitente'
    TabOrder = 7
  end
  object edtCpfCnpjEmitente: TLabeledEdit
    Left = 368
    Top = 160
    Width = 145
    Height = 21
    EditLabel.Width = 106
    EditLabel.Height = 13
    EditLabel.Caption = 'Cpf/Cnpj Emitente'
    TabOrder = 8
  end
  object edtEndereco: TLabeledEdit
    Left = 8
    Top = 200
    Width = 505
    Height = 21
    EditLabel.Width = 53
    EditLabel.Height = 13
    EditLabel.Caption = 'Endere'#231'o'
    TabOrder = 9
  end
  object btnCliente: TBitBtn
    Left = 7
    Top = 240
    Width = 89
    Height = 25
    Hint = 'Buscar um cliente'
    Caption = 'Cliente'
    Glyph.Data = {
      36060000424D3606000000000000360000002800000020000000100000000100
      18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB44A08C7521C
      EC6145F7634FF6654FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF727272858585ACACACB7B7B7B6B6B6FF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB64B0BCD5422
      F06148F86F56F97A5BF9816AF76C58F15B46A25C27FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF7474748B8B8BB0B0B0BBBBBBBEBEBEC5C5C5BBBBBBAF
      AFAF8C8C8CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD4C11D4562B
      F67458FC8865FC8764FDD3CAFAA497E9543B9C5922008F0014AE2B20C0504ECB
      655AC5580194000080007B7B7B939393BBBBBBC4C4C4C4C4C4F7F7F7DCDCDCA6
      A6A68787876F6F6F898989989898B3B3B3B5B5B5727272686868C54F1ADF6139
      FE8968FF875FFFAC94FFFFFFFFC9BCEE664797561B11A42532D46E33D05EAEF5
      AEB2F3B313A922008201838383A0A0A0C7C7C7C3C3C3DDDDDDFFFFFFF1F1F1AE
      AEAE818181828282ABABABA9A9A9F2F2F2F3F3F3868686696969FF00FFDF6139
      FF8B64C6705BABA2A5C3CACDECA18CFE7856A765281AB53726C15644A153A8C4
      A582C98027BF49078D12FF00FFA0A0A0C5C5C5A4A4A4BABABADCDCDCD0D0D0BE
      BEBE8F8F8F8F8F8F9B9B9B9A9A9AD7D7D7C9C9C99B9B9B727272FF00FFFF00FF
      5C617F336AAC2370BD2569A98C676DFF00FFFF00FF06380C0631111531671A33
      8016445723A74BFF00FFFF00FFFF00FF8181818383838484847B7B7B8D8D8DFF
      00FFFF00FF7979797575756666667575755D5D5D8D8D8DFF00FFFF00FF2080B7
      1A83DC309FFF339DFF2B93F62E81D0FF00FF020C160000000814481342B00F3F
      AE0F35A012418FFF00FFFF00FF7F7F7F8F8F8FABABABADADADA4A4A4939393FF
      00FF6666665959598282828989898686867F7F7F787878FF00FF3282A33F9AD3
      44ACFF45AEFF45AEFD46AFFF3FACFE2687D1020C12020611184DA81F61D11D5C
      C41E5DC71950C10727A17E7E7E9D9D9DB5B5B5B6B6B6B5B5B5B6B6B6B2B2B28F
      8F8F646464626262888888A0A0A09898989A9A9A9595957C7C7C3282A345A4E0
      4BB4FF4AB1FD47ADF847ADF94CB6FF3A96DA030B0E030F202269CC2572E02166
      CE226DD72269D31C50B47E7E7EA6A6A6B9B9B9B7B7B7B3B3B3B4B4B4B9B9B99E
      9E9E6161616B6B6B9F9F9FAAAAAA9F9F9FA4A4A4A2A2A29090903282A33282A3
      46A2D348AAE84AB1FC4AAFFA4DB6FF358CD0050C1205070B206ABA3197FF2F8D
      F53091F92879DE205EAF7E7E7E7E7E7EA0A0A0ACACACB7B7B7B6B6B6BABABA96
      9696656565616161959595BEBEBEB8B8B8BABABAABABAB8F8F8F3282A33282A3
      3282A348A6DD4EB6FE4EB7FF49B0F6226A9F060D1326201A243E571E69AF277E
      CD2D85D41A4D8A205EAF7E7E7E7E7E7E7E7E7EA6A6A6BABABABABABAB3B3B374
      74746666667A7A7A9494948E8E8EA2A2A2A8A8A87A7A7A8F8F8FFF00FF3282A3
      3282A33282A33282A33282A33282A3FF00FFFF00FF2A28266A666160605F2029
      33071321030817FF00FFFF00FF7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7EFF
      00FFFF00FF8282828D8D8D8787878383836E6E6E676767FF00FFFF00FFFF00FF
      3282A33282A33282A33282A3FF00FFFF00FFFF00FFFF00FF5253535C5A58221E
      1A000000FF00FFFF00FFFF00FFFF00FF7E7E7E7E7E7E7E7E7E7E7E7EFF00FFFF
      00FFFF00FFFF00FF7A7A7A828282787878595959FF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    NumGlyphs = 2
    TabOrder = 10
    OnClick = btnClienteClick
  end
  object btnImprimir: TBitBtn
    Left = 336
    Top = 240
    Width = 89
    Height = 25
    Hint = 'Imprimir/visualizar'
    Caption = 'Imprimir'
    Glyph.Data = {
      36060000424D3606000000000000360000002800000020000000100000000100
      18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FF6C6A6A6C6A6AFF00FFFF00FF6C6A6A6C6A6AFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF989898989898FF00FFFF
      00FF989898989898FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF6C6A6AAAA7A7A19F9F6C6A6A6C6A6A6C6A6AE5E3E36C6A6A6C6A6A6C6A
      6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF989898BFBFBFBABABA98989898
      9898989898E1E1E1989898989898989898FF00FFFF00FFFF00FFFF00FFFF00FF
      6C6A6ADAD9D9A19F9FA19F9FA19F9F3736363535356C6D6DBFBFBFE1E2E2B7B6
      B66C6A6A6C6A6A6C6A6AFF00FFFF00FF989898DBDBDBBABABABABABABABABA72
      7272717171999999CCCCCCDFDFDFC7C7C7989898989898989898FF00FF6C6A6A
      D4D3D3CACACA8E8C8C8E8C8C8E8C8C3C3B3B0A090A0707070B0B0B0707077A7A
      7ABBBBBB6C6A6AFF00FFFF00FF989898D7D7D7D3D3D3AEAEAEAEAEAEAEAEAE76
      7676474747454545494949454545A2A2A2CACACA989898FF00FF6C6A6ACACACA
      CACACA8E8C8CD7D4D4CECBCBBFBCBCB1AFAFA3A0A08886865E5B5C0707070909
      090808086C6A6A767373989898D3D3D3D3D3D3AEAEAED9D9D9D3D3D3CBCBCBC3
      C3C3BABABAAAAAAA8E8E8E4545454747474646469898989D9D9D6C6A6ACACACA
      8E8C8CEFEEEEFFFEFEFBFAFAE3E0E1DEDEDEDEDDDDCFCECEBDBCBCADABAB8B89
      895856567A7878757373989898D3D3D3AEAEAEE6E6E6EFEFEFEDEDEDDFDFDFDE
      DEDEDDDDDDD4D4D4CACACAC1C1C1ACACAC8A8A8AA1A1A19D9D9D6C6A6A8E8C8C
      FFFFFFFEFCFCFAFAFAD5D4D5989193A09899B2ABACC4C0C1D7D7D7D8D8D8C7C6
      C6B7B6B6918F8F6C6969989898AEAEAEEFEFEFEFEFEFEDEDEDD8D8D8B3B3B3B7
      B7B7C2C2C2CDCDCDDADADADBDBDBD0D0D0C7C7C7AFAFAF979797FF00FF6C6A6A
      6C6A6AEDEBEBB1A6A77A6F728A83889692959690919D97989A93959E9899BBBA
      BAD1D1D1C2C2C26C6A6AFF00FF989898989898E6E6E6C1C1C19E9E9EAAAAAAB2
      B2B2B1B1B1B6B6B6B4B4B4B7B7B7C9C9C9D7D7D7CECECE989898FF00FFFF00FF
      FF00FF6C6A6ABB897FA7876D8B6F647D67606F62657973798F8B8EA9A3A4CBCA
      CAC1C1C16C6A6AFF00FFFF00FFFF00FFFF00FF989898A7A7A79999998A8A8A9A
      9A9A9696969F9F9FAEAEAEBDBDBDD3D3D3CDCDCD989898FF00FFFF00FFFF00FF
      FF00FFFF00FFBD8281FFE3B4FFD39FE9B281C99973BA916CBD8281807D7E6C6A
      6A6C6A6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA9A9A9D3D3D3CCCCCCB8
      B8B8A7A7A79F9F9FA9A9A9A5A5A5989898989898FF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFBD8281FFE0B8FFD3A7FFD09DFFCE90FFC688BD8281FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA9A9A9D5D5D5CFCFCFCB
      CBCBC6C6C6C3C3C3A9A9A9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFC08683FFE7CFFFE0C0FFD9B2FFD3A5FFD099BD8281FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFABABABDDDDDDD8D8D8D3D3D3CE
      CECECACACAA9A9A9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFBD8281FEEBD8FFE6CCFFDEBDFFD8B1FED3A4BD8281FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA9A9A9E0E0E0DCDCDCD7D7D7D3
      D3D3CDCDCDA9A9A9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      BD8281FFFFF2FFFFF2FFEBD8FFE5CAFFE1BDF3C7A7BD8281FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFA9A9A9EAEAEAEAEAEAE1E1E1DCDCDCD7
      D7D7CBCBCBA9A9A9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      BD8281BD8281BD8281FBEFE2FBE3CFFBDDC2BD8281FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFA9A9A9A9A9A9A9A9A9E3E3E3DCDCDCD8
      D8D8A9A9A9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFBD8281BD8281BD8281FF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA9A9A9A9A9A9A9
      A9A9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    NumGlyphs = 2
    TabOrder = 11
    OnClick = btnImprimirClick
  end
  object btnCancelar: TBitBtn
    Left = 432
    Top = 240
    Width = 81
    Height = 25
    Hint = 'Cancelar/fechar'
    Caption = 'Cancelar'
    Glyph.Data = {
      36060000424D3606000000000000360000002800000020000000100000000100
      18000000000000060000C40E0000C40E00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF00009A00009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00009A0000
      9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
      00009A174AFD103BF400009AFF00FFFF00FFFF00FFFF00FF00009A002CF80030
      FC00009AFF00FFFF00FFFF00FFFF00FF6B6B6BA8A8A8A0A0A06B6B6BFF00FFFF
      00FFFF00FFFF00FF6B6B6B9A9A9A9C9C9C6B6B6BFF00FFFF00FFFF00FFFF00FF
      00009A1A47F81A4CFF123BF100009AFF00FFFF00FF00009A012DF60132FF002A
      F300009AFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7AAAAAA9F9F9F6B6B6BFF
      00FFFF00FF6B6B6B9999999E9E9E9797976B6B6BFF00FFFF00FFFF00FFFF00FF
      FF00FF00009A1C47F61B4DFF143EF400009A00009A002DF80134FF032BF20000
      9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7ABABABA2A2A26B
      6B6B6B6B6B9A9A9A9E9E9E9898986B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF00009A1D48F61D50FF103DFB0431FE0132FF002CF600009AFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7ACACACA3
      A3A39F9F9F9E9E9E9999996B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF00009A1A48F91342FF0C3CFF0733F600009AFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7A7
      A7A7A3A3A39C9C9C6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF00009A214EFC1D4BFF1847FF1743F600009AFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BACACACAC
      ACACA9A9A9A4A4A46B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF00009A2E5BF92C5FFF224DF8204BF82355FF1B46F600009AFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BB1B1B1B3B3B3AB
      ABABAAAAAAAFAFAFA6A6A66B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF00009A3664FA386BFF2D59F400009A00009A224CF42558FF1D49F60000
      9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BB6B6B6B9B9B9AEAEAE6B
      6B6B6B6B6BA9A9A9B0B0B0A7A7A76B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
      00009A4071FA4274FF325DF100009AFF00FFFF00FF00009A224DF1275AFF204C
      F800009AFF00FFFF00FFFF00FFFF00FF6B6B6BBBBBBBBEBEBEAFAFAF6B6B6BFF
      00FFFF00FF6B6B6BA7A7A7B1B1B1AAAAAA6B6B6BFF00FFFF00FFFF00FFFF00FF
      00009A497AFC3B66F300009AFF00FFFF00FFFF00FFFF00FF00009A2550F42655
      FA00009AFF00FFFF00FFFF00FFFF00FF6B6B6BC0C0C0B5B5B56B6B6BFF00FFFF
      00FFFF00FFFF00FF6B6B6BAAAAAAAEAEAE6B6B6BFF00FFFF00FFFF00FFFF00FF
      FF00FF00009A00009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00009A0000
      9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    NumGlyphs = 2
    TabOrder = 12
    OnClick = btnCancelarClick
  end
end
