inherited frmRelatorioCaixaMensal: TfrmRelatorioCaixaMensal
  ClientHeight = 168
  ClientWidth = 369
  Caption = 'frmRelatorioCaixaMensal'
  OldCreateOrder = True
  ExplicitWidth = 385
  ExplicitHeight = 207
  PixelsPerInch = 96
  TextHeight = 13
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
  object edtMes: TEdit [1]
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
  object edtAno: TEdit [2]
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
  object rgOrd: TRadioGroup [3]
    Left = 8
    Top = 8
    Width = 361
    Height = 33
    Hint = ''
    ShowHint = True
    Items.Strings = (
      'Lan'#231'amento'
      'Data')
    ItemIndex = 0
    Caption = ' Ordenar por '
    TabOrder = 0
    TabStop = False
    Columns = 2
  end
  inherited dsPadrao: TDataSource
    Left = 216
    Top = 64
  end
end
