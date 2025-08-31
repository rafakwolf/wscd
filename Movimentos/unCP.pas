unit unCP;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons,
  ComCtrls,   memds,  SqlDb,  DBCtrls, undmprincipal,
  ConstPadrao, FMTBcd,  VarGlobal, ZDataset;

type

  { TfrmCP }

  TfrmCP = class(TfrmPadrao)
    actContas: TAction;
    DataSource1: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    dsForn: TDataSource;
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
    dbeCompra: TDBEdit;
    dbeValorAtual: TDBEdit;
    grpPagamento: TGroupBox;
    dbeDataPagto: TDBEdit;
    dbeDesconto: TDBEdit;
    dbeCapitalPago: TDBEdit;
    dbeJuroPago: TDBEdit;
    dbeTotalPago: TDBEdit;
    sqldPadrao: TZQuery;
    sqldDeleta: TZQuery;
    zForn: TZQuery;
    ZReadOnlyQuery1: TZReadOnlyQuery;
    procedure FormCreate(Sender: TObject);
    procedure sqldPadraoAfterInsert(DataSet: TDataSet);
    procedure actContasExecute(Sender: TObject);
    procedure miContasPorFornClick(Sender: TObject);
    procedure miContasIntervaloDataClick(Sender: TObject);
    procedure miContasVencidasClick(Sender: TObject);
    procedure miContasVencPorFornClick(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure sqldPadraoAfterScroll(DataSet: TDataSet);
    procedure miContasFornecCorrenteClick(Sender: TObject);
    procedure dbeDescricaoEnter(Sender: TObject);
    procedure miParcelamentoClick(Sender: TObject);
    procedure dsPadraoStateChange(Sender: TObject);
    procedure btnPagarClick(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
  private
    function GetNextCodigo: Integer;
  protected
    procedure ContaPaga(var Msg: TMessage); message WM_CONTA_PAGAR_PAGA;
  public
    procedure AntesSalvar; override;
  end;

var
  frmCP: TfrmCP;

implementation

uses Funcoes, unPrevContasPagar, uDatabaseUtils,
     unContasPagar, unPrevCPAtrasados, uConfiguraRelatorio, unParcelaCPCR;

{$R *.dfm}

procedure TfrmCP.FormCreate(Sender: TObject);
begin
  inherited;
  aCaption      := 'Contas a pagar';
  FieldNames    := FN_CP;
  DisplayLabels := DL_CP;
  TableName := 'CONTASPAGAR';

  if sqldPadrao.IsEmpty then
    lbStatus.Caption := '';


  zForn.Open;
  ZReadOnlyQuery1.Open;
end;

procedure TfrmCP.sqldPadraoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  // Incrementa o campo CODIGO automaticamente
  sqldPadrao.FieldByName('CODIGO').AsInteger := GetNextCodigo;
  sqldPadrao.FieldByName('DATA').AsDateTime := Date;
  sqldPadrao.FieldByName('PAGA').AsString := 'N';
  sqldPadrao.FieldByName('PAGAR').AsString := 'N';
end;

function TfrmCP.GetNextCodigo: Integer;
var
  Query: TZQuery;
begin
  Result := 1;
  Query := TZQuery.Create(nil);
  try
    Query.Connection := GetZConnection;
    Query.SQL.Text := 'SELECT COALESCE(MAX(CODIGO), 0) + 1 FROM CONTASPAGAR';
    Query.Open;
    if not Query.IsEmpty then
      Result := Query.Fields[0].AsInteger;
    Query.Close;
  finally
    Query.Free;
  end;
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
    sqldPadrao.Close;
    sqldPadrao.SQL.Clear; sqldPadrao.SQL.Text :='select * from VIEWRELCPATRASADOS order by FORNECEDOR, VENCIMENTO';
    sqldPadrao.Open;
    Titulo := 'Contas a pagar atrasadas';
    PrintIfNotEmptyRL(rrPadrao);
  finally
    sqldPadrao.Close;
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
    sqldPadrao.Close;
    sqldPadrao.SQL.Clear; sqldPadrao.SQL.Text :='select * from VIEWRELCP order by FORNECEDOR, DATA';
    sqldPadrao.Open;
    Titulo := 'Listagem de Contas a pagar';
    PrintIfNotEmptyRL(rrPadrao);
  finally
    sqldPadrao.Close;
    Free;
  end;
end;

procedure TfrmCP.sqldPadraoAfterScroll(DataSet: TDataSet);

  procedure msg(Texto: string; Cor: TColor);
  begin
    lbStatus.Caption := Texto;
    lbStatus.Font.Color := Cor;
    Application.ProcessMessages;
  end;

begin
  inherited;
  if sqldPadrao.IsEmpty then
    msg('',clBlack);

  if sqldPadrao.State in [dsBrowse] then
  begin
    if (sqldPadrao.FieldByName('VENCIMENTO').AsDateTime > Date) and (sqldPadrao.FieldByName('PAGA').AsString = 'N') then
      msg('A vencer...', clBlack)
    else if (sqldPadrao.FieldByName('VENCIMENTO').AsDateTime = Date) and (sqldPadrao.FieldByName('PAGA').AsString = 'N') then
      msg('Vencendo hoje...', clBlue)
    else if (sqldPadrao.FieldByName('VENCIMENTO').AsDateTime < Date) and (sqldPadrao.FieldByName('PAGA').AsString = 'N') then
      msg('Vencida...', clRed)
    else if (sqldPadrao.FieldByName('PAGA').AsString = 'S') then
      msg('Paga...', clGreen);
  end
  else
    msg('', clBlack);
end;

procedure TfrmCP.ContaPaga(var Msg: TMessage);
begin
  if sqldPadrao.Active then
    ReabreDataSet(sqldPadrao);
end;

procedure TfrmCP.miContasFornecCorrenteClick(Sender: TObject);
begin
  inherited;
  frmContasPagar := TfrmContasPagar.Create(Self);
  frmContasPagar.Caption := 'Contas por fornecedor';
  frmContasPagar.TipoChamada := 1;
  frmContasPagar.IdForn := sqldPadrao.FieldByName('FORNECEDOR').AsInteger;
  frmContasPagar.ShowModal;
end;

procedure TfrmCP.dbeDescricaoEnter(Sender: TObject);
begin
  inherited;
  if ModoInsert(sqldPadrao) then
  begin
    if zForn.FieldByName('FANTASIA').AsString <> '' then
      sqldPadrao.FieldByName('DESCRICAO').AsString := 'Pagamento: '+zForn.FieldByName('FANTASIA').AsString;
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
//  if not ValidaDataIniFim(sqldPadrao.FieldByName('DATA').AsDateTime, sqldPadrao.FieldByName('VENCIMENTO').AsDateTime,
//    dbdData, False, True, 'A "Data de emissão" não pode ser maior que a data de "Data de vencimento".',
//    True) then
//    Abort;

  if sqldPadrao.State in [dsInsert] then
  begin
    if not sqldPadrao.FieldByName('DOCUMENTO').IsNull then
       if SelecSingleField('select count(1) from CONTASPAGAR where (DOCUMENTO = '+
        QuotedStr(sqldPadrao.FieldByName('DOCUMENTO').AsString)+') and (FORNECEDOR = '+
        QuotedStr(IntToStr(sqldPadrao.FieldByName('FORNECEDOR').AsInteger))+')', GetZConnection) > 0 then
      begin
        MsgCuidado('Este "Documento" já está cadastrado para este "Fornecedor".');
        SetFocusIfCan(dbeDocumento);
        Abort;
      end;
  end;

  if sqldPadrao.FieldByName('IDCONTA').IsNull then
  begin
    MsgCuidado('O campo "Conta" é de preenchimento obrigatório.');
    Abort;
  end;
end;

procedure TfrmCP.btnPagarClick(Sender: TObject);
begin
  inherited;
  if sqldPadrao.IsEmpty then
    Exit;

  // marca a conta
  sqldPadrao.Edit;
  sqldPadrao.FieldByName('PAGAR').AsString := 'S';
  sqldPadrao.ApplyUpdates;

  if (sqldPadrao.FieldByName('PAGA').AsString = 'N') then
  begin
    //frmPagarMan := TfrmPagarMan.Create(Self);
    //frmPagarMan.Caption := 'Pagamento';
    //frmPagarMan.ShowModal;
  end
  else
  begin
    // desmarca a conta
    sqldPadrao.Edit;
    sqldPadrao.FieldByName('PAGAR').AsString := 'N';
    sqldPadrao.ApplyUpdates;
    MsgAviso('Esta conta ja foi paga');
  end;
end;

procedure TfrmCP.actDeleteExecute(Sender: TObject);
begin
  if MsgSN('Deseja realmente excluir este lançamento?') then
  begin
    sqldDeleta.Close;
    sqldDeleta.Params.ParamByName('CODIGO').AsInteger := sqldPadrao.FieldByName('CODIGO').AsInteger;
    sqldDeleta.ExecSQL;

    MsgAviso('Registro excluído!');
  end;
end;

initialization
  RegisterClass(TfrmCP);
finalization
  UnRegisterClass(TfrmCP);
end.

