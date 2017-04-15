unit unExecutaScript;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons,  FileCtrl, uutilfncs;

type
  TConnectErrorCallbackFunc      = function (AErrorMessage : PChar) : Integer;  stdcall;
  TScriptErrorCallbackFunc       = function (AStmtText, AErrMessage : PChar) : Integer; stdcall;
  TScriptBeforeExecStatementFunc = function (AStmtText, AText : PChar) : Integer; stdcall;
  TScriptAfterExecStatementFunc  = function (AStmtText : PChar; Success : Integer) : Integer; stdcall;

  TExecuteScriptProc = procedure (AScriptFile : PChar;
                                  AErrorCallbackFunc : TScriptErrorCallbackFunc;
                                  ABeforeCallbackFunc : TScriptBeforeExecStatementFunc;
                                  AAfterCallbackFunc : TScriptAfterExecStatementFunc); stdcall;

  TConnectDBProc = function (AConnectParams : PChar;
                             AConnectErrorCallbacFunc : TConnectErrorCallbackFunc) : Integer; stdcall;

  TfrmExecutaScript = class(TForm)
    edtScript: TEdit;
    btnBuscaScript: TBitBtn;
    rgTipo: TRadioGroup;
    btnExecutar: TBitBtn;
    btnFechar: TBitBtn;
    odScript: TOpenDialog;
    mmoLog: TMemo;
    chkSalvaLog: TCheckBox;
    procedure rgTipoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBuscaScriptClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnExecutarClick(Sender: TObject);
    procedure edtScriptChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    DLL: THandle;
    FScriptText: string;
    
    function MyLoadLibrary: THandle;
    procedure MyFreeLibrary;

    function ExecuteScript(Path: string; ShowMessages: Boolean = True): Boolean;
    procedure SalvaLog;
    procedure SetScriptText(const Value: string);
  public
    property ScriptText: string read FScriptText write SetScriptText;
    procedure Execute(ShowMessages : Boolean = True);
  end;

  function HandleError(AStmtText, AErrMessage : PChar) : Integer; stdcall;
  function BeforeExec(AStmtText, AText : PChar) : Integer; stdcall;
  function AfterExec(AStmtText : PChar; Success : Integer) : Integer; stdcall;
  function CEH(AErrorMessage : PChar) : Integer;  stdcall;

var
  frmExecutaScript: TfrmExecutaScript;
  StmtCount       : Integer;
  ErrCount        : Integer;

implementation

uses Funcoes;

{$R *.dfm}

function HandleError(AStmtText, AErrMessage : PChar) : Integer; stdcall;
begin
  Result := 0;
  Inc(ErrCount);
  if (frmExecutaScript <> nil) and (frmExecutaScript.Visible) then
  begin
    frmExecutaScript.mmoLog.Lines.Add('------- STATEMENT --------');
    frmExecutaScript.mmoLog.Lines.Add(AStmtText);
    frmExecutaScript.mmoLog.Lines.Add('-------   ERROR   --------');
    frmExecutaScript.mmoLog.Lines.Add(AErrMessage);
  end;
end;

function BeforeExec(AStmtText, AText : PChar) : Integer; stdcall;
begin
  Result := 0;
  if (frmExecutaScript <> nil) and (frmExecutaScript.Visible) then
    frmExecutaScript.mmoLog.Lines.Add(AText);
end;

function AfterExec(AStmtText : PChar; Success : Integer) : Integer; stdcall;
begin
  Result := 0;
  if Success = 1 then
    Inc(StmtCount)
  else
    Result := 1;
end;

function CEH(AErrorMessage : PChar) : Integer;  stdcall;
begin
  ShowMessage(AErrorMessage);
end;

procedure TfrmExecutaScript.rgTipoClick(Sender: TObject);
begin
  case rgTipo.ItemIndex of
    0:
    begin
      //edtScript.EditLabel.Caption := 'Script:';
      btnBuscaScript.Caption      := '&Script';
    end;
    1:
    begin
      //edtScript.EditLabel.Caption := 'Pasta:';
      btnBuscaScript.Caption      := '&Pasta';
    end;
  end;  
end;

procedure TfrmExecutaScript.FormShow(Sender: TObject);
begin
  rgTipoClick(nil);
  edtScriptChange(nil);
  CentralizaForm(Self);
end;

procedure TfrmExecutaScript.btnBuscaScriptClick(Sender: TObject);
var
  dir: string;
begin
  case rgTipo.ItemIndex of
    0:
    begin
      if odScript.Execute then
        edtScript.Text := odScript.FileName;
    end;
    1:
    begin
      if SelectDirectory('Pasta dos scripts','',dir) then
        edtScript.Text := dir;
    end;
  end;  
end;

procedure TfrmExecutaScript.btnFecharClick(Sender: TObject);
begin
  Close;
end;

function TfrmExecutaScript.ExecuteScript(Path: string; ShowMessages: Boolean): Boolean;
var
  //Hndl   : THandle;
  ESP    : TExecuteScriptProc;
  CP     : TConnectDBProc;
  s      : string;
  Res    : Integer;
  script : TStringList;
begin
  Result := True;
  ErrCount  := 0;
  StmtCount := 0;

  // Tratamento para qndo chama a execução externa.
  if Path <> '' then
  begin
    script := TStringList.Create;
    script.LoadFromFile(Path);
    s := Script.Text;
  end
  else
    s := ScriptText;  
  
  if Trim(s) = '' then
  begin
    if ShowMessages then
      ShowMessage('Script inválido.');
      
    Exit;
  end;

  try
    //Hndl := LoadLibrary(PChar('IBEScript.dll'));
    if (DLL > HINSTANCE_ERROR) then
    begin
      ESP := GetProcAddress(DLL, 'ExecScriptText');
      CP  := GetProcAddress(DLL, 'Connect');

      if (@ESP <> nil) and (@CP <> nil) then
      begin
        Res := CP(PChar('db_name=localhost:CPR; password=masterkey; user_name=SYSDBA;' +
                        'lc_ctype=; sql_role_name=; sql_dialect=3;' +
                        'clientlib="'+SysWinDir+'\System32\fbclient.dll'+'"'), @CEH);
        if Res = 0 then
          ESP(PChar(s), @HandleError, @BeforeExec, @AfterExec)
        else
          Result := False;
      end;
    end
    else
      Result := False;
  finally
    if Assigned(script) then
      script.Free;

    if ShowMessages then
      MsgAviso('','Script '+ExtractFileName(Path)+' executado com sucesso!');
  end;
end;

procedure TfrmExecutaScript.btnExecutarClick(Sender: TObject);
begin
  Execute(false);
end;

procedure TfrmExecutaScript.Execute(ShowMessages : Boolean);
var
  i: Integer;
  scripts: TStringList;
begin
  mmoLog.Lines.Clear;
  if (pos('.sql', edtScript.Text) = 0) and (edtScript.Text <> '') then // scripts da pasta
  begin
    try
      scripts := TStringList.Create;
      scripts.Assign(GetFileList(edtScript.Text,'*.sql', True));

      for i := 0 to scripts.Count-1 do
        ExecuteScript(scripts[i], ShowMessages);
    finally
      scripts.Free;
    end;
  end
  else // um script
    ExecuteScript(edtScript.Text, ShowMessages);
end;

procedure TfrmExecutaScript.edtScriptChange(Sender: TObject);
begin
  btnExecutar.Enabled := edtScript.Text <> '';
end;

procedure TfrmExecutaScript.SalvaLog;
var
  LogFile: TStringList;
begin
  LogFile := TStringList.Create;

  if FileExists(ExtractFilePath(ParamStr(0))+'LogScriptExec.log') then
  begin
    LogFile.LoadFromFile(ExtractFilePath(ParamStr(0))+'LogScriptExec.log');
    LogFile.Append('-------------------------------------------------');
  end;
  
  LogFile.Append(mmoLog.Lines.Text);

  LogFile.SaveToFile(ExtractFilePath(ParamStr(0))+'LogScriptExec.log');

  LogFile.Free;
end;

procedure TfrmExecutaScript.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if chkSalvaLog.Checked then
    SalvaLog;
end;

procedure TfrmExecutaScript.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  MyFreeLibrary;
  Action := caFree;
end;

procedure TfrmExecutaScript.MyFreeLibrary;
begin
  FreeLibrary(DLL);
end;

function TfrmExecutaScript.MyLoadLibrary: THandle;
var
  Hnd: THandle;
begin
  Hnd := LoadLibrary(PChar('IBEScript.dll'));

  if (Hnd > HINSTANCE_ERROR) then
    Result := Hnd;
end;

procedure TfrmExecutaScript.FormCreate(Sender: TObject);
begin
  DLL := MyLoadLibrary;
end;

procedure TfrmExecutaScript.SetScriptText(const Value: string);
begin
  FScriptText := Value;
end;

end.
