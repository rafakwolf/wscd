unit unModeloConsulta;

interface

uses
  Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons, Grids, DBGrids,
  Masks, StrUtils, SQLDB, FmtBCD, memds, LCLType;

type
  TfrmModeloConsulta = class(TForm)
    dsPadrao: TDataSource;
    sqldPesquisa: TSQLQuery;
    dspPesquisa: TComponent;
    cdsPesquisa: TMemDataSet;
    lbCampo: TLabel;
    lbCondicao: TLabel;
    lbDados: TLabel;
    lbNumRegs: TLabel;
    btnBuscar: TBitBtn;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    cmbCondicao: TComboBox;
    cmbCampo: TComboBox;
    edtPesquisa: TEdit;
    Grade: TDBGrid;
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
    sqldPesquisa.SQL.Clear;
    sqldPesquisa.SQL.Add('select * from '+Table);
    cdsPesquisa.Open;

    cdsPesquisa.FieldDefs.GetItemNames(cmbCampo.Items);

    lbNumRegs.Caption := '';

    //ShowModal(procedure (Sender: TComponent; AResult: Integer)
    //          begin
    //            //FreeAndNil(frmModeloConsulta);
    //          end);


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
  if Key = vk_Escape then
    btnCancelar.Click;

  if Key = #13 then
    btnOk.Click;   
end;

end.
