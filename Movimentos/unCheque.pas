unit unCheque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons, ExtCtrls, ComCtrls,
  DBClient, Provider, SqlExpr, Mask, DBCtrls, 
   DateUtils, FMTBcd, System.Actions;

type
  TfrmCheque = class(TfrmPadrao)
    sqldPadrao: TSQLDataSet;
    dspPadrao: TDataSetProvider;
    cdsPadrao: TClientDataSet;
    dbeBanco: TDBEdit;
    dbeAgencia: TDBEdit;
    dbeConta: TDBEdit;
    dbeNumero: TDBEdit;
    actBaixar: TAction;
    N6: TMenuItem;
    miRepasse: TMenuItem;
    dbdDataEmissao: TDBEdit;
    dbdBomPara: TDBEdit;
    dbeValor: TDBEdit;
    dbeVenda: TDBEdit;
    dbeCliente: TDBEdit;
    dbeCompra: TDBEdit;
    miChequeEmitido: TMenuItem;
    miChequeEmitidoAVista: TMenuItem;
    miChequeEmitidoAPrazo: TMenuItem;
    dbeBandMagnetica: TDBEdit;
    sqldPadraoIDCHEQUE: TIntegerField;
    sqldPadraoIDBANCO: TIntegerField;
    sqldPadraoBANCO: TStringField;
    sqldPadraoAGENCIA: TStringField;
    sqldPadraoCONTA: TStringField;
    sqldPadraoNUMERO: TStringField;
    sqldPadraoDATAEMISSAO: TDateField;
    sqldPadraoBOMPARA: TDateField;
    sqldPadraoIDCLIENTE: TIntegerField;
    sqldPadraoCLIENTE: TStringField;
    sqldPadraoIDFORN: TIntegerField;
    sqldPadraoFORN: TStringField;
    sqldPadraoVENDA: TIntegerField;
    sqldPadraoCOMPRA: TIntegerField;
    sqldPadraoREPASSADO: TStringField;
    sqldPadraoBANDAMAGNETICA: TStringField;
    cdsPadraoIDCHEQUE: TIntegerField;
    cdsPadraoIDBANCO: TIntegerField;
    cdsPadraoBANCO: TStringField;
    cdsPadraoAGENCIA: TStringField;
    cdsPadraoCONTA: TStringField;
    cdsPadraoNUMERO: TStringField;
    cdsPadraoDATAEMISSAO: TDateField;
    cdsPadraoBOMPARA: TDateField;
    cdsPadraoIDCLIENTE: TIntegerField;
    cdsPadraoCLIENTE: TStringField;
    cdsPadraoIDFORN: TIntegerField;
    cdsPadraoFORN: TStringField;
    cdsPadraoVENDA: TIntegerField;
    cdsPadraoCOMPRA: TIntegerField;
    cdsPadraoREPASSADO: TStringField;
    cdsPadraoBANDAMAGNETICA: TStringField;
    dbeForn: TDBEdit;
    sqldPadraoDATABAIXADO: TDateField;
    cdsPadraoDATABAIXADO: TDateField;
    dbeDataBaixado: TDBEdit;
    actEstornarBaixa: TAction;
    Estornarbaixa1: TMenuItem;
    btnBaixar: TBitBtn;
    N7: TMenuItem;
    N5: TMenuItem;
    lbBaixado: TLabel;
    miChequePendente: TMenuItem;
    imgCheque: TImage;
    lbBanco: TLabel;
    lbConta: TLabel;
    lbAgencia: TLabel;
    lbNroCheque: TLabel;
    lbValor: TLabel;
    lbComp: TLabel;
    lbValorExtenso: TLabel;
    lbNominal: TLabel;
    lbCidade: TLabel;
    lbDia: TLabel;
    lbMes: TLabel;
    lbAno: TLabel;
    lbCpfCnpj: TLabel;
    lbBomPara: TLabel;
    lbBandaMagnetica: TLabel;
    bvlLinha: TBevel;
    N9: TMenuItem;
    miAssistente: TMenuItem;
    sqldPadraoVALOR: TFMTBCDField;
    cdsPadraoVALOR: TFMTBCDField;
    procedure dbeBancoClickButton(Sender: TObject);
    procedure actBaixarExecute(Sender: TObject);
    procedure cdsPadraoAfterInsert(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure cdsPadraoIDBANCOValidate(Sender: TField);
    procedure actPrintExecute(Sender: TObject);
    procedure miChequeEmitidoAVistaClick(Sender: TObject);
    procedure miChequeEmitidoAPrazoClick(Sender: TObject);
    procedure miChequeEmitidoClick(Sender: TObject);
    procedure cdsPadraoBANDAMAGNETICAChange(Sender: TField);
    procedure dbeClienteClickButton(Sender: TObject);
    procedure cdsPadraoREPASSADOSetText(Sender: TField;
      const Text: String);
    procedure cdsPadraoREPASSADOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cdsPadraoIDCLIENTEValidate(Sender: TField);
    procedure cdsPadraoIDFORNValidate(Sender: TField);
    procedure dbeFornClickButton(Sender: TObject);
    procedure actEstornarBaixaExecute(Sender: TObject);
    procedure miChequeRecebidoAPrazoClick(Sender: TObject);
    procedure miChequeRecebidoAVistaClick(Sender: TObject);
    procedure actPrintPersonExecute(Sender: TObject);
    procedure cdsPadraoAfterScroll(DataSet: TDataSet);
    procedure miChequePendenteClick(Sender: TObject);
    procedure dsPadraoStateChange(Sender: TObject);
    procedure miAssistenteClick(Sender: TObject);
  private
    procedure AtualizaDadosCheque;
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
   uConfiguraRelatorio, Extensos, VarGlobal, unBaixaCheque,
   unGeraRelatorio;

{$R *.dfm}

procedure TfrmCheque.dbeBancoClickButton(Sender: TObject);
begin
  inherited;
  if ModoInsertEdit(cdsPadrao) then
  begin
    //if TfrmModeloConsulta.Execute('Bancos', GetDmPesquisar.cdsPesqBanco, FN_BANCO, DL_BANCO) then
    //begin
    //  cdsPadraoIDBANCO.AsInteger := GetDmPesquisar.cdsPesqBancoIDBANCO.AsInteger;
    //end;
  end;
end;

procedure TfrmCheque.actBaixarExecute(Sender: TObject);
begin
  inherited;
  if not cdsPadraoDATABAIXADO.IsNull then
  begin
    MsgAviso('Este cheque já foi baixado.');
    Exit;
  end;

  if MsgSN('Deseja baixar este cheque?') then
  begin
    BaixarCheque;
    cdsPadraoAfterScroll(cdsPadrao);
  end;
end;

procedure TfrmCheque.cdsPadraoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  //Incrementa('CHEQUE', cdsPadraoIDCHEQUE, GetConnection);
  cdsPadraoDATAEMISSAO.AsDateTime := Date;
//  SetFocusIfCan(dbcbbTipoCheque);
end;

procedure TfrmCheque.FormCreate(Sender: TObject);
begin
  inherited;
  FieldNames        := FN_CHEQUE;
  DisplayLabels     := DL_CHEQUE;
  aCaption          := 'Cheques';
  lbBaixado.Caption := '';
end;

procedure TfrmCheque.cdsPadraoIDBANCOValidate(Sender: TField);
var
  NomeBanco: string;
begin
  inherited;
  //NomeBanco := GetFieldByID(GetConnection, 'BANCO', 'BANCO', 'IDBANCO',
  //  Sender.AsInteger);
  if NomeBanco <> '' then
    cdsPadraoBANCO.AsString := NomeBanco;
end;

procedure TfrmCheque.actPrintExecute(Sender: TObject);
begin
  inherited;
  with TfrmPrevCheque.Create(Self) do
  try
    cdsPadrao.Filtered := False;
    cdsPadrao.Filter := 'REPASSADO = '+QuotedStr('N');
    cdsPadrao.Filtered := True;
    //lbTitulo.Caption := 'Cheques recebidos';
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
    cdsPadrao.Filtered := False;
    cdsPadrao.Filter := '(DATAEMISSAO = BOMPARA) and (REPASSADO = '+QuotedStr('S')+')';
    cdsPadrao.Filtered := True;
    //lbTitulo.Caption := 'Cheques emitidos a vista';
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
    cdsPadrao.Filtered := False;
    cdsPadrao.Filter := '(DATAEMISSAO < BOMPARA) and (REPASSADO = '+QuotedStr('S')+')';
    cdsPadrao.Filtered := True;
    //lbTitulo.Caption := 'Cheques pré-datados';
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
    cdsPadrao.Filtered := False;
    cdsPadrao.Filter := 'REPASSADO = '+QuotedStr('S');
    cdsPadrao.Filtered := True;
    //lbTitulo.Caption := 'Cheques emitidos';
    TextoSoma('Total de cheques emitidos');
    PrintIfNotEmptyRL(rrPadrao);
  finally
    Free;
  end;
end;

procedure TfrmCheque.cdsPadraoBANDAMAGNETICAChange(Sender: TField);
var
  varAgencia, varConta, varNroCheque, varBanco, varComp: string;
  BancoExiste: Boolean;
begin
  inherited;

  if ChequeExiste(Sender.AsString) then
  begin
    MsgCuidado('Cheque já existente.');
    Sender.Clear;
    Sender.FocusControl;
    Exit;
  end;

//  if not ValidaCMC7(Sender.AsString) then
//  begin
//    MsgErro('Banda magnética inválida.');
//    Sender.FocusControl;
//    Exit;
//  end;

  //341378140090004285081430432989 -> exemplo de banda válida

  if Sender.AsString <> '' then
  begin
    //RetornoBandaMagnetica(varComp, varBanco, varAgencia, varConta, varNroCheque,
    //  Sender.AsString);
    cdsPadraoAGENCIA.AsString := varAgencia;
    cdsPadraoCONTA.AsString   := varConta;
    cdsPadraoNUMERO.AsString  := varNroCheque;
    cdsPadraoIDBANCO.AsInteger := StrToInt(varBanco);

    //BancoExiste := SelectSingleField('select count(1) from BANCO where IDBANCO = '+
    //                 QuotedStr(varBanco), GetConnection]) > 0;
    if not BancoExiste then
    begin
      if MsgSN('O Banco "'+varBanco+'" não está cadastrado, deseja cadastrá-lo agora?') then
        ChamaForm('TfrmBanco', 'Bancos', Self);
    end
    else
      cdsPadraoIDBANCO.AsInteger := StrToInt(varBanco);

    AtualizaDadosCheque;
  end;
end;

procedure TfrmCheque.dbeClienteClickButton(Sender: TObject);
begin
  inherited;
  if ModoInsertEdit(cdsPadrao) then
  begin

    cdsPadraoIDFORN.Clear;
    cdsPadraoFORN.Clear;

    //if TfrmModeloConsulta.Execute('Cliente', GetDmPesquisar.cdsPesqCliente, FN_CLIENTES, DL_CLIENTES) then
    //  cdsPadraoIDCLIENTE.AsInteger := GetDmPesquisar.cdsPesqCliente.FieldByName('CODCLIENTE').AsInteger;
  end;
end;

procedure TfrmCheque.cdsPadraoREPASSADOSetText(Sender: TField;
  const Text: String);
begin
  inherited;
  if Trim(Text) = 'Emitido' then
    Sender.AsString := 'S'
  else if Trim(Text) = 'Recebido' then
    Sender.AsString := 'N';
end;

procedure TfrmCheque.cdsPadraoREPASSADOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
  if Trim(Sender.AsString) = 'S' then
    Text := 'Emitido'
  else if Trim(Sender.AsString) = 'N' then
    Text := 'Recebido';
end;

procedure TfrmCheque.cdsPadraoIDCLIENTEValidate(Sender: TField);
var
  NomeCliente: string;
begin
  inherited;
  //NomeCliente := GetFieldByID(GetConnection, 'CLIENTES', 'NOME', 'CODCLIENTE',
  //  Sender.AsInteger);
  if NomeCliente <> '' then
    cdsPadraoCLIENTE.AsString := NomeCliente;
end;

procedure TfrmCheque.cdsPadraoIDFORNValidate(Sender: TField);
var
  NomeForn: string;
begin
  inherited;
  //NomeForn := GetFieldByID(GetConnection, 'FORNECEDORES', 'RAZAOSOCIAL', 'CODFORNECEDOR',
  //  Sender.AsInteger);
  if NomeForn <> '' then
    cdsPadraoFORN.AsString := NomeForn;
end;

procedure TfrmCheque.dbeFornClickButton(Sender: TObject);
begin
  inherited;
  if ModoInsertEdit(cdsPadrao) then
  begin

    cdsPadraoIDCLIENTE.Clear;
    cdsPadraoCLIENTE.Clear;

    //if TfrmModeloConsulta.Execute('Fornecedor', GetDmPesquisar.cdsPesqForn, FN_FORN, DL_FORN) then
    //  cdsPadraoIDFORN.AsInteger := GetDmPesquisar.cdsPesqForn.FieldByName('CODFORNECEDOR').AsInteger;
  end;
end;

procedure TfrmCheque.actEstornarBaixaExecute(Sender: TObject);

  procedure EstornaCheque;
  begin
    with TSQLDataSet.Create(nil) do
    try
      //SQLConnection := GetConnection;
      CommandText := 'delete from CAIXA where DOCUMENTO = '+
        QuotedStr(cdsPadraoNUMERO.AsString);
      ExecSQL;
    finally
      Free;
    end;
  end;

begin
  inherited;
  if cdsPadraoDATABAIXADO.IsNull then
  begin
    MsgAviso('Este cheque ainda não foi baixado.');
    Exit;
  end;

  if MsgSN('Deseja estornar este cheque?') then
  begin
    EstornaCheque;
    cdsPadrao.Edit;
    cdsPadraoDATABAIXADO.Clear;
    cdsPadrao.ApplyUpdates(0);
    cdsPadraoAfterScroll(cdsPadrao);
    MsgAviso('Cheque estornado!');
  end;
end;

procedure TfrmCheque.miChequeRecebidoAPrazoClick(Sender: TObject);
begin
  inherited;
  with TfrmPrevCheque.Create(Self) do
  try
    cdsPadrao.Filtered := False;
    cdsPadrao.Filter := '(DATAEMISSAO < BOMPARA) and (REPASSADO = '+QuotedStr('N')+')';
    cdsPadrao.Filtered := True;
    //lbTitulo.Caption := 'Cheques pré-datados';
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
    cdsPadrao.Filtered := False;
    cdsPadrao.Filter := '(DATAEMISSAO = BOMPARA) and (REPASSADO = '+QuotedStr('N')+')';
    cdsPadrao.Filtered := True;
    //lbTitulo.Caption := 'Cheques emitidos a vista';
    PrintIfNotEmptyRL(rrPadrao);
  finally
    Free;
  end;
end;

procedure TfrmCheque.actPrintPersonExecute(Sender: TObject);
begin
  with TfrmPrevCheque.Create(Self) do
  try
    cdsPadrao.Filtered := False;
    cdsPadrao.Filter := '(DATABAIXADO is not null)';
    cdsPadrao.Filtered := True;
    //lbTitulo.Caption := 'Cheques baixados';
    TextoSoma('Total de cheques baixados');
    PrintIfNotEmptyRL(rrPadrao);
  finally
    Free;
  end;
end;

procedure TfrmCheque.cdsPadraoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  lbBaixado.Caption := '';

  if not DataSet.FieldByName('DATABAIXADO').IsNull then
    lbBaixado.Caption := 'Baixado'
  else
    lbBaixado.Caption := 'Pendente';

  AtualizaDadosCheque;
end;

procedure TfrmCheque.miChequePendenteClick(Sender: TObject);
begin
  inherited;
  with TfrmPrevCheque.Create(Self) do
  try
    cdsPadrao.Filtered := False;
    cdsPadrao.Filter := '(DATABAIXADO is null)';
    cdsPadrao.Filtered := True;
    //lbTitulo.Caption := 'Cheques pendentes';
    TextoSoma('Total de cheques pendentes');
    PrintIfNotEmptyRL(rrPadrao);
  finally
    Free;
  end;
end;

procedure TfrmCheque.AtualizaDadosCheque;
var
  varAgencia, varConta, varNroCheque, varBanco, varComp: string;
begin
  //RetornoBandaMagnetica(varComp, varBanco, varAgencia, varConta, varNroCheque,
  //  cdsPadraoBANDAMAGNETICA.AsString);

  lbComp.Caption         := varComp;
  lbBanco.Caption        := varBanco;
  lbAgencia.Caption      := varAgencia;
  lbConta.Caption        := varConta;
  lbNroCheque.Caption    := varNroCheque;
  lbValor.Caption        := FormatFloat('#,##0.00', cdsPadraoVALOR.AsFloat);

  lbValorExtenso.Caption :=
    ReplicateStr(' ', 22)+FirstUpper(Extenso(cdsPadraoVALOR.AsFloat));

  { se não tem cliente então mostra os dados do fornecedor, pois mesmo um cheque emitido
    pode ter sido emitido para um cliente e vice versa }
  if cdsPadraoIDCLIENTE.IsNull then
  begin
    lbNominal.Caption := cdsPadraoFORN.AsString;
    //lbCpfCnpj.Caption := SelectSingleField('select CNPJ from FORNECEDORES '+
    //  'where CODFORNECEDOR = '+QuotedStr(IntToStr(cdsPadraoIDFORN.AsInteger)),
    //  GetConnection);
  end
  else
  begin
    lbNominal.Caption := Empresa.Nome;
    //lbCpfCnpj.Caption := SelectSingleField('select CPF_CNPJ from CLIENTES '+
    //  'where CODCLIENTE = '+QuotedStr(IntToStr(cdsPadraoIDCLIENTE.AsInteger)),
    //  GetConnection);
  end;

  lbCidade.Caption         := Empresa.Cidade;
  lbDia.Caption            := IntToStr(DayOf(cdsPadraoDATAEMISSAO.AsDateTime));
  lbMes.Caption            := NomeMes(cdsPadraoDATAEMISSAO.AsDateTime);
  lbAno.Caption            := IntToStr(YearOf(cdsPadraoDATAEMISSAO.AsDateTime));
  lbBomPara.Caption        := FormatDateTime('dd/mm/yyyy', cdsPadraoBOMPARA.AsDateTime);
  lbBandaMagnetica.Caption := cdsPadraoBANDAMAGNETICA.AsString;
end;

procedure TfrmCheque.dsPadraoStateChange(Sender: TObject);
begin
  AtualizaDadosCheque;
  inherited;
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

  if cdsPadraoBANDAMAGNETICA.AsString = '' then
  begin
    MsgCuidado('O Campo "Banda magnética" é obrigatório.');
    Exit;
  end;

  if not SameDate(cdsPadraoDATAEMISSAO.AsDateTime, cdsPadraoBOMPARA.AsDateTime) then
  begin

    if not TfrmBaixaCheque.Execute(vContaCaixa, vHistorico, vDataBaixa) then
    begin
      MsgCuidado('Baixa cancelada.');
      Exit;
    end;

      { cheque repassado é débito, e cheque recebido e crédito }
      if cdsPadraoREPASSADO.AsString = 'S' then
        vCredDeb := 'D'
      else if cdsPadraoREPASSADO.AsString = 'N' then
        vCredDeb := 'C';

    if ((vHistorico = '') or (vDataBaixa = '') or (vCredDeb = '') or (vContaCaixa = -1)) then
    begin
      MsgErro('Valores para baixa incorretos, corrija e tente novamente.');
      Exit;
    end;

    //with GetDataModule do
    //begin
      //EnviaCaixa(Date, vHistorico+' / Cheque Nro: '+cdsPadraoNUMERO.AsString,
      //  cdsPadraoNUMERO.AsString, vCredDeb, cdsPadraoVALOR.AsFloat, vContaCaixa);
    //end;

  end;

  { se as datas forem iguais então é um cheque a vista, e ele já foi lançado em caixa }
  if SameDate(cdsPadraoDATAEMISSAO.AsDateTime, cdsPadraoBOMPARA.AsDateTime) then
    ObterData(vDataBaixa);

  if vDataBaixa = '' then
  begin
    MsgCuidado('Informe a data para baixar o cheque.');
    Exit;
  end;

  cdsPadrao.Edit;
  cdsPadraoDATABAIXADO.AsDateTime := StrToDate(vDataBaixa);
  cdsPadrao.ApplyUpdates(0);

  MsgAviso('Cheque baixado!');
end;

function TfrmCheque.ChequeExiste(pBandaMagnetica: string): Boolean;
begin
  with TSQLDataSet.Create(nil) do
  try
    //SQLConnection := GetConnection;
    CommandText := 'select count(1) as CONT from CHEQUE '+
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
  if ModoInsert(cdsPadrao) then
    if ChequeExiste(cdsPadraoBANDAMAGNETICA.AsString) then
    begin
      MsgCuidado('Este cheque já está cadastrado, verifique a digitação '+
        'da banda magnética e tente novamente.');
      Abort;
    end;

//  if not ValidaDataIniFim(cdsPadraoDATAEMISSAO.AsDateTime, cdsPadraoBOMPARA.AsDateTime,
//    dbdDataEmissao, False, True, 'A "Data de emissão" não pode ser maior que a data de "Bom para".', True) then
//    Abort;
end;

procedure TfrmCheque.miAssistenteClick(Sender: TObject);
begin
  inherited;
  //TfrmGeraRelatorio.Execute('Cheques', 'CHEQUE', GetConnection);
end;

initialization
  RegisterClass(TfrmCheque);
finalization
  UnRegisterClass(TfrmCheque);
end.

