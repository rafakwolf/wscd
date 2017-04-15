unit unCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons,
  ExtCtrls, ComCtrls, SqlExpr, DBCtrls, 
  Mask,  DBClient, Provider, StrUtils,  ExtDlgs, FMTBcd,
  System.Actions;

type
  TfrmCliente = class(TfrmPadrao)
    N5: TMenuItem;
    N6: TMenuItem;
    miRelClientesDataNasc: TMenuItem;
    miRelAniversariantes: TMenuItem;
    miRelClientesCidade: TMenuItem;
    N7: TMenuItem;
    miEtiquetaCliente: TMenuItem;
    sqldPadrao: TSQLDataSet;
    dspPadrao: TDataSetProvider;
    cdsPadrao: TClientDataSet;
    cdsPadraoCODCLIENTE: TIntegerField;
    cdsPadraoTIPO: TStringField;
    cdsPadraoNOME: TStringField;
    cdsPadraoENDERECO: TStringField;
    cdsPadraoCEP: TStringField;
    cdsPadraoBAIRRO: TStringField;
    cdsPadraoTELEFONE: TStringField;
    cdsPadraoCODCIDADE: TIntegerField;
    cdsPadraoUF: TStringField;
    cdsPadraoTEMPO_MORADIA: TStringField;
    cdsPadraoEND_ANTERIOR: TStringField;
    cdsPadraoE_MAIL: TStringField;
    cdsPadraoTRABALHO: TStringField;
    cdsPadraoCARGO: TStringField;
    cdsPadraoESTADO_CIVIL: TStringField;
    cdsPadraoCONJUGUE: TStringField;
    cdsPadraoLOCAL_TRAB: TStringField;
    cdsPadraoPAI: TStringField;
    cdsPadraoMAE: TStringField;
    cdsPadraoCPF_CNPJ: TStringField;
    cdsPadraoRG_IE: TStringField;
    cdsPadraoREFER_PES: TStringField;
    cdsPadraoREFER_COM: TStringField;
    cdsPadraoFONE_COM: TStringField;
    cdsPadraoOBS: TMemoField;
    cdsPadraoNATURALIDADE: TStringField;
    cdsPadraoFAX: TStringField;
    sqldCidade: TSQLDataSet;
    sqldCidadeCODCIDADE: TIntegerField;
    sqldCidadeDESCRICAO: TStringField;
    dspCidade: TDataSetProvider;
    cdsCidade: TClientDataSet;
    cdsCidadeCODCIDADE: TIntegerField;
    cdsCidadeDESCRICAO: TStringField;
    miFicha: TMenuItem;
    N9: TMenuItem;
    miFiltros: TMenuItem;
    miFiltroCidade: TMenuItem;
    dbeNome: TDBEdit;
    dbeEndereco: TDBEdit;
    dbeCidade: TDBEdit;
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
    dbeEstadoCivil: TDBEdit;
    cdsPadraoDATA_INICIO: TDateField;
    cdsPadraoDATA_NASC: TDateField;
    cdsPadraoCADASTRO: TDateField;
    btnContas: TBitBtn;
    N10: TMenuItem;
    miAjustaCPF_CNPJ: TMenuItem;
    dbeFax: TDBEdit;
    cdsPadraoSALARIO: TFMTBCDField;
    cdsPadraoLIMITE: TFMTBCDField;
    sqldPadraoCODCLIENTE: TIntegerField;
    sqldPadraoTIPO: TStringField;
    sqldPadraoNOME: TStringField;
    sqldPadraoENDERECO: TStringField;
    sqldPadraoCEP: TStringField;
    sqldPadraoBAIRRO: TStringField;
    sqldPadraoTELEFONE: TStringField;
    sqldPadraoFAX: TStringField;
    sqldPadraoCODCIDADE: TIntegerField;
    sqldPadraoDESCRICAO: TStringField;
    sqldPadraoUF: TStringField;
    sqldPadraoTEMPO_MORADIA: TStringField;
    sqldPadraoEND_ANTERIOR: TStringField;
    sqldPadraoE_MAIL: TStringField;
    sqldPadraoTRABALHO: TStringField;
    sqldPadraoCARGO: TStringField;
    sqldPadraoDATA_INICIO: TDateField;
    sqldPadraoSALARIO: TFMTBCDField;
    sqldPadraoESTADO_CIVIL: TStringField;
    sqldPadraoCONJUGUE: TStringField;
    sqldPadraoLOCAL_TRAB: TStringField;
    sqldPadraoDATA_NASC: TDateField;
    sqldPadraoPAI: TStringField;
    sqldPadraoMAE: TStringField;
    sqldPadraoCPF_CNPJ: TStringField;
    sqldPadraoRG_IE: TStringField;
    sqldPadraoREFER_PES: TStringField;
    sqldPadraoREFER_COM: TStringField;
    sqldPadraoFONE_COM: TStringField;
    sqldPadraoCADASTRO: TDateField;
    sqldPadraoOBS: TMemoField;
    sqldPadraoNATURALIDADE: TStringField;
    sqldPadraoLIMITE: TFMTBCDField;
    cdsPadraoDESCRICAO: TStringField;
    sqldPadraoFOTO: TBlobField;
    cdsPadraoFOTO: TBlobField;
    btnFoto: TBitBtn;
    pnFoto: TPanel;
    grpFoto: TGroupBox;
    btnBuscar: TSpeedButton;
    btnLimpar: TSpeedButton;
    btnWebCam: TSpeedButton;
    imgFoto: TDBImage;
    procedure miRelClientesCidadeClick(Sender: TObject);
    procedure miRelClientesDataNascClick(Sender: TObject);
    procedure miRelAniversariantesClick(Sender: TObject);
    procedure cdsPadraoAfterInsert(DataSet: TDataSet);
    procedure dbeCidadeClickButton(Sender: TObject);
    procedure actPrintPersonExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure miFiltroCidadeClick(Sender: TObject);
    procedure dbeLimiteKeyPress(Sender: TObject; var Key: Char);
    procedure dbeSalarioKeyPress(Sender: TObject; var Key: Char);
    procedure btnObservacaoClick(Sender: TObject);
    procedure dbeEstadoCivilClickButton(Sender: TObject);
    procedure cdsPadraoCODCIDADEValidate(Sender: TField);
    procedure cdsPadraoTIPOSetText(Sender: TField; const Text: String);
    procedure cdsPadraoTIPOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure miEtiquetaClienteClick(Sender: TObject);
    procedure btnContasClick(Sender: TObject);
    procedure cdsPadraoCPF_CNPJSetText(Sender: TField; const Text: String);
    procedure miAjustaCPF_CNPJClick(Sender: TObject);
    procedure dsPadraoStateChange(Sender: TObject);
    procedure miFichaClick(Sender: TObject);
    procedure btnFotoClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnWebCamClick(Sender: TObject);
  private
    SQLPadraoTela: string;
    procedure Foto(Visivel: Boolean);
  public
    procedure AntesSalvar; override;
  end;

var
  frmCliente: TfrmCliente;

implementation

uses Funcoes, ConstPadrao, unModeloConsulta, unGeraRelatorio, uConfiguraRelatorio,
     unPrevListagemClientes, VarGlobal,  unFiltroSimples, unContasReceber,
     Extensos, unAguarde, unFoto, udatabaseutils;

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
  //Incrementa('CLIENTES', cdsPadraoCODCLIENTE, GetConnection);
  cdsPadraoTIPO.AsString := 'F';
  cdsPadraoCADASTRO.AsDateTime := Date;
  cdsPadraoLIMITE.AsFloat := Global.LimiteCliente;
  cdsPadraoSALARIO.AsFloat := 0;
  //SetFocusIfCan(dbcbTipo);
end;

procedure TfrmCliente.dbeCidadeClickButton(Sender: TObject);
begin
  inherited;
  if (cdsPadrao.State in [dsInsert, dsEdit]) then
    if TfrmModeloConsulta.Execute('Busca Cidade', cdsCidade, FN_CIDADES, DL_CIDADES) then
      cdsPadraoCODCIDADE.AsInteger := cdsCidadeCODCIDADE.AsInteger;
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
  SQLPadraoTela := sqldpadrao.Commandtext;
end;

procedure TfrmCliente.actPrintExecute(Sender: TObject);
begin
  inherited;
  with TfrmPrevListagemClientes.Create(Self) do
  try
    cdsPadrao.Close;
    cdsPadrao.CommandText := 'select'+
                             ' CODIGO,'+
                             ' NOME,'+
                             ' ENDERECO,'+
                             ' CPF_CNPJ,'+
                             ' RG_IE,'+
                             ' DATANASCIMENTO,'+
                             ' CODCIDADE,'+
                             ' CIDADE,'+
                             ' TELEFONE,'+
                             ' TIPO '+
                             'from VIEWRELCLIENTES '+
                             'order by NOME, DATANASCIMENTO';
    cdsPadrao.Open;
    TipoRelatorio := 0;
    PrintIfNotEmptyRL(rrPadrao);
  finally
    cdsPadrao.Close;
    Free;
  end;
end;

procedure TfrmCliente.miFiltroCidadeClick(Sender: TObject);
var
  IdRetorno: Integer;
  Order, SQL: string;
begin
  inherited;

  SQL := SQLPadraoTela;
  Order := Copy(SQL, Pos('order', SQL), Length(SQL));
  Delete(SQL, Pos('order', SQL), Length(SQL));

  if TfrmFiltroSimples.Execute(IdRetorno, 'CIDADES', 'DESCRICAO', 'CODCIDADE') then
  begin
    cdsPadrao.DisableControls;
    cdsPadrao.Close;
    cdsPadrao.CommandText := SQL + ' where cli.CODCIDADE = ' +
      QuotedStr(IntToStr(IdRetorno))+' '+Order;
    cdsPadrao.Open;
    cdsPadrao.EnableControls;
    if cdsPadrao.IsEmpty then
    begin
      MsgErro(UM_PESQUISAVAZIO);
      actLimparFiltro.Execute;
    end;
  end;
end;

procedure TfrmCliente.dbeLimiteKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  //ControlarTeclas(Key);
end;

procedure TfrmCliente.dbeSalarioKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  //ControlarTeclas(Key);
end;

procedure TfrmCliente.btnObservacaoClick(Sender: TObject);
begin
  inherited;
  FormMemo(dsPadrao, 'OBS');
end;

procedure TfrmCliente.dbeEstadoCivilClickButton(Sender: TObject);
begin
  inherited;
  if cdsPadrao.State in [dsInsert, dsEdit] then
    case FormRadioButtons('Solteiro(a), Casado(a), Amaziado(a), Viúvo(a)', 'Estado Civil') of
      0: cdsPadraoESTADO_CIVIL.AsString := 'S';
      1: cdsPadraoESTADO_CIVIL.AsString := 'C';
      2: cdsPadraoESTADO_CIVIL.AsString := 'A';
      3: cdsPadraoESTADO_CIVIL.AsString := 'V';
    end;
end;

procedure TfrmCliente.cdsPadraoCODCIDADEValidate(Sender: TField);
var
  NomeCidade: string;
begin
  inherited;
  NomeCidade := GetFieldByID(GetConnection, 'CIDADES', 'DESCRICAO', 'CODCIDADE',
    Sender.AsInteger);
  if NomeCidade <> '' then
    cdsPadraoDESCRICAO.AsString := NomeCidade;
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
  frmContasReceber := TfrmContasReceber.Create(self);
  frmContasReceber.Caption := 'Contas do cliente: '+cdsPadraoNOME.AsString;
  frmContasReceber.TipoChamada := 1;
  frmContasReceber.IdCliente := cdsPadraoCODCLIENTE.AsInteger;
  frmContasReceber.ShowModal;
end;

procedure TfrmCliente.AntesSalvar;
var
  Repetido: Boolean;
begin
  inherited;
  with TSQLDataSet.Create(nil) do
  try
    SQLConnection := sqldPadrao.SQLConnection;
    CommandText := 'select count(1) from CLIENTES where CPF_CNPJ = '+
      QuotedStr(dbeCpf.Text)+' or RG_IE = '+QuotedStr(dbeRg.Text);
    Open;
    Repetido := Fields[0].AsInteger > 0;
  finally
    Free;
  end;

  if (ModoInsert(cdsPadrao) and Repetido) then
  begin
    MsgAviso('Cliente com este CPF/CNPJ ou RG/IE já está cadastrado.');
    Abort;
  end;

  if Idade(cdsPadraoDATA_NASC.AsDateTime) < Global.IdadeCliente then
  begin
    MsgCuidado('Cliente com idade menor que a permitida, não poderá ser cadastrado.');
    Abort;
  end;
end;

procedure TfrmCliente.cdsPadraoCPF_CNPJSetText(Sender: TField;
  const Text: String);
begin
  inherited;{
  if ValidaCampo(Text, 0) then
    Sender.AsString := FormatarDoc(Text, 0)
  else if ValidaCampo(Text, 1) then
    Sender.AsString := FormatarDoc(Text, 1)
  else
  begin
    MsgCuidado('CPF/CNPJ inválido.');
    Sender.Clear;
    Sender.FocusControl;
    Exit;
  end; }
end;

procedure TfrmCliente.miAjustaCPF_CNPJClick(Sender: TObject);

  procedure AjustaRequires(b: Boolean);
  begin
    cdsPadraoTIPO.Required      := b;
    cdsPadraoNOME.Required      := b;
    cdsPadraoCODCIDADE.Required := b;
    cdsPadraoCPF_CNPJ.Required  := b;
    cdsPadraoRG_IE.Required     := b;
    cdsPadraoDATA_NASC.Required := b;
  end;

var
  Erro: Boolean;
begin
  inherited;
  Erro := False;
  try
    try
      TfrmAguarde.Execute('Ajustando, aguarde...');
      AjustaRequires(False); // dexa todos os fields como não requeridos para evitar erro de campo requerido
      cdsPadrao.First;
      cdsPadrao.DisableControls;
      while not cdsPadrao.Eof do
      begin
        if Trim(cdsPadraoCPF_CNPJ.AsString) <> '' then
        begin

//          if ValidaCampo(cdsPadraoCPF_CNPJ.AsString, docCPF) then // é CPF
//          begin
//            cdsPadrao.Edit;
//            cdsPadraoCPF_CNPJ.AsString := FormatarDoc(cdsPadraoCPF_CNPJ.AsString, docCPF);
//            cdsPadrao.Post;
//          end
//          else if ValidaCampo(cdsPadraoCPF_CNPJ.AsString, docCNPJ) then // é CNPJ
//          begin
//            cdsPadrao.Edit;
//            cdsPadraoCPF_CNPJ.AsString := FormatarDoc(cdsPadraoCPF_CNPJ.AsString, docCNPJ);
//            cdsPadrao.Post;
//          end;

        end;
        cdsPadrao.Next;
      end;
      cdsPadrao.ApplyUpdates(0);
    except
      Erro := True;
      raise Exception.Create('Erro ao ajustar CPF/CNPJs.');
    end;
  finally
    frmAguarde.Fecha;
    if not Erro then
      MsgAviso('Ajuste de CPF/CNPJs concluído!');
    AjustaRequires(True); // volta os campos requeridos...
    cdsPadrao.EnableControls;
  end;
end;

procedure TfrmCliente.dsPadraoStateChange(Sender: TObject);
begin
  inherited;
  miAjustaCPF_CNPJ.Enabled := not EditModes;
end;

procedure TfrmCliente.miFichaClick(Sender: TObject);

  function GetUltimaCompraCliente: string;
  begin
    with TSQLDataSet.Create(nil) do
    try
      SQLConnection := sqldPadrao.SQLConnection;
      CommandText := 'select DATA, TOTAL from VENDA '+
                     'where CODCLIENTE = '+QuotedStr(IntToStr(cdsPadraoCODCLIENTE.AsInteger));
      Open;
      if not IsEmpty then
        Result := 'Data: '+FormatDateTime('dd/mm/yyyy', FieldByName('DATA').AsDateTime)+' - '+
                  'Total: '+FormatFloat('#,##0.00', FieldByName('TOTAL').AsFloat)
      else
        Result := 'Não existem compras deste cliente.';
    finally
      Free;
    end;
  end;

var
  i, Len: Integer;
begin
  inherited;   {
  with vdocapFicha do
  begin
    BeginDoc;
    Title := 'Ficha de cliente';

    Font.Size := 12;
    Font.Style := [fsBold, fsUnderline];

    Print(00, Empresa.Nome, True);
    Font.Style := [];
    Print(00, Empresa.Cnpj+' - '+Empresa.InscEstadual, True);
    Print(00, Empresa.Endereco+' - '+Empresa.Cidade+' - '+Empresa.Estado, True);
    Print(00, Empresa.Bairro+' - '+Empresa.Cep+' - '+Empresa.Email, True);

    Font.Size := 8;
    Font.Style := [];

    Replicate(00, 80);

    Font.Size := 12;
    Font.Style := [fsBold];

    Print(00, 'Ficha de cliente', True);

    Font.Size := 8;
    Font.Style := [];

    Replicate(00, 80);

    Font.Size := 9;
    Font.Style := [];

    for i := 0 to cdsPadrao.FieldCount-1 do
    begin
      Len := Length(cdsPadrao.Fields[i].DisplayLabel);

      if not (cdsPadrao.Fields[i].DataType in [ftBlob]) then
      begin
        if not cdsPadrao.Fields[i].IsNull then
          Print(00, AnsiReplaceStr(FirstUpper(cdsPadrao.Fields[i].DisplayLabel), '_', ' ')+
            DupeString('.', 20-Len)+': '+cdsPadrao.Fields[i].AsString, True)
        else
          Print(00, AnsiReplaceStr(FirstUpper(cdsPadrao.Fields[i].DisplayLabel), '_', ' ')+
            DupeString('.', 20-Len)+':', True);
      end;
    end;

    if not cdsPadraoDATA_NASC.IsNull then
      Print(00, 'Idade'+DupeString('.', 15)+': '+IntToStr(Idade(cdsPadraoDATA_NASC.AsDateTime))+' anos', True);

    Print(00, 'Última compra'+DupeString('.', 7)+': '+GetUltimaCompraCliente, True);

    EndDoc;
  end;  }
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
      //if Execute then
      //  imgFoto.LoadFromFile(FileName);
    finally
      Free;
    end;
end;

procedure TfrmCliente.btnWebCamClick(Sender: TObject);
var
  Foto: string;
begin
  if EditModes then
  begin
    //if TfrmFoto.Load(IntToStr(cdsPadraoCODCLIENTE.AsInteger), Foto) then
    ///  imgFoto.LoadFromFile(Foto);
  end;
end;

initialization
  RegisterClass(TfrmCliente);
finalization
  UnRegisterClass(TfrmCliente);

end.

