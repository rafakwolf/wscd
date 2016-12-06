unit unGeraRelatorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ClassesGerador, Dialogs, DB, StdCtrls, SQLExpr, ExtCtrls, ComCtrls, XMLIntf,
  XMLDoc, CheckLst, Buttons, DBClient, Provider,
  FMTBcd, msxmldom, xmldom;

type
  TfrmGeraRelatorio = class(TForm)
    SaveDialog: TSaveDialog;
    XMLDoc: TXMLDocument;
    imgSalvar: TImage;
    lblTextoSalvar: TLabel;
    imgImpressora: TImage;
    lblTextoTop: TLabel;
    lbModelo: TLabel;
    ListColPrint: TCheckListBox;
    ListColGroup: TCheckListBox;
    btnSaveModelo: TBitBtn;
    comboLoadModelos: TComboBox;
    btnExcluirModelo: TBitBtn;
    btnImprimir: TBitBtn;
    sqldRelatorio: TSQLDataSet;
    dspRelatorio: TDataSetProvider;
    cdsRelatorio: TClientDataSet;
    dsRelatorio: TDataSource;
    edtNomeModelo: TLabeledEdit;
    btnClose: TBitBtn;
    edtTituloRelatorio: TLabeledEdit;
    bvlSeperador: TBevel;
    bvlSeparadorVert: TBevel;
    ListOrder: TCheckListBox;
    ckbImprimir: TCheckBox;
    ckbTotalizar: TCheckBox;
    ckbOrdenar: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnExcluirModeloClick(Sender: TObject);
    procedure OrdenaListaDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure OrdenaListaDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSaveModeloClick(Sender: TObject);
    procedure comboLoadModelosChange(Sender: TObject);
    procedure edtNomeModeloKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnImprimirClick(Sender: TObject);
    procedure ckbImprimirClick(Sender: TObject);
    procedure ckbTotalizarClick(Sender: TObject);
    procedure ckbOrdenarClick(Sender: TObject);
  private
     FOriginalTableName, FSQL: String;

     procedure InstanciaClasseModelo(Form: string);
     function GetFieldsFormat(pField: TField): string;
     procedure ConfigPageRelatorio;
     procedure SaveXML;
     procedure LoadXML;
     procedure ReadXML(arquivo: string);
     procedure CheckCol( Objeto: TCheckListBox; Value: string );
     procedure UnCheckList( Objeto: TCheckListBox );
     function GetTabela_View( TableName: string; Connection: TSQLConnection): string;
     function GetTituloRel( Titulo: string ): string;
     function GetArquivosDiretorio(FDiretorio, Filtro: TFileName; ExibePasta: Boolean): TStringList;
     function GetTableFromView(ViewName: string): String;
     function ExistsView(StrViewName: string; Connection: TSQLConnection): Boolean;
     function LengthField(Field: string; WidthMin: Integer): integer;
     function CapitalizeFirstWord(const S: String): String;
     procedure SetOrderBy(FieldName: String);
     procedure SetSQL(const Value: String);
     procedure CheckAllPrint(ChkList: TCheckListBox; Check: Boolean);
     procedure GeraRelatorioVDO;
     function Total(pFieldName: string; tipo_moeda: Boolean): string;
     function CamposMarcados(pCheLstBx: TCheckListBox): Boolean;
  public
     Modelo: TModelo;
     aConnection: TSQLConnection;
     property SQL: String read FSQL write SetSQL;
     class function Execute(aCaption, TableName: String;
       Connection: TSQLConnection): Boolean;
  end;   

var
  frmGeraRelatorio: TfrmGeraRelatorio;

implementation

uses Types, Funcoes, VarGlobal;

{$R *.dfm}

function TfrmGeraRelatorio.GetTableFromView(ViewName: string): String;
begin
  if FOriginalTableName <> '' then
    Result := FOriginalTableName
  else
  begin
    if AnsiUpperCase(copy(ViewName, 1, 4)) = 'VIEW' then
      Result := copy(ViewName, 5, Length(ViewName))
    else
      Result := ViewName;
  end;
end;

function TfrmGeraRelatorio.GetTabela_View(TableName: string; Connection: TSQLConnection): string;
begin
  if ExistsView( 'view' + TableName, Connection ) then
    Result := 'view' + TableName
  else
    Result := TableName;
end;

function TfrmGeraRelatorio.GetTituloRel(Titulo: string): string;
begin
  Result := Trim(Titulo);
end;

procedure TfrmGeraRelatorio.ConfigPageRelatorio;

  procedure ConfigListPrint;
  var
    i: Integer;
  begin
    ListColPrint.Clear;
    for i := 0 to cdsRelatorio.FieldCount - 1 do
      if (FieldIsNumeric(cdsRelatorio.Fields[i]) or
          FieldIsDateTime(cdsRelatorio.Fields[i]) or
          FieldIsString(cdsRelatorio.Fields[i])) and
         (cdsRelatorio.Fields[i].DisplayWidth <= 160) then
        ListColPrint.Items.AddObject(CapitalizeFirstWord(cdsRelatorio.Fields[i].DisplayLabel), cdsRelatorio.Fields[i]);
  end;

  procedure ConfigListGroup;
  var
    i: integer;
  begin
    ListColGroup.Clear;
    for i := 0 to cdsRelatorio.FieldCount - 1 do
      if FieldIsNumeric(cdsRelatorio.Fields[i]) then
        ListColGroup.Items.AddObject(CapitalizeFirstWord(cdsRelatorio.Fields[i].DisplayLabel), cdsRelatorio.Fields[i]);
  end;

  procedure ConfigListOrder;
  var
    i: integer;
  begin
    ListOrder.Clear;
    for i := 0 to cdsRelatorio.FieldCount - 1 do
      if not (cdsRelatorio.Fields[i].DataType in [ftBlob, ftMemo, ftFixedChar, ftBoolean]) then
        if cdsRelatorio.Fields[i].FieldKind = fkData then
          ListOrder.Items.AddObject(CapitalizeFirstWord(cdsRelatorio.Fields[i].DisplayLabel), cdsRelatorio.Fields[i]);
  end;

begin
  ConfigListPrint;
  ConfigListGroup;
  ConfigListOrder;
end;

procedure TfrmGeraRelatorio.InstanciaClasseModelo(Form: string);
begin
  Modelo := TModelo.create(ExtractFileDir(Application.ExeName) + '\', Form);
end;

procedure TfrmGeraRelatorio.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmGeraRelatorio.btnSaveModeloClick(Sender: TObject);
begin
  if pos(' ', edtNomeModelo.Text) > 0 then
  begin
    ShowMessage('O nome do modelo não pode ter espaços em sua descrição');
    SetFocusIfCan(edtNomeModelo);
    Exit;
  end;
  if Trim(edtNomeModelo.Text) = EmptyStr then
  begin
    ShowMessage('O Modelo a ser criado precisa ter um nome.');
    SetFocusIfCan(edtNomeModelo);
    Exit;
  end;
  try
    SaveXML();
    LoadXML();
    ShowMessage('Modelo "'+edtNomeModelo.Text+'" criado com sucesso.');
    edtNomeModelo.Clear;
  except
    on e: exception do
      ShowMessage('Falha ao criar arquivo de modelo. ' + e.Message);
  end;
end;

procedure TfrmGeraRelatorio.SaveXML;
var
  iNode, cabNode : IXMLNode;
  i: integer;

  procedure ProcessTreeItem( value: string );
  var cNode : IXMLNode;
  begin
    if (value = '') then Exit;

    cNode := cabNode.AddChild('coluna');
    cNode.Attributes['nome'] := value;
    cNode.Attributes['posicao'] := 0;
    cNode.Attributes['tamanho'] := 0;

  end;

begin

  if FileExists( Modelo.setNomeModelo( edtNomeModelo.text ) ) then
  begin
    if not MessageDlg('Já existe um modelo com esse nome. Deseja substituí-lo?', mtConfirmation , [mbYes, mbNo],0) = mrYes then
      exit
    else
      DeleteFile( Modelo.setNomeModelo( edtNomeModelo.text ) );
  end;

  XMLDoc.FileName := '';
  XMLDoc.Active := True;
  XMLDoc.ChildNodes.Clear;

  iNode := XMLDoc.AddChild( Self.Name);
  iNode.Attributes['Titulo'] := Trim(edtTituloRelatorio.Text);

  cabNode := iNode.AddChild('imprimir');
  for i:=0 to listColPrint.Count-1 do
    if listColPrint.Checked[i] then
      ProcessTreeItem( listColPrint.Items.Strings[i] );

  cabNode := iNode.AddChild('agrupar');
  for i:=0 to listColGroup.Count-1 do
    if listColGroup.Checked[i] then
      ProcessTreeItem( listColGroup.Items.Strings[i] );

  XMLDoc.SaveToFile( Modelo.setNomeModelo( edtNomeModelo.text ) );
  XMLDoc.Active := false;
end;


procedure TfrmGeraRelatorio.LoadXML;
var i: integer;
begin
  {carrega na classe modelos todos os arquivos que pertencam ao formulário em questão }
  Modelo.clear;

  comboLoadModelos.Items.Clear;
  GetArquivosDiretorio( Modelo.pasta, Modelo.setAllNomeModelo, false);
  for i:=0 to length( Modelo.arquivos ) -1 do
    comboLoadModelos.AddItem( Modelo.getNomeModeloAlias( Modelo.arquivos[i] ), nil );
end;

function TfrmGeraRelatorio.GetArquivosDiretorio(FDiretorio, Filtro: TFileName; ExibePasta:Boolean): TStringList;
var
  ARec: TSearchRec;
  Res: Integer;
begin
  if FDiretorio[Length(FDiretorio)] <> '\'  then
    FDiretorio := FDiretorio + '\';

  Result := TStringList.Create;
  try
    Res := FindFirst(FDiretorio + Filtro, faAnyFile or faArchive, ARec);
    while Res = 0 do
    begin
      if ((ARec.Attr and faArchive) = faAnyFile) or ((ARec.Attr and faArchive) = faArchive) then
      begin
        if ExibePasta then
          Modelo.addModelo( FDiretorio + ARec.Name )
        else
          Modelo.addModelo( ARec.Name );
        Res := FindNext(ARec);
      end;
    end;
    FindClose(ARec);
  except
    Result.Free;
  end;
end;

procedure TfrmGeraRelatorio.readXML( arquivo: string );
var
  jNode : IXMLNode;

  procedure ProcessNode(Node : IXMLNode; tn : TTreeNode);
  var cNode,xNode : IXMLNode;
      i, j: integer;
      objeto: TCheckListBox;
  begin

    for i:=0 to Node.ChildNodes.Count-1 do
    begin

      if node.NodeName = 'imprimir' then
        objeto := listColPrint
      else if node.NodeName = 'agrupar' then
        objeto := listColGroup;

      cNode := Node.ChildNodes.Get(i);
      for j:=0 to cNode.AttributeNodes.Count-1 do
      begin
        xNode := cNode.AttributeNodes.Get(j);
        if xNode.NodeName = 'nome' then
          CheckCol( objeto, xNode.NodeValue );
      end;

    end;

  end;

begin
  unCheckList( listColPrint );
  unCheckList( listColGroup );

  XMLDoc.FileName := arquivo;
  XMLDoc.Active := True;

  if XMLDoc.ChildNodes.First = nil then
  begin
    ShowMessage('Arquivo danificado. Por favor crie outro modelo com as configurações desejada. ');
    Exit;
  end;

  //recuperar o título do relatório (fixo no primeira tag)
  jNode := XMLDoc.ChildNodes.Get(0);
  jNode := jNode.AttributeNodes.Get(0);

  if jNode.NodeValue <> '' then
    edtTituloRelatorio.Text := GetTituloRel(jNode.Text); //nodevalue

  //leitura das demais tags que configuram as colunas de impressão
  jNode := XMLDoc.DocumentElement.ChildNodes.First;
  while jNode <> nil do
  begin
    ProcessNode(jNode,nil);
    jNode := jNode.NextSibling;
  end;

  XMLDoc.Active := False;
end;

procedure TfrmGeraRelatorio.comboLoadModelosChange(Sender: TObject);
begin
  if FileExists(Modelo.setNomeModelo( comboLoadModelos.Text ))then
  begin
    readXML( Modelo.setNomeModelo( comboLoadModelos.text ) );

    if Trim(comboLoadModelos.Text)<>EmptyStr then
      btnExcluirModelo.Enabled := True
    else
      btnExcluirModelo.Enabled := False;
  end;
end;

procedure TfrmGeraRelatorio.CheckCol(objeto: TCheckListBox; value: string);
var i: integer;
begin
  for i:=0 to objeto.Count-1 do
    if objeto.Items.Strings[i] = value then
    begin
      objeto.State[i] := cbChecked;
      break;
    end;  
end;

procedure TfrmGeraRelatorio.unCheckList(objeto: TCheckListBox);
var i: integer;
begin
  for i:=0 to objeto.Items.Count-1 do
    objeto.state[i] := cbUnchecked;
end;

function TfrmGeraRelatorio.GetFieldsFormat(pField: TField): string;
begin
  if FieldIsDateTime(pField) then
    Result := FormatDateTime('dd/mm/yyyy', pField.AsDateTime)
  else if pField.DataType in [ftFloat, ftBCD, ftCurrency, ftFMTBCD] then
    Result := FormatFloat('#,##0.00', pField.AsFloat)
  else
    Result := Copy(pField.AsString,1,LengthField(pField.FieldName,Length(pField.DisplayLabel)));
end;

procedure TfrmGeraRelatorio.edtNomeModeloKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = ' ' then
    Key := #0;
end;

procedure TfrmGeraRelatorio.OrdenaListaDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  i, orig, dest: Integer;
  ObjTemp: TObject;
  StrTemp: String;
  CheckTemp: Boolean;
  List: TCheckListBox;
begin
  List := TCheckListBox(Sender);
  orig := List.ItemIndex;
  dest := List.ItemAtPos(Point(x,y), False);
  if dest = List.Count then
    dest := List.Count - 1;
  ObjTemp := List.Items.Objects[orig];
  StrTemp := List.Items[orig];
  CheckTemp := List.Checked[orig];
  if orig < dest then
    for i := orig to dest - 1 do
    begin
      List.Items.Objects[i] := List.Items.Objects[i+1];
      List.Items[i] := List.Items[i+1];
      List.Checked[i] := List.Checked[i+1];
    end
  else
    for i := orig downto dest + 1 do
    begin
      List.Items.Objects[i] := List.Items.Objects[i-1];
      List.Items[i] := List.Items[i-1];
      List.Checked[i] := List.Checked[i-1];
    end;
  List.Items.Objects[dest] := ObjTemp;
  List.Items[dest] := StrTemp;
  List.Checked[dest] := CheckTemp;
end;

procedure TfrmGeraRelatorio.OrdenaListaDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := (Source = Sender);
end;

procedure TfrmGeraRelatorio.btnExcluirModeloClick(Sender: TObject);
begin
  if FileExists(Modelo.setNomeModelo(Trim(ComboLoadModelos.Text))) then
  begin
    if not Application.MessageBox('Deseja realmente excluir este modelo?', 'Confirmação',
    MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON2) = ID_YES then
      Exit
    else
    begin
      DeleteFile(Modelo.setNomeModelo(Trim(ComboLoadModelos.Text)));
      { Linpa todos os checks de fields e agrupamentos }
      unCheckList( listColPrint );
      unCheckList( listColGroup );
      { Limpa os itens do combo para carregar apenas os existentes }
      comboLoadModelos.Items.Clear;
      { Carrega todos os XMLS exixtentes }
      btnExcluirModelo.Enabled := False;
      loadXML;
    end;
  end;
end;

class function TfrmGeraRelatorio.Execute(aCaption, TableName: String;
  Connection: TSQLConnection): Boolean;
begin
  frmGeraRelatorio := TfrmGeraRelatorio.Create(Application);
  with frmGeraRelatorio do
  try
    Caption := 'Assistente de relatório - ' + aCaption; 
    aConnection := Connection;
    LoadXML;
    edtTituloRelatorio.Text := GetTituloRel(aCaption);
    FOriginalTableName := TableName;
    with sqldRelatorio do
    begin
      Close;
      SQLConnection := Connection;
      CommandText := 'SELECT * FROM ' + GetTabela_View(TableName, Connection);
      SQL := CommandText;
      Open;
    end;
    cdsRelatorio.Close;
    cdsRelatorio.Open;
    ConfigPageRelatorio;
    ShowModal;
  finally
    FreeAndNil(frmGeraRelatorio);
  end;
end;

function TfrmGeraRelatorio.ExistsView(StrViewName: string; Connection: TSQLConnection): Boolean;
begin
  with TSQLDataSet.Create(Application) do
  try
    SQLConnection := Connection;
    CommandText := 'select RDB$VIEW_NAME '+
      'from RDB$VIEW_RELATIONS '+
      'where RDB$VIEW_NAME = :ViewName';
    ParamByName('ViewName').AsString := AnsiUpperCase(StrViewName);
    open;
    Result := (not IsEmpty);
    Close;
  finally
    Free;
  end;
end;

procedure TfrmGeraRelatorio.btnCloseClick(Sender: TObject);
begin
  Close;
end;

function TfrmGeraRelatorio.LengthField(Field: string;
  WidthMin: Integer): Integer;
begin
  if FieldIsDateTime(cdsRelatorio.FieldByName(Field)) then
    Result := 12
  else if FieldIsNumeric(cdsRelatorio.FieldByName(Field)) then
    Result := 9
  else if FieldIsString(cdsRelatorio.FieldByName(Field)) then
  begin
    if cdsRelatorio.FieldByName(Field).DisplayWidth < 35 then
      Result := cdsRelatorio.FieldByName(Field).DisplayWidth
    else
      Result := 35;
  end;    

  if Result <= WidthMin then
    Result := (WidthMin + 2);
end;

function TfrmGeraRelatorio.CapitalizeFirstWord(const S: String): String;
begin
  Result := AnsiUpperCase(Copy(S, 1, 1)) + AnsiLowerCase(Copy(S, 2, Length(S)));
end;

procedure TfrmGeraRelatorio.FormCreate(Sender: TObject);
begin
  InstanciaClasseModelo('Modelo');
  CentralizaForm(Self);
  SetDialogForm(Self);
end;

procedure TfrmGeraRelatorio.SetOrderBy(FieldName: String);
begin
  if (Pos('ORDER BY', FSQL) = 0) then
    FSQL := FSQL + ' ORDER BY '
  else
    FSQL := FSQL + ',';
  FSQL := FSQL + ' ' + FieldName;
end;

procedure TfrmGeraRelatorio.SetSQL(const Value: String);
begin
  FSQL := Value;
end;

procedure TfrmGeraRelatorio.CheckAllPrint(ChkList: TCheckListBox; Check: Boolean);
var
  x: Integer;
begin
  for x := 0 to ChkList.Items.Count - 1 do
    ChkList.Checked[x] := Check;
end;

procedure TfrmGeraRelatorio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmGeraRelatorio.GeraRelatorioVDO;
var
  I: Byte;
  Col: Integer;
begin

  for I := 0 to ListColPrint.Count-1 do
  begin
    if ListColPrint.Checked[I] then
      Col :=
        Col +
          LengthField(ListColPrint.Items[I],Length(cdsRelatorio.FieldByName(ListColPrint.Items[I]).DisplayLabel));
  end;

  if Col > 160 then
  begin
    MsgAviso('Os campos marcados precisam de '+IntToStr(Col)+' por linha para serem exibidos, '+
      'e são permitidos apenas 160 caracteres em cada linha.'+#13#10+
      'Será necessário desmarcar alguns campos para que possa ser gerado o relatório.');
    Exit;
  end;

  if not CamposMarcados(ListColPrint) then
  begin
    MsgCuidado('Não existem campos marcados para impressão.');
    Exit;
  end;
  {
  with VDOCaPrinter do
  begin
    BeginDoc;
    Title := edtTituloRelatorio.Text;

    Font.Size := 12;
    Font.Style := [fsBold, fsUnderline];


    Print(00, Empresa.Nome, True);
    Font.Style := [];
    Print(00, Empresa.Cnpj+' - '+Empresa.InscEstadual, True);
    Print(00, Empresa.Endereco+' - '+Empresa.Cidade+' - '+Empresa.Estado, True);
    Print(00, Empresa.Bairro+' - '+Empresa.Cep+' - '+Empresa.Email, True);

    Font.Size := 8;
    Font.Style := [];

    Replicate(00, 160);

    Font.Size := 12;
    Font.Style := [fsBold];


    Print(50, edtTituloRelatorio.Text, True);

    Font.Style := [];
    Font.Size := 8;
    Font.Align := taLeftJustify;

    Replicate(00, 160);
    Font.Style := [fsBold];


    Col := 0;
    for I := 0 to ListColPrint.Count - 1 do
    begin
      if ListColPrint.Checked[I] then
      begin
        Print(Col,
          StringReplace(CapitalizeFirstWord(cdsRelatorio.FieldByName(ListColPrint.Items[I]).DisplayLabel), '_', ' ', [rfReplaceAll]));
        Col := Col + LengthField(ListColPrint.Items[I], Length(cdsRelatorio.FieldByName(ListColPrint.Items[I]).DisplayLabel));
      end;
    end;

    Font.Style := [];
    Print(00, '', True);
    Replicate(00, 160);


    if CamposMarcados(ListOrder) then
    begin
      FSQL :=
        'SELECT * FROM ' + GetTabela_View(FOriginalTableName, sqldRelatorio.SQLConnection);

      for I := 0 to ListOrder.Count-1 do
        if ListOrder.Checked[I] then
          SetOrderBy(ListOrder.Items[I]);

      cdsRelatorio.Close;
      cdsRelatorio.CommandText := FSQL;
      cdsRelatorio.Open;
    end;


    cdsRelatorio.First;
    while not cdsRelatorio.Eof do
    begin

      Col := 0;
      for I := 0 to ListColPrint.Count - 1 do
      begin
        if ListColPrint.Checked[I] then
        begin
          if not cdsRelatorio.FieldByName(ListColPrint.Items[I]).IsNull then
            Print(Col, GetFieldsFormat(cdsRelatorio.FieldByName(ListColPrint.Items[I])))
          else
            Print(Col, ' ');
              
          Col := Col + LengthField(ListColPrint.Items[I], Length(cdsRelatorio.FieldByName(ListColPrint.Items[I]).DisplayLabel));
        end;
      end;
      Print(00, '', True);
      cdsRelatorio.Next;
    end;

    Replicate(00, 160);

    if CamposMarcados(ListColGroup) then
    begin
      Print(00, 'TOTAIS:', True);
      for I := 0 to ListColGroup.Count - 1 do
      begin
        if ListColGroup.Checked[I] then
        begin
          if cdsRelatorio.FieldByName(ListColGroup.Items[I]).DataType in [ftFloat, ftCurrency, ftBCD, ftFMTBCD] then
            Print(05, ListColGroup.Items[I]+': '+Total(ListColGroup.Items[I], True), True)
          else
            Print(05, ListColGroup.Items[I]+': '+Total(ListColGroup.Items[I], False), True);  
        end;
      end;
      Replicate(00, 160);
    end;


    Font.Style := [fsBold];
    Print(00, IntToStr(cdsRelatorio.RecordCount)+' Registro(s)');
    Font.Style := [];
    
    EndDoc;
  end;   }
end;

procedure TfrmGeraRelatorio.btnImprimirClick(Sender: TObject);
begin
  GeraRelatorioVDO;
end;

procedure TfrmGeraRelatorio.ckbImprimirClick(Sender: TObject);
begin
  CheckAllPrint(ListColPrint, ckbImprimir.Checked);
end;

procedure TfrmGeraRelatorio.ckbTotalizarClick(Sender: TObject);
begin
  CheckAllPrint(ListColGroup, ckbTotalizar.Checked);
end;

procedure TfrmGeraRelatorio.ckbOrdenarClick(Sender: TObject);
begin
  CheckAllPrint(ListOrder, ckbOrdenar.Checked);
end;

function TfrmGeraRelatorio.Total(pFieldName: string; tipo_moeda: Boolean): string;
begin
  with TSQLDataSet.Create(nil) do
  try
    SQLConnection := sqldRelatorio.SQLConnection;
    CommandText := 'select sum('+pFieldName+') as SOMA from '+FOriginalTableName;
    Open;
    if not tipo_moeda then
      Result := FloatToStr(RoundFloat(FieldByName('SOMA').AsFloat, 2))
    else
      Result := FormatFloat('#,##0.00', FieldByName('SOMA').AsFloat);
  finally
    Free;
  end;
end;

function TfrmGeraRelatorio.CamposMarcados(
  pCheLstBx: TCheckListBox): Boolean;
var
  i, Count: Integer;
begin
  Count := 0;
  for i := 0 to pCheLstBx.Count-1 do
    if pCheLstBx.Checked[i] then
      Count := Count + 1;
  Result := (Count > 0);    
end;

end.
