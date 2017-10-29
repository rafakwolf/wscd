unit unRelatorioAgenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unDialogoRelatorioPadrao, StdCtrls, Buttons, ExtCtrls,
  DB, DBClient, Provider, SqlExpr, DBCtrls,  Mask, uConfiguraRelatorio,
  FMTBcd, uniLabel, uniGUIBaseClasses, uniGUIClasses, uniPanel, uniEdit,
  uniDBEdit, uniButton, uniBitBtn, uniRadioGroup;

type
  TfrmRelatorioAgenda = class(TfrmDialogoRelatorioPadrao)
    sqldAgenda: TSQLDataSet;
    dspAgenda: TDataSetProvider;
    cdsAgenda: TClientDataSet;
    cdsAgendaNOME: TStringField;
    cdsAgendaTELEFONE: TStringField;
    cdsAgendaTELEFONE2: TStringField;
    cdsAgendaTELEFONE3: TStringField;
    cdsAgendaFAX: TStringField;
    sqldAgendaNOME: TStringField;
    sqldAgendaTELEFONE: TStringField;
    sqldAgendaTELEFONE2: TStringField;
    sqldAgendaTELEFONE3: TStringField;
    sqldAgendaFAX: TStringField;
    lbTelefone: TUniLabel;
    dbeNome: TUniDBEdit;
    edFone: TUniEdit;
    rgTipoRelatorio: TUniRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure dbeNomeClickButton(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure rgTipoRelatorioClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    SQLPadrao: string;
    procedure Imprimir(p: Boolean);
  public
  end;

var
  frmRelatorioAgenda: TfrmRelatorioAgenda;

implementation

uses
  unModeloConsulta, unPrevRelAgenda, Funcoes, ConstPadrao;

{$R *.dfm}

procedure TfrmRelatorioAgenda.Imprimir(p: Boolean);
var
  Nome: String;
begin
  with TfrmPrevRelAgenda.Create(Self) do
  try
    Nome := Trim(dbeNome.Text);
    case rgTipoRelatorio.ItemIndex of
      0:
      begin

        if Nome = EmptyStr then
          Exit;

        with cdsPadrao do
        begin
          Close;
          CommandText := 'SELECT NOME, TELEFONE, FAX FROM VIEWAGENDA '+
            'WHERE NOME LIKE ' + QuotedStr(Nome)+ ' ORDER BY NOME';
          Open;
        end;
      end;
      1:
      begin
        if ((edFone.Text = EmptyStr) or (ClearMask(edFone.Text) = '')) then
          Exit;
        with cdsPadrao do
        begin
          Close;
          CommandText := 'SELECT NOME, TELEFONE, FAX FROM VIEWAGENDA '+
            'WHERE TELEFONE LIKE ' + QuotedStr('%'+edFone.Text+'%')+ 'ORDER BY TELEFONE';
          Open;
        end;
      end;
      2:
      begin
        with cdsPadrao do
        begin
          Close;
          CommandText := 'SELECT NOME, TELEFONE, FAX FROM VIEWAGENDA ORDER BY NOME';
          Open;
        end;
      end;
    end;
    PrintIfNotEmptyRL(rrPadrao, p);
  finally
    cdsPadrao.Close;
    Free;
  end;
end;

procedure TfrmRelatorioAgenda.FormShow(Sender: TObject);
begin
  inherited;
  cdsAgenda.Close;
end;

procedure TfrmRelatorioAgenda.dbeNomeClickButton(Sender: TObject);
begin
  inherited;
//  cdsAgenda.Close;
//  cdsAgenda.CommandText := SQLPadrao;
//  if not TfrmModeloConsulta.Execute('Agenda', cdsAgenda, FN_AGENDA, DL_AGENDA) then
//    cdsAgenda.Close;
end;

procedure TfrmRelatorioAgenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cdsAgenda.Close;
  inherited;
end;

procedure TfrmRelatorioAgenda.btnImprimirClick(Sender: TObject);
begin
  inherited;
  Imprimir(true);
end;

procedure TfrmRelatorioAgenda.btnVisualizarClick(Sender: TObject);
begin
  inherited;
  Imprimir(False);
end;

procedure TfrmRelatorioAgenda.rgTipoRelatorioClick(Sender: TObject);
begin
  inherited;
//  if rgTipoRelatorio.ItemIndex = 0 then
//    dbeNome.Button.Click
//  else if rgTipoRelatorio.ItemIndex = 1 then
//    edFone.SetFocus;
end;

procedure TfrmRelatorioAgenda.FormCreate(Sender: TObject);
begin
  inherited;
  SQLPadrao := sqldAgenda.CommandText;
end;

initialization
  RegisterClass(TfrmRelatorioAgenda);
finalization
  UnRegisterClass(TfrmRelatorioAgenda);
end.
