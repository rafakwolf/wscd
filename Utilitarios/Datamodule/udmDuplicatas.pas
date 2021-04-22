unit udmDuplicatas;

interface

uses
  SysUtils, Classes, udmGeralBase, DB, memds,
   FMTBcd,  Sqldb;

type
  TdmDuplicatas = class(TdmGeralBase)
    sqldPadrao: TSQLQuery;
    sqldPadraoIDDUPLICATA: TIntegerField;
    sqldPadraoNRODUPLICATA: TStringField;
    sqldPadraoSACADO: TStringField;
    sqldPadraoCPF_CNPJ: TStringField;
    sqldPadraoENDERECO: TStringField;
    sqldPadraoBAIRRO: TStringField;
    sqldPadraoCEP: TStringField;
    sqldPadraoIDCIDADE: TIntegerField;
    sqldPadraoNOMECIDADE: TStringField;
    sqldPadraoFONEFAX: TStringField;
    sqldPadraoUF: TStringField;
    sqldPadraoIE: TStringField;
    sqldPadraoDATAEMISSAO: TDateField;
    sqldPadraoNROFATURA: TStringField;
    sqldPadraoVALOR_FATURA: TFMTBCDField;
    sqldPadraoVALOR: TFMTBCDField;
    sqldPadraoDATAVENC: TDateField;
    sqldPadraoDESCONTO: TFMTBCDField;
    sqldPadraoPRACAPAGAMENTO: TStringField;
    sqldPadraoDATADESCTO: TDateField;
    sqldPadraoVALOREXTENSO: TStringField;
    sqldPadraoDATAIMPRESSAO: TDateField;
    sqldPadraoIMPRESSA: TStringField;
    dspPadrao: TComponent;
    sqldDeleta: TSQLQuery;
  private
  public
    procedure Delete(id: Integer);

    function IsDuplicataRepetida(nro: string): Boolean;
  end;

var
  dmDuplicatas: TdmDuplicatas;

implementation

uses unDmPrincipal;

{%CLASSGROUP 'Controls.TControl'}

{$R *.dfm}

procedure TdmDuplicatas.Delete(id: Integer);
begin
  sqldDeleta.Close;
  sqldDeleta.Params.ParamByName('CODIGO').AsInteger := id;
  sqldDeleta.ExecSQL;
end;

function TdmDuplicatas.IsDuplicataRepetida(nro: string): Boolean;
begin
  with TSQLQuery.Create(nil) do
  try
    SQLConnection := GetConnection;
    SQL.Clear; SQL.Text :='select count(1) from DUPLICATA where NRODUPLICATA = '+
      QuotedStr(nro);
    Open;
    Result := Fields[0].AsInteger > 0;
  finally
    Free;
  end;
end;

end.
