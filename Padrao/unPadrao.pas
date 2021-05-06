unit unPadrao;

interface

uses
  Messages, ExtCtrls,  SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Menus, Buttons, ActnList,
  ComCtrls, Variants, DB, Funcoes, ConstPadrao, DBGrids,
  udmGeralBase, LCLType;

type

  { TfrmPadrao }

  TfrmPadrao = class(TForm)
    actlNavigateActions: TActionList;
    actInsert: TAction;
    actPrint: TAction;
    actEdit: TAction;
    actDelete: TAction;
    actSearch: TAction;
    actPost: TAction;
    dsPadrao: TDataSource;
    actCancelUpdates: TAction;
    actClose: TAction;
    sbStatus: TStatusBar;
    pnBotoesPadrao: TPanel;
    btnNovo: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnConsultar: TSpeedButton;
    btnSair: TSpeedButton;
    btnPrint: TSpeedButton;
    procedure actCloseExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NumericoKeyPress(Sender: TObject; var Key: Char);
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure dsPadraoStateChange(Sender: TObject);
    procedure actCancelUpdatesExecute(Sender: TObject);
    procedure actPostExecute(Sender: TObject);
    procedure actSearchExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    Closing: Boolean;
    ComponentFocusWhenPost: TWinControl;
  protected
    EditModes: Boolean;
    aCaption, TableName, FieldNames, DisplayLabels, IdField: string;

    function Pesquisa(pCaption: string;
      pFieldNames, pDisplayLabels, pTableName: string): Boolean;

    procedure AntesSalvar; virtual;
    procedure DepoisSalvar; virtual;

    function GetDm: TDmGeralBase; virtual;
  public  
  end;

var
  frmPadrao: TfrmPadrao;

implementation

uses unModeloConsulta, VarGlobal;

{$R *.dfm}

procedure TfrmPadrao.actCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmPadrao.FormCreate(Sender: TObject);
var
  x: Integer;
begin
  Closing := False;

  for x := 0 to ComponentCount - 1 do
  begin
    if Components[x] is TSQLQuery then
    begin
      if (not Assigned(TZQuery(Components[x]).Connection)) then
        TZQuery(Components[x]).Connection := GetZConnection;
    end;
  end;

  ReordenaBotoes([btnNovo, btnAlterar, btnExcluir, btnSalvar,
    btnCancelar, btnConsultar, btnPrint, btnSair]);

  dsPadrao.AutoEdit := False;
  dsPadrao.DataSet.Open;

  CentralizaForm(Self);
end;

procedure TfrmPadrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(dsPadrao.DataSet) then
    dsPadrao.DataSet.Close;
  Action := caFree;
end;

procedure TfrmPadrao.NumericoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in [#8, '0'..'9', DecimalSeparator]) then begin
    Key := #0;
  end;
end;

procedure TfrmPadrao.actInsertExecute(Sender: TObject);
begin
  dsPadrao.DataSet.Insert;
end;

procedure TfrmPadrao.actEditExecute(Sender: TObject);
begin
  dsPadrao.DataSet.Edit;
end;

procedure TfrmPadrao.actDeleteExecute(Sender: TObject);
begin
  if not dsPadrao.DataSet.IsEmpty then
  begin
    if MessageDlg('Tem certeza que deseja excluir este registro?',
      TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo],0) = ID_YES then
      begin
        TZQuery(dsPadrao.DataSet).Delete;
        TZQuery(dsPadrao.DataSet).ApplyUpdates;
      end;
  end;
end;

procedure TfrmPadrao.dsPadraoStateChange(Sender: TObject);
begin
  EditModes := dsPadrao.DataSet.State in dsEditModes;

  actInsert.Enabled := not EditModes;
  actEdit.Enabled := not EditModes;
  actDelete.Enabled := not EditModes;
  actPost.Enabled := EditModes;
  actCancelUpdates.Enabled := EditModes;
  actSearch.Enabled := not EditModes;
  actPrint.Enabled := not EditModes;
  actClose.Enabled := not EditModes;
end;

procedure TfrmPadrao.actCancelUpdatesExecute(Sender: TObject);
begin
  dsPadrao.DataSet.Cancel;
  if (dsPadrao.DataSet is TMemDataset) then
    TMemDataset(dsPadrao.DataSet).Cancel;
end;

procedure TfrmPadrao.actPostExecute(Sender: TObject);
begin
  AntesSalvar;

  try
    if dsPadrao.DataSet.State in [dsInsert, dsEdit] then
    begin
      dsPadrao.DataSet.Post;
      TZquery(dsPadrao.DataSet).ApplyUpdates;
    end;
  except
    on e: Exception do
    begin
      dsPadrao.DataSet.Cancel;
      raise Exception.create('');
    end;
  end;

  DepoisSalvar;
end;

procedure TfrmPadrao.actSearchExecute(Sender: TObject);
begin
  Pesquisa('Pesquisa ' + Caption, FieldNames, DisplayLabels, TableName);
end;

procedure TfrmPadrao.AntesSalvar;
var
  I: Integer;
begin
  ComponentFocusWhenPost := ActiveControl;

  for I := 0 to dsPadrao.DataSet.FieldCount-1 do
  begin
    if dsPadrao.DataSet.Fields[I].Required and dsPadrao.DataSet.Fields[I].IsNull then
    begin
      MsgErro('O campo '+dsPadrao.DataSet.Fields[I].DisplayLabel+' é obrigatório.');
      Abort;
    end;
  end;
end;

procedure TfrmPadrao.DepoisSalvar;
begin
  SetFocusIfCan(ComponentFocusWhenPost);
end;

function TfrmPadrao.GetDm: TDmGeralBase;
begin
 raise Exception.Create('not implemented');
end;

function TfrmPadrao.Pesquisa(pCaption: string;
  pFieldNames, pDisplayLabels, pTableName: string): Boolean;
begin
  if (pTableName = '') then
     pTableName := aCaption;

   Result := TfrmModeloConsulta.Execute(pCaption, pTableName, pFieldNames,
      pDisplayLabels, Application) > 0;
end;

procedure TfrmPadrao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
  if Key = VK_F1 then
    ChamaHelp(Self, 3,'');
end;

end.
