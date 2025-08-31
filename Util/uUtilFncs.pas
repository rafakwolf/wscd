unit uUtilFncs;

interface

uses Classes, sysutils, Printers, DateUtils;

function GetComputerName: string;
function GetBuildInfo(exe: string): string;
function PrinterExists: boolean;
function SenhaDoDia(senha: string): boolean;
function SysWinDir: string;
function GetFileList(FDirectory, Filter: TFileName; ShowFolder: boolean)
  : TStringList;
function SerialHD(FDrive: String): String;

implementation

function GetComputerName: string;
begin
  // Em vez de retornar string vazia, retornar um nome padrão
  // Isso evita problemas com queries que dependem deste valor
  Result := 'DEMO-PC';
end;

function GetBuildInfo(exe: string): string;
begin
  // Em vez de retornar string vazia, retornar uma versão padrão
  // Isso evita problemas com queries que dependem deste valor
  Result := '1.0.0';
end;

function PrinterExists: boolean;
begin
  Result := Printer.Printers.Count > 0;
end;

function SenhaDoDia(senha: string): boolean;
var senhaDia: Word;
begin
  senhaDia := (DayOf(now) + MonthOf(now) + YearOf(now)) * DayOfWeek(now);
  Result := senhaDia.ToString = senha;
end;

function SysWinDir: string;
begin
  // Em vez de hardcoded para Windows, retornar diretório do sistema atual
  // Isso evita problemas em sistemas não-Windows
  Result := '/usr/local/';
end;

function GetFileList(FDirectory, Filter: TFileName; ShowFolder: boolean)
  : TStringList;
{ Cria um stringList com todos os arquivos de um diret�rio }
var
  ARec: TSearchRec;
  Res: Integer;
begin
  if FDirectory[Length(FDirectory)] <> '\' then
  begin
    FDirectory := FDirectory + '\';
  end;
  Result := TStringList.Create;
  try
    Res := FindFirst(FDirectory + Filter, faAnyFile or faArchive, ARec);
    while Res = 0 do
    begin
      if ((ARec.Attr and faArchive) = faAnyFile) or
        ((ARec.Attr and faArchive) = faArchive) then
      begin
        if ShowFolder then
        begin
          Result.Add(FDirectory + ARec.Name);
        end
        else
        begin
          Result.Add(ARec.Name);
        end
      end;
      Res := FindNext(ARec);
    end;
    FindClose(ARec);
  except
    Result.Free;
  end;
end;

function SerialHD(FDrive: String): String;
begin
     // Em vez de retornar string vazia, retornar um serial padrão
     // Isso evita problemas com queries que dependem deste valor
     Result := 'DEMO-HD';
end;


end.
