object frmCommandoSQL: TfrmCommandoSQL
  Left = 213
  Top = 148
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Executar comando SQL'
  ClientHeight = 312
  ClientWidth = 489
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object btnOK: TBitBtn
    Left = 224
    Top = 280
    Width = 81
    Height = 25
    Caption = 'Executar'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF046209035F09035606014F04014C0401
      4C04014C04014C04014C04014C04014C04013D03FF00FFFF00FFFF00FF078216
      0C9C23099A1D07961505920F03900B038F0A038F0A03900A03900A038F0A0396
      0B027407013D03FF00FFFF00FF0D982513B53A0FAF2D0CAC2309AB1C06A71504
      A50E03A50C03A50C03A50C03A40C03AC0D03960A014C04FF00FFFF00FF10A02D
      1CB44916AD3911A92F0DA7260AA41EFEFEFE059F10039E0C039D0B039C0B03A4
      0C03900A014D04FF00FFFF00FF11A12F28B85B1FB24C18AD3D12AA35FEFEFEFE
      FEFEFEFEFE05A013039F0D039D0B03A50C03900A014C04FF00FFFF00FF11A12F
      3EC2702DBA5F1FB54EFEFEFEFEFEFE0FA92DFEFEFEFEFEFE06A016049E0F03A4
      0C03900A014C04FF00FFFF00FF11A12F5CCC8838BD67FEFEFEFEFEFE18B04314
      AC3A11AB31FEFEFEFEFEFE08A11905A71203910B014D04FF00FFFF00FF11A12F
      70D49742C2702AB85B21B5531BB24DFEFEFE15AD3E11AB350FA92C0BA62309A9
      1C059311025405FF00FFFF00FF11A12F7DD79F4AC5762FBB5F24B757FEFEFEFE
      FEFEFEFEFE16B04113AC370FA92D0DAC2709991B035F09FF00FFFF00FF11A12F
      86DAA654C97F3DC06BFEFEFEFEFEFE23B555FEFEFEFEFEFE18B04515AD3B12AF
      350D9E25056B0CFF00FFFF00FF11A12F93DEB166CF8CFEFEFEFEFEFE34BD642C
      BA5D2BB85CFEFEFEFEFEFE19B04817B14210A12F06760FFF00FFFF00FF11A130
      99E1B590DDAD78D59A6CD0915DCB864CC6783FC16D2CBA5D20B5531DB2511CB5
      4F15A93D088414FF00FFFF00FF11A12F79D79F99E1B69DE2B893DEB183DAA56D
      D3954FC97E35BF6824B75920B5551FB85818AD43098E16FF00FFFF00FFFF00FF
      22A94037B55539B55637B55433B2502AAF4921AA401AA63913A43112A13212A4
      310C9A23FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    ModalResult = 1
    TabOrder = 0
  end
  object btnCancelar: TBitBtn
    Left = 400
    Top = 280
    Width = 81
    Height = 25
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
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 1
  end
  object btnLimpar: TBitBtn
    Left = 312
    Top = 280
    Width = 81
    Height = 25
    Caption = 'Limpar'
    Glyph.Data = {
      26040000424D2604000000000000360000002800000012000000120000000100
      180000000000F0030000120B0000120B00000000000000000000008080008080
      0080800080800080800080800080800080800080800080800080800080800080
      8000808000808000808000808000808000000080800080800080800080800080
      80008080008080008080008080008080EDA463EDA463EDA463EDA463EDA46300
      8080008080008080000000808000808000808000808000808000808000808000
      8080008080EDA463FFE5BAFECCA3F4B781EEA665EDA462EEA767008080008080
      0000008080008080008080008080008080008080008080008080EDA463FFF6CC
      FEE2B7FCCA9FF4B681EEA666EDA463EDA4620080800080800000008080008080
      008080008080008080008080008080008080EDA463FFFBCCFEE2B7FCCBA0F4B7
      82EEA666EDA462EDA46300808000808000000080800080800080800080800080
      80008080008080008080F4CA90FFFFD4FFE7BCFED0A6F6BA86EEA668EDA462ED
      A463EDA4630080800000008080008080008080008080008080008080008080ED
      A463FEF2C7FFFACFFAD3A1F6BB87F2B177EEA565EDA360EDA463EDA463008080
      0000008080008080008080008080008080008080008080EDA767E7AB68D77F32
      DA8136E3954CEAAA66EEB677EFB473EDA766EDA4620080800000008080008080
      008080008080008080008080008080D77D32B74100C95F13DE8339E9A560F0C2
      84F7DAA4F4D79FEEBA79EAA35F00808000000080800080800080800080800080
      80008080008080DA833AC2550BCB6518E0873F004B00004B00FCEEBDFBE6B5F0
      BC7FEAA462008080000000808000808000808000808000808000808000808000
      8080008080DE843C004B001E9A3639D767004B00EDA463008080008080008080
      000000808000808000808000808000808093625D9C695F008080008080004B00
      0A721226AC4423BA410C8616004B000080800080800080800000008080AD8179
      9F6F6AC79D83C4987E9C695DB67844915C5A008080004B00004B000F72170C8C
      18004B00004B000080800080800080800000008080A17675DEB27D9F5B339C6B
      67C29379AC7658915D59008080008080008080026305004B0000808000808000
      808000808000808000000080808C5959905B55AF5E16D1A177A16E63A16A5000
      8080008080008080008080026305004B00008080008080008080008080008080
      00000080800080800080809E5E3AA17065C5A9AB976867008080008080004B00
      004B00004B000080800080800080800080800080800080800000008080008080
      0080808F5C599365669768680080800080800080800080800080800080800080
      8000808000808000808000808000808000000080800080800080800080800080
      8000808000808000808000808000808000808000808000808000808000808000
      80800080800080800000}
    TabOrder = 2
    OnClick = btnLimparClick
  end
  object mmoSQL: TMemo
    Left = 8
    Top = 8
    Width = 473
    Height = 266
    Lines.Strings = (
      'mmoSQL')
    TabOrder = 3
  end
end
