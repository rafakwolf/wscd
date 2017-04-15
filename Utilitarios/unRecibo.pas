unit unRecibo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons,
  ExtCtrls, ComCtrls, DBClient, Provider, SqlExpr,
   DBCtrls, Mask, FMTBcd, System.Actions;

type
  TfrmRecibo = class(TfrmPadrao)
    sqldPadrao: TSQLDataSet;
    dspPadrao: TDataSetProvider;
    cdsPadrao: TClientDataSet;
    lbRecebedor: TLabel;
    lbRefente: TLabel;
    lbValor: TLabel;
    lbValorExtenso: TLabel;
    dbRecebedor: TDBEdit;
    dbReferente: TDBMemo;
    dbValor: TDBEdit;
    dbValorExtenso: TDBMemo;
    dbData: TDBEdit;
    sqldPadraoIDRECIBO: TIntegerField;
    sqldPadraoDATA: TDateField;
    sqldPadraoRECEBEDOR: TStringField;
    sqldPadraoREFERENTE: TMemoField;
    sqldPadraoVALOREXTENSO: TMemoField;
    cdsPadraoIDRECIBO: TIntegerField;
    cdsPadraoDATA: TDateField;
    cdsPadraoRECEBEDOR: TStringField;
    cdsPadraoREFERENTE: TMemoField;
    cdsPadraoVALOREXTENSO: TMemoField;
    tmrImpressao: TTimer;
    sqldPadraoVALOR: TFMTBCDField;
    cdsPadraoVALOR: TFMTBCDField;
    N5: TMenuItem;
    procedure actPrintExecute(Sender: TObject);
    procedure cdsPadraoVALORChange(Sender: TField);
    procedure cdsPadraoAfterInsert(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure dbValorKeyPress(Sender: TObject; var Key: Char);
    procedure tmrImpressaoTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
  public
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
  if not(cdsPadraoIDRECIBO.IsNull)then
  begin
//    with TfrmImprimeRecibo.Create(Self)do
//    try
//      NomeEmpresa     := Empresa.Nome;
//      CidadeEstado    := Empresa.Cidade + ' - ' + Empresa.Estado;
//      CNPJ_IE         := Empresa.Cnpj + ' - ' + Empresa.InscEstadual;
//      EnderecoFone    := Empresa.Endereco;
//      TelefoneEmpresa := Empresa.Telefone;
//      Assinatura      := dbRecebedor.Text;
//      Valor           := StrToFloat(dbValor.Text);
//      Recebedor       := dbRecebedor.Text;
//      ValorExtenso    := dbValorExtenso.Text;
//      Referente       := dbReferente.Text;
//      Data            := dbData.Date;
//      Cidade          := Empresa.Cidade;
//      ShowModal;
//    finally
//     Free;
//    end;
  end
  else
  begin
    MsgErro('','Não existem recibos cadastrados');
    Exit;
  end; 
end;

procedure TfrmRecibo.cdsPadraoVALORChange(Sender: TField);
begin
  inherited;
  cdsPadraoVALOREXTENSO.AsString := Extenso(Sender.AsFloat);
end;

procedure TfrmRecibo.cdsPadraoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  //Incrementa('RECIBO', cdsPadraoIDRECIBO, GetConnection);
end;

procedure TfrmRecibo.FormCreate(Sender: TObject);
begin
  inherited;
  FieldNames := FN_RECIBO;
  DisplayLabels := DL_RECIBO;
  aCaption := 'Recibos';
end;

procedure TfrmRecibo.dbValorKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  //ControlarTeclas(Key);
end;

procedure TfrmRecibo.tmrImpressaoTimer(Sender: TObject);
begin
  inherited;
  tmrImpressao.Enabled := False;
  if imprime then
  begin
    if MsgSN('Deseja imprimir este recibo?') then
    begin
      actPost.Execute;
      actPrint.Execute;
    end;
  end;  
end;

procedure TfrmRecibo.FormShow(Sender: TObject);
begin
  inherited;
  tmrImpressao.Enabled := True;
end;

initialization
  RegisterClass(TfrmRecibo);
finalization
  UnRegisterClass(TfrmRecibo);
end.
