unit unCliente;

interface

uses
   Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons,
  ExtCtrls, ComCtrls, SqlDb, DBCtrls, udmGeralBase,
   memds,  StrUtils,  ExtDlgs, FMTBcd;

type
  TfrmCliente = class(TfrmPadrao)
    sqldCidade: TSQLQuery;
    sqldCidadeCODCIDADE: TIntegerField;
    sqldCidadeDESCRICAO: TStringField;
    dspCidade: TComponent;
    cdsCidade: TMemDataSet;
    cdsCidadeCODCIDADE: TIntegerField;
    cdsCidadeDESCRICAO: TStringField;
    btnContas: TBitBtn;
    dbeFax: TDBEdit;
    dbeTelefoneComercial: TDBEdit;
    dbeRefComercial: TDBEdit;
    dbeRefPessoal: TDBEdit;
    dbeLocalTrabalho: TDBEdit;
    dbeSalario: TDBEdit;
    dbeInicioTrabalho: TDBEdit;
    dbeCargo: TDBEdit;
    dbeTrabalho: TDBEdit;
    dbeEmail: TDBEdit;
    dbeNaturalidade: TDBEdit;
    dbeDataCadastro: TDBEdit;
    dbeMae: TDBEdit;
    dbePai: TDBEdit;
    dbeConjuge: TDBEdit;
    dbeEnderecoAnterior: TDBEdit;
    dbeTempoMoradia: TDBEdit;
    dbeLimite: TDBEdit;
    dbeDataNasc: TDBEdit;
    dbeCpf: TDBEdit;
    dbeRg: TDBEdit;
    dbeTelefone: TDBEdit;
    dbeCep: TDBEdit;
    dbeBairro: TDBEdit;
    dbeEndereco: TDBEdit;
    dbeNome: TDBEdit;
    dbmObs: TDBEdit;
    procedure miRelClientesCidadeClick(Sender: TObject);
    procedure miRelClientesDataNascClick(Sender: TObject);
    procedure miRelAniversariantesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure dbeLimiteKeyPress(Sender: TObject; var Key: Char);
    procedure dbeSalarioKeyPress(Sender: TObject; var Key: Char);
    procedure miEtiquetaClienteClick(Sender: TObject);
    procedure btnContasClick(Sender: TObject);
  private
    SQLPadraoTela: string;
    procedure Foto(Visivel: Boolean);
  protected
    function GetDm: TdmGeralBase; override;
  public
    procedure AntesSalvar; override;
  end;

var
  frmCliente: TfrmCliente;

implementation

uses Funcoes, ConstPadrao, uConfiguraRelatorio,
     unPrevListagemClientes,  unContasReceber, udmCliente;

{$R *.dfm}

procedure TfrmCliente.miRelClientesCidadeClick(Sender: TObject);
begin
  inherited;
  ChamaForm('TfrmRelatorioClienteCidade', 'Clientes por cidade', Self);
end;

procedure TfrmCliente.miRelClientesDataNascClick(Sender: TObject);
begin
  inherited;
  ChamaForm('TfrmRelatorioClienteData', 'Clientes por data de nascimento', Self);
end;

procedure TfrmCliente.miRelAniversariantesClick(Sender: TObject);
begin
  inherited;
  ChamaForm('TfrmRelatorioAniversarioCliente', 'Clientes aniversariantes', Self);
end;

procedure TfrmCliente.FormCreate(Sender: TObject);
begin
  dsPadrao.DataSet := TdmCliente(GetDm).cdsPadrao;
  inherited;
  FieldNames := FN_CLIENTES;
  DisplayLabels := DL_CLIENTES;
  aCaption := 'Clientes';
end;

procedure TfrmCliente.actPrintExecute(Sender: TObject);
begin
  inherited;
  with TfrmPrevListagemClientes.Create(Self) do
  try
    cdsPadrao.Close;
    cdsPadrao.Open;

    TipoRelatorio := 0;
    PrintIfNotEmptyRL(rrPadrao);
  finally
    cdsPadrao.Close;
    Free;
  end;
end;

procedure TfrmCliente.dbeLimiteKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  NumericoKeyPress(sender, key);
end;

procedure TfrmCliente.dbeSalarioKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  NumericoKeyPress(sender, key);
end;

procedure TfrmCliente.miEtiquetaClienteClick(Sender: TObject);
begin
  inherited;
  ChamaForm('TfrmRelatorioEtiquetaCliente', 'Etiquetas de clientes', Self);
end;

procedure TfrmCliente.btnContasClick(Sender: TObject);
begin
  inherited;
//  frmContasReceber := TfrmContasReceber.Create(self);
//  frmContasReceber.Caption := 'Contas do cliente: '+cdsPadraoNOME.AsString;
//  frmContasReceber.TipoChamada := 1;
//  frmContasReceber.IdCliente := cdsPadraoCODCLIENTE.AsInteger;
//  frmContasReceber.ShowModal;
end;

procedure TfrmCliente.AntesSalvar;
var
  Repetido: Boolean;
begin
  inherited;
//  Repetido :=
//    TdmCliente(getDm).IsClienteRepetido(cdsPadraoCPF_CNPJ.AsString,
//      cdsPadraoRG_IE.AsString);
//
//  if (ModoInsert(cdsPadrao) and Repetido) then
//  begin
//    MsgAviso('Cliente com este CPF/CNPJ ou RG/IE j� est� cadastrado.');
//    Abort;
//  end;
//
//  if Idade(cdsPadraoDATA_NASC.AsDateTime) < Global.IdadeCliente then
//  begin
//    MsgCuidado('Cliente com idade menor que a permitida, n�o poder� ser cadastrado.');
//    Abort;
//  end;
end;

procedure TfrmCliente.Foto(Visivel: Boolean);
begin

end;

function TfrmCliente.GetDm: TdmGeralBase;
begin
  if not assigned(dmCliente) then
    dmCliente := TdmCliente.Create(self);

  Result := dmCliente;
end;

initialization
  RegisterClass(TfrmCliente);
finalization
  UnRegisterClass(TfrmCliente);

end.

