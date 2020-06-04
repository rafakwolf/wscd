unit unRelatorioCPData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unDialogoRelatorioPadrao, DB, StdCtrls, Buttons, ExtCtrls,
  ComCtrls, DBCtrls, Vcl.Mask, uniGUIClasses, uniEdit, uniDBEdit, uniButton,
  uniBitBtn, uniGUIBaseClasses, uniPanel;

type
  TfrmRelatorioCPData = class(TfrmDialogoRelatorioPadrao)
    edDataFim: TDBEdit;
    edDataIni: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    procedure Imprimir(p: Boolean);
  public
  end;

var
  frmRelatorioCPData: TfrmRelatorioCPData;

implementation

uses
  VarGlobal, Funcoes, uConfiguraRelatorio, unPrevContasPagar;

{$R *.dfm}

procedure TfrmRelatorioCPData.Imprimir(p: Boolean);
begin
//  if ValidaDataIniFim(GetDmPesquisar.cdsPesqData.FieldByName('DATAINI').AsDateTime,
//    GetDmPesquisar.cdsPesqData.FieldByName('DATAFIM').AsDateTime, edDataIni)then
//  begin
//    with TfrmPrevContasPagar.Create(Self) do
//    try
//      with cdsPadrao do
//      begin
//        Close;
//        CommandText := 'select * from VIEWRELCP '+
//                       'where DATA between :PDATAINI and :PDATAFIM '+
//                       'order by FORNECEDOR, DATA';
//
//        Params.ParamByName('PDATAINI').AsDate :=
//          Trunc(GetDmPesquisar.cdsPesqData.FieldByName('DATAINI').AsDateTime);
//        Params.ParamByName('PDATAFIM').AsDate :=
//          Trunc(GetDmPesquisar.cdsPesqData.FieldByName('DATAFIM').AsDateTime);
//        Open;
//      end;
//      Titulo := 'Contas a pagar entre ' + edDataIni.Text + ' e ' +
//        edDataFim.Text;
//      PrintIfNotEmptyRL(rrPadrao, p);
//    finally
//      cdsPadrao.Close;
//      Free;
//    end;
 // end;
end;

procedure TfrmRelatorioCPData.FormCreate(Sender: TObject);
begin
  inherited;
//  dsPadrao.DataSet := getdmpesquisar.cdsPesqData;
//  GetDmPesquisar.cdsPesqData.Open;
end;

procedure TfrmRelatorioCPData.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //GetDmPesquisar.cdsPesqData.Close;
  inherited;
end;

procedure TfrmRelatorioCPData.btnVisualizarClick(Sender: TObject);
begin
  inherited;
  Imprimir(False);
end;

procedure TfrmRelatorioCPData.btnImprimirClick(Sender: TObject);
begin
  inherited;
  Imprimir(True);
end;

initialization
  RegisterClass(TfrmRelatorioCPData);
finalization
  UnRegisterClass(TfrmRelatorioCPData);
end.

