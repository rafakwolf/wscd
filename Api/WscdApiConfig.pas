unit WscdApiConfig;

{$mode delphi}{$H+}

interface

uses
  SysUtils,
  IniFiles,
  mormot.core.base,
  mormot.core.Text,
  mormot.core.unicode;

type
  TWscdDatabaseEngine = (wdeSQLite, wdeFirebird);

  TWscdApiSettings = record
    ConfigFileName: TFileName;
    HttpPort: RawUtf8;
    DatabaseEngine: TWscdDatabaseEngine;
    SQLiteFileName: TFileName;
    FirebirdHost: string;
    FirebirdPort: integer;
    FirebirdDatabase: string;
    FirebirdUser: string;
    FirebirdPassword: string;
    FirebirdCharset: string;
    FirebirdOdbcDriver: string;
    FirebirdOdbcConnectionString: string;
    CreateMissingTables: boolean;
    class function Load: TWscdApiSettings; static;
    function DatabaseDescription: string;
    function OdbcConnectionString: RawUtf8;
  end;

implementation

const
  DEFAULT_CONFIG_FILE = 'Api' + DirectorySeparator + 'WSCDApi.ini';

function EnvOrDefault(const AName, ADefault: string): string;
begin
  Result := GetEnvironmentVariable(AName);
  if Result = '' then
    Result := ADefault;
end;

function EnvBoolOrDefault(const AName: string; ADefault: boolean): boolean;
var
  Value: string;
begin
  Value := LowerCase(GetEnvironmentVariable(AName));
  if Value = '' then
    Exit(ADefault);
  Result := (Value = '1') or (Value = 'true') or (Value = 'yes') or
    (Value = 'sim') or (Value = 's');
end;

function FindConfigFile: TFileName;
var
  Candidate: TFileName;
begin
  Result := GetEnvironmentVariable('WSCD_API_CONFIG');
  if Result <> '' then
    Exit;

  Candidate := ExtractFilePath(ParamStr(0)) + 'WSCDApi.ini';
  if FileExists(Candidate) then
    Exit(Candidate);

  Candidate := ExtractFilePath(ParamStr(0)) + DEFAULT_CONFIG_FILE;
  if FileExists(Candidate) then
    Exit(Candidate);

  Candidate := GetCurrentDir + DirectorySeparator + DEFAULT_CONFIG_FILE;
  if FileExists(Candidate) then
    Exit(Candidate);

  Candidate := GetCurrentDir + DirectorySeparator + 'WSCDApi.ini';
  if FileExists(Candidate) then
    Exit(Candidate);

  Result := GetCurrentDir + DirectorySeparator + DEFAULT_CONFIG_FILE;
end;

function ReadStringOrDefault(AIni: TIniFile;
  const ASection, AName, ADefault, AEnvName: string): string;
begin
  Result := EnvOrDefault(AEnvName, AIni.ReadString(ASection, AName, ADefault));
end;

class function TWscdApiSettings.Load: TWscdApiSettings;
var
  Ini: TIniFile;
  Engine: string;
begin
  Result.ConfigFileName := FindConfigFile;
  Result.HttpPort := '3001';
  Result.DatabaseEngine := wdeFirebird;
  Result.SQLiteFileName := 'data' + DirectorySeparator + 'wscd-api.db3';
  Result.FirebirdHost := 'wolf-server.local';
  Result.FirebirdPort := 3050;
  Result.FirebirdDatabase := '/var/lib/firebird/data/mirror.fdb';
  Result.FirebirdUser := 'fbuser';
  Result.FirebirdPassword := 'fbrocks!';
  Result.FirebirdCharset := 'UTF8';
  Result.FirebirdOdbcDriver := 'Firebird/InterBase(r) driver';
  Result.FirebirdOdbcConnectionString := '';
  Result.CreateMissingTables := True;

  if FileExists(Result.ConfigFileName) then
  begin
    Ini := TIniFile.Create(Result.ConfigFileName);
    try
      Result.HttpPort := StringToUtf8(ReadStringOrDefault(Ini, 'Server',
        'Port', Utf8ToString(Result.HttpPort), 'PORT'));

      Engine := LowerCase(ReadStringOrDefault(Ini, 'Database', 'Engine',
        'Firebird', 'WSCD_DB_ENGINE'));
      if Engine = 'sqlite' then
        Result.DatabaseEngine := wdeSQLite
      else
        Result.DatabaseEngine := wdeFirebird;

      Result.SQLiteFileName :=
        ReadStringOrDefault(Ini, 'Database', 'SQLiteFile',
        Result.SQLiteFileName, 'WSCD_DB');
      Result.FirebirdHost := ReadStringOrDefault(Ini, 'Database',
        'Host', Result.FirebirdHost, 'WSCD_FIREBIRD_HOST');
      Result.FirebirdPort := StrToIntDef(ReadStringOrDefault(Ini,
        'Database', 'Port', IntToStr(Result.FirebirdPort), 'WSCD_FIREBIRD_PORT'),
        Result.FirebirdPort);
      Result.FirebirdDatabase :=
        ReadStringOrDefault(Ini, 'Database', 'Database', Result.FirebirdDatabase,
        'WSCD_FIREBIRD_DATABASE');
      Result.FirebirdUser := ReadStringOrDefault(Ini, 'Database',
        'User', Result.FirebirdUser, 'WSCD_FIREBIRD_USER');
      Result.FirebirdPassword :=
        ReadStringOrDefault(Ini, 'Database', 'Password', Result.FirebirdPassword,
        'WSCD_FIREBIRD_PASSWORD');
      Result.FirebirdCharset :=
        ReadStringOrDefault(Ini, 'Database', 'Charset', Result.FirebirdCharset,
        'WSCD_FIREBIRD_CHARSET');
      Result.FirebirdOdbcDriver :=
        ReadStringOrDefault(Ini, 'Database', 'ODBCDriver',
        Result.FirebirdOdbcDriver, 'WSCD_FIREBIRD_ODBC_DRIVER');
      Result.FirebirdOdbcConnectionString :=
        ReadStringOrDefault(Ini, 'Database', 'ODBCConnectionString',
        Result.FirebirdOdbcConnectionString, 'WSCD_ODBC_CONNECTION_STRING');
      Result.CreateMissingTables :=
        EnvBoolOrDefault('WSCD_CREATE_MISSING_TABLES',
        Ini.ReadBool('Database', 'CreateMissingTables', Result.CreateMissingTables));
    finally
      Ini.Free;
    end;
  end
  else
  begin
    Engine := LowerCase(EnvOrDefault('WSCD_DB_ENGINE', 'Firebird'));
    if Engine = 'sqlite' then
      Result.DatabaseEngine := wdeSQLite
    else
      Result.DatabaseEngine := wdeFirebird;

    Result.HttpPort := StringToUtf8(EnvOrDefault('PORT', Utf8ToString(Result.HttpPort)));
    Result.SQLiteFileName := EnvOrDefault('WSCD_DB', Result.SQLiteFileName);
    Result.FirebirdHost := EnvOrDefault('WSCD_FIREBIRD_HOST', Result.FirebirdHost);
    Result.FirebirdPort := StrToIntDef(EnvOrDefault('WSCD_FIREBIRD_PORT',
      IntToStr(Result.FirebirdPort)), Result.FirebirdPort);
    Result.FirebirdDatabase :=
      EnvOrDefault('WSCD_FIREBIRD_DATABASE', Result.FirebirdDatabase);
    Result.FirebirdUser := EnvOrDefault('WSCD_FIREBIRD_USER', Result.FirebirdUser);
    Result.FirebirdPassword :=
      EnvOrDefault('WSCD_FIREBIRD_PASSWORD', Result.FirebirdPassword);
    Result.FirebirdCharset := EnvOrDefault('WSCD_FIREBIRD_CHARSET',
      Result.FirebirdCharset);
    Result.FirebirdOdbcDriver :=
      EnvOrDefault('WSCD_FIREBIRD_ODBC_DRIVER', Result.FirebirdOdbcDriver);
    Result.FirebirdOdbcConnectionString :=
      EnvOrDefault('WSCD_ODBC_CONNECTION_STRING', Result.FirebirdOdbcConnectionString);
    Result.CreateMissingTables :=
      EnvBoolOrDefault('WSCD_CREATE_MISSING_TABLES', Result.CreateMissingTables);
  end;
end;

function TWscdApiSettings.DatabaseDescription: string;
begin
  if DatabaseEngine = wdeSQLite then
    Result := SQLiteFileName
  else
    Result := Format('Firebird %s/%d:%s', [FirebirdHost, FirebirdPort,
      FirebirdDatabase]);
end;

function TWscdApiSettings.OdbcConnectionString: RawUtf8;
var
  DbName: string;
begin
  if FirebirdOdbcConnectionString <> '' then
    Exit(StringToUtf8(FirebirdOdbcConnectionString));

  DbName := Format('%s/%d:%s', [FirebirdHost, FirebirdPort, FirebirdDatabase]);
  Result := StringToUtf8(Format('DRIVER=%s;CHARSET=%s;UID=%s;PWD=%s;DBNAME=%s',
    [FirebirdOdbcDriver, FirebirdCharset, FirebirdUser, FirebirdPassword, DbName]));
end;

end.
