inherited frmRelatorioCaixaMensal: TfrmRelatorioCaixaMensal
  Caption = 'frmRelatorioCaixaMensal'
  ClientHeight = 168
  ClientWidth = 369
  OldCreateOrder = True
  ExplicitWidth = 385
  ExplicitHeight = 207
  PixelsPerInch = 96
  TextHeight = 13
  object rgOrd: TRadioGroup [0]
    Left = 8
    Top = 8
    Width = 361
    Height = 33
    Caption = ' Ordenar por '
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Lan'#231'amento'
      'Data')
    TabOrder = 0
  end
  object edtMes: TEdit [1]
    Left = 32
    Top = 80
    Width = 41
    Height = 21
    TabOrder = 1
    OnExit = edtMesExit
  end
  object edtAno: TEdit [2]
    Left = 80
    Top = 80
    Width = 65
    Height = 21
    TabOrder = 2
    OnExit = edtAnoExit
  end
  inherited pnButtons: TPanel
    Top = 134
    Width = 369
    TabOrder = 3
    ExplicitTop = 134
    ExplicitWidth = 369
    inherited btnVisualizar: TBitBtn
      OnClick = btnVisualizarClick
    end
  end
  inherited dsPadrao: TDataSource
    Left = 216
    Top = 64
  end
end
