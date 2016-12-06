unit unInformacaoSistema;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unSimplePadrao, StdCtrls, Buttons;

type
  TfrmInformacaoSistema = class(TfrmSimplePadrao)
    btnOk: TBitBtn;
    mmoInfo: TMemo;
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mmoInfoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
  public
  end;

var
  frmInformacaoSistema: TfrmInformacaoSistema;

implementation

uses VarGlobal, Funcoes, FuncoesWin;

{$R *.dfm}

procedure TfrmInformacaoSistema.btnOkClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmInformacaoSistema.FormShow(Sender: TObject);
begin
  inherited;
//  mmoInfo.Lines.Clear;
//  mmoInfo.Lines.Add('SISTEMA ---------------------------------------------------------------------');
//  mmoInfo.Lines.Add('Nome................: '+Sistema.AppCaption);
//  mmoInfo.Lines.Add('Versão..............: '+Sistema.VersaoApp);
//  mmoInfo.Lines.Add('Pasta...............: '+DiretorioSistema);
//  mmoInfo.Lines.Add('');
//
//  mmoInfo.Lines.Add('BANCO DE DADOS --------------------------------------------------------------');
//  mmoInfo.Lines.Add('Pasta...............: '+DiretorioSistema+'CPR.fdb');
//  mmoInfo.Lines.Add('Usuário.............: '+GetDataModule.Conexao.Params.Values['user_name']);
//  mmoInfo.Lines.Add('Versão do Servidor..: '+ObterVersaoServidor(ReadIniFile('Conexao', 'Servidor')));
//  mmoInfo.Lines.Add('');
//
//  mmoInfo.Lines.Add('SISTEMA OPERACIONAL ---------------------------------------------------------');
//  mmoInfo.Lines.Add('Nome................: '+GetOSVer);
//  mmoInfo.Lines.Add('Versão..............: '+SysVersionStr);
//  mmoInfo.Lines.Add('Pasta...............: '+SysWinDir);
//  mmoInfo.Lines.Add('Computador..........: '+SysComputerName);
//  mmoInfo.Lines.Add('Usuário Logado......: '+SysUserName);
end;

procedure TfrmInformacaoSistema.FormCreate(Sender: TObject);
begin
  inherited;
  SetDialogForm(Self);
end;

procedure TfrmInformacaoSistema.mmoInfoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_DOWN then
  begin
    Key := 0;
    exit;
  end;
end;

initialization
  RegisterClass(TfrmInformacaoSistema);
finalization
  UnRegisterClass(TfrmInformacaoSistema);
end.
