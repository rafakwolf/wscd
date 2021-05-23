unit Fornecedor;

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
  dbcbr.mapping.register,
  Cidades;

type
  [Entity]
  [Table('FORNECEDORES', '')]
  [PrimaryKey('CODFORNECEDOR', NotInc, NoSort, False, 'Chave primária')]
  [Sequence('GENFORNECEDOR')]
  TFornecedor = class
  private
    FCODFORNECEDOR: Integer;
    FFANTAZIA: Nullable<String>;
    FRAZAOSOCIAL: Nullable<String>;
    FDATACAD: Nullable<TDateTime>;
    FENDERECO: Nullable<String>;
    FCIDADE: Nullable<Integer>;
    FBAIRRO: Nullable<String>;
    FCNPJ: Nullable<String>;
    FIE: Nullable<String>;
    FCEP: Nullable<String>;
    FTELEFONE: Nullable<String>;
    FFAX: Nullable<String>;
    FEMAIL: Nullable<String>;
    FUF: Nullable<String>;
    FOBS: TBlob;
    FVENDEDOR: Nullable<String>;
    FTELEFONEVENDEDOR: Nullable<String>;
    FEMAILVENDEDOR: Nullable<String>;
    FTIPO: Nullable<String>;

    FCIDADES:  TCIDADES  ;
  public
    constructor Create;
    destructor Destroy; override;
    [Restrictions([NotNull])]
    [Column('CODFORNECEDOR', ftInteger)]
    [Dictionary('CODFORNECEDOR', 'Mensagem de validação', '', '', '', taCenter)]
    property CODFORNECEDOR: Integer read FCODFORNECEDOR write FCODFORNECEDOR;

    [Column('FANTAZIA', ftString, 80)]
    [Dictionary('FANTAZIA', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property FANTAZIA: Nullable<String> read FFANTAZIA write FFANTAZIA;

    [Column('RAZAOSOCIAL', ftString, 80)]
    [Dictionary('RAZAOSOCIAL', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property RAZAOSOCIAL: Nullable<String> read FRAZAOSOCIAL write FRAZAOSOCIAL;

    [Column('DATACAD', ftDateTime)]
    [Dictionary('DATACAD', 'Mensagem de validação', '', '', '', taCenter)]
    property DATACAD: Nullable<TDateTime> read FDATACAD write FDATACAD;

    [Column('ENDERECO', ftString, 80)]
    [Dictionary('ENDERECO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property ENDERECO: Nullable<String> read FENDERECO write FENDERECO;

    [Column('CIDADE', ftInteger)]
    [ForeignKey('FK_FORNECEDORES_CIDADE', 'CIDADE', 'CIDADES', 'CODCIDADE', SetNull, SetNull)]
    [Dictionary('CIDADE', 'Mensagem de validação', '', '', '', taCenter)]
    property CIDADE: Nullable<Integer> read FCIDADE write FCIDADE;

    [Column('BAIRRO', ftString, 80)]
    [Dictionary('BAIRRO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property BAIRRO: Nullable<String> read FBAIRRO write FBAIRRO;

    [Column('CNPJ', ftString, 20)]
    [Dictionary('CNPJ', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property CNPJ: Nullable<String> read FCNPJ write FCNPJ;

    [Column('IE', ftString, 20)]
    [Dictionary('IE', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property IE: Nullable<String> read FIE write FIE;

    [Column('CEP', ftString, 10)]
    [Dictionary('CEP', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property CEP: Nullable<String> read FCEP write FCEP;

    [Column('TELEFONE', ftString, 20)]
    [Dictionary('TELEFONE', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property TELEFONE: Nullable<String> read FTELEFONE write FTELEFONE;

    [Column('FAX', ftString, 20)]
    [Dictionary('FAX', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property FAX: Nullable<String> read FFAX write FFAX;

    [Column('EMAIL', ftString, 80)]
    [Dictionary('EMAIL', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property EMAIL: Nullable<String> read FEMAIL write FEMAIL;

    [Column('UF', ftString, 2)]
    [Dictionary('UF', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property UF: Nullable<String> read FUF write FUF;

    [Column('OBS', ftBlob)]
    [Dictionary('OBS', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property OBS: TBlob read FOBS write FOBS;

    [Column('VENDEDOR', ftString, 80)]
    [Dictionary('VENDEDOR', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property VENDEDOR: Nullable<String> read FVENDEDOR write FVENDEDOR;

    [Column('TELEFONEVENDEDOR', ftString, 20)]
    [Dictionary('TELEFONEVENDEDOR', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property TELEFONEVENDEDOR: Nullable<String> read FTELEFONEVENDEDOR write FTELEFONEVENDEDOR;

    [Column('EMAILVENDEDOR', ftString, 80)]
    [Dictionary('EMAILVENDEDOR', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property EMAILVENDEDOR: Nullable<String> read FEMAILVENDEDOR write FEMAILVENDEDOR;

    [Column('TIPO', ftString, 1)]
    [Dictionary('TIPO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property TIPO: Nullable<String> read FTIPO write FTIPO;

    [Association(OneToOne,'CIDADE','CIDADES','CODCIDADE')]
    property CIDADES: TCIDADES read FCIDADES write FCIDADES;

  end;

implementation

constructor TFornecedor.Create;
begin
  FCIDADES := TCIDADES.Create;
end;

destructor TFornecedor.Destroy;
begin
  if Assigned(FCIDADES) then
    FCIDADES.Free;

  inherited;
end;

initialization
  TRegisterClass.RegisterEntity(TFornecedor)

end.

