unit unProEstoqueMinimo;

interface

uses
   Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, memds,  SqlDb, Grids, DBGrids,
  StdCtrls, Buttons, FMTBcd, lcltype;

type
  TfrmProEstoqueMinimo = class(TForm)
    dspProdEM: TComponent;
    cdsProdEM: TMemDataSet;
    dsProdEM: TDataSource;
    sqlProdEM: TSQLQuery;
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
    btnFechar: TBitBtn;
    btnZerarNegativo: TBitBtn;
    GradeProd: TDBGrid;
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
  i := FormRadioButtons('Estoque negativo, Menor que o m�nimo', 'Sele��o', 1);

  if i = -1 then
  begin
    //PostMessage(Handle, WM_CLOSE, 0, 0);
    Exit;
  end;

  btnZerarNegativo.Enabled := i = 0;

  case i of
    0: FSQL := sqlProdEM.SQL.text+' where (PRO_ESTOQUE < 0) order by PRO_ESTOQUE desc';
    1: FSQL := sqlProdEM.SQL.text+' where (PRO_ESTOQUE >= 0) and (PRO_ESTOQUE < QTDE_MINIMA) order by PRO_ESTOQUE desc';
  end;
  
  cdsProdEM.Close;
  cdsProdEM.SQL.Clear; SQL.Text :=FSQL;
  cdsProdEM.Open;

  if cdsProdEM.IsEmpty then
  begin
    MsgErro('Nenhum registro encontrado.');
    //PostMessage(Handle, WM_CLOSE, 0, 0);
  end;
end;

procedure TfrmProEstoqueMinimo.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmProEstoqueMinimo.btnZerarNegativoClick(Sender: TObject);
begin
  try
    if MsgSN('Deseja realmente zerar o estoque que est� negativo?') then
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
