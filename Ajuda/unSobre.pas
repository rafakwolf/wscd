unit unSobre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, jpeg;

type
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
    procedure Carrega;
  public
    constructor Create(Aowner: TComponent); override;
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

constructor TfrmSobre.Create(Aowner: TComponent);
begin
  inherited;
  BorderStyle := bsSingle;
  SetDialogForm(Self);
end;

procedure TfrmSobre.FormShow(Sender: TObject);
begin
  Caption := 'Sobre o ' + Sistema.AppCaption;
  lblVersao.Caption := 'Versão e Revisão: ' + Sistema.VersaoApp;
  lblEmpresa.Caption := 'Empresa: ' + Empresa.Nome;
  lblCNPJ.Caption := 'CNPJ: ' + empresa.Cnpj;
end;

procedure TfrmSobre.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmSobre.Carrega;
var
  verInfo: TOsVersionInfo;
  str: string;
  I: Word;
begin
  mmoOS.Lines.Clear;
  verInfo.dwOSVersionInfoSize := SizeOf(TOSVersionInfo);
  if GetVersionEx(verInfo) then
  begin
    mmoOS.Lines.Add('Versão : ' + IntToStr(verInfo.dwMajorVersion) + '.' +
      IntToStr(verInfo.dwMinorVersion));
    mmoOS.Lines.Add('Compilação : ' + IntToStr(verInfo.dwBuildNumber));

    case verInfo.dwPlatformId of
      VER_PLATFORM_WIN32s: mmoOS.Lines.Add('Sistema Operacional : Windows 95');
      VER_PLATFORM_WIN32_WINDOWS:
        mmoOS.Lines.Add('Sistema Operacional : Windows 95 Osr2 / 98');
      VER_PLATFORM_WIN32_NT:
        mmoOS.Lines.Add('Sistema Operacional : Windows NT');
    end;

    str := '';

    for I := 0 to 127 do
      str := str + verInfo.szCSDVersion[I];

    mmoOS.Lines.Add('Informações Adicionais : ' + str);
  end;
end;

procedure TfrmSobre.FormCreate(Sender: TObject);
begin
  Carrega;
end;

initialization
  RegisterClass(TfrmSobre);
finalization
  UnRegisterClass(TfrmSobre);
end.

