unit Cidades;

interface

uses
  DB,
  Classes,
  SysUtils,
  Generics.Collections,
  ormbr.types.nullable,
  ormbr.types.blob,
  dbcbr.mapping.attributes,
  dbcbr.types.mapping,
  dbcbr.mapping.register;

type
  [Entity]
  [Table('CIDADES', '')]
  [PrimaryKey('CODCIDADE', NotInc, NoSort, False, 'Chave prim�ria')]
  [Sequence('GENCIDADES')]
  TCidades = class
  private
    FCODCIDADE: Integer;
    FDESCRICAO: Nullable<String>;
  public
    [Restrictions([NotNull])]
    [Column('CODCIDADE', ftInteger)]
    [Dictionary('CODCIDADE', 'Mensagem de valida��o', '', '', '', taCenter)]
    property CODCIDADE: Integer read FCODCIDADE write FCODCIDADE;

    [Column('DESCRICAO', ftString, 80)]
    [Dictionary('DESCRICAO', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property DESCRICAO: Nullable<String> read FDESCRICAO write FDESCRICAO;
  end;

implementation

initialization
  TRegisterClass.RegisterEntity(TCidades)

end.

