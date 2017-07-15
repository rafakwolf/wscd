object frmProEstoqueMinimo: TfrmProEstoqueMinimo
  Left = 37
  Top = 108
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'frmProEstoqueMinimo'
  ClientHeight = 417
  ClientWidth = 769
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GradeProd: TDBGrid
    Left = 8
    Top = 8
    Width = 753
    Height = 369
    DataSource = dsProdEM
    Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Verdana'
    TitleFont.Style = []
    OnDrawColumnCell = GradeProdDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_BARRA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Title.Caption = 'C'#243'digo'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Arial'
        Title.Font.Style = []
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRO_DESCRICAO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Title.Caption = 'Produto'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Arial'
        Title.Font.Style = []
        Width = 291
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRO_ESTOQUE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Title.Caption = 'Estoque'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Arial'
        Title.Font.Style = []
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTDE_MINIMA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Title.Caption = 'Qtde M'#237'nima'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Arial'
        Title.Font.Style = []
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FORNECEDOR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Title.Caption = 'Fornecedor'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Arial'
        Title.Font.Style = []
        Width = 193
        Visible = True
      end>
  end
  object btnFechar: TBitBtn
    Left = 672
    Top = 384
    Width = 89
    Height = 25
    Caption = '&Fechar'
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
    TabOrder = 2
    OnClick = btnFecharClick
  end
  object btnZerarNegativo: TBitBtn
    Left = 488
    Top = 384
    Width = 177
    Height = 25
    Caption = 'Zerar estoque negativo'
    Glyph.Data = {
      36060000424D3606000000000000360000002800000020000000100000000100
      18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      000D6C000D68000C5D000A53000A4F000A4F000A4F000A4F000A4F000A4F000A
      4F000840FF00FFFF00FFFF00FFFF00FF9898989797979494949191918F8F8F8F
      8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8B8B8BFF00FFFF00FFFF00FF001397
      0017BB0016B40015AA0013A00013990013970013970013990013990013970013
      9E000F7B000840FF00FFFF00FFA3A3A3ACACACAAAAAAA8A8A8A6A6A6A4A4A4A3
      A3A3A3A3A3A4A4A4A4A4A4A3A3A3A5A5A59C9C9C8B8B8BFF00FFFF00FF0017B8
      001CE3001AD40019CC0018C50017BB0016B10016AF0016AF0016AF0016AF0016
      B600139E000A4FFF00FFFF00FFACACACB6B6B6B2B2B2B0B0B0AFAFAFACACACAA
      AAAAA9A9A9A9A9A9A9A9A9A9A9A9ABABABA5A5A58F8F8FFF00FFFF00FF0018C7
      001EF0001CE1001AD10018C70018C00016B60016AF0015AA0015A70014A50016
      AF001399000A51FF00FFFF00FFAFAFAFB9B9B9B5B5B5B2B2B2AFAFAFADADADAB
      ABABA9A9A9A8A8A8A7A7A7A7A7A7A9A9A9A4A4A4909090FF00FFFF00FF0018CA
      0224FF001FF6001CE3001AD40018CAFFFFFFFFFFFF0016B10015AA0015A70016
      AF001399000A4FFF00FFFF00FFB0B0B0BEBEBEBABABAB6B6B6B2B2B2B0B0B0FF
      FFFFFFFFFFAAAAAAA8A8A8A7A7A7A9A9A9A4A4A48F8F8FFF00FFFF00FF0018CA
      163BFF0629FF001FF6001CE3FEFEFEFFFFFFFFFFFFFFFFFF0016B40015AC0016
      AF001399000A4FFF00FFFF00FFB0B0B0C8C8C8C1C1C1BABABAB6B6B6FFFFFFFF
      FFFFFFFFFFFFFFFFAAAAAAA9A9A9A9A9A9A4A4A48F8F8FFF00FFFF00FF0018CA
      3559FF0F35FF0121FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0017B80016
      B600139C000A51FF00FFFF00FFB0B0B0D4D4D4C5C5C5BDBDBDFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFACACACABABABA4A4A4909090FF00FFFF00FF0018CA
      4E6EFF193FFFFFFFFFFFFFFFFFFFFF001CE6001CDEFFFFFFFFFFFFFFFFFF0018
      C00014A3000B59FF00FFFF00FFB0B0B0DCDCDCCACACAFFFFFFFFFFFFFFFFFFB6
      B6B6B5B5B5FFFFFFFFFFFFFFFFFFADADADA6A6A6929292FF00FFFF00FF0018CA
      5A79FF2146FFFFFFFFFFFFFF001EF0001DEE001DEB001CE1FFFFFFFFFFFF0019
      CC0016B1000D6AFF00FFFF00FFB0B0B0DFDFDFCDCDCDFFFFFFFFFFFFB9B9B9B8
      B8B8B8B8B8B5B5B5FFFFFFFFFFFFB0B0B0AAAAAA979797FF00FFFF00FF0018CA
      6783FF2D51FF1338FF0D31FF0325FF001FFF001FF8001DEE001CE6001CDE001B
      D90017BD000F79FF00FFFF00FFB0B0B0E3E3E3D1D1D1C7C7C7C4C4C4BFBFBFBC
      BCBCBBBBBBB8B8B8B6B6B6B5B5B5B3B3B3ADADAD9B9B9BFF00FFFF00FF0018CA
      7690FF4163FF1B40FF163BFF0C30FF0528FF0427FF001FFF001EF0001CE9001C
      E60018C7001187FF00FFFF00FFB0B0B0E7E7E7D7D7D7CACACAC8C8C8C4C4C4C0
      C0C0BFBFBFBCBCBCB9B9B9B7B7B7B6B6B6AFAFAF9F9F9FFF00FFFF00FF0018CA
      7F98FF728CFF5676FF4668FF3559FF2449FF163BFF0528FF001FF8001EF0001E
      F0001BD9001399FF00FFFF00FFB0B0B0E9E9E9E6E6E6DEDEDED9D9D9D4D4D4CE
      CECEC8C8C8C0C0C0BBBBBBB9B9B9B9B9B9B3B3B3A4A4A4FF00FFFF00FF0018CA
      5877FF7F98FF839CFF7690FF6582FF4A6BFF284CFF0E33FF0121FF001FF8001F
      FB001CE30014A5FF00FFFF00FFB0B0B0DFDFDFE9E9E9EBEBEBE7E7E7E2E2E2DA
      DADACFCFCFC5C5C5BDBDBDBBBBBBBBBBBBB6B6B6A7A7A7FF00FFFF00FFFF00FF
      001DEE0A2EFF0C30FF0A2EFF0629FF0121FF001DEE001CDE001AD10019CC0019
      CF0017B8FF00FFFF00FFFF00FFFF00FFB8B8B8C3C3C3C4C4C4C3C3C3C1C1C1BD
      BDBDB8B8B8B5B5B5B2B2B2B0B0B0B1B1B1ACACACFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    NumGlyphs = 2
    TabOrder = 1
    OnClick = btnZerarNegativoClick
  end
  object dspProdEM: TDataSetProvider
    DataSet = sqlProdEM
    Options = [poAllowCommandText]
    Left = 80
    Top = 136
  end
  object cdsProdEM: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProdEM'
    Left = 112
    Top = 136
    object cdsProdEMCOD_BARRA: TStringField
      FieldName = 'COD_BARRA'
      Size = 13
    end
    object cdsProdEMPRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      Size = 80
    end
    object cdsProdEMPRO_ESTOQUE: TIntegerField
      FieldName = 'PRO_ESTOQUE'
    end
    object cdsProdEMQTDE_MINIMA: TIntegerField
      FieldName = 'QTDE_MINIMA'
    end
    object cdsProdEMFORNECEDOR: TStringField
      FieldName = 'FORNECEDOR'
      Size = 80
    end
  end
  object dsProdEM: TDataSource
    AutoEdit = False
    DataSet = cdsProdEM
    Left = 144
    Top = 136
  end
  object sqlProdEM: TSQLDataSet
    CommandText = 
      'select '#13#10'  COD_BARRA,'#13#10'  PRO_DESCRICAO,'#13#10'  PRO_ESTOQUE,'#13#10'  QTDE_' +
      'MINIMA,'#13#10'  FORNECEDOR'#13#10'from VIEWPRODUTOSMINIMOS'
    MaxBlobSize = -1
    Params = <>
    Left = 48
    Top = 136
    object sqlProdEMCOD_BARRA: TStringField
      FieldName = 'COD_BARRA'
      Size = 13
    end
    object sqlProdEMPRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      Size = 80
    end
    object sqlProdEMPRO_ESTOQUE: TIntegerField
      FieldName = 'PRO_ESTOQUE'
    end
    object sqlProdEMQTDE_MINIMA: TIntegerField
      FieldName = 'QTDE_MINIMA'
    end
    object sqlProdEMFORNECEDOR: TStringField
      FieldName = 'FORNECEDOR'
      Size = 80
    end
  end
end