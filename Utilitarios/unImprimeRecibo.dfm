object frmImprimeRecibo: TfrmImprimeRecibo
  Left = 259
  Height = 219
  Top = 142
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
  LCLVersion = '2.0.12.0'
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
    ClientHeight = 135
    ClientWidth = 207
    TabOrder = 3
    object lbColunas: TLabel
      Left = 10
      Height = 15
      Top = 80
      Width = 52
      Caption = 'Colunas'
      Color = clBtnFace
      ParentColor = False
      Transparent = False
    end
    object edPorta: TEdit
      Left = 105
      Height = 33
      Top = 95
      Width = 93
      TabOrder = 0
    end
    object edColunas: TSpinEdit
      Left = 10
      Height = 33
      Top = 95
      Width = 89
      TabOrder = 1
    end
    object rbA4: TRadioButton
      Left = 16
      Height = 23
      Top = 24
      Width = 82
      Caption = 'Papel A4'
      Checked = True
      OnClick = rbA4Click
      TabOrder = 3
      TabStop = True
    end
    object rbBobina: TRadioButton
      Left = 16
      Height = 23
      Top = 48
      Width = 71
      Caption = 'Bobina'
      OnClick = rbBobinaClick
      TabOrder = 2
    end
  end
end
