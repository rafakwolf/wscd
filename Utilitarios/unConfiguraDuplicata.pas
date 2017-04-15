unit unConfiguraDuplicata;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons,
  ExtCtrls, ComCtrls, DBClient, Provider, SqlExpr, Grids, DBGrids,
  Mask, DBCtrls,  FMTBcd, System.Actions;

type
  TfrmConfiguraDuplicata = class(TfrmPadrao)
    sqldPadrao: TSQLDataSet;
    sqldPadraoCAMPO: TStringField;
    sqldPadraoVERTICAL: TIntegerField;
    sqldPadraoHORIZONTAL: TIntegerField;
    sqldPadraoFONTE: TIntegerField;
    sqldPadraoTIPOFONTE: TStringField;
    sqldPadraoESTILOFONTE: TStringField;
    dspPadrao: TDataSetProvider;
    cdsPadrao: TClientDataSet;
    cdsPadraoCAMPO: TStringField;
    cdsPadraoVERTICAL: TIntegerField;
    cdsPadraoHORIZONTAL: TIntegerField;
    cdsPadraoFONTE: TIntegerField;
    cdsPadraoTIPOFONTE: TStringField;
    cdsPadraoESTILOFONTE: TStringField;
    dbeFontSize: TDBEdit;
    dbgrdCampos: TDBGrid;
    miVisualizar: TMenuItem;
    sqldPadraoIDCONFIGDUPLICATA: TIntegerField;
    sqldPadraoNOMECAMPO: TStringField;
    cdsPadraoIDCONFIGDUPLICATA: TIntegerField;
    cdsPadraoNOMECAMPO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure miVisualizarClick(Sender: TObject);
    procedure cdsPadraoBeforeInsert(DataSet: TDataSet);
    procedure dbgrdCamposKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    procedure DBGridMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);      
  private
    slEstiloFonte: TStringList;
    slFontes: TStringList;

    procedure GetEstiloFonte;
    procedure GetFontes;
  public
  end;

  TWheelDBGrid = class(TDBGrid)
  public
    property OnMouseWheel;
  end;

var
  frmConfiguraDuplicata: TfrmConfiguraDuplicata;

implementation

uses Funcoes, unPrevDuplicataSemForm;//, uConfiguraRelatorio;

{$R *.dfm}

procedure TfrmConfiguraDuplicata.FormCreate(Sender: TObject);
begin
  inherited;
  actInsert.Visible := False;
  actPrint.Visible := False;
  actDelete.Visible := False;
  actSearch.Visible := False;
  actPrimeiro.Visible := False;
  actAnterior.Visible := False;
  actProximo.Visible := False;
  actUltimo.Visible := False;
  miRelatorios.Visible := False;
  GetFontes;
  GetEstiloFonte;
  
  ReordenaBotoes([btnAlterar, btnSalvar, btnCancelar, btnSair]);
  TWheelDBGrid(dbgrdCampos).OnMouseWheel := DBGridMouseWheel;
end;

procedure TfrmConfiguraDuplicata.GetEstiloFonte;
begin
  try
    slEstiloFonte := TStringList.Create;

    slEstiloFonte.Add('Normal');
    slEstiloFonte.Add('Negrito');
    slEstiloFonte.Add('Itálico');
    slEstiloFonte.Add('Sublinhado');
    slEstiloFonte.Add('Negrito Itálico');
    slEstiloFonte.Add('Negrito Sublinhado');
    slEstiloFonte.Add('Itálico Sublinhado');
    slEstiloFonte.Add('Negrito Itálico Sublinhado');
  finally
    slEstiloFonte.Free;
  end;
end;

procedure TfrmConfiguraDuplicata.GetFontes;
begin
  slFontes := TStringList.Create;
  slFontes.Assign(Screen.Fonts);
end;

procedure TfrmConfiguraDuplicata.miVisualizarClick(Sender: TObject);
begin
  inherited;
  with TfrmPrevDuplicataSemForm.Create(Self) do
  try
    Config := True;
    //PrintIfNotEmptyRL(rrDuplicata);
  finally
    Free;
  end;
end;

procedure TfrmConfiguraDuplicata.cdsPadraoBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  Abort;
end;

procedure TfrmConfiguraDuplicata.dbgrdCamposKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_DOWN then
  begin
    cdsPadrao.DisableControls;
    cdsPadrao.Next;
    if cdsPadrao.Eof then
      Key := 0
    else
      cdsPadrao.Prior;
    cdsPadrao.EnableControls;
  end;
end;

function GetNumScrollLines: Integer;
begin
  SystemParametersInfo(SPI_GETWHEELSCROLLLINES, 0, @Result, 0);
end;

procedure TfrmConfiguraDuplicata.DBGridMouseWheel(Sender: TObject;
  Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint;
  var Handled: Boolean);
var
  Direction: Shortint;
begin
  Direction := 1;
  if WheelDelta = 0 then
    Exit
  else if WheelDelta > 0 then
    Direction := -1;

  with TDBGrid(Sender) do
  begin
    if Assigned(DataSource) and Assigned(DataSource.DataSet) then
      DataSource.DataSet.MoveBy(Direction * GetNumScrollLines);
    Invalidate;
  end;
end;

initialization
  RegisterClass(TfrmConfiguraDuplicata);
finalization
  UnRegisterClass(TfrmConfiguraDuplicata);
end.
