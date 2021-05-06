unit baseModel;

{$mode delphi}

interface

uses
  Classes, SysUtils;

type

  { TBaseModel }

  TBaseModel = class
  private
    FId: string;
    public
      property Id: string read FId write FId;
  end;

implementation

end.

