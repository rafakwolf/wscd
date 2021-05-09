object frmSenhaCaixa: TfrmSenhaCaixa
  Left = 276
  Height = 214
  Top = 167
  Width = 330
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Trocar senha'
  ClientHeight = 214
  ClientWidth = 330
  Font.CharSet = ANSI_CHARSET
  Font.Name = 'Verdana'
  KeyPreview = True
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  LCLVersion = '2.0.12.0'
  object btnOk: TBitBtn
    Left = 34
    Height = 37
    Top = 106
    Width = 81
    Caption = '&Ok'
    ModalResult = 1
    OnClick = btnOkClick
    TabOrder = 2
  end
  object btnCancelar: TBitBtn
    Left = 122
    Height = 37
    Top = 106
    Width = 81
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 3
  end
  object edAtual: TEdit
    Left = 16
    Height = 33
    Top = 24
    Width = 145
    EchoMode = emPassword
    PasswordChar = '*'
    TabOrder = 0
  end
  object edNova: TEdit
    Left = 16
    Height = 33
    Top = 64
    Width = 145
    EchoMode = emPassword
    PasswordChar = '*'
    TabOrder = 1
  end
  object ZQuery1: TZQuery
    Connection = DmPrincipal.ZConnection1
    UpdateObject = ZUpdateSQL1
    SQL.Strings = (
      'select * from CONFIGURACAO'
    )
    Params = <>
    Left = 232
    Top = 48
  end
  object ZUpdateSQL1: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM CONFIGURACAO'
      'WHERE'
      '  CONFIGURACAO.IDCONFIGURACAO = :OLD_IDCONFIGURACAO'
    )
    InsertSQL.Strings = (
      'INSERT INTO CONFIGURACAO'
      '  (NOMECOMPUTADOR, BARRAFERRAMENTA, HINTBALAO, GRAVAERRO, BACKUP, LOG, '
      '   IMPRESSORA, RESOLUCAO, LETRACODIGOBARRA, EXIBEDICADIA, AVISACLIENTEATRASO, '
      '   DIREXPORTPADRAO, SENHAESTOQUE, USARSENHAESTOQUE, ESTOQUEPADRAO, BORDAETQPROD, '
      '   ALIQUOTAPADRAO, DESCPADRAOPROD, CAIXAPADRAO, SENHACAIXA, PRODSEMESTOQORCAM, '
      '   ORCAMNAOCONC, EDITORCAMCONC, COMPRANAOCONC, EDITCOMPRACONC, PRODSEMESTOQVENDA, '
      '   VENDANAOCONC, EDITVENDACONC, BORDAETQCLIENTE, MOSTRARSALDOCAIXA, CAIXA90DIAS, '
      '   RELZEBRADO, VERIFICA_UPD, CONTACHEQUE, INFOAVISOS)'
      'VALUES'
      '  (:NOMECOMPUTADOR, :BARRAFERRAMENTA, :HINTBALAO, :GRAVAERRO, :BACKUP, '
      '   :LOG, :IMPRESSORA, :RESOLUCAO, :LETRACODIGOBARRA, :EXIBEDICADIA, :AVISACLIENTEATRASO, '
      '   :DIREXPORTPADRAO, :SENHAESTOQUE, :USARSENHAESTOQUE, :ESTOQUEPADRAO, '
      '   :BORDAETQPROD, :ALIQUOTAPADRAO, :DESCPADRAOPROD, :CAIXAPADRAO, :SENHACAIXA, '
      '   :PRODSEMESTOQORCAM, :ORCAMNAOCONC, :EDITORCAMCONC, :COMPRANAOCONC, :EDITCOMPRACONC, '
      '   :PRODSEMESTOQVENDA, :VENDANAOCONC, :EDITVENDACONC, :BORDAETQCLIENTE, '
      '   :MOSTRARSALDOCAIXA, :CAIXA90DIAS, :RELZEBRADO, :VERIFICA_UPD, :CONTACHEQUE, '
      '   :INFOAVISOS)'
    )
    ModifySQL.Strings = (
      'UPDATE CONFIGURACAO SET'
      '  NOMECOMPUTADOR = :NOMECOMPUTADOR,'
      '  BARRAFERRAMENTA = :BARRAFERRAMENTA,'
      '  HINTBALAO = :HINTBALAO,'
      '  GRAVAERRO = :GRAVAERRO,'
      '  BACKUP = :BACKUP,'
      '  LOG = :LOG,'
      '  IMPRESSORA = :IMPRESSORA,'
      '  RESOLUCAO = :RESOLUCAO,'
      '  LETRACODIGOBARRA = :LETRACODIGOBARRA,'
      '  EXIBEDICADIA = :EXIBEDICADIA,'
      '  AVISACLIENTEATRASO = :AVISACLIENTEATRASO,'
      '  DIREXPORTPADRAO = :DIREXPORTPADRAO,'
      '  SENHAESTOQUE = :SENHAESTOQUE,'
      '  USARSENHAESTOQUE = :USARSENHAESTOQUE,'
      '  ESTOQUEPADRAO = :ESTOQUEPADRAO,'
      '  BORDAETQPROD = :BORDAETQPROD,'
      '  ALIQUOTAPADRAO = :ALIQUOTAPADRAO,'
      '  DESCPADRAOPROD = :DESCPADRAOPROD,'
      '  CAIXAPADRAO = :CAIXAPADRAO,'
      '  SENHACAIXA = :SENHACAIXA,'
      '  PRODSEMESTOQORCAM = :PRODSEMESTOQORCAM,'
      '  ORCAMNAOCONC = :ORCAMNAOCONC,'
      '  EDITORCAMCONC = :EDITORCAMCONC,'
      '  COMPRANAOCONC = :COMPRANAOCONC,'
      '  EDITCOMPRACONC = :EDITCOMPRACONC,'
      '  PRODSEMESTOQVENDA = :PRODSEMESTOQVENDA,'
      '  VENDANAOCONC = :VENDANAOCONC,'
      '  EDITVENDACONC = :EDITVENDACONC,'
      '  BORDAETQCLIENTE = :BORDAETQCLIENTE,'
      '  MOSTRARSALDOCAIXA = :MOSTRARSALDOCAIXA,'
      '  CAIXA90DIAS = :CAIXA90DIAS,'
      '  RELZEBRADO = :RELZEBRADO,'
      '  VERIFICA_UPD = :VERIFICA_UPD,'
      '  CONTACHEQUE = :CONTACHEQUE,'
      '  INFOAVISOS = :INFOAVISOS'
      'WHERE'
      '  CONFIGURACAO.IDCONFIGURACAO = :OLD_IDCONFIGURACAO'
    )
    UseSequenceFieldForRefreshSQL = False
    Left = 240
    Top = 112
    ParamData = <    
      item
        DataType = ftUnknown
        Name = 'NOMECOMPUTADOR'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'BARRAFERRAMENTA'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'HINTBALAO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'GRAVAERRO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'BACKUP'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'LOG'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'IMPRESSORA'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'RESOLUCAO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'LETRACODIGOBARRA'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'EXIBEDICADIA'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'AVISACLIENTEATRASO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'DIREXPORTPADRAO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'SENHAESTOQUE'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'USARSENHAESTOQUE'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'ESTOQUEPADRAO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'BORDAETQPROD'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'ALIQUOTAPADRAO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'DESCPADRAOPROD'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'CAIXAPADRAO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'SENHACAIXA'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'PRODSEMESTOQORCAM'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'ORCAMNAOCONC'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'EDITORCAMCONC'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'COMPRANAOCONC'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'EDITCOMPRACONC'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'PRODSEMESTOQVENDA'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'VENDANAOCONC'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'EDITVENDACONC'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'BORDAETQCLIENTE'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'MOSTRARSALDOCAIXA'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'CAIXA90DIAS'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'RELZEBRADO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'VERIFICA_UPD'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'CONTACHEQUE'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'INFOAVISOS'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'OLD_IDCONFIGURACAO'
        ParamType = ptUnknown
      end>
  end
end
