unit unPrevEtiquetaProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB,DBClient, Provider, SqlExpr, RLReport,
  RLBarcode, FMTBcd;
  
type
  TfrmPrevEtiquetaProduto = class(TForm)
    dspEtq: TDataSetProvider;
    cdsEtq: TClientDataSet;
    dsEtq: TDataSource;
    rpEtiqueta: TRLReport;
    Detail: TRLDetailGrid;
    dbtBarcode: TRLDBBarcode;
    dbtPreco: TRLDBText;
    sqldEtq: TSQLDataSet;
    dbDescricao: TRLDBMemo;
    sqldEtqCODBARRA: TStringField;
    sqldEtqDESCRICAO: TStringField;
    sqldEtqPRECO: TFMTBCDField;
    cdsEtqCODBARRA: TStringField;
    cdsEtqDESCRICAO: TStringField;
    cdsEtqPRECO: TFMTBCDField;
    procedure dbDescricaoBeforePrint(Sender: TObject; var Text: String;
      var PrintIt: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure rpEtiquetaDataRecord(Sender: TObject; RecNo, CopyNo: Integer;
      var Eof: Boolean; var RecordAction: TRLRecordAction);
  private
    FNumeroLinhas: Integer;
    procedure SetNumeroLinhas(const Value: Integer);
  public
    Branco, FSkip: Integer;
    property NumLinhas: Integer read FNumeroLinhas write SetNumeroLinhas;
  end;

var
  frmPrevEtiquetaProduto: TfrmPrevEtiquetaProduto;

implementation

{$R *.dfm}

procedure TfrmPrevEtiquetaProduto.dbDescricaoBeforePrint(Sender: TObject;
  var Text: String; var PrintIt: Boolean);
var
  Tam: Real;
begin
  Tam := (Detail.Width / NumLinhas - 30);
  dbDescricao.Width := Trunc(Tam);
end;

procedure TfrmPrevEtiquetaProduto.SetNumeroLinhas(const Value: Integer);
begin
  FNumeroLinhas := Value;
end;

procedure TfrmPrevEtiquetaProduto.FormCreate(Sender: TObject);
begin
  Branco := 0;
end;

procedure TfrmPrevEtiquetaProduto.rpEtiquetaDataRecord(Sender: TObject; RecNo,
  CopyNo: Integer; var Eof: Boolean; var RecordAction: TRLRecordAction);
begin
  Inc(Branco);
  if Branco < FSkip then
    RecordAction := raBlankAndRetain; 
end;

end.
