object frmSenhaCaixa: TfrmSenhaCaixa
  Left = 479
  Height = 214
  Top = 246
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
  object btnOk: TBitBtn
    Left = 24
    Height = 37
    Top = 112
    Width = 81
    Caption = '&Ok'
    ModalResult = 1
    OnClick = btnOkClick
    TabOrder = 2
  end
  object btnCancelar: TBitBtn
    Left = 112
    Height = 37
    Top = 112
    Width = 81
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 3
  end
  object edAtual: TEdit
    Left = 16
    Height = 21
    Top = 24
    Width = 169
    EchoMode = emPassword
    PasswordChar = '*'
    TabOrder = 0
  end
  object edNova: TEdit
    Left = 16
    Height = 21
    Top = 64
    Width = 169
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
        Name = 'NOMECOMPUTADOR'
      end    
      item
        Name = 'BARRAFERRAMENTA'
      end    
      item
        Name = 'HINTBALAO'
      end    
      item
        Name = 'GRAVAERRO'
      end    
      item
        Name = 'BACKUP'
      end    
      item
        Name = 'LOG'
      end    
      item
        Name = 'IMPRESSORA'
      end    
      item
        Name = 'RESOLUCAO'
      end    
      item
        Name = 'LETRACODIGOBARRA'
      end    
      item
        Name = 'EXIBEDICADIA'
      end    
      item
        Name = 'AVISACLIENTEATRASO'
      end    
      item
        Name = 'DIREXPORTPADRAO'
      end    
      item
        Name = 'SENHAESTOQUE'
      end    
      item
        Name = 'USARSENHAESTOQUE'
      end    
      item
        Name = 'ESTOQUEPADRAO'
      end    
      item
        Name = 'BORDAETQPROD'
      end    
      item
        Name = 'ALIQUOTAPADRAO'
      end    
      item
        Name = 'DESCPADRAOPROD'
      end    
      item
        Name = 'CAIXAPADRAO'
      end    
      item
        Name = 'SENHACAIXA'
      end    
      item
        Name = 'PRODSEMESTOQORCAM'
      end    
      item
        Name = 'ORCAMNAOCONC'
      end    
      item
        Name = 'EDITORCAMCONC'
      end    
      item
        Name = 'COMPRANAOCONC'
      end    
      item
        Name = 'EDITCOMPRACONC'
      end    
      item
        Name = 'PRODSEMESTOQVENDA'
      end    
      item
        Name = 'VENDANAOCONC'
      end    
      item
        Name = 'EDITVENDACONC'
      end    
      item
        Name = 'BORDAETQCLIENTE'
      end    
      item
        Name = 'MOSTRARSALDOCAIXA'
      end    
      item
        Name = 'CAIXA90DIAS'
      end    
      item
        Name = 'RELZEBRADO'
      end    
      item
        Name = 'VERIFICA_UPD'
      end    
      item
        Name = 'CONTACHEQUE'
      end    
      item
        Name = 'INFOAVISOS'
      end    
      item
        Name = 'OLD_IDCONFIGURACAO'
      end>
  end
end
