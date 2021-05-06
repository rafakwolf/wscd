unit unPerfilPermissao;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons,
  ComCtrls,   memds,  SqlDb,  DBCtrls,
   Grids, DBGrids, ImgList, unPrincipal, FMTBcd;

type
  TDatasetField = TDataset;
  TDBGridColumn = TGridColumn;
  TfrmPerfilPermissao = class(TfrmPadrao)
    sqldPadrao: TSQLQuery;
    dspPadrao: TTimer;
    cdsPadrao: TMemDataSet;
    sqldPadraoPERFIL: TStringField;
    cdsPadraoPERFIL: TStringField;
    sqldPerfisConf: TSQLQuery;
    cdsPerfisConf: TMemDataSet;
    dsLigaPerfis: TDataSource;
    cdsPadraosqldPerfisConf: TDataset;
    dsPerfisConf: TDataSource;
    Imagens: TImageList;
    sqldPadraoIDPERFIL: TIntegerField;
    sqldPerfisConfIDPERFIL: TIntegerField;
    sqldPerfisConfACAO_NOME: TStringField;
    sqldPerfisConfACAO_CAPTION: TStringField;
    sqldPerfisConfLIBERADO: TStringField;
    cdsPadraoIDPERFIL: TIntegerField;
    cdsPerfisConfIDPERFIL: TIntegerField;
    cdsPerfisConfACAO_NOME: TStringField;
    cdsPerfisConfACAO_CAPTION: TStringField;
    cdsPerfisConfLIBERADO: TStringField;
    sqldPerfisConfIDITEMPERFIL: TIntegerField;
    cdsPerfisConfIDITEMPERFIL: TIntegerField;
    dbePerfil: TDBEdit;
    grpItemMenu: TGroupBox;
    edtBuscaItemMenu: TEdit;
    dbgPerm: TDBGrid;
    pmLiberaBloqueia: TPopupMenu;
    miLiberar: TMenuItem;
    miBloquear: TMenuItem;
    N5: TMenuItem;
    miCarregarAcoes: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure miLiberarClick(Sender: TObject);
    procedure miBloquearClick(Sender: TObject);
    procedure miCarregarAcoesClick(Sender: TObject);
    procedure edtBuscaItemMenuExit(Sender: TObject);
    procedure edtBuscaItemMenuChange(Sender: TObject);
    procedure edtBuscaItemMenuEnter(Sender: TObject);
    procedure dsPadraoStateChange(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure dbgPermCellClick(Column: TDBGridColumn);
  private
    menu_item   : string;
    action_item : string;
    procedure InsertAction(IdPerfil: Integer; Nome, Caption, Permissao: string);
    procedure DropActions(IdPerfil: Integer);
  public
  end;

var
  frmPerfilPermissao: TfrmPerfilPermissao;

implementation

uses Funcoes, ConstPadrao;

{$R *.dfm}

procedure TfrmPerfilPermissao.FormCreate(Sender: TObject);
begin
  inherited;
  actPrint.Visible := False;

  FieldNames := FN_PERFIL;
  DisplayLabels := DL_PERFIL;
  aCaption := 'Perfis/Permiss�es';
end;

procedure TfrmPerfilPermissao.miLiberarClick(Sender: TObject);
begin
  inherited;
  cdsPadrao.Edit;
  try
    cdsPerfisConf.First;
    cdsPerfisConf.DisableControls;
    while not cdsPerfisConf.Eof do
    begin
      cdsPerfisConf.Edit;
      cdsPerfisConfLIBERADO.AsString := 'S';
      cdsPerfisConf.Post;
      cdsPerfisConf.Next;
    end;
    //cdsPadrao.ApplyUpdates(0);
  finally
    cdsPerfisConf.EnableControls;
  end;
end;

procedure TfrmPerfilPermissao.miBloquearClick(Sender: TObject);
begin
  inherited;
  cdsPadrao.Edit;
  try
    cdsPerfisConf.First;
    cdsPerfisConf.DisableControls;
    while not cdsPerfisConf.Eof do
    begin
      cdsPerfisConf.Edit;
      cdsPerfisConfLIBERADO.AsString := 'N';
      cdsPerfisConf.Post;
      cdsPerfisConf.Next;
    end;
    //cdsPadrao.ApplyUpdates(0);
  finally
    cdsPerfisConf.EnableControls;
  end;
end;

procedure TfrmPerfilPermissao.miCarregarAcoesClick(Sender: TObject);
var
  x: Integer;
begin
  inherited;
  if not MsgSN('Deseja recarregar as permiss�es deste perfil?' + #13#10 +
    'As permiss�es configuradas ser�o perdidas, continua?') then
    Exit;
  try
    try
      cdsPadrao.DisableControls;
      DropActions(cdsPadraoIDPERFIL.AsInteger);
      with Application.MainForm do
      begin
        for x := 0 to ComponentCount - 1 do
          if Components[x] is TAction then
            InsertAction(cdsPadraoIDPERFIL.AsInteger,
              TAction(Components[x]).Name,
              TAction(Components[x]).Caption, 'S');
      end;
    except
      raise Exception.Create('Erro recarregando permiss�es');
    end;
  finally
    cdsPadrao.Close;
    cdsPadrao.Open;
    cdsPadrao.EnableControls;
    MsgAviso('Permiss�es recarregadas!');
  end;
end;

procedure TfrmPerfilPermissao.edtBuscaItemMenuExit(Sender: TObject);
begin
  inherited;
  if Trim(edtBuscaItemMenu.Text) = '' then
    edtBuscaItemMenu.Text := 'Busca item do menu...';
end;

procedure TfrmPerfilPermissao.edtBuscaItemMenuChange(Sender: TObject);
begin
  inherited;
  cdsPerfisConf.Locate('ACAO_CAPTION', edtBuscaItemMenu.Text,
    [loCaseInsensitive, loPartialKey]);
end;

procedure TfrmPerfilPermissao.edtBuscaItemMenuEnter(Sender: TObject);
begin
  inherited;
  if Trim(edtBuscaItemMenu.Text) = 'Busca item do menu...' then
    edtBuscaItemMenu.Clear;
end;

procedure TfrmPerfilPermissao.InsertAction(IdPerfil: Integer; Nome, Caption,
  Permissao: string);
begin
  with TSQLQuery.Create(nil) do
  try
    SQLConnection := sqldPadrao.SQLConnection;
    sql.text :=
      'insert into ITEMPERFIL values (GEN_ID(GENIDITEMPERFIL, 1), :ID, :NOME, :CAPTION, :PERMISSAO)';
    Params.ParamByName('ID').AsInteger := IdPerfil;
    Params.ParamByName('NOME').AsString := Nome;
    Params.ParamByName('CAPTION').AsString := Caption;
    Params.ParamByName('PERMISSAO').AsString := Permissao;
    ExecSQL;
  finally
    Free;
  end;
end;

procedure TfrmPerfilPermissao.dbgPermCellClick(Column: TDBGridColumn);
begin
  inherited;
  if not (cdsPadrao.State in [dsEdit, dsInsert]) then
    Exit;

  //if (Column.Field.FieldName = 'LIBERADO') then
  //begin
  //  cdsPerfisConf.Edit;
  //  if (cdsPerfisConfLIBERADO.AsString = 'N') then
  //    cdsPerfisConfLIBERADO.AsString := 'S'
  //  else
  //    cdsPerfisConfLIBERADO.AsString := 'N';
  //  cdsPerfisConf.Post;
  //end;
end;

procedure TfrmPerfilPermissao.DropActions(IdPerfil: Integer);
begin
  with TSQLQuery.Create(nil) do
  try
    SQLConnection := sqldPadrao.SQLConnection;
    SQL.Clear; SQL.Text :='delete from ITEMPERFIL where IDPERFIL = ' +
      QuotedStr(IntToStr(IdPerfil));
    ExecSQL;
  finally
    Free;
  end;
end;

procedure TfrmPerfilPermissao.dsPadraoStateChange(Sender: TObject);
begin
  inherited;
  miCarregarAcoes.Enabled := not EditModes;
  miBloquear.Enabled := not EditModes;
  miLiberar.Enabled := not EditModes;
end;

procedure TfrmPerfilPermissao.actDeleteExecute(Sender: TObject);
begin
  try
    if MsgSN('Deseja realmente exluir este perfil?') then
    begin
      // deleta items
      with TSQLQuery.Create(nil) do
      try
        SQLConnection := sqldPadrao.SQLConnection;
        SQL.Clear; SQL.Text :='delete from ITEMPERFIL ip where ip.IDPERFIL = ' +
          QuotedStr(IntToStr(cdsPadraoIDPERFIL.AsInteger));
        ExecSQL;
      finally
        Free;
      end;

      // deleta perfil
      with TSQLQuery.Create(nil) do
      try
        SQLConnection := sqldPadrao.SQLConnection;
        SQL.Clear; SQL.Text :='delete from PERFIL p where p.IDPERFIL = ' +
          QuotedStr(IntToStr(cdsPadraoIDPERFIL.AsInteger));
        ExecSQL;
      finally
        Free;
      end;
    end;
  except
    on e: Exception do
    begin
      if Pos('exception 3', e.Message) > 0 then
      begin
        MsgErro('N�o � permitida exclus�o deste perfil.');
        Abort;
      end;
    end;
  end;
end;

initialization
  RegisterClass(TfrmPerfilPermissao);
finalization
  UnRegisterClass(TfrmPerfilPermissao);

end.

