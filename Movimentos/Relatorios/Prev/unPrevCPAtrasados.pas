unit unPrevCPAtrasados;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unDialogoRelatorioPadrao, StdCtrls, Buttons,   
  DBCtrls,  DB, memds,  SqlDb, FMTBcd;

type
  TfrmRelatorioCPAtrasados = class(TfrmDialogoRelatorioPadrao)
    sqldForn: TSQLQuery;
    dspForn: TComponent;
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
  sqldForn.Close;
  sqldForn.SQL.Clear;
  sqldForn.SQL.Text :=sqlpadrao;
  if TfrmModeloConsulta.Execute('Fornecedor', 'FORN', FN_FORN, DL_FORN, self) > 0 then
    sqldForn.Close;
end;

procedure TfrmRelatorioCPAtrasados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  sqldForn.Close;
end;

procedure TfrmRelatorioCPAtrasados.btnVisualizarClick(Sender: TObject);
begin
  inherited;
  with TfrmPrevContasPagar.Create(Self) do
  try
    sqldPadrao.Close;
    sqldPadrao.SQL.Clear; sqldPadrao.SQL.Text :='select * from VIEWRELCPATRASADOS '+
                             'where CODFORN = :PFORN '+
                             'order by VENCIMENTO';
    sqldPadrao.Params.ParamByName('PFORN').AsInteger := sqldForn.fieldByName('CODFORNECEDOR').AsInteger;
    sqldPadrao.Open;
    Titulo := 'Contas a pagar atrasadas: ' + dbeFornecedor.Text;
    PrintIfNotEmptyRL(rrPadrao);
  finally
    sqldPadrao.Close;
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
