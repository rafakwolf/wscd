unit unRelatorioFornecedorData;

interface

uses
   Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unDialogoRelatorioPadrao, DB, StdCtrls, Buttons, ExtCtrls,
  ComCtrls,  DBCtrls;

type
  TfrmRelatorioFornecedorData = class(TfrmDialogoRelatorioPadrao)
    edDataFim: TDBEdit;
    edDataIni: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    procedure Imprimir(p: Boolean);
  public
  end;

var
  frmRelatorioFornecedorData: TfrmRelatorioFornecedorData;

implementation

uses
  Funcoes, uConfiguraRelatorio, unPrevRelFornData, VarGlobal;

{$R *.dfm}

procedure TfrmRelatorioFornecedorData.Imprimir(p: Boolean);
begin
//  if ValidaDataIniFim(GetDmPesquisar.cdsPesqData.FieldByName('DATAINI').AsDateTime,
//    GetDmPesquisar.cdsPesqData.FieldByName('DATAFIM').AsDateTime, edDataIni)then
//  begin
    with TfrmPrevRelFornData.Create(Self) do
    try
      with cdsPadrao do
      begin
        cdsPadrao.Close;
//        Params.ParamByName('PDATAINI').AsDate :=
//          Trunc(GetDmPesquisar.cdsPesqData.FieldByName('DATAINI').AsDateTime);
//        Params.ParamByName('PDATAFIM').AsDate :=
//          Trunc(GetDmPesquisar.cdsPesqData.FieldByName('DATAFIM').AsDateTime);
        cdsPadrao.Open;
      end;
        TipoRelatorio := 2;
        PrintIfNotEmptyRL(rrPadrao, p);
    finally
      cdsPadrao.Close;
      Free;
    end;
  //end;
end;

procedure TfrmRelatorioFornecedorData.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //GetDmPesquisar.cdsPesqData.Close;
  inherited;
end;

procedure TfrmRelatorioFornecedorData.FormCreate(Sender: TObject);
begin
  inherited;
 // dsPadrao.DataSet := GetDmPesquisar.cdsPesqData;
 // GetDmPesquisar.cdsPesqData.Open;
end;

procedure TfrmRelatorioFornecedorData.btnVisualizarClick(Sender: TObject);
begin
  inherited;
  Imprimir(False);
end;

procedure TfrmRelatorioFornecedorData.btnImprimirClick(Sender: TObject);
begin
  inherited;
  Imprimir(True);
end;

initialization
  RegisterClass(TfrmRelatorioFornecedorData);
finalization
  UnRegisterClass(TfrmRelatorioFornecedorData);
end.
