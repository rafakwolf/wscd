inherited frmConfiguracao: TfrmConfiguracao
  Left = 394
  Height = 446
  Top = 213
  Width = 779
  Caption = 'frmConfiguracao'
  ClientHeight = 446
  ClientWidth = 779
  inherited sbStatus: TStatusBar
    Top = 428
    Width = 779
  end
  inherited pnBotoesPadrao: TPanel
    Width = 779
    ClientWidth = 779
  end
  object PgConfig: TPageControl[2]
    Left = 8
    Height = 317
    Top = 36
    Width = 729
    ActivePage = TabCaixa
    ParentShowHint = False
    ShowHint = True
    TabIndex = 1
    TabOrder = 1
    object TabImg: TTabSheet
      Caption = 'Papel Parede'
      ClientHeight = 281
      ClientWidth = 723
      ImageIndex = 1
      ParentShowHint = False
      ShowHint = True
      object imgPapelParede: TImage
        Left = 8
        Height = 184
        Hint = 'Imagem do papel de parede'
        Top = 10
        Width = 367
        ParentShowHint = False
        ShowHint = True
      end
      object btnBuscar: TBitBtn
        Left = 12
        Height = 28
        Hint = 'Procurar'
        Top = 224
        Width = 80
        Caption = '&Procurar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = btnBuscarClick
      end
      object btnExImg: TBitBtn
        Left = 100
        Height = 28
        Top = 224
        Width = 80
        Caption = '&Limpar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = btnExImgClick
      end
      object rgOrientationImg: TRadioGroup
        Left = 194
        Height = 66
        Top = 198
        Width = 184
        AutoFill = True
        Caption = ' Orientação '
        ChildSizing.LeftRightSpacing = 6
        ChildSizing.EnlargeHorizontal = crsHomogenousChildResize
        ChildSizing.EnlargeVertical = crsHomogenousChildResize
        ChildSizing.ShrinkHorizontal = crsScaleChilds
        ChildSizing.ShrinkVertical = crsScaleChilds
        ChildSizing.Layout = cclLeftToRightThenTopToBottom
        ChildSizing.ControlsPerLine = 1
        ClientHeight = 39
        ClientWidth = 174
        ItemIndex = 1
        Items.Strings = (
          'Lado a lado'
          'Estender'
        )
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = rgOrientationImgClick
      end
    end
    object TabCaixa: TTabSheet
      Caption = '    Caixa    '
      ClientHeight = 281
      ClientWidth = 723
      ImageIndex = 5
      ParentShowHint = False
      ShowHint = True
      object dbeSenhaCaixa: TDBEdit
        Left = 8
        Height = 21
        Top = 135
        Width = 184
        DataField = 'SENHACAIXA'
        DataSource = dsPadrao
        MaxLength = 0
        ParentShowHint = False
        PasswordChar = '*'
        ShowHint = True
        TabOrder = 1
      end
      object dbcbMostrarSaldo: TDBCheckBox
        Left = 8
        Height = 17
        Top = 192
        Width = 176
        Caption = 'Mostrar saldo do caixa'
        DataField = 'MOSTRARSALDOCAIXA'
        DataSource = dsPadrao
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dbcbLanc90Dias: TDBCheckBox
        Left = 8
        Height = 17
        Top = 212
        Width = 281
        Caption = 'Mostrar lançamentos dos últimos 90 dias'
        DataField = 'CAIXA90DIAS'
        DataSource = dsPadrao
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object grpCaixaPadrao: TGroupBox
        Left = 8
        Height = 68
        Top = 5
        Width = 365
        Caption = ' Conta caixa padrão '
        ClientHeight = 41
        ClientWidth = 355
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object dbcmbContas: TDBLookupComboBox
          Left = 8
          Height = 20
          Top = 8
          Width = 340
          DataField = 'CAIXAPADRAO'
          DataSource = dsPadrao
          KeyField = 'CODIGO'
          ListField = 'NOME'
          ListFieldIndex = 0
          ListSource = dsContas
          LookupCache = False
          TabOrder = 0
        end
      end
      object btnAlterarSenhaCaixa: TBitBtn
        Left = 208
        Height = 32
        Top = 128
        Width = 129
        Caption = 'Alterar senha'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = btnAlterarSenhaCaixaClick
      end
      object Label1: TLabel
        Left = 8
        Height = 16
        Top = 112
        Width = 170
        Caption = 'Senha para acesso ao Caixa'
      end
    end
    object tsRelatorio: TTabSheet
      Caption = 'Relatórios'
      ClientHeight = 281
      ClientWidth = 723
      ImageIndex = 12
      ParentShowHint = False
      ShowHint = True
      object dbckbRelZebrado: TDBCheckBox
        Left = 24
        Height = 17
        Top = 24
        Width = 152
        Caption = 'Visualizar zebrado'
        DataField = 'RELZEBRADO'
        DataSource = dsPadrao
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
    end
  end
  inherited actlNavigateActions: TActionList[3]
    Left = 416
    Top = 360
  end
  inherited dsPadrao: TDataSource[4]
    AutoEdit = True
    DataSet = sqldPadrao
    Left = 152
    Top = 368
  end
  object opImagem: TOpenPictureDialog[5]
    Filter = 'JPEG Image File (*.jpg)|*.jpg|JPEG Image File (*.jpeg)|*.jpeg|Bitmaps (*.bmp)|*.bmp'
    Left = 288
    Top = 368
  end
  object sqldPadrao: TZQuery[6]
    Connection = DmPrincipal.ZConnection1
    SQL.Strings = (
      'select * from CONFIGURACAO'
      'where NOMECOMPUTADOR = :COMP'
    )
    Params = <    
      item
        Name = 'COMP'
      end>
    Left = 56
    Top = 368
    ParamData = <    
      item
        Name = 'COMP'
      end>
    object sqldPadraoIDCONFIGURACAO: TZIntegerField
      FieldKind = fkData
      FieldName = 'IDCONFIGURACAO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object sqldPadraoNOMECOMPUTADOR: TZRawStringField
      FieldKind = fkData
      FieldName = 'NOMECOMPUTADOR'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object sqldPadraoCAIXAPADRAO: TZIntegerField
      FieldKind = fkData
      FieldName = 'CAIXAPADRAO'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object sqldPadraoSENHACAIXA: TZRawStringField
      FieldKind = fkData
      FieldName = 'SENHACAIXA'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 50
    end
    object sqldPadraoMOSTRARSALDOCAIXA: TZRawStringField
      FieldKind = fkData
      FieldName = 'MOSTRARSALDOCAIXA'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object sqldPadraoCAIXA90DIAS: TZRawStringField
      FieldKind = fkData
      FieldName = 'CAIXA90DIAS'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object sqldPadraoRELZEBRADO: TZRawStringField
      FieldKind = fkData
      FieldName = 'RELZEBRADO'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
  end
  object sqldContas: TZQuery[7]
    Connection = DmPrincipal.ZConnection1
    SQL.Strings = (
      'select * from CAIXAS'
    )
    Params = <>
    Left = 560
    Top = 224
    object sqldContasCODIGO: TZIntegerField
      FieldKind = fkData
      FieldName = 'CODIGO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object sqldContasNOME: TZRawStringField
      FieldKind = fkData
      FieldName = 'NOME'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object sqldContasINATIVO: TZRawStringField
      FieldKind = fkData
      FieldName = 'INATIVO'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
  end
  object dsContas: TDataSource[8]
    DataSet = sqldContas
    Left = 648
    Top = 232
  end
end
