unit unDuplicatas;

interface

uses
   Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons,
  ExtCtrls, ComCtrls, memds,  SqlDb,
   DBCtrls, DateUtils, RLReport, FMTBcd;

type
  TfrmDuplicatas = class(TfrmPadrao)
    cdsPadrao: TMemDataSet;
    cdsPadraoIDDUPLICATA: TIntegerField;
    cdsPadraoNRODUPLICATA: TStringField;
    cdsPadraoSACADO: TStringField;
    cdsPadraoCPF_CNPJ: TStringField;
    cdsPadraoENDERECO: TStringField;
    cdsPadraoBAIRRO: TStringField;
    cdsPadraoCEP: TStringField;
    cdsPadraoIDCIDADE: TIntegerField;
    cdsPadraoNOMECIDADE: TStringField;
    cdsPadraoFONEFAX: TStringField;
    cdsPadraoUF: TStringField;
    cdsPadraoIE: TStringField;
    cdsPadraoDATAEMISSAO: TDateField;
    cdsPadraoNROFATURA: TStringField;
    cdsPadraoVALOR_FATURA: TFMTBCDField;
    cdsPadraoVALOR: TFMTBCDField;
    cdsPadraoDATAVENC: TDateField;
    cdsPadraoDESCONTO: TFMTBCDField;
    cdsPadraoPRACAPAGAMENTO: TStringField;
    cdsPadraoDATADESCTO: TDateField;
    cdsPadraoVALOREXTENSO: TStringField;
    cdsPadraoDATAIMPRESSAO: TDateField;
    cdsPadraoIMPRESSA: TStringField;
    lbDuplicata: TLabel;
    dbeDataEmissao: TDBEdit;
    dbeCidade: TDBEdit;
    dbeDataPag: TDBEdit;
    dbeDataVenc: TDBEdit;
    dbeValor: TDBEdit;
    dbeDesconto: TDBEdit;
    dbeValorFatura: TDBEdit;
    dbeNroDuplicata: TDBEdit;
    dbeNroFatura: TDBEdit;
    dbeValorExtenso: TDBEdit;
    dbeSacado: TDBEdit;
    dbeCpfCnpj: TDBEdit;
    dbeRgIe: TDBEdit;
    dbeFoneFax: TDBEdit;
    dbeCep: TDBEdit;
    dbeEndereco: TDBEdit;
    dbeBairro: TDBEdit;
    dbeEstado: TDBEdit;
    dbePracaPagamento: TDBEdit;
    dbeDataImpressao: TDBEdit;
    dbeImpressa: TDBEdit;
    procedure actPrintExecute(Sender: TObject);
    procedure miConfigurarClick(Sender: TObject);
    procedure dbeValorExit(Sender: TObject);
    procedure dbeDescontoExit(Sender: TObject);
    procedure cdsPadraoAfterInsert(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure miFormularioBrancoClick(Sender: TObject);
    procedure cdsPadraoNewRecord(DataSet: TDataSet);
    procedure actDeleteExecute(Sender: TObject);
    procedure cdsPadraoIDCIDADEValidate(Sender: TField);
    procedure dbeCidadeClickButton(Sender: TObject);
    procedure miFormSistemaClick(Sender: TObject);
    procedure miImportarClienteClick(Sender: TObject);
    procedure miImportarCRClick(Sender: TObject);
    procedure btnCadastraSacadoClienteClick(Sender: TObject);
  private
    procedure CadastraCliente;
    procedure SetValoresDefault;
  public
    procedure AntesSalvar; override;
    procedure DepoisSalvar; override;
  end;

var
  frmDuplicatas: TfrmDuplicatas;

implementation

uses
  Funcoes, unModeloConsulta, Extensos, ConstPadrao,
  unPrevDuplicataSemForm, VarGlobal, unPrevDuplicata, uConfiguraRelatorio,
  udmDuplicatas, uDatabaseutils, udmCliente;

{$R *.dfm}

procedure TfrmDuplicatas.actPrintExecute(Sender: TObject);

  procedure ImprimirDuplicata;
  begin
    try
      frmPrevDuplicataSemForm := TfrmPrevDuplicataSemForm.Create(Self);
      with frmPrevDuplicataSemForm do
      begin
        Config := False;
        lbSacado.Caption             := Self.cdsPadraoSACADO.AsString;
        lbCnpjCpf.Caption            := Self.cdsPadraoCPF_CNPJ.AsString;
        lbEndereco.Caption           := Self.cdsPadraoENDERECO.AsString;
        lbBairro.Caption             := Self.cdsPadraoBAIRRO.AsString;
        lbCep.Caption                := Self.cdsPadraoCEP.AsString;
        lbMunicipio.Caption          := Self.cdsPadraoNOMECIDADE.AsString;
        lbTelefone_Fax.Caption       := Self.cdsPadraoFONEFAX.AsString;
        lbEstado.Caption             := Self.cdsPadraoUF.AsString;
        lbInscricao_Estadual.Caption := Self.cdsPadraoIE.AsString;
        lbData_Emissao.Caption       := FormatDateTime('dd/mm/yyyy', Self.cdsPadraoDATAEMISSAO.AsDateTime);
        lbNumero_Fatura.Caption      := Self.cdsPadraoNROFATURA.AsString;
        lbValor.Caption              := FormatFloat('#,##0.00', Self.cdsPadraoVALOR.AsFloat);
        lbNumero_Duplicata.Caption   := Self.cdsPadraoNRODUPLICATA.AsString;
        lbVencimento.Caption         := FormatDateTime('dd/mm/yyyy', Self.cdsPadraoDATAVENC.AsDateTime);
        lbDesconto.Caption           := FormatFloat('#,##0.00', Self.cdsPadraoDESCONTO.AsFloat);
        lbPraca_Pagamento.Caption    := Self.cdsPadraoPRACAPAGAMENTO.AsString;
        lbPagar_Ate.Caption          := FormatDateTime('dd/mm/yyyy', Self.cdsPadraoDATADESCTO.AsDateTime);
        lbValor_Extenso.Caption      := Self.cdsPadraoVALOREXTENSO.AsString;

        // grava aduplicata como impressa
        Self.cdsPadrao.Edit;
        Self.cdsPadraoIMPRESSA.AsString := 'S';
        Self.cdsPadraoDATAIMPRESSAO.AsDateTime := Date;
        // Self.//cdsPadrao.ApplyUpdates(0);

        // imprime
        PrintIfNotEmptyRL(rrDuplicata);
      end;
    finally
      FreeAndNil(frmPrevDuplicataSemForm);
    end;
  end;

begin
  inherited;
  ImprimirDuplicata;
end;

procedure TfrmDuplicatas.miConfigurarClick(Sender: TObject);
begin
  inherited;
  ChamaForm('TfrmConfiguraDuplicata', 'Configura��o de duplicatas', Self);
end;

procedure TfrmDuplicatas.dbeValorExit(Sender: TObject);
begin
  inherited;
  if ModoInsertEdit(cdsPadrao) then
    cdsPadraoVALOREXTENSO.AsString := Extenso(cdsPadraoVALOR.AsFloat);
end;

procedure TfrmDuplicatas.dbeDescontoExit(Sender: TObject);
begin
  inherited;
  if ModoInsertEdit(cdsPadrao) then
  begin
    cdsPadraoVALOR.AsFloat  := (cdsPadraoVALOR.AsFloat - cdsPadraoDESCONTO.AsFloat);
    cdsPadraoVALOREXTENSO.AsString := Extenso(cdsPadraoVALOR.AsFloat);
  end;
end;

procedure TfrmDuplicatas.cdsPadraoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  cdsPadraoNRODUPLICATA.AsString := IntToStr(cdsPadraoIDDUPLICATA.AsInteger);
  SetFocusIfCan(dbeNroFatura);
end;

procedure TfrmDuplicatas.FormCreate(Sender: TObject);
begin
  inherited;
  FieldNames := FN_DUPLICATA;
  DisplayLabels := DL_DUPLICATA;
  aCaption := 'Duplicatas';
  TableName := 'DUPLICATA';

  cdsPadrao.Open;
end;

procedure TfrmDuplicatas.CadastraCliente;
var tipo: string;
begin
  with TDmCliente.Create(nil) do
  try
      if IsClienteRepetido(dbeCpfCnpj.Text,dbeCpfCnpj.Text) then
        ShowMessage('Cliente j� cadastrado.')
      else
      begin
        if MsgSN('Este cliente � pessoa f�sica ou pessoa jur�dica?'+#13#13+
          'Sim - Pessoa F�sica;'+#13#10+
          'N�o - Pessoa Jur�dica;') then
          tipo := 'F'
        else
          tipo := 'J';

        Cadastrar(tipo, cdsPadraoSACADO.AsString, cdsPadraoCPF_CNPJ.AsString);
        MsgAviso('','Cliente "'+dbeSacado.Text+'" cadastrado com sucesso.');
      end;
  finally
    Free;
  end;
end;

procedure TfrmDuplicatas.miFormularioBrancoClick(Sender: TObject);
var
  x: Integer;
begin
  inherited;
  with TfrmPrevDuplicata.Create(Self) do
  try
    for x := 0 to ComponentCount - 1 do
      if Components[x] is TRLDBText then
        TRLDBText(Components[x]).Visible := False;
    PrintIfNotEmptyRL(rptDuplicata);
  finally
    Free;
  end;
end;

procedure TfrmDuplicatas.SetValoresDefault;
begin
  if cdsPadrao.State in dsEditModes then
  begin
    cdsPadraoPRACAPAGAMENTO.AsString := Empresa.Nome;
    cdsPadraoDATAEMISSAO.AsDateTime  := Date;
    cdsPadraoDATAVENC.AsDateTime     := IncDay(Date, Global.PrazoInicial);
    cdsPadraoDATADESCTO.AsDateTime   := IncDay(Date, Global.PrazoInicial);
  end;
end;

procedure TfrmDuplicatas.cdsPadraoNewRecord(DataSet: TDataSet);
begin
  inherited;
  SetValoresDefault;
  cdsPadraoVALOR.AsFloat := 0;
  cdsPadraoVALOR_FATURA.AsFloat := 0;
  cdsPadraoDESCONTO.AsFloat := 0;
  cdsPadraoIMPRESSA.AsString := 'N';
  cdsPadraoVALOREXTENSO.AsString := Extenso(0);
end;

procedure TfrmDuplicatas.actDeleteExecute(Sender: TObject);
begin
  if MsgSN('Deseja realmente excluir este registro?') then
    TdmDuplicatas(GetDm).Delete(cdsPadraoIDDUPLICATA.AsInteger);
end;

procedure TfrmDuplicatas.cdsPadraoIDCIDADEValidate(Sender: TField);
var
  NomeCidade: string;
begin
  inherited;
  NomeCidade := GetFieldByID(GetConnection, 'CIDADES', 'DESCRICAO', 'CODCIDADE',
    Sender.AsInteger);
  if NomeCidade <> '' then
    cdsPadraoNOMECIDADE.AsString := NomeCidade;
end;

procedure TfrmDuplicatas.dbeCidadeClickButton(Sender: TObject);
begin
  inherited;
  if cdsPadrao.State in [dsEdit, dsInsert] then
      cdsPadraoIDCIDADE.AsInteger :=
        TfrmModeloConsulta.Execute('Cidade', 'CIDADES', FN_CIDADES, DL_CIDADES, Application);
end;

procedure TfrmDuplicatas.miFormSistemaClick(Sender: TObject);
begin
  inherited;
  with TfrmPrevDuplicata.Create(Self) do
  try
    cdsDuplicata.Close;
    //cdsDuplicata.ParamByName('CODDUPLICATA').AsInteger :=
    //  cdsPadraoIDDUPLICATA.AsInteger;
    cdsDuplicata.Open;
    PrintIfNotEmptyRL(rptDuplicata);
  finally
    Free;
  end;
end;

procedure TfrmDuplicatas.DepoisSalvar;
begin
  inherited;
  CadastraCliente;
end;

procedure TfrmDuplicatas.AntesSalvar;
var Repetido: Boolean;
begin
  inherited;
  Repetido := TdmDuplicatas(GetDm).IsDuplicataRepetida(cdsPadraoNRODUPLICATA.AsString);

  if (ModoInsert(cdsPadrao) and Repetido) then
  begin
    MsgAviso('','J� existe uma duplicata com este n�mero.');
    Abort;
  end;
end;

procedure TfrmDuplicatas.btnCadastraSacadoClienteClick(Sender: TObject);
begin
  inherited;
  CadastraCliente;
end;

procedure TfrmDuplicatas.miImportarClienteClick(Sender: TObject);
var cliente: TdmCliente;
begin
  inherited;
  if TfrmModeloConsulta.Execute('Cliente', 'CLIENTES', FN_CLIENTES, DL_CLIENTES, Application) > 0 then
  begin
    cliente := TdmCliente.Create(nil);
    try
      cdsPadrao.Insert;
      cdsPadraoSACADO.AsString       := cliente.cdsPadraoNOME.AsString;
      cdsPadraoCPF_CNPJ.AsString     := cliente.cdsPadraoCPF_CNPJ.AsString;
      cdsPadraoENDERECO.AsString     := cliente.cdsPadraoENDERECO.AsString;
      cdsPadraoBAIRRO.AsString       := cliente.cdsPadraoBAIRRO.AsString;
      cdsPadraoCEP.AsString          := cliente.cdsPadraoCEP.AsString;
      cdsPadraoIDCIDADE.AsInteger    := cliente.cdsPadraoCODCIDADE.AsInteger;
      cdsPadraoFONEFAX.AsString      := cliente.cdsPadraoTELEFONE.AsString;
      cdsPadraoUF.AsString           := cliente.cdsPadraoUF.AsString;

      SetValoresDefault;

      cdsPadraoVALOR.AsFloat         := 0;
      cdsPadraoVALOREXTENSO.AsString := Extenso(cdsPadraoVALOR.AsFloat);
      cdsPadraoIMPRESSA.AsString     := 'N';
    finally
      cliente.Free;
    end;

    if MsgSN('Confirma importa��o dos dados deste cliente?')then
      btnSalvar.Click
    else
    begin
      cdsPadrao.CancelUpdates;
      MsgCuidado('','Duplicata cancelada.');
    end;
  end;
end;

procedure TfrmDuplicatas.miImportarCRClick(Sender: TObject);
//
//  function TotalVenda(IdVenda: Integer): Currency;
//  begin
//    with TSQLQuery.Create(nil) do
//    try
//      SQLConnection := GetConnection;
//      SQL.Clear; SQL.Text :='select TOTAL from VENDA where CODIGO = '+QuotedStr(IntToStr(IdVenda));
//      Open;
//      Result := FieldByName('TOTAL').AsFloat;
//    finally
//      Free;
//    end;
//  end;
//
//var cliente: TdmCliente;
begin
  inherited;
//  if TfrmModeloConsulta.Execute('Contas a receber', cdsCR, FN_CR, DL_CR) then
//  begin
//    cliente := TdmCliente.Create(nil);
//
//    cliente.cdsPadrao.Open;
//
//    if cdsCliente.Locate('CODCLIENTE', cdsCRCLIENTE.AsInteger, []) then
//    begin
//      cdsPadrao.Insert;
//      cdsPadraoSACADO.AsString          := cdsClienteNOME.AsString;
//      cdsPadraoCPF_CNPJ.AsString        := cdsClienteCPF_CNPJ.AsString;
//      cdsPadraoENDERECO.AsString        := cdsClienteENDERECO.AsString;
//      cdsPadraoBAIRRO.AsString          := cdsClienteBAIRRO.AsString;
//      cdsPadraoCEP.AsString             := cdsClienteCEP.AsString;
//      cdsPadraoIDCIDADE.AsInteger       := cdsClienteCODCIDADE.AsInteger;
//      cdsPadraoFONEFAX.AsString         := cdsClienteTELEFONE.AsString;
//      cdsPadraoUF.AsString              := cdsClienteUF.AsString;
//      cdsPadraoDATAEMISSAO.AsDateTime   := Date;
//      cdsPadraoNROFATURA.AsString       := IntToStr(cdsCRVENDA.AsInteger);
//      cdsPadraoVALOR_FATURA.AsFloat     := TotalVenda(cdsCRVENDA.AsInteger);
//      cdsPadraoVALOR.AsFloat            := cdsCRTOTAL.AsFloat;
//      cdsPadraoVALOREXTENSO.AsString    := Extenso(cdsPadraoVALOR.AsFloat);
//      cdsPadraoDATAVENC.AsDateTime      := cdsCRVENCIMENTO.AsDateTime;
//      cdsPadraoDESCONTO.AsFloat         := 0;
//      cdsPadraoPRACAPAGAMENTO.AsString  := Empresa.Nome;
//      cdsPadraoDATADESCTO.AsDateTime    := cdsCRVENCIMENTO.AsDateTime;
//      cdsPadraoDATAIMPRESSAO.AsDateTime := Date;
//      cdsPadraoIMPRESSA.AsString        := 'N';
//
//      if MsgSN('Confirma importa��o dos dados desta conta?')then
//        btnSalvar.Click
//      else
//      begin
//        cdsPadrao.CancelUpdates;
//        MsgCuidado('','Duplicata cancelada.');
//      end;
//    end;
//  end;
//  cdsCliente.Close;
end;

initialization
  RegisterClass(TfrmDuplicatas);
finalization
  UnRegisterClass(TfrmDuplicatas);
end.


