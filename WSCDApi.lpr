program WSCDApi;

{$mode delphi}{$H+}
{$I mormot.defines.inc}

{$ifdef OSWINDOWS}
  {$apptype console}
{$endif OSWINDOWS}

uses
  {$I mormot.uses.inc}
  SysUtils,
  WscdApiServer in 'Api/WscdApiServer.pas';

var
  Runner: TWscdApiRunner;

begin
  Runner := TWscdApiRunner.Create;
  try
    try
      Runner.Run;
    except
      on E: Exception do
      begin
        Writeln(E.ClassName, ': ', E.Message);
        ExitCode := 1;
      end;
    end;
  finally
    Runner.Free;
  end;
end.
