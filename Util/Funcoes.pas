unit Funcoes;

interface

uses
  System.Classes, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Clipbrd,  DateUtils,
  UITypes, System.SysUtils, Vcl.Buttons, Vcl.Controls, Data.DB, dbclient;

function ChamaForm(pClass, pTitle: string; pOwner: TComponent): TForm;
procedure CentralizaForm(form: TForm);
procedure ChamaHelp(pOwner: TComponent; index: Integer; title: string);
procedure FormMemo(ds: TDataSource; fieldName: string);
function FormRadioButtons(radios, title: string; def: Integer = 0): Integer;
function ObterDatas(var d1, d2: string): boolean; overload;
function ObterData(var data: string): boolean; overload;
function NomeMes(mes: integer): string; overload;
function NomeMes(data: TDateTime): string; overload;
function DiaSemana(data: TDateTime): string;
function ObterValor(ValorDinheiro: Real; default, title: string): boolean;
function PassWord(password, passwordChar: string) : boolean;

function ModoInsertEdit(cds: TClientDataset): boolean;
function ModoInsert(cds: TClientDataset): boolean;
procedure ReabreDataset(cds: TClientDataSet);

procedure MsgCuidado(title, msg: string); overload;
procedure MsgAviso(title, msg: string); overload;
procedure MsgErro(title, msg: string); overload;

procedure MsgCuidado(msg: string); overload;
procedure MsgAviso(msg: string); overload;
procedure MsgErro(msg: string); overload;

function MsgSN(msg: string): Boolean;
function MessageDlgCheck(Msg: string; AType: TMsgDlgType; AButtons:
  TMsgDlgButtons;
  IndiceHelp: LongInt; DefButton: TMOdalResult; Portugues: Boolean; Checar:
  Boolean; MsgCheck: string; Funcao: TProcedure): Word;

procedure ReordenaBotoes(btns: array of TSpeedButton); overload;
procedure ReordenaBotoes(btns: array of TBitBtn); overload;
procedure SetDialogForm(form: TForm);
procedure SetFocusIfCan(ctrl: TWinControl);

function FieldIsNumeric(f: TField): boolean;
function FieldIsDateTime(f: TField): boolean;
function FieldIsString(f: TField): boolean;
function UpdatesPending(cds: TClientDataSet; form: TForm): boolean;
function Locate(cds: TClientDataSet; field: TField; value: string): boolean;
procedure Filtro(cds: TClientDataset; field, value:string);
function ValidaFieldsVazios(fields: array of TField;
    labels: array of string): string;

function ClearMask(v: string): string;
function IsDateTime(v: Variant): boolean;
function IsNumeric(v: Variant): boolean;
function FirstUpper(s: string): string;
function FormatDateFirebird(d: TDateTime): string;
function ValidaCpf(cpf: string): boolean;

function GetTableNameFromSQLText(TextoSQL: string): string;

procedure ToClipBoard(s: string);

function DiretorioComBarra(d: string): string;
function TiraUnderline(s: string): string;
function CentralizaTexto(str: string; cols: Integer): string;
function ReplicateStr(s: string; x: Integer): string;
function NormalizeStr(s: string): string;

procedure WriteIniFile(section, nome, value: string);
function ReadIniFile(section, nome: string): string;

procedure PostMessageAllForms(msg: Cardinal; form: TForm = nil);

function GeraCodigoEAN13(value: string): string;
function VerificaEAN13(codigo: string): boolean;

function Idade(dataNasc: TDateTime): Integer;

implementation

uses
  System.Variants, IniFiles, Winapi.Windows;

function UpdatesPending(cds: TClientDataSet; form: TForm): boolean;
begin
  Result := cds.ChangeCount > 0;
end;

function Locate(cds: TClientDataSet; field: TField; value: string): boolean;
begin

end;

procedure Filtro(cds: TClientDataset; field, value:string);
begin

end;

function ValidaFieldsVazios(fields: array of TField;
    labels: array of string): string;
begin

end;

function FormatDateFirebird(d: TDateTime): string;
begin
  Result := FormatDateTime('yyyy.MM.dd',d);
end;

function NomeMes(mes: integer): string;
var n: string;
begin
  Case mes Of
    01 : n:= 'Janeiro';
    02 : n:= 'Fevereiro';
    03 : n:= 'Março';
    04 : n:= 'Abril';
    05 : n:= 'Maio';
    06 : n:= 'Junho';
    07 : n:= 'Julho';
    08 : n:= 'Agosto';
    09 : n:= 'Setembro';
    10 : n:= 'Outubro';
    11 : n:= 'Novembro';
    12 : n:= 'Dezembro';
  End;
  Result := n;
end;

function NomeMes(data: TDateTime): string;
begin
  Result := NomeMes(MonthOf(data));
end;

function DiaSemana(data: TDateTime): string;
var s: string;
begin
  case DayOfWeek(data) of
    1: s := 'domingo';
    2: s := 'segunda-feira';
    3: s := 'terça-feira';
    4: s := 'quarta-feira';
    5: s := 'quinta-feira';
    6: s := 'sexta-feira';
    7: s := 'sábado';
  end;
end;

function ModoInsertEdit(cds: TClientDataset): boolean;
begin
  Result := cds.State in dsEditModes;
end;

function ModoInsert(cds: TClientDataset): boolean;
begin
   Result := cds.State in [dsInsert];
end;

procedure ReabreDataset(cds: TClientDataSet);
begin
  cds.Close;
  cds.Open;
end;

function DiretorioComBarra(d: string): string;
begin
  Result := IncludeTrailingPathDelimiter(d);
end;

function TiraUnderline(s: string): string;
begin
  Result := s.Replace('_','');
end;

function CentralizaTexto(str: string; cols: Integer): string;
begin
  Result := str; //TODO: resolver
end;

function ReplicateStr(s: string; x: Integer): string;
begin
  Result := s; //TODO: resolver
end;

function NormalizeStr(s: string): string;
begin
  Result := s; // TODO: resolver
end;

procedure PostMessageAllForms(msg: Cardinal; form: TForm = nil);
var I: Integer;
begin
  if form = nil then
   form := Application.MainForm;

  for I := 0 to form.MDIChildCount-1 do
    PostMessage(form.Handle,msg,0,0);
end;

function ReadIniFile(section, nome: string): string;
begin
  with TIniFile.Create(ExtractFilePath(Paramstr(0))+'cfg.ini')do try
    Result := readstring(section,nome,'');
  finally
    free;
  end;
end;

procedure WriteIniFile(section, nome, value: string);
begin
  with TIniFile.Create(ExtractFilePath(Paramstr(0))+'cfg.ini')do try
    writestring(section,nome,value);
  finally
    free;
  end;
end;

function GetTableNameFromSQLText(TextoSQL: string): string;
var
  x, PosFrom: Integer;
  SQL, SQLResult, Str: string;
begin

  x := 0;
  Str := '';

  for x := 1 to Length(TextoSQL) do
  begin
    if ((TextoSQL[x] = #13) or (TextoSQL[x] = #10)) then
      Str := Str + ' '
    else
      Str := Str + TextoSQL[x];
  end;

  Str := AnsiUpperCase(Str);

  PosFrom := Pos('FROM ', Str);

  SQL := '';
  SQL := Copy(Str, PosFrom + 5, Length(Str));

  SQL := Trim(SQL);

  x := 0;

  for x := 1 to Length(SQL) do
  begin
    if ((SQL[x] <> ' ')and { espaço }
        (SQL[x] <> ',')and { vírgula }
        (SQL[x] <> #13)and { quebra de linha }
        (SQL[x] <> #10)) then { quebra de linha }
      SQLResult := SQLResult + SQL[x]
    else
      Break;
  end;

  Result := Trim(AnsiUpperCase(SQLResult));
end;

function FirstUpper(s: string): string;
begin
  Result := Copy(s,1,1) + copy(s,2, length(s));
end;

procedure ToClipBoard(s: string);
begin
   Clipboard.SetTextBuf(PWideChar(s));
end;

function IsNumeric(v: Variant): boolean;
var f: Double;
    i: Integer;
begin
   Result := TryStrToInt(VarToStr(v),i) or TryStrToFloat(VarToStr(v), f);
end;

function IsDateTime(v: Variant): boolean;
var d: TDateTime;
begin
  Result := TryStrToDate(VarTostr(v),d);
end;

function ClearMask(v: string): string;
begin
  v := v.Replace('/','').
         Replace('.','').
         Replace(',','').
         Replace('-','');
end;

function FieldIsString(f: TField): boolean;
begin
   Result :=
    (f.DataType = TFieldType.ftString) or
    (f.DataType = TFieldType.ftWideString) or
    (f.DataType = TFieldType.ftWideMemo) or
    (f.DataType = TFieldType.ftMemo) or
    (f.DataType = TFieldType.ftFixedChar) or
    (f.DataType = TFieldType.ftFixedWideChar);
end;

function FieldIsDateTime(f: TField): boolean;
begin
   Result :=
    (f.DataType = TFieldType.ftDate) or
    (f.DataType = TFieldType.ftDateTime);
end;

function FieldIsNumeric(f: TField): boolean;
begin
  Result :=
    (f.DataType = TFieldType.ftSmallint) or
    (f.DataType = TFieldType.ftInteger) or
    (f.DataType = TFieldType.ftFloat) or
    (f.DataType = TFieldType.ftCurrency) or
    (f.DataType = TFieldType.ftLargeint);
end;

procedure SetFocusIfCan(ctrl: TWinControl);
begin
  if ctrl.Visible then
     ctrl.SetFocus;
end;

procedure ReordenaBotoes(btns: array of TBitBtn);
var I: Integer;
begin
  for I := 0 to Length(btns)-1 do
  begin
    if i = 0 then
      btns[i].Left := 1
    else
      btns[i].Left := btns[i-1].Left + btns[i-1].Width + 1;
  end;
end;

procedure ReordenaBotoes(btns: array of TSpeedButton);
var I: Integer;
begin
  for I := 0 to Length(btns)-1 do
  begin
    if i = 0 then
      btns[i].Left := 1
    else
      btns[i].Left := btns[i-1].Left + btns[i-1].Width + 1;
  end;
end;

procedure SetDialogForm(form: TForm);
begin
  form.BorderStyle := TFormBorderStyle.bsDialog;
end;

function ChamaForm(pClass, pTitle: string; pOwner: TComponent): TForm;
var formClass: TFormClass;
begin
  formClass := TFormClass(GetClass(pClass));
  Result := formClass.Create(pOwner);
  Result.Show;
end;

procedure CentralizaForm(form: TForm);
begin
  form.Position := TPosition.poScreenCenter;
end;

function ObterDatas(var d1, d2: string): boolean;
begin
  // TODO: implementar
end;

function ObterData(var data: string): boolean;
begin
//TODO: implementar
end;

procedure MsgCuidado(title, msg: string);
begin
   MessageDlg(msg,TMsgDlgType.mtWarning,[TMsgDlgBtn.mbOK],0);
end;

procedure MsgAviso(title, msg: string);
begin
   MessageDlg(msg,TMsgDlgType.mtInformation,[TMsgDlgBtn.mbOK],0);
end;

procedure MsgErro(title, msg: string);
begin
    MessageDlg(msg,TMsgDlgType.mtError,[TMsgDlgBtn.mbOK],0);
end;

procedure MsgCuidado(msg: string);
begin
   MsgCuidado('',msg);
end;

procedure MsgAviso(msg: string);
begin
  MsgAviso('',msg);
end;

procedure MsgErro(msg: string);
begin
  MsgErro('',msg);
end;

function MsgSN(msg: string): Boolean;
begin
  Result := MessageDlg(msg,TMsgDlgType.mtConfirmation,[TMsgDlgBtn.mbYes,TMsgDlgBtn.mbNo],0) = 1;
end;

procedure ChamaHelp(pOwner: TComponent; index: Integer; title: string);
begin
  raise Exception.Create('not implemented.');
end;

function MessageDlgCheck(Msg: string; AType: TMsgDlgType; AButtons:
TMsgDlgButtons;
IndiceHelp: LongInt; DefButton: TMOdalResult; Portugues: Boolean; Checar:
Boolean; MsgCheck: string; Funcao: TProcedure): Word;
var
I: Integer;
Mensagem: TForm;
Check: TCheckBox;
begin
Check := nil;
Mensagem := CreateMessageDialog(Msg, AType, Abuttons);
Mensagem.HelpContext := IndiceHelp;
with Mensagem do
begin
for i := 0 to ComponentCount - 1 do
begin
if (Components[i] is TButton) then
begin
if (TButton(Components[i]).ModalResult = DefButton) then
begin
ActiveControl := TWincontrol(Components[i]);
end;
end;
end;
if Portugues then
begin
if Atype = mtConfirmation then
Caption := 'Confirmação'
else if AType = mtWarning then
Caption := 'Aviso'
else if AType = mtError then
Caption := 'Erro'
else if AType = mtInformation then
Caption := 'Informação';
end;
end;
if Portugues then
begin
TButton(Mensagem.FindComponent('YES')).Caption := '&Sim';
TButton(Mensagem.FindComponent('NO')).Caption := '&Não';
TButton(Mensagem.FindComponent('CANCEL')).Caption := '&Cancelar';
TButton(Mensagem.FindComponent('ABORT')).Caption := '&Abortar';
TButton(Mensagem.FindComponent('RETRY')).Caption := '&Repetir';
TButton(Mensagem.FindComponent('IGNORE')).Caption := '&Ignorar';
TButton(Mensagem.FindComponent('ALL')).Caption := '&Todos';
TButton(Mensagem.FindComponent('HELP')).Caption := 'A&juda';
end;
if Checar then
begin
Mensagem.ClientHeight := Mensagem.ClientHeight + 20;
Check := TCheckBox.Create(Mensagem);
Check.Parent := Mensagem;
Check.Left := 15;
Check.Top := Mensagem.ClientHeight - 20;
Check.Visible := True;
Check.Caption := MsgCheck;
Check.Width := Mensagem.ClientWidth - 10;
end;
Result := Mensagem.ShowModal;
if Check.Checked then
Funcao;
Mensagem.Free;
end;

procedure FormMemo(ds: TDataSource; fieldName: string);
begin
  raise Exception.Create('not implemented');
end;

function ValidaCpf(cpf: string):boolean;
var i:integer;
    Want:char;
    Wvalid:boolean;
    Wdigit1,Wdigit2:integer;
begin
    Wdigit1:=0;
    Wdigit2:=0;
    Want:=cpf[1];//variavel para testar se o cpf é repetido como 111.111.111-11
    Delete(cpf,ansipos('.',cpf),1);  //retira as mascaras se houver
    Delete(cpf,ansipos('.',cpf),1);
    Delete(cpf,ansipos('-',cpf),1);

   //testar se o cpf é repetido como 111.111.111-11
   for i:=1 to length(cpf) do
     begin
       if cpf[i] <> Want then
         begin
            Wvalid:=true;  // se o cpf possui um digito diferente ele passou no primeiro teste
            break
         end;
     end;
       // se o cpf é composto por numeros repetido retorna falso
     if not Wvalid then
       begin
          result:=false;
          exit;
       end;

     //executa o calculo para o primeiro verificador
     for i:=1 to 9 do
       begin
          wdigit1:=Wdigit1+(strtoint(cpf[10-i])*(I+1));
       end;
        Wdigit1:= ((11 - (Wdigit1 mod 11))mod 11) mod 10;
        {formula do primeiro verificador
            soma=1°*2+2°*3+3°*4.. até 9°*10
            digito1 = 11 - soma mod 11
            se digito > 10 digito1 =0
          }

         //verifica se o 1° digito confere
        if IntToStr(Wdigit1) <> cpf[10] then
          begin
             result:=false;
             exit;
          end;


         for i:=1 to 10 do
       begin
          wdigit2:=Wdigit2+(strtoint(cpf[11-i])*(I+1));
       end;
       Wdigit2:= ((11 - (Wdigit2 mod 11))mod 11) mod 10;
         {formula do segundo verificador
            soma=1°*2+2°*3+3°*4.. até 10°*11
            digito1 = 11 - soma mod 11
            se digito > 10 digito1 =0
          }

       // confere o 2° digito verificador
       if IntToStr(Wdigit2) <> cpf[11] then
          begin
             result:=false;
             exit;
          end;

   //se chegar até aqui o cpf é valido
   result:=true;
end;

function FormRadioButtons(radios, title: string; def: Integer = 0): Integer;
begin
  //TODO: Implementar
end;

function ObterValor(ValorDinheiro: Real; default, title: string): boolean;
begin
  //TODO: implementar
end;

function GeraCodigoEAN13(value: string): string;
begin
  //TODO: implementar
end;

function VerificaEAN13(codigo: string): boolean;
begin
   //TODO: implementar
end;

function Idade(dataNasc: TDateTime): Integer;
begin
  Result := YearsBetween(Now,dataNasc);
end;

function PassWord(password, passwordChar: string) : boolean;
begin
   //TODO: implementar
end;

end.
