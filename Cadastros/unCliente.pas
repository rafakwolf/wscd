unit unCliente;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons,
  ComCtrls,   SqlDb, DBCtrls, udmGeralBase,
   memds,  StrUtils,  ExtDlgs, FMTBcd, LCLType, ZDataset;

type

  { TfrmCliente }

  TfrmCliente = class(TfrmPadrao)
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
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    sqldClientes: TZQuery;
    procedure MenuItem1Click(Sender: TObject);
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

      function IsClienteRepetido(cpf_cnpj, rg_ie: string): boolean;
    function GetUltimaCompraCliente(idCliente: Integer): string;
  public
    procedure AntesSalvar; override;
  end;

var
  frmCliente: TfrmCliente;

implementation

uses Funcoes, ConstPadrao, uConfiguraRelatorio, VarGlobal,
     unPrevListagemClientes,  unContasReceber;

{$R *.dfm}

procedure TfrmCliente.miRelClientesCidadeClick(Sender: TObject);
begin
  inherited;
  ChamaForm('TfrmRelatorioClienteCidade', 'Clientes por cidade', Self);
end;

procedure TfrmCliente.MenuItem1Click(Sender: TObject);
begin

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
    sqldPadrao.Close;
    sqldPadrao.Open;

    TipoRelatorio := 0;
    PrintIfNotEmptyRL(rrPadrao);
  finally
    sqldPadrao.Close;
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
  frmContasReceber := TfrmContasReceber.Create(self);
  frmContasReceber.Caption := 'Contas do cliente: '+ sqldClientes.FieldByName('NOME').AsString;
  frmContasReceber.TipoChamada := 1;
  frmContasReceber.IdCliente := sqldClientes.FieldByName('CODCLIENTE').AsInteger;
  frmContasReceber.ShowModal;
end;

procedure TfrmCliente.AntesSalvar;
var
  Repetido: Boolean;
begin
  inherited;
  Repetido :=
    IsClienteRepetido(sqldClientes.FieldByName('CPF_CNPJ').AsString,
      sqldClientes.FieldByName('RG_IE').AsString);

  if (ModoInsert(sqldClientes) and Repetido) then
  begin
    MsgAviso('Cliente com este CPF/CNPJ ou RG/IE ja esta cadastrado.');
    Abort;
  end;
end;

procedure TfrmCliente.Foto(Visivel: Boolean);
begin

end;

function TfrmCliente.IsClienteRepetido(cpf_cnpj, rg_ie: string): boolean;
begin
   with TZQuery.Create(nil) do
    try
      Connection := sqldClientes.Connection;
      SQL.Clear;
      SQL.add('select count(1) from CLIENTES where CPF_CNPJ = ' +
        QuotedStr(cpf_cnpj) + ' or RG_IE = ' + QuotedStr(rg_ie));
      Open;
      Result := Fields[0].AsInteger > 0;
    finally
      Free;
    end;
end;

function TfrmCliente.GetUltimaCompraCliente(idCliente: Integer): string;
begin
   with TZQuery.Create(nil) do
    try
      Connection := sqldClientes.Connection;
      SQL.Clear;
      SQL.Add('select DATA, TOTAL from VENDA where CODCLIENTE = ' +
        QuotedStr(IntToStr(idCliente)));
      Open;
      if not IsEmpty then
        Result := 'Data: ' + FormatDateTime('dd/mm/yyyy',
          FieldByName('DATA').AsDateTime) + ' - ' + 'Total: ' +
          FormatFloat('#,##0.00', FieldByName('TOTAL').AsFloat)
      else
        Result := 'Nao existem compras deste cliente.';
    finally
      Free;
    end;
end;


initialization
  RegisterClass(TfrmCliente);
finalization
  UnRegisterClass(TfrmCliente);

end.

