unit unPrevDuplicata;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, memds,  
  DB, SqlDb, FMTBcd;

type
  TfrmPrevDuplicata = class(TForm)
    sqldDuplicata: TSQLQuery;
    dspDuplicata: TComponent;
    cdsDuplicata: TMemDataSet;
    rptDuplicata: TRLReport;
    rlbndDuplicata: TRLBand;
    rlimgLogo: TRLImage;
    rlmDadosEmpresa: TRLMemo;
    rlmTermo: TRLMemo;
    dsDuplicata: TDataSource;
    sqldDuplicataIDDUPLICATA: TIntegerField;
    sqldDuplicataSACADO: TStringField;
    sqldDuplicataCPF_CNPJ: TStringField;
    sqldDuplicataENDERECO: TStringField;
    sqldDuplicataBAIRRO: TStringField;
    sqldDuplicataCEP: TStringField;
    sqldDuplicataIDCIDADE: TIntegerField;
    sqldDuplicataNOMECIDADE: TStringField;
    sqldDuplicataFONEFAX: TStringField;
    sqldDuplicataUF: TStringField;
    sqldDuplicataIE: TStringField;
    sqldDuplicataDATAEMISSAO: TDateField;
    sqldDuplicataNROFATURA: TStringField;
    sqldDuplicataDATAVENC: TDateField;
    sqldDuplicataPRACAPAGAMENTO: TStringField;
    sqldDuplicataDATAIMPRESSAO: TDateField;
    sqldDuplicataIMPRESSA: TStringField;
    sqldDuplicataVALOREXTENSO: TStringField;
    cdsDuplicataIDDUPLICATA: TIntegerField;
    cdsDuplicataSACADO: TStringField;
    cdsDuplicataCPF_CNPJ: TStringField;
    cdsDuplicataENDERECO: TStringField;
    cdsDuplicataBAIRRO: TStringField;
    cdsDuplicataCEP: TStringField;
    cdsDuplicataIDCIDADE: TIntegerField;
    cdsDuplicataNOMECIDADE: TStringField;
    cdsDuplicataFONEFAX: TStringField;
    cdsDuplicataUF: TStringField;
    cdsDuplicataIE: TStringField;
    cdsDuplicataDATAEMISSAO: TDateField;
    cdsDuplicataNROFATURA: TStringField;
    cdsDuplicataDATAVENC: TDateField;
    cdsDuplicataPRACAPAGAMENTO: TStringField;
    cdsDuplicataDATAIMPRESSAO: TDateField;
    cdsDuplicataIMPRESSA: TStringField;
    cdsDuplicataVALOREXTENSO: TStringField;
    rldbtValor: TRLDBText;
    rldbtNroDuplicata: TRLDBText;
    rldbtVencimento: TRLDBText;
    rldbtNroFatura: TRLDBText;
    rldbtDesconto: TRLDBText;
    rldbtSacado: TRLDBText;
    rldbtEndereco: TRLDBText;
    rldbtCidade: TRLDBText;
    rldbtPracaPag: TRLDBText;
    rldbtCpfCnpj: TRLDBText;
    rldbtEstado: TRLDBText;
    rldbtRgIe: TRLDBText;
    rldbtCep: TRLDBText;
    rldbmValorExt: TRLDBMemo;
    sqldDuplicataNRODUPLICATA: TStringField;
    sqldDuplicataDATADESCTO: TDateField;
    cdsDuplicataNRODUPLICATA: TStringField;
    cdsDuplicataDATADESCTO: TDateField;
    rlbdtValor_Fatura: TRLDBText;
    rlbdtDataDescto: TRLDBText;
    sqldDuplicataVALOR_FATURA: TFMTBCDField;
    sqldDuplicataVALOR: TFMTBCDField;
    sqldDuplicataDESCONTO: TFMTBCDField;
    cdsDuplicataVALOR_FATURA: TFMTBCDField;
    cdsDuplicataVALOR: TFMTBCDField;
    cdsDuplicataDESCONTO: TFMTBCDField;
    procedure rptDuplicataBeforePrint(Sender: TObject;
      var PrintIt: Boolean);
  private
  public
  end;

var
  frmPrevDuplicata: TfrmPrevDuplicata;

implementation

uses VarGlobal, uConfiguraRelatorio;

{$R *.dfm}

procedure TfrmPrevDuplicata.rptDuplicataBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  ConfigRelatorioRL(rptDuplicata, rlmDadosEmpresa, rlimgLogo);
  rlmTermo.Lines.Text :=
    'Reconhe�o (emos) a exatid�o desta duplicata de venda mercantil, na import�ncia acima '+
    'que pagaremos � ' + Empresa.Responsavel + ', ou � sua ordem na pra�a e vencimento indicado.';
end;

end.
