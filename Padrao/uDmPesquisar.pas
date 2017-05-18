unit uDmPesquisar;

interface

uses
  SysUtils, Classes, Provider, DB, SqlExpr, DBClient,
  FMTBcd;

type
  TDmPesquisar = class(TDataModule)
  private
  public
    function GetContaCaixa: Variant;
    function GetCliente: Variant;
    function GetFornecedor: Variant;
    function GetBanco: Variant;
  end;

var
  DmPesquisar: TDmPesquisar;

implementation

uses unModeloConsulta, ConstPadrao, Variants;

{$R *.dfm}

function TDmPesquisar.GetBanco: Variant;
begin
  Result := TfrmModeloConsulta.Execute('Banco','BANCO',FN_BANCO,DL_BANCO);
end;

function TDmPesquisar.GetCliente: Variant;
begin
  Result := TfrmModeloConsulta.Execute('Cliente','CLIENTES',FN_CLIENTES,DL_CLIENTES);
end;

function TDmPesquisar.GetContaCaixa: Variant;
begin
  Result := TfrmModeloConsulta.Execute('Conta Caixa','CAIXAS',FN_CAIXAS,DL_CAIXAS);
end;

function TDmPesquisar.GetFornecedor: Variant;
begin
  Result := TfrmModeloConsulta.Execute('Fornecedor','FORNECEDORES',FN_FORN,DL_FORN);
end;

end.
