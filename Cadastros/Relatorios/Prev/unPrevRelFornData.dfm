inherited frmPrevRelFornData: TfrmPrevRelFornData
  Top = 24
  Caption = 'frmPrevRelFornData'
  ClientHeight = 514
  ClientWidth = 869
  OldCreateOrder = True
  ExplicitWidth = 885
  ExplicitHeight = 552
  PixelsPerInch = 96
  TextHeight = 13
  inherited rrPadrao: TRLReport
    Width = 1123
    Height = 794
    PageSetup.Orientation = poLandscape
    ExplicitWidth = 1123
    ExplicitHeight = 794
    inherited rbTitulo: TRLBand
      Width = 1047
      ExplicitWidth = 1047
      inherited lbTitulo: TRLLabel
        Width = 1045
        Caption = 'Relat'#243'rio de Fornecedores'
        ExplicitWidth = 1045
      end
      inherited rlmCabecalho: TRLMemo
        Width = 947
        ExplicitWidth = 947
      end
    end
    inherited rbRodape: TRLBand
      Top = 176
      Width = 1047
      ExplicitTop = 176
      ExplicitWidth = 1047
      inherited sysData: TRLSystemInfo
        Left = 935
        ExplicitLeft = 935
      end
      inherited sysPage: TRLSystemInfo
        Left = 871
        ExplicitLeft = 871
      end
    end
    object rbColunas: TRLBand
      Left = 38
      Top = 139
      Width = 1047
      Height = 19
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object lbCodigo: TRLLabel
        Left = 8
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
      object lbFantazia: TRLLabel
        Left = 80
        Top = 1
        Width = 58
        Height = 16
        Caption = 'Fantazia'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbEndereco: TRLLabel
        Left = 680
        Top = 1
        Width = 64
        Height = 16
        Caption = 'Endere'#231'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbCNPJ: TRLLabel
        Left = 544
        Top = 1
        Width = 34
        Height = 16
        Caption = 'CNPJ'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbFone: TRLLabel
        Left = 928
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
      object lbCidade: TRLLabel
        Left = 328
        Top = 1
        Width = 47
        Height = 16
        Caption = 'Cidade'
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
      Width = 1047
      Height = 18
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = False
      BeforePrint = rbDetalheBeforePrint
      object dbCodigo: TRLDBText
        Left = 8
        Top = 1
        Width = 50
        Height = 16
        Alignment = taRightJustify
        DataField = 'CODIGO'
        DataSource = dsPadrao
        Text = ''
      end
      object dbFantazia: TRLDBText
        Left = 80
        Top = 1
        Width = 241
        Height = 16
        AutoSize = False
        DataField = 'FANTAZIA'
        DataSource = dsPadrao
        Text = ''
      end
      object dbCNPJ: TRLDBText
        Left = 544
        Top = 1
        Width = 133
        Height = 16
        AutoSize = False
        DataField = 'CNPJ'
        DataSource = dsPadrao
        Text = ''
      end
      object dbFone: TRLDBText
        Left = 928
        Top = 1
        Width = 63
        Height = 16
        DataField = 'TELEFONE'
        DataSource = dsPadrao
        Text = ''
      end
      object dbEndereco: TRLDBText
        Left = 680
        Top = 1
        Width = 241
        Height = 16
        AutoSize = False
        DataField = 'ENDERECO'
        DataSource = dsPadrao
        Text = ''
      end
      object rldbCidade: TRLDBText
        Left = 328
        Top = 0
        Width = 209
        Height = 16
        AutoSize = False
        DataField = 'CIDADE'
        DataSource = dsPadrao
        Text = ''
      end
    end
  end
  inherited sqldPadrao: TSQLQuery
    CommandText = 
      'select '#13#10'  CODIGO, '#13#10'  DATA,'#13#10'  FANTAZIA, '#13#10'  CNPJ,  '#13#10'  ENDEREC' +
      'O, '#13#10'  CIDADE,'#13#10'  TELEFONE '#13#10'from VIEWRELFORN'#13#10'where DATA betwee' +
      'n :PDATAINI and :PDATAFIM'#13#10'order by CIDADE, FANTAZIA'
    Params = <
      item
        DataType = ftUnknown
        Name = 'PDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PDATAFIM'
        ParamType = ptInput
      end>
    object sqldPadraoCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object sqldPadraoDATA: TDateField
      FieldName = 'DATA'
    end
    object sqldPadraoFANTAZIA: TStringField
      FieldName = 'FANTAZIA'
      Size = 80
    end
    object sqldPadraoCNPJ: TStringField
      FieldName = 'CNPJ'
    end
    object sqldPadraoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 80
    end
    object sqldPadraoTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
    object sqldPadraoCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 80
    end
  end
  inherited cdsPadrao: TMemDataset
    Params = <
      item
        DataType = ftDate
        Name = 'PDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAFIM'
        ParamType = ptInput
      end>
    object cdsPadraoCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsPadraoDATA: TDateField
      FieldName = 'DATA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoFANTAZIA: TStringField
      FieldName = 'FANTAZIA'
      Size = 80
    end
    object cdsPadraoCNPJ: TStringField
      FieldName = 'CNPJ'
    end
    object cdsPadraoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 80
    end
    object cdsPadraoTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
    object cdsPadraoCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 80
    end
  end
  inherited rlepCalculos: TRLExpressionParser
    Left = 148
  end
end
