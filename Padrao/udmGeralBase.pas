unit udmGeralBase;

interface

uses
  System.SysUtils, System.Classes, ZConnection, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, System.JSON;

type
  TdmGeralBase = class(TDataModule)
    zqDefault: TZQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
  protected
    function GetConnection: TZConnection; virtual;
    function GetFieldList: TStrings; virtual;
    function GetIdField: string;
  public
    function Add(data: TJSONObject): TJSONObject; virtual;
    function Update(id: Integer; data: TJSONObject): TJSONObject; virtual;
    procedure Delete(id: Integer); virtual;
    function GetAll(): TJSONArray; virtual;
    function GetById(id: Integer): TJSONObject; virtual;
  end;

var
  dmGeralBase: TdmGeralBase;

implementation
uses VarGlobal, unDmPrincipal;

{$R *.dfm}

function TdmGeralBase.Add(data: TJSONObject): TJSONObject;
begin
   zqDefault.Close;
   zqDefault.SQL.Clear;




end;

procedure TdmGeralBase.DataModuleCreate(Sender: TObject);
begin
  zqDefault.Connection := self.GetConnection;
end;

procedure TdmGeralBase.Delete(id: Integer);
begin

end;

function TdmGeralBase.GetAll: TJSONArray;
begin

end;

function TdmGeralBase.GetById(id: Integer): TJSONObject;
begin

end;

function TdmGeralBase.GetConnection: TZConnection;
begin
  Result := VarGlobal.GetConnection;
end;

function TdmGeralBase.GetFieldList: TStrings;
begin
end;

function TdmGeralBase.GetIdField: string;
begin
  Result := 'ID';
end;

function TdmGeralBase.Update(id: Integer; data: TJSONObject): TJSONObject;
begin

end;

end.
