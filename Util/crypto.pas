unit crypto;

interface

uses Classes;

function EnDeCrypt(const Value : String) : String;

implementation

function EnDeCrypt(const Value : String) : String;
var
  CharIndex : integer;
begin
  Result := Value;
  for CharIndex := 1 to Length(Value) do
    Result[CharIndex] := chr(not(ord(Value[CharIndex])));
end;

end.
