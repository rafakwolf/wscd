unit unRelatorioCPFornecedor;

interface

uses
   Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unDialogoRelatorioPadrao, StdCtrls, Buttons, ExtCtrls,
  memds,  DB, SqlDb,  DBCtrls,  FMTBcd, 
  uniEdit, uniDBEdit,    uniPanel;

type
  TfrmRelatorioCPFornecedor = class(TfrmDialogoRelatorioPadrao)
    sqldSelecao: TSQLQuery;
    sqldSelecaoCODFORNECEDOR: TIntegerField;
    sqldSelecaoFANTAZIA: TStringField;
    dspSelecao: TComponent;
    cdsSelecao: TMemDataSet;
    cdsSelecaoCODFORNECEDOR: TIntegerField;
    cdsSelecaoFANTAZIA: TStringField;
    sqldSelecaoCNPJ: TStringField;
    sqldSelecaoTELEFONE: TStringField;
    cdsSelecaoCNPJ: TStringField;
    cdsSelecaoTELEFONE: TStringField;
    dbeForn: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbeFornClickButton(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    SQLpadrao: string;
    procedure Imprimir(p: Boolean);
  public

  end;

var
  frmRelatorioCPFornecedor: TfrmRelatorioCPFornecedor;

implementation

uses
  Funcoes, uConfiguraRelatorio, unPrevContasPagar, ConstPadrao,
  unModeloConsulta;

{$R *.dfm}

procedure TfrmRelatorioCPFornecedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cdsSelecao.Close;
  inherited;
end;

procedure TfrmRelatorioCPFornecedor.Imprimir(p: Boolean);
begin
  if (dbeForn.Text = '') then
  begin
    MsgErro(UM_FILTROINVALIDO);
    SetFocusIfCan(dbeForn);
    Abort;
  end
  else
  begin
    with TfrmPrevContasPagar.Create(Self) do
    try
      with cdsPadrao do
      begin
        Close;
        Params.ParamByName('PFORNECEDOR').AsInteger := cdsSelecaoCODFORNECEDOR.AsInteger;
        Open;
      end;
      Titulo := 'Contas a Pagar do Fornecedor: ' + cdsSelecaoFANTAZIA.AsString;
      PrintIfNotEmptyRL(rrPadrao, p);
    finally
      cdsPadrao.Close;
      Free;
    end;
  end;
end;

procedure TfrmRelatorioCPFornecedor.dbeFornClickButton(Sender: TObject);
begin
  inherited;
  cdsSelecao.Close;
  cdsSelecao.SQL.Clear; SQL.Text :=SQLpadrao;
//  if not TfrmModeloConsulta.Execute('Fornecedor', cdsSelecao, FN_FORN, DL_FORN) then
//    cdsSelecao.Close;
end;

procedure TfrmRelatorioCPFornecedor.btnVisualizarClick(Sender: TObject);
begin
  inherited;
  Imprimir(False);
end;

procedure TfrmRelatorioCPFornecedor.btnImprimirClick(Sender: TObject);
begin
  inherited;
  Imprimir(True);
end;

procedure TfrmRelatorioCPFornecedor.FormCreate(Sender: TObject);
begin
  inherited;
  SQLPadrao := sqldSelecao.CommandText;
end;

initialization
  RegisterClass(TfrmRelatorioCPFornecedor);
finalization
  UnRegisterClass(TfrmRelatorioCPFornecedor);
end.
