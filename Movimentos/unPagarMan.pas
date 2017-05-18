unit unPagarMan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DBCtrls, Mask, DB,
   SqlExpr, unContasPagar, Grids,
  DBGrids, DBClient,Datasnap.Provider, FMTBcd,
  unSimplePadrao;

type
  TTipoPagamento = (tpDinheiro, tpCheque);
  
  TfrmPagarMan = class(TfrmSimplePadrao)
    edtTotal: TLabeledEdit;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    rgTipoPagamento: TRadioGroup;
    dsContasPagar: TDataSource;
    bvlLinha: TBevel;
    sqldContasPagar: TSQLDataSet;
    dspContasPagar: TDataSetProvider;
    cdsContasPagar: TClientDataSet;
    sqldContasPagarCODIGO: TIntegerField;
    sqldContasPagarDATA: TDateField;
    sqldContasPagarVENCIMENTO: TDateField;
    sqldContasPagarFORNECEDOR: TIntegerField;
    sqldContasPagarNOMEFORN: TStringField;
    sqldContasPagarDESCRICAO: TStringField;
    sqldContasPagarDOCUMENTO: TStringField;
    sqldContasPagarVALOR: TFMTBCDField;
    sqldContasPagarJURO: TFMTBCDField;
    sqldContasPagarPAGAR: TStringField;
    sqldContasPagarPAGA: TStringField;
    sqldContasPagarDATAPAGTO: TDateField;
    sqldContasPagarORIGEM: TIntegerField;
    sqldContasPagarCOMPRA: TIntegerField;
    sqldContasPagarCAPITALPAGO: TFMTBCDField;
    sqldContasPagarJUROPAGO: TFMTBCDField;
    sqldContasPagarDESCTO: TFMTBCDField;
    sqldContasPagarOBS: TMemoField;
    sqldContasPagarATRASO: TIntegerField;
    cdsContasPagarCODIGO: TIntegerField;
    cdsContasPagarDATA: TDateField;
    cdsContasPagarVENCIMENTO: TDateField;
    cdsContasPagarFORNECEDOR: TIntegerField;
    cdsContasPagarNOMEFORN: TStringField;
    cdsContasPagarDESCRICAO: TStringField;
    cdsContasPagarDOCUMENTO: TStringField;
    cdsContasPagarVALOR: TFMTBCDField;
    cdsContasPagarJURO: TFMTBCDField;
    cdsContasPagarPAGAR: TStringField;
    cdsContasPagarPAGA: TStringField;
    cdsContasPagarDATAPAGTO: TDateField;
    cdsContasPagarORIGEM: TIntegerField;
    cdsContasPagarCOMPRA: TIntegerField;
    cdsContasPagarCAPITALPAGO: TFMTBCDField;
    cdsContasPagarJUROPAGO: TFMTBCDField;
    cdsContasPagarDESCTO: TFMTBCDField;
    cdsContasPagarOBS: TMemoField;
    cdsContasPagarATRASO: TIntegerField;
    dbgrdContasCP: TDBGrid;
    lblVenc: TLabel;
    lblBandaMagnetica: TLabel;
    edtAgencia: TLabeledEdit;
    dbeBanco: TDBEdit;
    edtConta: TLabeledEdit;
    edtNumeroCheque: TLabeledEdit;
    edtValor: TLabeledEdit;
    medtEmissao: TMaskEdit;
    medtVencimento: TMaskEdit;
    medtBandaMagnetica: TMaskEdit;
    bvlLinha2: TBevel;
    lblEmissao: TLabel;
    sqldContasPagarIDCONTA: TIntegerField;
    sqldContasPagarCONTA: TStringField;
    cdsContasPagarIDCONTA: TIntegerField;
    cdsContasPagarCONTA: TStringField;
    sqldSelecao: TSQLDataSet;
    sqldSelecaoIDBANCO: TIntegerField;
    sqldSelecaoBANCO: TStringField;
    dspSelecao: TDataSetProvider;
    cdsSelecao: TClientDataSet;
    cdsSelecaoIDBANCO: TIntegerField;
    cdsSelecaoBANCO: TStringField;
    dsSelecao: TDataSource;
    sqldContasPagarVALORJURO: TSingleField;
    sqldContasPagarTOTAL: TSingleField;
    sqldContasPagarTOTALPAGO: TSingleField;
    cdsContasPagarVALORJURO: TSingleField;
    cdsContasPagarTOTAL: TSingleField;
    cdsContasPagarTOTALPAGO: TSingleField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cdsContasPagarAfterInsert(DataSet: TDataSet);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rgTipoPagamentoClick(Sender: TObject);
    procedure dbeBancoClickButton(Sender: TObject);
    procedure edtValorEnter(Sender: TObject);
    procedure medtBandaMagneticaExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dspContasPagarGetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: String);
    procedure cdsSelecaoIDBANCOValidate(Sender: TField);
  private
    procedure PagarParcial;
    function ValidaCampos(TipoPagamento: TTipoPagamento): Boolean;
  public
    procedure PagarTotal;
    procedure PagarCheque;
  end;

var
  frmPagarMan: TfrmPagarMan;

implementation

uses  Funcoes, VarGlobal, ConstPadrao, uDatabaseutils,
     Extensos, uDmPesquisar, uCheque, System.Math;

{$R *.dfm}

procedure TfrmPagarMan.PagarTotal;
var
  desc: string;
  idconta: Integer;
begin
  try
    cdsContasPagar.First;

    while not cdsContasPagar.Eof do
    begin
      { caixa }
      idconta := IfThen(cdsContasPagarIDCONTA.IsNull, -1, cdsContasPagarIDCONTA.AsInteger);
      desc := 'Pag. '+cdsContasPagarNOMEFORN.AsString+
        ' Doc. '+cdsContasPagarDOCUMENTO.AsString;
      GetDataModule.EnviaCaixa(Date,desc,cdsContasPagarDOCUMENTO.AsString,'D',
        cdsContasPagarTOTAL.AsCurrency,idconta);

      // conta
      cdsContasPagar.Edit;
      cdsContasPagarPAGA.AsString        := 'S';
      cdsContasPagarPAGAR.AsString       := 'N';
      cdsContasPagarDATAPAGTO.AsDateTime := Date;
      cdsContasPagarJUROPAGO.AsFloat     := cdsContasPagarVALORJURO.AsFloat;
      cdsContasPagarCAPITALPAGO.AsFloat  :=
        (cdsContasPagarTOTAL.AsFloat - cdsContasPagarVALORJURO.AsFloat);
      cdsContasPagarDESCTO.AsFloat       := 0;
      cdsContasPagar.ApplyUpdates(0);

      cdsContasPagar.Next;
    end;
  except
    raise Exception.Create('Erro pagando contas.');
  end;
end;

procedure TfrmPagarMan.btnOkClick(Sender: TObject);
begin
  case rgTipoPagamento.ItemIndex of
    0: // dinheiro
    begin
      if not ValidaCampos(tpDinheiro) then
      begin
        MsgAviso('Preencha todos os dados para pagamento corretamente.');
        Exit;
      end;

      if StrToFloatDef(edtTotal.Text, 0) < RoundTo(cdsContasPagarTOTAL.AsFloat, 2) then
        PagarParcial
      else
        PagarTotal;
    end;
    1: // cheque
    begin
      if not ValidaCampos(tpCheque) then
      begin
        MsgAviso('Preencha todos os dados para pagamento corretamente.');
        Exit;
      end;

      if StrToFloatDef(edtValor.Text, 0) < RoundTo(cdsContasPagarTOTAL.AsFloat, 2) then
      begin
        PagarParcial;
        PagarCheque;
      end
      else
        PagarCheque;
    end;
  end;
  
  PostMessageAllForms(WM_CONTA_PAGAR_PAGA);
  Close;
end;

procedure TfrmPagarMan.FormShow(Sender: TObject);
begin
  cdsContasPagar.Open;

  if cdsContasPagar.IsEmpty then
  begin
    MsgCuidado('Nenhum registro selecionado.');
    PostMessage(Handle, WM_CLOSE, 0, 0);
    Exit;
  end;

  edtTotal.Text := FormatFloat('0.00',
    SelectSingleField('select sum(TOTAL) from CONTASPAGAR where PAGAR = '+
    QuotedStr('S'), sqldContasPagar.SQLConnection));

  rgTipoPagamento.OnClick(Self);

  edtTotal.ReadOnly := cdsContasPagar.RecordCount > 1;
  edtValor.ReadOnly := cdsContasPagar.RecordCount > 1;
end;

procedure TfrmPagarMan.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  cdsSelecao.Close;
  Action := caFree;
end;

procedure TfrmPagarMan.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmPagarMan.cdsContasPagarAfterInsert(DataSet: TDataSet);
begin
  //Incrementa('CONTASPAGAR', cdsContasPagarCODIGO, GetConnection);
end;

procedure TfrmPagarMan.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPagarMan.FormCreate(Sender: TObject);
begin
  inherited;
  cdsSelecao.Open;
  CentralizaForm(Self);
end;

procedure TfrmPagarMan.rgTipoPagamentoClick(Sender: TObject);

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
    edtTotal.Enabled           := not v;
  end;

begin
  case rgTipoPagamento.ItemIndex of
    0:
    begin
      OcultaMostraControles(False);
      ClientHeight  := 321;
      ClientWidth   := 481;
      btnOk.Top     := 288;
      btnCancel.Top := 288;
    end;
    1:
    begin
      ClientHeight  := 417;
      ClientWidth   := 481;
      OcultaMostraControles(True);
      btnOk.Top     := 384;
      btnCancel.Top := 384;
    end;
  end;
  Update;
end;

procedure TfrmPagarMan.PagarCheque;
var
  Cheque: TCheque;
begin
  if StrToFloatDef(edtValor.Text, 0) = RoundTo(cdsContasPagarTOTAL.AsFloat, 2) then
    PagarTotal;

  Cheque := TCheque.Create(sqldContasPagar.SQLConnection);
  with Cheque do
  begin
    IdFornec     := cdsContasPagarFORNECEDOR.AsInteger;
    Cmc7         := medtBandaMagnetica.Text;
    DataEmissao  := StrToDate(medtEmissao.Text);
    BomPara      := StrToDate(medtVencimento.Text);
    Valor        := StrToCurr(edtValor.Text);
    TipoCheque   := tcRepassado;

    if medtEmissao.Text = medtVencimento.Text then
      DataBaixado := Date
    else
    begin
      { Lança uma entrada no caixa por ser cheque pre-datado
        só sai denovo quando o cheque for depositado. }
      GetDataModule.EnviaCaixa(Date, 'Cheque Nro '+edtNumeroCheque.Text,
        edtNumeroCheque.Text, 'C', StrToFloat(edtValor.Text), Configuracao.ContaCheque);
    end;
    GravaCheque;
  end;
  Cheque.Free;
end;

procedure TfrmPagarMan.dbeBancoClickButton(Sender: TObject);
begin
  cdsSelecao.Edit;
  cdsSelecaoIDBANCO.AsVariant := GetDmPesquisar.GetBanco;
  cdsSelecao.Post;
end;

procedure TfrmPagarMan.edtValorEnter(Sender: TObject);
begin
  edtValor.Text := edtTotal.Text;
end;

procedure TfrmPagarMan.medtBandaMagneticaExit(Sender: TObject);

  function BancoExiste(IdBanco: Integer): Boolean;
  begin
    with TSQLDataSet.Create(nil) do
    try
      SQLConnection := sqldContasPagar.SQLConnection;
      CommandText := 'select count(1) from BANCO where IDBANCO = '+QuotedStr(IntToStr(IdBanco));
      Open;
      Result := Fields[0].AsInteger > 0;
    finally
      Free;
    end;
  end;

  function ChequeExiste(pBandaMagnetica: string): Boolean;
  begin
    with TSQLDataSet.Create(nil) do
    try
      SQLConnection := sqldContasPagar.SQLConnection;
      CommandText := 'select count(1) as CONT from CHEQUE '+
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
      MsgCuidado('Banda magnética inválida!');
      medtBandaMagnetica.SetFocus;
      medtBandaMagnetica.SelectAll;
      Exit;
    end;

    if ChequeExiste(medtBandaMagnetica.Text) then
    begin
      MsgCuidado('Cheque já existente, verifique a digitação da banda magnética.');
      medtBandaMagnetica.Clear;
      medtBandaMagnetica.SetFocus;
      Exit;
    end;

    //RetornoBandaMagnetica(varComp, varBanco, varAgencia, varConta, varNroCheque,
    //  medtBandaMagnetica.Text);

    edtAgencia.Text      := varAgencia;
    edtConta.Text        := varConta;
    edtNumeroCheque.Text := varNroCheque;

    if BancoExiste(StrToInt(varBanco)) then
    begin
//      GetDmPesquisar.cdsPesqBanco.Open;
//      GetDmPesquisar.cdsPesqBanco.Filtered := False;
//      GetDmPesquisar.cdsPesqBanco.Filter   := 'IDBANCO = '+QuotedStr(varBanco);
//      GetDmPesquisar.cdsPesqBanco.Filtered := True;
    end
    else
    begin
      if MsgSN('O Banco "'+varBanco+'" não está cadastrado, deseja cadastrá-lo agora?') then
        ChamaForm('TfrmBanco', 'Bancos', Self);
    end;
  end;
end;

procedure TfrmPagarMan.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    if (ActiveControl is TCustomMemo) or
            ((ActiveControl is TCustomCombo) and
             (TCustomCombo(ActiveControl).DroppedDown)) then
    begin
      Key := #0;
      Exit;
    end
    else if not (ActiveControl is TDBGrid) then
    begin
      Key := #0;
      PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);
    end
    else if (ActiveControl is TDBGrid) then
    begin
      with TDBGrid(ActiveControl) do
        if SelectedIndex < (FieldCount-1) then
          SelectedIndex := SelectedIndex+1
        else
          SelectedIndex := 0;
    end;
  end;
end;

procedure TfrmPagarMan.PagarParcial;
var
  CodigoOld, CodFornOld, IdContaOld: Integer;
  DataOld, VencimentoOld: TDateTime;
  DescricaoOld, NomeFornOld, DocumentoOld: string;
  ValorOld, JuroOld, ValorJurosOld, TotalOld,
  ValorPagar, JurosPagar: Currency;
  desc: string;
begin
  // se o valor a pagar for maior não dexa fazer nada
  if rgTipoPagamento.ItemIndex = 0 then
    if (StrToFloatDef(edtTotal.Text, 0) > RoundTo(cdsContasPagarTOTAL.AsFloat, 2)) then
    begin
      MsgCuidado('O Valor maior que o total da conta, digite o valor correto.');
      edtTotal.SetFocus;
      Exit;
    end
  else if rgTipoPagamento.ItemIndex = 1 then
    if (StrToFloatDef(edtValor.Text, 0) > RoundTo(cdsContasPagarTOTAL.AsFloat, 2)) then
    begin
      MsgCuidado('O Valor maior que o total da conta, digite o valor correto.');
      edtValor.SetFocus;
      Exit;
    end;

  // armazena os valores pra gerar um nova conta se necessario
  CodigoOld     := cdsContasPagarCODIGO.AsInteger;
  DataOld       := cdsContasPagarDATA.AsDateTime;
  VencimentoOld := cdsContasPagarVENCIMENTO.AsDateTime;
  DescricaoOld  := cdsContasPagarDESCRICAO.AsString;
  CodFornOld    := cdsContasPagarFORNECEDOR.AsInteger;
  NomeFornOld   := cdsContasPagarNOMEFORN.AsString;
  DocumentoOld  := cdsContasPagarDOCUMENTO.AsString;
  ValorOld      := cdsContasPagarVALOR.AsFloat;
  JuroOld       := cdsContasPagarJURO.AsFloat;
  ValorJurosOld := cdsContasPagarVALORJURO.AsFloat;
  TotalOld      := cdsContasPagarTOTAL.AsFloat;
  IdContaOld    := IfThen(cdsContasPagarIDCONTA.IsNull, -1, cdsContasPagarIDCONTA.AsInteger);

  if MsgSN('Pagamento parcial. Gerar conta do restante?') then
  begin
    // ajusta a conta de capital
    cdsContasPagar.Edit;
    cdsContasPagarPAGA.AsString        := 'S';
    cdsContasPagarPAGAR.AsString       := 'N';
    cdsContasPagarDATAPAGTO.AsDateTime := Date;

    if rgTipoPagamento.ItemIndex = 0 then
      ValorPagar := StrToFloatDef(edtTotal.Text,0)
    else if rgTipoPagamento.ItemIndex = 1 then
      ValorPagar := StrToFloatDef(edtValor.Text,0);

    JurosPagar := ((ValorJurosOld / TotalOld) * ValorPagar);

    cdsContasPagarJUROPAGO.AsFloat     := JurosPagar;
    cdsContasPagarCAPITALPAGO.AsFloat  := (ValorPagar - JurosPagar);
    cdsContasPagarDESCTO.AsFloat       := 0;
    cdsContasPagar.ApplyUpdates(0);

    // ajusta uma nova conta com o restante
    cdsContasPagar.Insert;
    cdsContasPagarDATA.AsDateTime       := DataOld;
    cdsContasPagarVENCIMENTO.AsDateTime := VencimentoOld;
    cdsContasPagarDESCRICAO.AsString    := DescricaoOld;
    cdsContasPagarFORNECEDOR.AsInteger  := CodFornOld;
    cdsContasPagarVALOR.AsFloat         := (ValorOld - (ValorPagar - JurosPagar));
    cdsContasPagarDOCUMENTO.AsString    := 'R'+DocumentoOld;
    cdsContasPagarPAGAR.AsString        := 'N';
    cdsContasPagarJURO.AsFloat          := JuroOld;
    cdsContasPagarPAGA.AsString         := 'N';
    cdsContasPagarORIGEM.AsInteger      := CodigoOld;
    cdsContasPagarCAPITALPAGO.AsFloat   := 0;
    cdsContasPagarJUROPAGO.AsFloat      := 0;
    cdsContasPagarDESCTO.AsFloat        := 0;
    cdsContasPagar.ApplyUpdates(0);

    { caixa }
    desc := 'Pag. parc. '+NomeFornOld+' Doc. '+DocumentoOld;
    GetDataModule.EnviaCaixa(Date,desc,DocumentoOld,'D',ValorPagar,IdContaOld);
  end
  else { coloca o restante da conta como desconto }
  begin
    cdsContasPagar.Edit;
    cdsContasPagarPAGA.AsString        := 'S';
    cdsContasPagarPAGAR.AsString       := 'N';
    cdsContasPagarDATAPAGTO.AsDateTime := Date;

    if rgTipoPagamento.ItemIndex = 0 then
      ValorPagar := StrToFloatDef(edtTotal.Text, 0)
    else if rgTipoPagamento.ItemIndex = 1 then
      ValorPagar := StrToFloatDef(edtValor.Text, 0);
      
    JurosPagar := ((ValorJurosOld / TotalOld) * ValorPagar);

    cdsContasPagarJUROPAGO.AsFloat      := JurosPagar;
    cdsContasPagarCAPITALPAGO.AsFloat   := (ValorPagar - JurosPagar);
    cdsContasPagarDESCTO.AsFloat        := (TotalOld - ValorPagar);
    cdsContasPagar.ApplyUpdates(0);

    { caixa}
    desc := 'Pag. '+cdsContasPagarNOMEFORN.AsString+' Doc. '+cdsContasPagarDOCUMENTO.AsString;
    GetDataModule.EnviaCaixa(date,desc,cdsContasPagarDOCUMENTO.AsString,'D',ValorPagar,IdContaOld);
  end;
end;

procedure TfrmPagarMan.dspContasPagarGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
  TableName := 'CONTASPAGAR';
end;

function TfrmPagarMan.ValidaCampos(TipoPagamento: TTipoPagamento): Boolean;
begin
  Result := True;
  case TipoPagamento of
    tpDinheiro:
      Result := edtTotal.Text <> '';
    tpCheque:
    begin
      if ((medtBandaMagnetica.Text = '') or (dbeBanco.Text = '') or
          (edtAgencia.Text = '') or (edtConta.Text = '') or
          (edtNumeroCheque.Text = '') or (edtValor.Text = '') or
          (ClearMask(medtEmissao.Text) = '') or (ClearMask(medtVencimento.Text) = '')) then
        Result := False;
    end;
  end;
end;

procedure TfrmPagarMan.cdsSelecaoIDBANCOValidate(Sender: TField);
var
  NomeBanco: string;
begin
  NomeBanco := GetFieldByID(GetConnection,'BANCO','BANCO','IDBANCO',Sender.AsInteger);
  if NomeBanco <> '' then
    cdsSelecaoBANCO.AsString := NomeBanco;
end;

initialization
  RegisterClass(TfrmPagarMan);
finalization
  UnRegisterClass(TfrmPagarMan);
end.
