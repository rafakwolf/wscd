unit unPrincipal;

{$MODE Delphi}

interface

uses
  LCLIntf, LCLType, LMessages, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ExtCtrls, Buttons, sqldb, Types, ActnList, DB,
  ConstPadrao, ToolWin, {AppEvnts,}  uDatabaseUtils, crypto,
  StdCtrls, DBCtrls, {DBClient,} IniFiles, {UniGuiForm, UniGUIDialogs,
  Provider,} ImgList,  ImgUtils, FMTBcd, {System.Actions, uniMainMenu,
  uniGUIBaseClasses, uniGUIClasses, uniButton, uniBitBtn, uniSpeedButton,
  uniStatusBar, uniPanel, uniToolBar, uniHTMLFrame, uniGUITypes,} uMenuActions;

type
  TMainForm = class(TForm)
    ListaAcoes: TActionList;
    actCidade: TAction;
    acTdade: TAction;
    actGrupo: TAction;
    actAliquotaIcms: TAction;
    actContaCaixa: TAction;
    actCfop: TAction;
    actConfiguracaoGlobal: TAction;
    actConfiguracaoLocal: TAction;
    actImpressora: TAction;
    actDadosEmpresa: TAction;
    actUsuario: TAction;
    actPerfis: TAction;
    actTrocaSenha: TAction;
    actAgenda: TAction;
    actCalendario: TAction;
    actCalculadora: TAction;
    actEditorTexto: TAction;
    actDuplicata: TAction;
    actNotaPromissoria: TAction;
    actRecibo: TAction;
    actCliente: TAction;
    actProduto: TAction;
    actFornecedor: TAction;
    actContasPagar: TAction;
    actContasReceber: TAction;
    actOrcamento: TAction;
    actVenda: TAction;
    actCompra: TAction;
    actPerda: TAction;
    actCaixa: TAction;
    actDesmarcaProduto: TAction;
    actListaPreco: TAction;
    actExcluirProduto: TAction;
    actEtiquetaProduto: TAction;
    actFechar: TAction;
    actOutroUsuario: TAction;
    actSobreSistema: TAction;
    actDicaDia: TAction;
    actRelatorioAgenda: TAction;
    actEnvelope: TAction;
    actBackup: TAction;
    actRestore: TAction;
    actEtiqueta: TAction;
    actPesqFone: TAction;
    actBanco: TAction;
    actCheque: TAction;
    actRenovaChave: TAction;
    actAtualizacao: TAction;
    actPostIt: TAction;
    actAjuda: TAction;
    actConfigServidor: TAction;
    actInfoSistema: TAction;
    actVendedor: TAction;
    actConfigNota: TAction;
    actPromocao: TAction;
    actInfoAvisos: TAction;
    actAuditoriaUser: TAction;
    menuFrame: THTMLFrame;
    UniPanel1: TPanel;
    btnSair: TSpeedButton;
    btnNotificacoes: TSpeedButton;
    procedure actGrupoExecute(Sender: TObject);
    procedure actCidadeExecute(Sender: TObject);
    procedure acTdadeExecute(Sender: TObject);
    procedure actAliquotaIcmsExecute(Sender: TObject);
    procedure actContaCaixaExecute(Sender: TObject);
    procedure actCfopExecute(Sender: TObject);
    procedure actConfiguracaoGlobalExecute(Sender: TObject);
    procedure actConfiguracaoLocalExecute(Sender: TObject);
    procedure actDadosEmpresaExecute(Sender: TObject);
    procedure actUsuarioExecute(Sender: TObject);
    procedure actAgendaExecute(Sender: TObject);
    procedure actCalendarioExecute(Sender: TObject);
    procedure actDuplicataExecute(Sender: TObject);
    procedure actBackupExecute(Sender: TObject);
    procedure actClienteExecute(Sender: TObject);
    procedure actProdutoExecute(Sender: TObject);
    procedure actFornecedorExecute(Sender: TObject);
    procedure actContasPagarExecute(Sender: TObject);
    procedure actContasReceberExecute(Sender: TObject);
    procedure actOrcamentoExecute(Sender: TObject);
    procedure actVendaExecute(Sender: TObject);
    procedure actCompraExecute(Sender: TObject);
    procedure actPerdaExecute(Sender: TObject);
    procedure actCaixaExecute(Sender: TObject);
    procedure actDesmarcaProdutoExecute(Sender: TObject);
    procedure actExcluirProdutoExecute(Sender: TObject);
    procedure actListaPrecoExecute(Sender: TObject);
    procedure actEtiquetaProdutoExecute(Sender: TObject);
    procedure actOutroUsuarioExecute(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
    procedure actSobreSistemaExecute(Sender: TObject);
    procedure actDicaDiaExecute(Sender: TObject);
    procedure actPerfisExecute(Sender: TObject);
    procedure actTrocaSenhaExecute(Sender: TObject);
    procedure actReciboExecute(Sender: TObject);
    procedure actRelatorioAgendaExecute(Sender: TObject);
    procedure actEnvelopeExecute(Sender: TObject);
    procedure actEtiquetaExecute(Sender: TObject);
    procedure actPesqFoneExecute(Sender: TObject);
    procedure actBancoExecute(Sender: TObject);
    procedure actChequeExecute(Sender: TObject);
    procedure actRenovaChaveExecute(Sender: TObject);
    procedure btnLogOffClick(Sender: TObject);
    procedure btnOrcamentoClick(Sender: TObject);
    procedure btnListaPrecoClick(Sender: TObject);
    procedure btnProdutoClick(Sender: TObject);
    procedure btnFornecedorClick(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure btnAgendaClick(Sender: TObject);
    procedure actAjudaExecute(Sender: TObject);
    procedure actNotaPromissoriaExecute(Sender: TObject);
    procedure actInfoSistemaExecute(Sender: TObject);
    procedure actVendedorExecute(Sender: TObject);
    procedure actConfigNotaExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actPromocaoExecute(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormResize(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure menuFrameAjaxEvent(Sender: TComponent; EventName: string;
      Params: TStrings);
    procedure btnNotificacoesClick(Sender: TObject);
  Private
    Lista_permissoes: TClientDataSet;
    MenuActions: TMenuActions;

    procedure SetEnableMenu(adm: Boolean);
    procedure SetConfigGlobal;
    procedure SetConfiguracao;
    procedure SetEmpresa;
    procedure SetSistema;
    procedure GetListaPermissoes;

    procedure LoadHtmlMenu;


    function ValidaDataAcesso(DataEncriptada: string; DataAtual: TDateTime;
      Connection: TSQLConnection): Boolean;
    function ValidaHD(HD, HDGravar: string; Connection: TSQLConnection): Boolean;

  Public
  end;

function MainForm: TMainForm;

implementation

uses
  unAcesso, Funcoes, uUtilFncs, VarGlobal,  {uniGUIVars,} MainModule, {uniGUIApplication,}
  uClasses, udmAcesso, uNotificacoes;

{$R *.lfm}

function MainForm: TMainForm;
begin
   Result := TMainForm(UniMainModule.GetFormInstance(TMainForm));
end;

procedure TMainForm.actGrupoExecute(Sender: TObject);
begin
  ChamaForm('TfrmCadastroGrupo', 'Cadastro de grupos', UniApplication);
end;

procedure TMainForm.actCidadeExecute(Sender: TObject);
begin
  ChamaForm('TfrmCadastroCidade', 'Cadastro de cidades', UniApplication);
end;

procedure TMainForm.acTdadeExecute(Sender: TObject);
begin
  ChamaForm('TfrmCadastroUnidade', 'Cadastro de unidades', UniApplication);
end;

procedure TMainForm.actAliquotaIcmsExecute(Sender: TObject);
begin
  ChamaForm('TfrmAliquota', 'Cadastro de aliquotas', UniApplication);
end;

procedure TMainForm.actContaCaixaExecute(Sender: TObject);
begin
  ChamaForm('TfrmCadastroCaixa', 'Contas caixa', UniApplication);
end;

procedure TMainForm.actCfopExecute(Sender: TObject);
begin
  ChamaForm('TfrmCadastroCfop', 'Cadastro de CFOP', UniApplication);
end;

procedure TMainForm.actConfiguracaoGlobalExecute(Sender: TObject);
begin
  ChamaForm('TfrmConfigGlobal', 'Configurações globais', UniApplication);
end;

procedure TMainForm.actConfiguracaoLocalExecute(Sender: TObject);
begin
  ChamaForm('TfrmConfiguracao', 'Configurações locais', UniApplication);
end;

procedure TMainForm.actDadosEmpresaExecute(Sender: TObject);
begin
  ChamaForm('TfrmDadosEmpresa', 'Dados da empresa', UniApplication);
end;

procedure TMainForm.actUsuarioExecute(Sender: TObject);
begin
  ChamaForm('TfrmUsuarioItemMenu', 'Usuários', UniApplication);
end;

procedure TMainForm.actAgendaExecute(Sender: TObject);
begin
  ChamaForm('TfrmAgenda', 'Agenda de telefones', UniApplication);
end;

procedure TMainForm.actCalendarioExecute(Sender: TObject);
begin
  ChamaForm('TfrmCalendario', 'Calendário', UniApplication);
end;

procedure TMainForm.actDuplicataExecute(Sender: TObject);
begin
  ChamaForm('TfrmDuplicatas', 'Cadastro e impressão de duplicatas', UniApplication);
end;

procedure TMainForm.actBackupExecute(Sender: TObject);
begin
  ChamaForm('TfrmBackup', 'Fazer uma cópia dos dados', UniApplication);
end;

procedure TMainForm.actClienteExecute(Sender: TObject);
begin
  ChamaForm('TfrmCliente', 'Cadastro de clientes', UniApplication);
end;

procedure TMainForm.actProdutoExecute(Sender: TObject);
begin
  ChamaForm('TfrmProduto', 'Cadastro de produtos', UniApplication);
end;

procedure TMainForm.actFornecedorExecute(Sender: TObject);
begin
  ChamaForm('TfrmFornecedor', 'Cadastro de fornecedores', UniApplication);
end;

procedure TMainForm.actContasPagarExecute(Sender: TObject);
begin
  ChamaForm('TfrmCP', 'Contas a pagar', UniApplication);
end;

procedure TMainForm.actContasReceberExecute(Sender: TObject);
begin
  ChamaForm('TfrmCR', 'Contas a receber', UniApplication);
end;

procedure TMainForm.actOrcamentoExecute(Sender: TObject);
begin
  ChamaForm('TfrmOrcamentos', 'Orçamentos', UniApplication);
end;

procedure TMainForm.actVendaExecute(Sender: TObject);
begin
  ChamaForm('TfrmVendas', 'Vendas', UniApplication);
end;

procedure TMainForm.actCompraExecute(Sender: TObject);
begin
  ChamaForm('TfrmNotasFiscais', 'Compras', UniApplication);
end;

procedure TMainForm.actPerdaExecute(Sender: TObject);
begin
  ChamaForm('TfrmPerda', 'Perdas de produtos', UniApplication);
end;

procedure TMainForm.actCaixaExecute(Sender: TObject);
begin
  ChamaForm('TfrmCaixa', 'Livro caixa', UniApplication);
end;

procedure TMainForm.actDesmarcaProdutoExecute(Sender: TObject);
begin
  ChamaForm('TfrmDesmarcar', 'Produtos novos e alterados', UniApplication);
end;

procedure TMainForm.actExcluirProdutoExecute(Sender: TObject);
begin
  ChamaForm('TfrmExclusaoProduto', 'Exclusão de produtos', UniApplication);
end;

procedure TMainForm.actListaPrecoExecute(Sender: TObject);
begin
  ChamaForm('TfrmListagemPrecos', 'Lista de preços', UniApplication);
end;

procedure TMainForm.actEtiquetaProdutoExecute(Sender: TObject);
begin
  ChamaForm('TfrmEtiquetaProduto', 'Etiquetas de produtos', UniApplication);
end;

procedure TMainForm.actOutroUsuarioExecute(Sender: TObject);
begin
//  if not TfrmAcesso.Execute(True) then
//    MsgAviso('','Troca de usuário cancelada.')
//  else
//  begin
//    SetEnableMenu(IdUsuario = 0);
//  end;
end;

procedure TMainForm.actFecharExecute(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.actSobreSistemaExecute(Sender: TObject);
begin
  ChamaForm('TfrmSobre', 'Sobre o sistema', UniApplication);
end;

procedure TMainForm.actDicaDiaExecute(Sender: TObject);
begin
  ChamaForm('TfrmDicas', 'Dica do dia', UniApplication);
end;

procedure TMainForm.actPerfisExecute(Sender: TObject);
begin
  ChamaForm('TfrmPerfilPermissao', 'Perfis e permissões de usuários', UniApplication);
end;

procedure TMainForm.actTrocaSenhaExecute(Sender: TObject);
begin
  ChamaForm('TfrmTrocaSenha', 'Trocar senha', UniApplication);
end;

procedure TMainForm.actReciboExecute(Sender: TObject);
begin
  ChamaForm('TfrmRecibo', 'Recibos', UniApplication);
end;

procedure TMainForm.actRelatorioAgendaExecute(Sender: TObject);
begin
  ChamaForm('TfrmRelatorioAgenda', 'Listagem de telefones', UniApplication);
end;

procedure TMainForm.actEnvelopeExecute(Sender: TObject);
begin
  ChamaForm('TfrmEnvelopes', 'Envelopes', UniApplication);
end;

procedure TMainForm.SetEnableMenu(adm: Boolean);

  procedure SetVisibleAction(MenuItem: TMenuItem);
  var x: Integer;
  begin
    // se não encontrar a permissão
    if (not Lista_permissoes.Locate('MENUITEM', trim(MenuItem.Name),[])) and (not MenuItem.IsLine) then
    begin
      if (assigned(MenuItem.Action)) and (MenuItem.Action is TCustomAction) then
        TCustomAction(MenuItem.Action).Enabled := False
      else
        MenuItem.Enabled := False;
    end;

    for x := 0 to MenuItem.Count - 1 do
      SetVisibleAction(MenuItem.Items[x]);
  end;

var
  x: Integer;
begin
  if not adm then
  begin
      GetListaPermissoes;

      for x := 0 to self.ComponentCount - 1 do
      begin
        if Components[x] is TMenuItem then
          SetVisibleAction(TMenuItem(Components[x]));
      end;
  end;


  if assigned(Lista_permissoes) then
    FreeAndNil(Lista_permissoes);
end;

procedure TMainForm.SetConfigGlobal;
begin
  if Assigned(Global) then
    Global.Atualizar
  else
    Global := TConfigGlobal.Create;
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
  ChamaForm('TfrmEtiqueta', 'Configuração de etiquetas', UniApplication);
end;

procedure TMainForm.actPesqFoneExecute(Sender: TObject);
begin
  ChamaForm('TfrmPesqFone', 'Pesquisa de telefones', UniApplication);
end;

procedure TMainForm.actBancoExecute(Sender: TObject);
begin
  ChamaForm('TfrmBanco', 'Bancos', UniApplication);
end;

procedure TMainForm.actChequeExecute(Sender: TObject);
begin
  ChamaForm('TfrmCheque', 'Controle de cheques', UniApplication);
end;

procedure TMainForm.actRenovaChaveExecute(Sender: TObject);
begin
  ChamaForm('TfrmRenovaChave', 'Renovação da chave de liberação', UniApplication);
end;

procedure TMainForm.btnLogOffClick(Sender: TObject);
begin
  if actOutroUsuario.Enabled then
    actOutroUsuario.Execute;
end;

procedure TMainForm.btnNotificacoesClick(Sender: TObject);
begin
  frmNotificacoes := TfrmNotificacoes.Create(UniApplication);
  frmNotificacoes.Top := btnNotificacoes.Top + btnNotificacoes.Height;
  frmNotificacoes.Left := btnNotificacoes.Left;
  frmNotificacoes.Show();
end;

procedure TMainForm.btnOrcamentoClick(Sender: TObject);
begin
  if actOrcamento.Enabled then
    actOrcamento.Execute;
end;

procedure TMainForm.btnListaPrecoClick(Sender: TObject);
begin
  if actListaPreco.Enabled then
    actListaPreco.Execute;
end;

procedure TMainForm.btnProdutoClick(Sender: TObject);
begin
  if actProduto.Enabled then
    actProduto.Execute;
end;

procedure TMainForm.btnFornecedorClick(Sender: TObject);
begin
  if actFornecedor.Enabled then
    actFornecedor.Execute;
end;

procedure TMainForm.btnClienteClick(Sender: TObject);
begin
  if actCliente.Enabled then
    actCliente.Execute;
end;

procedure TMainForm.btnAgendaClick(Sender: TObject);
begin
  if actAgenda.Enabled then
     actAgenda.Execute;
end;


procedure TMainForm.SetSistema;
begin
  if Assigned(Sistema) then
    Sistema.Atualizar
  else
    Sistema := TSistema.Create;
end;

procedure TMainForm.UniFormCreate(Sender: TObject);
begin
  LoadHtmlMenu;

  SetSistema;
  SetEmpresa;
  SetConfiguracao;
  SetConfigGlobal;

  MenuActions := TMenuActions.Create(ListaAcoes);
end;

procedure TMainForm.UniFormResize(Sender: TObject);
begin
//   UniSimplePanel1.Top := 0;
//   UniSimplePanel1.Left := 250; // largura do menu lateral
//   UniSimplePanel1.Width := self.Width;
end;

procedure TMainForm.btnSairClick(Sender: TObject);
begin
  UniApplication.Restart;
end;

procedure TMainForm.actAjudaExecute(Sender: TObject);
begin
  ChamaHelp(Self, 0,'');
end;

procedure TMainForm.GetListaPermissoes;
begin
  with TdmAcesso.Create(nil) do
  try
    if not assigned(Lista_permissoes) then
      Lista_permissoes := GetListaAcesso(IdUsuario);
  finally
    Free;
  end;
end;

procedure TMainForm.LoadHtmlMenu;
var htmlFile: TStream;
    Bytes: TBytes;

  function HtmlToColor(s:string;aDefault:Tcolor):TColor;
  begin
    if copy(s,1,1)='#' then begin
      s:='$'+copy(s,6,2)+copy(s,4,2)+copy(s,2,2);
    end
    else
      s:='clNone';
    try
      result:=StringToColor(s);
    except
      result:=aDefault;
    end;
  end;

begin
   htmlFile := TFileStream.Create('./files/menu.html', fmOpenRead);
   try
     menuFrame.HTML.Clear;

     if htmlFile.Size>0 then begin
      SetLength(Bytes, htmlFile.Size);
      htmlFile.Read(Bytes[0], htmlFile.Size);
    end;

    menuFrame.HTML.Add(TEncoding.UTF8.GetString(Bytes));

   finally
     htmlFile.Free;
   end;


   UniPanel1.Color := HtmlToColor('#2e353d', clSilver);

end;

procedure TMainForm.actNotaPromissoriaExecute(Sender: TObject);
begin
  ChamaForm('TfrmPromissoria', 'Promissória avulsa', UniApplication);
end;

procedure TMainForm.actInfoSistemaExecute(Sender: TObject);
begin
  ChamaForm('TfrmInformacaoSistema', 'Informações sobre o sistema', UniApplication);
end;

procedure TMainForm.actVendedorExecute(Sender: TObject);
begin
  ChamaForm('TfrmVendedor', 'Vendedores', UniApplication);
end;

procedure TMainForm.actConfigNotaExecute(Sender: TObject);
begin
  ChamaForm('TfrmConfigNota', 'Configurãção da nota', UniApplication);
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  if Assigned(Configuracao) then
   FreeAndNil( Configuracao );

  if Assigned(Global) then
   FreeAndNil( Global );

  if Assigned(Empresa) then
   FreeAndNil( Empresa );

  if Assigned(Sistema) then
   FreeAndNil( Sistema );

   MenuActions.Free;
end;

procedure TMainForm.actPromocaoExecute(Sender: TObject);
begin
  ChamaForm('TfrmPromocao', 'Promoções', UniApplication);
end;

function TMainForm.ValidaDataAcesso(DataEncriptada: string;
  DataAtual: TDateTime; Connection: TSQLConnection): Boolean;

  procedure RegistraData(DataATual: TDateTime; Connection: TSQLConnection);
  begin
    with TSQLDataSet.Create(nil) do
    try
      SQLConnection := Connection;
      Close;
      CommandText := 'UPDATE SISTEMA SET DATA_ACESSO = :PDATA_ACESSO';
      Params.ParamByName('PDATA_ACESSO').AsString := EnDeCrypt( DateToStr( DataAtual));
      ExecSQL;
      Result := True;
    finally
      Free;
    end;
  end;

var
  Dias: Integer;
  DataUltimoAcesso: TDateTime;
begin
//
end;

function TMainForm.ValidaHD(HD, HDGravar: string;
  Connection: TSQLConnection): Boolean;
begin
  Result := True;
  if Trim(HD) = '' then
    UpdateSingleField('update SISTEMA s set s.HD = ' + QuotedStr(HDGravar))
  else
  begin
    if SerialHD(Copy(Application.ExeName, 1, 1)) <> HD then
    begin
      MsgErro('Cópia inválida do sistema, por favor entre em contato com o suporte para adquirir uma nova cópia.',
        'Cópia inválida');
      Result := False;
    end;
  end;
end;


procedure TMainForm.menuFrameAjaxEvent(Sender: TComponent; EventName: string;
  Params: TStrings);
begin
  MenuActions.AbrirForm(EventName);
end;

initialization
  RegisterAppFormClass(TMainForm);

end.
