unit unReceberMan;

interface

uses
   Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls,  DBCtrls, Buttons, DB, varglobal,
   memds,  SqlDb, unContasReceber, Grids,
  DBGrids, FMTBcd, unSimplePadrao,   uniLabel,
    uniEdit, uniDBEdit, uniPanel, uniBasicGrid, uniDBGrid,
  uniRadioGroup;

type
  TfrmReceberMan = class(TfrmSimplePadrao)
    dsContasReceber: TDataSource;
    sqldContaReceber: TSQLQuery;
    dspContaReceber: TComponent;
    cdsContaReceber: TMemDataSet;
    sqldContaReceberCODIGO: TIntegerField;
    sqldContaReceberDATA: TDateField;
    sqldContaReceberVENCIMENTO: TDateField;
    sqldContaReceberCLIENTE: TIntegerField;
    sqldContaReceberNOMECLIENTE: TStringField;
    sqldContaReceberDESCRICAO: TStringField;
    sqldContaReceberDOCUMENTO: TStringField;
    sqldContaReceberVALOR: TFMTBCDField;
    sqldContaReceberJURO: TFMTBCDField;
    sqldContaReceberRECEBER: TStringField;
    sqldContaReceberRECDA: TStringField;
    sqldContaReceberDATARECTO: TDateField;
    sqldContaReceberORIGEM: TIntegerField;
    sqldContaReceberVENDA: TIntegerField;
    sqldContaReceberCAPITALRECDO: TFMTBCDField;
    sqldContaReceberJURORECDO: TFMTBCDField;
    sqldContaReceberDESCTO: TFMTBCDField;
    sqldContaReceberOBS: TMemoField;
    sqldContaReceberATRASO: TIntegerField;
    cdsContaReceberCODIGO: TIntegerField;
    cdsContaReceberDATA: TDateField;
    cdsContaReceberVENCIMENTO: TDateField;
    cdsContaReceberCLIENTE: TIntegerField;
    cdsContaReceberNOMECLIENTE: TStringField;
    cdsContaReceberDESCRICAO: TStringField;
    cdsContaReceberDOCUMENTO: TStringField;
    cdsContaReceberVALOR: TFMTBCDField;
    cdsContaReceberJURO: TFMTBCDField;
    cdsContaReceberRECEBER: TStringField;
    cdsContaReceberRECDA: TStringField;
    cdsContaReceberDATARECTO: TDateField;
    cdsContaReceberORIGEM: TIntegerField;
    cdsContaReceberVENDA: TIntegerField;
    cdsContaReceberCAPITALRECDO: TFMTBCDField;
    cdsContaReceberJURORECDO: TFMTBCDField;
    cdsContaReceberDESCTO: TFMTBCDField;
    cdsContaReceberOBS: TMemoField;
    cdsContaReceberATRASO: TIntegerField;
    sqldContaReceberIDCONTA: TIntegerField;
    sqldContaReceberNOME: TStringField;
    cdsContaReceberIDCONTA: TIntegerField;
    cdsContaReceberNOME: TStringField;
    sqldSelecao: TSQLQuery;
    sqldSelecaoIDBANCO: TIntegerField;
    sqldSelecaoBANCO: TStringField;
    dspSelecao: TComponent;
    cdsSelecao: TMemDataSet;
    cdsSelecaoIDBANCO: TIntegerField;
    cdsSelecaoBANCO: TStringField;
    dsSelecao: TDataSource;
    sqldContaReceberVALORJURO: TSingleField;
    sqldContaReceberTOTAL: TSingleField;
    sqldContaReceberTOTALRECDO: TSingleField;
    cdsContaReceberVALORJURO: TSingleField;
    cdsContaReceberTOTAL: TSingleField;
    cdsContaReceberTOTALRECDO: TSingleField;
    lblBandaMagnetica: TLabel;
    lblEmissao: TLabel;
    lblVenc: TLabel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    dbValor: TEdit;
    edtAgencia: TEdit;
    edtConta: TEdit;
    edtNumeroCheque: TEdit;
    edtValor: TEdit;
    dbeBanco: TDBEdit;
    BevelLinha: TPanel;
    bvlLinha2: TPanel;
    medtBandaMagnetica: TEdit;
    medtVencimento: TEdit;
    medtEmissao: TEdit;
    dbgrdContas: TDBGrid;
    rgReceb: TRadioGroup;
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure rgRecebClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cdsContaReceberAfterInsert(DataSet: TDataSet);
    procedure btnCancelClick(Sender: TObject);
    procedure dbeBancoClickButton(Sender: TObject);
    procedure medtBandaMagneticaExit(Sender: TObject);
    procedure edtValorEnter(Sender: TObject);
    procedure dspContaReceberGetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: String);
    procedure cdsSelecaoIDBANCOValidate(Sender: TField);
  private
    procedure ReceberTotal;
    procedure ReceberParcial;
    procedure ReceberCheque;
  public
  end;

var
  frmReceberMan: TfrmReceberMan;

implementation

uses Funcoes, ConstPadrao, uDatabaseutils,
     Extensos, uCheque, Math;

{$R *.dfm}

procedure TfrmReceberMan.ReceberParcial;
var
  CodigoOld, ClienteOld, IdContaOld: Integer;
  DataOld, VencimentoOld: TDateTime;
  DescricaoOld, NomeCliOld, DocumentoOld: string;
  ValorOld, JuroOld, ValorJurosOld, TotalOld,
  ValorReceber, JurosReceber: Currency;
  desc: string;
begin
  { o valor n�o pode ser maior }
  if rgReceb.ItemIndex = 0 then
    if (StrToFloatDef(dbValor.Text, 0) > RoundTo(cdsContaReceberTOTAL.AsFloat, 2)) then
    begin
      MsgCuidado('O Valor maior que o total da conta, digite o valor correto.');
      dbValor.SetFocus;
      Exit;
    end
  else if rgReceb.ItemIndex = 1 then
    if (StrToFloatDef(edtValor.Text, 0) > RoundTo(cdsContaReceberTOTAL.AsFloat, 2)) then
    begin
      MsgCuidado('O Valor maior que o total da conta, digite o valor correto.');
      edtValor.SetFocus;
      Exit;
    end;

  CodigoOld     := cdsContaReceberCODIGO.AsInteger;
  DataOld       := cdsContaReceberDATA.AsDateTime;
  VencimentoOld := cdsContaReceberVENCIMENTO.AsDateTime;
  DescricaoOld  := cdsContaReceberDESCRICAO.AsString;
  ClienteOld    := cdsContaReceberCLIENTE.AsInteger;
  NomeCliOld    := cdsContaReceberNOMECLIENTE.AsString;
  DocumentoOld  := cdsContaReceberDOCUMENTO.AsString;
  ValorOld      := cdsContaReceberVALOR.AsFloat;
  JuroOld       := cdsContaReceberJURO.AsFloat;
  ValorJurosOld := cdsContaReceberVALORJURO.AsFloat;
  TotalOld      := cdsContaReceberTOTAL.AsFloat;
  IdContaOld    := IfThen(cdsContaReceberIDCONTA.IsNull,-1,cdsContaReceberIDCONTA.AsInteger);


  if MsgSN('Recebimento parcial. Gerar conta do restante?') then
  begin
    // ajusta a conta de capital
    cdsContaReceber.Edit;
    cdsContaReceberRECDA.AsString       := 'S';
    cdsContaReceberRECEBER.AsString     := 'N';
    cdsContaReceberDATARECTO.AsDateTime := Date;

    if rgReceb.ItemIndex = 0 then
      ValorReceber := StrToFloatDef(dbValor.Text, 0)
    else
      ValorReceber := StrToFloatDef(edtValor.Text, 0);

    JurosReceber := ((ValorJurosOld / TotalOld) * ValorReceber);

    cdsContaReceberJURORECDO.AsFloat    := JurosReceber;
    cdsContaReceberCAPITALRECDO.AsFloat := (ValorReceber - JurosReceber);
    cdsContaReceberDESCTO.AsFloat       := 0;
    cdsContaReceber.ApplyUpdates(0);

    // ajusta uma nova conta com o restante
    cdsContaReceber.Insert;
    cdsContaReceberDATA.AsDateTime       := DataOld;
    cdsContaReceberVENCIMENTO.AsDateTime := VencimentoOld;
    cdsContaReceberDESCRICAO.AsString    := DescricaoOld;
    cdsContaReceberCLIENTE.AsInteger     := ClienteOld;

    cdsContaReceberVALOR.AsFloat :=
      (ValorOld - (ValorReceber - JurosReceber)); // calcula o novo capital de conta

    cdsContaReceberDOCUMENTO.AsString   := 'R'+DocumentoOld;
    cdsContaReceberRECEBER.AsString     := 'N';
    cdsContaReceberJURO.AsFloat         := JuroOld;
    cdsContaReceberRECDA.AsString       := 'N';
    cdsContaReceberORIGEM.AsInteger     := CodigoOld;
    cdsContaReceberCAPITALRECDO.AsFloat := 0;
    cdsContaReceberJURORECDO.AsFloat    := 0;
    cdsContaReceberDESCTO.AsFloat       := 0;
    cdsContaReceber.ApplyUpdates(0);

    { caixa }
    desc := 'Rec. parc. '+NomeCliOld+' Doc. '+DocumentoOld;
    //GetDataModule.EnviaCaixa(Date,desc,DocumentoOld,'C',ValorReceber,IdContaOld);
  end
  else
  begin
    // caso n�o for gerada uma conta com restante
    // coloca o restante como desconto e recebe a conta totalmente
    cdsContaReceber.Edit;
    cdsContaReceberRECDA.AsString       := 'S';
    cdsContaReceberRECEBER.AsString     := 'N';
    cdsContaReceberDATARECTO.AsDateTime := Date;

    if rgReceb.ItemIndex = 0 then
      ValorReceber := StrToFloatDef(dbValor.Text, 0)
    else
      ValorReceber := StrToFloatDef(edtValor.Text, 0);
      
    JurosReceber := ((ValorJurosOld / TotalOld) * ValorReceber);

    cdsContaReceberJURORECDO.AsFloat    := JurosReceber;
    cdsContaReceberCAPITALRECDO.AsFloat := (ValorReceber - JurosReceber);
    cdsContaReceberDESCTO.AsFloat       := (TotalOld - ValorReceber);
    cdsContaReceber.ApplyUpdates(0);

    { caixa }
    desc := 'Rec. '+cdsContaReceberNOMECLIENTE.AsString+' Doc. '+cdsContaReceberDOCUMENTO.AsString;
    //GetDataModule.EnviaCaixa(Date,desc,cdsContaReceberDOCUMENTO.AsString,'C',ValorReceber,
    //  IdContaOld);
  end;
end;

procedure TfrmReceberMan.ReceberTotal;
var
  idconta: Integer;
  desc : string;
begin
  try
    cdsContaReceber.First;
    while not cdsContaReceber.Eof do
    begin
      // caixa

      desc := 'Rec. '+cdsContaReceberNOMECLIENTE.AsString+' Doc. '+cdsContaReceberDOCUMENTO.AsString;
      idconta := IfThen(cdsContaReceberIDCONTA.IsNull,-1,cdsContaReceberIDCONTA.AsInteger);
      //GetDataModule.EnviaCaixa(Date,desc,cdsContaReceberDOCUMENTO.AsString,'C',
      //  cdsContaReceberTOTAL.AsFloat,idconta);

      // conta
      cdsContaReceber.Edit;
      cdsContaReceberRECDA.AsString       := 'S';
      cdsContaReceberRECEBER.AsString     := 'N';
      cdsContaReceberDATARECTO.AsDateTime := Date;
      cdsContaReceberJURORECDO.AsFloat    := cdsContaReceberVALORJURO.AsFloat;
      cdsContaReceberCAPITALRECDO.AsFloat :=
        (cdsContaReceberTOTAL.AsFloat - cdsContaReceberVALORJURO.AsFloat);
      cdsContaReceberDESCTO.AsFloat       := 0;
      cdsContaReceber.ApplyUpdates(0);

      cdsContaReceber.Next;
    end;
  except
    raise Exception.Create('Erro recebendo contas');
  end;
end;

procedure TfrmReceberMan.btnOkClick(Sender: TObject);
begin
  case rgReceb.ItemIndex of
    0: // dinheiro
    begin
      if StrToFloatDef(dbValor.Text, 0) < RoundTo(cdsContaReceberTOTAL.AsFloat, 2) then
        ReceberParcial
      else
        ReceberTotal;
    end;
    1: // cheque
    begin
      if StrToFloatDef(edtValor.Text, 0) < RoundTo(cdsContaReceberTOTAL.AsFloat, 2) then
      begin
        ReceberParcial;
        ReceberCheque;
      end
      else
        ReceberCheque;
    end;
  end;
  
  PostMessageAllForms(WM_CONTA_RECEBER_RECEBIDA);
  Close;
end;

procedure TfrmReceberMan.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cdsContaReceber.Close;
  cdsSelecao.Close;

  Action := caFree;
end;

procedure TfrmReceberMan.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmReceberMan.FormCreate(Sender: TObject);
begin
  inherited;
  cdsSelecao.Open;
  CentralizaForm(Self);
end;

procedure TfrmReceberMan.rgRecebClick(Sender: TObject);

  procedure OcultaMostraControles(v: Boolean);
  begin
    lblBandaMagnetica.Visible  := v;
    medtBandaMagnetica.Visible := v;
    dbeBanco.Visible           := v;
    edtAgencia.Visible         := v;
    edtConta.Visible           := v;
    edtNumeroCheque.Visible    := v;
    edtValor.Visible           := v;
    lblEmissao.Visible         := v;
    medtEmissao.Visible        := v;
    lblVenc.Visible            := v;
    medtVencimento.Visible     := v;
    bvlLinha2.Visible          := v;
    dbValor.Enabled            := not v;
  end;

begin
  case rgReceb.ItemIndex of
    0:
    begin
      OcultaMostraControles(False);
      ClientHeight := 321;
      ClientWidth  := 481;
      btnOk.Top     := 288;
      btnCancel.Top := 288;
    end;
    1:
    begin
      ClientHeight := 417;
      ClientWidth  := 481;
      OcultaMostraControles(True);
      btnOk.Top     := 384;
      btnCancel.Top := 384;
    end;
  end;
  Update;
end;

procedure TfrmReceberMan.FormShow(Sender: TObject);
begin
  cdsContaReceber.Open;

  if cdsContaReceber.IsEmpty then
  begin
    MsgCuidado('Nenhum registro selecionado!');
    //PostMessage(Handle, WM_CLOSE, 0, 0);
    Exit;
  end;

  dbValor.Text := FormatFloat('0.00',
    SelectSingleField('select sum(TOTAL) from CONTASRECEBER where RECEBER = '+
    QuotedStr('S'), sqldContaReceber.SQLConnection));

  rgreceb.OnClick(Self);

  dbValor.ReadOnly  := cdsContaReceber.RecordCount > 1;
  edtValor.ReadOnly := cdsContaReceber.RecordCount > 1;
end;

procedure TfrmReceberMan.cdsContaReceberAfterInsert(DataSet: TDataSet);
begin
  //Incrementa('CONTASRECEBER', cdsContaReceberCODIGO, GetConnection);
end;

procedure TfrmReceberMan.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmReceberMan.dbeBancoClickButton(Sender: TObject);
begin
  cdsSelecao.Edit;
  //cdsSelecaoIDBANCO.AsVariant := GetDmPesquisar.GetBanco;
  cdsSelecao.Post;
end;

procedure TfrmReceberMan.ReceberCheque;
var
  Cheque: TCheque;
begin
  if StrToFloatDef(edtValor.Text, 0) = RoundTo(cdsContaReceberTOTAL.AsFloat, 2) then
    ReceberTotal;

  Cheque := TCheque.Create(sqldContaReceber.SQLConnection);
  with Cheque do
  begin
    IdCliente    := cdsContaReceberCLIENTE.AsInteger;
    Cmc7         := medtBandaMagnetica.Text;
    DataEmissao  := StrToDate(medtEmissao.Text);
    BomPara      := StrToDate(medtVencimento.Text);
    Valor        := StrToCurr(edtValor.Text);
    TipoCheque   := tcRecebido;

    if medtEmissao.Text = medtVencimento.Text then
      DataBaixado := Date
    else
    begin
      { Lan�a uma entrada no caixa por ser cheque pre-datado
        s� sai denovo quando o cheque for depositado. }
      //GetDataModule.EnviaCaixa(Date, 'Cheque Nro '+edtNumeroCheque.Text,
      //  edtNumeroCheque.Text, 'C', StrToFloat(edtValor.Text), Configuracao.ContaCheque);
    end;
    GravaCheque;
  end;
  Cheque.Free;
end;

procedure TfrmReceberMan.medtBandaMagneticaExit(Sender: TObject);

  function BancoExiste(IdBanco: Integer): Boolean;
  begin
    with TSQLQuery.Create(nil) do
    try
      SQLConnection := sqldContaReceber.SQLConnection;
      SQL.Clear; SQL.Text :='select count(1) from BANCO where IDBANCO = '+QuotedStr(IntToStr(IdBanco));
      Open;
      Result := Fields[0].AsInteger > 0;
    finally
      Free;
    end;
  end;

  function ChequeExiste(pBandaMagnetica: string): Boolean;
  begin
    with TSQLQuery.Create(nil) do
    try
      SQLConnection := sqldContaReceber.SQLConnection;
      SQL.Clear; SQL.Text :='select count(1) as CONT from CHEQUE '+
        'where BANDAMAGNETICA = '+QuotedStr(pBandaMagnetica);
      Open;
      Result := (FieldByName('CONT').AsInteger > 0);
    finally
      Free;
    end;
  end;

var
  varAgencia, varConta, varNroCheque, varComp, varBanco: string;
begin
  if (medtBandaMagnetica.Text <> '') then
  begin
    if not ValidaCMC7(medtBandaMagnetica.Text) then
    begin
      MsgCuidado('Banda magn�tica inv�lida!');
      medtBandaMagnetica.SetFocus;
      medtBandaMagnetica.SelectAll;
      Exit;
    end;

    if ChequeExiste(medtBandaMagnetica.Text) then
    begin
      MsgCuidado('Cheque j� existente, verifique a digita��o da banda magn�tica.');
      medtBandaMagnetica.Clear;
      medtBandaMagnetica.SetFocus;
      Exit;
    end;

    //RetornoBandaMagnetica(varComp, varBanco, varAgencia, varConta, varNroCheque,
    //  medtBandaMagnetica.Text);

    edtAgencia.Text := varAgencia;
    edtConta.Text   := varConta;
    edtNumeroCheque.Text := varNroCheque;

    if BancoExiste(StrToInt(varBanco)) then
    begin
//      GetDmPesquisar.cdsPesqBanco.Open;
//      GetDmPesquisar.cdsPesqBanco.Filtered := False;
//      GetDmPesquisar.cdsPesqBanco.Filter := 'IDBANCO = '+QuotedStr(varBanco);
//      GetDmPesquisar.cdsPesqBanco.Filtered := True;
    end
    else
    begin
      if MsgSN('O Banco "'+varBanco+'" n�o est� cadastrado, deseja cadastr�-lo agora?') then
        ChamaForm('TfrmBanco', 'Bancos', Self);
    end;
  end;
end;

procedure TfrmReceberMan.edtValorEnter(Sender: TObject);
begin
  edtValor.Text := dbValor.Text;
end;

procedure TfrmReceberMan.dspContaReceberGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
  TableName := 'CONTASRECEBER';
end;

procedure TfrmReceberMan.cdsSelecaoIDBANCOValidate(Sender: TField);
var
  NomeBanco: string;
begin
//  NomeBanco := GetFieldByID(GetConnection,'BANCO','BANCO','IDBANCO',Sender.AsInteger);
//  if NomeBanco <> '' then
//    cdsSelecaoBANCO.AsString := NomeBanco;
end;

initialization
  RegisterClass(TfrmReceberMan);
finalization
  UnRegisterClass(TfrmReceberMan);
end.
