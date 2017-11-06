unit ServerModule;

interface

uses
  Classes, SysUtils, uniGUIServer, uniGUIMainModule, uniGUIApplication, uIdCustomHTTPServer,
  uniGUITypes;

type
  TUniServerModule = class(TUniGUIServerModule)
    procedure UniGUIServerModuleCreate(Sender: TObject);
  private
  protected
    procedure FirstInit; override;
  public
  end;

function UniServerModule: TUniServerModule;

implementation

{$R *.dfm}

uses
  UniGUIVars, Winapi.ShellAPI, Winapi.Windows;

function UniServerModule: TUniServerModule;
begin
  Result:=TUniServerModule(UniGUIServerInstance);
end;

procedure TUniServerModule.FirstInit;
begin
  InitServerModule(Self);
end;

procedure TUniServerModule.UniGUIServerModuleCreate(Sender: TObject);
begin
  PFmtSettings.CurrencyString := 'R$';
  PFmtSettings.DateSeparator := '/';
  PFmtSettings.ShortDateFormat := 'dd/mm/yyyy';

  MimeTable.AddMimeType('woff', 'application/font', False);
  MimeTable.AddMimeType('woff2', 'application/font', False);
  MimeTable.AddMimeType('ttf', 'application/font', False);

  if DebugMode then
    ShellExecute(0, 'open', 'http://localhost:8077', nil, nil,SW_SHOWNORMAL);
end;

initialization
  RegisterServerModuleClass(TUniServerModule);
end.
