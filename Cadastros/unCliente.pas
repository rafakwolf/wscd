unit unCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons,
  ExtCtrls, ComCtrls, SqlExpr, DBCtrls, udmGeralBase,
  Mask, DBClient, Provider, StrUtils,  ExtDlgs, FMTBcd,
  System.Actions, uniGUIBaseClasses, uniGUIClasses, uniButton,
  uniBitBtn, uniSpeedButton, uniPanel, uniStatusBar, uniEdit, uniDBEdit,
  uniImage, uniDBImage, uniGroupBox;

type
  TfrmCliente = class(TfrmPadrao)
    sqldCidade: TSQLDataSet;
    sqldCidadeCODCIDADE: TIntegerField;
    sqldCidadeDESCRICAO: TStringField;
    dspCidade: TDataSetProvider;
    cdsCidade: TClientDataSet;
    cdsCidadeCODCIDADE: TIntegerField;
    cdsCidadeDESCRICAO: TStringField;
    pnFoto: TUniContainerPanel;
    grpFoto: TUniGroupBox;
    btnBuscar: TUniSpeedButton;
    btnLimpar: TUniSpeedButton;
    btnWebCam: TUniSpeedButton;
    btnFoto: TUniBitBtn;
    btnContas: TUniBitBtn;
    btnObservacao: TUniBitBtn;
    dbeFax: TUniDBEdit;
    dbeTelefoneComercial: TUniDBEdit;
    dbeRefComercial: TUniDBEdit;
    dbeRefPessoal: TUniDBEdit;
    dbeLocalTrabalho: TUniDBEdit;
    dbeSalario: TUniDBEdit;
    dbeInicioTrabalho: TUniDBEdit;
    dbeCargo: TUniDBEdit;
    dbeTrabalho: TUniDBEdit;
    dbeEmail: TUniDBEdit;
    dbeNaturalidade: TUniDBEdit;
    dbeDataCadastro: TUniDBEdit;
    dbeMae: TUniDBEdit;
    dbePai: TUniDBEdit;
    dbeConjuge: TUniDBEdit;
    dbeEnderecoAnterior: TUniDBEdit;
    dbeTempoMoradia: TUniDBEdit;
    dbeLimite: TUniDBEdit;
    dbeDataNasc: TUniDBEdit;
    dbeCpf: TUniDBEdit;
    dbeRg: TUniDBEdit;
    dbeTelefone: TUniDBEdit;
    dbeCep: TUniDBEdit;
    dbeBairro: TUniDBEdit;
    dbeEndereco: TUniDBEdit;
    dbeNome: TUniDBEdit;
    imgFoto: TUniDBImage;
    procedure miRelClientesCidadeClick(Sender: TObject);
    procedure miRelClientesDataNascClick(Sender: TObject);
    procedure miRelAniversariantesClick(Sender: TObject);
    procedure cdsPadraoAfterInsert(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure dbeLimiteKeyPress(Sender: TObject; var Key: Char);
    procedure dbeSalarioKeyPress(Sender: TObject; var Key: Char);
    procedure btnObservacaoClick(Sender: TObject);
    procedure cdsPadraoCODCIDADEValidate(Sender: TField);
    procedure cdsPadraoTIPOSetText(Sender: TField; const Text: String);
    procedure cdsPadraoTIPOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure miEtiquetaClienteClick(Sender: TObject);
    procedure btnContasClick(Sender: TObject);
    procedure btnFotoClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnWebCamClick(Sender: TObject);
    procedure dbeCidadePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cdsPadraoESTADO_CIVILGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsPadraoESTADO_CIVILSetText(Sender: TField; const Text: string);
  private
    SQLPadraoTela: string;
    procedure Foto(Visivel: Boolean);
  protected
    function GetDm: TdmGeralBase; override;
  public
    procedure AntesSalvar; override;
  end;

var
  frmCliente: TfrmCliente;

implementation

uses Funcoes, ConstPadrao, unModeloConsulta, uConfiguraRelatorio,
     unPrevListagemClientes, VarGlobal,  unContasReceber,
     Extensos, unAguarde, unFoto, udatabaseutils, udmCliente;

{$R *.dfm}

procedure TfrmCliente.miRelClientesCidadeClick(Sender: TObject);
begin
  inherited;
  ChamaForm('TfrmRelatorioClienteCidade', 'Clientes por cidade', Self);
end;

procedure TfrmCliente.miRelClientesDataNascClick(Sender: TObject);
begin
  inherited;
  ChamaForm('TfrmRelatorioClienteData', 'Clientes por data de nascimento', Self);
end;

procedure TfrmCliente.miRelAniversariantesClick(Sender: TObject);
begin
  inherited;
  ChamaForm('TfrmRelatorioAniversarioCliente', 'Clientes aniversariantes', Self);
end;

procedure TfrmCliente.cdsPadraoAfterInsert(DataSet: TDataSet);
begin
  inherited;
//  cdsPadraoTIPO.AsString := 'F';
//  cdsPadraoCADASTRO.AsDateTime := Date;
//  cdsPadraoLIMITE.AsFloat := Global.LimiteCliente;
//  cdsPadraoSALARIO.AsFloat := 0;
end;

procedure TfrmCliente.dbeCidadePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
//  if (cdsPadrao.State in [dsInsert, dsEdit]) then
//    if TfrmModeloConsulta.Execute('Busca Cidade', cdsCidade, FN_CIDADES, DL_CIDADES) then
//      cdsPadraoCODCIDADE.AsInteger := cdsCidadeCODCIDADE.AsInteger;
end;

procedure TfrmCliente.FormCreate(Sender: TObject);
begin
  inherited;
  FieldNames := FN_CLIENTES;
  DisplayLabels := DL_CLIENTES;
  aCaption := 'Clientes';
  SQLPadraoTela := TdmCliente(GetDm).sqldPadrao.Commandtext;
end;

procedure TfrmCliente.actPrintExecute(Sender: TObject);
begin
  inherited;
  with TfrmPrevListagemClientes.Create(Self) do
  try
    cdsPadrao.Close;
    cdsPadrao.Open;

    TipoRelatorio := 0;
    PrintIfNotEmptyRL(rrPadrao);
  finally
    cdsPadrao.Close;
    Free;
  end;
end;

procedure TfrmCliente.dbeLimiteKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  NumericoKeyPress(sender, key);
end;

procedure TfrmCliente.dbeSalarioKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  NumericoKeyPress(sender, key);
end;

procedure TfrmCliente.btnObservacaoClick(Sender: TObject);
begin
  inherited;
  FormMemo(dsPadrao, 'OBS');
end;

procedure TfrmCliente.cdsPadraoCODCIDADEValidate(Sender: TField);
var
  NomeCidade: string;
begin
  inherited;
//  NomeCidade := GetFieldByID(GetConnection, 'CIDADES', 'DESCRICAO', 'CODCIDADE',
//    Sender.AsInteger);
//  if NomeCidade <> '' then
//    cdsPadraoDESCRICAO.AsString := NomeCidade;
end;

procedure TfrmCliente.cdsPadraoESTADO_CIVILGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
//  if (cdsPadrao.State in [dsInsert, dsEdit]) and not sender.IsNull then
//    case sender.AsString[1] of
//      'S': Text := 'Solteiro(a)';
//      'C': Text := 'Casado(a)';
//      'A': Text := 'Amaziado(a)';
//      'V': Text := 'Viúvo(a)';
//    end;
end;

procedure TfrmCliente.cdsPadraoESTADO_CIVILSetText(Sender: TField;
  const Text: string);
begin
  inherited;
//  if (cdsPadrao.State in [dsInsert, dsEdit]) and not Text.IsEmpty then
//    Sender.AsString := Copy(Text,1,1);
end;

procedure TfrmCliente.cdsPadraoTIPOSetText(Sender: TField;
  const Text: String);
begin
  inherited;
  Sender.AsString := Copy(Text, 1, 1);
end;

procedure TfrmCliente.cdsPadraoTIPOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
  if Sender.AsString = 'J' then
    Text := 'Jurídica'
  else
    Text := 'Física';
end;

procedure TfrmCliente.miEtiquetaClienteClick(Sender: TObject);
begin
  inherited;
  ChamaForm('TfrmRelatorioEtiquetaCliente', 'Etiquetas de clientes', Self);
end;

procedure TfrmCliente.btnContasClick(Sender: TObject);
begin
  inherited;
//  frmContasReceber := TfrmContasReceber.Create(self);
//  frmContasReceber.Caption := 'Contas do cliente: '+cdsPadraoNOME.AsString;
//  frmContasReceber.TipoChamada := 1;
//  frmContasReceber.IdCliente := cdsPadraoCODCLIENTE.AsInteger;
//  frmContasReceber.ShowModal;
end;

procedure TfrmCliente.AntesSalvar;
var
  Repetido: Boolean;
begin
  inherited;
//  Repetido :=
//    TdmCliente(getDm).IsClienteRepetido(cdsPadraoCPF_CNPJ.AsString,
//      cdsPadraoRG_IE.AsString);
//
//  if (ModoInsert(cdsPadrao) and Repetido) then
//  begin
//    MsgAviso('Cliente com este CPF/CNPJ ou RG/IE já está cadastrado.');
//    Abort;
//  end;
//
//  if Idade(cdsPadraoDATA_NASC.AsDateTime) < Global.IdadeCliente then
//  begin
//    MsgCuidado('Cliente com idade menor que a permitida, não poderá ser cadastrado.');
//    Abort;
//  end;
end;

procedure TfrmCliente.btnFotoClick(Sender: TObject);
begin
  inherited;
  Foto(not pnFoto.Visible);
end;

procedure TfrmCliente.Foto(Visivel: Boolean);
begin
  pnFoto.Top     := btnFoto.Top-pnFoto.Height-1;
  pnFoto.Left    := btnFoto.Left;
  pnFoto.Visible := Visivel;

  if Visivel then
    SetFocusIfCan(imgFoto);

  pnFoto.BringToFront;
end;

function TfrmCliente.GetDm: TdmGeralBase;
begin
  if not assigned(dmCliente) then
    dmCliente := TdmCliente.Create(self);

  Result := dmCliente;
end;

procedure TfrmCliente.btnLimparClick(Sender: TObject);
begin
  inherited;
  if EditModes then
    imgFoto.Field.Clear;
end;

procedure TfrmCliente.btnBuscarClick(Sender: TObject);
begin
  inherited;
  if EditModes then
    with TOpenPictureDialog.Create(nil) do
    try
      if Execute then
        imgFoto.Picture.LoadFromFile(FileName);
    finally
      Free;
    end;
end;

procedure TfrmCliente.btnWebCamClick(Sender: TObject);
var
  Foto: string;
begin
//  if EditModes then
//  begin
//    if TfrmFoto.Load(IntToStr(cdsPadraoCODCLIENTE.AsInteger), Foto) then
//      imgFoto.Picture.LoadFromFile(Foto);
//  end;
end;

initialization
  RegisterClass(TfrmCliente);
finalization
  UnRegisterClass(TfrmCliente);

end.

