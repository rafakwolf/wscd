inherited frmRelatorioCaixaMensal: TfrmRelatorioCaixaMensal
  ClientHeight = 168
  ClientWidth = 369
  Caption = 'frmRelatorioCaixaMensal'
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
  inherited pnButtons: TUniContainerPanel
    Top = 134
    Width = 369
    TabOrder = 3
    ExplicitTop = 134
    ExplicitWidth = 369
    inherited btnVisualizar: TUniBitBtn
      OnClick = btnVisualizarClick
    end
  end
  object edtMes: TUniEdit [2]
    Left = 32
    Top = 80
    Width = 41
    Height = 21
    Hint = ''
    ShowHint = True
    Text = ''
    TabOrder = 1
    OnExit = edtMesExit
  end
  object edtAno: TUniEdit [3]
    Left = 80
    Top = 80
    Width = 65
    Height = 21
    Hint = ''
    ShowHint = True
    Text = ''
    TabOrder = 2
    OnExit = edtAnoExit
  end
  inherited dsPadrao: TDataSource
    Left = 216
    Top = 64
  end
end
