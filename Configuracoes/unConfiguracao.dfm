inherited frmConfiguracao: TfrmConfiguracao
  Left = 221
  Top = 141
  ClientHeight = 440
  ClientWidth = 628
  Caption = 'frmConfiguracao'
  OldCreateOrder = True
  Font.Name = 'Verdana'
  ExplicitWidth = 634
  ExplicitHeight = 469
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbStatus: TUniStatusBar
    Top = 421
    Width = 628
    ExplicitTop = 361
    ExplicitWidth = 409
  end
  inherited pnBotoesPadrao: TUniContainerPanel
    Width = 628
    ExplicitWidth = 409
    inherited btnNovo: TUniSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnAlterar: TUniSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnExcluir: TUniSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnSalvar: TUniSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnCancelar: TUniSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnConsultar: TUniSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnSair: TUniSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnPrint: TUniSpeedButton
      Font.Name = 'Verdana'
    end
  end
  object PgConfig: TUniPageControl [2]
    Left = 8
    Top = 36
    Width = 394
    Height = 317
    Hint = ''
    ShowHint = True
    TabOrder = 1
  end
  inherited actlNavigateActions: TActionList
    Left = 318
    Top = 302
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 111
    Top = 318
  end
  object sqldPadrao: TSQLDataSet
    CommandText = 
      'select'#13#10' c.IDCONFIGURACAO,'#13#10' c.NOMECOMPUTADOR,'#13#10' c.BARRAFERRAMEN' +
      'TA,'#13#10' c.HINTBALAO,'#13#10' c.GRAVAERRO,'#13#10' c.BACKUP,'#13#10' c.LOG,'#13#10' c.IMPRE' +
      'SSORA,'#13#10' c.RESOLUCAO,'#13#10' c.LETRACODIGOBARRA,'#13#10' c.EXIBEDICADIA,'#13#10' ' +
      'c.AVISACLIENTEATRASO,'#13#10' c.DIREXPORTPADRAO,'#13#10' c.SENHAESTOQUE,'#13#10' c' +
      '.USARSENHAESTOQUE,'#13#10' c.ESTOQUEPADRAO,'#13#10' c.BORDAETQPROD,'#13#10' c.ALIQ' +
      'UOTAPADRAO,'#13#10' a.DESCRICAO as ALIQUOTA,'#13#10' c.DESCPADRAOPROD,'#13#10' c.C' +
      'AIXAPADRAO,'#13#10' cx.NOME as CAIXA, '#13#10' c.SENHACAIXA,'#13#10' c.PRODSEMESTO' +
      'QORCAM,'#13#10' c.ORCAMNAOCONC,'#13#10' c.EDITORCAMCONC,'#13#10' c.COMPRANAOCONC,'#13 +
      #10' c.EDITCOMPRACONC,'#13#10' c.PRODSEMESTOQVENDA,'#13#10' c.VENDANAOCONC,'#13#10' c' +
      '.EDITVENDACONC,'#13#10' c.BORDAETQCLIENTE,'#13#10' c.MOSTRARSALDOCAIXA,'#13#10' c.' +
      'CAIXA90DIAS,'#13#10' c.INFOAVISOS,'#13#10' c.RELZEBRADO,'#13#10' c.VERIFICA_UPD,'#13#10 +
      ' c.CONTACHEQUE,'#13#10' cx2.NOME as NCONTACHEQUE'#13#10'from CONFIGURACAO c'#13 +
      #10'left join ALIQUOTAS a on (a.CODALIQUOTA = c.ALIQUOTAPADRAO)'#13#10'le' +
      'ft join CAIXAS cx on (cx.CODIGO = c.CAIXAPADRAO)'#13#10'left join CAIX' +
      'AS cx2 on (cx2.CODIGO = c.CONTACHEQUE)'#13#10'where c.NOMECOMPUTADOR =' +
      ' :PCOMP'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'PCOMP'
        ParamType = ptInput
      end>
    Left = 14
    Top = 318
    object sqldPadraoIDCONFIGURACAO: TIntegerField
      FieldName = 'IDCONFIGURACAO'
      Required = True
    end
    object sqldPadraoNOMECOMPUTADOR: TStringField
      FieldName = 'NOMECOMPUTADOR'
      Size = 80
    end
    object sqldPadraoBARRAFERRAMENTA: TStringField
      FieldName = 'BARRAFERRAMENTA'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoHINTBALAO: TStringField
      FieldName = 'HINTBALAO'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoGRAVAERRO: TStringField
      FieldName = 'GRAVAERRO'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoBACKUP: TStringField
      FieldName = 'BACKUP'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoLOG: TStringField
      FieldName = 'LOG'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoIMPRESSORA: TStringField
      FieldName = 'IMPRESSORA'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoRESOLUCAO: TStringField
      FieldName = 'RESOLUCAO'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoLETRACODIGOBARRA: TStringField
      FieldName = 'LETRACODIGOBARRA'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoEXIBEDICADIA: TStringField
      FieldName = 'EXIBEDICADIA'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoAVISACLIENTEATRASO: TStringField
      FieldName = 'AVISACLIENTEATRASO'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoDIREXPORTPADRAO: TStringField
      FieldName = 'DIREXPORTPADRAO'
      Size = 250
    end
    object sqldPadraoSENHAESTOQUE: TStringField
      FieldName = 'SENHAESTOQUE'
      Size = 10
    end
    object sqldPadraoUSARSENHAESTOQUE: TStringField
      FieldName = 'USARSENHAESTOQUE'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoESTOQUEPADRAO: TIntegerField
      FieldName = 'ESTOQUEPADRAO'
    end
    object sqldPadraoBORDAETQPROD: TStringField
      FieldName = 'BORDAETQPROD'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoALIQUOTAPADRAO: TIntegerField
      FieldName = 'ALIQUOTAPADRAO'
      Required = True
    end
    object sqldPadraoALIQUOTA: TStringField
      FieldName = 'ALIQUOTA'
      ProviderFlags = []
    end
    object sqldPadraoDESCPADRAOPROD: TFMTBCDField
      FieldName = 'DESCPADRAOPROD'
      Precision = 15
    end
    object sqldPadraoCAIXAPADRAO: TIntegerField
      FieldName = 'CAIXAPADRAO'
      Required = True
    end
    object sqldPadraoCAIXA: TStringField
      FieldName = 'CAIXA'
      ProviderFlags = []
      Size = 80
    end
    object sqldPadraoSENHACAIXA: TStringField
      FieldName = 'SENHACAIXA'
      Size = 10
    end
    object sqldPadraoPRODSEMESTOQORCAM: TStringField
      FieldName = 'PRODSEMESTOQORCAM'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoORCAMNAOCONC: TStringField
      FieldName = 'ORCAMNAOCONC'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoEDITORCAMCONC: TStringField
      FieldName = 'EDITORCAMCONC'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoCOMPRANAOCONC: TStringField
      FieldName = 'COMPRANAOCONC'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoEDITCOMPRACONC: TStringField
      FieldName = 'EDITCOMPRACONC'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoPRODSEMESTOQVENDA: TStringField
      FieldName = 'PRODSEMESTOQVENDA'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoVENDANAOCONC: TStringField
      FieldName = 'VENDANAOCONC'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoEDITVENDACONC: TStringField
      FieldName = 'EDITVENDACONC'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoBORDAETQCLIENTE: TStringField
      FieldName = 'BORDAETQCLIENTE'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoMOSTRARSALDOCAIXA: TStringField
      FieldName = 'MOSTRARSALDOCAIXA'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoCAIXA90DIAS: TStringField
      FieldName = 'CAIXA90DIAS'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoRELZEBRADO: TStringField
      FieldName = 'RELZEBRADO'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoVERIFICA_UPD: TStringField
      FieldName = 'VERIFICA_UPD'
      FixedChar = True
      Size = 1
    end
    object sqldPadraoCONTACHEQUE: TIntegerField
      FieldName = 'CONTACHEQUE'
    end
    object sqldPadraoNCONTACHEQUE: TStringField
      FieldName = 'NCONTACHEQUE'
      ProviderFlags = []
      Size = 80
    end
    object sqldPadraoINFOAVISOS: TStringField
      FieldName = 'INFOAVISOS'
      FixedChar = True
      Size = 1
    end
  end
  object dspPadrao: TDataSetProvider
    DataSet = sqldPadrao
    Options = [poAllowCommandText]
    Left = 48
    Top = 318
  end
  object cdsPadrao: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'PCOMP'
        ParamType = ptInput
      end>
    ProviderName = 'dspPadrao'
    Left = 80
    Top = 318
    object cdsPadraoIDCONFIGURACAO: TIntegerField
      FieldName = 'IDCONFIGURACAO'
      Required = True
    end
    object cdsPadraoNOMECOMPUTADOR: TStringField
      FieldName = 'NOMECOMPUTADOR'
      Size = 80
    end
    object cdsPadraoBARRAFERRAMENTA: TStringField
      FieldName = 'BARRAFERRAMENTA'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoHINTBALAO: TStringField
      FieldName = 'HINTBALAO'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoGRAVAERRO: TStringField
      FieldName = 'GRAVAERRO'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoBACKUP: TStringField
      FieldName = 'BACKUP'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoLOG: TStringField
      FieldName = 'LOG'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoIMPRESSORA: TStringField
      FieldName = 'IMPRESSORA'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoRESOLUCAO: TStringField
      FieldName = 'RESOLUCAO'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoLETRACODIGOBARRA: TStringField
      FieldName = 'LETRACODIGOBARRA'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoEXIBEDICADIA: TStringField
      FieldName = 'EXIBEDICADIA'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoAVISACLIENTEATRASO: TStringField
      FieldName = 'AVISACLIENTEATRASO'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoDIREXPORTPADRAO: TStringField
      FieldName = 'DIREXPORTPADRAO'
      Size = 250
    end
    object cdsPadraoSENHAESTOQUE: TStringField
      FieldName = 'SENHAESTOQUE'
      Size = 10
    end
    object cdsPadraoUSARSENHAESTOQUE: TStringField
      FieldName = 'USARSENHAESTOQUE'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoESTOQUEPADRAO: TIntegerField
      FieldName = 'ESTOQUEPADRAO'
    end
    object cdsPadraoBORDAETQPROD: TStringField
      FieldName = 'BORDAETQPROD'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoALIQUOTAPADRAO: TIntegerField
      FieldName = 'ALIQUOTAPADRAO'
      Required = True
    end
    object cdsPadraoALIQUOTA: TStringField
      FieldName = 'ALIQUOTA'
      ProviderFlags = []
    end
    object cdsPadraoDESCPADRAOPROD: TFMTBCDField
      FieldName = 'DESCPADRAOPROD'
      Precision = 15
    end
    object cdsPadraoCAIXAPADRAO: TIntegerField
      FieldName = 'CAIXAPADRAO'
      Required = True
    end
    object cdsPadraoCAIXA: TStringField
      FieldName = 'CAIXA'
      ProviderFlags = []
      Size = 80
    end
    object cdsPadraoSENHACAIXA: TStringField
      FieldName = 'SENHACAIXA'
      Size = 10
    end
    object cdsPadraoPRODSEMESTOQORCAM: TStringField
      FieldName = 'PRODSEMESTOQORCAM'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoORCAMNAOCONC: TStringField
      FieldName = 'ORCAMNAOCONC'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoEDITORCAMCONC: TStringField
      FieldName = 'EDITORCAMCONC'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoCOMPRANAOCONC: TStringField
      FieldName = 'COMPRANAOCONC'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoEDITCOMPRACONC: TStringField
      FieldName = 'EDITCOMPRACONC'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoPRODSEMESTOQVENDA: TStringField
      FieldName = 'PRODSEMESTOQVENDA'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoVENDANAOCONC: TStringField
      FieldName = 'VENDANAOCONC'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoEDITVENDACONC: TStringField
      FieldName = 'EDITVENDACONC'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoBORDAETQCLIENTE: TStringField
      FieldName = 'BORDAETQCLIENTE'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoMOSTRARSALDOCAIXA: TStringField
      FieldName = 'MOSTRARSALDOCAIXA'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoCAIXA90DIAS: TStringField
      FieldName = 'CAIXA90DIAS'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoRELZEBRADO: TStringField
      FieldName = 'RELZEBRADO'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoVERIFICA_UPD: TStringField
      FieldName = 'VERIFICA_UPD'
      FixedChar = True
      Size = 1
    end
    object cdsPadraoCONTACHEQUE: TIntegerField
      FieldName = 'CONTACHEQUE'
    end
    object cdsPadraoNCONTACHEQUE: TStringField
      FieldName = 'NCONTACHEQUE'
      ProviderFlags = []
      Size = 80
    end
    object cdsPadraoINFOAVISOS: TStringField
      FieldName = 'INFOAVISOS'
      FixedChar = True
      Size = 1
    end
  end
  object opImagem: TOpenPictureDialog
    Filter = 
      'JPEG Image File (*.jpg)|*.jpg|JPEG Image File (*.jpeg)|*.jpeg|Bi' +
      'tmaps (*.bmp)|*.bmp'
    Left = 254
    Top = 286
  end
  object IdSMTP: TIdSMTP
    SASLMechanisms = <>
    Left = 141
    Top = 262
  end
  object IdMsg: TIdMessage
    AttachmentEncoding = 'MIME'
    BccList = <>
    CCList = <>
    Encoding = meMIME
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 204
    Top = 262
  end
end
