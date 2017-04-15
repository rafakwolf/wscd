unit udmBase;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.SqlExpr;

type
  TdmBase = class(TDataModule)
    Conexao: TSQLConnection;
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
