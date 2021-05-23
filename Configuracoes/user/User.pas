unit User;

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
  [Table('USUARIOS', '')]
  [PrimaryKey('IDUSUARIOS', '')]
  [Sequence('GENUSUARIO')]
  TUser = class
  private
    FId: Integer;
    FSenha: string;
    FLogin: string;
    FNome: string;
  public
    [Restrictions([NoUpdate])]
    [Column('IDUSUARIOS', ftInteger)]
    property Id: Integer read FId write FId;

    [Column('NOME', ftString, 80)]
    property Nome: string read FNome write FNome;

    [Column('LOGIN', ftString, 10)]
    property Login: string read FLogin write FLogin;

    [Column('SENHA', ftString, 10)]
    property Senha: string read FSenha write FSenha;
  end;

implementation

initialization
  TRegisterClass.RegisterEntity(TUser);

end.
