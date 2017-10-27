unit unConfiguracao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons,
  ExtCtrls, ComCtrls, DBClient, Provider, SqlExpr, DBCtrls, Mask,
   ExtDlgs, FileCtrl, IdMessage, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTP,
  IdExplicitTLSClientServerBase, IdSMTPBase, FMTBcd, System.Actions, uniBitBtn,
  uniButton, uniSpeedButton, uniGUIClasses, uniPanel, uniGUIBaseClasses,
  uniStatusBar, uniEdit, uniCheckBox, uniImage, uniDBEdit, uniGroupBox,
  uniDBCheckBox, uniPageControl;

type
  TfrmConfiguracao = class(TfrmPadrao)
    sqldPadrao: TSQLDataSet;
    dspPadrao: TDataSetProvider;
    cdsPadrao: TClientDataSet;
    opImagem: TOpenPictureDialog;
    IdSMTP: TIdSMTP;
    IdMsg: TIdMessage;
    sqldPadraoIDCONFIGURACAO: TIntegerField;
    sqldPadraoNOMECOMPUTADOR: TStringField;
    sqldPadraoBARRAFERRAMENTA: TStringField;
    sqldPadraoHINTBALAO: TStringField;
    sqldPadraoGRAVAERRO: TStringField;
    sqldPadraoBACKUP: TStringField;
    sqldPadraoLOG: TStringField;
    sqldPadraoIMPRESSORA: TStringField;
    sqldPadraoRESOLUCAO: TStringField;
    sqldPadraoLETRACODIGOBARRA: TStringField;
    sqldPadraoEXIBEDICADIA: TStringField;
    sqldPadraoAVISACLIENTEATRASO: TStringField;
    sqldPadraoDIREXPORTPADRAO: TStringField;
    sqldPadraoSENHAESTOQUE: TStringField;
    sqldPadraoUSARSENHAESTOQUE: TStringField;
    sqldPadraoESTOQUEPADRAO: TIntegerField;
    sqldPadraoBORDAETQPROD: TStringField;
    sqldPadraoALIQUOTAPADRAO: TIntegerField;
    sqldPadraoALIQUOTA: TStringField;
    sqldPadraoDESCPADRAOPROD: TFMTBCDField;
    sqldPadraoCAIXAPADRAO: TIntegerField;
    sqldPadraoCAIXA: TStringField;
    sqldPadraoSENHACAIXA: TStringField;
    sqldPadraoPRODSEMESTOQORCAM: TStringField;
    sqldPadraoORCAMNAOCONC: TStringField;
    sqldPadraoEDITORCAMCONC: TStringField;
    sqldPadraoCOMPRANAOCONC: TStringField;
    sqldPadraoEDITCOMPRACONC: TStringField;
    sqldPadraoPRODSEMESTOQVENDA: TStringField;
    sqldPadraoVENDANAOCONC: TStringField;
    sqldPadraoEDITVENDACONC: TStringField;
    sqldPadraoBORDAETQCLIENTE: TStringField;
    sqldPadraoMOSTRARSALDOCAIXA: TStringField;
    sqldPadraoCAIXA90DIAS: TStringField;
    sqldPadraoRELZEBRADO: TStringField;
    cdsPadraoIDCONFIGURACAO: TIntegerField;
    cdsPadraoNOMECOMPUTADOR: TStringField;
    cdsPadraoBARRAFERRAMENTA: TStringField;
    cdsPadraoHINTBALAO: TStringField;
    cdsPadraoGRAVAERRO: TStringField;
    cdsPadraoBACKUP: TStringField;
    cdsPadraoLOG: TStringField;
    cdsPadraoIMPRESSORA: TStringField;
    cdsPadraoRESOLUCAO: TStringField;
    cdsPadraoLETRACODIGOBARRA: TStringField;
    cdsPadraoEXIBEDICADIA: TStringField;
    cdsPadraoAVISACLIENTEATRASO: TStringField;
    cdsPadraoDIREXPORTPADRAO: TStringField;
    cdsPadraoSENHAESTOQUE: TStringField;
    cdsPadraoUSARSENHAESTOQUE: TStringField;
    cdsPadraoESTOQUEPADRAO: TIntegerField;
    cdsPadraoBORDAETQPROD: TStringField;
    cdsPadraoALIQUOTAPADRAO: TIntegerField;
    cdsPadraoALIQUOTA: TStringField;
    cdsPadraoDESCPADRAOPROD: TFMTBCDField;
    cdsPadraoCAIXAPADRAO: TIntegerField;
    cdsPadraoCAIXA: TStringField;
    cdsPadraoSENHACAIXA: TStringField;
    cdsPadraoPRODSEMESTOQORCAM: TStringField;
    cdsPadraoORCAMNAOCONC: TStringField;
    cdsPadraoEDITORCAMCONC: TStringField;
    cdsPadraoCOMPRANAOCONC: TStringField;
    cdsPadraoEDITCOMPRACONC: TStringField;
    cdsPadraoPRODSEMESTOQVENDA: TStringField;
    cdsPadraoVENDANAOCONC: TStringField;
    cdsPadraoEDITVENDACONC: TStringField;
    cdsPadraoBORDAETQCLIENTE: TStringField;
    cdsPadraoMOSTRARSALDOCAIXA: TStringField;
    cdsPadraoCAIXA90DIAS: TStringField;
    cdsPadraoRELZEBRADO: TStringField;
    sqldPadraoVERIFICA_UPD: TStringField;
    cdsPadraoVERIFICA_UPD: TStringField;
    sqldPadraoCONTACHEQUE: TIntegerField;
    cdsPadraoCONTACHEQUE: TIntegerField;
    sqldPadraoNCONTACHEQUE: TStringField;
    cdsPadraoNCONTACHEQUE: TStringField;
    sqldPadraoINFOAVISOS: TStringField;
    cdsPadraoINFOAVISOS: TStringField;
    PgConfig: TUniPageControl;
    Tabgeral: TUniTabSheet;
    chAtalhos: TUniDBCheckBox;
    chHint: TUniDBCheckBox;
    chErro: TUniDBCheckBox;
    chBackup: TUniDBCheckBox;
    chResolucao: TUniDBCheckBox;
    chLog: TUniDBCheckBox;
    chImpressora: TUniDBCheckBox;
    chDica: TUniDBCheckBox;
    dbckbVerificaUpd: TUniDBCheckBox;
    dbchkInfoAvisos: TUniDBCheckBox;
    TabImg: TUniTabSheet;
    rgOrientationImg: TRadioGroup;
    btnBuscar: TUniBitBtn;
    btnExImg: TUniBitBtn;
    imgPapelParede: TUniImage;
    bvImagem: TUniPanel;
    TabOrcam: TUniTabSheet;
    cbVerificaEstoqueOrcam: TUniDBCheckBox;
    cbEditOrcamConc: TUniDBCheckBox;
    cbOrcamNaoConc: TUniDBCheckBox;
    TabCompras: TUniTabSheet;
    cbCompraNaoConc: TUniDBCheckBox;
    cbEditCompraConc: TUniDBCheckBox;
    TabProdutos: TUniTabSheet;
    btnAlterarSenhaProduto: TUniBitBtn;
    dbeSenhaProduto: TUniDBEdit;
    grpValorProdutoPadrao: TUniGroupBox;
    dbeAliqPadrao: TUniDBEdit;
    dbeEstoquePadrao: TUniDBEdit;
    dbeDescontoPadrao: TUniDBEdit;
    dbcbEstoqueSenhaProd: TUniDBCheckBox;
    dbcbBordaEtqProd: TUniDBCheckBox;
    dbcbLetraNumCodBarra: TUniDBCheckBox;
    TabCaixa: TUniTabSheet;
    btnAlterarSenhaCaixa: TUniBitBtn;
    dbeSenhaCaixa: TUniDBEdit;
    grpCaixaPadrao: TUniGroupBox;
    dbeCaixaPadrao: TUniDBEdit;
    grpContaCheque: TUniGroupBox;
    dbeContaCheque: TUniDBEdit;
    dbcbMostrarSaldo: TUniDBCheckBox;
    dbcbLanc90Dias: TUniDBCheckBox;
    TabVenda: TUniTabSheet;
    chVendaEstoque: TUniDBCheckBox;
    chVendaConc: TUniDBCheckBox;
    chEditvenda: TUniDBCheckBox;
    TabClientes: TUniTabSheet;
    chBloqCli: TUniDBCheckBox;
    dbcbBordaEtq: TUniDBCheckBox;
    TabExportacao: TUniTabSheet;
    btnLocalizar: TUniBitBtn;
    dbeDirExportacao: TUniDBEdit;
    tsEmail: TUniTabSheet;
    grpEmail: TUniGroupBox;
    btnTeste: TUniBitBtn;
    edServidor: TUniEdit;
    edPorta: TUniEdit;
    edUsuario: TUniEdit;
    edSenha: TUniEdit;
    chkAutenticacao: TUniCheckBox;
    tsRelatorio: TUniTabSheet;
    dbckbRelZebrado: TUniDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnExImgClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnAlterarSenhaProdutoClick(Sender: TObject);
    procedure dsPadraoStateChange(Sender: TObject);
    procedure actPostExecute(Sender: TObject);
    procedure chkAutenticacaoClick(Sender: TObject);
    procedure btnTesteClick(Sender: TObject);
    procedure dbeAliqPadraoClickButton(Sender: TObject);
    procedure dbeCaixaPadraoClickButton(Sender: TObject);
    procedure btnAlterarSenhaCaixaClick(Sender: TObject);
    procedure dbeDescontoPadraoKeyPress(Sender: TObject; var Key: Char);
    procedure dbeEstoquePadraoKeyPress(Sender: TObject; var Key: Char);
    procedure rgOrientationImgClick(Sender: TObject);
    procedure cdsPadraoSENHACAIXAGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cdsPadraoSENHACAIXASetText(Sender: TField;
      const Text: String);
    procedure cdsPadraoSENHAESTOQUEGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure cdsPadraoSENHAESTOQUESetText(Sender: TField;
      const Text: String);
    procedure dbeContaChequeClickButton(Sender: TObject);
  private
    procedure GravaPapelParede;
    procedure CarregaPapelParede;
    procedure EnviaEmail;
    procedure GravaDadosEmail;
    procedure LeDadosEmail;
  public
  end;

var
  frmConfiguracao: TfrmConfiguracao;

implementation

uses Funcoes, ConstPadrao, VarGlobal, unModeloConsulta, unTrocaSenhaCaixa,
     unTrocaSenhaEstoque, uutilfncs, crypto;

{$R *.dfm}

procedure TfrmConfiguracao.FormCreate(Sender: TObject);
begin

  cdsPadrao.Close;
  cdsPadrao.Params.ParamByName('PCOMP').AsString := GetComputerName;
  inherited;

  LockWindowUpdate(Application.MainForm.Handle);
  CarregaPapelParede;
  LeDadosEmail;
  PgConfig.TabIndex := 0;
  CentralizaForm(Self);
  actInsert.Visible := False;
  actPrint.Visible := False;
  actDelete.Visible := False;
  actSearch.Visible := False;
//  actPrimeiro.Visible := False;
//  actAnterior.Visible := False;
//  actProximo.Visible := False;
//  actUltimo.Visible := False;
//  miRelatorios.Visible := False;
//  miOpcoes.Visible := False;

  ReordenaBotoes([btnAlterar, btnSalvar, btnCancelar, btnSair]);

  LockWindowUpdate(0);
end;

procedure TfrmConfiguracao.btnBuscarClick(Sender: TObject);
begin
  inherited;
  if (opImagem.Execute) then
  begin
    WriteIniFile('PapelParede', 'Local', Trim(opImagem.FileName));
    with imgPapelParede do
    begin
      Picture.LoadFromFile(opImagem.FileName);
      if rgOrientationImg.ItemIndex = 0 then
      begin
        imgPapelParede.Center := True;
        imgPapelParede.Stretch := False;
      end
      else if rgOrientationImg.ItemIndex = 1 then
      begin
        imgPapelParede.Center := True;
        imgPapelParede.Stretch := True;
      end;
    end
  end;
end;

procedure TfrmConfiguracao.btnExImgClick(Sender: TObject);
begin
  inherited;
  if (imgPapelParede.Picture.Graphic = nil) then
  begin
    MsgAviso('Não existe imagem para limpar');
    Exit;
  end
  else
    if MsgSN('Deseja limpar a imagem do papel de parede?') then
    begin
      imgPapelParede.Picture.Graphic := nil;
      WriteIniFile('PapelParede', 'Local', '');
    end;
end;

procedure TfrmConfiguracao.btnLocalizarClick(Sender: TObject);
var
  S: String;
begin
  inherited;
  if (dbeDirExportacao.Text <> '') and (DirectoryExists(dbeDirExportacao.Text)) then
    S := dbeDirExportacao.Text
  else
    S := '';

  if SelectDirectory('Selecione a Pasta - [Destino]', '', S) then
    cdsPadraoDIREXPORTPADRAO.AsString := S;
end;

procedure TfrmConfiguracao.GravaPapelParede;
begin
  WriteIniFile('PapelParede', 'Orientacao', IntToStr(rgOrientationImg.ItemIndex));
end;

procedure TfrmConfiguracao.btnAlterarSenhaProdutoClick(Sender: TObject);
begin
  inherited;
  frmSenhaEstoque := TfrmSenhaEstoque.Create(Self);
  if frmSenhaEstoque.ShowModal = mrOk then
  begin
    //Salvar(cdsPadrao);
    cdsPadrao.ApplyUpdates(0);
    ReabreDataSet(cdsPadrao);
  end;
end;

procedure TfrmConfiguracao.dsPadraoStateChange(Sender: TObject);
var
  EditModes: Boolean;
begin
  inherited;
  EditModes := (cdsPadrao.State in [dsInsert, dsEdit]);

  dbeSenhaCaixa.ReadOnly   := (Configuracao.SenhaCaixa <> '');
  dbeSenhaProduto.ReadOnly := (Configuracao.SenhaEstoque <> '');

  rgOrientationImg.Enabled       := EditModes;
  btnLocalizar.Enabled           := EditModes;
  btnBuscar.Enabled              := EditModes;
  btnExImg.Enabled               := EditModes;
  btnAlterarSenhaProduto.Enabled := EditModes;
  btnAlterarSenhaCaixa.Enabled   := EditModes;

//  if EditModes then
//    EnableControlSubControls(grpEmail, True, -1)
//  else
//    EnableControlSubControls(grpEmail, False, -1);

  chkAutenticacaoClick(Self);
end;

procedure TfrmConfiguracao.actPostExecute(Sender: TObject);
var
  s: string;
begin
  s := '';
  if (PgConfig.TabIndex = 5) then
  begin
    if PassWord(s, '*') then
    begin
      if s = EnDecrypt(Configuracao.SenhaCaixa) then
      begin
        inherited;
        PostMessageAllForms(WM_CONFIG_ALTERADO);
        Application.ProcessMessages;
      end
      else
      begin
        MsgErro('Senha incorreta ou não informada.');
        actCancelUpdates.Execute;
      end;
    end
    else
      actCancelUpdates.Execute;

    GravaPapelParede;
    GravaDadosEmail;
  end
  else
  begin
    inherited;
    GravaPapelParede;
    GravaDadosEmail;
    PostMessageAllForms(WM_CONFIG_ALTERADO);
    Application.ProcessMessages;
  end;
end;

procedure TfrmConfiguracao.EnviaEmail;
var
  Email: string;
begin
  GravaDadosEmail;
//  if ObterTexto(Email, 'Digite um e-mail') then
//  begin
    IdMsg.From.Address := edUsuario.Text; // e-mail do remetente
    IdMsg.Recipients.EMailAddresses := Email; // e-mail do destinatário
    IdMsg.Subject := 'Teste de envio'; // assunto
    IdMsg.Body.Add('Testando e-mail CPR'); // corpo da mensagem

    IdSMTP.Host := edServidor.Text; // host SMTP
    IdSMTP.Port := StrToInt(edPorta.Text); // porta
    IdSMTP.Username := edUsuario.Text; // login do usuário
    IdSMTP.Password := edSenha.Text; // senha do usuário

    IdSMTP.Connect; // estabelece a conexão

    if chkAutenticacao.Checked then
    begin
      IdSMTP.AuthType := satDefault;
      IdSMTP.Authenticate; // faz a autenticação
    end
    else
      IdSMTP.AuthType := satNone;

    try
      IdSMTP.Send(IdMsg); // envia a mensagem
    except
      on e: Exception do
        MsgErro('ERRO: ' + e.Message); // mensagem de erro
    end;
    MsgAviso('Teste de Envio OK!');
  //end;
end;

procedure TfrmConfiguracao.GravaDadosEmail;
begin
  WriteIniFile('EMAIL', 'Servidor', edServidor.Text);
  WriteIniFile('EMAIL', 'Porta', edPorta.Text);
  WriteIniFile('EMAIL', 'Autenticacao', BoolToStr(chkAutenticacao.Checked));
  WriteIniFile('EMAIL', 'Usuario', edUsuario.Text);
  WriteIniFile('EMAIL', 'Senha', edSenha.Text);
end;

procedure TfrmConfiguracao.LeDadosEmail;
begin
  edServidor.Text         := ReadIniFile('EMAIL', 'Servidor');
  edPorta.Text            := ReadIniFile('EMAIL', 'Porta');
  chkAutenticacao.Checked := StrToBoolDef(ReadIniFile('EMAIL', 'Autenticacao'), False);
  edUsuario.Text          := ReadIniFile('EMAIL', 'Usuario');
  edSenha.Text            := ReadIniFile('EMAIL', 'Senha');
  chkAutenticacaoClick(Self);
end;

procedure TfrmConfiguracao.chkAutenticacaoClick(Sender: TObject);
begin
  inherited;
  if chkAutenticacao.Checked and (cdsPadrao.State in [dsInsert, dsEdit]) then
  begin
    edUsuario.Enabled := True;
    edSenha.Enabled := True;
  end
  else
  begin
    edUsuario.Enabled := False;
    edSenha.Enabled := False;
  end;
end;

procedure TfrmConfiguracao.btnTesteClick(Sender: TObject);
begin
  inherited;
  EnviaEmail;
end;

procedure TfrmConfiguracao.dbeAliqPadraoClickButton(Sender: TObject);
begin
  inherited;
//  if cdsPadrao.State in [dsEdit] then
//    if TfrmModeloConsulta.Execute('Aliquotas', GetDmPesquisar.cdsPesqAliquota, FN_ALIQUOTAS, DL_ALIQUOTAS) then
//    begin
//      cdsPadraoALIQUOTAPADRAO.AsInteger := GetDmPesquisar.cdsPesqAliquota.FieldByName('CODALIQUOTA').AsInteger;
//      cdsPadraoALIQUOTA.AsString := GetDmPesquisar.cdsPesqAliquota.FieldByName('DESCRICAO').AsString;
//    end;
end;

procedure TfrmConfiguracao.dbeCaixaPadraoClickButton(Sender: TObject);
begin
  inherited;
//  if cdsPadrao.State in [dsEdit] then
//    if TfrmModeloConsulta.Execute('Caixas', GetDmPesquisar.cdsPesqCaixas, FN_CAIXAS, DL_CAIXAS) then
//    begin
//      cdsPadraoCAIXAPADRAO.AsInteger := GetDmPesquisar.cdsPesqCaixas.FieldByName('CODIGO').AsInteger;
//      cdsPadraoCAIXA.AsString := GetDmPesquisar.cdsPesqCaixas.FieldByName('NOME').AsString;
//    end;
end;

procedure TfrmConfiguracao.btnAlterarSenhaCaixaClick(Sender: TObject);
begin
  inherited;
  frmSenhaCaixa := TfrmSenhaCaixa.Create(Self);
  if frmSenhaCaixa.ShowModal = mrOk then
  begin
    //Salvar(cdsPadrao);
    cdsPadrao.ApplyUpdates(0);
    ReabreDataSet(cdsPadrao);
  end;
end;

procedure TfrmConfiguracao.dbeDescontoPadraoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', ',', #8]) then
    Key := #0;
end;

procedure TfrmConfiguracao.dbeEstoquePadraoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', ',', #8]) then
    Key := #0;
end;

procedure TfrmConfiguracao.CarregaPapelParede;
begin
  if (ReadIniFile('PapelParede', 'Local') <> EmptyStr) then
  begin
    with imgPapelParede do
    begin
      if FileExists(ReadIniFile('PapelParede', 'Local'))then
      begin
        Picture.LoadFromFile(ReadIniFile('PapelParede', 'Local'));
        rgOrientationImg.ItemIndex := StrToIntDef(ReadIniFile('PapelParede', 'Orientacao'), 1);
        if rgOrientationImg.ItemIndex = 0 then
        begin
          imgPapelParede.Center := True;
          imgPapelParede.Stretch := False;
        end
        else if rgOrientationImg.ItemIndex = 1 then
        begin
          imgPapelParede.Center := True;
          imgPapelParede.Stretch := True;
        end;
      end
      else
      begin
        imgPapelParede.Picture.Graphic := nil;
        imgPapelParede.Refresh;
        WriteIniFile('PapelParede', 'Local', '');
      end;
    end;
  end;
end;

procedure TfrmConfiguracao.rgOrientationImgClick(Sender: TObject);
begin
  inherited;
  if rgOrientationImg.ItemIndex = 0 then
  begin
    imgPapelParede.Center := True;
    imgPapelParede.Stretch := False;
  end
  else if rgOrientationImg.ItemIndex = 1 then
  begin
    imgPapelParede.Center := True;
    imgPapelParede.Stretch := True;
  end;
end;

procedure TfrmConfiguracao.cdsPadraoSENHACAIXAGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
  Text := EnDecrypt(Sender.AsString);
end;

procedure TfrmConfiguracao.cdsPadraoSENHACAIXASetText(Sender: TField;
  const Text: String);
begin
  inherited;
  Sender.AsString := EnDecrypt(Text);
end;

procedure TfrmConfiguracao.cdsPadraoSENHAESTOQUEGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
  Text := EnDecrypt(Sender.AsString);
end;

procedure TfrmConfiguracao.cdsPadraoSENHAESTOQUESetText(Sender: TField;
  const Text: String);
begin
  inherited;
  Sender.AsString := EnDecrypt(Text);
end;

procedure TfrmConfiguracao.dbeContaChequeClickButton(Sender: TObject);
begin
  inherited;
//  if cdsPadrao.State in [dsEdit] then
//    if TfrmModeloConsulta.Execute('Caixas', GetDmPesquisar.cdsPesqCaixas, FN_CAIXAS, DL_CAIXAS) then
//    begin
//      cdsPadraoCONTACHEQUE.AsInteger := GetDmPesquisar.cdsPesqCaixas.FieldByName('CODIGO').AsInteger;
//      cdsPadraoNCONTACHEQUE.AsString := GetDmPesquisar.cdsPesqCaixas.FieldByName('NOME').AsString;
//    end;
end;

initialization
  RegisterClass(TfrmConfiguracao);
finalization
  UnRegisterClass(TfrmConfiguracao);
end.


