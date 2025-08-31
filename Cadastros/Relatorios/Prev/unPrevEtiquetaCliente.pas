unit unPrevEtiquetaCliente;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, memds,  SqlDb, RLReport, ZDataset, FMTBcd;

type

  { TfrmPrevEtiquetaCliente }

  TfrmPrevEtiquetaCliente = class(TForm)
    rpEtiqueta: TRLReport;
    Detail: TRLDetailGrid;
    dbDescricao: TRLDBMemo;
    dspEtq: TComponent;
    dsEtq: TDataSource;
    dbmTexto: TRLDBMemo;
    sqldEtiq: TZQuery;
    sqldEtiqTEXTO: TStringField;
    sqldEtiqTITULO: TStringField;
    procedure dbDescricaoBeforePrint(Sender: TObject; var Text: String;
      var PrintIt: Boolean);
    procedure dbmTextoBeforePrint(Sender: TObject; var Text: String;
      var PrintIt: Boolean);
    procedure rpEtiquetaDataRecord(Sender: TObject; RecNo, CopyNo: Integer;
      var Eof: Boolean; var RecordAction: TRLRecordAction);
    procedure FormCreate(Sender: TObject);
  private
    FNumeroLinhas: Integer;
    procedure SetNumeroLinhas(const Value: Integer);
  public
    Branco, FSkip: Integer;
    property NumLinhas: Integer read FNumeroLinhas write SetNumeroLinhas;
  end;

var
  frmPrevEtiquetaCliente: TfrmPrevEtiquetaCliente;

implementation

{$R *.dfm}

procedure TfrmPrevEtiquetaCliente.SetNumeroLinhas(const Value: Integer);
begin
  FNumeroLinhas := Value;
end;

procedure TfrmPrevEtiquetaCliente.dbDescricaoBeforePrint(Sender: TObject;
  var Text: String; var PrintIt: Boolean);
var
  Tam: Real;
begin
  Tam := (Detail.Width / NumLinhas - 30);
  dbDescricao.Width := Trunc(Tam);
end;

procedure TfrmPrevEtiquetaCliente.dbmTextoBeforePrint(Sender: TObject;
  var Text: String; var PrintIt: Boolean);
var
  Tam: Real;
begin
  Tam := (Detail.Width / NumLinhas - 30);
  dbmTexto.Width := Trunc(Tam);
end;

procedure TfrmPrevEtiquetaCliente.rpEtiquetaDataRecord(Sender: TObject;
  RecNo, CopyNo: Integer; var Eof: Boolean;
  var RecordAction: TRLRecordAction);
begin
  Inc(Branco);
  if Branco < FSkip then
    RecordAction := raBlankAndRetain; 
end;

procedure TfrmPrevEtiquetaCliente.FormCreate(Sender: TObject);
begin
  Branco := 0;
end;

end.
