unit ContasPagar;

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
  Fornecedor;

type
  [Entity]
  [Table('CONTASPAGAR', '')]
  [PrimaryKey('CODIGO', NotInc, NoSort, False, 'Chave primária')]
  [Sequence('GENCONTAPAGAR')]
  TCONTASPAGAR = class
  private
    FCODIGO: Integer;
    FDATA: Nullable<TDateTime>;
    FVENCIMENTO: Nullable<TDateTime>;
    FDESCRICAO: Nullable<String>;
    FFORNECEDORId: Nullable<Integer>;
    FVALOR: Nullable<Double>;
    FDOCUMENTO: Nullable<String>;
    FPAGAR: Nullable<String>;
    FJURO: Nullable<Double>;
    FPAGA: Nullable<String>;
    FDATAPAGTO: Nullable<TDateTime>;
    FORIGEM: Nullable<Integer>;
    FCOMPRA: Nullable<Integer>;
    FCAPITALPAGO: Nullable<Double>;
    FJUROPAGO: Nullable<Double>;
    FDESCTO: Nullable<Double>;
    FOBS: TBlob;
    FIDCONTA: Nullable<Integer>;
    FATRASO: Nullable<Integer>;

    FContaCAIXA:  TContaCAIXA;
    FFORNECEDOR:  TFORNECEDOR;
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

    [Column('DESCRICAO', ftString, 80)]
    [Dictionary('DESCRICAO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property DESCRICAO: Nullable<String> read FDESCRICAO write FDESCRICAO;

    [Column('FORNECEDOR', ftInteger)]
    [ForeignKey('FK_CONTASPAGAR_FORN', 'FORNECEDOR', 'FORNECEDORES', 'CODFORNECEDOR', SetNull, SetNull)]
    [Dictionary('FORNECEDOR', 'Mensagem de validação', '', '', '', taCenter)]
    property FORNECEDORId: Nullable<Integer> read FFORNECEDORId write FFORNECEDORId;

    [Column('VALOR', ftBCD, 18, 4)]
    [Dictionary('VALOR', 'Mensagem de validação', '0', '', '', taRightJustify)]
    property VALOR: Nullable<Double> read FVALOR write FVALOR;

    [Column('DOCUMENTO', ftString, 20)]
    [Dictionary('DOCUMENTO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property DOCUMENTO: Nullable<String> read FDOCUMENTO write FDOCUMENTO;

    [Column('PAGAR', ftString, 1)]
    [Dictionary('PAGAR', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property PAGAR: Nullable<String> read FPAGAR write FPAGAR;

    [Column('JURO', ftBCD, 18, 4)]
    [Dictionary('JURO', 'Mensagem de validação', '0', '', '', taRightJustify)]
    property JURO: Nullable<Double> read FJURO write FJURO;

    [Column('PAGA', ftString, 1)]
    [Dictionary('PAGA', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property PAGA: Nullable<String> read FPAGA write FPAGA;

    [Column('DATAPAGTO', ftDateTime)]
    [Dictionary('DATAPAGTO', 'Mensagem de validação', '', '', '', taCenter)]
    property DATAPAGTO: Nullable<TDateTime> read FDATAPAGTO write FDATAPAGTO;

    [Column('ORIGEM', ftInteger)]
    [Dictionary('ORIGEM', 'Mensagem de validação', '', '', '', taCenter)]
    property ORIGEM: Nullable<Integer> read FORIGEM write FORIGEM;

    [Column('COMPRA', ftInteger)]
    [Dictionary('COMPRA', 'Mensagem de validação', '', '', '', taCenter)]
    property COMPRA: Nullable<Integer> read FCOMPRA write FCOMPRA;

    [Column('CAPITALPAGO', ftBCD, 18, 4)]
    [Dictionary('CAPITALPAGO', 'Mensagem de validação', '0', '', '', taRightJustify)]
    property CAPITALPAGO: Nullable<Double> read FCAPITALPAGO write FCAPITALPAGO;

    [Column('JUROPAGO', ftBCD, 18, 4)]
    [Dictionary('JUROPAGO', 'Mensagem de validação', '0', '', '', taRightJustify)]
    property JUROPAGO: Nullable<Double> read FJUROPAGO write FJUROPAGO;

    [Column('DESCTO', ftBCD, 18, 4)]
    [Dictionary('DESCTO', 'Mensagem de validação', '0', '', '', taRightJustify)]
    property DESCTO: Nullable<Double> read FDESCTO write FDESCTO;

    [Column('OBS', ftBlob)]
    [Dictionary('OBS', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property OBS: TBlob read FOBS write FOBS;

    [Column('IDCONTA', ftInteger)]
    [ForeignKey('FK_CONTASPAGAR_CONTA', 'IDCONTA', 'CAIXAS', 'CODIGO', SetNull, SetNull)]
    [Dictionary('IDCONTA', 'Mensagem de validação', '', '', '', taCenter)]
    property IDCONTA: Nullable<Integer> read FIDCONTA write FIDCONTA;

    [Column('ATRASO', ftInteger)]
    [Dictionary('ATRASO', 'Mensagem de validação', '', '', '', taCenter)]
    property ATRASO: Nullable<Integer> read FATRASO write FATRASO;




    [Association(OneToOne,'IDCONTA','CAIXAS','CODIGO')]
    property ContaCAIXA: TContaCAIXA read FContaCAIXA write FContaCAIXA;

    [Association(OneToOne,'FORNECEDOR','FORNECEDORES','CODFORNECEDOR')]
    property FORNECEDOR: TFORNECEDOR read FFORNECEDOR write FFORNECEDOR;

  end;

implementation

constructor TCONTASPAGAR.Create;
begin
  FContaCAIXA := TContaCAIXA.Create;
  FFORNECEDOR := TFORNECEDOR.Create;
end;

destructor TCONTASPAGAR.Destroy;
begin
  if Assigned(FContaCAIXA) then
    FContaCAIXA.Free;

  if Assigned(FFORNECEDOR) then
    FFORNECEDOR.Free;

  inherited;
end;

initialization
  TRegisterClass.RegisterEntity(TCONTASPAGAR)

end.

