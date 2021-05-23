unit ContaCaixa;

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
  [Table('CAIXAS', '')]
  [PrimaryKey('CODIGO')]
  [Sequence('GENCAIXAS')]
  TContaCaixa = class
  private
    FId: Integer;
    Fnome: string;
    FInativo: String;
  public
    [Column('CODIGO', ftInteger)]
    property Id: Integer read FId write FId;

    [Column('NOME', ftString, 80)]
    property Nome: string read Fnome write FNome;

    [Column('INATIVO', ftString, 1)]
    property Inativo: String read FInativo write FInativo;
  end;

implementation

initialization
  TRegisterClass.RegisterEntity(TContaCaixa);

end.

