unit unParcelaCPCR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unSimplePadrao, ComCtrls,  DB,
  DBClient, Datasnap.Provider, SqlExpr,
  Grids, DBGrids, Spin, StdCtrls, Mask, DBCtrls,
  Buttons, DateUtils, FMTBcd;

type
  TfrmParcelaCPCR = class(TfrmSimplePadrao)
    lbParcelas: TLabel;
    lbPrazoInicio: TLabel;
    lbIntervalo: TLabel;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    dbeCodigo: TDBEdit;
    dbeNome: TDBEdit;
    seParcelas: TSpinEdit;
    sePrazoInicio: TSpinEdit;
    seIntervalo: TSpinEdit;
    dbgrdParcelas: TDBGrid;
    btnCalcular: TBitBtn;
    sqldParcela: TSQLDataSet;
    sqldParcelaNUMERO: TIntegerField;
    sqldParcelaVENC: TDateField;
    sqldParcelaDIA: TStringField;
    sqldParcelaVALOR: TFloatField;
    dspParcela: TDataSetProvider;
    cdsParcela: TClientDataSet;
    cdsParcelaNUMERO: TIntegerField;
    cdsParcelaVENC: TDateField;
    cdsParcelaDIA: TStringField;
    cdsParcelaVALOR: TFloatField;
    dsParcela: TDataSource;
    sqldContasPagar: TSQLDataSet;
    sqldReceber: TSQLDataSet;
    dbdtpData: TDBEdit;
    dbeValor: TDBEdit;
    sqldPadrao: TSQLDataSet;
    sqldPadraoCODIGO: TIntegerField;
    sqldPadraoNOME: TStringField;
    sqldPadraoDATA: TDateField;
    sqldPadraoVALOR: TFloatField;
    dspPadrao: TDataSetProvider;
    cdsPadrao: TClientDataSet;
    cdsPadraoCODIGO: TIntegerField;
    cdsPadraoNOME: TStringField;
    cdsPadraoDATA: TDateField;
    cdsPadraoVALOR: TFloatField;
    dsPadrao: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnCalcularClick(Sender: TObject);
    procedure seParcelasExit(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure dbeNomeClickButton(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cdsParcelaVENCChange(Sender: TField);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbeNomeEnter(Sender: TObject);
  private
    FTipoChamada: Integer;
    procedure GeraParcelas;
    procedure LancaContas(PagarReceber: Integer);
    procedure SetTipoChamada(const Value: Integer); //-> 0-Receber 1-Pagar
  public
    SQLCli, SQLForn: string;
    property TipoChamada: Integer read FTipoChamada write SetTipoChamada;
  end;

var
  frmParcelaCPCR: TfrmParcelaCPCR;

implementation

uses Funcoes,  VarGlobal, unModeloConsulta, ConstPadrao, System.Math, uDatabaseutils,
  System.StrUtils;

{$R *.dfm}

procedure TfrmParcelaCPCR.FormCreate(Sender: TObject);
begin
  inherited;
  SetDialogForm(Self);
  cdsParcela.Open;
  cdsPadrao.Open;
  cdsPadrao.Edit;

//  SQLCli  := GetDmPesquisar.sqldPesqCliente.CommandText;
//  SQLForn := GetDmPesquisar.sqldPesqForn.CommandText;
end;

procedure TfrmParcelaCPCR.GeraParcelas;
var
  x: Integer;
begin
  cdsParcela.EmptyDataSet;
  for x := 1 to seParcelas.Value do
  begin
    if cdsParcela.RecordCount < x then
      cdsParcela.Append
    else
      cdsParcela.Edit;
    cdsParcelaNUMERO.AsInteger := x;
    if (x = 1) then
      cdsParcelaVENC.AsDateTime := IncDay(cdsPadraoDATA.AsDateTime, sePrazoInicio.Value)
    else
      cdsParcelaVENC.AsDateTime := IncDay(cdsPadraoDATA.AsDateTime, (seIntervalo.Value * x));
    cdsParcelaDIA.AsString := DiaSemana(cdsParcelaVENC.AsDateTime);
    cdsParcelaVALOR.AsFloat := RoundTo((cdsPadraoVALOR.AsFloat / seParcelas.Value), 2);
    cdsParcela.Post;
  end;
end;

procedure TfrmParcelaCPCR.LancaContas(PagarReceber: Integer);
const
  Alfa: string = 'ABCDEFGHIJKLMNOPQRSTUVXWYZ';
var
  i: Integer;
  tipoconta: string;
begin
  i := 1;
  if PagarReceber = 0 then
  begin
    if GetDataModule.SituacaoClienteOk(cdsPadraoVALOR.asfloat, cdsPadraoCODIGO.AsInteger) then
    begin
      if cdsParcela.IsEmpty then
        Exit;

      cdsParcela.First;
      while not cdsParcela.Eof do
      begin
        with sqldReceber do
        begin
          Params.ParamByName('CODIGO').AsInteger :=
            GetProximoID('CONTASRECEBER', 'CODIGO', GetConnection);

          Params.ParamByName('DATA').AsDate := cdsPadraoDATA.AsDateTime;
          Params.ParamByName('VENCIMENTO').AsDate := cdsParcelaVENC.AsDateTime;
          Params.ParamByName('IDCLIENTE').AsInteger := cdsPadraoCODIGO.AsInteger;

          Params.ParamByName('DESCRICAO').AsString :=
            'Parcelas de: ' + cdsPadraoNOME.AsString + ', parcela Nro: ' +
            IntToStr(cdsParcelaNUMERO.AsInteger);

          Params.ParamByName('DOCUMENTO').AsString :=
            'P'+IntToStr(cdsPadraoCODIGO.AsInteger)+Alfa[i];

          Params.ParamByName('VALOR').AsFloat := cdsParcelaVALOR.AsFloat;
          Params.ParamByName('JURO').AsFloat := Global.Juro;
          Params.ParamByName('VENDA').Value := Null;
          ExecSQL;
        end;
        Inc(i);
        cdsParcela.Next;
      end;
    end;
  end
  else if PagarReceber = 1 then
  begin
    if cdsParcela.IsEmpty then
      Exit;

    cdsParcela.First;
    while not cdsParcela.Eof do
    begin
      with sqldContasPagar do
      begin
        Params.ParamByName('CODIGO').AsInteger :=
          GetProximoID('CONTASPAGAR', 'CODIGO', GetConnection);

        Params.ParamByName('DATA').AsDate := cdsPadraoDATA.AsDateTime;
        Params.ParamByName('VENCIMENTO').AsDate := cdsParcelaVENC.AsDateTime;
        Params.ParamByName('IDFORN').AsInteger := cdsPadraoCODIGO.AsInteger;

        Params.ParamByName('DESCRICAO').AsString :=
          'Parcelas de: ' + cdsPadraoNOME.AsString + ', parcela Nro: ' +
          IntToStr(cdsParcelaNUMERO.AsInteger);

        Params.ParamByName('DOCUMENTO').AsString :=
          'P'+IntToStr(cdsPadraoCODIGO.AsInteger)+Alfa[i];

        Params.ParamByName('VALOR').AsFloat := cdsParcelaVALOR.AsFloat;
        Params.ParamByName('JURO').AsFloat := Global.Juro;
        Params.ParamByName('COMPRA').Value := Null;
        ExecSQL;
      end;
      Inc(i);
      cdsParcela.Next;
    end;
  end;
  tipoconta := IfThen(PagarReceber = 0, 'de contas a receber', 'de contas a pagar');
  MsgAviso('Parcelamento '+tipoconta+' efetuado com sucesso!');
  if PagarReceber = 0 then
    PostMessageAllForms(WM_CONTA_RECEBER_RECEBIDA)
  else
    PostMessageAllForms(WM_CONTA_PAGAR_PAGA);  
  Close;
end;

procedure TfrmParcelaCPCR.SetTipoChamada(const Value: Integer);
begin
  FTipoChamada := Value;
  if FTipoChamada = 1 then
  begin
    Caption := 'Parcelamento de contas a pagar';
    //TODO: dbeNome.EditLabel.Caption := 'Fornecedor';
  end
  else
  begin
    //TODO: dbeNome.EditLabel.Caption := 'Cliente';
    Caption := 'Parcelamento de contas a receber';
  end;
end;

procedure TfrmParcelaCPCR.btnCancelarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmParcelaCPCR.btnCalcularClick(Sender: TObject);
begin
  inherited;
  GeraParcelas;
end;

procedure TfrmParcelaCPCR.seParcelasExit(Sender: TObject);
begin
  inherited;
  if TSpinEdit(Sender).Value < 1 then
    TSpinEdit(Sender).Value := 1;

  if TSpinEdit(Sender).Name = 'seParcelas' then
    GeraParcelas;
end;

procedure TfrmParcelaCPCR.btnOkClick(Sender: TObject);
begin
  inherited;
  if cdsPadraoCODIGO.IsNull or
     cdsPadraoDATA.IsNull or
     cdsParcelaVALOR.IsNull then
  begin
    MsgErro('Por favor preencha todos os dados corretamente.');
    Exit;
  end;
  LancaContas(FTipoChamada);
end;

procedure TfrmParcelaCPCR.dbeNomeClickButton(Sender: TObject);
begin
  inherited;
//  with GetDmPesquisar do
//  try
//    if FTipoChamada = 0 then
//    begin
//      GetDmPesquisar.cdsPesqCliente.Close;
//      GetDmPesquisar.cdsPesqCliente.CommandText := SQLCli;
//      GetDmPesquisar.cdsPesqCliente.Open;
//
//      if TfrmModeloConsulta.Execute('Cliente', cdsPesqCliente, FN_CLIENTES, DL_CLIENTES) then
//      begin
//        cdsPadraoCODIGO.AsInteger := cdsPesqCliente.FieldByName('CODCLIENTE').AsInteger;
//        cdsPadraoNOME.AsString    := cdsPesqCliente.FieldByName('NOME').AsString;
//      end;
//    end
//    else if FTipoChamada = 1 then
//    begin
//      GetDmPesquisar.cdsPesqForn.Close;
//      GetDmPesquisar.cdsPesqForn.CommandText := SQLForn;
//      GetDmPesquisar.cdsPesqForn.Open;
//
//      if TfrmModeloConsulta.Execute('Fornecedor', cdsPesqForn, FN_FORN, DL_FORN) then
//      begin
//        cdsPadraoCODIGO.AsInteger := cdsPesqForn.FieldByName('CODFORNECEDOR').AsInteger;
//        cdsPadraoNOME.AsString    := cdsPesqForn.FieldByName('FANTAZIA').AsString;
//      end;
//    end;
//  finally
//    cdsPesqCliente.Close;
//    cdsPesqForn.Close;
//  end;
end;

procedure TfrmParcelaCPCR.FormShow(Sender: TObject);
begin
  inherited;
  sePrazoInicio.Value := Trunc(Global.PrazoInicial);
  seIntervalo.Value := Trunc(Global.Intervalo);
  seParcelas.Value := Trunc(Global.Parcelas);
end;

procedure TfrmParcelaCPCR.cdsParcelaVENCChange(Sender: TField);
begin
  inherited;
  cdsParcelaDIA.AsString := DiaSemana(Sender.AsDateTime);
end;

procedure TfrmParcelaCPCR.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
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

procedure TfrmParcelaCPCR.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cdsPadrao.Close;
  cdsParcela.Close;
  inherited;
end;

procedure TfrmParcelaCPCR.dbeNomeEnter(Sender: TObject);
begin
  inherited; //TODO:
//  if cdsPadraoNOME.IsNull then
//    TDBEdit(Sender).OnClickButton(Self);
end;

end.
