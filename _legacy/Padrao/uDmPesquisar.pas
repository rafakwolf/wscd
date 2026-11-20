unit uDmPesquisar;

interface

uses
  SysUtils, Classes, DB, sqldb,
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

uses unModeloConsulta, ConstPadrao, Variants, daemonapp;

{$R *.dfm}

function TDmPesquisar.GetBanco: Variant;
begin
  Result := TfrmModeloConsulta.Execute('Banco','BANCO',FN_BANCO,DL_BANCO, Application);
end;

function TDmPesquisar.GetCliente: Variant;
begin
  Result := TfrmModeloConsulta.Execute('Cliente','CLIENTES',FN_CLIENTES,DL_CLIENTES, Application);
end;

function TDmPesquisar.GetContaCaixa: Variant;
begin
  Result := TfrmModeloConsulta.Execute('Conta Caixa','CAIXAS',FN_CAIXAS,DL_CAIXAS, Application);
end;

function TDmPesquisar.GetFornecedor: Variant;
begin
  Result := TfrmModeloConsulta.Execute('Fornecedor','FORNECEDORES',FN_FORN,DL_FORN, Application);
end;

end.
