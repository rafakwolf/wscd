unit crypto;

interface

uses Classes, md5;

function EnDeCrypt(const Value : String) : String;

implementation

function EnDeCrypt(const Value : String) : String;
begin
     Result := md5Print(md5String(Value));
end;

end.
