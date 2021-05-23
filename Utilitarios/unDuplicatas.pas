unit unDuplicatas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons,
  ExtCtrls, ComCtrls, DBClient, Provider, SqlExpr, 
  Mask, DBCtrls, DateUtils,
  RLReport, FMTBcd, System.Actions;

type
  TfrmDuplicatas = class(TfrmPadrao)
    sqldPadrao: TSQLDataSet;
    dspPadrao: TDataSetProvider;
    cdsPadrao: TClientDataSet;
    lbSacado: TLabel;
    dbeDataVenc: TDBEdit;
    dbeDataPag: TDBEdit;
    dbeDataEmissao: TDBEdit;
    N6: TMenuItem;
    miImportarCliente: TMenuItem;
    miConfigurar: TMenuItem;
    sqldCliente: TSQLDataSet;
    dspCliente: TDataSetProvider;
    cdsCliente: TClientDataSet;
    N5: TMenuItem;
    miFormularioBranco: TMenuItem;
    sqldCR: TSQLDataSet;
    dspCR: TDataSetProvider;
    cdsCR: TClientDataSet;
    sqldDeleta: TSQLDataSet;
    lbPracaPag: TLabel;
    dbeCidade: TDBEdit;
    sqldCidade: TSQLDataSet;
    dspCidade: TDataSetProvider;
    cdsCidade: TClientDataSet;
    cdsCidadeCODCIDADE: TIntegerField;
    cdsCidadeDESCRICAO: TStringField;
    sqldCidadeCODCIDADE: TIntegerField;
    sqldCidadeDESCRICAO: TStringField;
    dbeValor: TDBEdit;
    dbeDesconto: TDBEdit;
    N9: TMenuItem;
    miFormSistema: TMenuItem;
    dbeValorFatura: TDBEdit;
    dbeNroDuplicata: TDBEdit;
    dbeNroFatura: TDBEdit;
    lbFatura: TLabel;
    lbDuplicata: TLabel;
    dbeValorExtenso: TDBEdit;
    dbeSacado: TDBEdit;
    dbeCpfCnpj: TDBEdit;
    dbeRgIe: TDBEdit;
    dbeFoneFax: TDBEdit;
    dbeCep: TDBEdit;
    dbeEndereco: TDBEdit;
    dbeBairro: TDBEdit;
    dbeEstado: TDBEdit;
    dbePracaPagamento: TDBEdit;
    lbDatas: TLabel;
    N10: TMenuItem;
    miImportarCR: TMenuItem;
    dbeDataImpressao: TDBEdit;
    dbeImpressa: TDBEdit;
    sqldPadraoIDDUPLICATA: TIntegerField;
    sqldPadraoNRODUPLICATA: TStringField;
    sqldPadraoSACADO: TStringField;
    sqldPadraoCPF_CNPJ: TStringField;
    sqldPadraoENDERECO: TStringField;
    sqldPadraoBAIRRO: TStringField;
    sqldPadraoCEP: TStringField;
    sqldPadraoIDCIDADE: TIntegerField;
    sqldPadraoNOMECIDADE: TStringField;
    sqldPadraoFONEFAX: TStringField;
    sqldPadraoUF: TStringField;
    sqldPadraoIE: TStringField;
    sqldPadraoDATAEMISSAO: TDateField;
    sqldPadraoNROFATURA: TStringField;
    sqldPadraoVALOR_FATURA: TFMTBCDField;
    sqldPadraoVALOR: TFMTBCDField;
    sqldPadraoDATAVENC: TDateField;
    sqldPadraoDESCONTO: TFMTBCDField;
    sqldPadraoPRACAPAGAMENTO: TStringField;
    sqldPadraoDATADESCTO: TDateField;
    sqldPadraoVALOREXTENSO: TStringField;
    sqldPadraoDATAIMPRESSAO: TDateField;
    sqldPadraoIMPRESSA: TStringField;
    cdsPadraoIDDUPLICATA: TIntegerField;
    cdsPadraoNRODUPLICATA: TStringField;
    cdsPadraoSACADO: TStringField;
    cdsPadraoCPF_CNPJ: TStringField;
    cdsPadraoENDERECO: TStringField;
    cdsPadraoBAIRRO: TStringField;
    cdsPadraoCEP: TStringField;
    cdsPadraoIDCIDADE: TIntegerField;
    cdsPadraoNOMECIDADE: TStringField;
    cdsPadraoFONEFAX: TStringField;
    cdsPadraoUF: TStringField;
    cdsPadraoIE: TStringField;
    cdsPadraoDATAEMISSAO: TDateField;
    cdsPadraoNROFATURA: TStringField;
    cdsPadraoVALOR_FATURA: TFMTBCDField;
    cdsPadraoVALOR: TFMTBCDField;
    cdsPadraoDATAVENC: TDateField;
    cdsPadraoDESCONTO: TFMTBCDField;
    cdsPadraoPRACAPAGAMENTO: TStringField;
    cdsPadraoDATADESCTO: TDateField;
    cdsPadraoVALOREXTENSO: TStringField;
    cdsPadraoDATAIMPRESSAO: TDateField;
    cdsPadraoIMPRESSA: TStringField;
    sqldCRCODIGO: TIntegerField;
    sqldCRDATA: TDateField;
    sqldCRVENCIMENTO: TDateField;
    sqldCRDESCRICAO: TStringField;
    sqldCRCLIENTE: TIntegerField;
    sqldCRDOCUMENTO: TStringField;
    sqldCRVALOR: TFMTBCDField;
    sqldCRTOTAL: TFloatField;
    sqldCRVENDA: TIntegerField;
    cdsCRCODIGO: TIntegerField;
    cdsCRDATA: TDateField;
    cdsCRVENCIMENTO: TDateField;
    cdsCRDESCRICAO: TStringField;
    cdsCRCLIENTE: TIntegerField;
    cdsCRDOCUMENTO: TStringField;
    cdsCRVALOR: TFMTBCDField;
    cdsCRTOTAL: TFloatField;
    cdsCRVENDA: TIntegerField;
    sqldClienteCODCLIENTE: TIntegerField;
    sqldClienteTIPO: TStringField;
    sqldClienteNOME: TStringField;
    sqldClienteENDERECO: TStringField;
    sqldClienteCEP: TStringField;
    sqldClienteBAIRRO: TStringField;
    sqldClienteTELEFONE: TStringField;
    sqldClienteCODCIDADE: TIntegerField;
    sqldClienteDESCRICAO: TStringField;
    sqldClienteUF: TStringField;
    sqldClienteCPF_CNPJ: TStringField;
    sqldClienteRG_IE: TStringField;
    sqldClienteLIMITE: TFMTBCDField;
    sqldClienteDATA_NASC: TDateField;
    cdsClienteCODCLIENTE: TIntegerField;
    cdsClienteTIPO: TStringField;
    cdsClienteNOME: TStringField;
    cdsClienteENDERECO: TStringField;
    cdsClienteCEP: TStringField;
    cdsClienteBAIRRO: TStringField;
    cdsClienteTELEFONE: TStringField;
    cdsClienteCODCIDADE: TIntegerField;
    cdsClienteDESCRICAO: TStringField;
    cdsClienteUF: TStringField;
    cdsClienteCPF_CNPJ: TStringField;
    cdsClienteRG_IE: TStringField;
    cdsClienteLIMITE: TFMTBCDField;
    cdsClienteDATA_NASC: TDateField;
    sqldCRNOME: TStringField;
    cdsCRNOME: TStringField;
    procedure actPrintExecute(Sender: TObject);
    procedure miConfigurarClick(Sender: TObject);
    procedure dbeValorExit(Sender: TObject);
    procedure dbeDescontoExit(Sender: TObject);
    procedure cdsPadraoAfterInsert(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure miFormularioBrancoClick(Sender: TObject);
    procedure cdsPadraoNewRecord(DataSet: TDataSet);
    procedure actDeleteExecute(Sender: TObject);
    procedure cdsPadraoIDCIDADEValidate(Sender: TField);
    procedure dbeCidadeClickButton(Sender: TObject);
    procedure miFormSistemaClick(Sender: TObject);
    procedure cdsPadraoCPF_CNPJSetText(Sender: TField; const Text: String);
    procedure dsPadraoStateChange(Sender: TObject);
    procedure miImportarClienteClick(Sender: TObject);
    procedure miImportarCRClick(Sender: TObject);
  private
    Repetido: Boolean;
    procedure CadastraCliente;
    procedure SetValoresDefault;
  public
    procedure AntesSalvar; override;
    procedure DepoisSalvar; override;
  end;

var
  frmDuplicatas: TfrmDuplicatas;

implementation

uses
  Funcoes, unModeloConsulta, Extensos, ConstPadrao,
  unPrevDuplicataSemForm, VarGlobal, unPrevDuplicata, uConfiguraRelatorio;

{$R *.dfm}

procedure TfrmDuplicatas.actPrintExecute(Sender: TObject);

  procedure ImprimirDuplicata;
  begin
    try
      frmPrevDuplicataSemForm := TfrmPrevDuplicataSemForm.Create(Self);
      with frmPrevDuplicataSemForm do
      begin
        Config := False;
        lbSacado.Caption             := Self.cdsPadraoSACADO.AsString;
        lbCnpjCpf.Caption            := Self.cdsPadraoCPF_CNPJ.AsString;
        lbEndereco.Caption           := Self.cdsPadraoENDERECO.AsString;
        lbBairro.Caption             := Self.cdsPadraoBAIRRO.AsString;
        lbCep.Caption                := Self.cdsPadraoCEP.AsString;
        lbMunicipio.Caption          := Self.cdsPadraoNOMECIDADE.AsString;
        lbTelefone_Fax.Caption       := Self.cdsPadraoFONEFAX.AsString;
        lbEstado.Caption             := Self.cdsPadraoUF.AsString;
        lbInscricao_Estadual.Caption := Self.cdsPadraoIE.AsString;
        lbData_Emissao.Caption       := FormatDateTime('dd/mm/yyyy', Self.cdsPadraoDATAEMISSAO.AsDateTime);
        lbNumero_Fatura.Caption      := Self.cdsPadraoNROFATURA.AsString;
        lbValor.Caption              := FormatFloat('#,##0.00', Self.cdsPadraoVALOR.AsFloat);
        lbNumero_Duplicata.Caption   := Self.cdsPadraoNRODUPLICATA.AsString;
        lbVencimento.Caption         := FormatDateTime('dd/mm/yyyy', Self.cdsPadraoDATAVENC.AsDateTime);
        lbDesconto.Caption           := FormatFloat('#,##0.00', Self.cdsPadraoDESCONTO.AsFloat);
        lbPraca_Pagamento.Caption    := Self.cdsPadraoPRACAPAGAMENTO.AsString;
        lbPagar_Ate.Caption          := FormatDateTime('dd/mm/yyyy', Self.cdsPadraoDATADESCTO.AsDateTime);
        lbValor_Extenso.Caption      := Self.cdsPadraoVALOREXTENSO.AsString;

        // grava aduplicata como impressa
        Self.cdsPadrao.Edit;
        Self.cdsPadraoIMPRESSA.AsString := 'S';
        Self.cdsPadraoDATAIMPRESSAO.AsDateTime := Date;
        Self.cdsPadrao.ApplyUpdates(0);
        // imprime
        PrintIfNotEmptyRL(rrDuplicata);
      end;
    finally
      FreeAndNil(frmPrevDuplicataSemForm);
    end;
  end;

begin
  inherited;
  if cdsPadraoIMPRESSA.AsString = 'S' then
  begin
//    case CustomMsgDlg('Esta Duplicata j� foi impressa. O que deseja fazer ?',
//                    'Op�oes de Impress�o', '&Excluir', '&Imprimir', '&Cancelar') of
//      ID_YES:
//      begin
//        actDelete.Execute;
//        Exit;
//      end;
//      ID_NO:
//      begin
//        ImprimirDuplicata;
//        Exit;
//      end;
//      ID_CANCEL: Exit;
//    end;
  end
  else
  begin
    ImprimirDuplicata;
    Exit;
  end;
end;

procedure TfrmDuplicatas.miConfigurarClick(Sender: TObject);
begin
  inherited;
  ChamaForm('TfrmConfiguraDuplicata', 'Configura��o de duplicatas', Self);
end;

procedure TfrmDuplicatas.dbeValorExit(Sender: TObject);
begin
  inherited;
  if ModoInsertEdit(cdsPadrao) then
    cdsPadraoVALOREXTENSO.AsString := Extenso(cdsPadraoVALOR.AsFloat);
end;

procedure TfrmDuplicatas.dbeDescontoExit(Sender: TObject);
begin
  inherited;
  if ModoInsertEdit(cdsPadrao) then
  begin
    cdsPadraoVALOR.AsFloat         := (cdsPadraoVALOR.AsFloat - cdsPadraoDESCONTO.AsFloat);
    cdsPadraoVALOREXTENSO.AsString := Extenso(cdsPadraoVALOR.AsFloat);
  end;
end;

procedure TfrmDuplicatas.cdsPadraoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  //Incrementa('DUPLICATA', cdsPadraoIDDUPLICATA, GetConnection);
  cdsPadraoNRODUPLICATA.AsString := IntToStr(cdsPadraoIDDUPLICATA.AsInteger);
  SetFocusIfCan(dbeNroFatura);
end;

procedure TfrmDuplicatas.FormCreate(Sender: TObject);
begin
  inherited;
  FieldNames := FN_DUPLICATA;
  DisplayLabels := DL_DUPLICATA;
  aCaption := 'Duplicatas';
end;

procedure TfrmDuplicatas.CadastraCliente;
var
  ID: Integer;
  IDCidade: Integer;
  cadastrar: Boolean;
begin
//  ID := SelectSingleField('select max(CODCLIENTE) ID from CLIENTES', GetConnection);
//  IDCidade := SelectSingleField('select CODCIDADE IDCIDADE from CIDADES ' + #13 +
//    'where CODCIDADE = ' + IntToStr(cdsPadraoIDCIDADE.AsInteger), GetConnection);

  cdsCliente.Open;

  with TSQLDataSet.Create(nil) do
  try
    ////SQLConnection := GetConnection;
    CommandText := 'select count(1) as CONT from CLIENTES'+
      ' where CPF_CNPJ like '+QuotedStr(dbeCpfCnpj.Text)+
      ' or NOME like '+QuotedStr(dbeSacado.Text);
    Open;
    cadastrar := FieldByName('CONT').AsInteger = 0;
  finally
    Free;
  end;

  if cadastrar then
  begin
    if MsgSN('Cadastrar "'+cdsPadraoSACADO.AsString+'" como um novo cliente?') then
    begin
      try
        cdsCliente.Insert;
        cdsClienteCODCLIENTE.AsInteger := (ID + 1);

        if MsgSN('Este cliente � pessoa f�sica ou pessoa jur�dica?'+#13#13+
          'Sim - Pessoa F�sica;'+#13#10+
          'N�o - Pessoa Jur�dica;') then
          cdsClienteTIPO.AsString := 'F'
        else
          cdsClienteTIPO.AsString := 'J';

        cdsClienteNOME.AsString     := cdsPadraoSACADO.AsString;
        cdsClienteENDERECO.AsString := cdsPadraoENDERECO.AsString;
        cdsClienteCEP.AsString      := cdsPadraoCEP.AsString;
        cdsClienteBAIRRO.AsString   := cdsPadraoBAIRRO.AsString;
        cdsClienteTELEFONE.AsString := cdsPadraoFONEFAX.AsString;

        if IDCidade > 0 then
          cdsClienteCODCIDADE.AsInteger := IDCidade
        else
          cdsClienteCODCIDADE.Clear;

        cdsClienteUF.AsString       := cdsPadraoUF.AsString;
        cdsClienteCPF_CNPJ.AsString := cdsPadraoCPF_CNPJ.AsString;
        cdsClienteRG_IE.AsString    := '';
        cdsClienteLIMITE.AsFloat    := Global.LimiteCliente;

        cdsCliente.ApplyUpdates(0);
        MsgAviso('','Cliente "'+dbeSacado.Text+'" cadastrado com sucesso.');
      except
        raise Exception.Create('Erro ao cadastrar cliente na duplicata.');
      end;
    end;
  end;
  cdsCliente.Close;
end;

procedure TfrmDuplicatas.miFormularioBrancoClick(Sender: TObject);
var
  x: Integer;
begin
  inherited;
  with TfrmPrevDuplicata.Create(Self) do
  try
    for x := 0 to ComponentCount - 1 do
      if Components[x] is TRLDBText then
        TRLDBText(Components[x]).Visible := False;
    PrintIfNotEmptyRL(rptDuplicata);
  finally
    Free;
  end;
end;

procedure TfrmDuplicatas.SetValoresDefault;
begin
  if cdsPadrao.State in dsEditModes then
  begin
    cdsPadraoPRACAPAGAMENTO.AsString := Empresa.Nome;
    cdsPadraoDATAEMISSAO.AsDateTime  := Date;
    cdsPadraoDATAVENC.AsDateTime     := IncDay(Date, Global.PrazoInicial);
    cdsPadraoDATADESCTO.AsDateTime   := IncDay(Date, Global.PrazoInicial);
  end;
end;

procedure TfrmDuplicatas.cdsPadraoNewRecord(DataSet: TDataSet);
begin
  inherited;
  SetValoresDefault;
  cdsPadraoVALOR.AsFloat := 0;
  cdsPadraoVALOR_FATURA.AsFloat := 0;
  cdsPadraoDESCONTO.AsFloat := 0;
  cdsPadraoIMPRESSA.AsString := 'N';
  cdsPadraoVALOREXTENSO.AsString := Extenso(0);
end;

procedure TfrmDuplicatas.actDeleteExecute(Sender: TObject);
begin
  if MsgSN('Deseja realmente excluir este registro?') then
  begin
    with sqldDeleta do
    try
      Close;
      Params.ParamByName('CODIGO').AsInteger := cdsPadraoIDDUPLICATA.AsInteger;
      ExecSQL;
      Close;
    finally
      cdsPadrao.Close;
      cdsPadrao.Open;
    end;
  end;
end;

procedure TfrmDuplicatas.cdsPadraoIDCIDADEValidate(Sender: TField);
var
  NomeCidade: string;
begin
  inherited;
  //NomeCidade := GetFieldByID(GetConnection, 'CIDADES', 'DESCRICAO', 'CODCIDADE',
  //  Sender.AsInteger);
  if NomeCidade <> '' then
    cdsPadraoNOMECIDADE.AsString := NomeCidade;
end;

procedure TfrmDuplicatas.dbeCidadeClickButton(Sender: TObject);
begin
  inherited;
  if cdsPadrao.State in [dsEdit, dsInsert] then
    if TfrmModeloConsulta.Execute('Cidade', cdsCidade, FN_CIDADES, DL_CIDADES) then
      cdsPadraoIDCIDADE.AsInteger := cdsCidadeCODCIDADE.AsInteger;
end;

procedure TfrmDuplicatas.miFormSistemaClick(Sender: TObject);
begin
  inherited;
  with TfrmPrevDuplicata.Create(Self) do
  try
    cdsDuplicata.Close;
    cdsDuplicata.Params.ParamByName('CODDUPLICATA').AsInteger := cdsPadraoIDDUPLICATA.AsInteger;
    cdsDuplicata.Open;
    PrintIfNotEmptyRL(rptDuplicata);
  finally
    Free;
  end;
end;

procedure TfrmDuplicatas.DepoisSalvar;
begin
  inherited;
  CadastraCliente;
end;

procedure TfrmDuplicatas.AntesSalvar;
begin
  inherited;
  with TSQLDataSet.Create(nil) do
  try
    SQLConnection := sqldPadrao.SQLConnection;
    CommandText := 'select count(1) from DUPLICATA where NRODUPLICATA = '+QuotedStr(dbeNroDuplicata.Text);
    Open;
    Repetido := Fields[0].AsInteger > 0;
  finally
    Free;
  end;

  if (ModoInsert(cdsPadrao) and Repetido) then
  begin
    MsgAviso('','J� existe uma duplicata com este n�mero.');
    Abort;
  end;
 {
  if ModoInsertEdit(cdsPadrao) then
  begin
    if ((not ValidaCampo(dbeCpfCnpj.Text, 0)) and
        (not ValidaCampo(dbeCpfCnpj.Text, 1))) then
    begin
      MsgAviso('CPF ou CNPJ inv�lido ou n�o preenchido.');
      SetFocusIfCan(dbeCpfCnpj);
      Abort;
    end;
  end;}
end;

procedure TfrmDuplicatas.cdsPadraoCPF_CNPJSetText(Sender: TField;
  const Text: String);
begin
  inherited;{
  if ValidaCampo(Text, 0) then
    Sender.AsString := FormatarDoc(Text, 0)
  else if ValidaCampo(Text, 1) then
    Sender.AsString := FormatarDoc(Text, 1)
  else
  begin
    MsgCuidado('CPF/CNPJ inv�lido.');
    Sender.Clear;
    Sender.FocusControl;
    Exit;
  end;}
end;

procedure TfrmDuplicatas.dsPadraoStateChange(Sender: TObject);
begin
  inherited;
  miImportarCliente.Enabled  := not EditModes;
  miImportarCR.Enabled       := not EditModes;
  miConfigurar.Enabled       := not EditModes;
  miFormSistema.Enabled      := not EditModes;
  miFormularioBranco.Enabled := not EditModes;
  actPrintPerson.Enabled     := not EditModes;
end;

procedure TfrmDuplicatas.miImportarClienteClick(Sender: TObject);
begin
  inherited;
  if TfrmModeloConsulta.Execute('Cliente', cdsCliente, FN_CLIENTES, DL_CLIENTES) then
  begin
    cdsPadrao.Insert;
    cdsPadraoSACADO.AsString       := cdsClienteNOME.AsString;
    cdsPadraoCPF_CNPJ.AsString     := cdsClienteCPF_CNPJ.AsString;
    cdsPadraoENDERECO.AsString     := cdsClienteENDERECO.AsString;
    cdsPadraoBAIRRO.AsString       := cdsClienteBAIRRO.AsString;
    cdsPadraoCEP.AsString          := cdsClienteCEP.AsString;
    cdsPadraoIDCIDADE.AsInteger    := cdsClienteCODCIDADE.AsInteger;
    cdsPadraoFONEFAX.AsString      := cdsClienteTELEFONE.AsString;
    cdsPadraoUF.AsString           := cdsClienteUF.AsString;
    SetValoresDefault;
    cdsPadraoVALOR.AsFloat         := 0;
    cdsPadraoVALOREXTENSO.AsString := Extenso(cdsPadraoVALOR.AsFloat);
    cdsPadraoIMPRESSA.AsString     := 'N';

    if MsgSN('Confirma importa��o dos dados deste cliente?')then
      btnSalvar.Click
    else
    begin
      cdsPadrao.CancelUpdates;
      MsgCuidado('','Duplicata cancelada.');
    end;
  end;
end;

procedure TfrmDuplicatas.miImportarCRClick(Sender: TObject);

  function TotalVenda(IdVenda: Integer): Currency;
  begin
    with TSQLDataSet.Create(nil)do
    try
      SQLConnection := sqldPadrao.SQLConnection;
      CommandText := 'select TOTAL from VENDA where CODIGO = '+QuotedStr(IntToStr(IdVenda));
      Open;
      Result := FieldByName('TOTAL').AsFloat;
    finally
      Free;
    end;
  end;

begin
  inherited;
  if TfrmModeloConsulta.Execute('Contas a receber', cdsCR, FN_CR, DL_CR) then
  begin
    cdsCliente.Open;
    if cdsCliente.Locate('CODCLIENTE', cdsCRCLIENTE.AsInteger, []) then
    begin
      cdsPadrao.Insert;
      cdsPadraoSACADO.AsString          := cdsClienteNOME.AsString;
      cdsPadraoCPF_CNPJ.AsString        := cdsClienteCPF_CNPJ.AsString;
      cdsPadraoENDERECO.AsString        := cdsClienteENDERECO.AsString;
      cdsPadraoBAIRRO.AsString          := cdsClienteBAIRRO.AsString;
      cdsPadraoCEP.AsString             := cdsClienteCEP.AsString;
      cdsPadraoIDCIDADE.AsInteger       := cdsClienteCODCIDADE.AsInteger;
      cdsPadraoFONEFAX.AsString         := cdsClienteTELEFONE.AsString;
      cdsPadraoUF.AsString              := cdsClienteUF.AsString;
      cdsPadraoDATAEMISSAO.AsDateTime   := Date;
      cdsPadraoNROFATURA.AsString       := IntToStr(cdsCRVENDA.AsInteger);
      cdsPadraoVALOR_FATURA.AsFloat     := TotalVenda(cdsCRVENDA.AsInteger);
      cdsPadraoVALOR.AsFloat            := cdsCRTOTAL.AsFloat;
      cdsPadraoVALOREXTENSO.AsString    := Extenso(cdsPadraoVALOR.AsFloat);
      cdsPadraoDATAVENC.AsDateTime      := cdsCRVENCIMENTO.AsDateTime;
      cdsPadraoDESCONTO.AsFloat         := 0;
      cdsPadraoPRACAPAGAMENTO.AsString  := Empresa.Nome;
      cdsPadraoDATADESCTO.AsDateTime    := cdsCRVENCIMENTO.AsDateTime;
      cdsPadraoDATAIMPRESSAO.AsDateTime := Date;
      cdsPadraoIMPRESSA.AsString        := 'N';

      if MsgSN('Confirma importa��o dos dados desta conta?')then
        btnSalvar.Click
      else
      begin
        cdsPadrao.CancelUpdates;
        MsgCuidado('','Duplicata cancelada.');
      end;
    end;
  end;
  cdsCliente.Close;
end;

initialization
  RegisterClass(TfrmDuplicatas);
finalization
  UnRegisterClass(TfrmDuplicatas);
end.


