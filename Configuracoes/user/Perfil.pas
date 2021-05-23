unit Perfil;

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
  [Table('PERFIL', '')]
  [PrimaryKey('IDPERFIL', NotInc, NoSort, False, 'Chave primária')]
  [Sequence('GENPERFIL')]
  TPerfil = class
  private
    FIDPERFIL: Integer;
    FPERFIL: Nullable<String>;
  public
    [Restrictions([NotNull])]
    [Column('IDPERFIL', ftInteger)]
    [Dictionary('IDPERFIL', 'Mensagem de validação', '', '', '', taCenter)]
    property IDPERFIL: Integer read FIDPERFIL write FIDPERFIL;

    [Column('PERFIL', ftString, 80)]
    [Dictionary('PERFIL', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property PERFIL: Nullable<String> read FPERFIL write FPERFIL;
  end;

implementation

initialization
  TRegisterClass.RegisterEntity(TPerfil)

end.

