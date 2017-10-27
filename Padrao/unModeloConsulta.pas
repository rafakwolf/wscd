unit unModeloConsulta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons, DBClient, Grids, DBGrids,
  Mask, StrUtils, SqlExpr, Provider, Data.FMTBcd, uniGUIForm, uniGUIBaseClasses,
  uniGUIClasses, uniLabel, uniButton, uniBitBtn, uniMultiItem, uniComboBox,
  uniEdit, uniBasicGrid, uniDBGrid, uniGUIApplication;

type
  TfrmModeloConsulta = class(TUniForm)
    dsPadrao: TDataSource;
    sqldPesquisa: TSQLDataSet;
    dspPesquisa: TDataSetProvider;
    cdsPesquisa: TClientDataSet;
    lbCampo: TUniLabel;
    lbCondicao: TUniLabel;
    lbDados: TUniLabel;
    lbNumRegs: TUniLabel;
    btnBuscar: TUniBitBtn;
    btnOk: TUniBitBtn;
    btnCancelar: TUniBitBtn;
    cmbCondicao: TUniComboBox;
    cmbCampo: TUniComboBox;
    edtPesquisa: TUniEdit;
    Grade: TUniDBGrid;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure GradeDblClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure NumeroResgistros;
    procedure ExecPesquisa(Valor, Campo: String; Condicao: Integer);
  public
    class function Execute(const Titulo, Table, FieldNames, DisplayLabels: String;
      owner: TComponent): Integer;
  end;

var
  frmModeloConsulta: TfrmModeloConsulta;
  
implementation

uses Funcoes, VarGlobal;

{$R *.dfm}

procedure TfrmModeloConsulta.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmModeloConsulta.btnBuscarClick(Sender: TObject);
begin
  ExecPesquisa(edtPesquisa.Text, cdsPesquisa.Fields[ cmbCampo.ItemIndex ].FieldName,
    cmbCondicao.ItemIndex);
end;

procedure TfrmModeloConsulta.GradeDblClick(Sender: TObject);
begin
  btnOK.Click;
end;

procedure TfrmModeloConsulta.btnOkClick(Sender: TObject);
begin
   ModalResult := mrOk;
end;

class function TfrmModeloConsulta.Execute(const Titulo,
  Table, FieldNames, DisplayLabels: String; owner: TComponent): Integer;
begin
  Result := 0;
  frmModeloConsulta := TfrmModeloConsulta.Create(owner);
  with frmModeloConsulta do
  try
    Caption := Titulo;

    cdsPesquisa.Close;
    cdsPesquisa.CommandText := 'select * from '+Table;
    cdsPesquisa.PacketRecords := -1;
    cdsPesquisa.Open;

    cdsPesquisa.FieldDefs.GetItemNames(cmbCampo.Items);

    lbNumRegs.Caption := '';

    ShowModal(procedure (Sender: TComponent; AResult: Integer)
              begin
                //FreeAndNil(frmModeloConsulta);
              end);


  finally
  end;
end;

procedure TfrmModeloConsulta.ExecPesquisa(Valor, Campo: String; Condicao: Integer);
begin
  // implementar
end;

procedure TfrmModeloConsulta.FormCreate(Sender: TObject);
begin
  sqldPesquisa.SQLConnection := GetConnection;
end;

procedure TfrmModeloConsulta.NumeroResgistros;
begin
  lbNumRegs.Caption := '';
  if cdsPesquisa.Active then
  begin
    if cdsPesquisa.RecordCount = 1 then
      lbNumRegs.Caption := '1 registro encontrado'
    else if cdsPesquisa.RecordCount > 1 then
      lbNumRegs.Caption := IntToStr(cdsPesquisa.RecordCount) + ' registros encontrados'
    else
      lbNumRegs.Caption := 'Nenhum registro encontrado.';
  end
  else
    lbNumRegs.Caption := 'Nenhum registro encontrado.';
end;


procedure TfrmModeloConsulta.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    btnCancelar.Click;

  if Key = VK_RETURN then
    btnOk.Click;   
end;

end.
