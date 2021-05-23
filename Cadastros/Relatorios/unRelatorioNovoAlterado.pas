unit unRelatorioNovoAlterado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unDialogoRelatorioPadrao, StdCtrls, Buttons, ExtCtrls, DB;

const
  cs_prod_novos_alter: string = 'select '+
                                '  CODBARRA, '+
                                '  DESCRICAO, '+
                                '  FORNECEDOR, '+
                                '  CODGRUPO, '+
                                '  GRUPO, '+
                                '  CUSTO, '+
                                '  LUCRO, '+
                                '  PRECO, '+
                                '  ESTOQUE, '+
                                '  VALORESTOQUE, '+
                                '  ESTOQUE, '+
                                '  PRECO '+
                                'from VIEWRELPRODUTOS '+
                                'where NOVO = :PNOVO '+
                                'and ALTERADO = :PALTERADO '+
                                'order by DESCRICAO';

type
  TfrmRelatorioNovoAlterado = class(TfrmDialogoRelatorioPadrao)
    rgpOpcoes: TRadioGroup;
    procedure btnImprimirClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
  private
    procedure Imprimir(p: Boolean);
  public
  end;

var
  frmRelatorioNovoAlterado: TfrmRelatorioNovoAlterado;

implementation

uses uConfiguraRelatorio, unPrevProdutoGrupo;

{$R *.dfm}

procedure TfrmRelatorioNovoAlterado.Imprimir(p: Boolean);
begin
  with TfrmPrevProdutoGrupo.Create(Self) do
  try
    cdsPadrao.Close;
    if rgpOpcoes.ItemIndex = 0 then
    begin
      cdsPadrao.CommandText :=  cs_prod_novos_alter;
      cdsPadrao.Params.ParamByName('PNOVO').AsInteger := 1;
      cdsPadrao.Params.ParamByName('PALTERADO').AsInteger := 0;
      NovosORAlterados := 'Novos';
    end
    else
    begin
      cdsPadrao.CommandText :=  cs_prod_novos_alter;
      cdsPadrao.Params.ParamByName('PNOVO').AsInteger := 0;
      cdsPadrao.Params.ParamByName('PALTERADO').AsInteger := 1;
      NovosORAlterados := 'Alterados';
    end;
    cdsPadrao.Open;
    TipoRelatorio := 1;
    PrintIfNotEmptyRL(rrPadrao, p);
  finally
    cdsPadrao.Close;
    Free;
  end;
end;

procedure TfrmRelatorioNovoAlterado.btnImprimirClick(Sender: TObject);
begin
  inherited;
  Imprimir(True);
end;

procedure TfrmRelatorioNovoAlterado.btnVisualizarClick(Sender: TObject);
begin
  inherited;
  Imprimir(False);
end;

initialization
  RegisterClass(TfrmRelatorioNovoAlterado);
finalization
  UnRegisterClass(TfrmRelatorioNovoAlterado);
end.
