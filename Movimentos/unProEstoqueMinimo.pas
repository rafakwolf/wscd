unit unProEstoqueMinimo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, Provider, SqlExpr, Grids, DBGrids,
  StdCtrls, Buttons, FMTBcd, uniGUIBaseClasses, uniGUIClasses, uniButton,
  uniBitBtn, uniGuiForm, uniBasicGrid, uniDBGrid;

type
  TfrmProEstoqueMinimo = class(TUniForm)
    dspProdEM: TDataSetProvider;
    cdsProdEM: TClientDataSet;
    dsProdEM: TDataSource;
    sqlProdEM: TSQLDataSet;
    sqlProdEMCOD_BARRA: TStringField;
    sqlProdEMPRO_DESCRICAO: TStringField;
    sqlProdEMPRO_ESTOQUE: TIntegerField;
    sqlProdEMQTDE_MINIMA: TIntegerField;
    sqlProdEMFORNECEDOR: TStringField;
    cdsProdEMCOD_BARRA: TStringField;
    cdsProdEMPRO_DESCRICAO: TStringField;
    cdsProdEMPRO_ESTOQUE: TIntegerField;
    cdsProdEMQTDE_MINIMA: TIntegerField;
    cdsProdEMFORNECEDOR: TStringField;
    btnFechar: TUniBitBtn;
    btnZerarNegativo: TUniBitBtn;
    GradeProd: TUniDBGrid;
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnZerarNegativoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure GradeProdDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
  public
  end;

var
  frmProEstoqueMinimo: TfrmProEstoqueMinimo;

implementation

uses Funcoes, uDatabaseutils;

{$R *.dfm}

procedure TfrmProEstoqueMinimo.FormShow(Sender: TObject);
var
  i: Integer;
  FSQL: string;
begin
  i := FormRadioButtons('Estoque negativo, Menor que o mínimo', 'Seleção', 1);

  if i = -1 then
  begin
    PostMessage(Handle, WM_CLOSE, 0, 0);
    Exit;
  end;

  btnZerarNegativo.Enabled := i = 0;

  case i of
    0: FSQL := sqlProdEM.CommandText+' where (PRO_ESTOQUE < 0) order by PRO_ESTOQUE desc';
    1: FSQL := sqlProdEM.CommandText+' where (PRO_ESTOQUE >= 0) and (PRO_ESTOQUE < QTDE_MINIMA) order by PRO_ESTOQUE desc';
  end;
  
  cdsProdEM.Close;
  cdsProdEM.CommandText := FSQL;
  cdsProdEM.Open;

  if cdsProdEM.IsEmpty then
  begin
    MsgErro('Nenhum registro encontrado.');
    PostMessage(Handle, WM_CLOSE, 0, 0);
  end;
end;

procedure TfrmProEstoqueMinimo.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmProEstoqueMinimo.btnZerarNegativoClick(Sender: TObject);
begin
  try
    if MsgSN('Deseja realmente zerar o estoque que está negativo?') then
    begin
      UpdateSingleField('UPDATE PRODUTOS SET ESTOQUE = 0 WHERE (ESTOQUE < 0)');
      MsgAviso('Estoque alterado com sucesso.');
      ReabreDataSet(cdsProdEM);
      Close;
    end;
  except
    raise Exception.Create('Erro alterando estoque');
  end;
end;

procedure TfrmProEstoqueMinimo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmProEstoqueMinimo.FormCreate(Sender: TObject);
begin
  CentralizaForm(Self);
end;

procedure TfrmProEstoqueMinimo.GradeProdDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  //GridZebrado(cdsProdEM.RecNo, GradeProd, Rect, DataCol, Column, State);
end;

procedure TfrmProEstoqueMinimo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Escape then
    Close;
  if Key = Vk_F1 then
    ChamaHelp(Self, 72,'');
end;

initialization
  RegisterClass(TfrmProEstoqueMinimo);
finalization
  UnRegisterClass(TfrmProEstoqueMinimo);
end.
