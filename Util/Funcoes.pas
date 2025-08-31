unit Funcoes;

interface

uses
  Classes, Forms, Dialogs, StdCtrls, Clipbrd, DateUtils,
  UITypes, SysUtils, Buttons, Controls, DB, memds, ZDataset;

function ChamaForm(pClass, pTitle: string; pOwner: TComponent): TForm;
procedure CentralizaForm(form: TForm);
procedure ChamaHelp(pOwner: TComponent; index: Integer; title: string);
procedure FormMemo(ds: TDataSource; fieldName: string);
function FormRadioButtons(radios, title: string; def: Integer = 0): Integer;
function ObterDatas(var d1, d2: string): boolean; overload;
function ObterData(var Data: string): boolean; overload;
function NomeMes(mes: Integer): string; overload;
function NomeMes(Data: TDateTime): string; overload;
function DiaSemana(Data: TDateTime): string;
function ObterValor(ValorDinheiro: Real; default, title: string): boolean;
function PassWord(PassWord, passwordChar: string): boolean;

function ModoInsertEdit(cds: TDataset): boolean;
function ModoInsert(cds: TDataset): boolean;
procedure ReabreDataset(cds: TDataSet);

procedure MsgCuidado(title, msg: string); overload;
procedure MsgAviso(title, msg: string); overload;
procedure MsgErro(title, msg: string); overload;

procedure MsgCuidado(msg: string); overload;
procedure MsgAviso(msg: string); overload;
procedure MsgErro(msg: string); overload;

function MsgSN(msg: string): boolean;
function MessageDlgCheck(msg: string; AType: TMsgDlgType;
  AButtons: TMsgDlgButtons; IndiceHelp: LongInt; DefButton: TMOdalResult;
  Portugues: boolean; Checar: boolean; MsgCheck: string;
  Funcao: TProcedure): Word;

procedure ReordenaBotoes(btns: array of TSpeedButton); overload;
procedure ReordenaBotoes(btns: array of TBitBtn); overload;
procedure SetDialogForm(form: TForm);
procedure SetFocusIfCan(ctrl: TWinControl);

function FieldIsNumeric(f: TField): boolean;
function FieldIsDateTime(f: TField): boolean;
function FieldIsString(f: TField): boolean;
function UpdatesPending(cds: TZQuery; form: TForm): boolean;
function Locate(cds: TDataSet; field: TField; value: string): boolean;
procedure Filtro(cds: TDataSet; field, value: string);
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
  Variants, IniFiles, ufmDatas;

function UpdatesPending(cds: TZQuery; form: TForm): boolean;
begin
  Result := cds.UpdatesPending;
end;

function Locate(cds: TDataSet; field: TField; value: string): boolean;
begin
  Result := cds.Locate(field.FieldName, value, []);
end;

procedure Filtro(cds: TDataSet; field, value: string);
begin
  cds.Filter := field + ' = ' + value;
  cds.Filtered := True;
end;

function ValidaFieldsVazios(fields: array of TField;
  labels: array of string): string;
begin

end;

function FormatDateFirebird(d: TDateTime): string;
begin
  Result := FormatDateTime('yyyy.MM.dd', d);
end;

function NomeMes(mes: Integer): string;
var
  n: string;
begin
  Case mes Of
    01:
      n := 'Janeiro';
    02:
      n := 'Fevereiro';
    03:
      n := 'Mar�o';
    04:
      n := 'Abril';
    05:
      n := 'Maio';
    06:
      n := 'Junho';
    07:
      n := 'Julho';
    08:
      n := 'Agosto';
    09:
      n := 'Setembro';
    10:
      n := 'Outubro';
    11:
      n := 'Novembro';
    12:
      n := 'Dezembro';
  End;
  Result := n;
end;

function NomeMes(Data: TDateTime): string;
begin
  Result := NomeMes(MonthOf(Data));
end;

function DiaSemana(Data: TDateTime): string;
var
  s: string;
begin
  case DayOfWeek(Data) of
    1:
      s := 'domingo';
    2:
      s := 'segunda-feira';
    3:
      s := 'terça-feira';
    4:
      s := 'quarta-feira';
    5:
      s := 'quinta-feira';
    6:
      s := 'sexta-feira';
    7:
      s := 'sábado';
  end;
end;

function ModoInsertEdit(cds: TDataset): boolean;
begin
  Result := cds.State in dsEditModes;
end;

function ModoInsert(cds: TDataset): boolean;
begin
  Result := cds.State in [dsInsert];
end;

procedure ReabreDataset(cds: TDataSet);
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
  Result := s.Replace('_', '');
end;

function CentralizaTexto(str: string; cols: Integer): string;
begin
  Result := str; // TODO: resolver
end;

function ReplicateStr(s: string; x: Integer): string;
begin
  Result := s; // TODO: resolver
end;

function NormalizeStr(s: string): string;
begin
  Result := s; // TODO: resolver
end;

procedure PostMessageAllForms(msg: Cardinal; form: TForm = nil);
//var
//  I: Integer;
begin
  // if form = nil then
  // form := Application.MainForm;
  //
  // for I := 0 to form.MDIChildCount-1 do
  // PostMessage(form.Handle,msg,0,0);
end;

function ReadIniFile(section, nome: string): string;
begin
  with TIniFile.Create(ExtractFilePath(Paramstr(0)) + 'cfg.ini') do
    try
      Result := readstring(section, nome, '');
    finally
      free;
    end;
end;

procedure WriteIniFile(section, nome, value: string);
begin
  with TIniFile.Create(ExtractFilePath(Paramstr(0)) + 'cfg.ini') do
    try
      writestring(section, nome, value);
    finally
      free;
    end;
end;

function GetTableNameFromSQLText(TextoSQL: string): string;
var
  x, PosFrom: Integer;
  SQL, SQLResult, str: string;
begin

  x := 0;
  str := '';

  for x := 1 to Length(TextoSQL) do
  begin
    if ((TextoSQL[x] = #13) or (TextoSQL[x] = #10)) then
      str := str + ' '
    else
      str := str + TextoSQL[x];
  end;

  str := AnsiUpperCase(str);

  PosFrom := Pos('FROM ', str);

  SQL := '';
  SQL := Copy(str, PosFrom + 5, Length(str));

  SQL := Trim(SQL);

  x := 0;

  for x := 1 to Length(SQL) do
  begin
    if ((SQL[x] <> ' ') and { espaço }
      (SQL[x] <> ',') and { virgula }
      (SQL[x] <> #13) and { quebra de linha }
      (SQL[x] <> #10)) then { quebra de linha }
      SQLResult := SQLResult + SQL[x]
    else
      Break;
  end;

  Result := Trim(AnsiUpperCase(SQLResult));
end;

function FirstUpper(s: string): string;
begin
  Result := Copy(s, 1, 1) + Copy(s, 2, Length(s));
end;

procedure ToClipBoard(s: string);
begin
  Clipboard.SetTextBuf(PChar(s));
end;

function IsNumeric(v: Variant): boolean;
var
  f: Double;
  I: Integer;
begin
  Result := TryStrToInt(VarToStr(v), I) or TryStrToFloat(VarToStr(v), f);
end;

function IsDateTime(v: Variant): boolean;
var
  d: TDateTime;
begin
  Result := TryStrToDate(VarToStr(v), d);
end;

function ClearMask(v: string): string;
begin
  v := v.Replace('/', '').Replace('.', '').Replace(',', '').Replace('-', '');
end;

function FieldIsString(f: TField): boolean;
begin
  Result := (f.DataType = TFieldType.ftString) or
    (f.DataType = TFieldType.ftWideString) or
    (f.DataType = TFieldType.ftWideMemo) or (f.DataType = TFieldType.ftMemo) or
    (f.DataType = TFieldType.ftFixedChar) or
    (f.DataType = TFieldType.ftFixedWideChar);
end;

function FieldIsDateTime(f: TField): boolean;
begin
  Result := (f.DataType = TFieldType.ftDate) or
    (f.DataType = TFieldType.ftDateTime);
end;

function FieldIsNumeric(f: TField): boolean;
begin
  Result := (f.DataType = TFieldType.ftSmallint) or
    (f.DataType = TFieldType.ftInteger) or (f.DataType = TFieldType.ftFloat) or
    (f.DataType = TFieldType.ftCurrency) or
    (f.DataType = TFieldType.ftLargeint);
end;

procedure SetFocusIfCan(ctrl: TWinControl);
begin
  if (ctrl <> nil) then
    begin
         if ctrl.Visible then
            ctrl.SetFocus;
    end;

end;

procedure ReordenaBotoes(btns: array of TBitBtn);
var
  I: Integer;
begin
  for I := 0 to Length(btns) - 1 do
  begin
    if I = 0 then
      btns[I].Left := 1
    else
      btns[I].Left := btns[I - 1].Left + btns[I - 1].Width + 1;
  end;
end;

procedure ReordenaBotoes(btns: array of TSpeedButton);
var
  I: Integer;
begin
  for I := 0 to Length(btns) - 1 do
  begin
    if I = 0 then
      btns[I].Left := 1
    else
      btns[I].Left := btns[I - 1].Left + btns[I - 1].Width + 1;
  end;
end;

procedure SetDialogForm(form: TForm);
begin
  form.BorderStyle := TFormBorderStyle.bsDialog;
end;

function ChamaForm(pClass, pTitle: string; pOwner: TComponent): TForm;
var
  formClass: TFormClass;
begin
  formClass := TFormClass(GetClass(pClass));

  if (formClass = nil) then raise Exception.Create('Classe '+pClass+' nao encontrada.');

  Result := formClass.Create(pOwner);
  Result.Caption := pTitle;
  Result.Show;
end;

procedure CentralizaForm(form: TForm);
begin
  form.Position := TPosition.poScreenCenter;
end;

function ObterDatas(var d1, d2: string): boolean;
begin
  with TfmDatas.create(nil) do
    try
       d1 := DateToStr(data1);
       d2 := DateToStr(Data2);
       ShowModal;
    finally;
      free;
    end;
end;

function ObterData(var Data: string): boolean;
begin
  // TODO: implementar
end;

procedure MsgCuidado(title, msg: string);
begin
  MessageDlg('Atenção',msg, TMsgDlgType.mtWarning, [mbOK], 0);
end;

procedure MsgAviso(title, msg: string);
begin
  MessageDlg('Aviso', msg, TMsgDlgType.mtInformation, [mbOK], 0);
end;

procedure MsgErro(title, msg: string);
begin
  MessageDlg('Error', msg, TMsgDlgType.mtError, [mbOK], 0);
end;

procedure MsgCuidado(msg: string);
begin
  MsgCuidado('', msg);
end;

procedure MsgAviso(msg: string);
begin
  MsgAviso('', msg);
end;

procedure MsgErro(msg: string);
begin
  MsgErro('', msg);
end;

function MsgSN(msg: string): boolean;
begin
  Result := MessageDlg('Confirmação', msg, TMsgDlgType.mtConfirmation,
    [mbYes, mbNo], 0) = 1;
end;

procedure ChamaHelp(pOwner: TComponent; index: Integer; title: string);
begin
  raise Exception.Create('not implemented.');
end;

function MessageDlgCheck(msg: string; AType: TMsgDlgType;
  AButtons: TMsgDlgButtons; IndiceHelp: LongInt; DefButton: TMOdalResult;
  Portugues: boolean; Checar: boolean; MsgCheck: string;
  Funcao: TProcedure): Word;
var
  I: Integer;
  Mensagem: TForm;
  Check: TCheckBox;
begin
  Check := nil;
  Mensagem := CreateMessageDialog(msg, AType, AButtons);
  Mensagem.HelpContext := IndiceHelp;
  with Mensagem do
  begin
    for I := 0 to ComponentCount - 1 do
    begin
      if (Components[I] is TButton) then
      begin
        if (TButton(Components[I]).ModalResult = DefButton) then
        begin
          ActiveControl := TWinControl(Components[I]);
        end;
      end;
    end;
    if Portugues then
    begin
      if AType = mtConfirmation then
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
    TButton(Mensagem.FindComponent('NO')).Caption := '&N�o';
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
  Mensagem.free;
end;

procedure FormMemo(ds: TDataSource; fieldName: string);
begin
  raise Exception.Create('not implemented');
end;

function ValidaCpf(cpf: string): boolean;
var
  I: Integer;
  Want: char;
  Wvalid: boolean;
  Wdigit1, Wdigit2: Integer;
begin
  Wdigit1 := 0;
  Wdigit2 := 0;
  Want := cpf[1];
  // variavel para testar se o cpf e repetido como 111.111.111-11
  Delete(cpf, ansipos('.', cpf), 1); // retira as mascaras se houver
  Delete(cpf, ansipos('.', cpf), 1);
  Delete(cpf, ansipos('-', cpf), 1);

  // testar se o cpf e repetido como 111.111.111-11
  for I := 1 to Length(cpf) do
  begin
    if cpf[I] <> Want then
    begin
      Wvalid := True;
      // se o cpf possui um digito diferente ele passou no primeiro teste
      Break
    end;
  end;
  // se o cpf e composto por numeros repetido retorna falso
  if not Wvalid then
  begin
    Result := false;
    exit;
  end;

  // executa o calculo para o primeiro verificador
  for I := 1 to 9 do
  begin
    Wdigit1 := Wdigit1 + (strtoint(cpf[10 - I]) * (I + 1));
  end;
  Wdigit1 := ((11 - (Wdigit1 mod 11)) mod 11) mod 10;
  { formula do primeiro verificador
    soma=1�*2+2�*3+3�*4.. at� 9�*10
    digito1 = 11 - soma mod 11
    se digito > 10 digito1 =0
  }

  // verifica se o 1� digito confere
  if IntToStr(Wdigit1) <> cpf[10] then
  begin
    Result := false;
    exit;
  end;

  for I := 1 to 10 do
  begin
    Wdigit2 := Wdigit2 + (strtoint(cpf[11 - I]) * (I + 1));
  end;
  Wdigit2 := ((11 - (Wdigit2 mod 11)) mod 11) mod 10;
  { formula do segundo verificador
    soma=1�*2+2�*3+3�*4.. at� 10�*11
    digito1 = 11 - soma mod 11
    se digito > 10 digito1 =0
  }

  // confere o 2� digito verificador
  if IntToStr(Wdigit2) <> cpf[11] then
  begin
    Result := false;
    exit;
  end;

  // se chegar at� aqui o cpf � valido
  Result := True;
end;

function FormRadioButtons(radios, title: string; def: Integer = 0): Integer;
begin
  // TODO: Implementar
end;

function ObterValor(ValorDinheiro: Real; default, title: string): boolean;
begin
  // TODO: implementar
end;

function GeraCodigoEAN13(value: string): string;
begin
  // TODO: implementar
end;

function VerificaEAN13(codigo: string): boolean;
begin
  // TODO: implementar
end;

function Idade(dataNasc: TDateTime): Integer;
begin
  Result := YearsBetween(Now, dataNasc);
end;

function PassWord(PassWord, passwordChar: string): boolean;
begin
  // TODO: implementar
end;

end.
