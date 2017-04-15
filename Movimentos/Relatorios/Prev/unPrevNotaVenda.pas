unit unPrevNotaVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, DBClient,
  Datasnap.Provider, DB, Data.SqlExpr, FMTBcd;

type
  TfrmPrevNotaVenda = class(TForm)
    rlrNotaVenda: TRLReport;
    rlbCabecalho: TRLBand;
    rlblEmpresa: TRLLabel;
    rlblCidadeEstado: TRLLabel;
    rlblFoneEmail: TRLLabel;
    rlblTituloPedido: TRLLabel;
    rlbDadosCliente: TRLBand;
    rlblCliente: TRLLabel;
    rlblEndereco: TRLLabel;
    rlblBairro: TRLLabel;
    rlblCidadeEstadoCliente: TRLLabel;
    rlblVendedor: TRLLabel;
    rlblCpfCnpj: TRLLabel;
    rlblRgIe: TRLLabel;
    rlblCep: TRLLabel;
    rlblFone: TRLLabel;
    rlblDataVenda: TRLLabel;
    sqldVenda: TSQLDataSet;
    dspVenda: TDataSetProvider;
    cdsVenda: TClientDataSet;
    dsVenda: TDataSource;
    rlsdProdutoVenda: TRLSubDetail;
    sqldItemVenda: TSQLDataSet;
    dsLigaVenda: TDataSource;
    cdsVendaCODIGO: TIntegerField;
    cdsVendaCODCLIENTE: TIntegerField;
    cdsVendaCLIENTE: TStringField;
    cdsVendaENDERECO: TStringField;
    cdsVendaBAIRRO: TStringField;
    cdsVendaCIDADE: TStringField;
    cdsVendaCPF_CNPJ: TStringField;
    cdsVendaRG_IE: TStringField;
    cdsVendaCEP: TStringField;
    cdsVendaTELEFONE: TStringField;
    cdsVendaVENDEDOR: TStringField;
    cdsVendaDATA: TDateField;
    cdsVendaOBS: TStringField;
    cdsVendaCONCLUIDA: TStringField;
    cdsVendaBAIXADO: TStringField;
    cdsVendasqldItemVenda: TDataSetField;
    cdsItemVenda: TClientDataSet;
    dsItemVenda: TDataSource;
    cdsItemVendaCODPRODUTO: TIntegerField;
    cdsItemVendaPRODUTO: TStringField;
    rlbColuna: TRLBand;
    rlblCodigo: TRLLabel;
    rlblDescricao: TRLLabel;
    rlblQtde: TRLLabel;
    rlblPreco: TRLLabel;
    rlblDescto: TRLLabel;
    rlblTotal: TRLLabel;
    rlbDetalhe: TRLBand;
    rldbtCodigo: TRLDBText;
    rldbtDescricao: TRLDBText;
    rldbtQtde: TRLDBText;
    rldbtPreco: TRLDBText;
    rldbtDescto: TRLDBText;
    rldbtTotal: TRLDBText;
    rldbtCliente: TRLDBText;
    rldbtEndereco: TRLDBText;
    rldbtBairro: TRLDBText;
    rldbtCidade: TRLDBText;
    rldbtVendedor: TRLDBText;
    rldbtCpjCnpj: TRLDBText;
    rldbtRgIe: TRLDBText;
    rldbtCep: TRLDBText;
    rldbtFone: TRLDBText;
    rldbtDataVenda: TRLDBText;
    rlbTotais: TRLBand;
    rlblTotalVenda: TRLLabel;
    rldbtTotalVenda: TRLDBText;
    rlsyData: TRLSystemInfo;
    rlsyPageNro: TRLSystemInfo;
    rlblAssCliente: TRLLabel;
    sqldVendaCODIGO: TIntegerField;
    sqldVendaCODCLIENTE: TIntegerField;
    sqldVendaCLIENTE: TStringField;
    sqldVendaENDERECO: TStringField;
    sqldVendaBAIRRO: TStringField;
    sqldVendaCIDADE: TStringField;
    sqldVendaCPF_CNPJ: TStringField;
    sqldVendaRG_IE: TStringField;
    sqldVendaCEP: TStringField;
    sqldVendaTELEFONE: TStringField;
    sqldVendaVENDEDOR: TStringField;
    sqldVendaDATA: TDateField;
    sqldVendaOBS: TStringField;
    sqldVendaTOTALDESCTO: TFMTBCDField;
    sqldVendaTOTAL: TFMTBCDField;
    sqldVendaCONCLUIDA: TStringField;
    sqldVendaBAIXADO: TStringField;
    sqldItemVendaCODPRODUTO: TIntegerField;
    sqldItemVendaPRODUTO: TStringField;
    sqldItemVendaQTD: TIntegerField;
    sqldItemVendaVENDA: TFMTBCDField;
    sqldItemVendaVALORDESCTO: TFMTBCDField;
    sqldItemVendaTOTAL: TFMTBCDField;
    cdsVendaTOTALDESCTO: TFMTBCDField;
    cdsVendaTOTAL: TFMTBCDField;
    cdsItemVendaQTD: TIntegerField;
    cdsItemVendaVENDA: TFMTBCDField;
    cdsItemVendaVALORDESCTO: TFMTBCDField;
    cdsItemVendaTOTAL: TFMTBCDField;
    rllbCnpjCpf_RgIe: TRLLabel;
    procedure rlrNotaVendaBeforePrint(Sender: TObject;
      var PrintIt: Boolean);
  private
  public
  end;

var
  frmPrevNotaVenda: TfrmPrevNotaVenda;

implementation

uses VarGlobal, uClasses;

{$R *.dfm}

procedure TfrmPrevNotaVenda.rlrNotaVendaBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  rlblEmpresa.Caption      := Empresa.Nome;
  rllbCnpjCpf_RgIe.Caption := Empresa.Cnpj+' - '+Empresa.InscEstadual;
  rlblCidadeEstado.Caption := Empresa.Endereco+' - '+Empresa.Cidade +' - '+Empresa.Estado;
  rlblFoneEmail.Caption    := Empresa.Telefone+' - E-mail: '+Empresa.Email;
  rlblTituloPedido.Caption := Global.TituloVenda;
end;

end.
