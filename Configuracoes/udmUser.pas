unit udmUser;

interface

uses
  System.SysUtils, System.Classes, udmGeralBase, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, System.json;

type
  TdmUser = class(TdmGeralBase)
  private
    { Private declarations }
  public
    function Add(data: TJSONObject): TJSONObject; override;
    function Update(id: Integer; data: TJSONObject): TJSONObject; override;
    procedure Delete(id: Integer); override;
    function GetAll(): TJSONArray; override;
    function GetById(id: Integer): TJSONObject; override;
  end;

var
  dmUser: TdmUser;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmUser }

function TdmUser.Add(data: TJSONObject): TJSONObject;
begin

end;

procedure TdmUser.Delete(id: Integer);
begin
  inherited;

end;

function TdmUser.GetAll: TJSONArray;
begin

end;

function TdmUser.GetById(id: Integer): TJSONObject;
begin

end;

function TdmUser.Update(id: Integer; data: TJSONObject): TJSONObject;
begin

end;

end.
