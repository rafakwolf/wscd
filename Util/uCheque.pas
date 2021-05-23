unit uCheque;

interface

uses Classes, Data.SqlExpr;

type TTipoCheque = (tcRecebido, tcRepassado);

type TCheque = class
  private
    fIdCliente: Integer;
    fCmc7: string;
    fDataEmissao: TDateTime;
    fBomPara: TDateTime;
    fValor: Currency;
    fTipoCheque: TTipoCheque;
    fDataBaixado: TDateTime;
    fIdFornec: Integer;
  public
    property IdFornec: Integer read fIdFornec write fIdFornec;
    property IdCliente: Integer read fIdCliente write fIdCliente;
    property Cmc7: string read fCmc7 write fCmc7;
    property DataEmissao: TDateTime read fDataEmissao write fDataEmissao;
    property BomPara: TDateTime read fBomPara write fBomPara;
    property Valor: Currency read fValor write fValor;
    property TipoCheque: TTipoCheque read fTipoCheque write fTipoCheque;
    property DataBaixado: TDateTime read fDataBaixado write fDataBaixado;

    procedure GravaCheque;

    constructor Create(conn: TSQLConnection); overload;
  end;

function ValidaCMC7(cmc7: string): boolean;

implementation

constructor TCheque.Create(conn: TSQLConnection);
begin
   inherited Create;
   //
end;

procedure TCheque.GravaCheque;
begin

end;

function ValidaCMC7(cmc7: string): boolean;
begin
  // TODO: Implementar
end;

end.
