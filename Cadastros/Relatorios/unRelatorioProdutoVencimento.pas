unit unRelatorioProdutoVencimento;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unDialogoRelatorioPadrao, memds, 
  DB, SqlDb, StdCtrls, Buttons, ComCtrls,
  DBCtrls, FMTBcd;

type
  TfrmRelatorioProdutoVencimento = class(TfrmDialogoRelatorioPadrao)
    sqldSelecao: TSQLQuery;
    dspSelecao: TComponent;
    cdsSelecao: TMemDataSet;
    sqldSelecaoDATA: TDateTimeField;
    cdsSelecaoDATA: TDateTimeField;
    sqldUnidade: TSQLQuery;
    dspUnidade: TComponent;
    cdsUnidade: TMemDataSet;
    cdsUnidadeCODUNIDADE: TIntegerField;
    cdsUnidadeDESCRICAO: TStringField;
    sqldForn: TSQLQuery;
    dspForn: TComponent;
    cdsForn: TMemDataSet;
    sqldGrupo: TSQLQuery;
    dspGrupo: TComponent;
    cdsGrupo: TMemDataSet;
    cdsGrupoCODGRUPO: TIntegerField;
    cdsGrupoDESCRICAO: TStringField;
    sqldFornCODFORNECEDOR: TIntegerField;
    sqldFornFANTAZIA: TStringField;
    sqldFornCNPJ: TStringField;
    sqldFornTELEFONE: TStringField;
    cdsFornCODFORNECEDOR: TIntegerField;
    cdsFornFANTAZIA: TStringField;
    cdsFornCNPJ: TStringField;
    cdsFornTELEFONE: TStringField;
    dsUnidade: TDataSource;
    dsGrupo: TDataSource;
    dsForn: TDataSource;
    dbdDataVenc: TDBEdit;
    dbeUnidade: TDBEdit;
    dbeForn: TDBEdit;
    dbeGrupo: TDBEdit;
    rgTipo: TRadioGroup;
    procedure rgTipoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVisualizarClick(Sender: TObject);
    procedure dbeUnidadeClickButton(Sender: TObject);
    procedure dbeGrupoClickButton(Sender: TObject);
    procedure dbeFornClickButton(Sender: TObject);
  private
    procedure EnableFiltros;
  public
    SQLUnidade, SQLForn, SQLGrupo: string;
  end;

var
  frmRelatorioProdutoVencimento: TfrmRelatorioProdutoVencimento;

implementation

uses unModeloConsulta, ConstPadrao, Funcoes, unPrevProdutosVencimento,
     Math, uConfiguraRelatorio;

{$R *.dfm}

procedure TfrmRelatorioProdutoVencimento.EnableFiltros;
begin
  case rgTipo.ItemIndex of
    0:
    begin
      dbeUnidade.Visible := False;
      dbeGrupo.Visible := False;
      dbeForn.Visible := False;
    end;
    1:
    begin
      dbeUnidade.Visible := True;
      dbeGrupo.Visible := False;
      dbeForn.Visible := False;
    end;
    2:
    begin
      dbeUnidade.Visible := False;
      dbeGrupo.Visible := False;
      dbeForn.Visible := True;
    end;
    3:
    begin
      dbeUnidade.Visible := False;
      dbeGrupo.Visible := True;
      dbeForn.Visible := False;
    end;
  end;
  Update;
  Refresh;
end;

procedure TfrmRelatorioProdutoVencimento.rgTipoClick(Sender: TObject);
begin
  inherited;
  EnableFiltros;
end;

procedure TfrmRelatorioProdutoVencimento.FormCreate(Sender: TObject);
begin
  inherited;
  ClientHeight := 215;
  ClientWidth := 441;
  dbeGrupo.Top := dbeUnidade.Top;
  dbeForn.Top := dbeUnidade.Top;
  EnableFiltros;
  cdsSelecao.Open;

  SQLUnidade := sqldUnidade.sql.text;
  SQLForn    := sqldForn.sql.text;
  SQLGrupo   := sqldGrupo.sql.text;
end;

procedure TfrmRelatorioProdutoVencimento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  cdsSelecao.Close;
end;

procedure TfrmRelatorioProdutoVencimento.btnVisualizarClick(Sender: TObject);
begin
  inherited;
  with TfrmPrevProdutosVencimento.Create(Self) do
  try
    if ValidaFieldsVazios([cdsSelecaoDATA], ['Data Limite']) = '' then
    begin
      cdsPadrao.Close;

      sqldPadrao.Params.ParamByName('DATA').AsDateTime := cdsSelecaoDATA.AsDateTime;

      sqldPadrao.Params.ParamByName('UNIDADE').AsInteger :=
        IfThen(rgTipo.ItemIndex = 1, cdsUnidadeCODUNIDADE.AsInteger, -1);

      sqldPadrao.Params.ParamByName('GRUPO').AsInteger :=
        IfThen(rgTipo.ItemIndex = 2, cdsGrupoCODGRUPO.AsInteger, -1);

      sqldPadrao.Params.ParamByName('FORN').AsInteger :=
        IfThen(rgTipo.ItemIndex = 3, cdsFornCODFORNECEDOR.AsInteger, -1);

      cdsPadrao.Open;
      Data := dbdDataVenc.Text;
      PrintIfNotEmptyRL(rrPadrao);
    end;
  finally
    cdsPadrao.Close;
    Free;
  end;
end;

procedure TfrmRelatorioProdutoVencimento.dbeUnidadeClickButton(Sender: TObject);
begin
  inherited;
  cdsUnidade.Close;
  sqldUnidade.SQL.Clear; sqldUnidade.SQL.Text :=SQLUnidade;
//  if not TfrmModeloConsulta.Execute('Busca Unidade', cdsUnidade, FN_UNIDADES, DL_UNIDADES) then
//    cdsUnidade.Close;
end;

procedure TfrmRelatorioProdutoVencimento.dbeGrupoClickButton(Sender: TObject);
begin
  inherited;
  cdsGrupo.Close;
  sqldGrupo.SQL.Clear; sqldGrupo.SQL.Text :=SQLGrupo;
//  if not TfrmModeloConsulta.Execute('Busca Grupo', cdsGrupo, FN_GRUPOS, DL_GRUPOS) then
//    cdsGrupo.Close;
end;

procedure TfrmRelatorioProdutoVencimento.dbeFornClickButton(Sender: TObject);
begin
  inherited;
  cdsForn.Close;
  sqldForn.SQL.Clear; sqldForn.SQL.Text :=SQLForn;
//  if not TfrmModeloConsulta.Execute('Busca Fornecedor', cdsForn, FN_FORN, DL_FORN) then
//    cdsForn.Close;
end;

initialization
  RegisterClass(TfrmRelatorioProdutoVencimento);
finalization
  UnRegisterClass(TfrmRelatorioProdutoVencimento);
end.
