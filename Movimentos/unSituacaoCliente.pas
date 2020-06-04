unit unSituacaoCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, Buttons, SqlExpr, ExtCtrls,  FMTBcd, uniGUIBaseClasses,
  uniGUIClasses, uniButton, uniBitBtn, uniEdit, uniImage, uniGroupBox, uniGuiForm,
  uniMemo;

type
  TfrmSituacaoCliente = class(TForm)
    spSituacaoCliente: TSQLDataSet;
    spSituacaoClienteCLIENTE: TStringField;
    spSituacaoClienteLIMITECLIENTE: TFMTBCDField;
    spSituacaoClienteDATACADASTRO: TDateField;
    spSituacaoClienteTOTALCONTAS: TFMTBCDField;
    spSituacaoClienteTOTALCONTASVENCIDAS: TFMTBCDField;
    spSituacaoClientePRIMEIROVENCIMENTO: TDateField;
    spSituacaoClienteDIASATRASO: TIntegerField;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    btnContasCliente: TBitBtn;
    imgWarn: TImage;
    grpContas: TGroupBox;
    cedDiasAtraso: TEdit;
    grpDadosCliente: TGroupBox;
    cedTotalContas: TEdit;
    cedTotalVencidas: TEdit;
    cedPrimeiroVenc: TEdit;
    cedLimite: TEdit;
    cedDataCadastro: TEdit;
    cedCliente: TEdit;
    mmoMsg: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btnContasClienteClick(Sender: TObject);
  private
    FIdCliente: Integer;
    procedure SetIdCliente(const Value: Integer);
    procedure ProcessaDados;
  public
    property IdCliente: Integer read FIdCliente write SetIdCliente;
  end;

var
  frmSituacaoCliente: TfrmSituacaoCliente;

implementation

uses Funcoes, unContasReceber, System.Math;

{$R *.dfm}

procedure TfrmSituacaoCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmSituacaoCliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    ModalResult := mrCancel;
end;

procedure TfrmSituacaoCliente.SetIdCliente(const Value: Integer);
begin
  FIdCliente := Value;
  if Value > 0 then
  begin
    spSituacaoCliente.Close;
    spSituacaoCliente.Params.ParamByName('IDCLIENTE').AsInteger := FIdCliente;
    spSituacaoCliente.Open;
    if not spSituacaoCliente.IsEmpty then
      ProcessaDados
    else
      raise Exception.Create('Erro lendo cadastro de cliente.')  
  end;
end;

procedure TfrmSituacaoCliente.ProcessaDados;
begin
  with spSituacaoCliente do
  begin
    cedCliente.Text       := FieldByName('CLIENTE').AsString;
    cedLimite.Text        := FormatFloat('#,##0.00', FieldByName('LIMITECLIENTE').AsFloat);
    cedDataCadastro.Text  := FormatDateTime('dd/mm/yyyy', FieldByName('DATACADASTRO').AsDateTime);
    cedTotalContas.Text   := FormatFloat('#,##0.00', FieldByName('TOTALCONTAS').AsFloat);
    cedTotalVencidas.Text := FormatFloat('#,##0.00', FieldByName('TOTALCONTASVENCIDAS').AsFloat);
    cedDiasAtraso.Text    := IntToStr(FieldByName('DIASATRASO').AsInteger);
    cedPrimeiroVenc.Text  := FormatDateTime('dd/mm/yyyy', FieldByName('PRIMEIROVENCIMENTO').AsDateTime);

    if (FieldByName('DIASATRASO').AsInteger > 0) then
      mmoMsg.Lines.Add('Cliente com contas vencidas');

    if (RoundTo(FieldByName('TOTALCONTAS').AsFloat, 2) >
        RoundTo(FieldByName('LIMITECLIENTE').AsFloat, 2)) then
      mmoMsg.Lines.Add('Cliente com limite insuficiente');

  end;
end;

procedure TfrmSituacaoCliente.FormCreate(Sender: TObject);
begin
  CentralizaForm(Self);
  SetDialogForm(Self);
  mmoMsg.Lines.Clear;
end;

procedure TfrmSituacaoCliente.btnContasClienteClick(Sender: TObject);
begin
  frmContasReceber := TfrmContasReceber.Create(self);
  frmContasReceber.Caption := 'Contas por cliente';
  frmContasReceber.TipoChamada := 1;
  frmContasReceber.IdCliente := FIdCliente;
  frmContasReceber.ShowModal;
end;

end.
