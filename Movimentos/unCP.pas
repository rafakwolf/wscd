unit unCP;

interface

uses
   Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons,
  ExtCtrls, ComCtrls, memds,  SqlDb,  DBCtrls,
  ConstPadrao, FMTBcd,  VarGlobal, uniLabel,   
   uniPanel,  uniStatusBar, uniEdit, uniDBEdit,
  Generics.Collections, uniGroupBox;

type
  TfrmCP = class(TfrmPadrao)
    sqldPadrao: TSQLQuery;
    dspPadrao: TComponent;
    cdsPadrao: TMemDataSet;
    actContas: TAction;
    cdsPadraoCODIGO: TIntegerField;
    cdsPadraoDATA: TDateField;
    cdsPadraoVENCIMENTO: TDateField;
    cdsPadraoFORNECEDOR: TIntegerField;
    cdsPadraoDESCRICAO: TStringField;
    cdsPadraoDOCUMENTO: TStringField;
    cdsPadraoPAGAR: TStringField;
    cdsPadraoPAGA: TStringField;
    cdsPadraoDATAPAGTO: TDateField;
    cdsPadraoORIGEM: TIntegerField;
    cdsPadraoCOMPRA: TIntegerField;
    cdsPadraoOBS: TMemoField;
    cdsPadraoATRASO: TIntegerField;
    cdsPadraoFANTAZIA: TStringField;
    sqldPadraoCODIGO: TIntegerField;
    sqldPadraoDATA: TDateField;
    sqldPadraoVENCIMENTO: TDateField;
    sqldPadraoFORNECEDOR: TIntegerField;
    sqldPadraoFANTAZIA: TStringField;
    sqldPadraoDESCRICAO: TStringField;
    sqldPadraoDOCUMENTO: TStringField;
    sqldPadraoVALOR: TFMTBCDField;
    sqldPadraoJURO: TFMTBCDField;
    sqldPadraoPAGAR: TStringField;
    sqldPadraoPAGA: TStringField;
    sqldPadraoDATAPAGTO: TDateField;
    sqldPadraoORIGEM: TIntegerField;
    sqldPadraoCOMPRA: TIntegerField;
    sqldPadraoCAPITALPAGO: TFMTBCDField;
    sqldPadraoJUROPAGO: TFMTBCDField;
    sqldPadraoDESCTO: TFMTBCDField;
    sqldPadraoOBS: TMemoField;
    sqldPadraoATRASO: TIntegerField;
    cdsPadraoVALOR: TFMTBCDField;
    cdsPadraoJURO: TFMTBCDField;
    cdsPadraoCAPITALPAGO: TFMTBCDField;
    cdsPadraoJUROPAGO: TFMTBCDField;
    cdsPadraoDESCTO: TFMTBCDField;
    sqldDeleta: TSQLQuery;
    sqldPadraoIDCONTA: TIntegerField;
    sqldPadraoNOME: TStringField;
    cdsPadraoIDCONTA: TIntegerField;
    cdsPadraoNOME: TStringField;
    sqldPadraoVALORJURO: TSingleField;
    sqldPadraoTOTAL: TSingleField;
    sqldPadraoTOTALPAGO: TSingleField;
    cdsPadraoVALORJURO: TSingleField;
    cdsPadraoTOTAL: TSingleField;
    cdsPadraoTOTALPAGO: TSingleField;
    lbStatus: TLabel;
    btnPagar: TBitBtn;
    btnContas: TBitBtn;
    dbdVencimento: TDBEdit;
    dbdData: TDBEdit;
    dbeOrigem: TDBEdit;
    dbeJuros: TDBEdit;
    dbeDocumento: TDBEdit;
    dbeValor: TDBEdit;
    dbeDescricao: TDBEdit;
    dbeFornecedor: TDBEdit;
    dbeCompra: TDBEdit;
    dbeValorAtual: TDBEdit;
    dbeConta: TDBEdit;
    grpPagamento: TGroupBox;
    dbeDataPagto: TDBEdit;
    dbeDesconto: TDBEdit;
    dbeCapitalPago: TDBEdit;
    dbeJuroPago: TDBEdit;
    dbeTotalPago: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure cdsPadraoAfterInsert(DataSet: TDataSet);
    procedure dbeFornecedorClickButton(Sender: TObject);
    procedure actContasExecute(Sender: TObject);
    procedure miContasPorFornClick(Sender: TObject);
    procedure miContasIntervaloDataClick(Sender: TObject);
    procedure miContasVencidasClick(Sender: TObject);
    procedure miContasVencPorFornClick(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure cdsPadraoFORNECEDORValidate(Sender: TField);
    procedure cdsPadraoAfterScroll(DataSet: TDataSet);
    procedure miContasFornecCorrenteClick(Sender: TObject);
    procedure dbeDescricaoEnter(Sender: TObject);
    procedure miParcelamentoClick(Sender: TObject);
    procedure dsPadraoStateChange(Sender: TObject);
    procedure btnPagarClick(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure cdsPadraoIDCONTAValidate(Sender: TField);
    procedure dbeContaClickButton(Sender: TObject);
  private
  protected
    procedure ContaPaga(var Msg: TMessage); message WM_CONTA_PAGAR_PAGA;
  public
    procedure AntesSalvar; override;
  end;

var
  frmCP: TfrmCP;

implementation

uses Funcoes, unPrevContasPagar,  udatabaseutils,
     unContasPagar, unPrevCPAtrasados,  uConfiguraRelatorio,
     unPagarMan, unParcelaCPCR;

{$R *.dfm}

procedure TfrmCP.FormCreate(Sender: TObject);
begin
  inherited;
  aCaption      := 'Contas a pagar';
  FieldNames    := FN_CP;
  DisplayLabels := DL_CP;

  if cdspadrao.IsEmpty then
    lbStatus.Caption := '';
end;

procedure TfrmCP.cdsPadraoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  //TODO : Incrementa('CONTASPAGAR', cdsPadraoCODIGO, GetConnection);
  cdsPadraoDATA.AsDateTime := Date;
  cdsPadraoPAGA.AsString := 'N';
  cdsPadraoPAGAR.AsString := 'N';
  SetFocusIfCan(dbeFornecedor);
end;

procedure TfrmCP.dbeFornecedorClickButton(Sender: TObject);
begin
  inherited;
  if cdsPadrao.State in [dsEdit, dsInsert] then
    cdsPadraoFORNECEDOR.AsVariant := getDmPesquisar.GetFornecedor;
end;

procedure TfrmCP.actContasExecute(Sender: TObject);
begin
  inherited;
  frmContasPagar := TfrmContasPagar.Create(Self);
  frmContasPagar.Caption := 'Contas por fornecedor';
  frmContasPagar.TipoChamada := 0;
  frmContasPagar.ShowModal;
end;

procedure TfrmCP.miContasPorFornClick(Sender: TObject);
begin
  inherited;
  ChamaForm('TfrmRelatorioCPFornecedor', 'Contas a Pagar por Fornecedor', Self);
end;

procedure TfrmCP.miContasIntervaloDataClick(Sender: TObject);
begin
  inherited;
  ChamaForm('TfrmRelatorioCPData', 'Contas a pagar por data', Self);
end;

procedure TfrmCP.miContasVencidasClick(Sender: TObject);
begin
  inherited;
  with TfrmPrevContasPagar.Create(Self) do
  try
    cdsPadrao.Close;
    cdsPadrao.SQL.Clear; SQL.Text :='select * from VIEWRELCPATRASADOS order by FORNECEDOR, VENCIMENTO';
    cdsPadrao.Open;
    Titulo := 'Contas a pagar atrasadas';
    PrintIfNotEmptyRL(rrPadrao);
  finally
    cdsPadrao.Close;
    Free;
  end;
end;

procedure TfrmCP.miContasVencPorFornClick(Sender: TObject);
begin
  inherited;
  ChamaForm('TfrmRelatorioCPAtrasados', 'Contas a pagar atrasadas', Self);
end;

procedure TfrmCP.actPrintExecute(Sender: TObject);
begin
  inherited;
  with TfrmPrevContasPagar.Create(Self) do
  try
    cdsPadrao.Close;
    cdsPadrao.SQL.Clear; SQL.Text :='select * from VIEWRELCP order by FORNECEDOR, DATA';
    cdsPadrao.Open;
    Titulo := 'Listagem de Contas a pagar';
    PrintIfNotEmptyRL(rrPadrao);
  finally
    cdsPadrao.Close;
    Free;
  end;
end;

procedure TfrmCP.cdsPadraoFORNECEDORValidate(Sender: TField);
var
  NomeForn: string;
begin
  inherited;
  NomeForn := GetFieldByID(GetConnection, 'FORNECEDORES', 'FANTAZIA', 'CODFORNECEDOR',
    Sender.AsInteger);
  if NomeForn <> '' then
    cdsPadraoFANTAZIA.AsString := NomeForn;
end;

procedure TfrmCP.cdsPadraoAfterScroll(DataSet: TDataSet);

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
    if (cdsPadraoVENCIMENTO.AsDateTime > Date) and (cdsPadraoPAGA.AsString = 'N') then
      msg('A vencer...', clBlack)
    else if (cdsPadraoVENCIMENTO.AsDateTime = Date) and (cdsPadraoPAGA.AsString = 'N') then
      msg('Vencendo hoje...', clBlue)
    else if (cdsPadraoVENCIMENTO.AsDateTime < Date) and (cdsPadraoPAGA.AsString = 'N') then
      msg('Vencida...', clRed)
    else if (cdsPadraoPAGA.AsString = 'S') then
      msg('Paga...', clGreen);
  end
  else
    msg('', clBlack);
end;

procedure TfrmCP.ContaPaga(var Msg: TMessage);
begin
  if cdsPadrao.Active then
    ReabreDataSet(cdsPadrao);
end;

procedure TfrmCP.miContasFornecCorrenteClick(Sender: TObject);
begin
  inherited;
  frmContasPagar := TfrmContasPagar.Create(Self);
  frmContasPagar.Caption := 'Contas por fornecedor';
  frmContasPagar.TipoChamada := 1;
  frmContasPagar.IdForn := cdsPadraoFORNECEDOR.AsInteger;
  frmContasPagar.ShowModal;
end;

procedure TfrmCP.dbeDescricaoEnter(Sender: TObject);
begin
  inherited;
  if ModoInsert(cdsPadrao) then
  begin
    if cdsPadraoFANTAZIA.AsString <> '' then
      cdsPadraoDESCRICAO.AsString := 'Pagamento: '+cdsPadraoFANTAZIA.AsString;
  end;
end;

procedure TfrmCP.miParcelamentoClick(Sender: TObject);
begin
  inherited;
  frmParcelaCPCR := TfrmParcelaCPCR.Create(Self);
  frmParcelaCPCR.TipoChamada := 1;
  frmParcelaCPCR.ShowModal;
end;

procedure TfrmCP.dsPadraoStateChange(Sender: TObject);
begin
  inherited;
  //miParcelamento.Enabled := not EditModes;
end;

procedure TfrmCP.AntesSalvar;
begin
  inherited;
//  if not ValidaDataIniFim(cdsPadraoDATA.AsDateTime, cdsPadraoVENCIMENTO.AsDateTime,
//    dbdData, False, True, 'A "Data de emiss�o" n�o pode ser maior que a data de "Data de vencimento".',
//    True) then
//    Abort;

  if cdsPadrao.State in [dsInsert] then
  begin
    if not cdsPadraoDOCUMENTO.IsNull then
       if SelectSingleField('select count(1) from CONTASPAGAR where (DOCUMENTO = '+
        QuotedStr(cdsPadraoDOCUMENTO.AsString)+') and (FORNECEDOR = '+
        QuotedStr(IntToStr(cdsPadraoFORNECEDOR.AsInteger))+')', sqldPadrao.SQLConnection) > 0 then
      begin
        MsgCuidado('Este "Documento" j� est� cadastrado para este "Fornecedor".');
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

procedure TfrmCP.btnPagarClick(Sender: TObject);
begin
  inherited;
  if cdsPadrao.IsEmpty then
    Exit;

  // marca a conta
  cdsPadrao.Edit;
  cdsPadraoPAGAR.AsString := 'S';
  cdsPadrao.ApplyUpdates(0);

  if (cdsPadraoPAGA.AsString = 'N') then
  begin
    frmPagarMan := TfrmPagarMan.Create(Self);
    frmPagarMan.Caption := 'Pagamento';
    frmPagarMan.ShowModal;
  end
  else
  begin
    // desmarca a conta
    cdsPadrao.Edit;
    cdsPadraoPAGAR.AsString := 'N';
    cdsPadrao.ApplyUpdates(0);
    MsgAviso('�sta conta j� foi paga');
  end;
end;

procedure TfrmCP.actDeleteExecute(Sender: TObject);
begin
  if MsgSN('Deseja realmente excluir este lan�amento?') then
  begin
    sqldDeleta.Close;
    sqldDeleta.Params.ParamByName('CODIGO').AsInteger := cdsPadraoCODIGO.AsInteger;
    sqldDeleta.ExecSQL;

    MsgAviso('Registro exclu�do!');
  end;
end;

procedure TfrmCP.cdsPadraoIDCONTAValidate(Sender: TField);
var
  NomeConta: string;
begin
  inherited;
  NomeConta := GetFieldByID(GetConnection, 'CAIXAS', 'NOME', 'CODIGO',
    Sender.AsInteger);
  if NomeConta <> '' then
    cdsPadraoNOME.AsString := NomeConta;
end;

procedure TfrmCP.dbeContaClickButton(Sender: TObject);
begin
  inherited;
  if cdsPadrao.State in [dsEdit, dsInsert] then
    cdsPadraoIDCONTA.AsVariant := GetDmPesquisar.GetContaCaixa;
end;

initialization
  RegisterClass(TfrmCP);
finalization
  UnRegisterClass(TfrmCP);
end.

