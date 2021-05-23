unit uDmPesquisar;

interface

uses
  SysUtils, Classes, Provider, DB, SqlExpr, DBClient,
  FMTBcd;

type
  TDmPesquisar = class(TDataModule)
    sqldPesqCliente: TSQLDataSet;
    dspPesqCliente: TDataSetProvider;
    cdsPesqCliente: TClientDataSet;
    sqldPesqClienteCODCLIENTE: TIntegerField;
    sqldPesqClienteNOME: TStringField;
    sqldPesqClienteTELEFONE: TStringField;
    sqldPesqClienteRG_IE: TStringField;
    sqldPesqClienteCPF_CNPJ: TStringField;
    sqldPesqClienteDATA_NASC: TDateField;
    cdsPesqClienteCODCLIENTE: TIntegerField;
    cdsPesqClienteNOME: TStringField;
    cdsPesqClienteTELEFONE: TStringField;
    cdsPesqClienteRG_IE: TStringField;
    cdsPesqClienteCPF_CNPJ: TStringField;
    cdsPesqClienteDATA_NASC: TDateField;
    sqldPesqData: TSQLDataSet;
    dspPesqData: TDataSetProvider;
    cdsPesqData: TClientDataSet;
    sqldPesqCidade: TSQLDataSet;
    dspPesqCidade: TDataSetProvider;
    cdsPesqCidade: TClientDataSet;
    sqldPesqCidadeCODCIDADE: TIntegerField;
    sqldPesqCidadeDESCRICAO: TStringField;
    cdsPesqCidadeCODCIDADE: TIntegerField;
    cdsPesqCidadeDESCRICAO: TStringField;
    sqldPesqForn: TSQLDataSet;
    sqldPesqFornCODFORNECEDOR: TIntegerField;
    sqldPesqFornFANTAZIA: TStringField;
    dspPesqForn: TDataSetProvider;
    cdsPesqForn: TClientDataSet;
    cdsPesqFornCODFORNECEDOR: TIntegerField;
    cdsPesqFornFANTAZIA: TStringField;
    sqldPesqFornCNPJ: TStringField;
    sqldPesqFornTELEFONE: TStringField;
    cdsPesqFornCNPJ: TStringField;
    cdsPesqFornTELEFONE: TStringField;
    sqldPesqGrupo: TSQLDataSet;
    sqldPesqGrupoCODGRUPO: TIntegerField;
    sqldPesqGrupoDESCRICAO: TStringField;
    dspPesqGrupo: TDataSetProvider;
    cdsPesqGrupo: TClientDataSet;
    cdsPesqGrupoCODGRUPO: TIntegerField;
    cdsPesqGrupoDESCRICAO: TStringField;
    sqldPesqBanco: TSQLDataSet;
    sqldPesqBancoIDBANCO: TIntegerField;
    sqldPesqBancoBANCO: TStringField;
    dspPesqBanco: TDataSetProvider;
    cdsPesqBanco: TClientDataSet;
    cdsPesqBancoIDBANCO: TIntegerField;
    cdsPesqBancoBANCO: TStringField;
    sqldPesqCfop: TSQLDataSet;
    dspPesqCfop: TDataSetProvider;
    cdsPesqCfop: TClientDataSet;
    sqldPesqCfopNUMERO: TStringField;
    sqldPesqCfopOPERACAO: TStringField;
    cdsPesqCfopNUMERO: TStringField;
    cdsPesqCfopOPERACAO: TStringField;
    sqldPesqCaixas: TSQLDataSet;
    sqldPesqCaixasCODIGO: TIntegerField;
    sqldPesqCaixasNOME: TStringField;
    dspPesqCaixas: TDataSetProvider;
    cdsPesqCaixas: TClientDataSet;
    cdsPesqCaixasCODIGO: TIntegerField;
    cdsPesqCaixasNOME: TStringField;
    sqldPesqAliquota: TSQLDataSet;
    sqldPesqAliquotaCODALIQUOTA: TIntegerField;
    sqldPesqAliquotaDESCRICAO: TStringField;
    dspPesqAliquota: TDataSetProvider;
    cdsPesqAliquota: TClientDataSet;
    cdsPesqAliquotaCODALIQUOTA: TIntegerField;
    cdsPesqAliquotaDESCRICAO: TStringField;
    sqldPesqVendedor: TSQLDataSet;
    sqldPesqVendedorIDVENDEDOR: TIntegerField;
    sqldPesqVendedorVENDEDOR: TStringField;
    sqldPesqVendedorATIVO: TStringField;
    dspPesqVendedor: TDataSetProvider;
    cdsPesqVendedor: TClientDataSet;
    cdsPesqVendedorIDVENDEDOR: TIntegerField;
    cdsPesqVendedorVENDEDOR: TStringField;
    cdsPesqVendedorATIVO: TStringField;
    sqldPesqClienteDESCRICAO: TStringField;
    cdsPesqClienteDESCRICAO: TStringField;
    sqldPesqDataDATAINI: TDateField;
    sqldPesqDataDATAFIM: TDateField;
    cdsPesqDataDATAINI: TDateField;
    cdsPesqDataDATAFIM: TDateField;
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
  Result := Null;
  cdsPesqBanco.Close;
  if TfrmModeloConsulta.Execute('Banco',cdsPesqBanco,FN_BANCO,DL_BANCO) then
    Result := cdsPesqBancoIDBANCO.AsInteger;
  cdsPesqBanco.Close;
end;

function TDmPesquisar.GetCliente: Variant;
begin
  Result := Null;
  cdsPesqCliente.Close;
  if TfrmModeloConsulta.Execute('Cliente',cdsPesqCliente,FN_CLIENTES,DL_CLIENTES) then
    Result := cdsPesqClienteCODCLIENTE.AsInteger;
  cdsPesqCliente.Close;
end;

function TDmPesquisar.GetContaCaixa: Variant;
begin
  Result := Null;
  cdsPesqCaixas.Close;
  if TfrmModeloConsulta.Execute('Conta Caixa',cdsPesqCaixas,FN_CAIXAS,DL_CAIXAS) then
    Result := cdsPesqCaixasCODIGO.AsInteger;
  cdsPesqCaixas.Close;
end;

function TDmPesquisar.GetFornecedor: Variant;
begin
  Result := Null;
  cdsPesqForn.Close;
  if TfrmModeloConsulta.Execute('Fornecedor',cdsPesqForn,FN_FORN,DL_FORN) then
    Result := cdsPesqFornCODFORNECEDOR.AsInteger;
  cdsPesqForn.Close;
end;

end.
