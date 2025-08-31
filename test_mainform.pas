program test_mainform;

{$MODE Delphi}

uses
  Forms, Interfaces, SysUtils, Classes,
  unDmPrincipal in 'Principal/unDmPrincipal.pas' {DmPrincipal: TDataModule},
  unPrincipal in 'Principal/unPrincipal.pas' {MainForm: TForm};

var
  DmPrincipal: TDmPrincipal;
  MainForm: TMainForm;

begin
  try
    Application.Initialize;
    
    WriteLn('=== Teste do Formulário Principal ===');
    WriteLn('1. Criando DataModule principal...');
    
    try
      DmPrincipal := TDmPrincipal.Create(Application);
      WriteLn('✓ DataModule principal criado com sucesso');
    except
      on E: Exception do
      begin
        WriteLn('✗ Erro ao criar DataModule: ' + E.Message);
        Exit;
      end;
    end;
    
    WriteLn('2. Tentando conectar ao banco...');
    try
      if DmPrincipal.ConectaBanco then
        WriteLn('✓ Conexão com banco estabelecida')
      else
        WriteLn('✗ Falha na conexão com banco');
    except
      on E: Exception do
      begin
        WriteLn('✗ Erro na conexão: ' + E.Message);
      end;
    end;
    
    WriteLn('3. Criando formulário principal...');
    try
      MainForm := TMainForm.Create(Application);
      WriteLn('✓ Formulário principal criado com sucesso');
    except
      on E: Exception do
      begin
        WriteLn('✗ Erro ao criar formulário: ' + E.Message);
        Exit;
      end;
    end;
    
    WriteLn('4. Mostrando formulário...');
    try
      MainForm.Show;
      WriteLn('✓ Formulário exibido com sucesso');
    except
      on E: Exception do
      begin
        WriteLn('✗ Erro ao mostrar formulário: ' + E.Message);
        Exit;
      end;
    end;
    
    WriteLn('');
    WriteLn('=== TESTE CONCLUÍDO COM SUCESSO ===');
    WriteLn('O formulário principal está funcionando!');
    
    Application.Run;
    
  except
    on E: Exception do
    begin
      WriteLn('');
      WriteLn('=== ERRO CRÍTICO ===');
      WriteLn('Erro: ' + E.Message);
      WriteLn('Classe: ' + E.ClassName);
      WriteLn('Localização: ' + E.StackTrace);
    end;
  end;
end.
