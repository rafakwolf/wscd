unit MainModule;

interface

uses
  uniGUIMainModule, SysUtils, Classes, unDmPrincipal, uniLogger;

type
  TUniMainModule = class(TUniGUIMainModule)
    procedure UniGUIMainModuleBeforeLogin(Sender: TObject;
      var Handled: Boolean);
    procedure UniGUIMainModuleDestroy(Sender: TObject);
  private
  public
  end;

function UniMainModule: TUniMainModule;

implementation

{$R *.dfm}

uses
  UniGUIVars, ServerModule, uniGUIApplication;

function UniMainModule: TUniMainModule;
begin
  Result := TUniMainModule(UniApplication.UniMainModule)
end;

procedure TUniMainModule.UniGUIMainModuleBeforeLogin(Sender: TObject;
  var Handled: Boolean);
begin
  DmPrincipal := TDmPrincipal.Create(UniApplication);
end;

procedure TUniMainModule.UniGUIMainModuleDestroy(Sender: TObject);
begin
  if Assigned(DmPrincipal) then
    DmPrincipal.Free;
end;

initialization
  RegisterMainModuleClass(TUniMainModule);
end.
