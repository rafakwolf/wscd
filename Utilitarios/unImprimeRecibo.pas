unit unImprimeRecibo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Spin;

type
  TfrmImprimeRecibo = class(TForm)
    btnImprimir: TBitBtn;
    btnVisualizar: TBitBtn;
    btnSair: TBitBtn;
    imgImpressora: TImage;
    gbRecibo: TGroupBox;
    edPorta: TLabeledEdit;
    lbColunas: TLabel;
    edColunas: TSpinEdit;
    rbA4: TRadioButton;
    rbBobina: TRadioButton;
    procedure btnSairClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rbA4Click(Sender: TObject);
    procedure rbBobinaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    FValor: Real;
    FCidade: String;
    FReferente: String;
    FEnderecoFone: String;
    FEmpresa: String;
    FCidadeEstado: String;
    FRecebedor: String;
    FAssinatura: String;
    FCNPJ_IE: String;
    FData: TDateTime;
    FValorExtenso: String;
    FTelefoneEmpresa: String;
    procedure SetAssinatura(const Value: String);
    procedure SetCidade(const Value: String);
    procedure SetCidadeEstado(const Value: String);
    procedure SetCNPJ_IE(const Value: String);
    procedure SetData(const Value: TDateTime);
    procedure SetEmpresa(const Value: String);
    procedure SetEnderecoFone(const Value: String);
    procedure SetRecebedor(const Value: String);
    procedure SetReferente(const Value: String);
    procedure SetValor(const Value: Real);
    procedure SetValorExtenso(const Value: String);
    procedure SetTelefoneEmpresa(const Value: String);

    procedure ImprimeRecibo(Opt: Integer);
    procedure PrintReciboBobina;
    procedure GravaOpcoes;
    procedure LeOpcoes;
    procedure SetVisibleButtons;
  public
    property NomeEmpresa: String read FEmpresa write SetEmpresa;
    property CidadeEstado: String read FCidadeEstado write SetCidadeEstado;
    property CNPJ_IE: String read FCNPJ_IE write SetCNPJ_IE;
    property EnderecoFone: String read FEnderecoFone write SetEnderecoFone;
    property Assinatura: String read FAssinatura write SetAssinatura;
    property Valor: Real read FValor write SetValor;
    property ValorExtenso: String read FValorExtenso write SetValorExtenso;
    property Recebedor: String read FRecebedor write SetRecebedor;
    property Referente: String read FReferente write SetReferente;
    property Data: TDateTime read FData write SetData;
    property Cidade: String read FCidade write SetCidade;
    property TelefoneEmpresa: String read FTelefoneEmpresa write SetTelefoneEmpresa;
  end;

var
  frmImprimeRecibo: TfrmImprimeRecibo;

implementation

uses Funcoes, unRecibo, unPrevRecibo;

{$R *.dfm}

procedure TfrmImprimeRecibo.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmImprimeRecibo.SetAssinatura(const Value: String);
begin
  FAssinatura := Value;
end;

procedure TfrmImprimeRecibo.SetCidade(const Value: String);
begin
  FCidade := Value;
end;

procedure TfrmImprimeRecibo.SetCidadeEstado(const Value: String);
begin
  FCidadeEstado := Value;
end;

procedure TfrmImprimeRecibo.SetCNPJ_IE(const Value: String);
begin
  FCNPJ_IE := Value;
end;

procedure TfrmImprimeRecibo.SetData(const Value: TDateTime);
begin
  FData := Value;
end;

procedure TfrmImprimeRecibo.SetEmpresa(const Value: String);
begin
  FEmpresa := Value;
end;

procedure TfrmImprimeRecibo.SetEnderecoFone(const Value: String);
begin
  FEnderecoFone := Value;
end;

procedure TfrmImprimeRecibo.SetRecebedor(const Value: String);
begin
  FRecebedor := Value;
end;

procedure TfrmImprimeRecibo.SetReferente(const Value: String);
begin
  FReferente := Value;
end;

procedure TfrmImprimeRecibo.SetValor(const Value: Real);
begin
  FValor := Value;
end;

procedure TfrmImprimeRecibo.btnVisualizarClick(Sender: TObject);
begin
  ImprimeRecibo(1);
end;

procedure TfrmImprimeRecibo.SetValorExtenso(const Value: String);
begin
  FValorExtenso := Value;
end;

procedure TfrmImprimeRecibo.ImprimeRecibo(Opt: Integer);
begin
  if(rbA4.Checked)then //A4
  begin
    with TfrmPrevRecibo.Create(Self)do
    try
      lbEmpresa.Caption      := NomeEmpresa;
      lbCidadeEstado.Caption := CidadeEstado;
      lbCNPJ_IE.Caption      := CNPJ_IE;
      lbEnderecoFone.Caption := EnderecoFone;
      lbAssinatura.Caption   := Assinatura;
      lbValor.Caption        := FormatFloat('#,##0.00', Valor);

      lbdRecebedor.Lines.Add(Recebedor);
      lbdImportancia.Lines.Add(ValorExtenso);
      lbdReferente.Lines.Add(Referente);

      lbData.Caption         := DateToStr(Data);
      lbCidade.Caption       := Cidade;

      if MsgSN('Imprimir duas copias ?') then
        rbDetalhe.CarbonCopies := 2
      else
        rbDetalhe.CarbonCopies := 1;

      if (Opt = 0) then
        rrRecibo.Print;
      if (Opt = 1) then
        rrRecibo.Preview;
        
    finally
      Free;
    end;
  end;
  if(rbBobina.Checked)then
  begin
    PrintReciboBobina;
  end;
end;

procedure TfrmImprimeRecibo.btnImprimirClick(Sender: TObject);
begin
  ImprimeRecibo(0);
end;

procedure TfrmImprimeRecibo.PrintReciboBobina;
var
  sl: TStringList;

  function Centraliza(const s: String): String;
  begin
    Result := CentralizaTexto(s, StrToInt(edColunas.Text), True);
  end;

  function Ajusta(const s: String): String;
  begin
    Result := copy(s, 1, edColunas.Value);
  end;

begin
  sl := TStringList.Create;
  with sl do
  try
    Add(Centraliza(NomeEmpresa));
    Add(Centraliza(CidadeEstado));
    Add(Centraliza('Fone: ' + TelefoneEmpresa));
    Add(Centraliza(CNPJ_IE));
    Add(Centraliza(EnderecoFone));
    Add('');
    Add(ReplicateStr('-', edColunas.Value));
    Add(Centraliza('***RECIBO***'));
    Add(ReplicateStr('-',edColunas.Value));
    Add(Ajusta(' Recebedor: ' + Recebedor));
    Add(Ajusta(' A Importância de: ' + ValorExtenso));
    Add(Ajusta(' Referente: ' + Referente));
    Add(' Valor: ' + '' + FormatFloat('#,##0.00', Valor));
    Add(ReplicateStr(#13#10, 1));
    Add(' Cidade: ' + Cidade);
    Add(' Data: ' + FormatDateTime('dd/mm/yyyy', Data));
    Add(ReplicateStr(#13#10, 2));
    Add(Centraliza(ReplicateStr('-', edColunas.Value - 11)));
    Add(Centraliza(Assinatura));
    Add(ReplicateStr(#13#10,9));
    Text := NormalizeStr(Text);
    SaveToFile(edPorta.Text);
  finally
    Free;
  end;
  GravaOpcoes;
  MsgAviso('Recibo impresso!');
end;

procedure TfrmImprimeRecibo.SetTelefoneEmpresa(const Value: String);
begin
  FTelefoneEmpresa := Value;
end;

procedure TfrmImprimeRecibo.GravaOpcoes;
begin
  WriteIniFile('Recibo', 'Porta Bobina', edPorta.Text);
  WriteIniFile('Recibo', 'Colunas', edColunas.Text);
end;

procedure TfrmImprimeRecibo.LeOpcoes;
begin
  edColunas.Value := StrToIntDef(ReadIniFile('Recibo', 'Colunas'), 40);
  edPorta.Text := ReadIniFile('Recibo', 'Porta Bobina');
end;

procedure TfrmImprimeRecibo.FormShow(Sender: TObject);
begin
  LeOpcoes;
  SetVisibleButtons;
end;

procedure TfrmImprimeRecibo.SetVisibleButtons;
begin
  if(rbBobina.Checked)then
  begin
    btnVisualizar.Enabled := False;
    edPorta.Enabled := True;
    lbColunas.Enabled := True;
    edColunas.Enabled := True;
  end;
  if(rbA4.Checked)then
  begin
    btnVisualizar.Enabled := True;
    edPorta.Enabled := False;
    lbColunas.Enabled := False;
    edColunas.Enabled := False;
  end;
end;

procedure TfrmImprimeRecibo.rbA4Click(Sender: TObject);
begin
  SetVisibleButtons;
end;

procedure TfrmImprimeRecibo.rbBobinaClick(Sender: TObject);
begin
  SetVisibleButtons;
end;

procedure TfrmImprimeRecibo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmImprimeRecibo.FormCreate(Sender: TObject);
begin
  CentralizaForm(Self);
end;

end.
