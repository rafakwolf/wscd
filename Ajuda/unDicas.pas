unit unDicas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons,
  Math, ConstPadrao, unSimplePadrao, uniGUIBaseClasses, uniGUIClasses,
  uniButton, uniBitBtn, uniCheckBox, uniMemo;

type
  TfrmDicas = class(TfrmSimplePadrao)
    btnFecha: TUniBitBtn;
    btnNext: TUniBitBtn;
    btnPrior: TUniBitBtn;
    cbExibir: TUniCheckBox;
    mDica: TUniMemo;
    procedure btnFechaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNextClick(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
  private
    procedure Manipula(Dica: Integer);
    procedure LeExibir;
    procedure GravaExibir;
  public
  end;

var
  frmDicas: TfrmDicas;
  i: Integer;

implementation

uses Funcoes, VarGlobal;

{$R *.dfm}

procedure TfrmDicas.btnFechaClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmDicas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_escape then
    Close;
end;

procedure TfrmDicas.FormShow(Sender: TObject);
var
  R: Integer;
begin
  i := 1;
  Randomize;
  R := RandomRange(1, 14);
  Manipula(R);
  LeExibir;
end;

procedure TfrmDicas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GravaExibir;
  Action := caFree;
end;

procedure TfrmDicas.Manipula(Dica: Integer);
begin
  mDica.Lines.Clear;
//  case Dica of
//    1: mDica.Lines.Text := D_NOBREAK;
//    2: mDica.Lines.Text := D_LETRAS;
//    3: mDica.Lines.Text := D_ORDENAR;
//    4: mDica.Lines.Text := D_DESLIGAMENTO;
//    5: mDica.Lines.Text := D_GRUPOSPRODUTOS;
//    6: mDica.Lines.Text := D_CLIANIVERSARIANTES;
//    7: mDica.Lines.Text := D_USUARIOS;
//    8: mDica.Lines.Text := D_MENU;
//    9: mDica.Lines.Text := D_TECLAS;
//    10: mDica.Lines.Text := D_AGENDA;
//   11: mDica.Lines.Text := D_COMPUTADOR;
//   12: mDica.Lines.Text := D_BUG;
//   13: mDica.Lines.Text := D_ESTOQUE;
//   14: mDica.Lines.Text := D_BACKUP;
//  end;
end;

procedure TfrmDicas.btnNextClick(Sender: TObject);
begin
  if i = 14 then
    i := 1;
  Inc(i);
  Manipula(i);
end;

procedure TfrmDicas.btnPriorClick(Sender: TObject);
begin
  if i = 1 then
    i := 14;
  Dec(i);
  Manipula(i);
end;

procedure TfrmDicas.GravaExibir;
var
  sn: string;
begin
  if cbExibir.Checked then sn := 'S'
  else sn := 'N';
  //UpdateSingleField('update CONFIGURACAO set EXIBEDICADIA = '+QuotedStr(sn), GetConnection);
end;

procedure TfrmDicas.LeExibir;
begin
//  cbExibir.Checked :=
//    SelectSingleField('select EXIBEDICADIA from CONFIGURACAO', GetConnection) = 'S';
end;

initialization
  RegisterClass(TfrmDicas);
finalization
  UnRegisterClass(TfrmDicas);
end.

