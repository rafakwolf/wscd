object frmPagamentoVenda: TfrmPagamentoVenda
  Left = 242
  Top = 151
  ClientHeight = 161
  ClientWidth = 481
  Caption = 'Recebimentos desta venda'
  BorderStyle = bsSingle
  OldCreateOrder = False
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  Font.Charset = ANSI_CHARSET
  Font.Name = 'Verdana'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btnOk: TSpeedButton
    Left = 392
    Top = 128
    Width = 81
    Height = 25
    Hint = 'Efetivar escolha'
    Glyph.Data = {
      36060000424D3606000000000000360000002800000020000000100000000100
      18000000000000060000C40E0000C40E00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF006600006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565656565FF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF0066001EB2311FB133006600FF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6565659A9A9A9A9A9A65
      6565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF00660031C24F22B7381AB02D21B437006600FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565ABABAB9E9E9E9797979C
      9C9C656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      00660047D36D3BCB5E25A83B0066001BA92E1DB132006600FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF656565BFBFBFB5B5B598989865656594
      9494999999656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF006600
      4FD67953DE7F31B54D006600FF00FF006600179D271EAE31006600FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FF656565C4C4C4CACACAA5A5A5656565FF00FF65
      65658C8C8C989898656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      00660041C563006600FF00FFFF00FFFF00FFFF00FF00660019AA2B006600FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF656565B5B5B5656565FF00FFFF00FFFF
      00FFFF00FF656565939393656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF006600149D210066
      00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565FF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FF6565658A8A8A656565FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0066
      00006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FF656565656565FF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FF006600006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565656565FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    Caption = '&Ok'
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Name = 'Verdana'
    ParentColor = False
    Color = clWindow
    TabOrder = 1
    OnClick = btnOkClick
  end
  object lbStatus: TLabel
    Left = 8
    Top = 136
    Width = 46
    Height = 13
    Hint = ''
    Caption = 'lbStatus'
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Name = 'Verdana'
    TabOrder = 2
  end
  object dbgdRectoVenda: TDBGrid
    Left = 0
    Top = 0
    Width = 481
    Height = 120
    Hint = ''
    DataSource = dsVenda
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgConfirmDelete, dgTabs, dgCancelOnExit]
    ReadOnly = True
    LoadMask.Message = 'Loading data...'
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    ParentColor = False
    Color = clWindow
  end
  object sqldVenda: TSQLDataSet
    CommandText = 
      'select '#13#10'  DATARECTO,'#13#10'  FORMARECTO, '#13#10'  VALORRECDO, '#13#10'  VALORRE' +
      'STO '#13#10'from RECTOVENDA'#13#10'where IDVENDA = :VENDA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'VENDA'
        ParamType = ptInput
      end>
    Left = 160
    Top = 48
    object sqldVendaDATARECTO: TDateField
      FieldName = 'DATARECTO'
    end
    object sqldVendaFORMARECTO: TStringField
      FieldName = 'FORMARECTO'
    end
    object sqldVendaVALORRECDO: TFMTBCDField
      FieldName = 'VALORRECDO'
      Precision = 15
    end
    object sqldVendaVALORRESTO: TFMTBCDField
      FieldName = 'VALORRESTO'
      Precision = 15
    end
  end
  object dspVenda: TDataSetProvider
    DataSet = sqldVenda
    Left = 232
    Top = 56
  end
  object cdsVenda: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'VENDA'
        ParamType = ptInput
      end>
    ProviderName = 'dspVenda'
    Left = 304
    Top = 56
    object cdsVendaDATARECTO: TDateField
      FieldName = 'DATARECTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsVendaFORMARECTO: TStringField
      FieldName = 'FORMARECTO'
    end
    object cdsVendaVALORRECDO: TFMTBCDField
      FieldName = 'VALORRECDO'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
    object cdsVendaVALORRESTO: TFMTBCDField
      FieldName = 'VALORRESTO'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
  end
  object dsVenda: TDataSource
    DataSet = cdsVenda
    Left = 400
    Top = 56
  end
end
