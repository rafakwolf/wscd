unit unModeloConsulta;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons, Grids, DBGrids,
  Masks, StrUtils, SQLDB, FmtBCD, LCLType, ZDataset;

type

  { TfrmModeloConsulta }

  TfrmModeloConsulta = class(TForm)
    dsPadrao: TDataSource;
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
    sqldPesquisa: TZReadOnlyQuery;
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
  if ((cmbCampo.ItemIndex = -1) or (cmbCondicao.ItemIndex = -1)) then
  begin
    Exit;
  end;
  ExecPesquisa(edtPesquisa.Text, sqldPesquisa.Fields[ cmbCampo.ItemIndex ].FieldName,
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

    sqldPesquisa.Close;
    sqldPesquisa.SQL.Clear;
    sqldPesquisa.SQL.Add('select * FROM '+UpperCase(Table));
    sqldPesquisa.Open;

    cmbCampo.Items.Clear;
    sqldPesquisa.FieldDefs.GetItemNames(cmbCampo.Items);

    lbNumRegs.Caption := '';

    if (ShowModal = mrOk) then
    begin
    Result := sqldPesquisa.fields[0].AsInteger; // retorna o ID
    end else begin
      Result := 0;
    end;

  finally
    free;
  end;
end;

procedure TfrmModeloConsulta.ExecPesquisa(Valor, Campo: String; Condicao: Integer);
var
  SQLOriginal: String;
  WhereClause: String;
begin
  // Salva o SQL original
  SQLOriginal := sqldPesquisa.SQL.Text;
  
  // Fecha a query atual
  sqldPesquisa.Close;
  sqldPesquisa.SQL.Clear;
  
  // Reconstrói o SQL base com WHERE
  sqldPesquisa.SQL.Add('SELECT * FROM ' + Copy(SQLOriginal, Pos('FROM', UpperCase(SQLOriginal)) + 4, Length(SQLOriginal)));
  
  // Adiciona a cláusula WHERE baseada na condição selecionada
  case Condicao of
    0: // Igual a
      WhereClause := Campo + ' = :valor';
    1: // Contendo
      WhereClause := Campo + ' LIKE :valor';
    2: // Começando com
      WhereClause := Campo + ' LIKE :valor';
    3: // Terminando com
      WhereClause := Campo + ' LIKE :valor';
  end;
  
  // Adiciona WHERE se houver valor para pesquisar
  if Trim(Valor) <> '' then
  begin
    sqldPesquisa.SQL.Add('WHERE ' + WhereClause);
    
    // Ajusta o valor para LIKE quando necessário
    case Condicao of
      1: // Contendo
        sqldPesquisa.ParamByName('valor').AsString := '%' + Valor + '%';
      2: // Começando com
        sqldPesquisa.ParamByName('valor').AsString := Valor + '%';
      3: // Terminando com
        sqldPesquisa.ParamByName('valor').AsString := '%' + Valor;
      else // Igual a
        sqldPesquisa.ParamByName('valor').AsString := Valor;
    end;
  end;

  ShowMessage(sqldPesquisa.SQL.Text);
  
  // Executa a pesquisa
  try
    sqldPesquisa.Open;
    NumeroResgistros; // Atualiza o contador de registros
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao executar pesquisa: ' + E.Message);
      // Restaura o SQL original em caso de erro
      sqldPesquisa.Close;
      sqldPesquisa.SQL.Text := SQLOriginal;
      sqldPesquisa.Open;
    end;
  end;
end;

procedure TfrmModeloConsulta.FormCreate(Sender: TObject);
begin
  sqldPesquisa.Connection := GetZConnection;
end;

procedure TfrmModeloConsulta.NumeroResgistros;
begin
  lbNumRegs.Caption := '';
  if sqldPesquisa.Active then
  begin
    if sqldPesquisa.RecordCount = 1 then
      lbNumRegs.Caption := '1 registro encontrado'
    else if sqldPesquisa.RecordCount > 1 then
      lbNumRegs.Caption := IntToStr(sqldPesquisa.RecordCount) + ' registros encontrados'
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

  if Key = VK_RETURN then
    btnOk.Click;   
end;

end.
