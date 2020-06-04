unit unContasReceber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Mask, Buttons, DBClient, DB,
  DBCtrls, SqlExpr, Menus, ComCtrls, Provider, ConstPadrao,
  FMTBcd, unSimplePadrao, uniMainMenu, uniGUIBaseClasses, uniGUIClasses,
  uniButton, uniBitBtn, uniSpeedButton, uniStatusBar, uniPanel, uniEdit,
  uniDBEdit, uniGroupBox, uniBasicGrid, uniDBGrid;

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
  TfrmContasReceber = class(TfrmSimplePadrao)
    dsPadrao: TDataSource;
    sqldCliente: TSQLDataSet;
    dspCliente: TDataSetProvider;
    cdsCliente: TClientDataSet;
    sqldPadrao: TSQLDataSet;
    dspPadrao: TDataSetProvider;
    cdsPadrao: TClientDataSet;
    sqldDeleta: TSQLDataSet;
    cdsPadraoCODIGO: TIntegerField;
    cdsPadraoDATA: TDateField;
    cdsPadraoVENCIMENTO: TDateField;
    cdsPadraoCLIENTE: TIntegerField;
    cdsPadraoNOMECLIENTE: TStringField;
    cdsPadraoDESCRICAO: TStringField;
    cdsPadraoDOCUMENTO: TStringField;
    cdsPadraoVALOR: TFMTBCDField;
    cdsPadraoJURO: TFMTBCDField;
    cdsPadraoRECEBER: TStringField;
    cdsPadraoRECDA: TStringField;
    cdsPadraoDATARECTO: TDateField;
    cdsPadraoORIGEM: TIntegerField;
    cdsPadraoVENDA: TIntegerField;
    cdsPadraoCAPITALRECDO: TFMTBCDField;
    cdsPadraoJURORECDO: TFMTBCDField;
    cdsPadraoDESCTO: TFMTBCDField;
    cdsPadraoOBS: TMemoField;
    cdsPadraoATRASO: TIntegerField;
    sqldClienteCODCLIENTE: TIntegerField;
    sqldClienteNOME: TStringField;
    sqldClienteTELEFONE: TStringField;
    sqldClienteRG_IE: TStringField;
    sqldClienteCPF_CNPJ: TStringField;
    sqldClienteDATA_NASC: TDateField;
    sqldClienteLIMITE: TFMTBCDField;
    sqldClienteDESCRICAO: TStringField;
    cdsClienteCODCLIENTE: TIntegerField;
    cdsClienteNOME: TStringField;
    cdsClienteTELEFONE: TStringField;
    cdsClienteRG_IE: TStringField;
    cdsClienteCPF_CNPJ: TStringField;
    cdsClienteDATA_NASC: TDateField;
    cdsClienteLIMITE: TFMTBCDField;
    cdsClienteDESCRICAO: TStringField;
    sqldPadraoCODIGO: TIntegerField;
    sqldPadraoDATA: TDateField;
    sqldPadraoVENCIMENTO: TDateField;
    sqldPadraoCLIENTE: TIntegerField;
    sqldPadraoNOMECLIENTE: TStringField;
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
    sqldPadraoVALORJURO: TSingleField;
    sqldPadraoTOTAL: TSingleField;
    sqldPadraoTOTALRECDO: TSingleField;
    cdsPadraoVALORJURO: TSingleField;
    cdsPadraoTOTAL: TSingleField;
    cdsPadraoTOTALRECDO: TSingleField;
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
    Stb: TStatusBar;
    pnBotoes: TContainerPanel;
    btnExcluir: TSpeedButton;
    btnRecebidas: TSpeedButton;
    btnReceber: TSpeedButton;
    btnFechar: TSpeedButton;
    grpCliente: TGroupBox;
    dbeCliente: TDBEdit;
    Grade: TDBGrid;
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

uses Funcoes, unContasRecebidas, unModeloConsulta, VarGlobal, unRecibo, unReceberMan;

{$R *.dfm}

procedure TfrmContasReceber.btnExcluirClick(Sender: TObject);
begin
  if cdsPadrao.IsEmpty then
    Exit;

  if MsgSN('Deseja realmente excluir este registro ?') then
  begin
    if cdsPadraoRECDA.AsString = 'N' then
    begin
      sqldDeleta.Close;
      sqldDeleta.Params.ParamByName('CODIGO').AsInteger := cdsPadraoCODIGO.AsInteger;
      sqldDeleta.ExecSQL;
      ReabreDataset(cdsPadrao);
    end
    else
      MsgAviso('N�o � permitido excluir uma conta j� recebida.');
  end;
end;

procedure TfrmContasReceber.btnReceberClick(Sender: TObject);

  function ContasMarcadas: Integer;
  begin
    with TSQLDataSet.Create(nil) do
    try
      SQLConnection := GetConnection;
      CommandText := 'select count(1) as CONT from CONTASRECEBER'+
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
  if cdsPadrao.IsEmpty then Exit;

  //if ContasMarcadas > 1 then
 // begin
 //   MsgAviso('Marque apenas uma conta por vez para efetuar o recebimento.');
 //   Exit;
 // end;

 // if Locate(cdsPadrao, cdsPadraoRECEBER, 'S') then
//  begin
    frmReceberMan := TfrmReceberMan.Create(Self);
    frmReceberMan.Caption := 'Recebimento';
    frmReceberMan.ShowModal;
    if Assigned(frmReceberMan) then
      FreeAndNil(frmReceberMan);
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
    with TfrmRecibo.Create(Self) do
    try
      Caption := 'Recibos';
      cdsPadrao.Open;
      cdsPadrao.Insert;
      cdsPadraoDATA.AsDateTime    := self.cdsPadraoVENCIMENTO.AsDateTime;
      cdsPadraoVALOR.AsFloat      := self.cdsPadraoTOTAL.AsFloat;
      cdsPadraoRECEBEDOR.AsString := '';//Empresa.Nome;
      cdsPadraoREFERENTE.AsString := self.cdsPadraoDESCRICAO.AsString;
      imprime := True;
      ShowModal;
    finally
      Free;
    end;
  end;
end;

procedure TfrmContasReceber.FormCreate(Sender: TObject);
begin
  inherited;
  ClientHeight := 438;
  ClientWidth  := 762;
  CentralizaForm(Self);
  ReordenaBotoes([btnReceber, btnExcluir, btnRecebidas, btnFechar]);
  SQLPadraoCli := sqldCliente.CommandText;
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

    cdsCliente.Close;
    cdsCliente.CommandText := SQLPadraoCli;
    cdsCliente.Open;

//    if TfrmModeloConsulta.Execute('Cliente', cdsCliente, FN_CLIENTES, DL_CLIENTES) then
//    begin
//      IdCliente := cdsClienteCODCLIENTE.AsInteger;
//      if (IdCliente > 0) then
//      begin
//        cdsPadrao.Close;
//        cdsPadrao.Params.ParamByName('PCLIENTE').AsInteger := IdCliente;
//        cdsPadrao.Open;
//      end;
//      if cdsPadrao.IsEmpty then
//      begin
//        MsgErro(UM_PESQUISAVAZIO, 'Contas a Receber');
//        PostMessage(Handle, WM_CLOSE, 0, 0);
//      end;
//    end;
  end
  else if TipoChamada = 1 then
  begin
    miBuscarCliente.Enabled := False;
    if (IdCliente > 0) then
    begin
      cdsPadrao.Close;
      cdsPadrao.Params.ParamByName('PCLIENTE').AsInteger := IdCliente;
      cdsPadrao.Open;
    end;
    if cdsPadrao.IsEmpty then
    begin
      MsgErro(UM_PESQUISAVAZIO, 'Contas a Receber');
      PostMessage(Handle, WM_CLOSE, 0, 0);
    end;
  end;
end;

procedure TfrmContasReceber.FormShow(Sender: TObject);
begin
  miBuscarCliente.Click;
end;

procedure TfrmContasReceber.ContaModificada;
begin
  cdsPadrao.Close;
  cdsPadrao.Params.ParamByName('PCLIENTE').AsInteger := IdCliente;
  cdsPadrao.Open;
  dsPadrao.OnStateChange(dsPadrao);
end;

procedure TfrmContasReceber.btnfecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmContasReceber.miContasVencidasClick(Sender: TObject);
begin
  cdsPadrao.Close;
  cdsPadrao.CommandText := SQLVencidas;
  cdsPadrao.Params.ParamByName('PCLIENTE').AsInteger := IdCliente;
  cdsPadrao.Open;
end;

procedure TfrmContasReceber.miTodasContasClick(Sender: TObject);
begin
  cdsPadrao.Close;
  cdsPadrao.CommandText := SQLPadraoTela;
  cdsPadrao.Params.ParamByName('PCLIENTE').AsInteger := IdCliente;
  cdsPadrao.Open;
end;

function TfrmContasReceber.ContasAVencer: Currency;
begin
  with TSQLDataSet.Create(nil) do
  try
    SQLConnection := GetConnection;
    CommandText :=
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
  with TSQLDataSet.Create(nil) do
  try
    SQLConnection := GetConnection;
    CommandText :=
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
  with TSQLDataSet.Create(nil) do
  try
    SQLConnection := GetConnection;
    CommandText :=
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
  //OrdenaColunasGrid(Grade, Column, cdsPadrao);
end;

procedure TfrmContasReceber.GradeDblClick(Sender: TObject);
begin
  if cdsPadrao.IsEmpty then Exit;
  if not (cdsPadrao.State in dsEditModes) then
    cdsPadrao.Edit;
  if cdsPadraoRECEBER.AsString = 'N' then
    cdsPadraoRECEBER.AsString := 'S'
  else
    cdsPadraoRECEBER.AsString := 'N';
  cdsPadrao.ApplyUpdates(0);
  cdsPadrao.Next;
end;

procedure TfrmContasReceber.miVencendoHojeClick(Sender: TObject);
begin
  cdsPadrao.Close;
  cdsPadrao.CommandText := SQLHoje;
  cdsPadrao.Params.ParamByName('PCLIENTE').AsInteger := IdCliente;
  cdsPadrao.Open;
end;

initialization
  RegisterClass(TfrmContasReceber);
finalization
  UnRegisterClass(TfrmContasReceber);
end.

