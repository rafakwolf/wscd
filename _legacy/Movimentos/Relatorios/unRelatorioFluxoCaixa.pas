unit unRelatorioFluxoCaixa;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unDialogoRelatorioPadrao, StdCtrls, Buttons,  
  DB, memds,  SqlDb, ComCtrls,  FMTBcd, DBCtrls, 
  StrUtils;

type
  TfrmRelatorioFluxoCaixa = class(TfrmDialogoRelatorioPadrao)
    sqldSelecao: TSQLQuery;
    dspSelecao: TComponent;
    cdsSelecao: TMemDataSet;
    sqldSelecaoDATAINI: TDateTimeField;
    sqldSelecaoDATAFIM: TDateTimeField;
    cdsSelecaoDATAINI: TDateTimeField;
    cdsSelecaoDATAFIM: TDateTimeField;
    dbDataI: TDBEdit;
    dbDataF: TDBEdit;
    rgOrdem: TRadioGroup;
    rgRelatorio: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    procedure Imprimir(p: Boolean);
  public
    SQL: String;
  end;

var
  frmRelatorioFluxoCaixa: TfrmRelatorioFluxoCaixa;

implementation

uses
  Funcoes, unPrevRelCaixa, ConstPadrao, uConfiguraRelatorio, DateUtils;

{$R *.dfm}

procedure TfrmRelatorioFluxoCaixa.Imprimir(p: Boolean);

  function TipoRel: string;
  begin
    case rgRelatorio.ItemIndex of
      0: Result := 'C';
      1: Result := 'D';
      2: Result := 'T';
    end;  
  end;

begin
  SQL := 'select * from STPRELCAIXATIPOCONTA '+
         '(:PDATAINI, :PDATAFIM, :PTIPOCONTA, :PORDEM)';

//  if not ValidaDataIniFim(cdsSelecaoDATAINI.AsDateTime,
//    cdsSelecaoDATAFIM.AsDateTime, dbDataI) then
//    Exit;

  if(rgRelatorio.ItemIndex = -1)or(rgOrdem.ItemIndex = -1)then
  begin
    MsgErro(UM_OPCAO);
    Abort;
  end;
  
  with TfrmPrevRelCaixa.Create(Self) do
  try
    with sqldPadrao do
    begin
      Close;
      sqldPadrao.SQL.Clear; sqldPadrao.SQL.Text :=SQL.Text;
      sqldPadrao.Params.ParamByName('PDATAINI').AsDate     := Trunc(cdsSelecaoDATAINI.AsDateTime);
      sqldPadrao.Params.ParamByName('PDATAFIM').AsDate     := Trunc(cdsSelecaoDATAFIM.AsDateTime);
      sqldPadrao.Params.ParamByName('PTIPOCONTA').AsString := tipoRel;
      sqldPadrao.Params.ParamByName('PORDEM').AsString     := IfThen(rgOrdem.ItemIndex = 0, 'L', 'D');
      Open;

      Tipo      := TipoRel;
      TituloRel := 'Fluxo de Caixa';
      PrintIfNotEmptyRL(rrPadrao, p);
    end;
  finally
    Free;
  end;
end;

procedure TfrmRelatorioFluxoCaixa.FormCreate(Sender: TObject);
begin
  inherited;
  cdsSelecao.Open;
  if not (cdsSelecao.State in dsEditModes) then
    cdsSelecao.Edit;
  cdsSelecaoDATAINI.AsDateTime := StartOfTheMonth(Date);
  cdsSelecaoDATAFIM.AsDateTime := EndOfTheMonth(Date);
end;

procedure TfrmRelatorioFluxoCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cdsSelecao.Close;
  inherited;
end;

procedure TfrmRelatorioFluxoCaixa.btnVisualizarClick(Sender: TObject);
begin
  inherited;
  Imprimir(False);
end;

procedure TfrmRelatorioFluxoCaixa.btnImprimirClick(Sender: TObject);
begin
  inherited;
  Imprimir(True);
end;

initialization
  RegisterClass(TfrmRelatorioFluxoCaixa);
finalization
  UnRegisterClass(TfrmRelatorioFluxoCaixa);
end.
