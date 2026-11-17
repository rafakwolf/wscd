unit unRecibo;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons,
  ComCtrls, memds, SqlDb, DBCtrls, ZDataset, ZSqlUpdate,  FMTBcd;

type

  { TfrmRecibo }

  TfrmRecibo = class(TfrmPadrao)
    lbRecebedor: TLabel;
    lbData: TLabel;
    lbRefente: TLabel;
    lbValor: TLabel;
    lbValorExtenso: TLabel;
    dbData: TDBEdit;
    dbRecebedor: TDBEdit;
    dbValor: TDBEdit;
    dbReferente: TDBMemo;
    dbValorExtenso: TDBMemo;
    sqldPadrao: TZQuery;
    procedure actPrintExecute(Sender: TObject);
    procedure dbValorExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  public
    class procedure AddAndPrint(data: TDateTime; valor: Currency;
          recebedor, referente: string);
  end;

var
  frmRecibo: TfrmRecibo;
  Imprime  : Boolean = False;

implementation

uses ConstPadrao, Funcoes, unImprimeRecibo, 
     VarGlobal, Extensos;

{$R *.dfm}

procedure TfrmRecibo.actPrintExecute(Sender: TObject);
begin
  inherited;
  if not(sqldPadrao.FieldByName('IDRECIBO').IsNull)then
  begin
    with TfrmImprimeRecibo.Create(Self)do
    try
      NomeEmpresa     := Empresa.Nome;
      CidadeEstado    := Empresa.Cidade + ' - ' + Empresa.Estado;
      CNPJ_IE         := Empresa.Cnpj + ' - ' + Empresa.InscEstadual;
      EnderecoFone    := Empresa.Endereco;
      TelefoneEmpresa := Empresa.Telefone;
      Assinatura      := dbRecebedor.Text;
      Valor           := StrToFloat(dbValor.Text);
      Recebedor       := dbRecebedor.Text;
      ValorExtenso    := dbValorExtenso.Text;
      Referente       := dbReferente.Text;
      Data            := StrToDate(dbData.Text);
      Cidade          := Empresa.Cidade;
      ShowModal;
    finally
     Free;
    end;
  end
  else
  begin
    MsgErro('','Nao existem recibos cadastrados');
    Exit;
  end; 
end;

procedure TfrmRecibo.dbValorExit(Sender: TObject);
begin
  sqldPadrao.FieldByName('VALOREXTENSO').AsString:= Extenso(StrToFloat(dbValor.Text));
end;

procedure TfrmRecibo.FormCreate(Sender: TObject);
begin
  inherited;
  FieldNames := FN_RECIBO;
  DisplayLabels := DL_RECIBO;
  aCaption := 'Recibos';
  TableName:='RECIBO';
  IgnoreAutoGenerateLabels:=true;
end;

class procedure TfrmRecibo.AddAndPrint(data: TDateTime; valor: Currency;
  recebedor, referente: string);
begin
  with TfrmRecibo.Create(nil) do
  try
    Caption := 'Recibos';
    sqldPadrao.Open;
    sqldPadrao.Insert;
    sqldPadrao.FieldByName('DATA').AsDateTime    := data;
    sqldPadrao.FieldByName('VALOR').AsFloat      := valor;
    sqldPadrao.FieldByName('RECEBEDOR').AsString := recebedor;
    sqldPadrao.FieldByName('REFERENTE').AsString := referente;
    sqldPadrao.ApplyUpdates;
    Imprime := True;
    ShowModal;
  finally
    Free;
  end;
end;

initialization
  RegisterClass(TfrmRecibo);
finalization
  UnRegisterClass(TfrmRecibo);
end.
