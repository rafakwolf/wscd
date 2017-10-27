unit unPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ExtCtrls, Buttons, SqlExpr, Types, ActnList, DB,
  ConstPadrao, ShellAPI, ToolWin, AppEvnts,  udatabaseutils, crypto,
  StdCtrls, DBCtrls, DBClient, IniFiles, UniGuiForm, UniGUIDialogs,
  Provider, ImgList,  ImgUtils, unAguarde, FMTBcd, System.Actions, uniMainMenu,
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
    N11: TUniMenuItem;
    miBackupRestore: TUniMenuItem;
    miBackup: TUniMenuItem;
    miRestore: TUniMenuItem;
    N12: TUniMenuItem;
    miPostit: TUniMenuItem;
    miAuditoriaUser: TUniMenuItem;
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
    miInfo_sobreosistema: TUniMenuItem;
    miInfoAvisos: TUniMenuItem;
    miChamaAjuda: TUniMenuItem;
    miSobreSistema: TUniMenuItem;
    miSair: TUniMenuItem;
    miOutroUsuario: TUniMenuItem;
    N13: TUniMenuItem;
    miFechar: TUniMenuItem;
    miVisualizarDados: TUniMenuItem;
    miRepararIndices: TUniMenuItem;
    miExecutarScripts: TUniMenuItem;
    miLogs: TUniMenuItem;
    miCriarLog: TUniMenuItem;
    miAuditoria: TUniMenuItem;
    miLogOperacao: TUniMenuItem;
    miConsultaErro: TUniMenuItem;
    sbPrincipal: TUniStatusBar;
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
    btnSair: TUniSpeedButton;
    btnOrcamento: TUniSpeedButton;
    btnAtualizar: TUniSpeedButton;
    btnBackup: TUniSpeedButton;
    btnPromocao: TUniSpeedButton;
    bvlSeparaCaixa: TUniPanel;
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
    procedure actCalculadoraExecute(Sender: TObject);
    procedure actEditorTextoExecute(Sender: TObject);
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
    procedure FormCreate(Sender: TObject);
    procedure actRestoreExecute(Sender: TObject);
    procedure actEtiquetaExecute(Sender: TObject);
    procedure actPesqFoneExecute(Sender: TObject);
    procedure actBancoExecute(Sender: TObject);
    procedure actChequeExecute(Sender: TObject);
    procedure actRenovaChaveExecute(Sender: TObject);
    procedure tbCalculadoraClick(Sender: TObject);
    procedure tbCalendarioClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
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
    procedure actConfigServidorExecute(Sender: TObject);
    procedure actNotaPromissoriaExecute(Sender: TObject);
    procedure actInfoSistemaExecute(Sender: TObject);
    procedure actVendedorExecute(Sender: TObject);
    procedure actConfigNotaExecute(Sender: TObject);
    procedure actAtualizacaoExecute(Sender: TObject);
    procedure btnBackupClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure pmiMinimizarClick(Sender: TObject);
    procedure pmiMaximizarClick(Sender: TObject);
    procedure pmiFecharClick(Sender: TObject);
    procedure pmiAtualizacaoClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actPromocaoExecute(Sender: TObject);
    procedure btnPromocaoClick(Sender: TObject);
    procedure sbPrincipalMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormPaint(Sender: TObject);
    procedure actInfoAvisosExecute(Sender: TObject);
    procedure miRepararIndicesClick(Sender: TObject);
    procedure miVisualizarDadosClick(Sender: TObject);
    procedure miExecutarScriptsClick(Sender: TObject);
    procedure miCriarLogClick(Sender: TObject);
    procedure miAuditoriaClick(Sender: TObject);
    procedure miConsultaErroClick(Sender: TObject);
    procedure actAuditoriaUserExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  Private
    Lista_permissoes: TClientDataSet;

    AuxWidth, AuxHeight: Integer;
    SistemaOk: Boolean;

    copiando: Boolean;
    Atualizando: Boolean;
    pb: TProgressBar;
    fbitmap: TBitmap;

    procedure CarregaPapelParede;
    procedure CarregaToolBar;
    procedure VerificaSerial;
    procedure VerificaData;
    procedure VerificaHD;
    procedure SetEnableMenu(adm: Boolean);
    procedure SetConfigGlobal;
    procedure SetConfiguracao;
    procedure SetEmpresa;
    procedure CriaHintBalao;
    procedure SetSistema;
    procedure InfoAvisos;
    procedure GetListaPermissoes;

    function VerificaVersao: Boolean;
    procedure VerificacaoAutomatica;
    function ComputerIsServer: Boolean;

    procedure CopiaAutomatica;

    function ValidaDataAcesso(DataEncriptada: string; DataAtual: TDateTime;
      Connection: TSQLConnection): Boolean;
    function ValidaHD(HD, HDGravar: string; Connection: TSQLConnection): Boolean;

    procedure TerminateCopia(Sender: TObject);
    procedure ZipProgress(const Status: string; const PerCent: Integer);

    procedure ExportaMenu(filename: string);
  Protected
    procedure ConfiguracaoAlterado(var Msg: TMessage); Message WM_CONFIG_ALTERADO;
    procedure ConfigGlobalAlterado(var Msg: TMessage); Message WM_CONFIG_GLOBAL_ALTERADO;

  Public
  end;

 function MainForm: TfrmPrincipal;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  unAcesso, Funcoes, uUtilFncs, VarGlobal,  uniGUIVars, MainModule, uniGUIApplication,
  unSetupConnection, unExecutaScript, uClasses, udmAcesso, System.StrUtils;

{$R *.dfm}

function MainForm: TfrmPrincipal;
begin
   Result := TfrmPrincipal(UniMainModule.GetFormInstance(TfrmPrincipal));
end;

procedure TfrmPrincipal.VerificaSerial;
var
  //RetornoValidacao: TTipoValidacao;
  SimNao: Boolean;
begin
  SimNao := False;
 // RetornoValidacao := ValidaSerial(Sistema.Serial, Empresa.Nome + Empresa.Cnpj +
 //   Empresa.Cep);
//  case RetornoValidacao of
//    tvSerialErrado, tvChaveErrada:
//      begin
//        if UniGUIDialogs.MessageDlg('A chave de liberação informada está incorreta ' +
//          'ou ainda não foi informada, os dados da empresa também podem ter sido alterados.' + #13 +
//          'Deseja efetuar a correção agora?', 'Dados incorretos',
//          MB_YESNO or MB_ICONWARNING) = ID_YES then
//          SimNao := True
//        else
//          SimNao := False;
//      end;
//    tvExpirouPrazo:
//      begin
//        if UniGUIDialogs.MessageDlg('A chave de liberação está expirada.' + #13 +
//          'O sistema poderá ser bloqueado a qualquer momento. Por favor entre em contato ' +
//          'com o suporte para obter uma nova chave de liberação.' + #13 +
//          'Deseja informar uma nova chave de liberação agora?', 'Chave expirada',
//          MB_YESNO or MB_ICONWARNING) = ID_YES then
//          SimNao := True
//        else
//          SimNao := False;
//      end;
//    tvBloqueioSistema:
//      begin
//        if UniGUIDialogs.MessageDlg('CHAVE DE LIBERAÇÃO EXPIRADA.' + #13 +
//          'Seu sistema foi bloqueado pois sua chave de liberação expirou a mais de 3 dias. ' +
//          'Por favor entre em contato com o suporte para obter uma nova chave de liberação.' + #13 +
//          'Deseja informar uma nova chave de liberação?',
//          'Sistema bloqueado', MB_YESNO or MB_ICONERROR) = ID_YES then
//          SimNao := True
//        else
//          SimNao := False;
//      end;
//    tvPrazoMtoLongo:
//      begin
//        if UniGUIDialogs.MessageDlg('A chave de liberação informada está fora de um período válido. ' +
//          'Verifique a data do seu computador e se a chave foi digitada corretamente.' + #13 +
//          'Deseja informar uma nova chave de liberação?',
//          'Chave inválida', MB_YESNO or MB_ICONWARNING) = ID_YES then
//          SimNao := True
//        else
//          SimNao := False;
//      end;
//    tvPrimeiroAcesso:
//      begin
//        UniGUIDialogs.MessageDlg('Primeiro acesso, informe os dados de registro do sistema.',
//          'Registro do sistema', MB_OK + MB_ICONINFORMATION);
//        ChamaForm('TfrmRegistro', 'Registro - Validação do Serial', UniApplication);
//      end;
//  end;
//
//  if (RetornoValidacao <> tvValidacaoOk) then
//  begin
//    if (RetornoValidacao <> tvValidacaoOk) and (SimNao) then
//    begin
//      if (RetornoValidacao = tvExpirouPrazo) then
//        ChamaForm('TfrmRenovaChave', 'Renovação da chave de liberação', Self)
//      else
//        ChamaForm('TfrmRegistro', 'Registro - Validação do Serial', UniApplication);
//    end
//    else if (RetornoValidacao <> tvExpirouPrazo) then
//    begin
//      if UniGUIDialogs.MessageDlg(PChar('Não é possível utilizar o sistema sem informar uma chave de liberação válida. ' +
//        'Para obter uma nova chave, entre em contato com o suporte.' + #13 +
//        'Clique em OK para finalizar o sistema.'), 'Finalizando o sistema', MB_OKCANCEL or MB_ICONERROR) = ID_OK then
//      begin
//        SistemaOk := False;
//        Application.Terminate;
//      end
//      else
//        ChamaForm('TfrmRegistro', 'Registro - Validação do serial', UniApplication);
//    end;
//  end;
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

procedure TfrmPrincipal.actCalculadoraExecute(Sender: TObject);
begin
  ShellExecute(0,PChar('open'),PChar('calc'),PChar(''),PChar(''),SW_SHOW);
end;

procedure TfrmPrincipal.actEditorTextoExecute(Sender: TObject);
begin
  ShellExecute(0,PChar('open'),PChar('notepad'),PChar(''),PChar(''),SW_SHOW);
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
  if not TfrmAcesso.Execute(True) then
    MsgAviso('','Troca de usuário cancelada.')
  else
  begin
    SetEnableMenu(IdUsuario = 0);
  end;
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

procedure TfrmPrincipal.CarregaPapelParede;
begin
//  FBitmap := TBitmap.Create;
//  if FileExists(Configuracao.PapelParede) and (IdUsuario <> 99999) then
//  begin
//    if (AnsiUpperCase(ExtractFileExt(Configuracao.PapelParede)) = '.JPEG') or
//      (AnsiUpperCase(ExtractFileExt(Configuracao.PapelParede)) = '.JPG') then
//      FBitmap := LoadJpegIntoBitmap(Configuracao.PapelParede)
//    else
//      FBitmap.LoadFromFile(Configuracao.PapelParede);
//  end
//  else
//  begin
//    Self.Color := clBackground;
//  end;
//
//  Windows.InvalidateRect(Handle, nil, True);
end;

procedure TfrmPrincipal.ConfiguracaoAlterado(var Msg: TMessage);
begin
  SetConfiguracao;
  CarregaPapelParede;
  CarregaToolBar;
  CriaHintBalao;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  self.Caption := Application.Title;

  Atualizando := False;
  SistemaOk := False;

  AuxWidth := 0;
  AuxHeight := 0;

  CarregaPapelParede;
  SetZOrder(false);
end;

procedure TfrmPrincipal.actRestoreExecute(Sender: TObject);
begin
  ChamaForm('TfrmRestore', 'Voltar uma cópia dos dados', UniApplication);
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

  // modo administrador
  miVisualizarDados.Visible := adm;
  miRepararIndices.Visible := adm;
  miLogs.Visible := adm;
  miExecutarScripts.Visible := adm;

  // modo usuario normal
  {
  miCofiguracao.Visible := not adm;
  miUtilitario.Visible := not adm;
  miBackupRestore.Visible := not adm;
  miCadastro.Visible := not adm;
  miMovimento.Visible := not adm;
  miProdutoMovimento.Visible := not adm;
  miAjuda.Visible := not adm;
  miSair.Visible := not adm;

  btnAgenda.Visible := not adm;
  bvlSeparaAgenda.Visible := not adm;

  btnCliente.Visible := not adm;
  btnFornecedor.Visible := not adm;
  btnProduto.Visible := not adm;
  btnListaPreco.Visible := not adm;
  btnPromocao.Visible := not adm;
  bvlSeparaListaPreco.Visible := not adm;

  btnOrcamento.Visible := not adm;
  btnNotaCompra.Visible := not adm;
  btnNotaVenda.Visible := not adm;
  btnCheque.Visible := not adm;
  btnContaPagar.Visible := not adm;
  btnContaReceber.Visible := not adm;
  btnLivroCaixa.Visible := not adm;
  bvlSeparaBackup.Visible := not adm;

  btnBackup.Visible := not adm;
  btnAtualizar.Visible := not adm;
  bvlSeparaCaixa.Visible := not adm;

  btnLogOff.Visible := not adm;    }

  if adm then
    btnSair.Left := btnAgenda.Left
  else
    btnSair.Left := 904;

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

procedure TfrmPrincipal.btnSairClick(Sender: TObject);
begin
  if miFechar.Enabled then
    miFechar.Click;
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
  if miAgenda.Enabled then
    miAgenda.Click;
end;

procedure TfrmPrincipal.actPostItExecute(Sender: TObject);
begin
  ChamaForm('TfrmSendMail','Enviar Email',Application);
end;

procedure TfrmPrincipal.VerificaData;
begin
  //Sistema.Atualizar;
//  if not ValidaDataAcesso(Sistema.DataAcesso, Date, GetConnection) then
//  begin
//    MsgAviso('Por favor, corrija a data do computador e tente novamente.' + #13#10 +
//      'O sistema será finalizado.', 'Data inválida');
//    SistemaOk := False;
//    Application.Terminate;
//  end;
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

procedure TfrmPrincipal.CarregaToolBar;
begin
  try
    DoubleBuffered := True;
    pnAtalho.Visible := true
  finally
    DoubleBuffered := False;
  end;
end;

procedure TfrmPrincipal.actAjudaExecute(Sender: TObject);
begin
  ChamaHelp(Self, 0,'');
end;

procedure TfrmPrincipal.CriaHintBalao;
begin
  Application.HintColor := clInfoBk;
  Application.HintPause := 10;
  Application.HintHidePause := 100000;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
//  TfrmAguarde.Execute('Iniciando...');
//  try
//    SetSistema;
//    //SistemaOk := VerificaVersao;
//    SetEmpresa;
//    SetConfiguracao;
//    SetConfigGlobal;
//    CarregaToolBar;
//    AjustaStatusBar;
//    SetEnableMenu(IdUsuario = 0);
//    SetStatusBar;
//    CriaHintBalao;
//
//    if (IdUsuario <> 99999) then
//    begin
//      VerificaData;
//      //VerificaSerial;
//      //VerificaHD;
//    end;
//
//    if (IdUsuario <> 99999) then
//      InfoAvisos;
//
//    if Configuracao.ExibirDica then
//      actDicaDia.Execute;
//
//    { apos as atualizações vai mostrar "o que há de novo" no sistema }
////    if ReadIniFile('NEW', 'Mostrou') = 'N' then
////    begin
////      WriteIniFile('NEW', 'Mostrou', 'S');
////      ChamaHelp(Self, 6,'');
////    end;
//
////    if SistemaOk and ComputerIsServer then
////    begin
////      copiando := False;
////      CopiaAutomatica;
////    end;
//
//    frmAguarde.Fecha;
//    //ForceForegroundWindow(handle);
//  except
//    on e: exception do
//    begin
//      frmAguarde.Fecha;
//      ShowMEssage(e.Message);
//    end;
//  end;
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

procedure TfrmPrincipal.actConfigServidorExecute(Sender: TObject);
begin
  frmSetupConnection := TfrmSetupConnection.Create(Self);
  if frmSetupConnection.ShowModal = mrOk then
  begin
    MsgAviso('','Esta alteração só terá efeito da próxima vez que o sistema for iniciado.');
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

procedure TfrmPrincipal.actAtualizacaoExecute(Sender: TObject);
begin
//  if not SistemaOK then
//    Exit;
//
//  if not NetIsPresent then
//  begin
//    MsgCuidado('Verifique sua conexão com a internet.');
//    Exit;
//  end;
//
//  if Atualizando then
//  begin
//    MsgAviso('Atualização já está em andamento.');
//    Exit;
//  end;
//
//  if FileExists(ExtractFilePath(ParamStr(0)) + 'UpdateCPR.exe') then
//  begin
//    if FormatDateTime('dd/mm/yyyy', FileDateToDateTime(FileAge(ExtractFilePath(ParamStr(0)) + 'UpdateCPR.exe')))
//      = FormatDateTime('dd/mm/yyyy', Date) then
//    begin
//      if MsgSN('Já existe uma atualização baixada hoje! Deseja executá-la?') then
//      begin
//        WinExec(PansiChar(ExtractFilePath(ParamStr(0)) + 'UpdateCPR.exe'), SW_SHOWNORMAL);
//        Application.Terminate;
//        Abort;
//      end
//      else
//        DeleteFile(ExtractFilePath(ParamStr(0)) + 'UpdateCPR.exe');
//    end;
//  end;
//
//  VerificacaoAutomatica;
end;

function TfrmPrincipal.VerificaVersao: Boolean;
begin
  Result := False;  {
  if StrToInt(GetVersaoAppNoBuild) > StrToInt(Sistema.VersaoDB) then
  begin
    MsgAviso('Nova versão do sistema encontrada.' + #13#10 +
      'A atualização automáticamente iniciará agora.', 'Nova versão');
    if ComputerIsServer then
    begin
      GetDataModule.Conexao.Connected := False;
      frmLogAtualizacao := TfrmLogAtualizacao.Create(Self);
      if frmLogAtualizacao.ShowModal <> mrOk then
      begin
        MsgErro('Houveram problemas durante a atualização, entre em contado com suporte.');
        Result := False;
        Application.Terminate;
      end
      else
      begin
        MsgAviso('Atualização efetuada com sucesso. Versão ' + Sistema.VersaoApp + '.');
        Result := True;
        if not GetDataModule.Conexao.Connected then
          GetDataModule.Conexao.Connected := True;
      end;
    end
    else
    begin
      WinExec(PansiChar(ExtractFilePath(ParamStr(0)) + 'Update.exe rede'), SW_SHOW);
      Application.Terminate;
    end;
  end
  else if StrToInt(GetVersaoAppNoBuild) < StrToInt(Sistema.VersaoDB) then
  begin
    MsgCuidado('A versão da base de dados é mais recente que a versão do executável.' + #13 +
      'Entre em contato com suporte. ' +
      'O sistema será finalizado.');
    Result := False;
    Application.Terminate;
  end;   }
end;

procedure TfrmPrincipal.VerificaHD;
var
  Server: string;
begin       {
  Server := AnsiUpperCase(ReadIniFile('Conexao', 'Servidor'));
  Sistema.Atualizar;
  if ((Server = '127.0.0.1') or (Server = GetComputerName)) then
  begin
    if not ValidaHD(Sistema.HD, SerialHD(Copy(Application.ExeName, 1, 1)), GetConnection) then
    begin
      SistemaOk := False;
      Application.Terminate;
    end;
  end;   }
end;

procedure TfrmPrincipal.btnBackupClick(Sender: TObject);
begin
  if miBackup.Enabled then
    miBackup.Click;
end;

procedure TfrmPrincipal.btnAtualizarClick(Sender: TObject);
begin
  if miAtualizacao.Enabled then
    actAtualizacao.Execute;
end;

procedure TfrmPrincipal.pmiMinimizarClick(Sender: TObject);
begin
  Application.Minimize;
end;

procedure TfrmPrincipal.pmiMaximizarClick(Sender: TObject);
begin
  Application.Restore;
end;

procedure TfrmPrincipal.pmiFecharClick(Sender: TObject);
begin
  if miFechar.Enabled then
    actFechar.Execute;
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

  //DestroyIcone;
  if (fbitmap <> nil) then
    FBitmap.Free;
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

procedure TfrmPrincipal.VerificacaoAutomatica;
begin
  ChamaForm('TfrmForceAtualizacao', 'Atualização', UniApplication);
end;

procedure TfrmPrincipal.CopiaAutomatica;
begin
  pb := TProgressBar.Create(Self);
  pb.Height := 15;
  pb.Width := Trunc(sbPrincipal.Width div 3);
  pb.Top := sbPrincipal.Top - pb.Height;
  pb.Left := sbPrincipal.Left + Trunc(sbPrincipal.Width div 3) * 2;
  pb.Parent := Self;

  copiando := True;
end;


procedure TfrmPrincipal.sbPrincipalMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  BarWidth: Integer;
begin
  try
    sbPrincipal.ShowHint := False;
    BarWidth := sbPrincipal.Width div 3;
    if X < BarWidth then
      sbPrincipal.Hint := 'Usuário logado'
    else
    if (X > BarWidth) and (X < (sbPrincipal.Width - BarWidth)) then
      sbPrincipal.Hint := 'Servidor de dados'
    else
    if X > (BarWidth * 2) then
      sbPrincipal.Hint := 'Nome do computador';
  finally
    sbPrincipal.ShowHint := True;
  end;
end;

procedure TfrmPrincipal.FormPaint(Sender: TObject);
var
  i, j: Integer;
  linhas, colunas: Integer;
  rect: TRect;
begin
  if Configuracao.OrientPapelParede = '0' then
  begin
    linhas := height div FBitmap.height;

    if height mod FBitmap.height <> 0 then
      inc(linhas);

    colunas := width div FBitmap.width;

    if width mod FBitmap.width <> 0 then
      inc(colunas);

    for i := 0 to linhas - 1 do
      for j := 0 to colunas - 1 do
        canvas.draw(j * FBitmap.width, i * FBitmap.height, FBitmap);
  end
  else
  begin
    rect.Left := 0;
    rect.Top := 0;
    rect.Right := Application.MainForm.ClientWidth;
    rect.Bottom := Application.MainForm.ClientHeight;
    Canvas.StretchDraw(rect, FBitmap);
  end;
end;

procedure TfrmPrincipal.InfoAvisos;
begin
  if Configuracao.InfoAvisos then
    ChamaForm('TfrmInfoAvisos', 'Informaçãoes e avisos', UniApplication);
end;

procedure TfrmPrincipal.actInfoAvisosExecute(Sender: TObject);
begin
  ChamaForm('TfrminfoAvisos', 'Informações e avisos', UniApplication);
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

procedure TfrmPrincipal.TerminateCopia(Sender: TObject);
begin
  if Assigned(pb) then pb.Free;
  copiando := False;

  //if Configuracao.VerificaUPD and NetIsPresent then
  //  VerificacaoAutomatica;
end;

procedure TfrmPrincipal.ZipProgress(const Status: string; const PerCent: Integer);
begin
  pb.Hint := Status;
  pb.Position := PerCent;
end;

procedure TfrmPrincipal.miRepararIndicesClick(Sender: TObject);
begin
  ChamaForm('TfrmRepararIndice', 'Reparar índices', UniApplication);
end;

procedure TfrmPrincipal.miVisualizarDadosClick(Sender: TObject);
begin
  ChamaForm('TfrmVisualizarDados', 'Visualizar Dados', UniApplication);
end;

procedure TfrmPrincipal.miExecutarScriptsClick(Sender: TObject);
begin
  frmExecutaScript := TfrmExecutaScript.Create(Self);
  frmExecutaScript.ShowModal;
  FreeAndNil(frmExecutaScript);
end;

procedure TfrmPrincipal.miCriarLogClick(Sender: TObject);
begin
  ChamaForm('TfrmCriaTabelaLog', 'Criar tabelas de log de registro', UniApplication);
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

function TfrmPrincipal.ComputerIsServer: Boolean;
begin
  with TIniFile.Create(ExtractFilePath(ParamStr(0))+'cfg.ini') do try
  Result :=
    ((ReadString('Conexao', 'Servidor','localhost') = '127.0.0.1') or
    (ReadString('Conexao', 'Servidor','localhost') = GetComputerName));
  finally
    free;
  end;
end;

procedure TfrmPrincipal.ExportaMenu(filename: string);

  procedure AddLinha(pId: Integer; pName: String; pParent: Integer;
    pOrdem: Integer; MenuItem: TMenuItem; sl: TStringList);
  begin
    sl.AddObject('insert into MENU ' +
      'select cast(' + IntToStr(pId) + ' as INTEGER), '+
      'cast(' + #39 + pName    + #39 + ' as VARCHAR(80)), ' +
      'cast(' + IntToStr(pOrdem) + ' as INTEGER), ' +
      'cast(' + IfThen(pParent > 0, IntToStr(pParent), 'NULL') + ' as INTEGER), ' +
      'cast(1 as INTEGER)'+
      ' from RDB$DATABASE;', MenuItem);
  end;

  procedure AddItem(MenuItem: TMenuItem; sl: TStringList; Root: Boolean);
  var IdPai, x: Integer;
  begin
    if not MenuItem.IsLine then
    begin
      if not Root then
      begin
        for x := 0 to sl.Count - 1 do
        begin
          if sl.Objects[x] = MenuItem.Parent then
          begin
            IdPai := x + 1;
            Break;
          end;
        end;
      end
      else
        IdPai := 1;
      AddLinha(sl.Count + 1, MenuItem.Name, IdPai, MenuItem.MenuIndex + 1,
        MenuItem, sl);
      for x := 0 to MenuItem.Count - 1 do
        AddItem(MenuItem.Items[x], sl, False);
    end;
  end;

var
  x  : Integer;
  sl : TStringList;
begin
  inherited;
  sl := TStringList.Create;
  AddLinha(1, 'CPR', -1, 1, nil, sl);

  for x := 0 to mnPrincipal.Items.Count - 1 do
  begin
    if mnPrincipal.Items[x].Tag  = 0 then
      AddItem(mnPrincipal.Items[x], sl, True);
  end;

  sl.savetofile(filename);
end;

procedure TfrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  if (ssCtrl in Shift) and (ssAlt in Shift) and (Key = VK_F10) then
//    ExportaMenu(ExtractFilePath(ParamStr(0))+'menu.sql');
end;

initialization
  RegisterAppFormClass(TfrmPrincipal);

end.
