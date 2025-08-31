unit unCR;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons, DateUtils,
  ComCtrls, DBCtrls, unDmPrincipal,
  SqlDb,  memds, ConstPadrao, ZDataset, FMTBcd;

type

  { TfrmCR }

  TfrmCR = class(TfrmPadrao)
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    actContasReceber: TAction;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    lbStatus: TLabel;
    btnReceber: TBitBtn;
    btnContas: TBitBtn;
    dbeValorAtual: TDBEdit;
    dbeDescricao: TDBEdit;
    dbeValor: TDBEdit;
    dbeDocumento: TDBEdit;
    dbeJuros: TDBEdit;
    dbeOrigem: TDBEdit;
    dbdData: TDBEdit;
    dbdVencimento: TDBEdit;
    dbeVenda: TDBEdit;
    grpRecebimento: TGroupBox;
    dbeDataRecdo: TDBEdit;
    dbeDesconto: TDBEdit;
    dbeCapitalRecdo: TDBEdit;
    dbeJuroRecdo: TDBEdit;
    dbeTotalRecdo: TDBEdit;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    sqldPadrao: TZQuery;
    sqldLimite: TZQuery;
    sqldDeleta: TZQuery;
    ZReadOnlyQuery1: TZReadOnlyQuery;
    ZReadOnlyQuery2: TZReadOnlyQuery;
    procedure FormCreate(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure sqldPadraoAfterInsert(DataSet: TDataSet);
    procedure miContasporClienteClick(Sender: TObject);
    procedure miTodasContasClick(Sender: TObject);
    procedure miContasIntervaloDatasClick(Sender: TObject);
    procedure miContasVencidasClick(Sender: TObject);
    procedure miContasVencidasClienteClick(Sender: TObject);
    procedure actContasReceberExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure sqldPadraoAfterScroll(DataSet: TDataSet);
    procedure miContasClienteCorrenteClick(Sender: TObject);
    procedure dbeDescricaoEnter(Sender: TObject);
    procedure miParcelamentoClick(Sender: TObject);
    procedure dsPadraoStateChange(Sender: TObject);
    procedure btnReceberClick(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure miProximosVencClick(Sender: TObject);
  private
    function GetNextCodigo: Integer;
  protected
    procedure ContaRecebida(var Msg: TMessage); message WM_CONTA_RECEBER_RECEBIDA;
  public
    procedure AntesSalvar; override;
  end;

var
  frmCR: TfrmCR;

implementation

uses VarGlobal, Funcoes, uConfiguraRelatorio, unPrevContasReceber,
     unPrevRelCRAtrasadas, unContasReceber,
     unParcelaCPCR, uDatabaseUtils;

{$R *.dfm}


procedure TfrmCR.FormCreate(Sender: TObject);
begin
  inherited;
  aCaption := 'Contas a receber';
  FieldNames := FN_CR;
  DisplayLabels := DL_CR;
  TableName := 'CONTASRECEBER';

  UpdateSingleField('update CONTASRECEBER set RECEBER = '+
    QuotedStr('N'));

  if sqldPadrao.IsEmpty then
    lbStatus.Caption := '';

  ZReadOnlyQuery1.open;
  ZReadOnlyQuery2.open;
end;

procedure TfrmCR.MenuItem1Click(Sender: TObject);
begin

end;

procedure TfrmCR.sqldPadraoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  // Incrementa o campo CODIGO automaticamente
  sqldPadrao.FieldByName('CODIGO').AsInteger := GetNextCodigo;
  sqldPadrao.FieldByName('DATA').AsDateTime := Date;
  sqldPadrao.FieldByName('VENCIMENTO').AsDateTime := IncDay(Date, 1);
  sqldPadrao.FieldByName('JURO').AsFloat := 1;
  sqldPadrao.FieldByName('RECEBER').AsString := 'N';
  sqldPadrao.FieldByName('RECDA').AsString := 'N';
end;

function TfrmCR.GetNextCodigo: Integer;
var
  Query: TZQuery;
begin
  Result := 1;
  Query := TZQuery.Create(nil);
  try
    Query.Connection := GetZConnection;
    Query.SQL.Text := 'SELECT COALESCE(MAX(CODIGO), 0) + 1 FROM CONTASRECEBER';
    Query.Open;
    if not Query.IsEmpty then
      Result := Query.Fields[0].AsInteger;
    Query.Close;
  finally
    Query.Free;
  end;
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
    sqldPadrao.Close;
    sqldPadrao.SQL.Clear; sqldPadrao.SQL.Text :='select * from VIEWRELCR order by CLIENTE, DATA';
    sqldPadrao.Open;
    Titulo := 'Contas a receber';
    PrintIfNotEmptyRL(rrPadrao);
  finally
    sqldPadrao.Close;
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
  with TfrmPrevRelCRAtrasadas.Create(Self), sqldPadrao do
  try
    Close;
    SQL.Clear; SQL.Text :='select * from VIEWRELCRATRASADOS order by CLIENTE, VENCIMENTO';
    Open;
    Titulo := 'Contas a receber atrasadas';
    PrintIfNotEmptyRL(rrPadrao);
  finally
    sqldPadrao.Close;
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
  ChamaForm('TfrmPrevNotaProm', 'Relatório para cliente', Self);
end;

procedure TfrmCR.sqldPadraoAfterScroll(DataSet: TDataSet);

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
    if (sqldPadrao.FieldByName('VENCIMENTO').AsDateTime > Date) and (sqldPadrao.FieldByName('RECDA').AsString = 'N') then
      msg('A vencer...', clBlack)
    else if (sqldPadrao.FieldByName('VENCIMENTO').AsDateTime = Date) and (sqldPadrao.FieldByName('RECDA').AsString = 'N') then
      msg('Vencendo hoje...', clBlue)
    else if (sqldPadrao.FieldByName('VENCIMENTO').AsDateTime < Date) and (sqldPadrao.FieldByName('RECDA').AsString = 'N') then
      msg('Vencida...', clRed)
    else if (sqldPadrao.FieldByName('RECDA').AsString = 'S') then
      msg('Recebida...', clGreen);
  end
  else
    msg('', clBlack);
end;

procedure TfrmCR.ContaRecebida(var Msg: TMessage);
begin
  if sqldPadrao.Active then
    ReabreDataSet(sqldPadrao);
end;

procedure TfrmCR.miContasClienteCorrenteClick(Sender: TObject);
begin
  inherited;
  frmContasReceber := TfrmContasReceber.Create(self);
  frmContasReceber.Caption := 'Contas por cliente';
  frmContasReceber.TipoChamada := 1;
  frmContasReceber.IdCliente := sqldPadrao.FieldByName('CLIENTE').AsInteger;
  frmContasReceber.ShowModal;
end;

procedure TfrmCR.dbeDescricaoEnter(Sender: TObject);
begin
  inherited;
  if ModoInsert(sqldPadrao) then
  begin
    if ZReadOnlyQuery1.FieldByName('NOME').AsString <> '' then
      sqldPadrao.FieldByName('DESCRICAO').AsString := 'Recebimento: '+ZReadOnlyQuery1.FieldByName('NOME').AsString;
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
  if not GetDataModule.SituacaoClienteOk(sqldPadrao.FieldByName('VALOR').AsFloat,
    sqldPadrao.FieldByName('CLIENTE').AsInteger) then Abort;

//  if not ValidaDataIniFim(sqldPadrao.FieldByName('DATA').AsDateTime, sqldPadrao.FieldByName('VENCIMENTO').AsDateTime,
//    dbdData, False, True, 'A "Data de emissão" não pode ser maior que a data de "Data de vencimento".',
//    True) then Abort;

  if sqldPadrao.State in [dsInsert] then
  begin
    if not sqldPadrao.FieldByName('DOCUMENTO').IsNull then
      if SelecSingleField('select count(1) from CONTASRECEBER where (DOCUMENTO = '+
        QuotedStr(sqldPadrao.FieldByName('DOCUMENTO').AsString)+') and (CLIENTE = '+
        QuotedStr(IntToStr(sqldPadrao.FieldByName('CLIENTE').AsInteger))+')', GetZConnection) > 0 then
      begin
        MsgCuidado('Este "Documento" já está cadastrado para este "Cliente".');
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

procedure TfrmCR.dsPadraoStateChange(Sender: TObject);
begin
  inherited;
  //miParcelamento.Enabled := not EditModes;
end;

procedure TfrmCR.btnReceberClick(Sender: TObject);
begin
  inherited;
  if sqldPadrao.IsEmpty then
    Exit;

  // marca a conta
  sqldPadrao.Edit;
  sqldPadrao.FieldByName('RECEBER').AsString := 'S';
  //sqldPadrao.ApplyUpdates(0);

  if sqldPadrao.FieldByName('RECDA').AsString = 'N' then
  begin
    //frmReceberMan := TfrmReceberMan.Create(Self);
    //frmReceberMan.Caption := 'Recebimento';
    //frmReceberMan.ShowModal;
    //if Assigned(frmReceberMan) then
    //  FreeAndNil(frmReceberMan);
  end
  else
  begin
    // desmarca a conta
    sqldPadrao.Edit;
    sqldPadrao.FieldByName('RECEBER').AsString := 'N';
    sqldPadrao.ApplyUpdates;
    MsgAviso('Esta conta ja foi recebida');
  end;
end;

procedure TfrmCR.actDeleteExecute(Sender: TObject);
begin
  if MsgSN('Deseja realmente excluir este lançamento?') then
  begin
    sqldDeleta.Close;
    sqldDeleta.Params.ParamByName('CODIGO').AsInteger := sqldPadrao.FieldByName('CODIGO').AsInteger;
    sqldDeleta.ExecSQL;
    //actLimparFiltro.Execute;
    MsgAviso('Registro excluído!');
  end;
end;

procedure TfrmCR.miProximosVencClick(Sender: TObject);
var
  frel: TfrmPrevContasReceber;
begin
  inherited;
  frel := TfrmPrevContasReceber.Create(nil);
  try
    frel.sqldPadrao.Close;
    frel.sqldPadrao.SQL.Clear; sqldPadrao.SQL.Text :='select '+
                                  'DATA, '+
                                  'VENCIMENTO, '+
                                  'CLIENTE, '+
                                  'CAPITAL, '+
                                  'TOTAL '+
                                  'from VIEWRELCR '+
                                  //'WHERE CLIENTE = :PCLIENTE '+
                                  'where VENCIMENTO >= CURRENT_DATE '+
                                  'order by DATA';
    frel.sqldPadrao.Open;

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


