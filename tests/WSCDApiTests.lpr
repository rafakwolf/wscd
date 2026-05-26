program WSCDApiTests;

{$mode delphi}{$H+}
{$I mormot.defines.inc}

uses
  {$I mormot.uses.inc}
  testregistry,
  consoletestrunner,
  test_WscdApiServer in 'Api/test_WscdApiServer.pas',
  test_Agenda_controller in 'Agenda/test_Agenda_controller.pas',
  test_Cliente_controller in 'Cliente/test_Cliente_controller.pas',
  test_Fornecedor_controller in 'Fornecedor/test_Fornecedor_controller.pas',
  test_Recibo_controller in 'Recibo/test_Recibo_controller.pas',
  test_Vendedor_controller in 'Vendedor/test_Vendedor_controller.pas';

var
  Runner: TTestRunner;

begin
  Runner := TTestRunner.Create(nil);
  try
    Runner.Initialize;
    Runner.Run;
  finally
    Runner.Free;
  end;
end.
