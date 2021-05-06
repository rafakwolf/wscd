unit unDadosEmpresa;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons,
  ComCtrls,   memds, ExtDlgs,
    DBCtrls, Sqldb, FMTBcd;

type
  TfrmDadosEmpresa = class(TfrmPadrao)
    sqldPadrao: TSQLQuery;
    dspPadrao: TTimer;
    cdsPadrao: TMemDataSet;
    opdLogo: TOpenPictureDialog;
    sqldPadraoFANTAZIA: TStringField;
    sqldPadraoRAZASOCIAL: TStringField;
    sqldPadraoCNPJ: TStringField;
    sqldPadraoIE: TStringField;
    sqldPadraoIM: TStringField;
    sqldPadraoENDERECO: TStringField;
    sqldPadraoIDCIDADE: TIntegerField;
    sqldPadraoBAIRRO: TStringField;
    sqldPadraoCEP: TStringField;
    sqldPadraoTELEFONE: TStringField;
    sqldPadraoFAX: TStringField;
    sqldPadraoUF: TStringField;
    sqldPadraoRESPONSAVEL: TStringField;
    sqldPadraoLOGOEMPRESA: TBlobField;
    cdsPadraoFANTAZIA: TStringField;
    cdsPadraoRAZASOCIAL: TStringField;
    cdsPadraoCNPJ: TStringField;
    cdsPadraoIE: TStringField;
    cdsPadraoIM: TStringField;
    cdsPadraoENDERECO: TStringField;
    cdsPadraoIDCIDADE: TIntegerField;
    cdsPadraoBAIRRO: TStringField;
    cdsPadraoCEP: TStringField;
    cdsPadraoTELEFONE: TStringField;
    cdsPadraoFAX: TStringField;
    cdsPadraoUF: TStringField;
    cdsPadraoRESPONSAVEL: TStringField;
    cdsPadraoLOGOEMPRESA: TBlobField;
    sqldCidade: TSQLQuery;
    dspCidade: TComponent;
    cdsCidade: TMemDataSet;
    cdsCidadeCODCIDADE: TIntegerField;
    cdsCidadeDESCRICAO: TStringField;
    sqldPadraoDESCRICAO: TStringField;
    cdsPadraoDESCRICAO: TStringField;
    sqldPadraoEMAIL: TStringField;
    cdsPadraoEMAIL: TStringField;
    sqldSistema: TSQLQuery;
    dspSistema: TComponent;
    cdsSistema: TMemDataSet;
    sqldSistemaIDSISTEMA: TIntegerField;
    sqldSistemaVERSAO: TStringField;
    sqldSistemaDATAVALIDADE: TStringField;
    sqldSistemaDATA_ACESSO: TStringField;
    sqldSistemaSERIAL: TStringField;
    sqldSistemaHD: TStringField;
    cdsSistemaIDSISTEMA: TIntegerField;
    cdsSistemaVERSAO: TStringField;
    cdsSistemaDATAVALIDADE: TStringField;
    cdsSistemaDATA_ACESSO: TStringField;
    cdsSistemaSERIAL: TStringField;
    cdsSistemaHD: TStringField;
    dsSistema: TDataSource;
    lbFantazia: TLabel;
    lbRazaoSocial: TLabel;
    lbCnpj: TLabel;
    lbInscEstadual: TLabel;
    lbEndereco: TLabel;
    lbBairro: TLabel;
    lbTelefone: TLabel;
    lbResponsavel: TLabel;
    LabelFax: TLabel;
    lbUF: TLabel;
    lbCep: TLabel;
    lbInscMunicipal: TLabel;
    btnGravaSerial: TBitBtn;
    dbeCidade: TDBEdit;
    dbeInscMunicipal: TDBEdit;
    dbeFax: TDBEdit;
    dbeRazaoSocial: TDBEdit;
    dbeResponsavel: TDBEdit;
    dbeTelefone: TDBEdit;
    dbeEndereco: TDBEdit;
    dbeBairro: TDBEdit;
    dbeCep: TDBEdit;
    dbeInscEstadual: TDBEdit;
    dbeFantazia: TDBEdit;
    dbeSerial: TDBEdit;
    dbeCnpj: TDBEdit;
    dbeUF: TDBEdit;
    dbeEmail: TDBEdit;
    gbLogoMarca: TGroupBox;
    btnBuscaImg: TBitBtn;
    btnApagaImg: TBitBtn;
    dbiLogoMarca: TDBImage;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnBuscaImgClick(Sender: TObject);
    procedure btnApagaImgClick(Sender: TObject);
    procedure cdsPadraoIDCIDADEValidate(Sender: TField);
    procedure dbeCidadeClickButton(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsSistemaStateChange(Sender: TObject);
    procedure btnGravaSerialClick(Sender: TObject);
  private
    procedure GravaNovaChave(Chave: string);
  public
  end;

var
  frmDadosEmpresa: TfrmDadosEmpresa;

implementation

uses Funcoes,  unModeloConsulta, ConstPadrao, VarGlobal, uDatabaseutils;

{$R *.dfm}

procedure TfrmDadosEmpresa.FormCreate(Sender: TObject);
begin
  inherited;
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
  Sistema.Atualizar;
end;

procedure TfrmDadosEmpresa.FormShow(Sender: TObject);
begin
  inherited;
  if cdsPadrao.IsEmpty then
    cdsPadrao.Insert;
  cdsSistema.Open;
end;

procedure TfrmDadosEmpresa.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  //RetornoValidacao: TTipoValidacao;
  SimNao: Boolean;
  TextoParaValidacao: string;
begin
  inherited;
  SimNao := False;
  TextoParaValidacao := Trim(cdsPadraoRAZASOCIAL.AsString+cdsPadraoCNPJ.AsString+cdsPadraoCEP.AsString);

//  RetornoValidacao := ValidaSerial(Sistema.Serial, TextoParaValidacao);
//
//  case RetornoValidacao of
//    tvSerialErrado, tvChaveErrada:
//    begin
//      if MessageDlg('A chave de libera��o informada est� incorreta '+
//        'ou os dados informados est�o incorretos. '+#13+
//        'Deseja efetuar a corre��o agora?', 'Dados incorretos',
//        MB_YESNO or MB_ICONWARNING) = ID_YES then
//        SimNao := True
//      else
//        SimNao := False;
//    end;
//    tvExpirouPrazo:
//    begin
//      if MessageDlg('A chave de libera��o do sistema est� expirada.'+#13+
//        'O sistema poder� ser bloqueado a qualquer momento. Por favor entre em contato '+
//        'com o suporte para obter uma nova chave de libera��o.'+#13+
//        'Deseja informar uma nova chave de libera��o?', 'Chave Expirada',
//        MB_YESNO or MB_ICONWARNING) = ID_YES then
//        SimNao := True
//      else
//        SimNao := False;
//    end;
//    tvBloqueioSistema:
//    begin
//      if MessageDlg('CHAVE DE LIBERA��O EXPIRADA.'+#13+
//        'Seu sistema foi bloqueado pois sua chave de libera��o expirou a mais de 3 dias.'+
//        'Por favor entre em contato com o suporte para obter uma nova chave de libera��o.'+#13+
//        'Deseja informar uma nova chave de libera��o?',
//        'Sistema bloqueado', MB_YESNO or MB_ICONERROR) = ID_YES then
//        SimNao := True
//      else
//        SimNao := False;
//    end;
//    tvPrazoMtoLongo:
//    begin
//      if MessageDlg('A Chave de Libera��o informada est� fora de um per�odo v�lido. '+
//        'Verifique a data do seu computador e se a chave foi digitada corretamente.' + #13 +
//        'Deseja informar uma nova chave de libera��o?',
//        'Chave inv�lida', MB_YESNO or MB_ICONWARNING) = ID_YES then
//        SimNao := True
//      else
//        SimNao := False;
//    end;
//  end;
//  if (RetornoValidacao <> tvValidacaoOk) then
//  begin
//    if (RetornoValidacao <> tvValidacaoOk) and (SimNao) then
//    begin
//      cdsSistema.Edit;
//      dbeSerial.SetFocus;
//      CanClose := False;
//    end
//    else if(RetornoValidacao <> tvExpirouPrazo)then
//    begin
//      if MessageDlg(PChar('N�o � poss�vel utilizar o sistema sem informar uma chave de libera��o v�lida. '+
//        'Para obter uma nova chave de libera��o entre em contato com o suporte.' + #13 +
//        'Clique em OK para finalizar o sistema.'), 'Finalizando o sistema', MB_OKCANCEL or MB_ICONERROR) = ID_OK then
//      begin
//        Application.Terminate;
//        Exit;
//      end
//      else
//      begin
//        cdsSistema.Edit;
//        dbeSerial.SetFocus;
//        CanClose := False;
//      end;
//    end;
//  end;
end;

procedure TfrmDadosEmpresa.btnBuscaImgClick(Sender: TObject);
begin
  inherited;
  if (cdsPadrao.State in [dsInsert, dsEdit]) then
  begin
    //if opdLogo.Execute then
    //  dbiLogoMarca.LoadFromFile(opdLogo.FileName);
  end;
end;

procedure TfrmDadosEmpresa.btnApagaImgClick(Sender: TObject);
begin
  inherited;
  if (cdsPadrao.State in [dsInsert, dsEdit]) then
    dbiLogoMarca.Field.Clear;
end;

procedure TfrmDadosEmpresa.cdsPadraoIDCIDADEValidate(Sender: TField);
var
  NomeCidade: string;
begin
  inherited;
  NomeCidade := GetFieldByID(GetZConnection, 'CIDADES', 'DESCRICAO', 'CODCIDADE',
    Sender.AsInteger);
  if NomeCidade <> '' then
    cdsPadraoDESCRICAO.AsString := NomeCidade;
end;

procedure TfrmDadosEmpresa.dbeCidadeClickButton(Sender: TObject);
begin
  inherited;
//  if cdsPadrao.State in [dsEdit, dsInsert] then
//    if TfrmModeloConsulta.Execute('Cidade', cdsCidade, FN_CIDADES, DL_CIDADES) then
//      cdsPadraoIDCIDADE.AsInteger := cdsCidadeCODCIDADE.AsInteger;
end;

procedure TfrmDadosEmpresa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cdsSistema.Close;
  inherited;
end;

procedure TfrmDadosEmpresa.GravaNovaChave(Chave: string);
begin
  with TSQLQuery.Create(Self) do
  try
    SQLConnection := GetConnection;
    Close;
    SQL.Clear; SQL.Text :='update SISTEMA set DATAVALIDADE = :DATAVALIDADE, ' +
                   'SERIAL = :SERIAL';
    Params.ParamByName('DATAVALIDADE').AsString :=
      Copy(Chave, 1, Pos('-', Chave) - 1);
    Params.ParamByName('SERIAL').AsString := Trim(Chave);
    ExecSQL;
  finally
    Free;
//    MsgAviso('Ok!!! Nova chave v�lida at� '+
//      DateToStr(DecriptData(Copy(Chave, 1, Pos('-', Chave) - 1)))+'.');
  end;
end;

procedure TfrmDadosEmpresa.dsSistemaStateChange(Sender: TObject);
begin
  inherited;
  btnGravaSerial.Enabled := cdsSistema.State in [dsEdit];
end;

procedure TfrmDadosEmpresa.btnGravaSerialClick(Sender: TObject);
begin
  inherited;
  //if cdsSistema.ApplyUpdates(0) > 0 then
  //  Raise Exception.Create('Erro ao atualizar serial.');
end;

initialization
  RegisterClass(TfrmDadosEmpresa);
finalization
  UnRegisterClass(TfrmDadosEmpresa);
end.

