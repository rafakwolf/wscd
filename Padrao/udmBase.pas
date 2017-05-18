unit udmBase;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.SqlExpr;

type
  TdmBase = class(TDataModule)
    Conexao: TSQLConnection;
  private
  protected
      function ConectaBanco: Boolean; virtual;
  public
  end;

var
  dmBase: TdmBase;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TdmBase.ConectaBanco: Boolean;
begin
 raise Exception.Create('método não implemantado');
end;

end.
