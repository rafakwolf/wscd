unit unRelatorioBobinaVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unSimplePadrao, StdCtrls, Buttons, Spin, ExtCtrls, DB,
  DBClient, Datasnap.Provider,
  Data.SqlExpr, FMTBcd;

type
  TfrmRelatorioBobinaVenda = class(TfrmSimplePadrao)
    edtImpressora: TLabeledEdit;
    seCopias: TSpinEdit;
    lbCopias: TLabel;
    btnCancelar: TBitBtn;
    btnOk: TBitBtn;
    mmoVenda: TMemo;
    sqlVendas: TSQLQuery;
    sqlItens: TSQLQuery;
    dtVendas: TDataSetProvider;
    dsLnkVenda: TDataSource;
    cdsVendas: TClientDataSet;
    cdsVendasCODIGO: TIntegerField;
    cdsVendasCODCLIENTE: TIntegerField;
    cdsVendasCLIENTE: TStringField;
    cdsVendasDATA: TDateField;
    cdsVendasOBS: TStringField;
    cdsVendasCONCLUIDA: TStringField;
    cdsVendasBAIXADO: TStringField;
    cdsVendassqlItens: TDataSetField;
    cdsItens: TClientDataSet;
    sqldPagamento: TSQLDataSet;
    dspPagamento: TDataSetProvider;
    cdspagamento: TClientDataSet;
    sqldPagamentoFORMARECTO: TStringField;
    sqldPagamentoVALORRECDO: TFMTBCDField;
    cdspagamentoFORMARECTO: TStringField;
    cdspagamentoVALORRECDO: TFMTBCDField;
    sqlVendasCODIGO: TIntegerField;
    sqlVendasCODCLIENTE: TIntegerField;
    sqlVendasCLIENTE: TStringField;
    sqlVendasDATA: TDateField;
    sqlVendasOBS: TStringField;
    sqlVendasTOTALDESCTO: TFMTBCDField;
    sqlVendasTOTAL: TFMTBCDField;
    sqlVendasCONCLUIDA: TStringField;
    sqlVendasBAIXADO: TStringField;
    sqlItensCODIGO: TIntegerField;
    sqlItensCODPRODUTO: TIntegerField;
    sqlItensPRODUTO: TStringField;
    sqlItensQTD: TIntegerField;
    sqlItensCUSTO: TFMTBCDField;
    sqlItensVENDA: TFMTBCDField;
    sqlItensDESCTO: TFMTBCDField;
    sqlItensVALORDESCTO: TFMTBCDField;
    sqlItensTOTAL: TFMTBCDField;
    cdsVendasTOTALDESCTO: TFMTBCDField;
    cdsVendasTOTAL: TFMTBCDField;
    cdsItensCODIGO: TIntegerField;
    cdsItensCODPRODUTO: TIntegerField;
    cdsItensPRODUTO: TStringField;
    cdsItensQTD: TIntegerField;
    cdsItensCUSTO: TFMTBCDField;
    cdsItensVENDA: TFMTBCDField;
    cdsItensDESCTO: TFMTBCDField;
    cdsItensVALORDESCTO: TFMTBCDField;
    cdsItensTOTAL: TFMTBCDField;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FIdVenda: Integer;
    procedure SetIdVenda(const Value: Integer);
    procedure VendaBobina;
  public
    property IdVenda: Integer read FIdVenda write SetIdVenda;
  end;

var
  frmRelatorioBobinaVenda: TfrmRelatorioBobinaVenda;

implementation

uses Funcoes, VarGlobal, uClasses;

{$R *.dfm}

procedure TfrmRelatorioBobinaVenda.btnCancelarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmRelatorioBobinaVenda.SetIdVenda(const Value: Integer);
begin
  FIdVenda := Value;
  if (Value > 0) then
  begin
    cdsVendas.Open;
    cdsVendas.Filtered := False;
    cdsVendas.Filter := 'CODIGO = '+QuotedStr(IntToStr(FIdVenda));
    cdsVendas.Filtered := True;

    cdspagamento.Close;
    cdspagamento.Params.ParamByName('VENDA').AsInteger := FIdVenda;
    cdspagamento.Open;

    VendaBobina;
  end;
end;

procedure TfrmRelatorioBobinaVenda.VendaBobina;
var
  Col: Integer;
  sl: TStringList;

  function Centraliza(const s: String): String;
  begin
    Result := CentralizaTexto(s, Global.ColunaVendaBobina{, True});
  end;

begin
  Col := Global.ColunaVendaBobina;
  sl := TStringList.Create;
  with Sl do
  try
    Add(Centraliza(Empresa.Nome));
    Add(Centraliza(Empresa.Endereco));
    Add(Centraliza(Empresa.Cidade + ' - '+ Empresa.Estado));
    Add(Centraliza('Fone: ' + Empresa.Telefone));
    Add(Centraliza(FormatDateTime('dd/mm/yyyy', Date)));

    Add(ReplicateStr('-', Col));

    Add(Centraliza('***'+Global.TituloVenda+'***'));
    Add(Centraliza('DOCUMENTO NÃO FISCAL'));
    Add(ReplicateStr('-', Col));
    Add('Data: ' + DateToStr(cdsVendasDATA.AsDateTime));
    Add('Cliente: ' +
      Copy(cdsVendasCLIENTE.AsString, 1, Col-9));
    Add('OBS.: ' + Copy(cdsVendasOBS.AsString, 1, Col-6));
    Add(ReplicateStr('-', Col));

    cdsItens.First;
    while not cdsItens.Eof do
    begin

      Add(IntToStr(cdsItensCODPRODUTO.AsInteger)+' - '+
        Copy(cdsItensPRODUTO.AsString, 1,
        Col-(IntToStr(cdsItensCODPRODUTO.AsInteger)+' - ').Length));

      Add('   '+FloatToStr(cdsItensQTD.AsFloat)+' x '+
        FormatFloat('#,##0.00', cdsItensVENDA.AsFloat)+' - '+
        FormatFloat('#,##0.00', cdsItensDESCTO.AsFloat)+' = '+
        FormatFloat('#,##0.00', cdsItensTOTAL.AsFloat));

      cdsItens.Next;
    end;
    Add(ReplicateStr('-', col));
    Add('Total: ' + FormatFloat('#,##0.00', cdsVendasTOTAL.AsFloat));
    Add('Total Desconto: ' + FormatFloat('#,##0.00', cdsVendasTOTALDESCTO.AsFloat));
    
    if cdsVendasCONCLUIDA.AsString = 'S' then
    begin
      Add(ReplicateStr('-', col));
      Add(Centraliza('**Recebimento**'));

      cdspagamento.First;
      while not cdspagamento.Eof do
      begin
        Add(cdspagamentoFORMARECTO.AsString+' - '+
          FormatFloat('#,##0.00', cdspagamentoVALORRECDO.AsFloat));
        cdspagamento.Next;
      end;
    end;
    
    Add(ReplicateStr('-', col));
    Add(Centraliza(Global.MsgRodapeVenda));
    Add(Centraliza('EXIJA CUPOM OU NOTA FISCAL'));
    Add(ReplicateStr('.', col));
    Add(Centraliza(Sistema.AppCaption+' - '+sistema.VersaoApp));
    Add(ReplicateStr('.', col));    
    Add(ReplicateStr(#13#10, Global.LinhaBobinaVenda));

    Text := NormalizeStr(Text);
    mmoVenda.Lines.Assign(sl);
  finally
    Free;
  end;
end;

procedure TfrmRelatorioBobinaVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cdsVendas.Close;
  inherited;
end;

procedure TfrmRelatorioBobinaVenda.btnOkClick(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  WriteIniFile('VENDA', 'Porta-Imp', edtImpressora.Text);
  for i := 0 to seCopias.Value - 1 do
    mmoVenda.Lines.SaveToFile(edtImpressora.Text);
  MsgAviso('Venda impressa com sucesso.');
end;

procedure TfrmRelatorioBobinaVenda.FormCreate(Sender: TObject);
begin
  inherited;
  SetDialogForm(Self);
  edtImpressora.Text := ReadIniFile('VENDA', 'Porta-Imp');
  seCopias.Value := 1;
end;

end.
