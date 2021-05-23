unit Vendedor;

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
  [Table('VENDEDOR', '')]
  [PrimaryKey('IDVENDEDOR', NotInc, NoSort, False, 'Chave primária')]
  TVendedor = class
  private
    FIDVENDEDOR: Integer;
    FVENDEDOR: Nullable<String>;
    FATIVO: Nullable<String>;
  public
    [Restrictions([NotNull])]
    [Column('IDVENDEDOR', ftInteger)]
    [Dictionary('IDVENDEDOR', 'Mensagem de validação', '', '', '', taCenter)]
    property IDVENDEDOR: Integer read FIDVENDEDOR write FIDVENDEDOR;

    [Column('VENDEDOR', ftString, 80)]
    [Dictionary('VENDEDOR', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property VENDEDOR: Nullable<String> read FVENDEDOR write FVENDEDOR;

    [Column('ATIVO', ftString, 1)]
    [Dictionary('ATIVO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property ATIVO: Nullable<String> read FATIVO write FATIVO;
  end;

implementation

initialization
  TRegisterClass.RegisterEntity(TVendedor)

end.

