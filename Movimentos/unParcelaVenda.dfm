object frmParcelaVenda: TfrmParcelaVenda
  Left = 221
  Top = 127
  ClientHeight = 441
  ClientWidth = 449
  Caption = 'Parcelas'
  BorderStyle = bsSingle
  Position = poMainFormCenter
  OldCreateOrder = False
  ShowHint = True
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  BorderIcons = [biSystemMenu]
  KeyPreview = True
  MonitoredKeys.Keys = <>
  Font.Charset = ANSI_CHARSET
  Font.Name = 'Verdana'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbParcelas: TUniLabel
    Left = 208
    Top = 48
    Width = 48
    Height = 13
    Hint = ''
    ShowHint = True
    Caption = 'Parcelas'
    TabOrder = 11
  end
  object lbPrazoInicio: TUniLabel
    Left = 288
    Top = 48
    Width = 70
    Height = 13
    Hint = ''
    ShowHint = True
    Caption = 'Prazo Inicial'
    TabOrder = 12
  end
  object lbIntervalo: TUniLabel
    Left = 368
    Top = 48
    Width = 52
    Height = 13
    Hint = ''
    ShowHint = True
    Caption = 'Intervalo'
    TabOrder = 13
  end
  object btnOk: TUniBitBtn
    Left = 256
    Top = 408
    Width = 89
    Height = 25
    Hint = ''
    ShowHint = True
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
    Caption = '&OK'
    TabOrder = 0
    OnClick = btnOkClick
  end
  object btnCancelar: TUniBitBtn
    Left = 352
    Top = 408
    Width = 89
    Height = 25
    Hint = ''
    ShowHint = True
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
    TabOrder = 1
  end
  object btnCalcular: TUniBitBtn
    Left = 8
    Top = 408
    Width = 89
    Height = 25
    Hint = ''
    ShowHint = True
    Glyph.Data = {
      9E030000424D9E030000000000009E0200002800000010000000100000000100
      08000000000000010000120B0000120B00009A0000009A00000000000000FFFF
      FF00534B8F0052498A006E587B00FF00FF007F63790086697F0084594E008A59
      4400994517009A653C00B7743B00F6BA8B00453B3300403730002E292500A660
      2100A35E2100BB702F00FBB77B00F2B07700E9AF7A00FFC28900E7B18100E2AD
      7F00F2BB8900C79A730041372E00B56B2200C0773200E2903D00DA8E4100EA9C
      4F00FEAF6300BB8B5B009F785100C4976B00FEC48B00AA835D00C4976C00C498
      6C00FFC78F00352D25003E352C00483E3400393129002B272300FE860000FB81
      0000FA800000F37F0000FA820100F6860800D7740700FA880900E57A0A00EE80
      0D00C56B0C00F3881000DA780F00EF891600E9831800EF8C1E00C9771B00FB96
      2500E0862100FB9A2D00E28A2A00BB742600F39A3800CA883E00FFAB4F00FAAB
      5200C6864100C68A4A008A603400C58B4D00FCB46500AF7F4D00BF8F59007255
      3500C495600070563B00FF880000FF880100FF8B0400FF910A00FE8C0A00FF93
      1100DE7F0F00E1831500B0681300FB951D00E0881C00E78F2800D1842700985F
      1C00A7692200FFA43500A1672300EA953400ED993500A16A2800FFAB4500FFAB
      4600A66E2E009F6C300047311600DC994C00FBB56000D1965000E3A45C006C4F
      2D00C18E5300FFC17900FFC47D00382B1C00FF971300E28E2300E3932D00E99C
      3500FFAD4200EEA34000EEA747003B2C1800362B1C00CF8923003A2D1B00EBA5
      3400E9A33400E29E3400E79F2300EAA12700DC910300E0970E00DEC68800D4C9
      9200DACF9D00D8D1A600D4D0AA00D8D4AF00D9D7B00051CBC00051CBC10050C6
      BB0074D7CE004BCBC4001427DA001C2EC6001C2FC5001F2FBD002030BD001A2A
      D400050505050505050505050505050505050505050505050505050505050505
      0505050A0A0A0A0A0A0A0A0A0A0A0A0A0A057F74706D6866605D593734323231
      540A87162C2E4A712F62407E80757D6C330A8717234F49476A5F440B1D361211
      300A87180E1C4D512B67069903139598380A872627244E4B4C651F040C580809
      300A87192D0F5053106B0794021E96973C0A872A141573222169632041763E39
      540A871A8D8E8C8B8A89887A413F3B35550A871B918F8F909093926E4564615C
      560A850D2829292552726F484643423D570A0586848182837C7B7978775E5B5A
      3A05050505050505050505050505050505050505050505050505050505050505
      0505}
    Caption = '&Calcular'
    TabOrder = 9
    OnClick = btnCalcularClick
  end
  object edtRestoVenda: TUniEdit
    Left = 104
    Top = 64
    Width = 97
    Height = 21
    Hint = ''
    ShowHint = True
    Text = ''
    TabOrder = 10
    Color = clBtnFace
    ReadOnly = True
  end
  object dbeCodCliente: TUniDBEdit
    Left = 8
    Top = 24
    Width = 89
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'CODCLIENTE'
    DataSource = dsVenda
    TabOrder = 2
  end
  object dbeNomeCliente: TUniDBEdit
    Left = 104
    Top = 24
    Width = 337
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'CLIENTE'
    DataSource = dsVenda
    TabOrder = 3
  end
  object dbeDataVenda: TUniDBEdit
    Left = 8
    Top = 64
    Width = 89
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'DATA'
    DataSource = dsVenda
    TabOrder = 4
  end
  object seParcelas: TUniSpinEdit
    Left = 208
    Top = 64
    Width = 73
    Height = 22
    Hint = ''
    ShowHint = True
    Value = 1
    TabOrder = 5
    OnExit = seParcelasExit
  end
  object sePrazoInicio: TUniSpinEdit
    Left = 288
    Top = 64
    Width = 73
    Height = 22
    Hint = ''
    ShowHint = True
    Value = 1
    TabOrder = 6
    OnExit = seParcelasExit
  end
  object seIntervalo: TUniSpinEdit
    Left = 368
    Top = 64
    Width = 73
    Height = 22
    Hint = ''
    ShowHint = True
    Value = 1
    TabOrder = 7
    OnExit = seParcelasExit
  end
  object dbgrdParcelas: TUniDBGrid
    Left = 8
    Top = 96
    Width = 433
    Height = 305
    Hint = ''
    ShowHint = True
    DataSource = dsParcela
    Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgConfirmDelete, dgTabs, dgCancelOnExit]
    LoadMask.Message = 'Loading data...'
    TabOrder = 8
    ParentColor = False
    Color = clWindow
  end
  object sqldParcela: TSQLDataSet
    CommandText = 
      'select'#13#10'  cast(NULL as INTEGER) NUMERO,'#13#10'  cast(NULL as DATE) VE' +
      'NC,'#13#10'  cast(NULL as VARCHAR(20)) DIA,'#13#10'  cast(NULL as FLOAT) VAL' +
      'OR'#13#10'from RDB$DATABASE'
    MaxBlobSize = -1
    Params = <>
    Left = 192
    Top = 160
    object sqldParcelaNUMERO: TIntegerField
      FieldName = 'NUMERO'
    end
    object sqldParcelaVENC: TDateField
      FieldName = 'VENC'
    end
    object sqldParcelaDIA: TStringField
      FieldName = 'DIA'
    end
    object sqldParcelaVALOR: TFloatField
      FieldName = 'VALOR'
    end
  end
  object dspParcela: TDataSetProvider
    DataSet = sqldParcela
    Options = [poPropogateChanges, poUseQuoteChar]
    Left = 224
    Top = 160
  end
  object cdsParcela: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspParcela'
    Left = 256
    Top = 160
    object cdsParcelaNUMERO: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
    end
    object cdsParcelaVENC: TDateField
      DisplayLabel = 'Vencimento'
      FieldName = 'VENC'
      OnChange = cdsParcelaVENCChange
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsParcelaDIA: TStringField
      DisplayLabel = 'Dia'
      FieldName = 'DIA'
    end
    object cdsParcelaVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
  end
  object dsParcela: TDataSource
    DataSet = cdsParcela
    Left = 288
    Top = 160
  end
  object sqldVenda: TSQLDataSet
    CommandText = 
      'select '#13#10'  ven.CODIGO,'#13#10'  ven.CODCLIENTE,'#13#10'  cli.NOME CLIENTE,'#13#10 +
      '  ven.DATA,'#13#10'  ven.TOTAL'#13#10'from VENDA ven'#13#10'left join CLIENTES cli' +
      ' on (ven.CODCLIENTE = cli.CODCLIENTE)'#13#10'where ven.CODIGO = :IDVEN' +
      'DA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'IDVENDA'
        ParamType = ptInput
      end>
    Left = 224
    Top = 192
    object sqldVendaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sqldVendaCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
    end
    object sqldVendaCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Size = 80
    end
    object sqldVendaDATA: TDateField
      FieldName = 'DATA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object sqldVendaTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 15
    end
  end
  object dsVenda: TDataSource
    DataSet = sqldVenda
    Left = 264
    Top = 192
  end
  object sqldReceber: TSQLDataSet
    CommandText = 
      'insert into CONTASRECEBER(CODIGO, DATA, VENCIMENTO, CLIENTE, DES' +
      'CRICAO,'#13#10'  DOCUMENTO, VALOR, JURO, RECEBER, VENDA, RECDA)'#13#10'value' +
      's(:CODIGO, :DATA, :VENCIMENTO, :IDCLIENTE, :DESCRICAO, :DOCUMENT' +
      'O,'#13#10'       :VALOR, :JURO, '#39'N'#39', :VENDA, '#39'N'#39')'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'VENCIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESCRICAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'JURO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'VENDA'
        ParamType = ptInput
      end>
    Left = 192
    Top = 192
  end
end
