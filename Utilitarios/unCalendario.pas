unit unCalendario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, Calendar, Spin, ComCtrls, Mask, Buttons,
  unSimplePadrao, uniGUIBaseClasses, uniGUIClasses, uniButton, uniBitBtn,
  uniSpeedButton, uniPanel, uniLabel, uniEdit, uniSpinEdit, uniCalendar;

type
  TfrmCalendario = class(TfrmSimplePadrao)
    PanelDias: TUniContainerPanel;
    PanelMes: TUniContainerPanel;
    PanelExtra: TUniContainerPanel;
    PnBotoes: TUniContainerPanel;
    Futura: TUniSpeedButton;
    Calculo: TUniSpeedButton;
    btnHoje: TUniSpeedButton;
    LbTitulo: TUniLabel;
    LbDias: TUniLabel;
    LbPeriodo: TUniLabel;
    LbTDias: TUniLabel;
    LbTMeses: TUniLabel;
    LbTAnos: TUniLabel;
    BtnOk: TUniBitBtn;
    Dt_i: TUniEdit;
    Dt_f: TUniEdit;
    GetAno: TUniSpinEdit;
    EdDias: TUniEdit;
    EdR_Dias: TUniEdit;
    EdR_Meses: TUniEdit;
    EdR_Anos: TUniEdit;
    VCalend: TUniCalendar;
    procedure FormShow(Sender: TObject);
    procedure GetAnoChange(Sender: TObject);
    procedure AlternaMesClick(Sender: TObject; Button: TUDBtnType);
    procedure FuturaClick(Sender: TObject);
    procedure CalculoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EdDiasExit(Sender: TObject);
    procedure Dt_fExit(Sender: TObject);
    procedure VCalendClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnHojeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    
    function PegaMes(Var Mes : Word) : String;
    procedure AtribuiData;
    procedure TamanhoNatural;
  public
    
  end;

var
  frmCalendario: TfrmCalendario;
  Data: TDate;
  Dia, Mes, Ano: Word;

implementation

uses
  Funcoes;

{$R *.DFM}

function ConstStr(Ch: string; N: byte): string;
var
  St: String;
  I: Integer;
begin
  St := '';
  for I:=0 to N-1 do
    St := St + Ch;
  Result := Copy(St, 1, N);
end;

function StrZero(N: integer; Tamanho: integer): string;
var
  Conteudo: string;
  Diferenca: Integer;
begin
  Conteudo := IntToStr( N );
  Diferenca := Tamanho - Length( Conteudo );
  if Diferenca > 0 then
    Conteudo := ConstStr( '0', Diferenca ) + Conteudo;
  StrZero := Conteudo;
end;

function UltimoDiaDoMes( MesAno: string ): string;
var
  sMes: string;
  sAno: string;
begin
  sMes := Copy( MesAno, 1, 2 );
  sAno := Copy( MesAno, 3, 4 );
  if Pos( sMes, '01 03 05 07 08 10 12' ) > 0 then
    UltimoDiaDoMes := '31'
  else
    if sMes <> '02' then
      UltimoDiaDoMes := '30'
    else
      if ( StrToInt( sAno ) mod 4 ) = 0 then
        UltimoDiaDoMes := '29'
      else
        UltimoDiaDoMes := '28';
end;

procedure TfrmCalendario.FormShow(Sender: TObject);
begin
  TamanhoNatural;
  DecodeDate( Now, Ano, Mes, Dia );
  AtribuiData;
end;

procedure TfrmCalendario.TamanhoNatural;
begin
  PanelExtra.Visible := False;
  Height := 205;
end;

function TfrmCalendario.PegaMes(Var Mes : Word) : String;
begin
  case Mes of
    1 : Result := 'Janeiro';
    2 : Result := 'Fevereiro';
    3 : Result := 'Março';
    4 : Result := 'Abril';
    5 : Result := 'Maio';
    6 : Result := 'Junho';
    7 : Result := 'Julho';
    8 : Result := 'Agosto';
    9 : Result := 'Setembro';
   10 : Result := 'Outubro';
   11 : Result := 'Novembro';
   12 : Result := 'Dezembro';
  end;
end;

procedure TfrmCalendario.GetAnoChange(Sender: TObject);
begin
  Ano := GetAno.Value;
  AtribuiData;
end;

procedure TfrmCalendario.AlternaMesClick(Sender: TObject;
  Button: TUDBtnType);
begin
  if Button = btNext then
    Mes := Mes + 1
  else if Button = btPrev then
    Mes := Mes - 1;
  if Mes > 12 then
  begin
    Mes := 01;
    Ano := Ano + 01;
  end;
  if Mes < 01 then
  begin
    Mes := 12;
    Ano := Ano - 01;
  end;
  AtribuiData;
end;

procedure TfrmCalendario.AtribuiData;
Var
  UltDia: Integer;
begin
  UltDia := StrToInt(UltimoDiadoMes(StrZero(Mes,02)+IntToStr(Ano)));
  if Dia > UltDia then
    Dia := UltDia;

  GetAno.Value  := Ano;
  PanelMes.Caption := PegaMes(Mes);
end;

procedure TfrmCalendario.FuturaClick(Sender: TObject);
begin
  BtnOk.Visible     := False;
  LbPeriodo.Visible := False;
  Dt_I.Visible      := False;
  Dt_F.Visible      := False;
  LbTDias.Visible   := False;
  LbTMeses.Visible  := False;
  LbTAnos.Visible   := False;
  EdR_Dias.Visible  := False;
  EdR_Meses.Visible := False;
  EdR_Anos.Visible  := False;
  LbDias.Visible    := True;
  EdDias.Visible    := True;
  Height            := 320;
  PanelExtra.Visible:= True;
  LbTitulo.Caption  := 'Data Futura';
  EdDias.Text       := '0';
  EdDias.SetFocus;
  EdDias.SelectAll;
end;

procedure TfrmCalendario.CalculoClick(Sender: TObject);
begin
  OnCanResize := nil;
  EdDias.OnExit := nil;
  BtnOk.Visible     := True;
  LbTDias.Visible   := True;
  LbTMeses.Visible  := True;
  LbTAnos.Visible   := True;
  EdR_Dias.Visible  := True;
  EdR_Meses.Visible := True;
  EdR_Anos.Visible  := True;
  LbPeriodo.Visible := True;
  Dt_I.Visible      := True;
  Dt_F.Visible      := True;
  LbDias.Visible    := False;
  EdDias.Visible    := False;
  Height            := 320;
  PanelExtra.Visible:= True;
  LbTitulo.Caption  := 'Cálculo entre Datas';
  Dt_I.Text         := DateToStr(VCalend.CalendarDate);
  Dt_F.Text         := Dt_I.Text;
  EdR_Dias.Text     := '';
  EdR_Meses.Text    := '';
  EdR_Anos.Text     := '';
  Dt_I.SetFocus;
  Dt_F.SelectAll;
  EdDias.OnExit := EdDiasExit;
end;

procedure TfrmCalendario.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = Chr(27)) then
    Close;
  if Key = Chr(13) then
  begin
    Perform(WM_NextDlgCtl, 0, 0);
    Key := #0;
  end;
end;

procedure TfrmCalendario.EdDiasExit(Sender: TObject);
var
  Numero: Integer;
begin
  Numero:=StrToIntDef(Trim(EdDias.Text),0);
  DecodeDate( VCalend.CalendarDate + Numero, Ano, Mes, Dia );
  AtribuiData;
  TamanhoNatural;
end;

procedure TfrmCalendario.Dt_fExit(Sender: TObject);
begin {
  if not DataValida(Dt_I.Text) then
  begin
    MessageDlg('Data Inicial Inválida !',mtInformation,[MbOk],0);
    Dt_I.SetFocus;
    Dt_I.SelectAll;
    Abort;
  end;
  if not DataValida(Dt_F.Text) then
  begin
    MessageDlg('Data Final Inválida !',mtInformation,[MbOk],0);
    Dt_F.SetFocus;
    Dt_F.SelectAll;
    Abort;
  end;
  EdR_Dias.Text  := FloatToStr(Round(StrToDate(Dt_f.Text) - StrToDate(Dt_I.Text)));
  EdR_Meses.Text := FloatToStr(Round((StrToDate(Dt_f.Text) - StrToDate(Dt_I.Text))/30));
  EdR_Anos.Text  := FloatToStr(Round((StrToDate(Dt_f.Text) - StrToDate(Dt_I.Text))/364));}
end;

procedure TfrmCalendario.VCalendClick(Sender: TObject);
begin
  TamanhoNatural;
end;

procedure TfrmCalendario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmCalendario.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmCalendario.btnHojeClick(Sender: TObject);
begin
  VCalend.CalendarDate := Now;
end;

procedure TfrmCalendario.FormCreate(Sender: TObject);
begin
  CentralizaForm(Self);
end;

initialization
  RegisterClass(TfrmCalendario);
finalization
  UnRegisterClass(TfrmCalendario);
end.
