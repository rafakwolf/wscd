unit unPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ExtCtrls, Buttons, SqlExpr, Types, ActnList, DB,
  ConstPadrao, ShellAPI, ToolWin, AppEvnts,  udatabaseutils, crypto,
  StdCtrls, DBCtrls, DBClient, IniFiles, UniGuiForm, UniGUIDialogs,
  Provider, ImgList,  ImgUtils, FMTBcd, System.Actions, uniMainMenu,
  uniGUIBaseClasses, uniGUIClasses, uniButton, uniBitBtn, uniSpeedButton,
  uniStatusBar, uniPanel, uniToolBar;

type
  TfrmPrincipal = class(TUniForm)
    ListaAcoes: TActionList;
    actCidade: TAction;
    actUnidade: TAction;
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
    mnPrincipal: TUniMainMenu;
    miCofiguracao: TUniMenuItem;
    miCidade: TUniMenuItem;
    miUnidade: TUniMenuItem;
    miGrupo: TUniMenuItem;
    miAliquotaIcms: TUniMenuItem;
    miNomesCaixas: TUniMenuItem;
    miCfop: TUniMenuItem;
    miBanco: TUniMenuItem;
    miVendedor: TUniMenuItem;
    miEtiqueta: TUniMenuItem;
    N17: TUniMenuItem;
    miConfigNota: TUniMenuItem;
    N7: TUniMenuItem;
    miConfiguracaoGlobal: TUniMenuItem;
    miConfiguracaoLocal: TUniMenuItem;
    miImpressora: TUniMenuItem;
    miConfigServidor: TUniMenuItem;
    N1: TUniMenuItem;
    miDadosEmpresa: TUniMenuItem;
    N21: TUniMenuItem;
    miUsuario: TUniMenuItem;
    miPerfis: TUniMenuItem;
    miTrocarSenha: TUniMenuItem;
    miRenovaChave: TUniMenuItem;
    miUtilitario: TUniMenuItem;
    miAgenda: TUniMenuItem;
    miRelatorioAgenda: TUniMenuItem;
    N16: TUniMenuItem;
    miPesqFone: TUniMenuItem;
    N6: TUniMenuItem;
    miCalendario: TUniMenuItem;
    miCalculadora: TUniMenuItem;
    miEditorTexto: TUniMenuItem;
    miEnvelope: TUniMenuItem;
    N4: TUniMenuItem;
    miDuplicata: TUniMenuItem;
    miNotaPromissoria: TUniMenuItem;
    miRecibo: TUniMenuItem;
    miCadastro: TUniMenuItem;
    miCliente: TUniMenuItem;
    N2: TUniMenuItem;
    miProduto: TUniMenuItem;
    N3: TUniMenuItem;
    miFornecedor: TUniMenuItem;
    miMovimento: TUniMenuItem;
    miContasPagar: TUniMenuItem;
    miContasReceber: TUniMenuItem;
    N5: TUniMenuItem;
    miOrcamento: TUniMenuItem;
    miVenda: TUniMenuItem;
    miCompra: TUniMenuItem;
    N18: TUniMenuItem;
    miPerda: TUniMenuItem;
    miCheque: TUniMenuItem;
    N22: TUniMenuItem;
    miPromocoes: TUniMenuItem;
    N15: TUniMenuItem;
    miCaixa: TUniMenuItem;
    N8: TUniMenuItem;
    miProdutoMovimento: TUniMenuItem;
    miDesmarcaProduto: TUniMenuItem;
    miExcluirProduto: TUniMenuItem;
    miListaPreco: TUniMenuItem;
    N9: TUniMenuItem;
    miEtiquetaProduto: TUniMenuItem;
    miAjuda: TUniMenuItem;
    miDicaDia: TUniMenuItem;
    miAtualizacao: TUniMenuItem;
    N10: TUniMenuItem;
    miChamaAjuda: TUniMenuItem;
    miSobreSistema: TUniMenuItem;
    miSair: TUniMenuItem;
    miOutroUsuario: TUniMenuItem;
    miVisualizarDados: TUniMenuItem;
    clbrPrincipal: TUniToolBar;
    pnAtalho: TUniContainerPanel;
    btnAgenda: TUniSpeedButton;
    btnCliente: TUniSpeedButton;
    btnFornecedor: TUniSpeedButton;
    btnProduto: TUniSpeedButton;
    btnListaPreco: TUniSpeedButton;
    btnNotaCompra: TUniSpeedButton;
    btnNotaVenda: TUniSpeedButton;
    btnCheque: TUniSpeedButton;
    btnContaPagar: TUniSpeedButton;
    btnContaReceber: TUniSpeedButton;
    btnLivroCaixa: TUniSpeedButton;
    btnLogOff: TUniSpeedButton;
    btnOrcamento: TUniSpeedButton;
    btnPromocao: TUniSpeedButton;
    bvlSeparaListaPreco: TUniPanel;
    bvlSeparaAgenda: TUniPanel;
    bvlSeparaBackup: TUniPanel;
    procedure actGrupoExecute(Sender: TObject);
    procedure actCidadeExecute(Sender: TObject);
    procedure actUnidadeExecute(Sender: TObject);
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
    procedure tbCalculadoraClick(Sender: TObject);
    procedure tbCalendarioClick(Sender: TObject);
    procedure btnLogOffClick(Sender: TObject);
    procedure btnLivroCaixaClick(Sender: TObject);
    procedure btnContaReceberClick(Sender: TObject);
    procedure btnContaPagarClick(Sender: TObject);
    procedure btnChequeClick(Sender: TObject);
    procedure btnNotaVendaClick(Sender: TObject);
    procedure btnNotaCompraClick(Sender: TObject);
    procedure btnOrcamentoClick(Sender: TObject);
    procedure btnListaPrecoClick(Sender: TObject);
    procedure btnProdutoClick(Sender: TObject);
    procedure btnFornecedorClick(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure btnAgendaClick(Sender: TObject);
    procedure actPostItExecute(Sender: TObject);
    procedure actAjudaExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actNotaPromissoriaExecute(Sender: TObject);
    procedure actInfoSistemaExecute(Sender: TObject);
    procedure actVendedorExecute(Sender: TObject);
    procedure actConfigNotaExecute(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure pmiAtualizacaoClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actPromocaoExecute(Sender: TObject);
    procedure btnPromocaoClick(Sender: TObject);
    procedure miVisualizarDadosClick(Sender: TObject);
    procedure miAuditoriaClick(Sender: TObject);
    procedure miConsultaErroClick(Sender: TObject);
    procedure actAuditoriaUserExecute(Sender: TObject);
  Private
    Lista_permissoes: TClientDataSet;

    procedure VerificaData;
    procedure SetEnableMenu(adm: Boolean);
    procedure SetConfigGlobal;
    procedure SetConfiguracao;
    procedure SetEmpresa;
    procedure SetSistema;
    procedure GetListaPermissoes;


    function ValidaDataAcesso(DataEncriptada: string; DataAtual: TDateTime;
      Connection: TSQLConnection): Boolean;
    function ValidaHD(HD, HDGravar: string; Connection: TSQLConnection): Boolean;

  Protected
    procedure ConfiguracaoAlterado(var Msg: TMessage); Message WM_CONFIG_ALTERADO;
    procedure ConfigGlobalAlterado(var Msg: TMessage); Message WM_CONFIG_GLOBAL_ALTERADO;

  Public
  end;

function MainForm: TfrmPrincipal;

implementation

uses
  unAcesso, Funcoes, uUtilFncs, VarGlobal,  uniGUIVars, MainModule, uniGUIApplication,
  uClasses, udmAcesso;

{$R *.dfm}

function MainForm: TfrmPrincipal;
begin
   Result := TfrmPrincipal(UniMainModule.GetFormInstance(TfrmPrincipal));
end;

procedure TfrmPrincipal.actGrupoExecute(Sender: TObject);
begin
  ChamaForm('TfrmCadastroGrupo', 'Cadastro de grupos', UniApplication);
end;

procedure TfrmPrincipal.actCidadeExecute(Sender: TObject);
begin
  ChamaForm('TfrmCadastroCidade', 'Cadastro de cidades', UniApplication);
end;

procedure TfrmPrincipal.actUnidadeExecute(Sender: TObject);
begin
  ChamaForm('TfrmCadastroUnidade', 'Cadastro de unidades', UniApplication);
end;

procedure TfrmPrincipal.actAliquotaIcmsExecute(Sender: TObject);
begin
  ChamaForm('TfrmAliquota', 'Cadastro de aliquotas', UniApplication);
end;

procedure TfrmPrincipal.actContaCaixaExecute(Sender: TObject);
begin
  ChamaForm('TfrmCadastroCaixa', 'Contas caixa', UniApplication);
end;

procedure TfrmPrincipal.actCfopExecute(Sender: TObject);
begin
  ChamaForm('TfrmCadastroCfop', 'Cadastro de CFOP', UniApplication);
end;

procedure TfrmPrincipal.actConfiguracaoGlobalExecute(Sender: TObject);
begin
  ChamaForm('TfrmConfigGlobal', 'Configurações globais', UniApplication);
end;

procedure TfrmPrincipal.actConfiguracaoLocalExecute(Sender: TObject);
begin
  ChamaForm('TfrmConfiguracao', 'Configurações locais', UniApplication);
end;

procedure TfrmPrincipal.actDadosEmpresaExecute(Sender: TObject);
begin
  ChamaForm('TfrmDadosEmpresa', 'Dados da empresa', UniApplication);
end;

procedure TfrmPrincipal.actUsuarioExecute(Sender: TObject);
begin
  ChamaForm('TfrmUsuarioItemMenu', 'Usuários', UniApplication);
end;

procedure TfrmPrincipal.actAgendaExecute(Sender: TObject);
begin
  ChamaForm('TfrmAgenda', 'Agenda de telefones', UniApplication);
end;

procedure TfrmPrincipal.actCalendarioExecute(Sender: TObject);
begin
  ChamaForm('TfrmCalendario', 'Calendário', UniApplication);
end;

procedure TfrmPrincipal.actDuplicataExecute(Sender: TObject);
begin
  ChamaForm('TfrmDuplicatas', 'Cadastro e impressão de duplicatas', UniApplication);
end;

procedure TfrmPrincipal.actBackupExecute(Sender: TObject);
begin
  ChamaForm('TfrmBackup', 'Fazer uma cópia dos dados', UniApplication);
end;

procedure TfrmPrincipal.actClienteExecute(Sender: TObject);
begin
  ChamaForm('TfrmCliente', 'Cadastro de clientes', UniApplication);
end;

procedure TfrmPrincipal.actProdutoExecute(Sender: TObject);
begin
  ChamaForm('TfrmProduto', 'Cadastro de produtos', UniApplication);
end;

procedure TfrmPrincipal.actFornecedorExecute(Sender: TObject);
begin
  ChamaForm('TfrmFornecedor', 'Cadastro de fornecedores', UniApplication);
end;

procedure TfrmPrincipal.actContasPagarExecute(Sender: TObject);
begin
  ChamaForm('TfrmCP', 'Contas a pagar', UniApplication);
end;

procedure TfrmPrincipal.actContasReceberExecute(Sender: TObject);
begin
  ChamaForm('TfrmCR', 'Contas a receber', UniApplication);
end;

procedure TfrmPrincipal.actOrcamentoExecute(Sender: TObject);
begin
  ChamaForm('TfrmOrcamentos', 'Orçamentos', UniApplication);
end;

procedure TfrmPrincipal.actVendaExecute(Sender: TObject);
begin
  ChamaForm('TfrmVendas', 'Vendas', UniApplication);
end;

procedure TfrmPrincipal.actCompraExecute(Sender: TObject);
begin
  ChamaForm('TfrmNotasFiscais', 'Compras', UniApplication);
end;

procedure TfrmPrincipal.actPerdaExecute(Sender: TObject);
begin
  ChamaForm('TfrmPerda', 'Perdas de produtos', UniApplication);
end;

procedure TfrmPrincipal.actCaixaExecute(Sender: TObject);
begin
  ChamaForm('TfrmCaixa', 'Livro caixa', UniApplication);
end;

procedure TfrmPrincipal.actDesmarcaProdutoExecute(Sender: TObject);
begin
  ChamaForm('TfrmDesmarcar', 'Produtos novos e alterados', UniApplication);
end;

procedure TfrmPrincipal.actExcluirProdutoExecute(Sender: TObject);
begin
  ChamaForm('TfrmExclusaoProduto', 'Exclusão de produtos', UniApplication);
end;

procedure TfrmPrincipal.actListaPrecoExecute(Sender: TObject);
begin
  ChamaForm('TfrmListagemPrecos', 'Lista de preços', UniApplication);
end;

procedure TfrmPrincipal.actEtiquetaProdutoExecute(Sender: TObject);
begin
  ChamaForm('TfrmEtiquetaProduto', 'Etiquetas de produtos', UniApplication);
end;

procedure TfrmPrincipal.actOutroUsuarioExecute(Sender: TObject);
begin
//  if not TfrmAcesso.Execute(True) then
//    MsgAviso('','Troca de usuário cancelada.')
//  else
//  begin
//    SetEnableMenu(IdUsuario = 0);
//  end;
end;

procedure TfrmPrincipal.actFecharExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.actSobreSistemaExecute(Sender: TObject);
begin
  ChamaForm('TfrmSobre', 'Sobre o sistema', UniApplication);
end;

procedure TfrmPrincipal.actDicaDiaExecute(Sender: TObject);
begin
  ChamaForm('TfrmDicas', 'Dica do dia', UniApplication);
end;

procedure TfrmPrincipal.actPerfisExecute(Sender: TObject);
begin
  ChamaForm('TfrmPerfilPermissao', 'Perfis e permissões de usuários', UniApplication);
end;

procedure TfrmPrincipal.actTrocaSenhaExecute(Sender: TObject);
begin
  ChamaForm('TfrmTrocaSenha', 'Trocar senha', UniApplication);
end;

procedure TfrmPrincipal.actReciboExecute(Sender: TObject);
begin
  ChamaForm('TfrmRecibo', 'Recibos', UniApplication);
end;

procedure TfrmPrincipal.actRelatorioAgendaExecute(Sender: TObject);
begin
  ChamaForm('TfrmRelatorioAgenda', 'Listagem de telefones', UniApplication);
end;

procedure TfrmPrincipal.actEnvelopeExecute(Sender: TObject);
begin
  ChamaForm('TfrmEnvelopes', 'Envelopes', UniApplication);
end;

procedure TfrmPrincipal.ConfiguracaoAlterado(var Msg: TMessage);
begin
  SetConfiguracao;
end;

procedure TfrmPrincipal.SetEnableMenu(adm: Boolean);

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

  miVisualizarDados.Visible := adm;


  if assigned(Lista_permissoes) then
    FreeAndNil(Lista_permissoes);
end;

procedure TfrmPrincipal.SetConfigGlobal;
begin
  if Assigned(Global) then
    Global.Atualizar
  else
    Global := TConfigGlobal.Create;
end;

procedure TfrmPrincipal.SetConfiguracao;
begin
  if Assigned(Configuracao) then
    Configuracao.Atualizar
  else
  begin
    Configuracao := TConfiguracao.Create;
    Configuracao.Atualizar;
  end;
end;

procedure TfrmPrincipal.SetEmpresa;
begin
  if Assigned(Empresa) then
    Empresa.Atualizar
  else
    Empresa := TEmpresa.Create;

  self.Caption := Application.Title + ' - ' + Sistema.VersaoApp + ' - ' + Empresa.Nome;
end;

procedure TfrmPrincipal.actEtiquetaExecute(Sender: TObject);
begin
  ChamaForm('TfrmEtiqueta', 'Configuração de etiquetas', UniApplication);
end;

procedure TfrmPrincipal.actPesqFoneExecute(Sender: TObject);
begin
  ChamaForm('TfrmPesqFone', 'Pesquisa de telefones', UniApplication);
end;

procedure TfrmPrincipal.actBancoExecute(Sender: TObject);
begin
  ChamaForm('TfrmBanco', 'Bancos', UniApplication);
end;

procedure TfrmPrincipal.actChequeExecute(Sender: TObject);
begin
  ChamaForm('TfrmCheque', 'Controle de cheques', UniApplication);
end;

procedure TfrmPrincipal.actRenovaChaveExecute(Sender: TObject);
begin
  ChamaForm('TfrmRenovaChave', 'Renovação da chave de liberação', UniApplication);
end;

procedure TfrmPrincipal.tbCalculadoraClick(Sender: TObject);
begin
  if miCalculadora.Enabled then
    miCalculadora.Click;
end;

procedure TfrmPrincipal.tbCalendarioClick(Sender: TObject);
begin
  if miCalendario.Enabled then
    miCalendario.Click;
end;

procedure TfrmPrincipal.btnLogOffClick(Sender: TObject);
begin
  if miOutroUsuario.Enabled then
    miOutroUsuario.Click;
end;

procedure TfrmPrincipal.btnLivroCaixaClick(Sender: TObject);
begin
  if miCaixa.Enabled then
    miCaixa.Click;
end;

procedure TfrmPrincipal.btnContaReceberClick(Sender: TObject);
begin
  if miContasReceber.Enabled then
    miContasReceber.Click;
end;

procedure TfrmPrincipal.btnContaPagarClick(Sender: TObject);
begin
  if miContasPagar.Enabled then
    miContasPagar.Click;
end;

procedure TfrmPrincipal.btnChequeClick(Sender: TObject);
begin
  if miCheque.Enabled then
    miCheque.Click;
end;

procedure TfrmPrincipal.btnNotaVendaClick(Sender: TObject);
begin
  if miVenda.Enabled then
    miVenda.Click;
end;

procedure TfrmPrincipal.btnNotaCompraClick(Sender: TObject);
begin
  if miCompra.Enabled then
    miCompra.Click;
end;

procedure TfrmPrincipal.btnOrcamentoClick(Sender: TObject);
begin
  if miOrcamento.Enabled then
    miOrcamento.Click;
end;

procedure TfrmPrincipal.btnListaPrecoClick(Sender: TObject);
begin
  if miListaPreco.Enabled then
    miListaPreco.Click;
end;

procedure TfrmPrincipal.btnProdutoClick(Sender: TObject);
begin
  if miProduto.Enabled then
    miProduto.Click;
end;

procedure TfrmPrincipal.btnFornecedorClick(Sender: TObject);
begin
  if miFornecedor.Enabled then
    miFornecedor.Click;
end;

procedure TfrmPrincipal.btnClienteClick(Sender: TObject);
begin
  if miCliente.Enabled then
    miCliente.Click;
end;

procedure TfrmPrincipal.btnAgendaClick(Sender: TObject);
begin
  if actAgenda.Enabled then
     actAgenda.Execute;
end;

procedure TfrmPrincipal.actPostItExecute(Sender: TObject);
begin
  ChamaForm('TfrmSendMail','Enviar Email',Application);
end;

procedure TfrmPrincipal.VerificaData;
begin
end;

procedure TfrmPrincipal.SetSistema;
begin
  if Assigned(Sistema) then
    Sistema.Atualizar
  else
    Sistema := TSistema.Create;
end;

procedure TfrmPrincipal.ConfigGlobalAlterado(var Msg: TMessage);
begin
  SetConfigGlobal;
end;

procedure TfrmPrincipal.actAjudaExecute(Sender: TObject);
begin
  ChamaHelp(Self, 0,'');
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
    SetSistema;
    SetEmpresa;
    SetConfiguracao;
    SetConfigGlobal;
end;

procedure TfrmPrincipal.GetListaPermissoes;
begin
  with TdmAcesso.Create(self) do
  try
    if not assigned(Lista_permissoes) then
      Lista_permissoes := GetListaAcesso(IdUsuario);
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.actNotaPromissoriaExecute(Sender: TObject);
begin
  ChamaForm('TfrmPromissoria', 'Promissória avulsa', UniApplication);
end;

procedure TfrmPrincipal.actInfoSistemaExecute(Sender: TObject);
begin
  ChamaForm('TfrmInformacaoSistema', 'Informações sobre o sistema', UniApplication);
end;

procedure TfrmPrincipal.actVendedorExecute(Sender: TObject);
begin
  ChamaForm('TfrmVendedor', 'Vendedores', UniApplication);
end;

procedure TfrmPrincipal.actConfigNotaExecute(Sender: TObject);
begin
  ChamaForm('TfrmConfigNota', 'Configurãção da nota', UniApplication);
end;

procedure TfrmPrincipal.btnAtualizarClick(Sender: TObject);
begin
  if miAtualizacao.Enabled then
    actAtualizacao.Execute;
end;

procedure TfrmPrincipal.pmiAtualizacaoClick(Sender: TObject);
begin
  if miAtualizacao.Enabled then
    actAtualizacao.Execute;
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  if Assigned(Configuracao) then
   FreeAndNil( Configuracao );

  if Assigned(Global) then
   FreeAndNil( Global );

  if Assigned(Empresa) then
   FreeAndNil( Empresa );

  if Assigned(Sistema) then
   FreeAndNil( Sistema );

end;

procedure TfrmPrincipal.actPromocaoExecute(Sender: TObject);
begin
  ChamaForm('TfrmPromocao', 'Promoções', UniApplication);
end;

procedure TfrmPrincipal.btnPromocaoClick(Sender: TObject);
begin
  if miPromocoes.Enabled then
    miPromocoes.Click;
end;


function TfrmPrincipal.ValidaDataAcesso(DataEncriptada: string;
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
//  Result := False;
//
//  if (DataEncriptada = '') then
//  begin
//    if UniGUIDialogs.MessageDlg('Primeiro acesso ao sistema.' + #13#10 +
//      'O sistema utiliza a data de acesso para validar sua chave de liberação.' + #13#10 +
//      'A data atual do seu computador é ' +
//      FormatDateTime('dd/mm/yyyy', DataAtual) + ', continua?',
//      TMsgDlgType.mtConfirmation,[TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo],
//
//      procedure (sender: TComponent; res: Integer)
//      begin
//        if (res = ID_YES) then
//           RegistraData(DataAtual, Connection)
//      end) then
//
//    else
//    begin
//      UniGUIDialogs.MessageDlg('Por favor, corrija a data do computador e tente novamente.' + #13#10 +
//        'O sistema será finalizado.', 'Data inválida', MB_OK or MB_ICONINFORMATION);
//      Application.Terminate;
//      Abort;
//    end;
//  end
//  else
//  begin
//    DataUltimoAcesso := StrToDate( EnDeCrypt(DataEncriptada) );
//
//    Dias := Trunc(DataAtual - DataUltimoAcesso);
//
//    if (Dias > 3) then
//    begin
//      if UniGUIDialogs.MessageDlg(PChar('A última abertura do sistema foi registrada com a data ' +
//        FormatDateTime('dd/mm/yyyy', DataUltimoAcesso) + '.' + #13#10 +
//        'O registro de uma data incorreta pode invalidar a chave de liberação deste sistema' + #13#10 +
//        'e não será possível desfazer esta operação sem uma nova chave.' + #13#10 +
//        'Tem certeza que deseja registrar a data atual ' + FormatDateTime('dd/mm/yyyy', DataAtual) +
//        ' como sendo a nova data de acesso?'), 'Violação de data',
//        MB_YESNO or MB_ICONQUESTION) = ID_YES then
//      begin
//        RegistraData(DataAtual, Connection);
//      end
//      else
//      begin
//        UniGUIDialogs.MessageDlg('Por favor, corrija a data do computador e tente novamente.' + #13#10 +
//          'O sistema será finalizado.', 'Data inválida', MB_OK or MB_ICONINFORMATION);
//        Application.Terminate;
//        Abort;
//      end;
//    end
//    else
//      if (Dias < 0) then
//      begin
//        UniGUIDialogs.MessageDlg(PChar('A data do último acesso ao sistema foi ' +
//          FormatDateTime('dd/mm/yyyy', DataUltimoAcesso) + '.' + #13 +
//          'Não é possível abrir o sistema com a data atual sendo inferior à do último acesso.' + #13 +
//          'Por favor, corrija a data do computador e tente novamente.' + #13#13 +
//          'O sistema será finalizado.'), 'Data inválida', MB_OK or MB_ICONINFORMATION);
//        Application.Terminate;
//        Abort;
//      end
//      else
//      begin
//        RegistraData(DataAtual, Connection);
//      end;
//  end;
end;

function TfrmPrincipal.ValidaHD(HD, HDGravar: string;
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


procedure TfrmPrincipal.miVisualizarDadosClick(Sender: TObject);
begin
  ChamaForm('TfrmVisualizarDados', 'Visualizar Dados', UniApplication);
end;

procedure TfrmPrincipal.miAuditoriaClick(Sender: TObject);
begin
  ChamaForm('TfrmAuditoriaRegistro', 'Auditoria de registros', UniApplication);
end;

procedure TfrmPrincipal.miConsultaErroClick(Sender: TObject);
begin
  ChamaForm('TfrmConsultaLogErro', 'Log de erros', UniApplication);
end;

procedure TfrmPrincipal.actAuditoriaUserExecute(Sender: TObject);
begin
  ChamaForm('TfrmAuditoriaRegistro', 'Auditoria de registros', UniApplication);
end;

initialization
  RegisterMainFormClass(TfrmPrincipal);

end.
