unit unPagarMan;

interface

uses
   Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DBCtrls, DB,
  unContasPagar, Grids,
  DBGrids, FMTBcd,
  unSimplePadrao, ZDataset, ZAbstractRODataset, ZAbstractDataset;

type
  TTipoPagamento = (tpDinheiro, tpCheque);
  
  { TfrmPagarMan }

  TfrmPagarMan = class(TfrmSimplePadrao)
    dbgrdContasCP: TDBGrid;
    edtTotal: TLabeledEdit;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    rgTipoPagamento: TRadioGroup;
    dsContasPagar: TDataSource;
    sqldContasPagar: TZQuery;
    sqldContasPagarATRASO: TZIntegerField;
    sqldContasPagarCAPITALPAGO: TZBCDField;
    sqldContasPagarCODIGO: TZIntegerField;
    sqldContasPagarCOMPRA: TZIntegerField;
    sqldContasPagarCONTA: TZRawStringField;
    sqldContasPagarDATA: TZDateField;
    sqldContasPagarDATAPAGTO: TZDateField;
    sqldContasPagarDESCRICAO: TZRawStringField;
    sqldContasPagarDESCTO: TZBCDField;
    sqldContasPagarDOCUMENTO: TZRawStringField;
    sqldContasPagarFORNECEDOR: TZIntegerField;
    sqldContasPagarIDCONTA: TZIntegerField;
    sqldContasPagarJURO: TZBCDField;
    sqldContasPagarJUROPAGO: TZBCDField;
    sqldContasPagarNOMEFORN: TZRawStringField;
    sqldContasPagarOBS: TZRawStringField;
    sqldContasPagarORIGEM: TZIntegerField;
    sqldContasPagarPAGA: TZRawStringField;
    sqldContasPagarPAGAR: TZRawStringField;
    sqldContasPagarTOTAL: TZBCDField;
    sqldContasPagarTOTALPAGO: TZBCDField;
    sqldContasPagarVALOR: TZBCDField;
    sqldContasPagarVALORJURO: TZBCDField;
    sqldContasPagarVENCIMENTO: TZDateField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sqldContasPagarAfterInsert(DataSet: TDataSet);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rgTipoPagamentoClick(Sender: TObject);
  private
    procedure PagarParcial;
    function ValidaCampos(TipoPagamento: TTipoPagamento): Boolean;
  public
    procedure PagarTotal;
  end;

var
  frmPagarMan: TfrmPagarMan;

implementation

uses  Funcoes, VarGlobal, ConstPadrao, uDatabaseutils,
     Extensos, uDmPesquisar, Math;

{$R *.dfm}

procedure TfrmPagarMan.PagarTotal;
var
  desc: string;
  idconta: Integer;
begin
  try
    sqldContasPagar.First;

    while not sqldContasPagar.Eof do
    begin
      { caixa }
      idconta := IfThen(sqldContasPagarIDCONTA.IsNull, -1, sqldContasPagarIDCONTA.AsInteger);
      desc := 'Pag. '+sqldContasPagarNOMEFORN.AsString+
        ' Doc. '+sqldContasPagarDOCUMENTO.AsString;
      GetDataModule.EnviaCaixa(Date,desc,sqldContasPagarDOCUMENTO.AsString,'D',
        sqldContasPagarTOTAL.AsCurrency,idconta);

      // conta
      sqldContasPagar.Edit;
      sqldContasPagarPAGA.AsString        := 'S';
      sqldContasPagarPAGAR.AsString       := 'N';
      sqldContasPagarDATAPAGTO.AsDateTime := Date;
      sqldContasPagarJUROPAGO.AsFloat     := sqldContasPagarVALORJURO.AsFloat;
      sqldContasPagarCAPITALPAGO.AsFloat  :=
        (sqldContasPagarTOTAL.AsFloat - sqldContasPagarVALORJURO.AsFloat);
      sqldContasPagarDESCTO.AsFloat       := 0;
      sqldContasPagar.ApplyUpdates;

      sqldContasPagar.Next;
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

      if StrToFloatDef(edtTotal.Text, 0) < RoundTo(sqldContasPagarTOTAL.AsFloat, 2) then
        PagarParcial
      else
        PagarTotal;
    end;
    1: // cheque
    begin
      //if not ValidaCampos(tpCheque) then
      //begin
      //  MsgAviso('Preencha todos os dados para pagamento corretamente.');
      //  Exit;
      //end;
      //
      //if StrToFloatDef(edtValor.Text, 0) < RoundTo(sqldContasPagarTOTAL.AsFloat, 2) then
      //begin
      //  PagarParcial;
      //  PagarCheque;
      //end
      //else
      //  PagarCheque;
    end;
  end;
  
  PostMessageAllForms(WM_CONTA_PAGAR_PAGA);
  Close;
end;

procedure TfrmPagarMan.FormShow(Sender: TObject);
begin
  sqldContasPagar.Open;

  if sqldContasPagar.IsEmpty then
  begin
    MsgCuidado('Nenhum registro selecionado.');
    Exit;
  end;

//  edtTotal.Text := FormatFloat('0.00',
//    SelectSingleField('select sum(TOTAL) from CONTASPAGAR where PAGAR = '+
//    QuotedStr('S'), sqldContasPagar.SQLConnection));

  rgTipoPagamento.OnClick(Self);

  edtTotal.ReadOnly := sqldContasPagar.RecordCount > 1;
  //edtValor.ReadOnly := sqldContasPagar.RecordCount > 1;
end;

procedure TfrmPagarMan.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmPagarMan.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

end;

procedure TfrmPagarMan.sqldContasPagarAfterInsert(DataSet: TDataSet);
begin
  //Incrementa('CONTASPAGAR', sqldContasPagarCODIGO, GetConnection);
end;

procedure TfrmPagarMan.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPagarMan.FormCreate(Sender: TObject);
begin
  inherited;
  CentralizaForm(Self);
end;

procedure TfrmPagarMan.rgTipoPagamentoClick(Sender: TObject);

  procedure OcultaMostraControles(v: Boolean);
  begin
    edtTotal.Enabled           := not v;
  end;

begin
  //case rgTipoPagamento.ItemIndex of
  //  0:
  //  begin
  //    OcultaMostraControles(False);
  //    ClientHeight  := 321;
  //    ClientWidth   := 481;
  //    btnOk.Top     := 288;
  //    btnCancel.Top := 288;
  //  end;
  //  1:
  //  begin
  //    ClientHeight  := 417;
  //    ClientWidth   := 481;
  //    OcultaMostraControles(True);
  //    btnOk.Top     := 384;
  //    btnCancel.Top := 384;
  //  end;
  //end;
  //Update;
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
  // se o valor a pagar for maior n�o dexa fazer nada
  if rgTipoPagamento.ItemIndex = 0 then
    if (StrToFloatDef(edtTotal.Text, 0) > RoundTo(sqldContasPagarTOTAL.AsFloat, 2)) then
    begin
      MsgCuidado('O Valor maior que o total da conta, digite o valor correto.');
      edtTotal.SetFocus;
      Exit;
    end
  else if rgTipoPagamento.ItemIndex = 1 then
    if (StrToFloatDef(edtTotal.Text, 0) > RoundTo(sqldContasPagarTOTAL.AsFloat, 2)) then
    begin
      MsgCuidado('O Valor maior que o total da conta, digite o valor correto.');
      edtTotal.SetFocus;
      Exit;
    end;

  // armazena os valores pra gerar um nova conta se necessario
  CodigoOld     := sqldContasPagarCODIGO.AsInteger;
  DataOld       := sqldContasPagarDATA.AsDateTime;
  VencimentoOld := sqldContasPagarVENCIMENTO.AsDateTime;
  DescricaoOld  := sqldContasPagarDESCRICAO.AsString;
  CodFornOld    := sqldContasPagarFORNECEDOR.AsInteger;
  NomeFornOld   := sqldContasPagarNOMEFORN.AsString;
  DocumentoOld  := sqldContasPagarDOCUMENTO.AsString;
  ValorOld      := sqldContasPagarVALOR.AsFloat;
  JuroOld       := sqldContasPagarJURO.AsFloat;
  ValorJurosOld := sqldContasPagarVALORJURO.AsFloat;
  TotalOld      := sqldContasPagarTOTAL.AsFloat;
  IdContaOld    := IfThen(sqldContasPagarIDCONTA.IsNull, -1, sqldContasPagarIDCONTA.AsInteger);

  if MsgSN('Pagamento parcial. Gerar conta do restante?') then
  begin
    // ajusta a conta de capital
    sqldContasPagar.Edit;
    sqldContasPagarPAGA.AsString        := 'S';
    sqldContasPagarPAGAR.AsString       := 'N';
    sqldContasPagarDATAPAGTO.AsDateTime := Date;

    if rgTipoPagamento.ItemIndex = 0 then
      ValorPagar := StrToFloatDef(edtTotal.Text,0)
    else if rgTipoPagamento.ItemIndex = 1 then
      ValorPagar := StrToFloatDef(edtTotal.Text,0);

    JurosPagar := ((ValorJurosOld / TotalOld) * ValorPagar);

    sqldContasPagarJUROPAGO.AsFloat     := JurosPagar;
    sqldContasPagarCAPITALPAGO.AsFloat  := (ValorPagar - JurosPagar);
    sqldContasPagarDESCTO.AsFloat       := 0;
    sqldContasPagar.ApplyUpdates;

    // ajusta uma nova conta com o restante
    sqldContasPagar.Insert;
    sqldContasPagarDATA.AsDateTime       := DataOld;
    sqldContasPagarVENCIMENTO.AsDateTime := VencimentoOld;
    sqldContasPagarDESCRICAO.AsString    := DescricaoOld;
    sqldContasPagarFORNECEDOR.AsInteger  := CodFornOld;
    sqldContasPagarVALOR.AsFloat         := (ValorOld - (ValorPagar - JurosPagar));
    sqldContasPagarDOCUMENTO.AsString    := 'R'+DocumentoOld;
    sqldContasPagarPAGAR.AsString        := 'N';
    sqldContasPagarJURO.AsFloat          := JuroOld;
    sqldContasPagarPAGA.AsString         := 'N';
    sqldContasPagarORIGEM.AsInteger      := CodigoOld;
    sqldContasPagarCAPITALPAGO.AsFloat   := 0;
    sqldContasPagarJUROPAGO.AsFloat      := 0;
    sqldContasPagarDESCTO.AsFloat        := 0;
    sqldContasPagar.ApplyUpdates;

    { caixa }
    desc := 'Pag. parc. '+NomeFornOld+' Doc. '+DocumentoOld;
    GetDataModule.EnviaCaixa(Date,desc,DocumentoOld,'D',ValorPagar,IdContaOld);
  end
  else { coloca o restante da conta como desconto }
  begin
    sqldContasPagar.Edit;
    sqldContasPagarPAGA.AsString        := 'S';
    sqldContasPagarPAGAR.AsString       := 'N';
    sqldContasPagarDATAPAGTO.AsDateTime := Date;

    if rgTipoPagamento.ItemIndex = 0 then
      ValorPagar := StrToFloatDef(edtTotal.Text, 0)
    else if rgTipoPagamento.ItemIndex = 1 then
      ValorPagar := StrToFloatDef(edtTotal.Text, 0);
      
    JurosPagar := ((ValorJurosOld / TotalOld) * ValorPagar);

    sqldContasPagarJUROPAGO.AsFloat      := JurosPagar;
    sqldContasPagarCAPITALPAGO.AsFloat   := (ValorPagar - JurosPagar);
    sqldContasPagarDESCTO.AsFloat        := (TotalOld - ValorPagar);
    sqldContasPagar.ApplyUpdates;

    { caixa}
    desc := 'Pag. '+sqldContasPagarNOMEFORN.AsString+' Doc. '+sqldContasPagarDOCUMENTO.AsString;
    GetDataModule.EnviaCaixa(date,desc,sqldContasPagarDOCUMENTO.AsString,'D',ValorPagar,IdContaOld);
  end;
end;

function TfrmPagarMan.ValidaCampos(TipoPagamento: TTipoPagamento): Boolean;
begin
  Result := True;
  case TipoPagamento of
    tpDinheiro:
      Result := edtTotal.Text <> '';
    tpCheque:
    begin
      //if ((medtBandaMagnetica.Text = '') or (dbeBanco.Text = '') or
      //    (edtAgencia.Text = '') or (edtConta.Text = '') or
      //    (edtNumeroCheque.Text = '') or (edtValor.Text = '') or
      //    (ClearMask(medtEmissao.Text) = '') or (ClearMask(medtVencimento.Text) = '')) then
      //  Result := False;
    end;
  end;
end;

initialization
  RegisterClass(TfrmPagarMan);
finalization
  UnRegisterClass(TfrmPagarMan);
end.
