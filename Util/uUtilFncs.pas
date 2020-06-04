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
  Result := '';
end;

function GetBuildInfo(exe: string): string;
begin
  Result := '';
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
  Result := 'C:\Windows\';
end;

function GetFileList(FDirectory, Filter: TFileName; ShowFolder: boolean)
  : TStringList;
{ Cria um stringList com todos os arquivos de um diretório }
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
     Result := '';
end;


end.
