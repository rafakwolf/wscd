unit unPrincipal;

{$mode delphi}

interface

uses
  LCLIntf, LCLType, LMessages, Messages, ExtCtrls, SysUtils, Variants, Classes,
  Graphics, Controls, Forms, Dialogs, Menus, ComCtrls, Buttons, sqldb, Types,
  ActnList, DB, ConstPadrao, ToolWin, uDatabaseUtils, crypto, StdCtrls, DBCtrls,
  memds, IniFiles, ImgList, ZDataset, ImgUtils, FMTBcd, uClasses;

type

  { TMainForm }

  TMainForm = class(TForm)
    ListaAcoes: TActionList;
    actCidade: TAction;
    actContaCaixa: TAction;
    actConfiguracaoLocal: TAction;
    actDadosEmpresa: TAction;
    actUsuario: TAction;
    actPerfis: TAction;
    actAgenda: TAction;
    actRecibo: TAction;
    actCliente: TAction;
    actFornecedor: TAction;
    actContasPagar: TAction;
    actContasReceber: TAction;
    actCaixa: TAction;
    actSobreSistema: TAction;
    actRelatorioAgenda: TAction;
    actEtiqueta: TAction;
    actPesqFone: TAction;
    actBanco: TAction;
    menuFrame: TFrame;
    procedure actCidadeExecute(Sender: TObject);
    procedure actContaCaixaExecute(Sender: TObject);
    procedure actConfiguracaoLocalExecute(Sender: TObject);
    procedure actDadosEmpresaExecute(Sender: TObject);
    procedure actPerfisExecute(Sender: TObject);
    procedure actUsuarioExecute(Sender: TObject);
    procedure actAgendaExecute(Sender: TObject);
    procedure actClienteExecute(Sender: TObject);
    procedure actFornecedorExecute(Sender: TObject);
    procedure actContasPagarExecute(Sender: TObject);
    procedure actContasReceberExecute(Sender: TObject);
    procedure actCaixaExecute(Sender: TObject);
    procedure actSobreSistemaExecute(Sender: TObject);
    procedure actReciboExecute(Sender: TObject);
    procedure actRelatorioAgendaExecute(Sender: TObject);
    procedure actEtiquetaExecute(Sender: TObject);
    procedure actPesqFoneExecute(Sender: TObject);
    procedure actBancoExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  Private
    procedure SetConfiguracao;
    procedure SetEmpresa;
    procedure SetSistema;
  Public
  end;

var MainForm: TMainForm;

implementation

uses
  unAcesso, Funcoes, uUtilFncs, VarGlobal,
  udmAcesso, baseRepo, unDmPrincipal;

{$R *.lfm}

procedure TMainForm.actCidadeExecute(Sender: TObject);
begin
  ChamaForm('TfrmCadastroCidade', 'Cadastro de cidades', Application);
end;

procedure TMainForm.actContaCaixaExecute(Sender: TObject);
begin
  ChamaForm('TfrmCadastroCaixa', 'Contas caixa', Application);
end;

procedure TMainForm.actConfiguracaoLocalExecute(Sender: TObject);
begin
  ChamaForm('TfrmConfiguracao', 'Configurações locais', Application);
end;

procedure TMainForm.actDadosEmpresaExecute(Sender: TObject);
begin
  ChamaForm('TfrmDadosEmpresa', 'Dados da empresa', Application);
end;

procedure TMainForm.actPerfisExecute(Sender: TObject);
begin
  ChamaForm('TfrmPerfil', 'Perfis', Application);
end;

procedure TMainForm.actUsuarioExecute(Sender: TObject);
begin
  ChamaForm('TfrmUsuarioItemMenu', 'Usuários', Application);
end;

procedure TMainForm.actAgendaExecute(Sender: TObject);
begin
  ChamaForm('TfrmAgenda', 'Agenda de telefones', Application);
end;

procedure TMainForm.actClienteExecute(Sender: TObject);
begin
  ChamaForm('TfrmCliente', 'Cadastro de clientes', Application);
end;

procedure TMainForm.actFornecedorExecute(Sender: TObject);
begin
  ChamaForm('TfrmFornecedor', 'Cadastro de fornecedores', Application);
end;

procedure TMainForm.actContasPagarExecute(Sender: TObject);
begin
  ChamaForm('TfrmCP', 'Contas a pagar', Application);
end;

procedure TMainForm.actContasReceberExecute(Sender: TObject);
begin
  ChamaForm('TfrmCR', 'Contas a receber', Application);
end;

procedure TMainForm.actCaixaExecute(Sender: TObject);
begin
  ChamaForm('TfrmCaixa', 'Livro caixa', Application);
end;

procedure TMainForm.actSobreSistemaExecute(Sender: TObject);
begin
  ChamaForm('TfrmSobre', 'Sobre o sistema', Application);
end;

procedure TMainForm.actReciboExecute(Sender: TObject);
begin
  ChamaForm('TfrmRecibo', 'Recibos', Application);
end;

procedure TMainForm.actRelatorioAgendaExecute(Sender: TObject);
begin
  ChamaForm('TfrmRelatorioAgenda', 'Listagem de telefones', Application);
end;

procedure TMainForm.SetConfiguracao;
begin
  if Assigned(Configuracao) then
    Configuracao.Atualizar
  else
  begin
    Configuracao := TConfiguracao.Create;
    Configuracao.Atualizar;
  end;
end;

procedure TMainForm.SetEmpresa;
begin
  if Assigned(Empresa) then
    Empresa.Atualizar
  else
    Empresa := TEmpresa.Create;

  self.Caption := Application.Title + ' - ' + Empresa.Nome;
end;

procedure TMainForm.actEtiquetaExecute(Sender: TObject);
begin
  ChamaForm('TfrmEtiqueta', 'Configuração de etiquetas', Application);
end;

procedure TMainForm.actPesqFoneExecute(Sender: TObject);
begin
  ChamaForm('TfrmPesqFone', 'Pesquisa de telefones', Application);
end;

procedure TMainForm.actBancoExecute(Sender: TObject);
begin
  ChamaForm('TfrmBanco', 'Bancos', Application);
end;

procedure TMainForm.SetSistema;
begin
  if Assigned(Sistema) then
    Sistema.Atualizar
  else
    Sistema := TSistema.Create;
end;

procedure TMainForm.FormCreate(Sender: TObject);

     function GetActionsByCategory(category: string): TArray<TAction>;
         var i: Integer;
         var res: TArray<TAction>;
     begin
       WriteLn('  Buscando ações para categoria: "' + category + '"');
       WriteLn('  Total de ações disponíveis: ' + IntToStr(ListaAcoes.ActionCount));
       
       res := TArray<TAction>.Create;
       for i := 0 to ListaAcoes.ActionCount-1 do
       begin
          WriteLn('    Ação ' + IntToStr(i) + ': ' + TAction(ListaAcoes.Actions[i]).Caption + 
                  ' (Categoria: "' + TAction(ListaAcoes.Actions[i]).Category + '")');
          
          if TAction(ListaAcoes.Actions[i]).Category = category then
          begin
             SetLength(res, Length(res) + 1);
             res[Length(res) - 1] := ListaAcoes.Actions[i] as TAction;
             WriteLn('    ✓ Ação "' + TAction(ListaAcoes.Actions[i]).Caption + '" adicionada à categoria "' + category + '"');
          end;
       end;
       
       WriteLn('  Total de ações encontradas para categoria "' + category + '": ' + IntToStr(Length(res)));
       Result := res;
     end;

var i, j: Integer;
  menu: TMainMenu;
  subMenu, item: TMenuItem;
  categories: TStrings;
  actionsByCategory: TArray<TAction>;
  act: TAction;
begin
     try
        frmAcesso := TfrmAcesso.create(self);
        if (frmAcesso.ShowModal <> mrOk) then
        begin
           Application.Terminate;
        end;
     finally
       frmAcesso.free;
     end;


   try
     WriteLn('=== Iniciando FormCreate ===');
     
     // Verificar se o DataModule principal foi criado
     if not Assigned(DmPrincipal) then
     begin
       ShowMessage('Erro: DataModule principal não foi criado!');
       WriteLn('✗ DataModule não encontrado');
       Exit;
     end;
     WriteLn('✓ DataModule encontrado');

     // Verificar se consegue conectar ao banco
     if not DmPrincipal.ConectaBanco then
     begin
       ShowMessage('Erro: Não foi possível conectar ao banco de dados!' + #13#10 +
                  'Verifique se o MySQL está rodando e as configurações estão corretas.');
       WriteLn('✗ Falha na conexão com banco');
       Exit;
     end;
     WriteLn('✓ Conexão com banco estabelecida');

     // Criar menu temporariamente comentado para identificar o problema
     WriteLn('Criando menu...');
     try
       categories := TStringList.Create;
       categories.AddStrings(['Configuracao', 'Cadastros', 'Movimentos', 'Util', 'Ajuda']);


       menu := TMainMenu.Create(Self);

       // IMPORTANTE: Atribuir o menu ao formulário para que ele apareça
       Self.Menu := menu;
       for i := 0 to categories.Count-1 do
       begin
         actionsByCategory := GetActionsByCategory(categories[i]);


         WriteLn('Categoria "' + categories[i] + '": ' + IntToStr(Length(actionsByCategory)) + ' ações encontradas');

         if Length(actionsByCategory) > 0 then
         begin
           subMenu := TMenuItem.Create(menu);
           subMenu.Caption := categories[i];
           
           for j := 0 to Length(actionsByCategory) - 1 do
           begin
             act := actionsByCategory[j] as TAction;
             if Assigned(act) then
             begin
               item := TMenuItem.Create(subMenu);
               item.Caption := act.Caption;
               item.Action := act;
               subMenu.Add(item);
               WriteLn('  - Item adicionado: ' + act.Caption);
             end;
           end;
           
           menu.Items.Add(subMenu);
           WriteLn('Submenu "' + categories[i] + '" criado com ' + IntToStr(subMenu.Count) + ' itens');
         end
         else
         begin
           WriteLn('  - Nenhuma ação encontrada para categoria "' + categories[i] + '"');
         end;
       end;

       WriteLn('Menu criado com ' + IntToStr(menu.Items.Count) + ' submenus');
       categories.Free;
       WriteLn('✓ Menu criado com sucesso');
     except
       on E: Exception do
       begin
         WriteLn('✗ Erro ao criar menu: ' + E.Message);
         ShowMessage('Erro ao criar menu: ' + E.Message);
       end;
     end;

     // Inicializar componentes do sistema com tratamento de erro
     WriteLn('Inicializando sistema...');
     try
       SetSistema;
       WriteLn('✓ Sistema inicializado');
     except
       on E: Exception do
       begin
         WriteLn('✗ Erro ao inicializar sistema: ' + E.Message);
         ShowMessage('Erro ao inicializar sistema: ' + E.Message);
       end;
     end;

     WriteLn('Inicializando empresa...');
     try
       SetEmpresa;
       WriteLn('✓ Empresa inicializada');
     except
       on E: Exception do
       begin
         WriteLn('✗ Erro ao carregar dados da empresa: ' + E.Message);
         ShowMessage('Erro ao carregar dados da empresa: ' + E.Message);
       end;
     end;

     WriteLn('Inicializando configuração...');
     try
       SetConfiguracao;
       WriteLn('✓ Configuração inicializada');
     except
       on E: Exception do
       begin
         WriteLn('✗ Erro ao carregar configurações: ' + E.Message);
         ShowMessage('Erro ao carregar configurações: ' + E.Message);
       end;
     end;

     WriteLn('=== FormCreate concluído com sucesso ===');

   except
     on E: Exception do
     begin
       WriteLn('✗ Erro crítico na inicialização: ' + E.Message);
       ShowMessage('Erro crítico na inicialização do formulário: ' + E.Message);
       // Tentar fechar o formulário se houver erro crítico
       Close;
     end;
   end;
  end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  if Assigned(Configuracao) then
   FreeAndNil( Configuracao );

  if Assigned(Empresa) then
   FreeAndNil( Empresa );

  if Assigned(Sistema) then
   FreeAndNil( Sistema );
end;


end.
