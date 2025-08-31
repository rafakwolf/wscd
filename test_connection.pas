program test_connection;

{$MODE Delphi}

uses
  Forms, Interfaces, SysUtils, ZConnection, ZQuery, DB, Dialogs;

var
  ZConnection1: TZConnection;
  ZQuery1: TZQuery;

begin
  try
    Application.Initialize;
    
    // Criar componentes
    ZConnection1 := TZConnection.Create(nil);
    ZQuery1 := TZQuery.Create(nil);
    
    try
      // Configurar conexão
      ZConnection1.HostName := '127.0.0.1';
      ZConnection1.Port := 3306;
      ZConnection1.Database := 'wscd';
      ZConnection1.User := 'root';
      ZConnection1.Password := 'mysqlrocks!';
      ZConnection1.Protocol := 'mysql';
      ZConnection1.LibraryLocation := '/opt/homebrew/Cellar/mysql-client/9.4.0/lib/libmysqlclient.24.dylib';
      
      // Tentar conectar
      ShowMessage('Tentando conectar ao banco...');
      ZConnection1.Connect;
      
      if ZConnection1.Connected then
      begin
        ShowMessage('Conexão bem-sucedida!');
        
        // Testar uma query simples
        ZQuery1.Connection := ZConnection1;
        ZQuery1.SQL.Text := 'SELECT 1 as teste';
        ZQuery1.Open;
        
        if not ZQuery1.IsEmpty then
          ShowMessage('Query de teste executada com sucesso!')
        else
          ShowMessage('Query de teste não retornou dados.');
          
        ZQuery1.Close;
      end
      else
        ShowMessage('Falha na conexão com o banco.');
        
    except
      on E: Exception do
        ShowMessage('Erro: ' + E.Message);
    end;
    
  finally
    // Limpar
    if Assigned(ZQuery1) then
      ZQuery1.Free;
    if Assigned(ZConnection1) then
      ZConnection1.Free;
  end;
  
  Application.Run;
end.
