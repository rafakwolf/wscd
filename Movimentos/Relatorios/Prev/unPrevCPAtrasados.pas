unit unPrevCPAtrasados;

interface

uses
   Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unDialogoRelatorioPadrao, StdCtrls, Buttons, ExtCtrls, 
  DBCtrls,  DB, memds,  SqlDb, FMTBcd;

type
  TfrmRelatorioCPAtrasados = class(TfrmDialogoRelatorioPadrao)
    sqldForn: TSQLQuery;
    dspForn: TComponent;
    cdsForn: TMemDataSet;
    cdsFornCODFORNECEDOR: TIntegerField;
    cdsFornFANTAZIA: TStringField;
    cdsFornCNPJ: TStringField;
    cdsFornTELEFONE: TStringField;
    dbeFornecedor: TDBEdit;
    procedure dbeFornecedorClickButton(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVisualizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    sqlpadrao: string;
  public
  end;

var
  frmRelatorioCPAtrasados: TfrmRelatorioCPAtrasados;

implementation

uses unModeloConsulta, ConstPadrao, unPrevContasPagar, Funcoes, uConfiguraRelatorio;

{$R *.dfm}

procedure TfrmRelatorioCPAtrasados.dbeFornecedorClickButton(Sender: TObject);
begin
  inherited;
//  cdsForn.Close;
//  cdsForn.SQL.Clear; SQL.Text :=sqlpadrao;
//  if not TfrmModeloConsulta.Execute('Fornecedor', cdsForn, FN_FORN, DL_FORN) then
//    cdsForn.Close;
end;

procedure TfrmRelatorioCPAtrasados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  cdsForn.Close;
end;

procedure TfrmRelatorioCPAtrasados.btnVisualizarClick(Sender: TObject);
begin
  inherited;
  with TfrmPrevContasPagar.Create(Self) do
  try
    cdsPadrao.Close;
    sqldPadrao.SQL.Clear; sqldPadrao.SQL.Text :='select * from VIEWRELCPATRASADOS '+
                             'where CODFORN = :PFORN '+
                             'order by VENCIMENTO';
    sqldPadrao.Params.ParamByName('PFORN').AsInteger := cdsFornCODFORNECEDOR.AsInteger;
    cdsPadrao.Open;
    Titulo := 'Contas a pagar atrasadas: ' + dbeFornecedor.Text;
    PrintIfNotEmptyRL(rrPadrao);
  finally
    cdsPadrao.Close;
    Free;
  end;
end;

procedure TfrmRelatorioCPAtrasados.FormShow(Sender: TObject);
begin
  inherited;
  SetFocusIfCan(dbeFornecedor);
end;

procedure TfrmRelatorioCPAtrasados.FormCreate(Sender: TObject);
begin
  inherited;
  sqlpadrao := sqldForn.sql.text;
end;

initialization
  RegisterClass(TfrmRelatorioCPAtrasados);
finalization
  UnRegisterClass(TfrmRelatorioCPAtrasados);
end.
