unit unSobre;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,   StdCtrls, JPEGLib, lcltype;

type

  { TfrmSobre }

  TfrmSobre = class(TForm)
    btnOK: TButton;
    lblVersao: TLabel;
    lblEmpresa: TLabel;
    lblCNPJ: TLabel;
    mmoOS: TMemo;
    procedure btnOKClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  frmSobre: TfrmSobre;

implementation

uses Funcoes, VarGlobal;

{$R *.dfm}

procedure TfrmSobre.btnOKClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSobre.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmSobre.FormShow(Sender: TObject);
begin
  Caption := 'Sobre o ' + Sistema.AppCaption;
  lblVersao.Caption := 'Vers�o e Revis�o: ' + Sistema.VersaoApp;
  lblEmpresa.Caption := 'Empresa: ' + Empresa.Nome;
  lblCNPJ.Caption := 'CNPJ: ' + empresa.Cnpj;
end;

procedure TfrmSobre.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmSobre.FormCreate(Sender: TObject);
begin
  //
end;

initialization
  RegisterClass(TfrmSobre);
finalization
  UnRegisterClass(TfrmSobre);
end.

