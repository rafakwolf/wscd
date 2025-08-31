unit unContasPagar;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,   Grids, DBGrids, StdCtrls,  Buttons, DBCtrls, DB, memds,
  Menus, SqlDb, ComCtrls,  ConstPadrao, ActnList,
  FMTBcd, unSimplePadrao,  VarGlobal, LCLType, ZDataset;

const
  SQLPadraoTela: string = 'select'+
                          ' cp.CODIGO,'+
                          ' cp.DATA,'+
                          ' cp.VENCIMENTO,'+
                          ' cp.FORNECEDOR,'+
                          ' forn.FANTASIA NOMEFORN,'+
                          ' cp.DESCRICAO,'+
                          ' cp.DOCUMENTO,'+
                          ' cp.VALOR,'+
                          ' cp.JURO,'+
                          ' cp.PAGAR,'+
                          ' cp.PAGA,'+
                          ' cp.DATAPAGTO,'+
                          ' cp.ORIGEM,'+
                          ' cp.COMPRA,'+
                          ' cp.CAPITALPAGO,'+
                          ' cp.JUROPAGO,'+
                          ' cp.DESCTO,'+
                          ' cp.OBS,'+
                          ' cp.ATRASO,'+
                          ' cp.VALORJURO,'+
                          ' cp.TOTAL,'+
                          ' cp.TOTALPAGO '+
                          'from CONTASPAGAR cp '+
                          'left join FORNECEDORES forn on (cp.FORNECEDOR = forn.CODFORNECEDOR) '+
                          'where PAGA = '''+'N'+''' and FORNECEDOR = :PFORN '+
                          'order by cp.VENCIMENTO desc';

  SQLVencidas: string =   'select'+
                          ' cp.CODIGO,'+
                          ' cp.DATA,'+
                          ' cp.VENCIMENTO,'+
                          ' cp.FORNECEDOR,'+
                          ' forn.FANTASIA NOMEFORN,'+
                          ' cp.DESCRICAO,'+
                          ' cp.DOCUMENTO,'+
                          ' cp.VALOR,'+
                          ' cp.JURO,'+
                          ' cp.PAGAR,'+
                          ' cp.PAGA,'+
                          ' cp.DATAPAGTO,'+
                          ' cp.ORIGEM,'+
                          ' cp.COMPRA,'+
                          ' cp.CAPITALPAGO,'+
                          ' cp.JUROPAGO,'+
                          ' cp.DESCTO,'+
                          ' cp.OBS,'+
                          ' cp.ATRASO,'+
                          ' cp.VALORJURO,'+
                          ' cp.TOTAL,'+
                          ' cp.TOTALPAGO '+
                          'from CONTASPAGAR cp '+
                          'left join FORNECEDORES forn on (cp.FORNECEDOR = forn.CODFORNECEDOR) '+
                          'where PAGA = '''+'N'+''' and FORNECEDOR = :PFORN '+
                          'and VENCIMENTO < CURRENT_DATE '+
                          'order by cp.VENCIMENTO desc';

  SQLHoje: string =       'select'+
                          ' cp.CODIGO,'+
                          ' cp.DATA,'+
                          ' cp.VENCIMENTO,'+
                          ' cp.FORNECEDOR,'+
                          ' forn.FANTASIA NOMEFORN,'+
                          ' cp.DESCRICAO,'+
                          ' cp.DOCUMENTO,'+
                          ' cp.VALOR,'+
                          ' cp.JURO,'+
                          ' cp.PAGAR,'+
                          ' cp.PAGA,'+
                          ' cp.DATAPAGTO,'+
                          ' cp.ORIGEM,'+
                          ' cp.COMPRA,'+
                          ' cp.CAPITALPAGO,'+
                          ' cp.JUROPAGO,'+
                          ' cp.DESCTO,'+
                          ' cp.OBS,'+
                          ' cp.ATRASO,'+
                          ' cp.VALORJURO,'+
                          ' cp.TOTAL,'+
                          ' cp.TOTALPAGO '+
                          'from CONTASPAGAR cp '+
                          'left join FORNECEDORES forn on (cp.FORNECEDOR = forn.CODFORNECEDOR) '+
                          'where PAGA = '''+'N'+''' and FORNECEDOR = :PFORN '+
                          'and VENCIMENTO = CURRENT_DATE '+
                          'order by cp.VENCIMENTO desc';

type

  { TfrmContasPagar }

  TfrmContasPagar = class(TfrmSimplePadrao)
    alContasPagar: TActionList;
    actPagar: TAction;
    actExcluir: TAction;
    actFechar: TAction;
    dsPadrao: TDataSource;
    actBuscarForn: TAction;
    actPagas: TAction;
    mnuCP: TMainMenu;
    miOpcoes: TMenuItem;
    miPagar: TMenuItem;
    miExcluir: TMenuItem;
    N1: TMenuItem;
    miVencendohoje: TMenuItem;
    miPagas: TMenuItem;
    miContasvencidas: TMenuItem;
    miTodasContas: TMenuItem;
    N2: TMenuItem;
    miBuscarForn: TMenuItem;
    N3: TMenuItem;
    miFechar: TMenuItem;
    miRelatorios: TMenuItem;
    miRecibo: TMenuItem;
    Stb: TStatusBar;
    pnBotoes: TPanel;
    btnExcluir: TSpeedButton;
    btnPagar: TSpeedButton;
    btnFechar: TSpeedButton;
    btnPagas: TSpeedButton;
    grpForn: TGroupBox;
    dbeFornecedor: TDBEdit;
    Grade: TDBGrid;
    sqldForn: TZQuery;
    sqldPadrao: TZQuery;
    sqldDeleta: TZQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure miReciboClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actPagarExecute(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
    procedure actBuscarFornExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actPagasExecute(Sender: TObject);
    procedure miContasvencidasClick(Sender: TObject);
    procedure miTodasContasClick(Sender: TObject);
    procedure dsPadraoStateChange(Sender: TObject);
    procedure GradeDblClick(Sender: TObject);
    procedure miVencendohojeClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    SQLPadraoForn: string;
    function ContasVencidas: Currency;
    function ContasAVencer: Currency;
    function ContasVencendoHoje: Currency;
  protected
    procedure ContaPaga(var Msg: TMessage); message WM_CONTA_PAGAR_PAGA; 
  public
    TipoChamada: Integer;
    IdForn: Integer;
    procedure ContaModificada;
  end;                                                                                           

var
  frmContasPagar: TfrmContasPagar;

implementation

uses
  Funcoes, unContasPagas, unModeloConsulta, unRecibo;

{$R *.dfm}

procedure TfrmContasPagar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmContasPagar.miReciboClick(Sender: TObject);
begin
  if MsgSN('Exportar esta conta para recibo?')then
  begin
    TfrmRecibo.AddAndPrint(
       sqldPadrao.fieldByName('VENCIMENTO').AsDateTime,
       sqldPadrao.fieldByName('TOTAL').AsFloat,
       sqldPadrao.fieldByName('NOMEFORN').AsString,
       sqldPadrao.fieldByName('DESCRICAO').AsString
    );
  end;  
end;

procedure TfrmContasPagar.FormCreate(Sender: TObject);
begin
  inherited;
  ClientHeight := 425;
  ClientWidth  := 760;
  CentralizaForm(Self);
  ReordenaBotoes([btnPagar, btnExcluir, btnPagas, btnFechar]);
  SQLPadraoForn := sqldForn.SQL.text;
end;

procedure TfrmContasPagar.actExcluirExecute(Sender: TObject);
begin
  if sqldPadrao.IsEmpty then Exit;
  if MsgSN('Deseja realmente excluir ?')then
  begin
    with sqldDeleta do
    begin
      Close;
      Params.ParamByName('CODIGO').AsInteger := sqldPadrao.fieldByName('CODIGO').AsInteger;
      ExecSQL;
    end;
    sqldPadrao.Close;
    sqldPadrao.Open;
  end;
end;

procedure TfrmContasPagar.actPagarExecute(Sender: TObject);
begin
  if sqldPadrao.IsEmpty then
    Exit;
  ChamaForm('TfrmPagarMan', 'Pagamento', Self);
end;

procedure TfrmContasPagar.actFecharExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmContasPagar.actBuscarFornExecute(Sender: TObject);
begin
  if TipoChamada = 0 then
  begin
    actBuscarForn.Enabled := True;

    sqldForn.Close;
    sqldForn.SQL.Clear;
    sqldForn.SQL.Text := SQLPadraoForn;
    sqldForn.Open;

    if TfrmModeloConsulta.Execute('Fornecedor', 'FORNECEDORES', FN_FORN, DL_FORN, self) > 0 then
    begin
      IdForn := sqldForn.fieldByName('CODFORNECEDOR').AsInteger;
      if (IdForn > 0) then
      begin
        sqldPadrao.Close;
        sqldPadrao.Params.ParamByName('PFORN').AsInteger := IdForn;
        sqldPadrao.Open;
      end;
      if sqldPadrao.IsEmpty then
      begin
        MsgErro(UM_PESQUISAVAZIO, 'Contas a Pagar');
        self.close;
      end;
    end;
  end
  else if TipoChamada = 1 then
  begin
    actBuscarForn.Enabled := False;
    if (IdForn > 0) then
    begin
      sqldPadrao.Close;
      sqldPadrao.Params.ParamByName('PFORN').AsInteger := IdForn;
      sqldPadrao.Open;
    end;
    if sqldPadrao.IsEmpty then
    begin
      MsgErro(UM_PESQUISAVAZIO, 'Contas a Pagar');
      self.close;
    end;
  end;
end;

procedure TfrmContasPagar.FormShow(Sender: TObject);
begin
  actBuscarForn.Execute;
end;

procedure TfrmContasPagar.actPagasExecute(Sender: TObject);
begin
  frmContasPagas := TfrmContasPagas.Create(Self);
  frmContasPagas.Caption := 'Contas pagas';
  frmContasPagas.Fornecedor := IdForn;
  frmContasPagas.ShowModal;
end;

procedure TfrmContasPagar.ContaModificada;
begin
  sqldPadrao.Close;
  sqldPadrao.Params.ParamByName('PFORN').AsInteger := IdForn;
  sqldPadrao.Open;
  dsPadrao.OnStateChange(dsPadrao);
end;

procedure TfrmContasPagar.miContasvencidasClick(Sender: TObject);
begin
  sqldPadrao.Close;
  sqldPadrao.SQL.Clear;
  sqldPadrao.SQL.Text :=SQLVencidas;
  sqldPadrao.Params.ParamByName('PFORN').AsInteger := IdForn;
  sqldPadrao.Open;
end;

procedure TfrmContasPagar.miTodasContasClick(Sender: TObject);
begin
  sqldPadrao.Close;
  sqldPadrao.SQL.Clear;
  sqldPadrao.SQL.Text :=SQLPadraoTela;
  sqldPadrao.Params.ParamByName('PFORN').AsInteger := IdForn;
  sqldPadrao.Open;
end;

function TfrmContasPagar.ContasAVencer: Currency;
begin
  with TZQuery.Create(nil) do
  try
    Connection := GetZConnection;
    SQL.text :=
      'select sum(TOTAL) as SOMA from CONTASPAGAR where (VENCIMENTO > CURRENT_DATE) '+
      'and (PAGA = '''+'N'+''') and FORNECEDOR = :FORN';
    Params.ParamByName('FORN').AsInteger := IdForn;  
    Open;
    Result := FieldByName('SOMA').AsCurrency;
  finally
    Free;
  end;
end;

function TfrmContasPagar.ContasVencendoHoje: Currency;
begin
  with TZQuery.Create(nil) do
  try
    Connection := GetZConnection;
    SQl.text :=
      'select sum(TOTAL) as SOMA from CONTASPAGAR where (VENCIMENTO = CURRENT_DATE) '+
      'and (PAGA = '''+'N'+''') and FORNECEDOR = :FORN';
    Params.ParamByName('FORN').AsInteger := IdForn;
    Open;
    Result := FieldByName('SOMA').AsCurrency;
  finally
    Free;
  end;
end;

function TfrmContasPagar.ContasVencidas: Currency;
begin
  with TZQuery.Create(nil) do
  try
    Connection := GetZConnection;
    SQL.Text :=
      'select sum(TOTAL) as SOMA from CONTASPAGAR where (VENCIMENTO < CURRENT_DATE) '+
      'and (PAGA = '''+'N'+''') and FORNECEDOR = :FORN';
    Params.ParamByName('FORN').AsInteger := IdForn;  
    Open;
    Result := FieldByName('SOMA').AsCurrency;
  finally
    Free;
  end;
end;

procedure TfrmContasPagar.dsPadraoStateChange(Sender: TObject);
begin
  Stb.Panels[0].Text := 'Vencidas: '+CurrToStrF(ContasVencidas, ffCurrency, 2);
  Stb.Panels[1].Text := 'A vencer: '+CurrToStrF(ContasAVencer, ffCurrency, 2);
  Stb.Panels[2].Text := 'Vencendo hoje: '+CurrToStrF(ContasVencendoHoje, ffCurrency, 2);
end;

procedure TfrmContasPagar.ContaPaga(var Msg: TMessage);
begin
  ContaModificada;
end;

procedure TfrmContasPagar.GradeDblClick(Sender: TObject);
begin
  if sqldPadrao.IsEmpty then Exit;
  if not (sqldPadrao.State in dsEditModes) then
    sqldPadrao.Edit;
  if sqldPadrao.fieldByName('PAGAR').AsString = 'N' then
    sqldPadrao.fieldByName('PAGAR').AsString := 'S'
  else
    sqldPadrao.fieldByName('PAGAR').AsString := 'N';
  sqldPadrao.ApplyUpdates;
  sqldPadrao.Next;
end;

procedure TfrmContasPagar.miVencendohojeClick(Sender: TObject);
begin
  sqldPadrao.Close;
  sqldPadrao.SQL.Clear;
  sqldPadrao.SQL.Text :=SQLHoje;
  sqldPadrao.Params.ParamByName('PFORN').AsInteger := IdForn;
  sqldPadrao.Open;
end;

procedure TfrmContasPagar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F1 then
    ChamaHelp(Self, 48,'');
   if Key = VK_ESCAPE then
    Close;
end;

initialization
  RegisterClass(TfrmContasPagar);
finalization
  UnRegisterClass(TfrmContasPagar);
end.
