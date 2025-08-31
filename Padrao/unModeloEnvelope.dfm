object frmModeloEnvelope: TfrmModeloEnvelope
  Left = 354
  Height = 443
  Top = 186
  Width = 865
  Caption = 'frmModeloEnvelope'
  ClientHeight = 443
  ClientWidth = 865
  Font.Name = 'MS Sans Serif'
  OnCreate = FormCreate
  object rrEnvelope: TRLReport
    Left = 0
    Height = 416
    Top = 0
    Width = 831
    DataSource = dsPadrao
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    PageSetup.PaperSize = fpEnv_DL
    PageSetup.Orientation = poLandscape
    PreviewOptions.ShowModal = True
    BeforePrint = rrEnvelopeBeforePrint
    object rbFundo: TRLBand
      Left = 38
      Height = 339
      Top = 38
      Width = 755
      object lbEmpresa: TRLLabel
        Left = 32
        Height = 22
        Top = 26
        Width = 425
        AutoSize = False
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbEndereco: TRLLabel
        Left = 32
        Height = 16
        Top = 49
        Width = 425
        AutoSize = False
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        ParentFont = False
      end
      object lbTelefone: TRLLabel
        Left = 32
        Height = 16
        Top = 66
        Width = 425
        AutoSize = False
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        ParentFont = False
      end
      object lbCNPJ_IE: TRLLabel
        Left = 32
        Height = 16
        Top = 83
        Width = 425
        AutoSize = False
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        ParentFont = False
      end
      object dbNome: TRLDBText
        Left = 328
        Height = 15
        Top = 192
        Width = 420
        AutoSize = False
        DataField = 'NOME'
        DataSource = dsPadrao
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbEndereco: TRLDBText
        Left = 328
        Height = 15
        Top = 214
        Width = 420
        AutoSize = False
        DataField = 'ENDERECO'
        DataSource = dsPadrao
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        ParentFont = False
      end
      object dbCidade: TRLDBText
        Left = 328
        Height = 15
        Top = 236
        Width = 420
        AutoSize = False
        DataField = 'CIDADE'
        DataSource = dsPadrao
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        ParentFont = False
      end
      object dbBairro: TRLDBText
        Left = 328
        Height = 15
        Top = 258
        Width = 420
        AutoSize = False
        DataField = 'BAIRRO'
        DataSource = dsPadrao
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        ParentFont = False
      end
      object dbCep: TRLDBText
        Left = 328
        Height = 15
        Top = 280
        Width = 420
        AutoSize = False
        DataField = 'CEP'
        DataSource = dsPadrao
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        ParentFont = False
      end
      object lbPara: TRLLabel
        Left = 280
        Height = 19
        Top = 168
        Width = 45
        Caption = 'Para:'
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object dsPadrao: TDataSource
    DataSet = sqldPadrao
    Left = 312
    Top = 144
  end
  object sqldPadrao: TZQuery
    Params = <>
    Left = 218
    Top = 183
  end
end
