unit unTrocaSenhaCaixa;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ZDataset, ZSqlUpdate, memds,  DB,
  SqlDb, FMTBcd;

type

  { TfrmSenhaCaixa }

  TfrmSenhaCaixa = class(TForm)
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    edAtual: TEdit;
    edNova: TEdit;
    ZQuery1: TZQuery;
    ZUpdateSQL1: TZUpdateSQL;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
  public
  end;

var
  frmSenhaCaixa: TfrmSenhaCaixa;

implementation

uses Funcoes, VarGlobal, uUtilFncs, crypto;

{$R *.dfm}

procedure TfrmSenhaCaixa.FormShow(Sender: TObject);
begin
  edAtual.Clear;
  edNova.Clear;
end;

procedure TfrmSenhaCaixa.btnOkClick(Sender: TObject);
begin
  zquery1.Open;
  zquery1.Filtered:=false;
  ZQuery1.Filter:='NOMECOMPUTADOR = '+QuotedStr(GetComputerName);
  zquery1.Filtered:=true;

  if (edAtual.Text <> '') and (edNova.Text <> '') then
  begin
    if EnDecrypt(zquery1.FieldByName('SENHACAIXA').AsString) = edAtual.Text then
    begin
      zquery1.Edit;
      zquery1.FieldByName('SENHACAIXA').AsString := Trim(EnDecrypt(edNova.Text));
      zquery1.ApplyUpdates;
      Configuracao.Atualizar;
      MsgAviso('Senha de caixa alterada!');
      ModalResult := mrOk;
    end
    else
    begin
      MsgErro('Senha atual nao confere, digite novamente.');
      edAtual.Clear;
      edNova.Clear;
      edAtual.SelectAll;
    end;
  end
  else
  begin
    MsgCuidado('Para alterar as senhas, voce deve digita-las.');
    edAtual.Clear;
    edNova.Clear;
    edAtual.SelectAll;
  end;
end;

procedure TfrmSenhaCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  zquery1.Close;
  Action := caFree;
end;

procedure TfrmSenhaCaixa.FormKeyPress(Sender: TObject; var Key: Char);
begin
end;

initialization
  RegisterClass(TfrmSenhaCaixa);
finalization
  UnRegisterClass(TfrmSenhaCaixa);
end.
