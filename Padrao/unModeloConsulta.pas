unit unModeloConsulta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Grids, DBGrids, Buttons, DBClient, 
  Mask, StrUtils, SqlExpr, Provider, Data.FMTBcd;

type
  TfrmModeloConsulta = class(TForm)
    Grade: TDBGrid;
    cmbCondicao: TComboBox;
    cmbCampo: TComboBox;
    dsPadrao: TDataSource;
    lbCampo: TLabel;
    lbCondicao: TLabel;
    lbDados: TLabel;
    edtPesquisa: TMaskEdit;
    btnBuscar: TBitBtn;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    lbNumRegs: TLabel;
    sqldPesquisa: TSQLDataSet;
    dspPesquisa: TDataSetProvider;
    cdsPesquisa: TClientDataSet;
    procedure GradeDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure cmbCampoChange(Sender: TObject);
    procedure GradeDblClick(Sender: TObject);
    procedure cmbCondicaoChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GradeTitleClick(Column: TColumn);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    procedure DBGridMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);      
  private
    FFieldNames, FDisplayLabels: TStringList;
    QuerySQL: String;
    procedure SetColumnsGrid;
    procedure ConfiguraColunasGrid;
    procedure NumeroResgistros;
    procedure ExecPesquisa(Valor, Campo: String; Condicao: Integer);
  public
    class function Execute(const Titulo, Table, FieldNames, DisplayLabels: String): Integer;
  end;

  TWheelDBGrid = class(TDBGrid)
  public
    property OnMouseWheel;
  end;

var
  frmModeloConsulta: TfrmModeloConsulta;
  
implementation

uses Funcoes, VarGlobal;

{$R *.dfm}

procedure TfrmModeloConsulta.GradeDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if State = [] then
  begin
    if dsPadrao.DataSet.RecNo mod 2 = 1 then
      Grade.Canvas.Brush.Color := $00F0F0F0
    else
      Grade.Canvas.Brush.Color := clWhite;
  end;
  Grade.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmModeloConsulta.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmModeloConsulta.btnBuscarClick(Sender: TObject);
begin
  ExecPesquisa(edtPesquisa.Text, FFieldNames[cmbCampo.ItemIndex],
    cmbCondicao.ItemIndex);
end;

procedure TfrmModeloConsulta.cmbCampoChange(Sender: TObject);
begin
  { igual a }
  if FieldIsDateTime(cdsPesquisa.FieldByName(FFieldNames[cmbCampo.ItemIndex])) then
  begin
    cmbCondicao.ItemIndex := 0;
    cmbCondicao.Enabled   := False;
    edtPesquisa.EditMask  := '99/99/9999;1;_';
    edtPesquisa.Clear;
  end
  { igual a }
  else if FieldIsNumeric(cdsPesquisa.FieldByName(FFieldNames[cmbCampo.ItemIndex])) then
  begin
    cmbCondicao.ItemIndex := 0;
    cmbCondicao.Enabled   := False;
    edtPesquisa.EditMask  := '';
    edtPesquisa.Text      := '0';
    edtPesquisa.Clear;
  end
  else
  { usuário escolhe }
  begin
    cmbCondicao.ItemIndex := 1;
    cmbCondicao.Enabled   := True;
    edtPesquisa.EditMask  := '';
    edtPesquisa.Text      := '';
  end;
  SetFocusIfCan(edtPesquisa);
end;

procedure TfrmModeloConsulta.GradeDblClick(Sender: TObject);
begin
  btnOK.Click;
end;

procedure TfrmModeloConsulta.cmbCondicaoChange(Sender: TObject);
begin
  edtPesquisa.SetFocus;
end;

procedure TfrmModeloConsulta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cdsPesquisa.PacketRecords := 100;
  FFieldNames.Free;
  FDisplayLabels.Free;
end;

procedure TfrmModeloConsulta.SetColumnsGrid;
var
  i: Integer;
begin
  for i := 0 to Grade.Columns.Count - 1 do
  begin
    if FieldIsNumeric(Grade.Fields[i]) then
    begin
      Grade.Columns[i].Title.Alignment := taRightJustify;
      Grade.Columns[i].Alignment       := taRightJustify;

      if (Length(Grade.Columns[i].Title.Caption) > 15) then
        Grade.Columns[i].Width := 120;

      case Grade.Fields[i].DataType of
        ftFMTBcd, ftBCD, ftFloat, ftCurrency:
        begin
          TFloatField(Grade.Fields[i]).EditFormat    := '#,##0.00';
          TFloatField(Grade.Fields[i]).DisplayFormat := '#,##0.00';
        end;
      end;
    end
    else
    begin
      Grade.Columns[i].Title.Alignment := taLeftJustify;
      Grade.Columns[i].Alignment       := taLeftJustify;

      if (Length(Grade.Columns[i].Title.Caption) > 15) then
        Grade.Columns[i].Width := 120;

      if FieldIsDateTime(Grade.Fields[i]) then
        Grade.Columns[i].Width := 75;

      if FieldIsString(Grade.Fields[i]) then
        Grade.Columns[i].Width := 200;
    end;
  end;
end;

procedure TfrmModeloConsulta.btnOkClick(Sender: TObject);
begin
  if not btnOk.Enabled then
    ModalResult := mrNone;
end;

class function TfrmModeloConsulta.Execute(const Titulo,
  Table, FieldNames, DisplayLabels: String): Integer;
begin
  Result := 0;
  frmModeloConsulta := TfrmModeloConsulta.Create(Application);
  with frmModeloConsulta do
  try
    Caption := Titulo;

    FFieldNames    := TStringList.Create;
    FFieldNames.Text  := AnsiReplaceText(FieldNames, ';', #13);

    FDisplayLabels := TStringList.Create;
    FDisplayLabels.Text   := AnsiReplaceText(DisplayLabels, ';', #13);

    if (FFieldNames.Count <> FDisplayLabels.Count) then
      raise Exception.Create('A quantidade de valores no parâmetro ' +
        'FieldNames deve ser igual a do DisplayLabels');

    cmbCampo.Items.Text   := DisplayLabels;
    cmbCampo.ItemIndex    := 0;
    cmbCondicao.ItemIndex := 2;

    cdsPesquisa.Close;

    QuerySQL := 'select ' + FieldNames + ' from ' + Table;

    dsPadrao.DataSet := cdsPesquisa;

    cmbCampo.Enabled := (FFieldNames.Count > 1);

    if cmbCampo.Enabled then
      cmbCampo.Color := clWindow
    else
      cmbCampo.Color := clBtnFace;

    cdsPesquisa.PacketRecords := -1;
    cdsPesquisa.Open;

    lbNumRegs.Caption := '';
    ConfiguraColunasGrid;

    Result := cdsPesquisa.Fields[0].AsInteger;
  finally
    FreeAndNil(frmModeloConsulta);
  end;
end;

procedure TfrmModeloConsulta.FormShow(Sender: TObject);
begin
  cmbCampo.OnChange(Self);
end;

procedure TfrmModeloConsulta.ConfiguraColunasGrid;
var
  x: Integer;
begin
  try
    cdsPesquisa.DisableControls;
    Grade.Columns.Clear;
    for x := 0 to FDisplayLabels.Count - 1 do
    begin
      with Grade.Columns.Add do
      begin
        Title.Caption := FDisplayLabels[x];
        FieldName := FFieldNames[x];
      end;
    end;
  finally
    SetColumnsGrid;
    cdsPesquisa.EnableControls;
  end;
end;

procedure TfrmModeloConsulta.ExecPesquisa(Valor, Campo: String; Condicao: Integer);
var
  iPos: Integer;
  CampoDataHora, CampoNumerico: Boolean;
  SQL, OrderBy, GroupBy, Operador: String;
begin
  CampoDataHora := FieldIsDateTime(cdsPesquisa.FieldByName(Campo));
  CampoNumerico := FieldIsNumeric(cdsPesquisa.FieldByName(Campo));
  try
    Screen.Cursor:= crSQLWait;
    SQL := QuerySQL;

    cdsPesquisa.Close;

    if Pos('where', AnsiLowerCase(SQL)) > 0 then
      Operador := ' and '
    else
      Operador := ' where ';

    OrderBy := '';
    iPos := Pos('order by', AnsiLowerCase(SQL));
    if (iPos > 0) then
    begin
       OrderBy := Copy(SQL, iPos, Length(SQL));
       Delete(SQL, iPos, Length(SQL));
    end;

    GroupBy := '';
    iPos := Pos('group by', AnsiLowerCase(SQL));
    if (iPos > 0) then
    begin
      GroupBy := Copy(SQL, iPos, Length(SQL));
      Delete(SQL, iPos, Length(SQL));

      iPos := Pos('order by', AnsiLowerCase(SQL));
      if (iPos > 0) then
        Delete(GroupBy, iPos, Length(GroupBy));
    end;

    cdsPesquisa.CommandText := SQL;

    { configura o filtro }
    if CampoDataHora then
      cdsPesquisa.CommandText := cdsPesquisa.CommandText + Operador + Campo + ' = :PARAM '
    else
    begin
      if CampoNumerico then
      begin
        if ((Pos(',', Valor) > 0) or (Pos('.', Valor) > 0)) then
        begin
          Valor := StringReplace(Valor, ',', '.', [rfReplaceAll]);
          cdsPesquisa.CommandText := cdsPesquisa.CommandText + Operador +
            'cast(' + Campo + ' * 100.00 as INTEGER) = cast(%s * 100.00 as INTEGER) ';
        end
        else
          cdsPesquisa.CommandText := cdsPesquisa.CommandText + Operador + Campo + ' = %s '
      end
      else // presume que é string e utiliza uma UDF "udf_CollateBr"
        cdsPesquisa.CommandText := cdsPesquisa.CommandText + Operador +
          'upper(udf_CollateBr(' + Campo + ')) like upper(udf_CollateBr(%s)) ';
    end;

    { aqui adiciona a clausula order que foi retirada para adicionar as
      clausulas dos 'where' e 'and' }
    cdsPesquisa.CommandText := cdsPesquisa.CommandText + GroupBy + ' ' + OrderBy;


    if CampoDataHora then
    begin
      if ClearMask(Valor) <> '' then
        cdsPesquisa.Params.ParamByName('PARAM').AsDate := StrToDate(Valor)
      else
        cdsPesquisa.Params.ParamByName('PARAM').Clear;
    end
    else
      case Condicao of
        { igual a }
        0: cdsPesquisa.CommandText := Format(cdsPesquisa.CommandText, [QuotedStr(Valor)]);
        { contendo }
        1: cdsPesquisa.CommandText := Format(cdsPesquisa.CommandText, [QuotedStr('%' + Valor + '%')]);
        { início do campo }
        2: cdsPesquisa.CommandText := Format(cdsPesquisa.CommandText, [QuotedStr(Valor + '%')]);
        { fim do campo }
        3: cdsPesquisa.CommandText := Format(cdsPesquisa.CommandText, [QuotedStr('%' + Valor)]);
      end;

    { caso não tenha sido definido nenhum valor pelo usuário
      então passa a SQL padrão para buscar todos os registros }
    if ClearMask(Valor) = '' then
      cdsPesquisa.CommandText := SQL + GroupBy + ' ' + OrderBy;

    if ClearMask(Valor) <> '' then
    begin
      if CampoDataHora then
      begin
        if not IsDateTime(Valor) then
        begin
          MsgCuidado('','Valor de data inválido.');
          SetFocusIfCan(edtPesquisa);
          cdsPesquisa.CommandText := SQL + GroupBy + ' ' + OrderBy;
        end;
      end
      else if CampoNumerico then
      begin
        if not IsNumeric(Valor) then
        begin
          MsgCuidado('','Valor numérico inválido.');
          SetFocusIfCan(edtPesquisa);
          cdsPesquisa.CommandText := SQL + GroupBy + ' ' + OrderBy;
        end;
      end;
    end;

    ToClipBoard(cdsPesquisa.CommandText); // copia a SQL para a área de tranferencia

    cdsPesquisa.Open;
    NumeroResgistros;
    
    btnOk.Enabled := not cdsPesquisa.IsEmpty;

    if btnOK.Enabled then
      Grade.SetFocus
    else
      SetFocusIfCan(edtPesquisa);
    
  finally
    ConfiguraColunasGrid;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmModeloConsulta.FormCreate(Sender: TObject);
begin
  SetDialogForm(Self);
  CentralizaForm(Self);
  TWheelDBGrid(Grade).OnMouseWheel := DBGridMouseWheel;
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

procedure TfrmModeloConsulta.GradeTitleClick(Column: TColumn);
begin
  cdsPesquisa.IndexFieldNames := Column.FieldName;
end;

procedure TfrmModeloConsulta.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    btnCancelar.Click;

  if Key = VK_F1 then
    ChamaHelp(Self, 5,'');

  if Key = VK_RETURN then
    btnOk.Click;   
end;

function GetNumScrollLines: Integer;
begin
  SystemParametersInfo(SPI_GETWHEELSCROLLLINES, 0, @Result, 0);
end;

procedure TfrmModeloConsulta.DBGridMouseWheel(Sender: TObject;
  Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint;
  var Handled: Boolean);
var
  Direction: Shortint;
begin
  Direction := 1;
  if WheelDelta = 0 then
    Exit
  else if WheelDelta > 0 then
    Direction := -1;

  with TDBGrid(Sender) do
  begin
    if Assigned(DataSource) and Assigned(DataSource.DataSet) then
      DataSource.DataSet.MoveBy(Direction * GetNumScrollLines);
    Invalidate;
  end;
end;

end.
