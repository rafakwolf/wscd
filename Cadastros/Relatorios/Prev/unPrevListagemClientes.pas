unit unPrevListagemClientes;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unModeloRelatorio, DB, memds,  SqlDb,
  RLReport, VarGlobal, RLParser, FMTBcd;

type
  TfrmPrevListagemClientes = class(TfrmModeloRelatorio)
    rbColuna: TRLBand;
    lbCodigo: TRLLabel;
    lbNome: TRLLabel;
    lbCPJ_CNPJ: TRLLabel;
    lbDataNasc: TRLLabel;
    lbFone: TRLLabel;
    rbDetalhe: TRLBand;
    dbCodigo: TRLDBText;
    dbNome: TRLDBText;
    dbCPJ_CNPJ: TRLDBText;
    dbDataNasc: TRLDBText;
    dbFone: TRLDBText;
    sqldPadraoCODIGO: TIntegerField;
    sqldPadraoNOME: TStringField;
    sqldPadraoENDERECO: TStringField;
    sqldPadraoCPF_CNPJ: TStringField;
    sqldPadraoRG_IE: TStringField;
    sqldPadraoDATANASCIMENTO: TDateField;
    sqldPadraoCODCIDADE: TIntegerField;
    sqldPadraoCIDADE: TStringField;
    sqldPadraoTELEFONE: TStringField;
    sqldPadraoTIPO: TStringField;
    cdsPadraoCODIGO: TIntegerField;
    cdsPadraoNOME: TStringField;
    cdsPadraoENDERECO: TStringField;
    cdsPadraoCPF_CNPJ: TStringField;
    cdsPadraoRG_IE: TStringField;
    cdsPadraoDATANASCIMENTO: TDateField;
    cdsPadraoCODCIDADE: TIntegerField;
    cdsPadraoCIDADE: TStringField;
    cdsPadraoTELEFONE: TStringField;
    cdsPadraoTIPO: TStringField;
    procedure rrPadraoBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure rbDetalheBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    FTipoRelatorio: Integer;
    procedure SetTipoRelatorio(const Value: Integer);
  public
    DataIni, DataFim: String;
    property TipoRelatorio: Integer read FTipoRelatorio write SetTipoRelatorio;
  end;

var
  frmPrevListagemClientes: TfrmPrevListagemClientes;
  Cor: Boolean = True;                      

implementation

{$R *.dfm}

procedure TfrmPrevListagemClientes.SetTipoRelatorio(const Value: Integer);
begin
  FTipoRelatorio := Value;
end;

procedure TfrmPrevListagemClientes.rrPadraoBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;
  case TipoRelatorio of
    0: // Listagem
    begin
      lbTitulo.Caption := 'Listagem de Clientes';
    end;
    1: // por cidade
    begin
      lbTitulo.Caption := 'Clientes da Cidade de: ' + cdsPadraoCIDADE.AsString;
    end;
    2: // entre datas
    begin
      lbTitulo.Caption := 'Clientes entre ' + DataIni + ' e ' + DataFim;
    end;
  end;
end;

procedure TfrmPrevListagemClientes.FormCreate(Sender: TObject);
begin
  inherited;
  sqldPadrao.SQLConnection := GetConnection;
  sqldPadrao.Close;
  sqldPadrao.SQL.Clear; sqldPadrao.SQL.Text :='select'+
                             ' CODIGO,'+
                             ' NOME,'+
                             ' ENDERECO,'+
                             ' CPF_CNPJ,'+
                             ' RG_IE,'+
                             ' DATANASCIMENTO,'+
                             ' CODCIDADE,'+
                             ' CIDADE,'+
                             ' TELEFONE,'+
                             ' TIPO '+
                             'from VIEWRELCLIENTES '+
                             'order by NOME, DATANASCIMENTO';
end;

procedure TfrmPrevListagemClientes.rbDetalheBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;
  if Configuracao.RelZebrado then
  begin
    if Cor then
    begin
      Cor := False;
      rbDetalhe.Color := $00F0F0F0;
    end
    else
    begin
      Cor := True;
      rbDetalhe.Color := clWhite;
    end;
  end;  
end;

end.
