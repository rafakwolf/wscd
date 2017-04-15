unit unRelatorioCRData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unDialogoRelatorioPadrao, DB, StdCtrls, Buttons, ExtCtrls,
  ComCtrls, DBCtrls, Vcl.Mask;

type
  TfrmRelatorioCRData = class(TfrmDialogoRelatorioPadrao)
    edDataIni: TDBEdit;
    edDataFim: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    procedure imprimir(p: Boolean);
  public

  end;

var
  frmRelatorioCRData: TfrmRelatorioCRData;

implementation

uses
  VarGlobal, Funcoes, uConfiguraRelatorio, unPrevContasReceber;

{$R *.dfm}

procedure TfrmRelatorioCRData.FormCreate(Sender: TObject);
begin
  inherited;
  dsPadrao.DataSet := getdmpesquisar.cdsPesqData;
  GetDmPesquisar.cdsPesqData.Open;
end;

procedure TfrmRelatorioCRData.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  GetDmPesquisar.cdsPesqData.Close;
  inherited;
end;

procedure TfrmRelatorioCRData.imprimir(p: Boolean);
begin
//  if ValidaDataIniFim(GetDmPesquisar.cdsPesqData.FieldByName('DATAINI').AsDateTime,
//    GetDmPesquisar.cdsPesqData.FieldByName('DATAFIM').AsDateTime, edDataIni)then
//  begin
    with TfrmPrevContasReceber.Create(Self) do
    try
      with cdsPadrao do
      begin
        Close;
        CommandText := 'select '+
                       ' DATA, '+
                       ' VENCIMENTO, '+
                       ' CLIENTE, '+
                       ' CAPITAL, '+
                       ' TOTAL '+
                       'from VIEWRELCR '+
                       'where DATA '+
                       'between :PDATAINI '+
                       'and :PDATAFIM '+
                       'order by CLIENTE, DATA';

        Params.ParamByName('PDATAINI').AsDate :=
          Trunc(GetDmPesquisar.cdsPesqData.FieldByName('DATAINI').AsDateTime);
        Params.ParamByName('PDATAFIM').AsDate :=
          Trunc(GetDmPesquisar.cdsPesqData.FieldByName('DATAFIM').AsDateTime);
        Open;
      end;
      Titulo := 'Contas a Receber entre: ' + edDataIni.Text + ' e ' + edDataFim.Text;
      PrintIfNotEmptyRL(rrPadrao, p);
    finally
      cdsPadrao.Close;
      Free;
    end;
  //end;
end;

procedure TfrmRelatorioCRData.btnVisualizarClick(Sender: TObject);
begin
  inherited;
  imprimir(False);
end;

procedure TfrmRelatorioCRData.btnImprimirClick(Sender: TObject);
begin
  inherited;
  imprimir(True);
end;

initialization
  RegisterClass(TfrmRelatorioCRData);
finalization
  UnRegisterClass(TfrmRelatorioCRData);
end.
