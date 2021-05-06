unit unPromissoria;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unSimplePadrao, StdCtrls, Buttons;

type
  TfrmPromissoria = class(TfrmSimplePadrao)
    btnCliente: TBitBtn;
    btnImprimir: TBitBtn;
    btnCancelar: TBitBtn;
    edtNumero: TEdit;
    edtEmissao: TEdit;
    edtVencimento: TEdit;
    edtValor: TEdit;
    edtCredor: TEdit;
    edtCpfCnpj: TEdit;
    edtPracaPag: TEdit;
    edtEmitente: TEdit;
    edtCpfCnpjEmitente: TEdit;
    edtEndereco: TEdit;
    bvlLinha: TPanel;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
  public
  end;

var
  frmPromissoria: TfrmPromissoria;

implementation

uses VarGlobal, Funcoes, DateUtils,  unModeloConsulta, ConstPadrao,
     unPrevPromissoria, Extensos;

{$R *.dfm}

procedure TfrmPromissoria.btnCancelarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmPromissoria.FormShow(Sender: TObject);
var
  x: Integer;
begin
  inherited;
  for x := 0 to ComponentCount - 1 do
  begin
    if Components[x] is TLabeledEdit then
      TLabeledEdit(Components[x]).Text :=
        ReadIniFile('PROMISSORIA',
        NormalizeStr(TLabeledEdit(Components[x]).EditLabel.Caption));
  end;
  
  if edtEmissao.Text = '' then
    edtEmissao.Text := FormatDateTime('dd/mm/yyyy', Date);
  if edtVencimento.Text = '' then
    edtVencimento.Text := FormatDateTime('dd/mm/yyyy', IncDay(Date, Global.PrazoInicial));
  if edtValor.Text = '' then
    edtValor.Text := '0,00';
  if edtCredor.Text = '' then
    edtCredor.Text := Empresa.Nome;
  if edtCpfCnpj.Text = '' then
    edtCpfCnpj.Text := Empresa.Cnpj;
  if edtPracaPag.Text = '' then
    edtPracaPag.Text := Empresa.Endereco;

end;

procedure TfrmPromissoria.FormCreate(Sender: TObject);
begin
  inherited;
  SetDialogForm(Self);
end;

procedure TfrmPromissoria.btnClienteClick(Sender: TObject);
begin
  inherited;
//  if TfrmModeloConsulta.Execute('Cliente', getdmpesquisar.cdsPesqCliente,
//    FN_CLIENTES, DL_CLIENTES) then
//  begin
//    edtEmitente.Text := getdmpesquisar.cdsPesqClienteNOME.AsString;
//    edtCpfCnpjEmitente.Text := getdmpesquisar.cdsPesqClienteCPF_CNPJ.AsString;
//    edtEndereco.Text :=
//      SelecSingleField('select ENDERECO from CLIENTES where CODCLIENTE = '+
//        QuotedStr(IntToStr(getdmpesquisar.cdsPesqCliente.FieldByName('CODCLIENTE').asinteger)),
//        GetConnection);
//  end;
end;

procedure TfrmPromissoria.btnImprimirClick(Sender: TObject);
var
  x: Integer;
  print_: Integer;
begin
  inherited;
  for x := 0 to ComponentCount - 1 do
  begin
    if Components[x] is TLabeledEdit then
      WriteIniFile('PROMISSORIA',
        NormalizeStr(TLabeledEdit(Components[x]).EditLabel.Caption),
        TLabeledEdit(Components[x]).Text);
  end;

  with TfrmPrevPromissoria.Create(Self) do
  try
    lbNumero.Caption        := edtNumero.Text;
    lbDataEmissao.Caption   := edtEmissao.Text;
    lbVencimento.Caption    := edtVencimento.Text;
    lbDescValor.Caption     := edtValor.Text;
    lbDescricaoData.Caption := 'Ao(s) '+FormatDateTime('dd "de" mmmm "de" yyyy',
      StrToDate(edtVencimento.Text))+
      ' pagarei por �sta �nica via de NOTA PROMISS�RIA a';
    lbCredor.Caption        := edtCredor.Text;
    lbCPF_Credor.Caption    := 'CPF/CNPJ: '+edtCpfCnpj.Text;
    rlmValorExt.Lines.Add(Extenso(StrToFloat(edtValor.Text)));
    lbPcaPag.Caption        := edtPracaPag.Text;
    lbDescEmitente.Caption  := edtEmitente.Text;
    lbDesc_cpf_emit.Caption := edtCpfCnpjEmitente.Text;
    lbDesc_endereco_emit.Caption := edtEndereco.Text;

    //print_ := FormRadioButtons('Imprimir, Visualizar', 'Imprimir/Visualizar', 1);
    if print_ = 1 then
      rptPromissoria.PreviewModal
    else if print_ = 0 then
      rptPromissoria.Print
    else if print_ = -1 then
      Exit;  
  finally
    Free;
  end;
end;

initialization
  RegisterClass(TfrmPromissoria);
finalization
  UnRegisterClass(TfrmPromissoria);
end.
