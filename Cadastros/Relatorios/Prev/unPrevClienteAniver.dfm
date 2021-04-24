inherited frmPrevClientesAniver: TfrmPrevClientesAniver
  Caption = 'frmPrevClientesAniver'
  ClientHeight = 457
  ClientWidth = 800
  OldCreateOrder = True
  ExplicitWidth = 816
  ExplicitHeight = 495
  PixelsPerInch = 96
  TextHeight = 13
  inherited rrPadrao: TRLReport
    inherited rbTitulo: TRLBand
      inherited lbTitulo: TRLLabel
        Top = 81
        Height = 26
        ExplicitTop = 81
        ExplicitHeight = 26
      end
      inherited rlmCabecalho: TRLMemo
        Height = 80
        ExplicitHeight = 80
      end
      inherited imgLogo: TRLImage
        Height = 80
        ExplicitHeight = 80
      end
    end
    inherited rbRodape: TRLBand
      Top = 170
      ExplicitTop = 170
    end
    object rlbColunas: TRLBand
      Left = 38
      Top = 136
      Width = 718
      Height = 16
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Color = clBtnFace
      ParentColor = False
      Transparent = False
      object lbNome: TRLLabel
        Left = 5
        Top = 0
        Width = 39
        Height = 16
        Caption = 'Nome'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object lbDataNasc: TRLLabel
        Left = 200
        Top = 0
        Width = 73
        Height = 16
        Caption = 'Data Nasc.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object lbEndereco: TRLLabel
        Left = 304
        Top = 0
        Width = 64
        Height = 16
        Caption = 'Endere'#231'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object lbCidade: TRLLabel
        Left = 488
        Top = 0
        Width = 47
        Height = 16
        Caption = 'Cidade'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object lbFone: TRLLabel
        Left = 624
        Top = 0
        Width = 34
        Height = 16
        Caption = 'Fone'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
    end
    object rlbDetalhe: TRLBand
      Left = 38
      Top = 152
      Width = 718
      Height = 18
      BeforePrint = rlbDetalheBeforePrint
      object rldbNome: TRLDBText
        Left = 5
        Top = 1
        Width = 192
        Height = 16
        AutoSize = False
        DataField = 'NOME'
        DataSource = dsPadrao
        Text = ''
      end
      object rldbDataNasc: TRLDBText
        Left = 200
        Top = 1
        Width = 68
        Height = 16
        DataField = 'DATANASC'
        DataSource = dsPadrao
        Text = ''
      end
      object rldbEndereco: TRLDBText
        Left = 304
        Top = 1
        Width = 183
        Height = 16
        AutoSize = False
        DataField = 'ENDERECO'
        DataSource = dsPadrao
        Text = ''
      end
      object rldbCidade: TRLDBText
        Left = 488
        Top = 1
        Width = 134
        Height = 16
        AutoSize = False
        DataField = 'CIDADE'
        DataSource = dsPadrao
        Text = ''
      end
      object rldbFone: TRLDBText
        Left = 624
        Top = 1
        Width = 89
        Height = 16
        AutoSize = False
        DataField = 'FONE'
        DataSource = dsPadrao
        Text = ''
      end
    end
  end
  inherited sqldPadrao: TSQLQuery
    CommandText = 
      'select * from '#13#10'STPGETCLIENTEANIVER(:PTIPO, :PDIAINI, :PDIAFIM, ' +
      ':PMES, :PANO, :PDATA1, :PDATA2)'#13#10'order by DATANASC, NOME'
    Params = <
      item
        DataType = ftInteger
        Name = 'PTIPO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PDIAINI'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PDIAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PMES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PANO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATA1'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATA2'
        ParamType = ptInput
      end>
  end
  inherited cdsPadrao: TMemDataset
    Params = <
      item
        DataType = ftInteger
        Name = 'PTIPO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PDIAINI'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PDIAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PMES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PANO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATA1'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATA2'
        ParamType = ptInput
      end>
    object cdsPadraoNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object cdsPadraoDATANASC: TDateField
      FieldName = 'DATANASC'
    end
    object cdsPadraoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object cdsPadraoCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object cdsPadraoBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 50
    end
    object cdsPadraoCEP: TStringField
      FieldName = 'CEP'
    end
    object cdsPadraoFONE: TStringField
      FieldName = 'FONE'
    end
  end
end
