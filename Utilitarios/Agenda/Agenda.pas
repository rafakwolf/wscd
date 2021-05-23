unit Agenda;

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
  [Table('AGENDA', '')]
  [PrimaryKey('IDAGENDA', NotInc, NoSort, False, 'Chave primária')]
  [Sequence('GENAGENDA')]
  TAgenda = class
  private
    FIDAGENDA: Integer;
    FNOME: Nullable<String>;
    FTELEFONE: Nullable<String>;
    FTELEFONE2: Nullable<String>;
    FTELEFONE3: Nullable<String>;
    FFAX: Nullable<String>;
    FOBS: TBlob;
  public
    [Restrictions([NotNull])]
    [Column('IDAGENDA', ftInteger)]
    [Dictionary('IDAGENDA', 'Mensagem de validação', '', '', '', taCenter)]
    property IDAGENDA: Integer read FIDAGENDA write FIDAGENDA;

    [Column('NOME', ftString, 80)]
    [Dictionary('NOME', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property NOME: Nullable<String> read FNOME write FNOME;

    [Column('TELEFONE', ftString, 20)]
    [Dictionary('TELEFONE', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property TELEFONE: Nullable<String> read FTELEFONE write FTELEFONE;

    [Column('TELEFONE2', ftString, 20)]
    [Dictionary('TELEFONE2', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property TELEFONE2: Nullable<String> read FTELEFONE2 write FTELEFONE2;

    [Column('TELEFONE3', ftString, 20)]
    [Dictionary('TELEFONE3', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property TELEFONE3: Nullable<String> read FTELEFONE3 write FTELEFONE3;

    [Column('FAX', ftString, 20)]
    [Dictionary('FAX', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property FAX: Nullable<String> read FFAX write FFAX;

    [Column('OBS', ftBlob)]
    [Dictionary('OBS', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property OBS: TBlob read FOBS write FOBS;
  end;

implementation

initialization
  TRegisterClass.RegisterEntity(TAgenda)

end.

