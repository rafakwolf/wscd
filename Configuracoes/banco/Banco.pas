unit Banco;

interface

uses
  Classes,
  DB,
  SysUtils,
  Generics.Collections,
  ormbr.types.nullable,
  ormbr.types.blob,
  dbcbr.mapping.attributes,
  dbcbr.types.mapping,
  dbcbr.mapping.register;

type
  [Entity]
  [Table('BANCO', '')]
  [PrimaryKey('IDBANCO')]
  TBanco = class
  private
    FId: Integer;
    Fnome: string;
  public
    [Column('IDBANCO', ftInteger)]
    property Id: Integer read FId write FId;
    [Column('BANCO', ftString, 80)]
    property Nome: string read Fnome write FNome;
  end;

implementation

initialization
  TRegisterClass.RegisterEntity(TBanco);

end.
