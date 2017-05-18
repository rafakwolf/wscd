unit unCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons,
  ExtCtrls, ComCtrls, SqlExpr, DBCtrls, udmGeralBase,
  Mask, DBClient, Provider, StrUtils,  ExtDlgs, FMTBcd,
  System.Actions, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, cxButtonEdit, cxDBEdit, cxLabel,
  cxDropDownEdit;

type
  TfrmCliente = class(TfrmPadrao)
    sqldCidade: TSQLDataSet;
    sqldCidadeCODCIDADE: TIntegerField;
    sqldCidadeDESCRICAO: TStringField;
    dspCidade: TDataSetProvider;
    cdsCidade: TClientDataSet;
    cdsCidadeCODCIDADE: TIntegerField;
    cdsCidadeDESCRICAO: TStringField;
    dbeNome: TDBEdit;
    dbeEndereco: TDBEdit;
    dbeBairro: TDBEdit;
    dbeCep: TDBEdit;
    dbeTelefone: TDBEdit;
    dbeRg: TDBEdit;
    dbeCpf: TDBEdit;
    dbeDataNasc: TDBEdit;
    dbeLimite: TDBEdit;
    btnObservacao: TBitBtn;
    dbeTempoMoradia: TDBEdit;
    dbeEnderecoAnterior: TDBEdit;
    dbeConjuge: TDBEdit;
    dbePai: TDBEdit;
    dbeMae: TDBEdit;
    dbeDataCadastro: TDBEdit;
    dbeNaturalidade: TDBEdit;
    dbeEmail: TDBEdit;
    dbeTrabalho: TDBEdit;
    dbeCargo: TDBEdit;
    dbeInicioTrabalho: TDBEdit;
    dbeSalario: TDBEdit;
    dbeLocalTrabalho: TDBEdit;
    dbeRefPessoal: TDBEdit;
    dbeRefComercial: TDBEdit;
    dbeTelefoneComercial: TDBEdit;
    btnContas: TBitBtn;
    dbeFax: TDBEdit;
    btnFoto: TBitBtn;
    pnFoto: TPanel;
    grpFoto: TGroupBox;
    btnBuscar: TSpeedButton;
    btnLimpar: TSpeedButton;
    btnWebCam: TSpeedButton;
    imgFoto: TDBImage;
    dbeCidade: TcxDBButtonEdit;
    lblNome: TcxLabel;
    lblDocumento: TcxLabel;
    cmdTipoCliente: TcxDBComboBox;
    lblTipo: TcxLabel;
    cmdEstadoCivil: TcxDBComboBox;
    procedure miRelClientesCidadeClick(Sender: TObject);
    procedure miRelClientesDataNascClick(Sender: TObject);
    procedure miRelAniversariantesClick(Sender: TObject);
    procedure cdsPadraoAfterInsert(DataSet: TDataSet);
    procedure actPrintPersonExecute(Sender: TObject);
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

uses Funcoes, ConstPadrao, unModeloConsulta, unGeraRelatorio, uConfiguraRelatorio,
     unPrevListagemClientes, VarGlobal,  unFiltroSimples, unContasReceber,
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

procedure TfrmCliente.actPrintPersonExecute(Sender: TObject);
begin
  TfrmGeraRelatorio.Execute('Clientes', 'VIEWFICHACLIENTE', GetConnection);
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

