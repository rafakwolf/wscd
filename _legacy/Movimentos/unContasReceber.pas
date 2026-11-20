unit unContasReceber;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,   Grids, DBGrids, StdCtrls, Buttons, memds, DB,
  DBCtrls, SqlDb, Menus, ComCtrls, ConstPadrao,
  FMTBcd, unSimplePadrao, LCLType, ZDataset;

const
  SQLPadraoTela: string = 'select'+
                          ' cr.CODIGO,'+
                          ' cr.DATA,'+
                          ' cr.VENCIMENTO,'+
                          ' cr.CLIENTE,'+
                          ' cli.NOME NOMECLIENTE,'+
                          ' cr.DESCRICAO,'+
                          ' cr.DOCUMENTO,'+
                          ' cr.VALOR,'+
                          ' cr.JURO,'+
                          ' cr.RECEBER,'+
                          ' cr.RECDA,'+
                          ' cr.DATARECTO,'+
                          ' cr.ORIGEM,'+
                          ' cr.VENDA,'+
                          ' cr.CAPITALRECDO,'+
                          ' cr.JURORECDO,'+
                          ' cr.DESCTO,'+
                          ' cr.OBS,'+
                          ' cr.ATRASO,'+
                          ' cr.VALORJURO,'+
                          ' cr.TOTAL,'+
                          ' cr.TOTALRECDO '+
                          'from CONTASRECEBER cr '+
                          'left join CLIENTES cli on (cr.CLIENTE = cli.CODCLIENTE) '+
                          'where RECDA = '''+'N'+''' and CLIENTE = :PCLIENTE '+
                          'order by cr.VENCIMENTO desc';

  SQLVencidas: string =   'select'+
                          ' cr.CODIGO,'+
                          ' cr.DATA,'+
                          ' cr.VENCIMENTO,'+
                          ' cr.CLIENTE,'+
                          ' cli.NOME NOMECLIENTE,'+
                          ' cr.DESCRICAO,'+
                          ' cr.DOCUMENTO,'+
                          ' cr.VALOR,'+
                          ' cr.JURO,'+
                          ' cr.RECEBER,'+
                          ' cr.RECDA,'+
                          ' cr.DATARECTO,'+
                          ' cr.ORIGEM,'+
                          ' cr.VENDA,'+
                          ' cr.CAPITALRECDO,'+
                          ' cr.JURORECDO,'+
                          ' cr.DESCTO,'+
                          ' cr.OBS,'+
                          ' cr.ATRASO,'+
                          ' cr.VALORJURO,'+
                          ' cr.TOTAL,'+
                          ' cr.TOTALRECDO '+
                          'from CONTASRECEBER cr '+
                          'left join CLIENTES cli on (cr.CLIENTE = cli.CODCLIENTE) '+
                          'where RECDA = '''+'N'+''' and CLIENTE = :PCLIENTE '+
                          'and VENCIMENTO < CURRENT_DATE '+
                          'order by cr.VENCIMENTO desc';

  SQLHoje: string =       'select'+
                          ' cr.CODIGO,'+
                          ' cr.DATA,'+
                          ' cr.VENCIMENTO,'+
                          ' cr.CLIENTE,'+
                          ' cli.NOME NOMECLIENTE,'+
                          ' cr.DESCRICAO,'+
                          ' cr.DOCUMENTO,'+
                          ' cr.VALOR,'+
                          ' cr.JURO,'+
                          ' cr.RECEBER,'+
                          ' cr.RECDA,'+
                          ' cr.DATARECTO,'+
                          ' cr.ORIGEM,'+
                          ' cr.VENDA,'+
                          ' cr.CAPITALRECDO,'+
                          ' cr.JURORECDO,'+
                          ' cr.DESCTO,'+
                          ' cr.OBS,'+
                          ' cr.ATRASO,'+
                          ' cr.VALORJURO,'+
                          ' cr.TOTAL,'+
                          ' cr.TOTALRECDO '+
                          'from CONTASRECEBER cr '+
                          'left join CLIENTES cli on (cr.CLIENTE = cli.CODCLIENTE) '+
                          'where RECDA = '''+'N'+''' and CLIENTE = :PCLIENTE '+
                          'and VENCIMENTO = CURRENT_DATE '+
                          'order by cr.VENCIMENTO desc';

type

  { TfrmContasReceber }

  TfrmContasReceber = class(TfrmSimplePadrao)
    dsPadrao: TDataSource;
    mnuCP: TMainMenu;
    miOpcoes: TMenuItem;
    miReceber: TMenuItem;
    miExcluir: TMenuItem;
    N1: TMenuItem;
    miVencendoHoje: TMenuItem;
    miRecebidas: TMenuItem;
    miContasVencidas: TMenuItem;
    miTodasContas: TMenuItem;
    N3: TMenuItem;
    miBuscarCliente: TMenuItem;
    N5: TMenuItem;
    miFechar: TMenuItem;
    miRelatorios: TMenuItem;
    miRecibo: TMenuItem;
    sqldDeleta: TZQuery;
    Stb: TStatusBar;
    pnBotoes: TPanel;
    btnExcluir: TSpeedButton;
    btnRecebidas: TSpeedButton;
    btnReceber: TSpeedButton;
    btnFechar: TSpeedButton;
    grpCliente: TGroupBox;
    dbeCliente: TDBEdit;
    Grade: TDBGrid;
    sqldPadrao: TZQuery;
    sqldCliente: TZQuery;
    procedure btnExcluirClick(Sender: TObject);
    procedure btnReceberClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure miReciboClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnRecebidasClick(Sender: TObject);
    procedure miBuscarClienteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnfecharClick(Sender: TObject);
    procedure miContasVencidasClick(Sender: TObject);
    procedure miTodasContasClick(Sender: TObject);
    procedure dsPadraoStateChange(Sender: TObject);
    procedure GradeTitleClick(Column: TColumn);
    procedure GradeDblClick(Sender: TObject);
    procedure miVencendoHojeClick(Sender: TObject);
  private
    SQLPadraoCli: string;
    function ContasAVencer: Currency;
    function ContasVencidas: Currency;
    function ContasVencedoHoje: Currency;
  protected
    procedure ContaRecebida(var Msg: TMessage); message WM_CONTA_RECEBER_RECEBIDA;
  public
    TipoChamada: Integer;
    IdCliente: Integer;
    procedure ContaModificada;
  end;

var
  frmContasReceber : TfrmContasReceber;

implementation

uses Funcoes, unContasRecebidas, unModeloConsulta, VarGlobal, unRecibo;

{$R *.dfm}

procedure TfrmContasReceber.btnExcluirClick(Sender: TObject);
begin
  if sqldPadrao.IsEmpty then
    Exit;

  if MsgSN('Deseja realmente excluir este registro ?') then
  begin
    if sqldPadrao.FieldByName('RECDA').AsString = 'N' then
    begin
      sqldDeleta.Close;
      sqldDeleta.Params.ParamByName('ID').AsInteger := sqldPadrao.FieldByName('CODIGO').AsInteger;
      sqldDeleta.ExecSQL;
      ReabreDataset(sqldPadrao);
    end
    else
      MsgAviso('Não é permitido excluir uma conta já recebida.');
  end;
end;

procedure TfrmContasReceber.btnReceberClick(Sender: TObject);

  function ContasMarcadas: Integer;
  begin
    with TZQuery.Create(nil) do
    try
      Connection := GetZConnection;
      SQL.Clear; SQL.Text :='select count(1) as CONT from CONTASRECEBER'+
        ' where RECEBER = '+QuotedStr('S')+
        ' and RECDA = '+QuotedStr('N')+
        ' and CLIENTE = '+QuotedStr(IntToStr(IdCliente));
      Open;
      Result := FieldByName('CONT').AsInteger;
    finally
      Free;
    end;
  end;

begin
  if sqldPadrao.IsEmpty then Exit;

  //if ContasMarcadas > 1 then
 // begin
 //   MsgAviso('Marque apenas uma conta por vez para efetuar o recebimento.');
 //   Exit;
 // end;

 // if Locate(sqldPadrao, sqldPadraoRECEBER, 'S') then
//  begin
 //   frmReceberMan := TfrmReceberMan.Create(Self);
 //   frmReceberMan.Caption := 'Recebimento';
 //   frmReceberMan.ShowModal;
 //   if Assigned(frmReceberMan) then
 //     FreeAndNil(frmReceberMan);
 // end
 // else
  //  MsgAviso('N�o h� conta marcada para recebimento.'+#13#10+
  //    'Para marcar/desmarcar d� um duplo clique sobre a conta desejada.');
end;

procedure TfrmContasReceber.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmContasReceber.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) then
    Close;
  if Key = VK_F1 then
    ChamaHelp(Self, 49,'');
end;

procedure TfrmContasReceber.miReciboClick(Sender: TObject);
begin
  if MsgSN('Exportar esta conta para recibo?')then
  begin
    TfrmRecibo.AddAndPrint(
       sqldPadrao.FieldByName('VENCIMENTO').AsDateTime,
       sqldPadrao.FieldByName('TOTAL').AsFloat,
       Empresa.Nome,
       sqldPadrao.FieldByName('DESCRICAO').AsString
    );
  end;
end;

procedure TfrmContasReceber.FormCreate(Sender: TObject);
begin
  inherited;
  ClientHeight := 438;
  ClientWidth  := 762;
  CentralizaForm(Self);
  ReordenaBotoes([btnReceber, btnExcluir, btnRecebidas, btnFechar]);
  SQLPadraoCli := 'select * from CLIENTES';
end;

procedure TfrmContasReceber.btnRecebidasClick(Sender: TObject);
begin
  frmContasRecebidas := TfrmContasRecebidas.Create(Self);
  frmContasRecebidas.Caption := 'Contas recebidas';
  frmContasRecebidas.Cliente := IdCliente;
  frmContasRecebidas.ShowModal;
end;

procedure TfrmContasReceber.miBuscarClienteClick(Sender: TObject);
begin
  if TipoChamada = 0 then
  begin
    miBuscarCliente.Enabled := True;

    sqldCliente.Close;
    sqldCliente.SQL.Clear;
    sqldCliente.SQL.Text :=SQLPadraoCli;
    sqldCliente.Open;

    if TfrmModeloConsulta.Execute('Cliente', 'CLIENTES', FN_CLIENTES, DL_CLIENTES, self) > 0 then
    begin
      IdCliente := sqldCliente.fieldByname('CODCLIENTE').AsInteger;
      if (IdCliente > 0) then
      begin
        sqldPadrao.Close;
        sqldPadrao.Params.ParamByName('PCLIENTE').AsInteger := IdCliente;
        sqldPadrao.Open;
      end;
      if sqldPadrao.IsEmpty then
      begin
        MsgErro(UM_PESQUISAVAZIO, 'Contas a Receber');
        self.close;
      end;
    end;
  end
  else if TipoChamada = 1 then
  begin
    miBuscarCliente.Enabled := False;

    if (IdCliente > 0) then
    begin
      sqldPadrao.Close;
      sqldPadrao.Params.ParamByName('PCLIENTE').AsInteger := IdCliente;
      sqldPadrao.Open;
    end;
    if sqldPadrao.IsEmpty then
    begin
      MsgErro(UM_PESQUISAVAZIO, 'Contas a Receber');
      self.close;
    end;
  end;
end;

procedure TfrmContasReceber.FormShow(Sender: TObject);
begin
  miBuscarCliente.Click;
end;

procedure TfrmContasReceber.ContaModificada;
begin
  sqldPadrao.Close;
  sqldPadrao.Params.ParamByName('PCLIENTE').AsInteger := IdCliente;
  sqldPadrao.Open;
  dsPadrao.OnStateChange(dsPadrao);
end;

procedure TfrmContasReceber.btnfecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmContasReceber.miContasVencidasClick(Sender: TObject);
begin
  sqldPadrao.Close;
  sqldPadrao.SQL.Clear; sqldPadrao.SQL.Text :=SQLVencidas;
  sqldPadrao.Params.ParamByName('PCLIENTE').AsInteger := IdCliente;
  sqldPadrao.Open;
end;

procedure TfrmContasReceber.miTodasContasClick(Sender: TObject);
begin
  sqldPadrao.Close;
  sqldPadrao.SQL.Clear; sqldPadrao.SQL.Text :=SQLPadraoTela;
  sqldPadrao.Params.ParamByName('PCLIENTE').AsInteger := IdCliente;
  sqldPadrao.Open;
end;

function TfrmContasReceber.ContasAVencer: Currency;
begin
  with TZQuery.Create(nil) do
  try
    Connection := GetZConnection;
    sql.text :=
      'select sum(TOTAL) as SOMA from CONTASRECEBER where (VENCIMENTO > CURRENT_DATE) '+
      'and (RECDA = '''+'N'+''') and CLIENTE = :CLI';
    Params.ParamByName('CLI').AsInteger := IdCliente;
    Open;
    Result := FieldByName('SOMA').AsCurrency;
  finally
    Free;
  end;
end;

function TfrmContasReceber.ContasVencedoHoje: Currency;
begin
  with TZQuery.Create(nil) do
  try
    Connection := GetZConnection;
    sql.text :=
      'select sum(TOTAL) as SOMA from CONTASRECEBER where (VENCIMENTO = CURRENT_DATE) '+
      'and (RECDA = '''+'N'+''') and CLIENTE = :CLI';
    Params.ParamByName('CLI').AsInteger := IdCliente;
    Open;
    Result := FieldByName('SOMA').AsCurrency;
  finally
    Free;
  end;
end;

function TfrmContasReceber.ContasVencidas: Currency;
begin
  with TZQuery.Create(nil) do
  try
    Connection := GetZConnection;
    sql.text :=
      'select sum(TOTAL) as SOMA from CONTASRECEBER where (VENCIMENTO < CURRENT_DATE) '+
      'and (RECDA = '''+'N'+''') and CLIENTE = :CLI';
    Params.ParamByName('CLI').AsInteger := IdCliente;
    Open;
    Result := FieldByName('SOMA').AsCurrency;
  finally
    Free;
  end;
end;

procedure TfrmContasReceber.dsPadraoStateChange(Sender: TObject);
begin
  Stb.Panels[0].Text := 'Vencidas: '+CurrToStrF(ContasVencidas, ffCurrency, 2);
  Stb.Panels[1].Text := 'A vencer: '+CurrToStrF(ContasAVencer, ffCurrency, 2);
  Stb.Panels[2].Text := 'Vencendo hoje: '+CurrToStrF(ContasVencedoHoje, ffCurrency, 2);
end;

procedure TfrmContasReceber.ContaRecebida(var Msg: TMessage);
begin
  ContaModificada;
end;

procedure TfrmContasReceber.GradeTitleClick(Column: TColumn);
begin
  //OrdenaColunasGrid(Grade, Column, sqldPadrao);
end;

procedure TfrmContasReceber.GradeDblClick(Sender: TObject);
begin
  if sqldPadrao.IsEmpty then Exit;
  if not (sqldPadrao.State in dsEditModes) then
    sqldPadrao.Edit;
  if sqldPadrao.FieldByName('RECEBER').AsString = 'N' then
    sqldPadrao.FieldByName('RECEBER').AsString := 'S'
  else
    sqldPadrao.FieldByName('RECEBER').AsString := 'N';
  sqldPadrao.ApplyUpdates;
  sqldPadrao.Next;
end;

procedure TfrmContasReceber.miVencendoHojeClick(Sender: TObject);
begin
  sqldPadrao.Close;
  sqldPadrao.SQL.Clear; sqldPadrao.SQL.Text :=SQLHoje;
  sqldPadrao.Params.ParamByName('PCLIENTE').AsInteger := IdCliente;
  sqldPadrao.Open;
end;

initialization
  RegisterClass(TfrmContasReceber);
finalization
  UnRegisterClass(TfrmContasReceber);
end.

