unit unPagamentoCheque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls,  ExtCtrls, DBGrids,  uniGUIForm,
  DB, SqlExpr, FMTBcd, VarGlobal, uDatabaseutils, uniGUIBaseClasses,
  uniGUIClasses, uniLabel, uniButton, uniBitBtn, uniEdit, uniDBEdit;

type
  TTipoCheque = (tcAVista, tcPreDatado);
  TTipoChamada = (tcmCompra, tcmVenda);
  TfrmPagamentoCheque = class(TUniForm)
    dsSelecao: TDataSource;
    sqldCheque: TSQLDataSet;
    sqldVenda: TSQLDataSet;
    sqldVendaNOME: TStringField;
    sqldCompra: TSQLDataSet;
    sqldCompraCODFORNECEDOR: TIntegerField;
    sqldCompraRAZAOSOCIAL: TStringField;
    sqldVendaCODCLIENTE: TIntegerField;
    sqldCompraTOTAL: TFMTBCDField;
    sqldVendaTOTAL: TFMTBCDField;
    lbEmissao: TUniLabel;
    lbVenc: TUniLabel;
    lbBandaMagnetica: TUniLabel;
    btnOk: TUniBitBtn;
    btnCancelar: TUniBitBtn;
    edtAgencia: TUniEdit;
    edtConta: TUniEdit;
    edtNumeroCheque: TUniEdit;
    edtValor: TUniEdit;
    edtNome: TUniEdit;
    dbeBanco: TUniDBEdit;
    medtEmissao: TUniEdit;
    medtVencimento: TUniEdit;
    medBandaMagnetica: TUniEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbeBancoClickButton(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure edtValorEnter(Sender: TObject);
    procedure medBandaMagneticaExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FTipoCheque: TTipoCheque;
    FIdVenda: Integer;
    FIdCompra: Integer;
    FTipoChamada: TTipoChamada;
    procedure SetTipoCheque(const Value: TTipoCheque);
    procedure SetIdVenda(const Value: Integer);
    procedure SetIdCompra(const Value: Integer);
    procedure SetTipoChamada(const Value: TTipoChamada);
    function ChequeExiste(pBandaMagnetica: string): Boolean;
    function ValidaValores: Boolean;
    function RestanteVenda: Real;
    function RestanteCompra: Real;
  public
    property TipoChamada: TTipoChamada read FTipoChamada write SetTipoChamada;
    property TipoCheque: TTipoCheque read FTipoCheque write SetTipoCheque;
    property IdVenda: Integer read FIdVenda write SetIdVenda;
    property IdCompra: Integer read FIdCompra write SetIdCompra;
  end;

var
  frmPagamentoCheque: TfrmPagamentoCheque;

implementation

uses  Funcoes, unModeloConsulta, ConstPadrao, Extensos, System.Math,
  System.StrUtils;

{$R *.dfm}

procedure TfrmPagamentoCheque.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmPagamentoCheque.dbeBancoClickButton(Sender: TObject);
begin
  //GetDmPesquisar.cdsPesqBanco.Close;
  //if not TfrmModeloConsulta.Execute('Banco', GetDmPesquisar.cdsPesqBanco, FN_BANCO,
  //  DL_BANCO) then
  //  GetDmPesquisar.cdsPesqBanco.Close;
end;

procedure TfrmPagamentoCheque.SetTipoCheque(const Value: TTipoCheque);
begin
  FTipoCheque := Value;
  if FTipoCheque = tcAVista then
  begin
    Caption := 'Cheque a vista';
    medtEmissao.Text := DateToStr(Date);
    medtVencimento.Text := DateToStr(Date);
    medtEmissao.ReadOnly := True;
    medtVencimento.ReadOnly := True;
    medtVencimento.Color := clBtnFace;
  end
  else if FTipoCheque = tcPreDatado then
  begin
    Caption := 'Cheque pré-datado';
    medtEmissao.Text := DateToStr(Date);
    medtEmissao.ReadOnly := True;
    medtVencimento.ReadOnly := False;
    medtVencimento.Color := clWindow;
  end;
end;

procedure TfrmPagamentoCheque.FormCreate(Sender: TObject);
begin
  //CentralizaForm(Self);
  //if not Assigned(dsSelecao.DataSet) then
  //  dsSelecao.DataSet := GetDmPesquisar.cdsPesqBanco;
end;

procedure TfrmPagamentoCheque.btnOkClick(Sender: TObject);

  procedure ConcluirCompra(FormaPagto: string; ValorPago: Currency);
  begin
    with TSQLDataSet.Create(nil) do
    try
      //SQLConnection := GetConnection;
      CommandType := ctStoredProc;
      CommandText := 'STPPAGTOCOMPRA';
      Params.ParamByName('IDCOMPRA').AsInteger   := FIdCompra;
      Params.ParamByName('DATAPAGTO').AsDate     := Date;
      Params.ParamByName('FORMAPAGTO').AsString  := Trim(FormaPagto);
      Params.ParamByName('VALORPAGO').AsFMTBCD   := DoubleToBcd(ValorPago);
      ExecSQL;
    finally
      Free;
    end;
  end;

  procedure ConcluirVenda(FormaRecto: string; ValorRecdo: Currency);
  begin
    with TSQLDataSet.Create(nil) do
    try
      //SQLConnection := GetConnection;
      CommandType := ctStoredProc;
      CommandText := 'STPRECTOVENDA';
      Params.ParamByName('IDVENDA').AsInteger     := FIdVenda;
      Params.ParamByName('DATARECTO').AsDate      := Date;
      Params.ParamByName('FORMARECTO').AsString   := Trim(FormaRecto);
      Params.ParamByName('VALORRECDO').AsFMTBCD   := DoubleToBcd(ValorRecdo);
      ExecSQL;
    finally
      Free;
    end;
  end;

begin

  if not ValidaValores then
  begin
    MsgCuidado('Preencha todos os valores.');
    Exit;
  end;

  if FTipoChamada = tcmVenda then
  begin
    if RoundTo(StrToFloat(edtValor.Text), 2) > RoundTo(RestanteVenda, 2) then
    begin
      MsgErro('O valor informado para recebimento inválido, tente novamente.');
      Exit;
    end;
  end
  else if FTipoChamada = tcmCompra then
  begin
    if RoundTo(StrToFloat(edtValor.Text), 2) > RoundTo(RestanteCompra, 2) then
    begin
      MsgErro('O valor informado para pagamento inválido, tente novamente.');
      Exit;
    end;
  end;

  if (FTipoChamada = tcmVenda) and (FTipoCheque = tcAVista) then
    GetDataModule.EnviaCaixa(Date,'Venda: '+IntToStr(FIdVenda)+
      ' Cliente: '+sqldVendaNOME.AsString+' Cheque a vista: '+edtNumeroCheque.Text,
      'V'+IntToStr(FIdVenda),'C',StrToFloatDef(edtValor.Text, 0));

  if (FTipoChamada = tcmCompra) and (FTipoCheque = tcAVista) then
    GetDataModule.EnviaCaixa(Date,'Compra: '+IntToStr(FIdCompra)+
      ' Forn: '+sqldCompraRAZAOSOCIAL.AsString+' Cheque a vista: '+edtNumeroCheque.Text,
      'C'+IntToStr(FIdCompra),'D',StrToFloatDef(edtValor.Text, 0));

  with sqldCheque do
  begin
    Close;
    Params.ParamByName('IDCHEQUE').AsInteger :=
      GetProximoID('CHEQUE', 'IDCHEQUE', GetConnection);
    //Params.ParamByName('IDBANCO').AsInteger := GetDmPesquisar.cdsPesqBanco.FieldByName('IDBANCO').AsInteger;
    Params.ParamByName('AGENCIA').AsString := edtAgencia.Text;
    Params.ParamByName('CONTA').AsString := edtConta.Text;
    Params.ParamByName('NUMERO').AsString := edtNumeroCheque.Text;
    Params.ParamByName('DATAEMISSAO').AsDate := StrToDateDef(medtEmissao.Text, Date);
    Params.ParamByName('BOMPARA').AsDate := StrToDateDef(medtVencimento.Text, Date);
    Params.ParamByName('BANDAMAG').AsString := medBandaMagnetica.Text;
    Params.ParamByName('VALOR').AsFloat := StrToFloatDef(edtValor.Text, 0);

    if FTipoChamada = tcmVenda then
    begin
      Params.ParamByName('IDCLIENTE').AsInteger := sqldVendaCODCLIENTE.AsInteger;
      Params.ParamByName('IDFORN').Value := Null;

      Params.ParamByName('VENDA').AsInteger := FIdVenda;
      Params.ParamByName('COMPRA').Value := Null;

      Params.ParamByName('REPASSADO').AsString := 'N';
    end
    else if FTipoChamada = tcmCompra then
    begin
      Params.ParamByName('IDCLIENTE').Value := Null;
      Params.ParamByName('IDFORN').AsInteger := sqldCompraCODFORNECEDOR.AsInteger;

      Params.ParamByName('COMPRA').AsInteger := FIdCompra;
      Params.ParamByName('VENDA').Value := Null;

      Params.ParamByName('REPASSADO').AsString := 'S';
    end;

    if FTipoCheque = tcAVista then
      Params.ParamByName('DATA_BAIXA').AsDate := Date;

    ExecSQL;
  end;

  if FTipoChamada = tcmCompra then
  begin
    ConcluirCompra(IfThen(FTipoCheque = tcAVista, 'Cheque a Vista',
      'Cheque Pre-datado'), StrToFloatDef(edtValor.Text, 0));
    PostMessageAllForms(WM_COMPRA_CONCLUIDA);
  end
  else if FTipoChamada = tcmVenda then
  begin
    ConcluirVenda(IfThen(FTipoCheque = tcAVista, 'Cheque a Vista',
      'Cheque Pre-datado'), StrToFloatDef(edtValor.Text, 0));
    PostMessageAllForms(WM_VENDA_CONCLUIDA);
  end;
  
  ModalResult := mrOk;
end;

function TfrmPagamentoCheque.ValidaValores: Boolean;
begin
  Result := True;
  if ((dbeBanco.Text = '') or
      (edtAgencia.Text = '') or
      (edtConta.Text = '') or
      (edtNumeroCheque.Text = '') or
      (edtvalor.Text = '') or
      (ClearMask(medtEmissao.Text) = '') or
      (ClearMask(medtVencimento.Text) = '') or
      (edtNome.Text = '') or
      (ClearMask(medBandaMagnetica.Text) = '')) then
    Result := False;
end;

procedure TfrmPagamentoCheque.SetIdVenda(const Value: Integer);
begin
  FIdVenda := Value;
  if (Value > 0) then
  begin
    sqldVenda.Close;
    sqldVenda.Params.ParamByName('CODVENDA').AsInteger := FIdVenda;
    sqldVenda.Open;
    edtNome.Text := sqldVendaNOME.AsString;
  end;
end;

procedure TfrmPagamentoCheque.SetIdCompra(const Value: Integer);
begin
  FIdCompra := Value;
  if (Value > 0) then
  begin
    sqldCompra.Close;
    sqldCompra.Params.ParamByName('CODCOMPRA').AsInteger := FIdCompra;
    sqldCompra.Open;
    edtNome.Text := sqldCompraRAZAOSOCIAL.AsString;
  end;
end;

procedure TfrmPagamentoCheque.edtValorEnter(Sender: TObject);
begin
  if TipoChamada = tcmVenda then
    edtValor.Text := FloatToStr(RestanteVenda)
  else if TipoChamada = tcmCompra then
    edtValor.Text := FloatToStr(RestanteCompra);
end;

procedure TfrmPagamentoCheque.SetTipoChamada(const Value: TTipoChamada);
begin
  FTipoChamada := Value;
  edtValorEnter(Self);
end;

function TfrmPagamentoCheque.RestanteVenda: Real;
begin
  with TSQLDataSet.Create(nil) do
  try
    SQLConnection := GetConnection;
    CommandText := 'select RESTO from STPRESTOVENDA(:VENDA)';
    Params.ParamByName('VENDA').AsInteger := FIdVenda;
    Open;
    Result := RoundTo(FieldByName('RESTO').AsFloat, 2);
  finally
    Free;
  end;
end;

function TfrmPagamentoCheque.RestanteCompra: Real;
begin
  with TSQLDataSet.Create(nil) do
  try
    SQLConnection := GetConnection;
    CommandText := 'select RESTO from STPRESTOCOMPRA(:COMPRA)';
    Params.ParamByName('COMPRA').AsInteger := FIdCompra;
    Open;
    Result := RoundTo(FieldByName('RESTO').AsFloat, 2);
  finally
    Free;
  end;
end;

procedure TfrmPagamentoCheque.medBandaMagneticaExit(Sender: TObject);

  function BancoExiste(IdBanco: Integer): Boolean;
  begin
    with TSQLDataSet.Create(nil) do
    try
      SQLConnection := sqldCheque.SQLConnection;
      CommandText := 'select count(1) from BANCO where IDBANCO = '+QuotedStr(IntToStr(IdBanco));
      Open;
      Result := Fields[0].AsInteger > 0;
    finally
      Free;
    end;
  end;

var
  varAgencia, varConta, varNroCheque, varComp, varBanco: string;
begin
  if (medBandaMagnetica.Text <> '') then
  begin
    if ChequeExiste(medBandaMagnetica.Text) then
    begin
      MsgCuidado('Cheque já existente, verifique a digitação da banda magnética.');
      medBandaMagnetica.Clear;
      medBandaMagnetica.SetFocus;
      Exit;
    end;

    //RetornoBandaMagnetica(varComp, varBanco, varAgencia, varConta, varNroCheque,
    //  medBandaMagnetica.Text);

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
      if MsgSN('O Banco "'+varBanco+'" não está cadastrado, deseja cadastrá-lo agora?') then
        ChamaForm('TfrmBanco', 'Bancos', Self);
    end;
  end;
end;

function TfrmPagamentoCheque.ChequeExiste(
  pBandaMagnetica: string): Boolean;
begin
  with TSQLDataSet.Create(nil) do
  try
    SQLConnection := GetConnection;
    CommandText := 'select count(1) as CONT from CHEQUE '+
      'where BANDAMAGNETICA = '+QuotedStr(pBandaMagnetica);
    Open;
    Result := (FieldByName('CONT').AsInteger > 0);
  finally
    Free;
  end;
end;

procedure TfrmPagamentoCheque.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmPagamentoCheque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  if GetDmPesquisar.cdsPesqBanco.Active then
//    GetDmPesquisar.cdsPesqBanco.Close;
  Action := caFree;
end;

end.
