unit unRelatorioProdutoGrupo;

interface

uses
   Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unDialogoRelatorioPadrao, DB, StdCtrls, Buttons, ExtCtrls, 
  DBCtrls;

type
  TfrmRelatorioProdutoGrupo = class(TfrmDialogoRelatorioPadrao)
    dbeGrupo: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbeGrupoClickButton(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure Imprimir(p: Boolean);
  public
    SQLPadrao: string;
  end;

var
  frmRelatorioProdutoGrupo: TfrmRelatorioProdutoGrupo;

implementation

uses
  Funcoes, uConfiguraRelatorio, unPrevProdutoGrupo, VarGlobal, ConstPadrao,
  unModeloConsulta, uDmPesquisar;

{$R *.dfm}

procedure TfrmRelatorioProdutoGrupo.Imprimir(p: Boolean);
begin
  if (dbeGrupo.Text = '') then
  begin
   MsgErro(UM_FILTROINVALIDO);
   SetFocusIfCan(dbeGrupo);
   Abort;
  end
  else
  begin
    with TfrmPrevProdutoGrupo.Create(Self) do
    try
      with cdsPadrao do
      begin
        Close;
        //Params.ParamByName('CODIGO').AsInteger :=
       //   GetDmPesquisar.cdsPesqGrupoCODGRUPO.AsInteger;
        Open;
      end;
      TipoRelatorio := 0;
      //Grupo := GetDmPesquisar.cdsPesqGrupoDESCRICAO.AsString;
      PrintIfNotEmptyRL(rrPadrao, p);
    finally
      cdsPadrao.Close;
      Free;
    end;
  end;
end;

procedure TfrmRelatorioProdutoGrupo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 // GetDmPesquisar.cdsPesqGrupo.Close;
  inherited;
end;

procedure TfrmRelatorioProdutoGrupo.dbeGrupoClickButton(Sender: TObject);
begin
  inherited;
//  GetDmPesquisar.cdsPesqGrupo.Close;
//  GetDmPesquisar.cdsPesqGrupo.SQL.Clear; SQL.Text :=SQLPadrao;
//
//  if not TfrmModeloConsulta.Execute('Grupo', GetDmPesquisar.cdsPesqGrupo, FN_GRUPOS, DL_GRUPOS) then
//    GetDmPesquisar.cdsPesqGrupo.Close;
end;

procedure TfrmRelatorioProdutoGrupo.btnVisualizarClick(Sender: TObject);
begin
  inherited;
  Imprimir(False);
end;

procedure TfrmRelatorioProdutoGrupo.btnImprimirClick(Sender: TObject);
begin
  inherited;
  Imprimir(True);
end;

procedure TfrmRelatorioProdutoGrupo.FormCreate(Sender: TObject);
begin
  inherited;
//  dsPadrao.DataSet := GetDmPesquisar.cdsPesqGrupo;
//  SQLPadrao := GetDmPesquisar.sqldPesqGrupo.CommandText;
end;

initialization
  RegisterClass(TfrmRelatorioProdutoGrupo);
finalization
  UnRegisterClass(TfrmRelatorioProdutoGrupo);

end.

