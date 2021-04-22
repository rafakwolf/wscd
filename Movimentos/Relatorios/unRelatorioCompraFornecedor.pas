unit unRelatorioCompraFornecedor;

interface

uses
   Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unDialogoRelatorioPadrao, StdCtrls, Buttons, ExtCtrls,
  DB, memds,  SqlDb,  DBCtrls,  FMTBcd, 
  uniEdit, uniDBEdit,    uniPanel;

type
  TfrmRelatorioCompraFornecedor = class(TfrmDialogoRelatorioPadrao)
    sqldSelecao: TSQLQuery;
    dspSelecao: TComponent;
    cdsSelecao: TMemDataSet;
    sqldSelecaoCODFORNECEDOR: TIntegerField;
    sqldSelecaoFANTAZIA: TStringField;
    sqldSelecaoCNPJ: TStringField;
    sqldSelecaoTELEFONE: TStringField;
    cdsSelecaoCODFORNECEDOR: TIntegerField;
    cdsSelecaoFANTAZIA: TStringField;
    cdsSelecaoCNPJ: TStringField;
    cdsSelecaoTELEFONE: TStringField;
    dbeForn: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure dbeFornClickButton(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    SQLpadrao: string;
    procedure Imprimir(p: Boolean);
  public
  end;

var
  frmRelatorioCompraFornecedor: TfrmRelatorioCompraFornecedor;

implementation

uses
  Funcoes, unPrevCompras, ConstPadrao, uConfiguraRelatorio, unModeloConsulta;

{$R *.dfm}

procedure TfrmRelatorioCompraFornecedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cdsSelecao.Close;
  inherited;
end;

procedure TfrmRelatorioCompraFornecedor.Imprimir(p: Boolean);
begin
  if (dbeForn.Field.AsString = '') then
  begin
    MsgErro(UM_FILTROINVALIDO);
    dbeForn.SetFocus;
    Abort;
  end
  else
  begin
    with TfrmPrevCompras.Create(Self) do
    try
      with cdsPadrao do
      begin
        Close;
        Params.ParamByName('COD').AsInteger := cdsSelecaoCODFORNECEDOR.AsInteger;
        Open;
      end;
      Titulo := 'Compras do fornecedor: ' + cdsSelecaoFANTAZIA.AsString;
      PrintIfNotEmptyRL(rrPadrao, p);
    finally
      cdsPadrao.Close;
      Free;
    end;
  end;
end;

procedure TfrmRelatorioCompraFornecedor.btnVisualizarClick(
  Sender: TObject);
begin
  inherited;
  Imprimir(False);
end;

procedure TfrmRelatorioCompraFornecedor.btnImprimirClick(Sender: TObject);
begin
  inherited;
  Imprimir(True);
end;

procedure TfrmRelatorioCompraFornecedor.dbeFornClickButton(
  Sender: TObject);
begin
  inherited;
//  cdsSelecao.Close;
//  cdsSelecao.SQL.Clear; SQL.Text :=SQLpadrao;
//  if not TfrmModeloConsulta.Execute('Fornecedor', cdsSelecao, FN_FORN, DL_FORN) then
//    cdsSelecao.Close;
end;

procedure TfrmRelatorioCompraFornecedor.FormCreate(Sender: TObject);
begin
  inherited;
  SQLpadrao := sqldSelecao.CommandText;
end;

initialization
  RegisterClass(TfrmRelatorioCompraFornecedor);
finalization
  UnRegisterClass(TfrmRelatorioCompraFornecedor);
end.
