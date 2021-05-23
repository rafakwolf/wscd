unit uUtilFncs;

interface

uses Classes, windows, sysutils, Printers, DateUtils;

function GetComputerName: string;
function GetBuildInfo(exe : string) : string;
function PrinterExists: boolean;
function SenhaDoDia(senha: string): boolean;
function SysWinDir: string;
function GetFileList(FDirectory, Filter: TFileName; ShowFolder:Boolean): TStringList;
function SerialHD(FDrive: String): String;

implementation

function GetComputerName: string;
var
  buffer: array[0..MAX_COMPUTERNAME_LENGTH + 1] of Char;
  Size: Cardinal;
begin
  Size := MAX_COMPUTERNAME_LENGTH + 1;
  Windows.GetComputerName(@buffer, Size);
  Result := StrPas(buffer);
end;

function GetBuildInfo(exe : string) : string;
var VerInfoSize: DWORD;
    VerInfo: Pointer;
    VerValueSize: DWORD;
    VerValue: PVSFixedFileInfo;
    Dummy: DWORD;
    V1, V2, V3, V4: Word;
    Prog : string;
begin
   Prog := exe;
   VerInfoSize := GetFileVersionInfoSize(PChar(prog), Dummy);
   GetMem(VerInfo, VerInfoSize);
   GetFileVersionInfo(PChar(prog), 0, VerInfoSize, VerInfo);
   VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
   with VerValue^ do
      begin
        V1 := dwFileVersionMS shr 16;
        V2 := dwFileVersionMS and $FFFF;
        V3 := dwFileVersionLS shr 16;
        V4 := dwFileVersionLS and $FFFF;
      end;

   FreeMem(VerInfo, VerInfoSize);

   result := Copy (IntToStr (100 + v1), 3, 2) +
                Copy (IntToStr (100 + v2), 3, 2) +
                Copy (IntToStr (100 + v3), 3, 2) +
                Copy (IntToStr (100 + v4), 3, 2);
end;

function PrinterExists: boolean;
begin
  Result := Printer.Printers.Count > 0;
end;

function SenhaDoDia(senha: string): boolean;
begin
  Result := ( DayOf(now) + MonthOf(now) + YearOf(now) * DayOfWeek(now) ).ToString = senha;
end;

function SysWinDir: string;
begin
  Result := 'C:\Windows\';
end;

function GetFileList(FDirectory, Filter: TFileName; ShowFolder:Boolean): TStringList;
{ Cria um stringList com todos os arquivos de um diretório }
var ARec : TSearchRec;
Res : Integer;
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
if ((ARec.Attr and faArchive) = faAnyFile) or ((ARec.Attr and faArchive) = faArchive) then
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
Var
Serial:DWord;
DirLen,Flags: DWord;
DLabel : Array[0..11] of Char;
begin
Try GetVolumeInformation(PChar(FDrive+':\'),dLabel,12,@Serial,DirLen,Flags,nil,0);
Result := IntToHex(Serial,8);
Except Result :='';
end;
end;

end.
