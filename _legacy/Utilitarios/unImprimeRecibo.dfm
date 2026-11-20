object frmImprimeRecibo: TfrmImprimeRecibo
  Left = 605
  Height = 219
  Top = 265
  Width = 351
  BorderStyle = bsToolWindow
  Caption = 'Recibo'
  ClientHeight = 219
  ClientWidth = 351
  Font.CharSet = ANSI_CHARSET
  Font.Name = 'Verdana'
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  LCLVersion = '3.6.0.0'
  object btnImprimir: TBitBtn
    Left = 24
    Height = 35
    Top = 160
    Width = 88
    Caption = '&Imprimir'
    OnClick = btnImprimirClick
    TabOrder = 0
  end
  object btnVisualizar: TBitBtn
    Left = 119
    Height = 35
    Top = 160
    Width = 89
    Caption = '&Visualizar'
    OnClick = btnVisualizarClick
    TabOrder = 1
  end
  object btnSair: TBitBtn
    Left = 215
    Height = 35
    Top = 160
    Width = 89
    Caption = '&Sair'
    OnClick = btnSairClick
    TabOrder = 2
  end
  object gbRecibo: TGroupBox
    Left = 16
    Height = 153
    Top = 0
    Width = 209
    Caption = ' Recibo: '
    ClientHeight = 127
    ClientWidth = 199
    TabOrder = 3
    object lbColunas: TLabel
      Left = 10
      Height = 16
      Top = 80
      Width = 52
      Caption = 'Colunas'
      Color = clBtnFace
      ParentColor = False
      Transparent = False
    end
    object edPorta: TEdit
      Left = 105
      Height = 21
      Top = 95
      Width = 93
      TabOrder = 0
    end
    object edColunas: TSpinEdit
      Left = 10
      Height = 21
      Top = 95
      Width = 89
      TabOrder = 1
    end
    object rbA4: TRadioButton
      Left = 16
      Height = 18
      Top = 24
      Width = 83
      Caption = 'Papel A4'
      Checked = True
      TabOrder = 3
      TabStop = True
      OnClick = rbA4Click
    end
    object rbBobina: TRadioButton
      Left = 16
      Height = 18
      Top = 48
      Width = 71
      Caption = 'Bobina'
      TabOrder = 2
      OnClick = rbBobinaClick
    end
  end
end
