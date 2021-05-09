unit unConfiguracao;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons,
  ComCtrls, SqlDb, DBCtrls, ExtDlgs, FileCtrl, ZSqlUpdate, ZDataset, FMTBcd;

type

  { TfrmConfiguracao }

  TfrmConfiguracao = class(TfrmPadrao)
    PgConfig: TPageControl;
    Tabgeral: TTabSheet;
    TabImg: TTabSheet;
    TabOrcam: TTabSheet;
    TabCompras: TTabSheet;
    TabProdutos: TTabSheet;
    TabCaixa: TTabSheet;
    TabVenda: TTabSheet;
    TabClientes: TTabSheet;
    TabExportacao: TTabSheet;
    dbeDirExportacao: TDBEdit;
    dbeSenhaCaixa: TDBEdit;
    dbeSenhaProduto: TDBEdit;
    opImagem: TOpenPictureDialog;
    tsEmail: TTabSheet;
    tsRelatorio: TTabSheet;
    chAtalhos: TDBCheckBox;
    chHint: TDBCheckBox;
    chErro: TDBCheckBox;
    chBackup: TDBCheckBox;
    chResolucao: TDBCheckBox;
    chLog: TDBCheckBox;
    chImpressora: TDBCheckBox;
    chDica: TDBCheckBox;
    dbckbVerificaUpd: TDBCheckBox;
    dbchkInfoAvisos: TDBCheckBox;
    cbVerificaEstoqueOrcam: TDBCheckBox;
    cbEditOrcamConc: TDBCheckBox;
    cbOrcamNaoConc: TDBCheckBox;
    cbCompraNaoConc: TDBCheckBox;
    cbEditCompraConc: TDBCheckBox;
    dbcbEstoqueSenhaProd: TDBCheckBox;
    dbcbBordaEtqProd: TDBCheckBox;
    dbcbLetraNumCodBarra: TDBCheckBox;
    dbcbMostrarSaldo: TDBCheckBox;
    dbcbLanc90Dias: TDBCheckBox;
    chVendaEstoque: TDBCheckBox;
    chVendaConc: TDBCheckBox;
    chEditvenda: TDBCheckBox;
    chBloqCli: TDBCheckBox;
    dbcbBordaEtq: TDBCheckBox;
    dbckbRelZebrado: TDBCheckBox;
    imgPapelParede: TImage;
    grpValorProdutoPadrao: TGroupBox;
    dbeAliqPadrao: TDBEdit;
    dbeEstoquePadrao: TDBEdit;
    dbeDescontoPadrao: TDBEdit;
    grpCaixaPadrao: TGroupBox;
    dbeCaixaPadrao: TDBEdit;
    grpContaCheque: TGroupBox;
    dbeContaCheque: TDBEdit;
    grpEmail: TGroupBox;
    btnBuscar: TBitBtn;
    btnExImg: TBitBtn;
    btnAlterarSenhaProduto: TBitBtn;
    btnAlterarSenhaCaixa: TBitBtn;
    btnLocalizar: TBitBtn;
    btnTeste: TBitBtn;
    edServidor: TEdit;
    edPorta: TEdit;
    edUsuario: TEdit;
    edSenha: TEdit;
    chkAutenticacao: TCheckBox;
    rgOrientationImg: TRadioGroup;
    ZQuery1: TZQuery;
    ZUpdateSQL1: TZUpdateSQL;
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
    procedure dbeContaChequeClickButton(Sender: TObject);
  private
    procedure GravaPapelParede;
    procedure CarregaPapelParede;
  protected
    procedure AntesSalvar; override;
  public
  end;

var
  frmConfiguracao: TfrmConfiguracao;

implementation

uses Funcoes, ConstPadrao, VarGlobal, unModeloConsulta, unTrocaSenhaCaixa,
     unTrocaSenhaEstoque, uUtilFncs, crypto;

{$R *.dfm}

procedure TfrmConfiguracao.FormCreate(Sender: TObject);
begin

  zquery1.Open;
  zquery1.Filtered:=false;
  ZQuery1.Filter:='NOMECOMPUTADOR = '+QuotedStr(GetComputerName);
  zquery1.Filtered:=true;

  inherited;

  CarregaPapelParede;
  PgConfig.TabIndex := 0;
  CentralizaForm(Self);
  actInsert.Visible := False;
  actPrint.Visible := False;
  actDelete.Visible := False;
  actSearch.Visible := False;

  ReordenaBotoes([btnAlterar, btnSalvar, btnCancelar, btnSair]);

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
    MsgAviso('Nao existe imagem para limpar');
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
    zquery1.FieldByName('DIREXPORTPADRAO').AsString := S;
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
    zquery1.ApplyUpdates;
    ReabreDataSet(zquery1);
  end;
end;

procedure TfrmConfiguracao.dsPadraoStateChange(Sender: TObject);
var
  EditModes: Boolean;
begin
  inherited;
  EditModes := (zquery1.State in [dsInsert, dsEdit]);

  dbeSenhaCaixa.ReadOnly   := (Configuracao.SenhaCaixa <> '');
  dbeSenhaProduto.ReadOnly := (Configuracao.SenhaEstoque <> '');

  rgOrientationImg.Enabled       := EditModes;
  btnLocalizar.Enabled           := EditModes;
  btnBuscar.Enabled              := EditModes;
  btnExImg.Enabled               := EditModes;
  btnAlterarSenhaProduto.Enabled := EditModes;
  btnAlterarSenhaCaixa.Enabled   := EditModes;

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
      if s = crypto.EnDeCrypt(Configuracao.SenhaCaixa) then
      begin
        inherited;
        PostMessageAllForms(WM_CONFIG_ALTERADO);
        Application.ProcessMessages;
      end
      else
      begin
        MsgErro('Senha incorreta ou nao informada.');
        actCancelUpdates.Execute;
      end;
    end
    else
      actCancelUpdates.Execute;

    GravaPapelParede;

  end
  else
  begin
    inherited;
    GravaPapelParede;

    PostMessageAllForms(WM_CONFIG_ALTERADO);
    Application.ProcessMessages;
  end;
end;

procedure TfrmConfiguracao.chkAutenticacaoClick(Sender: TObject);
begin
  inherited;
  if chkAutenticacao.Checked and (zquery1.State in [dsInsert, dsEdit]) then
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

end;

procedure TfrmConfiguracao.dbeAliqPadraoClickButton(Sender: TObject);
begin
  inherited;

end;

procedure TfrmConfiguracao.dbeCaixaPadraoClickButton(Sender: TObject);
begin
  inherited;

end;

procedure TfrmConfiguracao.btnAlterarSenhaCaixaClick(Sender: TObject);
begin
  inherited;
  frmSenhaCaixa := TfrmSenhaCaixa.Create(Self);
  if frmSenhaCaixa.ShowModal = mrOk then
  begin
    zquery1.ApplyUpdates;
    ReabreDataSet(zquery1);
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

procedure TfrmConfiguracao.AntesSalvar;
begin
  inherited AntesSalvar;
  ZQuery1.FieldByName('senhacaixa').asstring := crypto.EnDeCrypt(dbeSenhaCaixa.text);
  ZQuery1.FieldByName('senhaestoque').asstring := crypto.EnDeCrypt(dbeSenhaProduto.text);
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

procedure TfrmConfiguracao.dbeContaChequeClickButton(Sender: TObject);
begin
  inherited;
//  if ModoEdicao(zquery1) then
//    if TfrmModeloConsulta.Execute('Caixas', GetDmPesquisar.cdsPesqCaixas, FN_CAIXAS, DL_CAIXAS) then
//    begin
//      zquery1CONTACHEQUE.AsInteger := GetDmPesquisar.cdsPesqCaixas.FieldByName('CODIGO').AsInteger;
//      zquery1NCONTACHEQUE.AsString := GetDmPesquisar.cdsPesqCaixas.FieldByName('NOME').AsString;
//    end;
end;

initialization
  RegisterClass(TfrmConfiguracao);
finalization
  UnRegisterClass(TfrmConfiguracao);
end.


