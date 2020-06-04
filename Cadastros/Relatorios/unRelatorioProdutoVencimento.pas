unit unRelatorioProdutoVencimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unDialogoRelatorioPadrao, DBClient, Provider,
  DB, SqlExpr, StdCtrls, Buttons, ExtCtrls, SQLTimST, ComCtrls,
   Mask, DBCtrls,  FMTBcd, uniGUIClasses, uniEdit, uniDBEdit, uniButton,
  uniBitBtn, uniGUIBaseClasses, uniPanel, uniRadioGroup;

type
  TfrmRelatorioProdutoVencimento = class(TfrmDialogoRelatorioPadrao)
    sqldSelecao: TSQLDataSet;
    dspSelecao: TDataSetProvider;
    cdsSelecao: TClientDataSet;
    sqldSelecaoDATA: TSQLTimeStampField;
    cdsSelecaoDATA: TSQLTimeStampField;
    sqldUnidade: TSQLDataSet;
    dspUnidade: TDataSetProvider;
    cdsUnidade: TClientDataSet;
    cdsUnidadeCODUNIDADE: TIntegerField;
    cdsUnidadeDESCRICAO: TStringField;
    sqldForn: TSQLDataSet;
    dspForn: TDataSetProvider;
    cdsForn: TClientDataSet;
    sqldGrupo: TSQLDataSet;
    dspGrupo: TDataSetProvider;
    cdsGrupo: TClientDataSet;
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

  SQLUnidade := sqldUnidade.CommandText;
  SQLForn    := sqldForn.CommandText;
  SQLGrupo   := sqldGrupo.CommandText;
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

      cdsPadrao.Params.ParamByName('DATA').AsSQLTimeStamp :=
        DateTimeToSQLTimeStamp(cdsSelecaoDATA.AsDateTime);

      cdsPadrao.Params.ParamByName('UNIDADE').AsInteger :=
        IfThen(rgTipo.ItemIndex = 1, cdsUnidadeCODUNIDADE.AsInteger, -1);

      cdsPadrao.Params.ParamByName('GRUPO').AsInteger :=
        IfThen(rgTipo.ItemIndex = 2, cdsGrupoCODGRUPO.AsInteger, -1);

      cdsPadrao.Params.ParamByName('FORN').AsInteger :=
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
  cdsUnidade.CommandText := SQLUnidade;
//  if not TfrmModeloConsulta.Execute('Busca Unidade', cdsUnidade, FN_UNIDADES, DL_UNIDADES) then
//    cdsUnidade.Close;
end;

procedure TfrmRelatorioProdutoVencimento.dbeGrupoClickButton(Sender: TObject);
begin
  inherited;
  cdsGrupo.Close;
  cdsGrupo.CommandText := SQLGrupo;
//  if not TfrmModeloConsulta.Execute('Busca Grupo', cdsGrupo, FN_GRUPOS, DL_GRUPOS) then
//    cdsGrupo.Close;
end;

procedure TfrmRelatorioProdutoVencimento.dbeFornClickButton(Sender: TObject);
begin
  inherited;
  cdsForn.Close;
  cdsForn.CommandText := SQLForn;
//  if not TfrmModeloConsulta.Execute('Busca Fornecedor', cdsForn, FN_FORN, DL_FORN) then
//    cdsForn.Close;
end;

initialization
  RegisterClass(TfrmRelatorioProdutoVencimento);
finalization
  UnRegisterClass(TfrmRelatorioProdutoVencimento);
end.
