unit unRecibo;

interface

uses
   Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons,
  ExtCtrls, ComCtrls, memds,  SqlDb,
   DBCtrls,  FMTBcd;

type
  TfrmRecibo = class(TfrmPadrao)
    sqldPadrao: TSQLQuery;
    dspPadrao: TComponent;
    cdsPadrao: TMemDataSet;
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
    sqldPadraoVALOR: TFMTBCDField;
    cdsPadraoVALOR: TFMTBCDField;
    mmPadrao: TMainMenu;
    miRelatorios: TMenuItem;
    mImprimir: TMenuItem;
    N5: TMenuItem;
    lbRecebedor: TLabel;
    lbRefente: TLabel;
    lbValor: TLabel;
    lbValorExtenso: TLabel;
    dbData: TDBEdit;
    dbRecebedor: TDBEdit;
    dbValor: TDBEdit;
    dbReferente: TDBMemo;
    dbValorExtenso: TDBMemo;
    procedure actPrintExecute(Sender: TObject);
    procedure cdsPadraoVALORChange(Sender: TField);
    procedure FormCreate(Sender: TObject);
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
    MsgErro('','N�o existem recibos cadastrados');
    Exit;
  end; 
end;

procedure TfrmRecibo.cdsPadraoVALORChange(Sender: TField);
begin
  inherited;
  cdsPadraoVALOREXTENSO.AsString := Extenso(Sender.AsFloat);
end;

procedure TfrmRecibo.FormCreate(Sender: TObject);
begin
  inherited;
  FieldNames := FN_RECIBO;
  DisplayLabels := DL_RECIBO;
  aCaption := 'Recibos';
end;

initialization
  RegisterClass(TfrmRecibo);
finalization
  UnRegisterClass(TfrmRecibo);
end.
