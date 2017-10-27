unit unFiltroSimples;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, DB, UniGuiForm,
  SqlExpr, Provider, DBClient, Grids, DBGrids, FMTBcd, uniGUIBaseClasses,
  uniGUIClasses, uniButton, uniBitBtn, uniEdit, uniImage, uniBasicGrid,
  uniDBGrid;

type
  TfrmFiltroSimples = class(TUniForm)
    sqldFiltro: TSQLDataSet;
    dspFiltro: TDataSetProvider;
    cdsFiltro: TClientDataSet;
    dsFiltro: TDataSource;
    shpBorda: TShape;
    sqldFiltroCODIGO: TIntegerField;
    sqldFiltroNOME: TStringField;
    cdsFiltroCODIGO: TIntegerField;
    cdsFiltroNOME: TStringField;
    btnOk: TUniBitBtn;
    btnCancelar: TUniBitBtn;
    ledtBusca: TUniEdit;
    imgFiltro: TUniImage;
    dbgrdFiltro: TUniDBGrid;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ledtBuscaChange(Sender: TObject);
    procedure dbgrdFiltroDblClick(Sender: TObject);
  private
    FieldFind: string;
  public
    class function Execute(var Retorno: Integer; TableName, ListField, KeyField: string): Boolean;
  end;

var
  frmFiltroSimples: TfrmFiltroSimples;

implementation

uses Funcoes, ConstPadrao;

{$R *.dfm}

procedure TfrmFiltroSimples.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_escape then
    Close;
end;

procedure TfrmFiltroSimples.FormCreate(Sender: TObject);
begin
  CentralizaForm(Self);
end;

class function TfrmFiltroSimples.Execute(var Retorno: Integer; TableName,
  ListField, KeyField: string): Boolean;
begin
  frmFiltroSimples := TfrmFiltroSimples.Create(Application);
  with frmFiltroSimples do
  try
    cdsFiltro.Close;
    cdsFiltro.CommandText :=
      'select '+
        KeyField+' as CODIGO, '+
        ListField+' as NOME from '+TableName+' order by '+ListField;

    FieldFind := ListField;

    cdsFiltro.Open;

    Result := (ShowModal = mrOk);

    if Result then
      Retorno := cdsFiltroCODIGO.AsInteger
    else
      Retorno := -1;  
  finally
    FreeAndNil(frmFiltroSimples);
  end;
end;

procedure TfrmFiltroSimples.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmFiltroSimples.ledtBuscaChange(Sender: TObject);
begin
  if (ledtBusca.Text <> '') and (not cdsFiltro.Locate('NOME', ledtBusca.Text,[loCaseInsensitive, loPartialKey])) then
    MsgAviso('',UM_PESQUISAVAZIO);
end;

procedure TfrmFiltroSimples.dbgrdFiltroDblClick(Sender: TObject);
begin
  btnOk.Click;
end;

end.
