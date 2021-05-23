unit Cliente;

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
  [Table('CLIENTES', '')]
  [PrimaryKey('CODCLIENTE', NotInc, NoSort, False, 'Chave primária')]
  [Sequence('GENCLIENTE')]
  TCliente = class
  private
    FCODCLIENTE: Integer;
    FTIPO: Nullable<String>;
    FNOME: Nullable<String>;
    FENDERECO: Nullable<String>;
    FCEP: Nullable<String>;
    FBAIRRO: Nullable<String>;
    FTELEFONE: Nullable<String>;
    FFAX: Nullable<String>;
    FCODCIDADE: Nullable<Integer>;
    FUF: Nullable<String>;
    FTEMPO_MORADIA: Nullable<String>;
    FEND_ANTERIOR: Nullable<String>;
    FE_MAIL: Nullable<String>;
    FTRABALHO: Nullable<String>;
    FCARGO: Nullable<String>;
    FDATA_INICIO: Nullable<TDateTime>;
    FSALARIO: Nullable<Double>;
    FESTADO_CIVIL: Nullable<String>;
    FCONJUGUE: Nullable<String>;
    FLOCAL_TRAB: Nullable<String>;
    FDATA_NASC: Nullable<TDateTime>;
    FPAI: Nullable<String>;
    FMAE: Nullable<String>;
    FCPF_CNPJ: Nullable<String>;
    FRG_IE: Nullable<String>;
    FREFER_PES: Nullable<String>;
    FREFER_COM: Nullable<String>;
    FFONE_COM: Nullable<String>;
    FCADASTRO: Nullable<TDateTime>;
    FOBS: TBlob;
    FNATURALIDADE: Nullable<String>;
    FLIMITE: Nullable<Double>;
    FFOTO: TBlob;

    FCIDADES:  TCidades;
  public
    constructor Create;
    destructor Destroy; override;
    [Restrictions([NotNull])]
    [Column('CODCLIENTE', ftInteger)]
    [Dictionary('CODCLIENTE', 'Mensagem de validação', '', '', '', taCenter)]
    property CODCLIENTE: Integer read FCODCLIENTE write FCODCLIENTE;

    [Column('TIPO', ftString, 1)]
    [Dictionary('TIPO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property TIPO: Nullable<String> read FTIPO write FTIPO;

    [Column('NOME', ftString, 80)]
    [Dictionary('NOME', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property NOME: Nullable<String> read FNOME write FNOME;

    [Column('ENDERECO', ftString, 80)]
    [Dictionary('ENDERECO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property ENDERECO: Nullable<String> read FENDERECO write FENDERECO;

    [Column('CEP', ftString, 10)]
    [Dictionary('CEP', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property CEP: Nullable<String> read FCEP write FCEP;

    [Column('BAIRRO', ftString, 80)]
    [Dictionary('BAIRRO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property BAIRRO: Nullable<String> read FBAIRRO write FBAIRRO;

    [Column('TELEFONE', ftString, 20)]
    [Dictionary('TELEFONE', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property TELEFONE: Nullable<String> read FTELEFONE write FTELEFONE;

    [Column('FAX', ftString, 20)]
    [Dictionary('FAX', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property FAX: Nullable<String> read FFAX write FFAX;

    [Column('CODCIDADE', ftInteger)]
    [ForeignKey('FK_CLIENTES_CIDADE', 'CODCIDADE', 'CIDADES', 'CODCIDADE', SetNull, SetNull)]
    [Dictionary('CODCIDADE', 'Mensagem de validação', '', '', '', taCenter)]
    property CODCIDADE: Nullable<Integer> read FCODCIDADE write FCODCIDADE;

    [Column('UF', ftString, 2)]
    [Dictionary('UF', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property UF: Nullable<String> read FUF write FUF;

    [Column('TEMPO_MORADIA', ftString, 80)]
    [Dictionary('TEMPO_MORADIA', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property TEMPO_MORADIA: Nullable<String> read FTEMPO_MORADIA write FTEMPO_MORADIA;

    [Column('END_ANTERIOR', ftString, 80)]
    [Dictionary('END_ANTERIOR', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property END_ANTERIOR: Nullable<String> read FEND_ANTERIOR write FEND_ANTERIOR;

    [Column('E_MAIL', ftString, 80)]
    [Dictionary('E_MAIL', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property E_MAIL: Nullable<String> read FE_MAIL write FE_MAIL;

    [Column('TRABALHO', ftString, 80)]
    [Dictionary('TRABALHO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property TRABALHO: Nullable<String> read FTRABALHO write FTRABALHO;

    [Column('CARGO', ftString, 80)]
    [Dictionary('CARGO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property CARGO: Nullable<String> read FCARGO write FCARGO;

    [Column('DATA_INICIO', ftDateTime)]
    [Dictionary('DATA_INICIO', 'Mensagem de validação', '', '', '', taCenter)]
    property DATA_INICIO: Nullable<TDateTime> read FDATA_INICIO write FDATA_INICIO;

    [Column('SALARIO', ftBCD, 18, 4)]
    [Dictionary('SALARIO', 'Mensagem de validação', '0', '', '', taRightJustify)]
    property SALARIO: Nullable<Double> read FSALARIO write FSALARIO;

    [Column('ESTADO_CIVIL', ftString, 1)]
    [Dictionary('ESTADO_CIVIL', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property ESTADO_CIVIL: Nullable<String> read FESTADO_CIVIL write FESTADO_CIVIL;

    [Column('CONJUGUE', ftString, 80)]
    [Dictionary('CONJUGUE', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property CONJUGUE: Nullable<String> read FCONJUGUE write FCONJUGUE;

    [Column('LOCAL_TRAB', ftString, 80)]
    [Dictionary('LOCAL_TRAB', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property LOCAL_TRAB: Nullable<String> read FLOCAL_TRAB write FLOCAL_TRAB;

    [Column('DATA_NASC', ftDateTime)]
    [Dictionary('DATA_NASC', 'Mensagem de validação', '', '', '', taCenter)]
    property DATA_NASC: Nullable<TDateTime> read FDATA_NASC write FDATA_NASC;

    [Column('PAI', ftString, 80)]
    [Dictionary('PAI', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property PAI: Nullable<String> read FPAI write FPAI;

    [Column('MAE', ftString, 80)]
    [Dictionary('MAE', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property MAE: Nullable<String> read FMAE write FMAE;

    [Column('CPF_CNPJ', ftString, 20)]
    [Dictionary('CPF_CNPJ', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property CPF_CNPJ: Nullable<String> read FCPF_CNPJ write FCPF_CNPJ;

    [Column('RG_IE', ftString, 20)]
    [Dictionary('RG_IE', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property RG_IE: Nullable<String> read FRG_IE write FRG_IE;

    [Column('REFER_PES', ftString, 250)]
    [Dictionary('REFER_PES', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property REFER_PES: Nullable<String> read FREFER_PES write FREFER_PES;

    [Column('REFER_COM', ftString, 250)]
    [Dictionary('REFER_COM', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property REFER_COM: Nullable<String> read FREFER_COM write FREFER_COM;

    [Column('FONE_COM', ftString, 20)]
    [Dictionary('FONE_COM', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property FONE_COM: Nullable<String> read FFONE_COM write FFONE_COM;

    [Column('CADASTRO', ftDateTime)]
    [Dictionary('CADASTRO', 'Mensagem de validação', '', '', '', taCenter)]
    property CADASTRO: Nullable<TDateTime> read FCADASTRO write FCADASTRO;

    [Column('OBS', ftBlob)]
    [Dictionary('OBS', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property OBS: TBlob read FOBS write FOBS;

    [Column('NATURALIDADE', ftString, 80)]
    [Dictionary('NATURALIDADE', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property NATURALIDADE: Nullable<String> read FNATURALIDADE write FNATURALIDADE;

    [Column('LIMITE', ftBCD, 18, 4)]
    [Dictionary('LIMITE', 'Mensagem de validação', '0', '', '', taRightJustify)]
    property LIMITE: Nullable<Double> read FLIMITE write FLIMITE;

    [Column('FOTO', ftBlob)]
    [Dictionary('FOTO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property FOTO: TBlob read FFOTO write FFOTO;

    [Association(OneToOne,'CODCIDADE','CIDADES','CODCIDADE')]
    property CIDADES: TCIDADES read FCIDADES write FCIDADES;

  end;

implementation

constructor TCLIENTE.Create;
begin
  FCIDADES := TCIDADES.Create;
end;

destructor TCLIENTE.Destroy;
begin
  if Assigned(FCIDADES) then
    FCIDADES.Free;

  inherited;
end;

initialization
  TRegisterClass.RegisterEntity(TCliente)

end.

