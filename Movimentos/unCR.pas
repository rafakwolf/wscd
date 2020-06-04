unit unCR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons, DateUtils,
  ExtCtrls, ComCtrls,  Mask, DBCtrls, 
  SqlExpr, Provider, DBClient, ConstPadrao, FMTBcd, System.Actions, uniLabel,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses, uniPanel,
  uniGUIBaseClasses, uniStatusBar, uniEdit, uniDBEdit, uniGroupBox;

type
  TfrmCR = class(TfrmPadrao)
    sqldPadrao: TSQLDataSet;
    dspPadrao: TDataSetProvider;
    cdsPadrao: TClientDataSet;
    sqlLimite: TSQLDataSet;
    actContasReceber: TAction;
    cdsPadraoCODIGO: TIntegerField;
    cdsPadraoDATA: TDateField;
    cdsPadraoVENCIMENTO: TDateField;
    cdsPadraoCLIENTE: TIntegerField;
    cdsPadraoDESCRICAO: TStringField;
    cdsPadraoDOCUMENTO: TStringField;
    cdsPadraoRECEBER: TStringField;
    cdsPadraoRECDA: TStringField;
    cdsPadraoDATARECTO: TDateField;
    cdsPadraoORIGEM: TIntegerField;
    cdsPadraoVENDA: TIntegerField;
    cdsPadraoOBS: TMemoField;
    cdsPadraoATRASO: TIntegerField;
    cdsPadraoNOME: TStringField;
    sqldPadraoCODIGO: TIntegerField;
    sqldPadraoDATA: TDateField;
    sqldPadraoVENCIMENTO: TDateField;
    sqldPadraoCLIENTE: TIntegerField;
    sqldPadraoNOME: TStringField;
    sqldPadraoDESCRICAO: TStringField;
    sqldPadraoDOCUMENTO: TStringField;
    sqldPadraoVALOR: TFMTBCDField;
    sqldPadraoJURO: TFMTBCDField;
    sqldPadraoRECEBER: TStringField;
    sqldPadraoRECDA: TStringField;
    sqldPadraoDATARECTO: TDateField;
    sqldPadraoORIGEM: TIntegerField;
    sqldPadraoVENDA: TIntegerField;
    sqldPadraoCAPITALRECDO: TFMTBCDField;
    sqldPadraoJURORECDO: TFMTBCDField;
    sqldPadraoDESCTO: TFMTBCDField;
    sqldPadraoOBS: TMemoField;
    sqldPadraoATRASO: TIntegerField;
    cdsPadraoVALOR: TFMTBCDField;
    cdsPadraoJURO: TFMTBCDField;
    cdsPadraoCAPITALRECDO: TFMTBCDField;
    cdsPadraoJURORECDO: TFMTBCDField;
    cdsPadraoDESCTO: TFMTBCDField;
    sqlLimiteTOTAL_CONTAS: TFloatField;
    sqldDeleta: TSQLDataSet;
    sqldPadraoIDCONTA: TIntegerField;
    sqldPadraoCONTA: TStringField;
    cdsPadraoIDCONTA: TIntegerField;
    cdsPadraoCONTA: TStringField;
    sqldPadraoVALORJURO: TSingleField;
    sqldPadraoTOTAL: TSingleField;
    sqldPadraoTOTALRECDO: TSingleField;
    cdsPadraoVALORJURO: TSingleField;
    cdsPadraoTOTAL: TSingleField;
    cdsPadraoTOTALRECDO: TSingleField;
    lbStatus: TLabel;
    btnReceber: TBitBtn;
    btnContas: TBitBtn;
    dbeValorAtual: TDBEdit;
    dbeCliente: TDBEdit;
    dbeDescricao: TDBEdit;
    dbeValor: TDBEdit;
    dbeDocumento: TDBEdit;
    dbeJuros: TDBEdit;
    dbeOrigem: TDBEdit;
    dbdData: TDBEdit;
    dbdVencimento: TDBEdit;
    dbeVenda: TDBEdit;
    dbeConta: TDBEdit;
    grpRecebimento: TGroupBox;
    dbeDataRecdo: TDBEdit;
    dbeDesconto: TDBEdit;
    dbeCapitalRecdo: TDBEdit;
    dbeJuroRecdo: TDBEdit;
    dbeTotalRecdo: TDBEdit;
    procedure dbeClienteClickButton(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cdsPadraoAfterInsert(DataSet: TDataSet);
    procedure miContasporClienteClick(Sender: TObject);
    procedure miTodasContasClick(Sender: TObject);
    procedure miContasIntervaloDatasClick(Sender: TObject);
    procedure miContasVencidasClick(Sender: TObject);
    procedure miContasVencidasClienteClick(Sender: TObject);
    procedure actContasReceberExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure cdsPadraoCLIENTEValidate(Sender: TField);
    procedure cdsPadraoAfterScroll(DataSet: TDataSet);
    procedure miContasClienteCorrenteClick(Sender: TObject);
    procedure dbeDescricaoEnter(Sender: TObject);
    procedure miParcelamentoClick(Sender: TObject);
    procedure dsPadraoStateChange(Sender: TObject);
    procedure btnReceberClick(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure cdsPadraoIDCONTAValidate(Sender: TField);
    procedure dbeContaClickButton(Sender: TObject);
    procedure miProximosVencClick(Sender: TObject);
  private
  protected
    procedure ContaRecebida(var Msg: TMessage); message WM_CONTA_RECEBER_RECEBIDA;
  public
    procedure AntesSalvar; override;
  end;

var
  frmCR: TfrmCR;

implementation

uses VarGlobal, Funcoes, uConfiguraRelatorio, unPrevContasReceber,
     unPrevRelCRAtrasadas, unContasReceber,  unReceberMan,
     unParcelaCPCR, uDatabaseutils;

{$R *.dfm}

procedure TfrmCR.dbeClienteClickButton(Sender: TObject);
begin
  inherited;
  if cdsPadrao.State in [dsEdit, dsInsert] then
    cdsPadraoCLIENTE.AsVariant := GetDmPesquisar.GetCliente;
end;

procedure TfrmCR.FormCreate(Sender: TObject);
begin
  inherited;
  aCaption := 'Contas a receber';
  FieldNames := FN_CR;
  DisplayLabels := DL_CR;
  UpdateSingleField('update CONTASRECEBER set RECEBER = '+
    QuotedStr('N'));

  if cdspadrao.IsEmpty then
    lbStatus.Caption := '';
end;

procedure TfrmCR.cdsPadraoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  //Incrementa('CONTASRECEBER', cdsPadraoCODIGO, GetConnection);
  cdsPadraoDATA.AsDateTime := Date;
  cdsPadraoVENCIMENTO.AsDateTime := IncDay(Date, Global.PrazoInicial);
  cdsPadraoJURO.AsFloat := Global.Juro;
  cdsPadraoRECEBER.AsString := 'N';
  cdsPadraoRECDA.AsString := 'N';
  SetFocusIfCan(dbeCliente);
end;

procedure TfrmCR.miContasporClienteClick(Sender: TObject);
begin
  inherited;
  ChamaForm('TfrmRelatorioCRCliente', 'Contas a receber por Cliente', Self);
end;

procedure TfrmCR.miTodasContasClick(Sender: TObject);
begin
  inherited;
  with TfrmPrevContasReceber.Create(Self) do
  try
    cdsPadrao.Close;
    cdsPadrao.CommandText := 'select * from VIEWRELCR order by CLIENTE, DATA';
    cdsPadrao.Open;
    Titulo := 'Contas a receber';
    PrintIfNotEmptyRL(rrPadrao);
  finally
    cdsPadrao.Close;
    Free;
  end;
end;

procedure TfrmCR.miContasIntervaloDatasClick(Sender: TObject);
begin
  inherited;
  ChamaForm('TfrmRelatorioCRData', 'Contas a receber por data', Self);
end;

procedure TfrmCR.miContasVencidasClick(Sender: TObject);
begin
  inherited;
  with TfrmPrevRelCRAtrasadas.Create(Self), cdsPadrao do
  try
    Close;
    CommandText := 'select * from VIEWRELCRATRASADOS order by CLIENTE, VENCIMENTO';
    Open;
    Titulo := 'Contas a receber atrasadas';
    PrintIfNotEmptyRL(rrPadrao);
  finally
    cdsPadrao.Close;
    Free;
  end;
end;

procedure TfrmCR.miContasVencidasClienteClick(Sender: TObject);
begin
  inherited;
  ChamaForm('TfrmRelatorioCRAtraso', 'Contas a Receber Atrasadas', Self);
end;

procedure TfrmCR.actContasReceberExecute(Sender: TObject);
begin
  inherited;
  frmContasReceber := TfrmContasReceber.Create(self);
  frmContasReceber.Caption := 'Contas por cliente';
  frmContasReceber.TipoChamada := 0;
  frmContasReceber.ShowModal;
end;

procedure TfrmCR.actPrintExecute(Sender: TObject);
begin
  inherited;
  ChamaForm('TfrmPrevNotaProm', 'Relat�rio para cliente', Self);
end;

procedure TfrmCR.cdsPadraoCLIENTEValidate(Sender: TField);
var
  NomeCliente: string;
begin
  inherited;
  NomeCliente := GetFieldByID(GetConnection, 'CLIENTES', 'NOME', 'CODCLIENTE',
    Sender.AsInteger);
  if NomeCliente <> '' then
    cdsPadraoNOME.AsString := NomeCliente;
end;

procedure TfrmCR.cdsPadraoAfterScroll(DataSet: TDataSet);

  procedure msg(Texto: string; Cor: TColor);
  begin
    lbStatus.Caption := Texto;
    lbStatus.Font.Color := Cor;
    Application.ProcessMessages;
  end;

begin
  inherited;
  if cdspadrao.IsEmpty then
    msg('',clBlack);

  if cdsPadrao.State in [dsBrowse] then
  begin
    if (cdsPadraoVENCIMENTO.AsDateTime > Date) and (cdsPadraoRECDA.AsString = 'N') then
      msg('A vencer...', clBlack)
    else if (cdsPadraoVENCIMENTO.AsDateTime = Date) and (cdsPadraoRECDA.AsString = 'N') then
      msg('Vencendo hoje...', clBlue)
    else if (cdsPadraoVENCIMENTO.AsDateTime < Date) and (cdsPadraoRECDA.AsString = 'N') then
      msg('Vencida...', clRed)
    else if (cdsPadraoRECDA.AsString = 'S') then
      msg('Recebida...', clGreen);
  end
  else
    msg('', clBlack);
end;

procedure TfrmCR.ContaRecebida(var Msg: TMessage);
begin
  if cdsPadrao.Active then
    ReabreDataSet(cdsPadrao);
end;

procedure TfrmCR.miContasClienteCorrenteClick(Sender: TObject);
begin
  inherited;
  frmContasReceber := TfrmContasReceber.Create(self);
  frmContasReceber.Caption := 'Contas por cliente';
  frmContasReceber.TipoChamada := 1;
  frmContasReceber.IdCliente := cdsPadraoCLIENTE.AsInteger;
  frmContasReceber.ShowModal;
end;

procedure TfrmCR.dbeDescricaoEnter(Sender: TObject);
begin
  inherited;
  if ModoInsert(cdsPadrao) then
  begin
    if cdsPadraoNOME.AsString <> '' then
      cdsPadraoDESCRICAO.AsString := 'Recebimento: '+cdsPadraoNOME.AsString;
  end;
end;

procedure TfrmCR.miParcelamentoClick(Sender: TObject);
begin
  inherited;
  frmParcelaCPCR := TfrmParcelaCPCR.Create(Self);
  frmParcelaCPCR.TipoChamada := 0;
  frmParcelaCPCR.ShowModal;
end;

procedure TfrmCR.AntesSalvar;
begin
  inherited;
  if not GetDataModule.SituacaoClienteOk(cdsPadraoVALOR.AsFloat,
    cdsPadraoCLIENTE.AsInteger) then Abort;

//  if not ValidaDataIniFim(cdsPadraoDATA.AsDateTime, cdsPadraoVENCIMENTO.AsDateTime,
//    dbdData, False, True, 'A "Data de emiss�o" n�o pode ser maior que a data de "Data de vencimento".',
//    True) then Abort;

  if cdsPadrao.State in [dsInsert] then
  begin
    if not cdsPadraoDOCUMENTO.IsNull then
      if SelectSingleField('select count(1) from CONTASRECEBER where (DOCUMENTO = '+
        QuotedStr(cdsPadraoDOCUMENTO.AsString)+') and (CLIENTE = '+
        QuotedStr(IntToStr(cdsPadraoCLIENTE.AsInteger))+')', sqldPadrao.SQLConnection) > 0 then
      begin
        MsgCuidado('Este "Documento" j� est� cadastrado para este "Cliente".');
        SetFocusIfCan(dbeDocumento);
        Abort;
      end;
  end;

  if cdsPadraoIDCONTA.IsNull then
  begin
    MsgCuidado('O campo "Conta" � de preenchimento obrigat�rio.');
    Abort;
  end;
end;

procedure TfrmCR.dsPadraoStateChange(Sender: TObject);
begin
  inherited;
  //miParcelamento.Enabled := not EditModes;
end;

procedure TfrmCR.btnReceberClick(Sender: TObject);
begin
  inherited;
  if cdsPadrao.IsEmpty then
    Exit;

  // marca a conta
  cdsPadrao.Edit;
  cdsPadraoRECEBER.AsString := 'S';
  cdsPadrao.ApplyUpdates(0);

  if cdsPadraoRECDA.AsString = 'N' then
  begin
    frmReceberMan := TfrmReceberMan.Create(Self);
    frmReceberMan.Caption := 'Recebimento';
    frmReceberMan.ShowModal;
    if Assigned(frmReceberMan) then
      FreeAndNil(frmReceberMan);
  end
  else
  begin
    // desmarca a conta
    cdsPadrao.Edit;
    cdsPadraoRECEBER.AsString := 'N';
    cdsPadrao.ApplyUpdates(0);
    MsgAviso('�sta conta j� foi recebida');
  end;
end;

procedure TfrmCR.actDeleteExecute(Sender: TObject);
begin
  if MsgSN('Deseja realmente excluir este lan�amento?') then
  begin
    sqldDeleta.Close;
    sqldDeleta.Params.ParamByName('CODIGO').AsInteger := cdsPadraoCODIGO.AsInteger;
    sqldDeleta.ExecSQL;
    //actLimparFiltro.Execute;
    MsgAviso('Registro exclu�do!');
  end;
end;

procedure TfrmCR.cdsPadraoIDCONTAValidate(Sender: TField);
var
  NomeConta: string;
begin
  inherited;
  NomeConta := GetFieldByID(GetConnection, 'VIEWCAIXAS', 'CAIXANOME', 'IDCAIXAS',
    Sender.AsInteger);
  if NomeConta <> '' then
    cdsPadraoCONTA.AsString := NomeConta;
end;

procedure TfrmCR.dbeContaClickButton(Sender: TObject);
begin
  inherited;
  if cdsPadrao.State in [dsEdit, dsInsert] then
    cdsPadraoIDCONTA.AsVariant := GetDmPesquisar.GetContaCaixa;
end;

procedure TfrmCR.miProximosVencClick(Sender: TObject);
var
  frel: TfrmPrevContasReceber;
begin
  inherited;
  frel := TfrmPrevContasReceber.Create(nil);
  try
    frel.cdsPadrao.Close;
    frel.cdsPadrao.CommandText := 'select '+
                                  'DATA, '+
                                  'VENCIMENTO, '+
                                  'CLIENTE, '+
                                  'CAPITAL, '+
                                  'TOTAL '+
                                  'from VIEWRELCR '+
                                  //'WHERE CLIENTE = :PCLIENTE '+
                                  'where VENCIMENTO >= CURRENT_DATE '+
                                  'order by DATA';
    frel.cdsPadrao.Open;

    PrintIfNotEmptyRL(frel.rrPadrao);
  finally
    FreeAndNil(frel);
  end;
end;

initialization
  RegisterClass(TfrmCR);
finalization
  UnRegisterClass(TfrmCR);
end.


