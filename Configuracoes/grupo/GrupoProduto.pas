unit GrupoProduto;

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
  [Table('GRUPOS', '')]
  [PrimaryKey('CODGRUPO', NotInc, NoSort, False, 'Chave primária')]
  [Sequence('GENGRUPOS')]
  TGrupoProduto = class
  private
    FCODGRUPO: Integer;
    FDESCRICAO: Nullable<String>;
  public
    [Restrictions([NotNull])]
    [Column('CODGRUPO', ftInteger)]
    [Dictionary('CODGRUPO', 'Mensagem de validação', '', '', '', taCenter)]
    property CODGRUPO: Integer read FCODGRUPO write FCODGRUPO;

    [Column('DESCRICAO', ftString, 80)]
    [Dictionary('DESCRICAO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property DESCRICAO: Nullable<String> read FDESCRICAO write FDESCRICAO;
  end;

implementation

initialization
  TRegisterClass.RegisterEntity(TGrupoProduto)

end.

