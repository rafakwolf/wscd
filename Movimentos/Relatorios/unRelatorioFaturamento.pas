unit unRelatorioFaturamento;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unDialogoRelatorioPadrao, StdCtrls, Buttons,  
  memds,  DB, SqlDb,  DBCtrls,  FMTBcd;

type
  TfrmRelatorioFaturamento = class(TfrmDialogoRelatorioPadrao)
    sqldForn: TSQLQuery;
    sqldFornCODFORNECEDOR: TIntegerField;
    sqldFornFANTAZIA: TStringField;
    sqldFornCNPJ: TStringField;
    sqldFornTELEFONE: TStringField;
    dspForn: TComponent;
    cdsForn: TMemDataSet;
    cdsFornCODFORNECEDOR: TIntegerField;
    cdsFornFANTAZIA: TStringField;
    cdsFornCNPJ: TStringField;
    cdsFornTELEFONE: TStringField;
    chkLucro: TCheckBox;
    chkCusto: TCheckBox;
    dbeForn: TDBEdit;
    procedure dbeFornClickButton(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
  private
    SQLPadrao: string;
    procedure Imprimir(p: Boolean);
  public
  end;

var
  frmRelatorioFaturamento: TfrmRelatorioFaturamento;

implementation

uses
  unPrevListaFaturamento, unModeloConsulta, ConstPadrao, uConfiguraRelatorio;

{$R *.dfm}

procedure TfrmRelatorioFaturamento.Imprimir(p: Boolean);
const
  SQL: string = 'select '+
                'nf.NUMERO, '+
                'nf.CODFORNECEDOR, '+
                'fn.FANTAZIA FORNECEDOR, '+
                'nf.DATANOTA, '+
                'nf.DATAENTRADA, '+
                ' c.OPERACAO, '+
                'nf.DESCONTO, '+
                'nf.ICMS, '+
                'nf.IPI, '+
                'nf.FRETE, '+
                'nf.DESPESAS, '+
                'nf.TOTALPRODUTO, '+
                'nf.TOTAL, '+
                'nf.OBS, '+
                'nf.BAIXADO, '+
                'nf.CONCLUIDA '+
                'from NOTAS_FISCAIS nf '+
                'left join FORNECEDORES fn on(nf.CODFORNECEDOR = fn.CODFORNECEDOR) '+
                'left join CFOP c on (c.NUMERO = nf.CFOP) '+
                'where nf.CODFORNECEDOR = :PFORN '+
                'order by nf.DATANOTA';
begin
   with TfrmPrevListaFaturamento.Create(Self) do
   try
     cdsPadrao.Close;
     sqldPadrao.SQL.Clear; sqldPadrao.SQL.Text :=SQL;
     sqldPadrao.Params.ParamByName('PFORN').AsInteger := cdsFornCODFORNECEDOR.AsInteger;
     cdsPadrao.Open;
     lbTitulo.Caption := 'Listagem de faturamento de produtos';
     lbCusto.Visible := chkCusto.Checked;
     rldbPrecoCusto.Visible := chkCusto.Checked;
     lbLucro.Visible := chkLucro.Checked;
     rldbLucro.Visible := chkLucro.Checked;
     PrintIfNotEmptyRL(rrPadrao, p);
   finally
     Free;
   end;
end;

procedure TfrmRelatorioFaturamento.dbeFornClickButton(Sender: TObject);
begin
  inherited;
  cdsForn.Close;
  sqldForn.SQL.Clear; sqldForn.SQL.Text :=SQLPadrao;
//  if not TfrmModeloConsulta.Execute('Fornecedor', cdsForn, FN_FORN, DL_FORN) then
//    cdsForn.Close;
end;

procedure TfrmRelatorioFaturamento.FormCreate(Sender: TObject);
begin
  inherited;
  cdsForn.Close;
  chkCusto.Checked := True;
  chkLucro.Checked := True;
  SQLPadrao := sqldForn.sql.text;
end;

procedure TfrmRelatorioFaturamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cdsForn.Close;
  inherited;
end;

procedure TfrmRelatorioFaturamento.btnImprimirClick(Sender: TObject);
begin
  inherited;
  Imprimir(True);
end;

procedure TfrmRelatorioFaturamento.btnVisualizarClick(Sender: TObject);
begin
  inherited;
  Imprimir(False);
end;

initialization
  RegisterClass(TfrmRelatorioFaturamento);
finalization
  UnRegisterClass(TfrmRelatorioFaturamento);

end.
