unit udmBase;

interface

uses
  System.SysUtils, System.Classes, ZAbstractConnection,
  ZConnection;

type
  TdmBase = class(TDataModule)
    dbConn: TZConnection;
  private
    { Private declarations }
  protected
      function ConectaBanco: Boolean; virtual;
  public
    { Public declarations }
  end;

var
  dmBase: TdmBase;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmBase }

function TdmBase.ConectaBanco: Boolean;
begin
 raise Exception.Create('método não implemantado');
end;

end.
