unit unRelatorioBobinaOrcam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unSimplePadrao, Provider, DB, DBClient, SqlExpr,
  StdCtrls, ExtCtrls, Spin, Buttons, FMTBcd;

type
  TfrmRelatorioBobinaOrcam = class(TfrmSimplePadrao)
    sqlOrcam: TSQLDataSet;
    sqlDetOrcam: TSQLDataSet;
    dsLink: TDataSource;
    cdsDetOrcam: TClientDataSet;
    cdsOrcam: TClientDataSet;
    dtOrcam: TDataSetProvider;
    edtImpressora: TLabeledEdit;
    seCopias: TSpinEdit;
    lbCopias: TLabel;
    btnCancelar: TBitBtn;
    btnOk: TBitBtn;
    mmoOrcam: TMemo;
    sqlOrcamCODIGO: TIntegerField;
    sqlOrcamCODCLIENTE: TIntegerField;
    sqlOrcamNOMECLIENTE: TStringField;
    sqlOrcamDATA: TDateField;
    sqlOrcamOBS: TStringField;
    sqlOrcamTOTAL: TFMTBCDField;
    sqlOrcamITENS: TIntegerField;
    sqlOrcamSTATUS: TStringField;
    sqlOrcamCONCLUIDO: TStringField;
    sqlDetOrcamCODIGO: TIntegerField;
    sqlDetOrcamCODPRODUTO: TIntegerField;
    sqlDetOrcamNOMEPRODUTO: TStringField;
    sqlDetOrcamQTDE: TIntegerField;
    sqlDetOrcamCUSTO: TFMTBCDField;
    sqlDetOrcamVENDA: TFMTBCDField;
    sqlDetOrcamDESCTO: TFMTBCDField;
    sqlDetOrcamVALORDESCTO: TFMTBCDField;
    sqlDetOrcamTOTAL: TFMTBCDField;
    cdsOrcamCODIGO: TIntegerField;
    cdsOrcamCODCLIENTE: TIntegerField;
    cdsOrcamNOMECLIENTE: TStringField;
    cdsOrcamDATA: TDateField;
    cdsOrcamOBS: TStringField;
    cdsOrcamTOTAL: TFMTBCDField;
    cdsOrcamITENS: TIntegerField;
    cdsOrcamSTATUS: TStringField;
    cdsOrcamCONCLUIDO: TStringField;
    cdsOrcamsqlDetOrcam: TDataSetField;
    cdsDetOrcamCODIGO: TIntegerField;
    cdsDetOrcamCODPRODUTO: TIntegerField;
    cdsDetOrcamNOMEPRODUTO: TStringField;
    cdsDetOrcamQTDE: TIntegerField;
    cdsDetOrcamCUSTO: TFMTBCDField;
    cdsDetOrcamVENDA: TFMTBCDField;
    cdsDetOrcamDESCTO: TFMTBCDField;
    cdsDetOrcamVALORDESCTO: TFMTBCDField;
    cdsDetOrcamTOTAL: TFMTBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FIdOrcamento: Integer;
    procedure OrcamentoBobina;
    procedure SetIdOrcamento(const Value: Integer);
  public
    property IdOrcamento: Integer read FIdOrcamento write SetIdOrcamento;
  end;

var
  frmRelatorioBobinaOrcam: TfrmRelatorioBobinaOrcam;

implementation

uses Funcoes, VarGlobal;

{$R *.dfm}

procedure TfrmRelatorioBobinaOrcam.OrcamentoBobina;
var
  Col: Integer;
  sl: TStringList;

  function Centraliza(const s: String): String;
  begin
    Result := CentralizaTexto(s, Global.ColunaOrcamBobina{, True});
  end;

begin
  Col := Global.ColunaOrcamBobina;
  sl := TStringList.Create;
  with Sl do
  try
    Add(Centraliza(Empresa.Nome));
    Add(Centraliza(Empresa.Endereco));
    Add(Centraliza(Empresa.Cidade + ' - '+ Empresa.Estado));
    Add(Centraliza('Fone: ' + Empresa.Telefone));
    Add(Centraliza(FormatDateTime('dd/mm/yyyy', Date)));

    Add(ReplicateStr('-', Col));

    Add(Centraliza('***'+Global.TituloOrcamento+'***'));
    Add(Centraliza('DOCUMENTO NÃO FISCAL'));
    Add(ReplicateStr('-', Col));
    Add('Data: ' + DateToStr(cdsOrcamDATA.AsDateTime));
    Add('Cliente: ' +
      Copy(cdsOrcamNOMECLIENTE.AsString, 1, Col-9));
    Add('OBS.: ' + Copy(cdsOrcamOBS.AsString, 1, Col-6));
    Add(ReplicateStr('-', Col));

    cdsDetOrcam.First;
    while not cdsDetOrcam.Eof do
    begin

      Add(IntToStr(cdsDetOrcamCODPRODUTO.AsInteger)+' - '+
        Copy(cdsDetOrcamNOMEPRODUTO.AsString, 1,
        Col-(IntToStr(cdsDetOrcamCODPRODUTO.AsInteger)+' - ').Length));

      Add('   '+FloatToStr(cdsDetOrcamQTDE.AsFloat)+' x '+
        FormatFloat('#,##0.00', cdsDetOrcamVENDA.AsFloat)+' - '+
        FormatFloat('#,##0.00', cdsDetOrcamDESCTO.AsFloat)+' = '+
        FormatFloat('#,##0.00', cdsDetOrcamTOTAL.AsFloat));

      cdsDetOrcam.Next;
    end;
    Add(ReplicateStr('-', col));
    Add('Total: ' + FormatFloat('#,##0.00', cdsOrcamTOTAL.AsFloat));
    Add('Nro Itens: ' + FloatToStr(cdsOrcamITENS.AsFloat));
    Add(ReplicateStr('-', col));
    Add(Centraliza(Global.MsgRodapeOrcam));
    Add(Centraliza('EXIJA CUPOM OU NOTA FISCAL'));
    Add(ReplicateStr('.', col));
    Add(Centraliza(Sistema.AppCaption+' - '+sistema.VersaoApp));
    Add(ReplicateStr('.', col));
    Add(ReplicateStr(#13#10, Global.LinhaBobinaOrcam));

    Text := NormalizeStr(Text);
    mmoOrcam.Lines.Assign(sl);
  finally
    Free;
  end;
end;

procedure TfrmRelatorioBobinaOrcam.SetIdOrcamento(const Value: Integer);
begin
  FIdOrcamento := Value;
  if (Value > 0) then
  begin
    cdsOrcam.Close;
    cdsOrcam.Params.ParamByName('IDORCAM').AsInteger := FIdOrcamento;
    cdsOrcam.Open;
    OrcamentoBobina;
  end;
end;

procedure TfrmRelatorioBobinaOrcam.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cdsORcam.Close;
  inherited;
end;

procedure TfrmRelatorioBobinaOrcam.btnCancelarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmRelatorioBobinaOrcam.btnOkClick(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  WriteIniFile('ORCAMENTO', 'Porta-Imp', edtImpressora.Text);
  for i := 0 to seCopias.Value - 1 do
    mmoOrcam.Lines.SaveToFile(edtImpressora.Text);
  MsgAviso('Orçamento impresso com sucesso.');
end;

procedure TfrmRelatorioBobinaOrcam.FormCreate(Sender: TObject);
begin
  inherited;
  SetDialogForm(Self);
  edtImpressora.Text := ReadIniFile('ORCAMENTO', 'Porta-Imp');
  seCopias.Value := 1;
end;

end.
