unit uUtilFncs;

interface

uses Classes, windows, sysutils, Printers, DateUtils;

function GetComputerName: string;
function GetBuildInfo(exe: string): string;
function PrinterExists: boolean;
function SenhaDoDia(senha: string): boolean;
function SysWinDir: string;
function GetFileList(FDirectory, Filter: TFileName; ShowFolder: boolean)
  : TStringList;
function SerialHD(FDrive: String): String;
function ForceForegroundWindow(hwnd: THandle): boolean;

implementation

function GetComputerName: string;
var
  buffer: array [0 .. MAX_COMPUTERNAME_LENGTH + 1] of Char;
  Size: Cardinal;
begin
  Size := MAX_COMPUTERNAME_LENGTH + 1;
  windows.GetComputerName(@buffer, Size);
  Result := StrPas(buffer);
end;

function GetBuildInfo(exe: string): string;
var
  VerInfoSize: DWORD;
  VerInfo: Pointer;
  VerValueSize: DWORD;
  VerValue: PVSFixedFileInfo;
  Dummy: DWORD;
  V1, V2, V3, V4: Word;
  Prog: string;
begin
  Prog := exe;
  VerInfoSize := GetFileVersionInfoSize(PChar(Prog), Dummy);
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(Prog), 0, VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
  with VerValue^ do
  begin
    V1 := dwFileVersionMS shr 16;
    V2 := dwFileVersionMS and $FFFF;
    V3 := dwFileVersionLS shr 16;
    V4 := dwFileVersionLS and $FFFF;
  end;

  FreeMem(VerInfo, VerInfoSize);

  Result := Copy(IntToStr(100 + V1), 3, 2) + Copy(IntToStr(100 + V2), 3, 2) +
    Copy(IntToStr(100 + V3), 3, 2) + Copy(IntToStr(100 + V4), 3, 2);
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
Var
  Serial: DWORD;
  DirLen, Flags: DWORD;
  DLabel: Array [0 .. 11] of Char;
begin
  Try
    GetVolumeInformation(PChar(FDrive + ':\'), DLabel, 12, @Serial, DirLen,
      Flags, nil, 0);
    Result := IntToHex(Serial, 8);
  Except
    Result := '';
  end;
end;

function ForceForegroundWindow(hwnd: THandle): boolean;
const
  SPI_GETFOREGROUNDLOCKTIMEOUT = $2000;
  SPI_SETFOREGROUNDLOCKTIMEOUT = $2001;
var
  ForegroundThreadID: DWORD;
  ThisThreadID: DWORD;
  timeout: DWORD;
begin
  if IsIconic(hwnd) then
    ShowWindow(hwnd, SW_RESTORE);

  if GetForegroundWindow = hwnd then
    Result := true
  else
  begin

    // Windows 98/2000 doesn´t want to foreground a window when some other
    // window has keyboard focus

    if ((Win32Platform = VER_PLATFORM_WIN32_NT) and (Win32MajorVersion > 4)) or
      ((Win32Platform = VER_PLATFORM_WIN32_WINDOWS) and
      ((Win32MajorVersion > 4) or ((Win32MajorVersion = 4) and
      (Win32MinorVersion > 0)))) then
    begin

      // Code from Karl E. Peterson, www.mvps.org/vb/sample.htm
      // Converted to Delphi by Ray Lischner
      // Published in The Delphi Magazine 55, page 16

      Result := false;
      ForegroundThreadID := GetWindowThreadProcessID(GetForegroundWindow, nil);
      ThisThreadID := GetWindowThreadProcessID(hwnd, nil);
      if AttachThreadInput(ThisThreadID, ForegroundThreadID, true) then
      begin
        BringWindowToTop(hwnd); // IE 5.5 related hack
        SetForegroundWindow(hwnd);
        AttachThreadInput(ThisThreadID, ForegroundThreadID, false);
        Result := (GetForegroundWindow = hwnd);
      end;
      if not Result then
      begin

        // Code by Daniel P. Stasinski

        SystemParametersInfo(SPI_GETFOREGROUNDLOCKTIMEOUT, 0, @timeout, 0);
        SystemParametersInfo(SPI_SETFOREGROUNDLOCKTIMEOUT, 0, TObject(0),
          SPIF_SENDCHANGE);
        BringWindowToTop(hwnd); // IE 5.5 related hack
        SetForegroundWindow(hwnd);
        SystemParametersInfo(SPI_SETFOREGROUNDLOCKTIMEOUT, 0, TObject(timeout),
          SPIF_SENDCHANGE);
      end;
    end
    else
    begin
      BringWindowToTop(hwnd); // IE 5.5 related hack
      SetForegroundWindow(hwnd);
    end;

    Result := (GetForegroundWindow = hwnd);
  end;
end;

end.
