unit unPrincipal;

{$mode delphi}

interface

uses
  LCLIntf, LCLType, LMessages, Messages, ExtCtrls, SysUtils, Variants, Classes,
  Graphics, Controls, Forms, Dialogs, Menus, ComCtrls, Buttons, sqldb, Types,
  ActnList, DB, ConstPadrao, ToolWin, uDatabaseUtils, crypto, StdCtrls, DBCtrls,
  memds, IniFiles, ImgList, ZDataset, ImgUtils, FMTBcd;

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
  uClasses, udmAcesso, baseRepo, unDmPrincipal;

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

  self.Caption := Application.Title + ' - ' + Sistema.VersaoApp + ' - ' + Empresa.Nome;
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
       res := TArray<TAction>.Create;
       for i := 0 to ListaAcoes.ActionCount-1 do
       begin
          if TAction(ListaAcoes.Actions[i]).Category = category then
          begin
             SetLength(res, Length(res) + 1);
             res[Length(res) - 1] := ListaAcoes.Actions[i] as TAction;
          end;
       end;
       Result := res;
     end;

var i, j: Integer;
  menu: TMainMenu;
  subMenu, item: TMenuItem;
  categories: TStrings;
  actionsByCategory: TArray<TAction>;
  act: TAction;
begin
   categories := TStringList.Create;
   categories.AddStrings(['Configuracao', 'Cadastros', 'Movimentos', 'Util', 'Ajuda']);

   menu := TMainMenu.Create(Self);
   for i := 0 to categories.Count-1 do
   begin
     actionsByCategory := GetActionsByCategory(categories[i]);
     subMenu := TMenuItem.Create(menu);
     subMenu.Caption := categories[i];
     for j := 0 to Length(actionsByCategory) - 1 do
     begin
       item := TMenuItem.Create(subMenu);
       act := actionsByCategory[j] as TAction;
       if Assigned(act) then
       begin
         item.Caption := TAction(actionsByCategory[j]).Caption;
         item.Action := TAction(actionsByCategory[j]);
         subMenu.Add(item);
       end;
     end;
     menu.Items.Add(subMenu);
   end;

   categories.Free;

   SetSistema;
   SetEmpresa;
   SetConfiguracao;
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
