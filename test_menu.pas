program test_menu;

{$MODE Delphi}

uses
  Forms, Interfaces, SysUtils, Classes, Menus, ActnList;

type
  TTestForm = class(TForm)
    ListaAcoes: TActionList;
    actTest1: TAction;
    actTest2: TAction;
    procedure FormCreate(Sender: TObject);
  private
    procedure CreateMenu;
  public
  end;

var
  TestForm: TTestForm;

procedure TTestForm.FormCreate(Sender: TObject);
begin
  WriteLn('=== Teste de Criação de Menu ===');
  CreateMenu;
end;

procedure TTestForm.CreateMenu;
var
  menu: TMainMenu;
  subMenu, item: TMenuItem;
  categories: TStringList;
  i: Integer;
begin
  try
    WriteLn('1. Criando menu...');
    
    // Criar o menu principal
    menu := TMainMenu.Create(Self);
    
    // IMPORTANTE: Atribuir o menu ao formulário
    Self.Menu := menu;
    WriteLn('2. Menu atribuído ao formulário');
    
    // Criar categorias
    categories := TStringList.Create;
    categories.AddStrings(['Teste1', 'Teste2']);
    
    WriteLn('3. Criando submenus...');
    for i := 0 to categories.Count-1 do
    begin
      subMenu := TMenuItem.Create(menu);
      subMenu.Caption := categories[i];
      
      // Adicionar item de teste
      item := TMenuItem.Create(subMenu);
      item.Caption := 'Item ' + IntToStr(i+1);
      item.OnClick := nil; // Sem evento por enquanto
      subMenu.Add(item);
      
      menu.Items.Add(subMenu);
      WriteLn('   Submenu "' + categories[i] + '" criado com ' + IntToStr(subMenu.Count) + ' itens');
    end;
    
    WriteLn('4. Menu criado com ' + IntToStr(menu.Items.Count) + ' submenus');
    categories.Free;
    
    WriteLn('✓ Menu criado com sucesso!');
    
  except
    on E: Exception do
    begin
      WriteLn('✗ Erro ao criar menu: ' + E.Message);
    end;
  end;
end;

begin
  try
    Application.Initialize;
    
    TestForm := TTestForm.Create(Application);
    TestForm.Caption := 'Teste de Menu';
    TestForm.Width := 400;
    TestForm.Height := 300;
    
    WriteLn('5. Mostrando formulário...');
    TestForm.Show;
    
    WriteLn('6. Executando aplicação...');
    Application.Run;
    
  except
    on E: Exception do
    begin
      WriteLn('✗ Erro crítico: ' + E.Message);
    end;
  end;
end.
