unit ContasReceber;

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
  dbcbr.types.mapping,
  ContaCaixa,
  Cliente;

type
  [Entity]
  [Table('CONTASRECEBER', '')]
  [PrimaryKey('CODIGO', NotInc, NoSort, False, 'Chave primária')]
  [Sequence('GENCONTARECEBER')]
  TCONTASRECEBER = class
  private
    FCODIGO: Integer;
    FDATA: Nullable<TDateTime>;
    FVENCIMENTO: Nullable<TDateTime>;
    FCLIENTEId: Nullable<Integer>;
    FDESCRICAO: Nullable<String>;
    FDOCUMENTO: Nullable<String>;
    FVALOR: Nullable<Double>;
    FJURO: Nullable<Double>;
    FRECEBER: Nullable<String>;
    FRECDA: Nullable<String>;
    FDATARECTO: Nullable<TDateTime>;
    FORIGEM: Nullable<Integer>;
    FVENDA: Nullable<Integer>;
    FCAPITALRECDO: Nullable<Double>;
    FJURORECDO: Nullable<Double>;
    FDESCTO: Nullable<Double>;
    FOBS: TBlob;
    FIDCONTA: Nullable<Integer>;
    FATRASO: Nullable<Integer>;

    FContaCAIXA:  TContaCAIXA;
    FCLIENTE:  TCLIENTE;
  public
    constructor Create;
    destructor Destroy; override;
    [Restrictions([NotNull])]
    [Column('CODIGO', ftInteger)]
    [Dictionary('CODIGO', 'Mensagem de validação', '', '', '', taCenter)]
    property CODIGO: Integer read FCODIGO write FCODIGO;

    [Column('DATA', ftDateTime)]
    [Dictionary('DATA', 'Mensagem de validação', '', '', '', taCenter)]
    property DATA: Nullable<TDateTime> read FDATA write FDATA;

    [Column('VENCIMENTO', ftDateTime)]
    [Dictionary('VENCIMENTO', 'Mensagem de validação', '', '', '', taCenter)]
    property VENCIMENTO: Nullable<TDateTime> read FVENCIMENTO write FVENCIMENTO;

    [Column('CLIENTE', ftInteger)]
    [ForeignKey('FK_CONTASRECEBER_CLIENTE', 'CLIENTE', 'CLIENTES', 'CODCLIENTE', SetNull, SetNull)]
    [Dictionary('CLIENTE', 'Mensagem de validação', '', '', '', taCenter)]
    property CLIENTEId: Nullable<Integer> read FCLIENTEId write FCLIENTEId;

    [Column('DESCRICAO', ftString, 80)]
    [Dictionary('DESCRICAO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property DESCRICAO: Nullable<String> read FDESCRICAO write FDESCRICAO;

    [Column('DOCUMENTO', ftString, 20)]
    [Dictionary('DOCUMENTO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property DOCUMENTO: Nullable<String> read FDOCUMENTO write FDOCUMENTO;

    [Column('VALOR', ftBCD, 18, 4)]
    [Dictionary('VALOR', 'Mensagem de validação', '0', '', '', taRightJustify)]
    property VALOR: Nullable<Double> read FVALOR write FVALOR;

    [Column('JURO', ftBCD, 18, 4)]
    [Dictionary('JURO', 'Mensagem de validação', '0', '', '', taRightJustify)]
    property JURO: Nullable<Double> read FJURO write FJURO;

    [Column('RECEBER', ftString, 1)]
    [Dictionary('RECEBER', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property RECEBER: Nullable<String> read FRECEBER write FRECEBER;

    [Column('RECDA', ftString, 1)]
    [Dictionary('RECDA', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property RECDA: Nullable<String> read FRECDA write FRECDA;

    [Column('DATARECTO', ftDateTime)]
    [Dictionary('DATARECTO', 'Mensagem de validação', '', '', '', taCenter)]
    property DATARECTO: Nullable<TDateTime> read FDATARECTO write FDATARECTO;

    [Column('ORIGEM', ftInteger)]
    [Dictionary('ORIGEM', 'Mensagem de validação', '', '', '', taCenter)]
    property ORIGEM: Nullable<Integer> read FORIGEM write FORIGEM;

    [Column('VENDA', ftInteger)]
    [Dictionary('VENDA', 'Mensagem de validação', '', '', '', taCenter)]
    property VENDA: Nullable<Integer> read FVENDA write FVENDA;

    [Column('CAPITALRECDO', ftBCD, 18, 4)]
    [Dictionary('CAPITALRECDO', 'Mensagem de validação', '0', '', '', taRightJustify)]
    property CAPITALRECDO: Nullable<Double> read FCAPITALRECDO write FCAPITALRECDO;

    [Column('JURORECDO', ftBCD, 18, 4)]
    [Dictionary('JURORECDO', 'Mensagem de validação', '0', '', '', taRightJustify)]
    property JURORECDO: Nullable<Double> read FJURORECDO write FJURORECDO;

    [Column('DESCTO', ftBCD, 18, 4)]
    [Dictionary('DESCTO', 'Mensagem de validação', '0', '', '', taRightJustify)]
    property DESCTO: Nullable<Double> read FDESCTO write FDESCTO;

    [Column('OBS', ftBlob)]
    [Dictionary('OBS', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property OBS: TBlob read FOBS write FOBS;

    [Column('IDCONTA', ftInteger)]
    [ForeignKey('FK_CONTASRECEBER_CONTA', 'IDCONTA', 'CAIXAS', 'CODIGO', SetNull, SetNull)]
    [Dictionary('IDCONTA', 'Mensagem de validação', '', '', '', taCenter)]
    property IDCONTA: Nullable<Integer> read FIDCONTA write FIDCONTA;

    [Column('ATRASO', ftInteger)]
    [Dictionary('ATRASO', 'Mensagem de validação', '', '', '', taCenter)]
    property ATRASO: Nullable<Integer> read FATRASO write FATRASO;




    [Association(OneToOne,'IDCONTA','CAIXAS','CODIGO')]
    property ContaCAIXA: TContaCAIXA read FContaCAIXA write FContaCAIXA;

    [Association(OneToOne,'CLIENTE','CLIENTES','CODCLIENTE')]
    property CLIENTE: TCLIENTE read FCLIENTE write FCLIENTE;

  end;

implementation

constructor TCONTASRECEBER.Create;
begin
  FContaCAIXA := TContaCAIXA.Create;
  FCLIENTE := TCLIENTE.Create;
end;

destructor TCONTASRECEBER.Destroy;
begin
  if Assigned(FContaCAIXA) then
    FContaCAIXA.Free;

  if Assigned(FCLIENTE) then
    FCLIENTE.Free;

  inherited;
end;

initialization
  TRegisterClass.RegisterEntity(TCONTASRECEBER)

end.

