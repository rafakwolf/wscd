unit udmBase;

interface

uses
  sysutils, Classes, db, mysql57conn;

type
  TdmBase = class(TDataModule)
    Conexao: TMySql57Connection;
  private
  protected
      function ConectaBanco: Boolean; virtual;
  public
  end;

var
  dmBase: TdmBase;

implementation

{$R *.dfm}

function TdmBase.ConectaBanco: Boolean;
begin
 raise Exception.Create('método não implemantado');
end;

end.
