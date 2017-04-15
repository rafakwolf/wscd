unit unRelatorioCaixaMensal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unDialogoRelatorioPadrao, StdCtrls, Buttons, ExtCtrls, DB, DateUtils;

type
  TfrmRelatorioCaixaMensal = class(TfrmDialogoRelatorioPadrao)
    rgOrd: TRadioGroup;
    edtMes: TEdit;
    edtAno: TEdit;
    procedure btnImprimirClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtMesExit(Sender: TObject);
    procedure edtAnoExit(Sender: TObject);
  private
    procedure Imprimir(p: Boolean);
  public
    sql: String;
  end;

var
  frmRelatorioCaixaMensal: TfrmRelatorioCaixaMensal;

implementation

uses
  Funcoes, unPrevRelCaixa, uConfiguraRelatorio, System.StrUtils;

{$R *.dfm}

procedure TfrmRelatorioCaixaMensal.Imprimir(p: Boolean);
begin
  SQL := 'SELECT * FROM STPRELCAIXAMESANO (:MES, :ANO, :PORDEM) order by DATA, TIPO';

  with TfrmPrevRelCaixa.Create(nil) do
  try
    with cdsPadrao do
    begin
      Close;
      CommandText := SQL;
      Params.ParamByName('MES').AsInteger   := StrToInt(edtmes.Text);
      Params.ParamByName('ANO').AsInteger   := StrToInt(edtAno.Text);
      Params.ParamByName('PORDEM').AsString := IfThen(rgOrd.ItemIndex = 0, 'L', 'D');
      Open;
    end;
    TituloRel := 'Caixa do mês '+edtMes.Text+' de '+edtAno.Text;
    PrintIfNotEmptyRL(rrPadrao, p);
  finally
    Free;
  end;
end;

procedure TfrmRelatorioCaixaMensal.btnImprimirClick(Sender: TObject);
begin
  inherited;
  Imprimir(True);
end;

procedure TfrmRelatorioCaixaMensal.btnVisualizarClick(Sender: TObject);
begin
  inherited;
  Imprimir(False);    
end;

procedure TfrmRelatorioCaixaMensal.FormCreate(Sender: TObject);
begin
  inherited;
  edtMes.Text := IntToStr(MonthOf(Date));
  edtAno.Text := IntToStr(YearOf(Date));
end;

procedure TfrmRelatorioCaixaMensal.edtMesExit(Sender: TObject);
var
  Mes: Integer;
begin
  inherited;
  Mes := StrToIntDef(edtMes.Text,MonthOf(Date));

  if edtMes.Text <> '' then
  begin
    if (Mes < 1) or (Mes > 12) then
    begin
      MsgAviso('Mês deve estar entre 1 e 12.');
      edtMes.Clear;
      edtMes.SetFocus;
      Exit;
    end;
  end;
  edtMes.Text := IntToStr(Mes);
end;

procedure TfrmRelatorioCaixaMensal.edtAnoExit(Sender: TObject);
var
  Ano: Integer;
begin
  inherited;
  Ano         := StrToIntDef(edtAno.Text,YearOf(Date));
  edtAno.Text := IntToStr(Ano);
end;

initialization
  RegisterClass(TfrmRelatorioCaixaMensal);
finalization
  UnRegisterClass(TfrmRelatorioCaixaMensal);
end.
