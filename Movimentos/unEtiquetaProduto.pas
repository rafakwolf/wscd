unit unEtiquetaProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons,
  ExtCtrls, ComCtrls, Grids, DBGrids, DBClient, Provider, SqlExpr,
  Mask, DBCtrls,  FMTBcd, System.Actions, VarGlobal, uniGUIClasses, uniEdit,
  uniDBEdit, uniButton, uniBitBtn, uniSpeedButton, uniPanel, uniGUIBaseClasses,
  uniStatusBar, uniBasicGrid, uniDBGrid;

type
  TfrmEtiquetaProduto = class(TfrmPadrao)
    sqldPadrao: TSQLDataSet;
    dspPadrao: TDataSetProvider;
    cdsPadrao: TClientDataSet;
    sqldProduto: TSQLDataSet;
    dspProduto: TDataSetProvider;
    cdsProduto: TClientDataSet;
    sqldProdutoCODBARRA: TStringField;
    sqldProdutoABREVIACAO: TStringField;
    sqldProdutoVENDA: TFMTBCDField;
    cdsProdutoCODBARRA: TStringField;
    cdsProdutoABREVIACAO: TStringField;
    cdsProdutoVENDA: TFMTBCDField;
    sqldPadraoIDETIQUETAPROD: TIntegerField;
    sqldPadraoCODBARRA: TStringField;
    sqldPadraoDESCRICAO: TStringField;
    sqldPadraoPRECO: TFMTBCDField;
    cdsPadraoIDETIQUETAPROD: TIntegerField;
    cdsPadraoCODBARRA: TStringField;
    cdsPadraoDESCRICAO: TStringField;
    cdsPadraoPRECO: TFMTBCDField;
    dbeCodBarra: TUniDBEdit;
    dbeProduto: TUniDBEdit;
    dbePreco: TUniDBEdit;
    dbgrdEtq: TUniDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure miBuscaProdutoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure miInserirTodosProdutosClick(Sender: TObject);
    procedure cdsPadraoCODBARRASetText(Sender: TField; const Text: String);
    procedure miAjustaCodigoBarraClick(Sender: TObject);
    procedure miExcluirTudoClick(Sender: TObject);
    procedure miConfigurarClick(Sender: TObject);
  private
    Repetido: Boolean;
  public
    procedure AntesSalvar; override;
  end;

var
  frmEtiquetaProduto: TfrmEtiquetaProduto;

implementation

uses ConstPadrao, Funcoes, unModeloConsulta, ufmImprimeEtiq, 
  Extensos;

{$R *.dfm}

procedure TfrmEtiquetaProduto.FormCreate(Sender: TObject);
begin
  inherited;
  aCaption := 'EtiquetasProdutos';
  FieldNames := FN_ETQPROD;
  DisplayLabels := DL_ETQPROD;
end;

procedure TfrmEtiquetaProduto.actPrintExecute(Sender: TObject);
begin
  inherited;
  { a SQL do tela de impressão de etiquetas irá receber o mesmo SQL desta tela
    para que possa exibir só as etiquetas filtradas, caso o usuário use filtro }
  with TfrmImprimeEtiq.Create(Self) do
  try
    if cdsPadrao.CommandText = '' then
      SQL := sqldPadrao.CommandText
    else
      SQL := cdsPadrao.CommandText;
      
    TipoEtq := teProduto;
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmEtiquetaProduto.miBuscaProdutoClick(Sender: TObject);
begin
  inherited;
//  if TfrmModeloConsulta.Execute('Produto', cdsProduto, FN_PRODUTOS, DL_PRODUTOS) then
//  begin
//    cdsPadrao.Insert;
//    cdsPadraoCODBARRA.AsString  := cdsProdutoCODBARRA.AsString;
//    cdsPadraoDESCRICAO.AsString := cdsProdutoABREVIACAO.AsString;
//    cdsPadraoPRECO.AsFloat      := cdsProdutoVENDA.AsFloat;
//    cdsPadrao.ApplyUpdates(0);
//    MsgAviso('Produto inserido com sucesso!');
//  end;
//  cdsProduto.Close;
end;

procedure TfrmEtiquetaProduto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if cdsProduto.Active then
    cdsProduto.Close;
end;

procedure TfrmEtiquetaProduto.miInserirTodosProdutosClick(Sender: TObject);

  function Existe(codbarra: string): Boolean;
  begin
    with TSQLDataSet.Create(nil) do
    try
      SQLConnection := sqldPadrao.SQLConnection;
      CommandText := 'select count(1) from ETIQUETAPROD where CODBARRA = '+QuotedStr(codbarra);
      Open;
      Result := Fields[0].AsInteger > 0;
    finally
    end;
  end;

var
  Erro, OK: Boolean;
begin
  inherited;
  Erro := False;
  OK := False;
  
  MsgAviso('Atenção. Serão inseridos todos os produtos cadastrados utilizando está função, porém '+
    'os produtos que já existirem nas etiquetas seráo apenas atualizados, para evitar duplicações. '+
    'Caso o usuário queira imprimir mais de uma etiqueta de cada produto, terá que inserí-las manualmente.');

  try
    try
      if MsgSN('Deseja realmente inserir todos os produtos?') then
      begin
        OK := True;
        cdsProduto.Open;
        cdsProduto.First;
        cdsPadrao.DisableControls;

        while not cdsProduto.Eof do
        begin
          if not Existe(cdsProdutoCODBARRA.AsString) then
          begin
            cdsPadrao.Insert;
            cdsPadraoCODBARRA.AsString  := cdsProdutoCODBARRA.AsString;
            cdsPadraoDESCRICAO.AsString := cdsProdutoABREVIACAO.AsString;
            cdsPadraoPRECO.AsFloat      := cdsProdutoVENDA.AsFloat;
          end
          else
          begin
            cdsPadrao.Edit;
            cdsPadraoCODBARRA.AsString  := cdsProdutoCODBARRA.AsString;
            cdsPadraoDESCRICAO.AsString := cdsProdutoABREVIACAO.AsString;
            cdsPadraoPRECO.AsFloat      := cdsProdutoVENDA.AsFloat;
          end;
          cdsPadrao.ApplyUpdates(0);
          cdsProduto.Next;
        end;
      end;
    except
      Erro := True;
      raise Exception.Create('Erro inserindo produtos em etiquetas.');
    end;
  finally

    if (not Erro) and OK then
      MsgAviso('Produtos inseridos com sucesso!');
    cdsProduto.Close;
    cdsPadrao.EnableControls;
  end;
end;

procedure TfrmEtiquetaProduto.cdsPadraoCODBARRASetText(Sender: TField;
  const Text: String);
var
  codigo: string;
begin
  inherited;
  if Length(Text) <> 13 then
  begin
    if MsgSN('Deseja gerar cóigo de barras automáticamente?') then
      codigo := GeraCodigoEAN13(Text);
  end;

  if VerificaEAN13(codigo) then
    Sender.AsString := codigo
  else
    MsgCuidado('Este código de barras parece estar incorreto, verifique.');
  Sender.AsString := codigo;  
end;

procedure TfrmEtiquetaProduto.miAjustaCodigoBarraClick(Sender: TObject);

  procedure AjustaRequires(b: Boolean);
  begin
    cdsPadraoCODBARRA.Required  := b;
    cdsPadraoDESCRICAO.Required := b;
    cdsPadraoPRECO.Required     := b;
  end;

var
  Erro: Boolean;
begin
  inherited;
  Erro := False;
  try
    try

      AjustaRequires(False);
      cdsPadrao.First;
      cdsPadrao.DisableControls;
      while not cdsPadrao.Eof do
      begin
        if Length(Trim(cdsPadraoCODBARRA.AsString)) < 13 then
        begin
          cdsPadrao.Edit;
          cdsPadraoCODBARRA.AsString := GeraCodigoEAN13(Trim(cdsPadraoCODBARRA.AsString));
          cdsPadrao.Post;
        end;
        cdsPadrao.Next;
      end;
      cdsPadrao.ApplyUpdates(0);
    except
      Erro := True;
      raise Exception.Create('Erro ao ajustar códigos de barras.');
    end;
  finally
    BringWindowToTop(Handle);

    if not Erro then
      MsgAviso('Ajuste de códigos de barras concluído!');
    AjustaRequires(True);
    cdsPadrao.EnableControls;
  end;
end;

procedure TfrmEtiquetaProduto.AntesSalvar;
begin
  inherited;
  with TSQLDataSet.Create(nil) do
  try
    SQLConnection := sqldPadrao.SQLConnection;
    CommandText := 'select count(1) from ETIQUETAPROD where CODBARRA = '+QuotedStr(dbeCodBarra.Text);
    Open;
    Repetido := Fields[0].AsInteger > 0;
  finally
    Free;
  end;

  if (ModoInsert(cdsPadrao) and Repetido) then
  begin
    MsgAviso('Etiqueta com este código de barras já está cadastrada.');
    Abort;
  end;
end;

procedure TfrmEtiquetaProduto.miExcluirTudoClick(Sender: TObject);
begin
  inherited;
  if MsgSN('Deseja excluir todas as etiquetas?') then
  begin
    with TSQLDataSet.Create(nil) do
    try
      SQLConnection := sqldPadrao.SQLConnection;
      CommandText := 'delete from ETIQUETAPROD';
      ExecSQL;
      MsgAviso('Exclusão efetuada com sucesso!');
      cdsPadrao.Close;
      cdsPadrao.Open;
    finally
      Free;
    end;
  end;
end;

procedure TfrmEtiquetaProduto.miConfigurarClick(Sender: TObject);
begin
  inherited;
  ChamaForm('TfrmEtiqueta', 'Configuração de etiquetas', Self);
end;

initialization
  RegisterClass(TfrmEtiquetaProduto);
finalization
  UnRegisterClass(TfrmEtiquetaProduto);
end.
