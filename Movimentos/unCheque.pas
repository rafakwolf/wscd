unit unCheque;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons,   ComCtrls,
  memds,  SqlDb,  DBCtrls, ZSqlUpdate, ZDataset, DateUtils, FMTBcd;

type

  { TfrmCheque }

  TfrmCheque = class(TfrmPadrao)
    actBaixar: TAction;
    actEstornarBaixa: TAction;
    lbBaixado: TLabel;
    btnBaixar: TBitBtn;
    dbeDataBaixado: TDBEdit;
    dbeBandMagnetica: TDBEdit;
    dbeVenda: TDBEdit;
    dbeValor: TDBEdit;
    dbdBomPara: TDBEdit;
    dbeAgencia: TDBEdit;
    dbeConta: TDBEdit;
    dbeNumero: TDBEdit;
    dbdDataEmissao: TDBEdit;
    dbeCompra: TDBEdit;
    ZQuery1: TZQuery;
    ZUpdateSQL1: TZUpdateSQL;
    procedure actBaixarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure miChequeEmitidoAVistaClick(Sender: TObject);
    procedure miChequeEmitidoAPrazoClick(Sender: TObject);
    procedure miChequeEmitidoClick(Sender: TObject);
    procedure actEstornarBaixaExecute(Sender: TObject);
    procedure miChequeRecebidoAPrazoClick(Sender: TObject);
    procedure miChequeRecebidoAVistaClick(Sender: TObject);
    procedure actPrintPersonExecute(Sender: TObject);
    procedure miChequePendenteClick(Sender: TObject);
  private
    procedure BaixarCheque;
    function ChequeExiste(pBandaMagnetica: string): Boolean;
  public
    procedure AntesSalvar; override;
  end;

var
  frmCheque: TfrmCheque;

implementation

uses
   Funcoes,  ConstPadrao, unModeloConsulta, unPrevCheque,
   uConfiguraRelatorio, Extensos, VarGlobal, unBaixaCheque, unDmPrincipal;

{$R *.dfm}

procedure TfrmCheque.actBaixarExecute(Sender: TObject);
begin
  inherited;
  if not zQuery1.Fieldbyname('DATABAIXADO').IsNull then
  begin
    MsgAviso('Este cheque ja foi baixado.');
    Exit;
  end;

  if MsgSN('Deseja baixar este cheque?') then
  begin
    BaixarCheque;
  end;
end;

procedure TfrmCheque.FormCreate(Sender: TObject);
begin
  inherited;
  FieldNames        := FN_CHEQUE;
  DisplayLabels     := DL_CHEQUE;
  aCaption          := 'Cheques';
  lbBaixado.Caption := '';
end;

procedure TfrmCheque.actPrintExecute(Sender: TObject);
begin
  inherited;
  with TfrmPrevCheque.Create(Self) do
  try
    zQuery1.Filtered := False;
    zQuery1.Filter := 'REPASSADO = '+QuotedStr('N');
    zQuery1.Filtered := True;
    lbTitulo.Caption := 'Cheques recebidos';
    TextoSoma('Total de cheques recebidos');
    PrintIfNotEmptyRL(rrPadrao);
  finally
    Free;
  end;
end;

procedure TfrmCheque.miChequeEmitidoAVistaClick(Sender: TObject);
begin
  inherited;
  with TfrmPrevCheque.Create(Self) do
  try
    zQuery1.Filtered := False;
    zQuery1.Filter := '(DATAEMISSAO = BOMPARA) and (REPASSADO = '+QuotedStr('S')+')';
    zQuery1.Filtered := True;
    lbTitulo.Caption := 'Cheques emitidos a vista';
    TextoSoma('Total de emitidos a vista');
    PrintIfNotEmptyRL(rrPadrao);
  finally
    Free;
  end;
end;

procedure TfrmCheque.miChequeEmitidoAPrazoClick(Sender: TObject);
begin
  inherited;
  with TfrmPrevCheque.Create(Self) do
  try
    zQuery1.Filtered := False;
    zQuery1.Filter := '(DATAEMISSAO < BOMPARA) and (REPASSADO = '+QuotedStr('S')+')';
    zQuery1.Filtered := True;
    lbTitulo.Caption := 'Cheques pre-datados';
    TextoSoma('Total de emitidos a prazo');
    PrintIfNotEmptyRL(rrPadrao);
  finally
    Free;
  end;
end;

procedure TfrmCheque.miChequeEmitidoClick(Sender: TObject);
begin
  inherited;
  with TfrmPrevCheque.Create(Self) do
  try
    zQuery1.Filtered := False;
    zQuery1.Filter := 'REPASSADO = '+QuotedStr('S');
    zQuery1.Filtered := True;
    lbTitulo.Caption := 'Cheques emitidos';
    TextoSoma('Total de cheques emitidos');
    PrintIfNotEmptyRL(rrPadrao);
  finally
    Free;
  end;
end;

procedure TfrmCheque.actEstornarBaixaExecute(Sender: TObject);

  procedure EstornaCheque;
  begin
    with TZQuery.Create(nil) do
    try
      Connection := GetzConnection;
      SQL.Clear;
      SQL.Text :='delete from CAIXA where DOCUMENTO = '+
        QuotedStr(zQuery1.Fieldbyname('NUMERO').AsString);
      ExecSQL;
    finally
      Free;
    end;
  end;

begin
  inherited;
  if zQuery1.Fieldbyname('DATABAIXADO').IsNull then
  begin
    MsgAviso('Este cheque ainda nao foi baixado.');
    Exit;
  end;

  if MsgSN('Deseja estornar este cheque?') then
  begin
    EstornaCheque;
    zQuery1.Edit;
    zQuery1.Fieldbyname('DATABAIXADO').Clear;
    zQuery1.ApplyUpdates;
    MsgAviso('Cheque estornado!');
  end;
end;

procedure TfrmCheque.miChequeRecebidoAPrazoClick(Sender: TObject);
begin
  inherited;
  with TfrmPrevCheque.Create(Self) do
  try
    zQuery1.Filtered := False;
    zQuery1.Filter := '(DATAEMISSAO < BOMPARA) and (REPASSADO = '+QuotedStr('N')+')';
    zQuery1.Filtered := True;
    lbTitulo.Caption := 'Cheques pre-datados';
    PrintIfNotEmptyRL(rrPadrao);
  finally
    Free;
  end;
end;

procedure TfrmCheque.miChequeRecebidoAVistaClick(Sender: TObject);
begin
  inherited;
  with TfrmPrevCheque.Create(Self) do
  try
    zQuery1.Filtered := False;
    zQuery1.Filter := '(DATAEMISSAO = BOMPARA) and (REPASSADO = '+QuotedStr('N')+')';
    zQuery1.Filtered := True;
    lbTitulo.Caption := 'Cheques emitidos a vista';
    PrintIfNotEmptyRL(rrPadrao);
  finally
    Free;
  end;
end;

procedure TfrmCheque.actPrintPersonExecute(Sender: TObject);
begin
  with TfrmPrevCheque.Create(Self) do
  try
    zQuery1.Filtered := False;
    zQuery1.Filter := '(DATABAIXADO is not null)';
    zQuery1.Filtered := True;
    lbTitulo.Caption := 'Cheques baixados';
    TextoSoma('Total de cheques baixados');
    PrintIfNotEmptyRL(rrPadrao);
  finally
    Free;
  end;
end;

procedure TfrmCheque.miChequePendenteClick(Sender: TObject);
begin
  inherited;
  with TfrmPrevCheque.Create(Self) do
  try
    zQuery1.Filtered := False;
    zQuery1.Filter := '(DATABAIXADO is null)';
    zQuery1.Filtered := True;
    lbTitulo.Caption := 'Cheques pendentes';
    TextoSoma('Total de cheques pendentes');
    PrintIfNotEmptyRL(rrPadrao);
  finally
    Free;
  end;
end;

procedure TfrmCheque.BaixarCheque;
var
  vHistorico, vDataBaixa, vCredDeb: string;
  vContaCaixa: Integer;
begin
  vHistorico  := '';
  vDataBaixa  := '';
  vCredDeb    := '';
  vContaCaixa := -1;

  if zQuery1.Fieldbyname('BANDAMAGNETICA').AsString = '' then
  begin
    MsgCuidado('O Campo "Banda magnetica" e obrigatorio.');
    Exit;
  end;

  if not SameDate(zQuery1.Fieldbyname('DATAEMISSAO').AsDateTime, zQuery1.Fieldbyname('BOMPARA').AsDateTime) then
  begin

    if not TfrmBaixaCheque.Execute(vContaCaixa, vHistorico, vDataBaixa) then
    begin
      MsgCuidado('Baixa cancelada.');
      Exit;
    end;

      if zQuery1.Fieldbyname('REPASSADO').AsString = 'S' then
        vCredDeb := 'D'
      else if zQuery1.Fieldbyname('REPASSADO').AsString = 'N' then
        vCredDeb := 'C';

    if ((vHistorico = '') or (vDataBaixa = '') or (vCredDeb = '') or (vContaCaixa = -1)) then
    begin
      MsgErro('Valores para baixa incorretos, corrija e tente novamente.');
      Exit;
    end;

    with GetDataModule do
    begin
      EnviaCaixa(Date, vHistorico+' / Cheque Nro: '+zQuery1.Fieldbyname('NUMERO').AsString,
        zQuery1.Fieldbyname('NUMERO').AsString, vCredDeb,
        zQuery1.Fieldbyname('VALOR').AsFloat, vContaCaixa);
    end;

  end;

  if SameDate(zQuery1.Fieldbyname('DATAEMISSAO').AsDateTime,
     zQuery1.Fieldbyname('BOMPARA').AsDateTime) then
    ObterData(vDataBaixa);

  if vDataBaixa = '' then
  begin
    MsgCuidado('Informe a data para baixar o cheque.');
    Exit;
  end;

  zQuery1.Edit;
  zQuery1.Fieldbyname('DATABAIXADO').AsDateTime := StrToDate(vDataBaixa);
  zQuery1.ApplyUpdates;

  MsgAviso('Cheque baixado!');
end;

function TfrmCheque.ChequeExiste(pBandaMagnetica: string): Boolean;
begin
  with TZQuery.Create(nil) do
  try
    Connection := GetzConnection;
    SQL.Clear;
    SQL.Text :='select count(1) as CONT from CHEQUE '+
      'where BANDAMAGNETICA = '+QuotedStr(pBandaMagnetica);
    Open;
    Result := (FieldByName('CONT').AsInteger > 0);
  finally
    Free;
  end;
end;

procedure TfrmCheque.AntesSalvar;
begin
  inherited;
  if ModoInsert(zQuery1) then
    if ChequeExiste(zQuery1.Fieldbyname('BANDAMAGNETICA').AsString) then
    begin
      MsgCuidado('Este cheque ja esta cadastrado, verifique a digitacao '+
        'da banda magnetica e tente novamente.');
      Abort;
    end;

  if (zQuery1.Fieldbyname('DATAEMISSAO').AsDateTime > zQuery1.Fieldbyname('BOMPARA').AsDateTime) then
  begin
    MsgErro('A "Data de emissao" nao pode ser maior que a data de "Bom para".');
    Abort;
  end;
end;

initialization
  RegisterClass(TfrmCheque);
finalization
  UnRegisterClass(TfrmCheque);
end.

