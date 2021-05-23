unit unRestore;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls;

type
  TfrmRestore = class(TForm)
    btnRestaurar: TBitBtn;
    Memo: TMemo;
    BtnCancela: TBitBtn;
    edFileName: TLabeledEdit;
    btnBuscaFileName: TBitBtn;
    odBackup: TOpenDialog;
    pbProgresso: TProgressBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnCancelaClick(Sender: TObject);
    procedure btnRestaurarClick(Sender: TObject);
    procedure btnBuscaFileNameClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    abortar: Boolean;
    procedure DesligaBotoes;
    procedure LigaBotoes;
    procedure Msg(Texto: string; pDelay: Cardinal);
  public
  end;

var
  frmRestore: TfrmRestore;

implementation

uses
  Funcoes, {FuncoesWin, uBackupRestore,}  VarGlobal;

{$R *.dfm}

procedure TfrmRestore.BtnCancelaClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmRestore.btnRestaurarClick(Sender: TObject);
var
  FileCopia, DestinoCopia, BancoAntigo, copia_descompactada: String;
  //Zip: TZip;
 // aRestore: TBackupRestore;
  x: Integer;
begin
  {x                   := 0;
  FileCopia           := '';
  DestinoCopia        := '';
  BancoAntigo         := '';
  copia_descompactada := '';
  try
    try
      DesligaBotoes;
      FileCopia := edFilename.Text;

      if FileCopia = '' then
      begin
        MsgAviso('Selecione uma c�pia para restaurar.');
        abortar := True;
        LigaBotoes;
        Exit;
      end;

      DestinoCopia := ExtractFilePath(ParamStr(0));
      BancoAntigo := ExtractFilePath(ParamStr(0)) + 'CPR.fdb';

      Zip := TZip.Create;
      with Zip do
      try
        Progress := pbProgresso;
        Log      := Memo.Lines;
        Descompactar(FileCopia, DestinoCopia);
      finally
        Zip.Free;
      end;

      Msg('Substituindo banco de dados...', 0);

      if UsuariosLogados(BancoAntigo, 'SYSDBA', 'masterkey') > 1 then
      begin
        MsgCuidado('Banco de dados est� sendo usado por outro processo. '+
          'Se o sistema estiver sendo usado em rede todas as esta��es devem ser '+
          'desconectadas para que possa ser efetuada a restaura��o.');
        Abortar := True;
        LigaBotoes;
        Exit;
      end;

      DeleteFile(BancoAntigo);

      copia_descompactada :=
        DestinoCopia+ChangeFileExt(ExtractFileName(FileCopia), '.fbk');

      
      while not FileExists(copia_descompactada) do
        if x >= 10 then
        begin
          MsgErro('C�pia '+copia_descompactada+' n�o encontrada. Entre em contato com suporte.');
          abortar := True;
          LigaBotoes;
          Exit;
        end
        else
          Inc(x);

      aRestore := TBackupRestore.Create;
      with aRestore do
      try
        Servidor := ReadIniFile('Conexao', 'Servidor');
        Usuario  := 'SYSDBA';
        Senha    := 'masterkey';
        Log      := Memo.Lines;
        Restaura(copia_descompactada, BancoAntigo);
      finally
        aRestore.Free;
      end;
    except
      on e: Exception do
      begin
        Msg('ERRO.', 0);
        Msg(e.Message, 0);
        raise Exception.Create('Erro ao efetuar a restaura��o.'+#13#10+e.Message);
      end;
    end;
  finally
    DeleteFile(copia_descompactada);
    LigaBotoes;
    if not abortar then
    begin
      Msg('-----------------------------------', 0);
      Msg('Restaura��o finalizada com sucesso!', 0);
      MsgAviso('Restaura��o finalizada com sucesso!');
    end
    else if abortar then
    begin
      Msg('---------------------------------', 0);
      Msg('Restaura��o N�O foi bem sucedida.', 0);
      MsgErro('Restaura��o N�O foi bem sucedida.');
    end;
  end;}
end;

procedure TfrmRestore.DesligaBotoes;
begin
  btnRestaurar.Enabled := False;
  BtnCancela.Enabled := False;
  Screen.Cursor := crHourGlass;
  Memo.Lines.Clear;
  Application.ProcessMessages;
end;

procedure TfrmRestore.LigaBotoes;
begin
  btnRestaurar.Enabled := True;
  BtnCancela.Enabled := True;
  Screen.Cursor := crDefault;
  Application.ProcessMessages;
end;

procedure TfrmRestore.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //GetDataModule.Conexao.Connected := True;
  Sistema.Atualizar;
  Empresa.Atualizar;
  Configuracao.Atualizar;
  Global.Atualizar;
  Action := caFree;
end;

procedure TfrmRestore.btnBuscaFileNameClick(Sender: TObject);
begin
  if odBackup.Execute then
    edFileName.Text := odBackup.FileName
  else
    edFileName.Clear;  
end;

procedure TfrmRestore.Msg(Texto: string; pDelay: Cardinal);
begin
  //Delay(pDelay);
  Memo.Lines.Add(Texto);
  Application.ProcessMessages;
end;

procedure TfrmRestore.FormShow(Sender: TObject);
begin
  //GetDataModule.Conexao.Connected := False;
end;

procedure TfrmRestore.FormCreate(Sender: TObject);
begin
  CentralizaForm(Self);
end;

initialization
  RegisterClass(TfrmRestore);
finalization
   UnRegisterClass(TfrmRestore);
end.
