unit unBackup;

interface

uses SysUtils, Messages, Classes, Graphics, Controls, Forms, FileCtrl,
     Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, unSimplePadrao;

type
  TfrmBackup = class(TfrmSimplePadrao)
    Memo: TMemo;
    cbDiretorioPadrao: TCheckBox;
    BtnOk: TBitBtn;
    BtnCancela: TBitBtn;
    edDestino: TLabeledEdit;
    btnBuscaDestinoCopia: TBitBtn;
    pbProgresso: TProgressBar;
    btnChamaRestore: TBitBtn;
    procedure BtnOkClick(Sender: TObject);
    procedure BtnCancelaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbDiretorioPadraoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnBuscaDestinoCopiaClick(Sender: TObject);
    procedure btnChamaRestoreClick(Sender: TObject);
  private
    Abortar: Boolean;
    procedure GravaDir;
    procedure DesligaBotoes;
    procedure LigaBotoes;
    procedure Msg(Texto: string; pDelay: Cardinal);
  public
  end;

var
  frmBackup: TfrmBackup;

implementation

uses
  Funcoes, {FuncoesWin, uBackupRestore,}  VarGlobal, uutilfncs;

{$R *.DFM}

procedure TfrmBackup.FormShow(Sender: TObject);
begin
  edDestino.Text := ReadIniFile('Backup', 'Diretorio');
  cbDiretorioPadrao.Checked
    := StrToBoolDef(ReadIniFile('Backup', 'Diretorio Padrao'), False);
  cbDiretorioPadrao.OnClick(Self);
  {desconecta da base}
  //GetDataModule.Conexao.Connected := False;
end;

procedure TfrmBackup.BtnCancelaClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBackup.BtnOkClick(Sender: TObject);
var
  database_file, dir_padrao, backup_file, compact_file,
    compact_file_old, server_name: String;
 // aCopia: TBackupRestore;
  //Zip: TZip;
begin
  database_file := '';
  dir_padrao    := '';
  backup_file   := '';
  compact_file  := '';
  server_name   := '';
  //try
   // try
      DesligaBotoes;

      server_name := ReadIniFile('Conexao', 'Servidor');

      if ((server_name = '127.0.0.1') or (server_name = GetComputerName)) then
        database_file := ExtractFilePath(ParamStr(0))+'CPR.fdb'
      else
        database_file := server_name+':'+ExtractFilePath(ParamStr(0))+'CPR.fdb';

      dir_padrao := ExtractFilePath(ParamStr(0))+'Backup\';

      if cbDiretorioPadrao.Checked then
        backup_file := dir_padrao
      else
        backup_file := DiretorioComBarra(edDestino.Text);
          
      backup_file := backup_file + PChar('Copia_'+FormatDateTime('dd_mm_yyyy', Date));
      backup_file := backup_file + '.fbk';

      if not DirectoryExists(dir_padrao) then
      begin
        if not CreateDir(dir_padrao) then
        begin
          MsgErro('','N�o foi poss�vel criar o diret�rio padr�o para c�pia.');
          Abortar := True;
          LigaBotoes;
          Exit;
        end;
      end;

//      if UsuariosLogados(database_file, 'SYSDBA', 'masterkey') > 1 then
//      begin
//        MsgCuidado('Banco de dados est� sendo usado por mais de um usu�rio. '+
//          'Se o sistema estiver sendo usado em rede todas as esta��es devem ser '+
//          'desconectadas para que possa ser efetuada a c�pia.');
//        Abortar := True;
//        LigaBotoes;
//        Exit;
//      end;
      
//      aCopia := TBackupRestore.Create;
//      with aCopia do
//      try
//        aCopia.Servidor  := server_name;
//        aCopia.Usuario   := 'SYSDBA';
//        aCopia.Senha     := 'masterkey';
//        aCopia.Log       := Memo.Lines;
//        aCopia.Copia(database_file, backup_file);
//      finally
//        aCopia.Free;
//      end;

      {Zip := TZip.Create;
      with Zip do
      try
        Progress := pbProgresso;
        Log      := Memo.Lines;

        if cbDiretorioPadrao.Checked then
          compact_file := dir_padrao
        else
          compact_file := DiretorioComBarra(edDestino.Text);

        compact_file := compact_file + PChar('Copia_'+FormatDateTime('dd_mm_yyyy', Date));
        compact_file := compact_file + '.cab';

        compact_file_old := IncludeTrailingBackslash(ExtractFilePath(compact_file))+
          Copy(ExtractFileName(compact_file), 1, Pos('.', ExtractFileName(compact_file))-1)+'_antiga.cab';

        if FileExists(compact_file_old) then
          DeleteFile(compact_file_old);

        if FileExists(compact_file) then
        begin
          if MsgSN('J� existe uma c�pia de seguran�a compactada no dia de hoje, deseja sobrescreve-l�?') then
            RenameFile(compact_file, compact_file_old)
          else
          begin
            MsgAviso('A c�pia antiga ser� exclu�da.');
            DeleteFile(compact_file);
          end;
        end;

        Compactar([backup_file], compact_file);
      finally
        Zip.Free;
      end;
    except
      on e: Exception do
      begin
        Msg('ERRO.', 0);
        Msg(e.Message, 0);
        raise Exception.Create('Erro ao efetuar a c�pia.'+#13#10+e.Message);
      end;
    end;
  finally
    DeleteFile(backup_file);
    LigaBotoes;
    GravaDir;
    if not Abortar then
    begin
      Msg('------------------------------', 0);
      Msg('C�pia de seguran�a finalizada!', 0);
      MsgAviso('C�pia de seguran�a finalizada!');
    end
    else if Abortar then
    begin
      Msg('----------------------------', 0);
      Msg('C�pia N�O foi bem sucedida.', 0);
      MsgErro('C�pia N�O foi bem sucedida.');
    end;
  end;   }
end;

procedure TfrmBackup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //GetDataModule.Conexao.Connected := True;
  Sistema.Atualizar;
  Empresa.Atualizar;
  Configuracao.Atualizar;
  Global.Atualizar;
  Action := caFree;
end;

procedure TfrmBackup.GravaDir;
begin
  WriteIniFile('Backup', 'Diretorio', edDestino.Text);
  WriteIniFile('Backup', 'Diretorio Padrao', BoolToStr(cbDiretorioPadrao.Checked));
end;

procedure TfrmBackup.cbDiretorioPadraoClick(Sender: TObject);
begin
  edDestino.Enabled := not
    cbDiretorioPadrao.Checked;
end;

procedure TfrmBackup.DesligaBotoes;
begin
  BtnOk.Enabled := False;
  BtnCancela.Enabled := False;
  Screen.Cursor := crHourGlass;
  Memo.Lines.Clear;
end;

procedure TfrmBackup.LigaBotoes;
begin
  BtnOk.Enabled := True;
  BtnCancela.Enabled := True;
  Screen.Cursor := crDefault;
end;

procedure TfrmBackup.FormCreate(Sender: TObject);
begin
  SetDialogForm(Self);
  CentralizaForm(Self);
  Abortar := False;
end;

procedure TfrmBackup.btnBuscaDestinoCopiaClick(Sender: TObject);
var
  s: string;
begin
  if edDestino.Enabled then
    if SelectDirectory('Selecione a Pasta', '', s) then
      edDestino.Text := s;
end;

procedure TfrmBackup.Msg(Texto: string; pDelay: Cardinal);
begin
  //Delay(pDelay);
  Memo.Lines.Add(Texto);
end;

procedure TfrmBackup.btnChamaRestoreClick(Sender: TObject);
begin
  ChamaForm('TfrmRestore', 'Voltar uma c�pia dos dados', Self);
end;

initialization
  RegisterClass(TfrmBackup);
finalization
  UnRegisterClass(TfrmBackup);
end.
