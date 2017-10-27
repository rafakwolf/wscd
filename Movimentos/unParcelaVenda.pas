unit unParcelaVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, Grids, DBGrids, Spin, DBCtrls, 
  DBClient, Datasnap.Provider, DB, uniGuiForm,
  SqlExpr, DateUtils, ExtCtrls, FMTBcd, uniGUIBaseClasses, uniGUIClasses,
  uniLabel, uniButton, uniBitBtn, uniEdit, uniDBEdit, uniSpinEdit, uniBasicGrid,
  uniDBGrid;

type
  TfrmParcelaVenda = class(TUniForm)
    sqldParcela: TSQLDataSet;
    dspParcela: TDataSetProvider;
    cdsParcela: TClientDataSet;
    sqldParcelaNUMERO: TIntegerField;
    sqldParcelaVENC: TDateField;
    sqldParcelaDIA: TStringField;
    sqldParcelaVALOR: TFloatField;
    cdsParcelaNUMERO: TIntegerField;
    cdsParcelaVENC: TDateField;
    cdsParcelaDIA: TStringField;
    cdsParcelaVALOR: TFloatField;
    dsParcela: TDataSource;
    sqldVenda: TSQLDataSet;
    sqldVendaCODCLIENTE: TIntegerField;
    sqldVendaCLIENTE: TStringField;
    sqldVendaDATA: TDateField;
    dsVenda: TDataSource;
    sqldReceber: TSQLDataSet;
    sqldVendaCODIGO: TIntegerField;
    sqldVendaTOTAL: TFMTBCDField;
    lbParcelas: TUniLabel;
    lbPrazoInicio: TUniLabel;
    lbIntervalo: TUniLabel;
    btnOk: TUniBitBtn;
    btnCancelar: TUniBitBtn;
    btnCalcular: TUniBitBtn;
    edtRestoVenda: TUniEdit;
    dbeCodCliente: TUniDBEdit;
    dbeNomeCliente: TUniDBEdit;
    dbeDataVenda: TUniDBEdit;
    seParcelas: TUniSpinEdit;
    sePrazoInicio: TUniSpinEdit;
    seIntervalo: TUniSpinEdit;
    dbgrdParcelas: TUniDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btnCalcularClick(Sender: TObject);
    procedure seParcelasExit(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure cdsParcelaVENCChange(Sender: TField);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    FIdVenda: Integer;
    procedure GeraParcelas;
    procedure SetIdVenda(const Value: Integer);
    function Restante: Extended;
  public
    property IdVenda: Integer read FIdVenda write SetIdVenda;
  end;

var
  frmParcelaVenda: TfrmParcelaVenda;

implementation

uses  Funcoes, VarGlobal, ConstPadrao, uClasses, System.Math, udatabaseutils;

{$R *.dfm}

procedure TfrmParcelaVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cdsParcela.Close;
  Action := caFree;
end;

procedure TfrmParcelaVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmParcelaVenda.GeraParcelas;
var
  x: Integer;
begin
  if not cdsParcela.Active then
    cdsParcela.Open;
  cdsParcela.EmptyDataSet;
  for x := 1 to seParcelas.Value do
  begin
    if cdsParcela.RecordCount < x then
      cdsParcela.Append
    else
      cdsParcela.Edit;
    cdsParcelaNUMERO.AsInteger := x;
    if (x = 1) then
      cdsParcelaVENC.AsDateTime := IncDay(sqldVendaDATA.AsDateTime, sePrazoInicio.Value)
    else
      cdsParcelaVENC.AsDateTime := IncDay(sqldVendaDATA.AsDateTime, (seIntervalo.Value * x));
    cdsParcelaDIA.AsString := DiaSemana(cdsParcelaVENC.AsDateTime);
    cdsParcelaVALOR.AsFloat := RoundTo((Restante / seParcelas.Value), 2);
    cdsParcela.Post;
  end;
end;

procedure TfrmParcelaVenda.SetIdVenda(const Value: Integer);
begin
  FIdVenda := Value;
  if (Value > 0) then
  begin
    sqldVenda.Close;
    sqldVenda.Params.ParamByName('IDVENDA').AsInteger := FIdVenda;
    sqldVenda.Open;

    edtRestoVenda.Text := FormatFloat('#,##0.00', Restante);

    if not sqldVenda.IsEmpty then
      GeraParcelas;

  end;
end;

procedure TfrmParcelaVenda.FormCreate(Sender: TObject);
begin
  sePrazoInicio.Value := Trunc(Global.PrazoInicial);
  seIntervalo.Value := Trunc(Global.Intervalo);
  seParcelas.Value := Trunc(Global.Parcelas);
end;

procedure TfrmParcelaVenda.btnCalcularClick(Sender: TObject);
begin
  GeraParcelas;
end;

procedure TfrmParcelaVenda.seParcelasExit(Sender: TObject);
begin
  if TSpinEdit(Sender).Value < 1 then
    TSpinEdit(Sender).Value := 1;

  if TSpinEdit(Sender).Name = 'seParcelas' then
    GeraParcelas;
end;

procedure TfrmParcelaVenda.btnOkClick(Sender: TObject);

  procedure ConcluirVenda(FormaRecto: string; ValorRecdo: Extended);
  begin
    with TSQLDataSet.Create(nil) do
    try
      SQLConnection := GetConnection;
      CommandType := ctStoredProc;
      CommandText := 'STPRECTOVENDA';
      Params.ParamByName('IDVENDA').AsInteger := FIdVenda;
      Params.ParamByName('DATARECTO').AsDate := Date;
      Params.ParamByName('FORMARECTO').AsString := Trim(FormaRecto);
      Params.ParamByName('VALORRECDO').AsFMTBCD := DoubleToBcd(ValorRecdo);
      //ShowMessage(FloatToStr(ValorRecdo));
      ExecSQL;
    finally
      Free;
    end;
  end;

const
  Alfa: string = 'ABCDEFGHIJKLMNOPQRSTUVXWYZ';
var
  i: Integer;
begin
  i := 1;
  if GetDataModule.SituacaoClienteOk(Restante, sqldVendaCODCLIENTE.AsInteger) then
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

        Params.ParamByName('DATA').AsDate := sqldVendaDATA.AsDateTime;
        Params.ParamByName('VENCIMENTO').AsDate := cdsParcelaVENC.AsDateTime;
        Params.ParamByName('IDCLIENTE').AsInteger := sqldVendaCODCLIENTE.AsInteger;

        Params.ParamByName('DESCRICAO').AsString :=
          'Venda Nro: ' + IntToStr(sqldVendaCODIGO.AsInteger) + ' Parcela Nro: ' +
          IntToStr(cdsParcelaNUMERO.AsInteger);

        Params.ParamByName('DOCUMENTO').AsString :=
          'V'+IntToStr(sqldVendaCODIGO.AsInteger)+Alfa[i];

        Params.ParamByName('VALOR').AsFloat := cdsParcelaVALOR.AsFloat;
        Params.ParamByName('JURO').AsFloat := Global.Juro;
        Params.ParamByName('VENDA').AsInteger := FIdVenda;
        ExecSQL;
      end;
      Inc(i);
      cdsParcela.Next;
    end;
    ModalResult := mrOk;
    //ShowMessage(FloatToStr(Restante));
    ConcluirVenda('Crediario', Restante);
    PostMessageAllForms(WM_VENDA_CONCLUIDA);
  end
  else
    ModalResult := mrCancel;
end;

procedure TfrmParcelaVenda.cdsParcelaVENCChange(Sender: TField);
begin
  cdsParcelaDIA.AsString := DiaSemana(Sender.AsDateTime);
end;

function TfrmParcelaVenda.Restante: Extended;
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

procedure TfrmParcelaVenda.FormKeyPress(Sender: TObject; var Key: Char);
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

initialization
  RegisterClass(TfrmParcelaVenda);
finalization
  UnRegisterClass(TfrmParcelaVenda);
end.
