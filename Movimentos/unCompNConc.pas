unit unCompNConc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, DBClient,
  Provider, SqlExpr, FMTBcd, uniGUIBaseClasses, uniGUIClasses, uniButton,
  uniBitBtn, uniGUIForm, uniBasicGrid, uniDBGrid;

type
  TfrmCompNaoConc = class(TForm)
    dsComp: TDataSource;
    sqlComp: TSQLDataSet;
    dspComp: TDataSetProvider;
    cdsComp: TClientDataSet;
    sqlCompNUMERO: TIntegerField;
    sqlCompDATANOTA: TDateField;
    sqlCompDATAENTRADA: TDateField;
    sqlCompCODFORNECEDOR: TIntegerField;
    sqlCompRAZAOSOCIAL: TStringField;
    sqlCompTOTAL: TFMTBCDField;
    sqlCompCONCLUIDA: TStringField;
    cdsCompNUMERO: TIntegerField;
    cdsCompDATANOTA: TDateField;
    cdsCompDATAENTRADA: TDateField;
    cdsCompCODFORNECEDOR: TIntegerField;
    cdsCompRAZAOSOCIAL: TStringField;
    cdsCompTOTAL: TFMTBCDField;
    cdsCompCONCLUIDA: TStringField;
    btnConsultar: TBitBtn;
    btnCancelar: TBitBtn;
    Grade: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GradeDblClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cdsCompCONCLUIDAGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
  private
  public
  end;

var
  frmCompNaoConc: TfrmCompNaoConc;

implementation

uses Funcoes, ConstPadrao, unNotasFiscais;

{$R *.dfm}

procedure TfrmCompNaoConc.GradeDblClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCompNaoConc.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCompNaoConc.btnConsultarClick(Sender: TObject);
begin
  PostMessageAllForms(WM_COMPRA_NAO_CONC);
  Close;
end;

procedure TfrmCompNaoConc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmCompNaoConc.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(key = vk_escape)then
    Close;
end;

procedure TfrmCompNaoConc.FormShow(Sender: TObject);
begin
  cdsComp.Open;
  if cdsComp.IsEmpty then
  begin
    MsgAviso('Todas as compras conclu�das.');
    PostMessage(Handle, WM_CLOSE, 0, 0);
    Exit;
  end;
end;

procedure TfrmCompNaoConc.FormCreate(Sender: TObject);
begin
  CentralizaForm(Self);
end;

procedure TfrmCompNaoConc.cdsCompCONCLUIDAGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if Sender.AsString = 'S' then
    Text := 'Sim'
  else
    Text := 'N�o';  
end;

initialization
  RegisterClass(TfrmCompNaoConc);
finalization
  UnRegisterClass(TfrmCompNaoConc);
end.
