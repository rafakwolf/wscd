unit Caixa;

interface

uses
  DB,
  Classes,
  SysUtils,
  Generics.Collections,
  ormbr.types.blob,
  ormbr.types.lazy,
  ormbr.types.nullable,
  dbcbr.mapping.register,
  dbcbr.mapping.attributes,
  dbcbr.types.mapping, ContaCaixa;

type
  [Entity]
  [Table('CAIXA', '')]
  [PrimaryKey('CODCAIXA', NotInc, NoSort, False, 'Chave primária')]
  TCAIXA = class
  private
    FCODCAIXA: Integer;
    FCODContaCAIXA: Integer;
    FDATA: Nullable<TDateTime>;
    FDESCRICAO: Nullable<String>;
    FDOCUMENTO: Nullable<String>;
    FTIPO: Nullable<String>;
    FVALOR: Nullable<Double>;
    FEXCLUIR: Nullable<String>;

    FContaCAIXA:  TContaCAIXA;
  public
    constructor Create;
    destructor Destroy; override;

    [Restrictions([NotNull])]
    [Column('CODCAIXA', ftInteger)]
    [Dictionary('CODCAIXA', 'Mensagem de validação', '', '', '', taCenter)]
    property CODCAIXA: Integer read FCODCAIXA write FCODCAIXA;

    [Restrictions([NotNull])]
    [Column('CODCAIXAS', ftInteger)]
    [ForeignKey('FK_CAIXA_CAIXAS', 'CODCAIXAS', 'CAIXAS', 'CODIGO', SetDefault, SetDefault)]
    [Dictionary('CODCAIXAS', 'Mensagem de validação', '', '', '', taCenter)]
    property CODContaCAIXA: Integer read FCODContaCAIXA write FCODContaCAIXA;

    [Column('DATA', ftDateTime)]
    [Dictionary('DATA', 'Mensagem de validação', '', '', '', taCenter)]
    property DATA: Nullable<TDateTime> read FDATA write FDATA;

    [Column('DESCRICAO', ftString, 80)]
    [Dictionary('DESCRICAO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property DESCRICAO: Nullable<String> read FDESCRICAO write FDESCRICAO;

    [Column('DOCUMENTO', ftString, 20)]
    [Dictionary('DOCUMENTO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property DOCUMENTO: Nullable<String> read FDOCUMENTO write FDOCUMENTO;

    [Column('TIPO', ftString, 1)]
    [Dictionary('TIPO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property TIPO: Nullable<String> read FTIPO write FTIPO;

    [Column('VALOR', ftBCD, 18, 4)]
    [Dictionary('VALOR', 'Mensagem de validação', '0', '', '', taRightJustify)]
    property VALOR: Nullable<Double> read FVALOR write FVALOR;

    [Column('EXCLUIR', ftString, 1)]
    [Dictionary('EXCLUIR', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property EXCLUIR: Nullable<String> read FEXCLUIR write FEXCLUIR;

    [Association(OneToOne,'CODCAIXAS','CAIXAS','CODIGO')]
    property ContaCAIXA: TContaCAIXA read FContaCaixa write FContaCaixa;

  end;

implementation

constructor TCAIXA.Create;
begin
  FContaCaixa := TContaCAIXA.Create;
end;

destructor TCAIXA.Destroy;
begin
  if Assigned(FContaCaixa) then
    FContaCaixa.Free;

  inherited;
end;

initialization
  TRegisterClass.RegisterEntity(TCAIXA)

end.

