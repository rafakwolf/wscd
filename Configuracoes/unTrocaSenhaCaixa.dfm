object frmSenhaCaixa: TfrmSenhaCaixa
  Left = 214
  Top = 137
  ClientHeight = 129
  ClientWidth = 225
  Caption = 'Trocar senha'
  OnShow = FormShow
  BorderStyle = bsSingle
  OldCreateOrder = False
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  BorderIcons = [biSystemMenu]
  KeyPreview = True
  MonitoredKeys.Keys = <>
  Font.Charset = ANSI_CHARSET
  Font.Name = 'Verdana'
  PixelsPerInch = 96
  TextHeight = 13
  object btnOk: TUniBitBtn
    Left = 48
    Top = 96
    Width = 81
    Height = 25
    Hint = ''
    Glyph.Data = {
      36060000424D3606000000000000360000002800000020000000100000000100
      18000000000000060000C40E0000C40E00000000000000000000008080008080
      0080800080800080800080800080800080800080800080800080800080800080
      8000808000808000808000808000808000808000808000808000808000808000
      8080008080008080008080008080008080008080008080008080008080008080
      0080800080800080800080800080800080800080800080800080800080800080
      8000808000808000808000808000808000808000808000808000808000808000
      8080008080008080008080008080008080008080008080008080008080008080
      0080800080800080800066000066000080800080800080800080800080800080
      8000808000808000808000808000808000808000808000808065656565656500
      8080008080008080008080008080008080008080008080008080008080008080
      0080800080800066001EB2311FB1330066000080800080800080800080800080
      800080800080800080800080800080800080800080806565659A9A9A9A9A9A65
      6565008080008080008080008080008080008080008080008080008080008080
      00808000660031C24F22B7381AB02D21B4370066000080800080800080800080
      80008080008080008080008080008080008080656565ABABAB9E9E9E9797979C
      9C9C656565008080008080008080008080008080008080008080008080008080
      00660047D36D3BCB5E25A83B0066001BA92E1DB1320066000080800080800080
      80008080008080008080008080008080656565BFBFBFB5B5B598989865656594
      9494999999656565008080008080008080008080008080008080008080006600
      4FD67953DE7F31B54D006600008080006600179D271EAE310066000080800080
      80008080008080008080008080656565C4C4C4CACACAA5A5A565656500808065
      65658C8C8C989898656565008080008080008080008080008080008080008080
      00660041C56300660000808000808000808000808000660019AA2B0066000080
      80008080008080008080008080008080656565B5B5B565656500808000808000
      8080008080656565939393656565008080008080008080008080008080008080
      008080006600008080008080008080008080008080008080006600149D210066
      0000808000808000808000808000808000808065656500808000808000808000
      80800080800080806565658A8A8A656565008080008080008080008080008080
      0080800080800080800080800080800080800080800080800080800080800066
      0000660000808000808000808000808000808000808000808000808000808000
      8080008080008080008080008080656565656565008080008080008080008080
      0080800080800080800080800080800080800080800080800080800080800080
      8000660000660000808000808000808000808000808000808000808000808000
      8080008080008080008080008080008080656565656565008080008080008080
      0080800080800080800080800080800080800080800080800080800080800080
      8000808000808000808000808000808000808000808000808000808000808000
      8080008080008080008080008080008080008080008080008080008080008080
      0080800080800080800080800080800080800080800080800080800080800080
      8000808000808000808000808000808000808000808000808000808000808000
      8080008080008080008080008080008080008080008080008080008080008080
      0080800080800080800080800080800080800080800080800080800080800080
      8000808000808000808000808000808000808000808000808000808000808000
      8080008080008080008080008080008080008080008080008080008080008080
      0080800080800080800080800080800080800080800080800080800080800080
      8000808000808000808000808000808000808000808000808000808000808000
      8080008080008080008080008080008080008080008080008080008080008080
      0080800080800080800080800080800080800080800080800080800080800080
      8000808000808000808000808000808000808000808000808000808000808000
      8080008080008080008080008080008080008080008080008080}
    Caption = '&Ok'
    ModalResult = 1
    TabOrder = 2
    OnClick = btnOkClick
  end
  object btnCancelar: TUniBitBtn
    Left = 136
    Top = 96
    Width = 81
    Height = 25
    Hint = ''
    Glyph.Data = {
      06050000424D060500000000000036000000280000001D0000000E0000000100
      180000000000D0040000C40E0000C40E00000000000000000000008080008080
      0080800080800080800080800080800080800080800080800080800080800080
      8000808000808000808000808000808000808000808000808000808000808000
      80800080800080800080800080800080800000808000808000009A00009A0080
      8000808000808000808000808000808000009A00009A00808000808000808000
      80800080806B6B6B6B6B6B0080800080800080800080800080800080806B6B6B
      6B6B6B0080800080800000808000009A174AFD103BF400009A00808000808000
      808000808000009A002CF80030FC00009A0080800080800080806B6B6BA8A8A8
      A0A0A06B6B6B0080800080800080800080806B6B6B9A9A9A9C9C9C6B6B6B0080
      800000808000009A1A47F81A4CFF123BF100009A00808000808000009A012DF6
      0132FF002AF300009A0080800080800080806B6B6BA7A7A7AAAAAA9F9F9F6B6B
      6B0080800080806B6B6B9999999E9E9E9797976B6B6B00808000008080008080
      00009A1C47F61B4DFF143EF400009A00009A002DF80134FF032BF200009A0080
      800080800080800080800080806B6B6BA7A7A7ABABABA2A2A26B6B6B6B6B6B9A
      9A9A9E9E9E9898986B6B6B0080800080800000808000808000808000009A1D48
      F61D50FF103DFB0431FE0132FF002CF600009A00808000808000808000808000
      80800080800080806B6B6BA7A7A7ACACACA3A3A39F9F9F9E9E9E9999996B6B6B
      0080800080800080800000808000808000808000808000009A1A48F91342FF0C
      3CFF0733F600009A008080008080008080008080008080008080008080008080
      0080806B6B6BA7A7A7A7A7A7A3A3A39C9C9C6B6B6B0080800080800080800080
      800000808000808000808000808000009A214EFC1D4BFF1847FF1743F600009A
      0080800080800080800080800080800080800080800080800080806B6B6BACAC
      ACACACACA9A9A9A4A4A46B6B6B00808000808000808000808000008080008080
      00808000009A2E5BF92C5FFF224DF8204BF82355FF1B46F600009A0080800080
      800080800080800080800080800080806B6B6BB1B1B1B3B3B3ABABABAAAAAAAF
      AFAFA6A6A66B6B6B0080800080800080800000808000808000009A3664FA386B
      FF2D59F400009A00009A224CF42558FF1D49F600009A00808000808000808000
      80800080806B6B6BB6B6B6B9B9B9AEAEAE6B6B6B6B6B6BA9A9A9B0B0B0A7A7A7
      6B6B6B0080800080800000808000009A4071FA4274FF325DF100009A00808000
      808000009A224DF1275AFF204CF800009A0080800080800080806B6B6BBBBBBB
      BEBEBEAFAFAF6B6B6B0080800080806B6B6BA7A7A7B1B1B1AAAAAA6B6B6B0080
      800000808000009A497AFC3B66F300009A00808000808000808000808000009A
      2550F42655FA00009A0080800080800080806B6B6BC0C0C0B5B5B56B6B6B0080
      800080800080800080806B6B6BAAAAAAAEAEAE6B6B6B00808000008080008080
      00009A00009A00808000808000808000808000808000808000009A00009A0080
      800080800080800080800080806B6B6B6B6B6B00808000808000808000808000
      80800080806B6B6B6B6B6B008080008080000080800080800080800080800080
      8000808000808000808000808000808000808000808000808000808000808000
      8080008080008080008080008080008080008080008080008080008080008080
      00808000808000808000}
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 3
  end
  object edAtual: TUniEdit
    Left = 16
    Top = 24
    Width = 145
    Height = 21
    Hint = ''
    PasswordChar = '*'
    Text = ''
    TabOrder = 0
  end
  object edNova: TUniEdit
    Left = 16
    Top = 64
    Width = 145
    Height = 21
    Hint = ''
    PasswordChar = '*'
    Text = ''
    TabOrder = 1
  end
  object sqldConfig: TSQLDataSet
    CommandText = 
      'select '#13#10'  SENHAESTOQUE, '#13#10'  SENHACAIXA '#13#10'from CONFIGURACAO'#13#10'whe' +
      're NOMECOMPUTADOR = :COMP'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'COMP'
        ParamType = ptInput
      end>
    SQLConnection = DmPrincipal.Conexao
    Left = 184
    object sqldConfigSENHAESTOQUE: TStringField
      FieldName = 'SENHAESTOQUE'
      Size = 10
    end
    object sqldConfigSENHACAIXA: TStringField
      FieldName = 'SENHACAIXA'
      Size = 10
    end
  end
  object dspConfig: TDataSetProvider
    DataSet = sqldConfig
    Left = 184
    Top = 32
  end
  object cdsConfig: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'COMP'
        ParamType = ptInput
      end>
    ProviderName = 'dspConfig'
    Left = 184
    Top = 64
    object cdsConfigSENHAESTOQUE: TStringField
      FieldName = 'SENHAESTOQUE'
      Size = 10
    end
    object cdsConfigSENHACAIXA: TStringField
      FieldName = 'SENHACAIXA'
      Size = 10
    end
  end
end
