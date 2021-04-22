inherited frmPrevListagemClientes: TfrmPrevListagemClientes
  Caption = 'frmPrevListagemClientes'
  ClientHeight = 461
  ClientWidth = 804
  OldCreateOrder = True
  ExplicitWidth = 820
  ExplicitHeight = 500
  PixelsPerInch = 96
  TextHeight = 13
  inherited rrPadrao: TRLReport
    inherited rbTitulo: TRLBand
      inherited lbTitulo: TRLLabel
        Top = 75
        Height = 32
        Caption = 'Listagem de Clientes'
        ExplicitTop = 75
        ExplicitHeight = 32
      end
      inherited rlmCabecalho: TRLMemo
        Height = 74
        ExplicitHeight = 74
      end
      inherited imgLogo: TRLImage
        Height = 74
        ExplicitHeight = 74
      end
    end
    inherited rbRodape: TRLBand
      Top = 175
      ExplicitTop = 175
    end
    object rbColuna: TRLBand
      Left = 38
      Top = 139
      Width = 718
      Height = 19
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object lbCodigo: TRLLabel
        Left = 3
        Top = 1
        Width = 47
        Height = 16
        Caption = 'C'#243'digo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbNome: TRLLabel
        Left = 64
        Top = 1
        Width = 39
        Height = 16
        Caption = 'Nome'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbCPJ_CNPJ: TRLLabel
        Left = 352
        Top = 1
        Width = 62
        Height = 16
        Caption = 'CPJ-CNPJ'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbDataNasc: TRLLabel
        Left = 488
        Top = 1
        Width = 101
        Height = 16
        Caption = 'Dt. Nascimento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbFone: TRLLabel
        Left = 608
        Top = 1
        Width = 59
        Height = 16
        Caption = 'Telefone'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object rbDetalhe: TRLBand
      Left = 38
      Top = 158
      Width = 718
      Height = 17
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = False
      BeforePrint = rbDetalheBeforePrint
      object dbCodigo: TRLDBText
        Left = 3
        Top = 0
        Width = 50
        Height = 16
        DataField = 'CODIGO'
        DataSource = dsPadrao
        Text = ''
      end
      object dbNome: TRLDBText
        Left = 64
        Top = 0
        Width = 285
        Height = 16
        AutoSize = False
        DataField = 'NOME'
        DataSource = dsPadrao
        Text = ''
      end
      object dbCPJ_CNPJ: TRLDBText
        Left = 352
        Top = 0
        Width = 61
        Height = 16
        DataField = 'CPF_CNPJ'
        DataSource = dsPadrao
        Text = ''
      end
      object dbDataNasc: TRLDBText
        Left = 488
        Top = 0
        Width = 114
        Height = 16
        DataField = 'DATANASCIMENTO'
        DataSource = dsPadrao
        Text = ''
      end
      object dbFone: TRLDBText
        Left = 608
        Top = 0
        Width = 63
        Height = 16
        DataField = 'TELEFONE'
        DataSource = dsPadrao
        Text = ''
      end
    end
  end
  inherited sqldPadrao: TSQLDataSet
    CommandText = 
      'select '#13#10'  CODIGO, '#13#10'  NOME, '#13#10'  ENDERECO, '#13#10'  CPF_CNPJ, '#13#10'  RG_' +
      'IE, '#13#10'  DATANASCIMENTO, '#13#10'  CODCIDADE, '#13#10'  CIDADE, '#13#10'  TELEFONE,' +
      ' '#13#10'  TIPO '#13#10'from VIEWRELCLIENTES'
    object sqldPadraoCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object sqldPadraoNOME: TStringField
      FieldName = 'NOME'
      Size = 80
    end
    object sqldPadraoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 80
    end
    object sqldPadraoCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
    end
    object sqldPadraoRG_IE: TStringField
      FieldName = 'RG_IE'
    end
    object sqldPadraoDATANASCIMENTO: TDateField
      FieldName = 'DATANASCIMENTO'
    end
    object sqldPadraoCODCIDADE: TIntegerField
      FieldName = 'CODCIDADE'
    end
    object sqldPadraoCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 80
    end
    object sqldPadraoTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
    object sqldPadraoTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
  end
  inherited cdsPadrao: TMemDataset
    object cdsPadraoCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsPadraoNOME: TStringField
      FieldName = 'NOME'
      Size = 80
    end
    object cdsPadraoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 80
    end
    object cdsPadraoCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
    end
    object cdsPadraoRG_IE: TStringField
      FieldName = 'RG_IE'
    end
    object cdsPadraoDATANASCIMENTO: TDateField
      FieldName = 'DATANASCIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoCODCIDADE: TIntegerField
      FieldName = 'CODCIDADE'
    end
    object cdsPadraoCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 80
    end
    object cdsPadraoTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
    object cdsPadraoTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
  end
end
